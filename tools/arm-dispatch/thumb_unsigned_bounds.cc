// SPDX-License-Identifier: GPL-3.0-or-later
// Retarget local private branch stubs to explicitly declared continuation symbols.
#include <set>
#include <string>
#include <cstdlib>
#include "gcc-plugin.h"
#include "plugin-version.h"
#include "context.h"
#include "backend.h"
#include "insn-config.h"
#include "memmodel.h"
#include "tree-pass.h"
#include "tree.h"
#include "function.h"
#include "rtl.h"
#include "emit-rtl.h"
#include "recog.h"
#include "tm.h"
#include "stringpool.h"
#include "attribs.h"
#include "diagnostic-core.h"
#include "insn-flags.h"
#include "insn-constants.h"
int plugin_is_GPL_compatible;
namespace {
unsigned bound=0,expected=0;
tree validate(tree *node,tree,tree,int,bool *no_add) {
 if (TREE_CODE(*node)!=FUNCTION_DECL) {error("unsigned bound contract requires a function");*no_add=true;}
 return NULL_TREE;
}
const attribute_spec contract={"matching_thumb_unsigned_bounds",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) {register_attribute(&contract);}
const pass_data data={RTL_PASS,"thumb_unsigned_bounds",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
 pass(gcc::context *c):rtl_opt_pass(data,c) {}
 unsigned int execute(function *fn) override {
  if (!lookup_attribute("matching_thumb_unsigned_bounds",DECL_ATTRIBUTES(fn->decl))) return 0;
  if (!TARGET_THUMB1||!lookup_attribute("matching_tail_transfer",DECL_ATTRIBUTES(fn->decl)))
   fatal_error(UNKNOWN_LOCATION,"unsigned bounds require a private Thumb tail-transfer function");
  unsigned count=0;
  for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
   if (!JUMP_P(i)) continue;
   rtx p=PATTERN(i);
   if (GET_CODE(p)!=SET||SET_DEST(p)!=pc_rtx||GET_CODE(SET_SRC(p))!=IF_THEN_ELSE) continue;
   rtx choice=SET_SRC(p),test=XEXP(choice,0);
   if (GET_CODE(test)!=GTU||!REG_P(XEXP(test,0))||GET_MODE(XEXP(test,0))!=SImode
    ||REGNO(XEXP(test,0))>=8||!CONST_INT_P(XEXP(test,1))||INTVAL(XEXP(test,1))!=bound-1
    ||GET_CODE(XEXP(choice,1))!=LABEL_REF||XEXP(choice,2)!=pc_rtx)
    fatal_error(UNKNOWN_LOCATION,"unsigned bound branch shape or threshold changed");
   rtx replacement=copy_rtx(p),condition=XEXP(SET_SRC(replacement),0);
   // x > bound-1 and x >= bound choose the same edge for every unsigned word.
   // The private contract selects CMP bound flags, including equality at bound.
   PUT_CODE(condition,GEU);XEXP(condition,1)=GEN_INT(bound);
   if (!validate_change(i,&PATTERN(i),replacement,false))
    fatal_error(UNKNOWN_LOCATION,"unsigned bound encoding rejected");
   REG_NOTES(i)=nullptr;count++;
  }
  if (count!=expected) fatal_error(UNKNOWN_LOCATION,"unsigned bound branch count changed");
  return 0;
 }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
 if (!plugin_default_version_check(version,&gcc_version)) return 1;
 for (int n=0;n<info->argc;n++) {
  unsigned *out=!strcmp(info->argv[n].key,"bound")?&bound:!strcmp(info->argv[n].key,"expected")?&expected:nullptr;
  const char *v=info->argv[n].value;if (!out||*out||!v||!*v) return 1;
  char *end=nullptr;unsigned long value=strtoul(v,&end,0);
  if (*end||!value||value>255) return 1;*out=value;
 }
 if (!bound||!expected) return 1;
 register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);
 register_pass_info p={new pass(g),"shorten",1,PASS_POS_INSERT_AFTER};
 register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);return 0;
}
