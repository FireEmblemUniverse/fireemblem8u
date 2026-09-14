// SPDX-License-Identifier: GPL-3.0-or-later
// Combine x-1 and unsigned x<=1 when only an exact empty self-tie separates them.
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
#include "insn-attr.h"
#include "options.h"
#include "regs.h"
int plugin_is_GPL_compatible;
namespace {
tree validate(tree *node,tree,tree,int,bool *no_add) {
 if(TREE_CODE(*node)!=FUNCTION_DECL) { error("matching_thumb_countdown requires a function");*no_add=true; }
 return NULL_TREE;
}
const attribute_spec contract={"matching_thumb_countdown",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) { register_attribute(&contract); }
bool low(rtx x) { return REG_P(x)&&GET_MODE(x)==SImode&&REGNO(x)<8; }
rtx_insn *next_op(rtx_insn *i) { do { i=NEXT_INSN(i); } while(i&&NOTE_P(i));return i; }
const pass_data data={RTL_PASS,"thumb_countdown",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
 pass(gcc::context *c):rtl_opt_pass(data,c) {}
 unsigned int execute(function *fn) override {
  if(!lookup_attribute("matching_thumb_countdown",DECL_ATTRIBUTES(fn->decl))) return 0;
  if(!TARGET_THUMB1||flag_unwind_tables||flag_asynchronous_unwind_tables||flag_exceptions||debug_info_level!=DINFO_LEVEL_NONE)
   fatal_error(UNKNOWN_LOCATION,"Thumb countdown requires plain Thumb1 code");
  unsigned folded=0;
  for(rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
   if(!NONJUMP_INSN_P(i)||GET_CODE(PATTERN(i))!=SET) continue;
   rtx copy=PATTERN(i),tmp=SET_DEST(copy),base=SET_SRC(copy);
   if(!low(tmp)||!low(base)||global_regs[REGNO(tmp)]||rtx_equal_p(tmp,base)) continue;
   rtx_insn *sub=next_op(i);if(!sub||!NONJUMP_INSN_P(sub)||GET_CODE(PATTERN(sub))!=SET) continue;
   rtx update=PATTERN(sub),value=SET_SRC(update);
   if(!rtx_equal_p(SET_DEST(update),base)||GET_CODE(value)!=MINUS||!rtx_equal_p(XEXP(value,0),base)) continue;
   rtx step=XEXP(value,1);
   if(!low(step)||rtx_equal_p(step,base)||rtx_equal_p(step,tmp)) continue;
   rtx_insn *jump=next_op(sub);if(!jump||!JUMP_P(jump)||GET_CODE(PATTERN(jump))!=SET||SET_DEST(PATTERN(jump))!=pc_rtx) continue;
   rtx choice=SET_SRC(PATTERN(jump));if(GET_CODE(choice)!=IF_THEN_ELSE) continue;
   rtx test=XEXP(choice,0);
   if(GET_CODE(test)!=LT||!rtx_equal_p(XEXP(test,0),step)||!rtx_equal_p(XEXP(test,1),tmp)
      ||GET_CODE(XEXP(choice,1))!=LABEL_REF||XEXP(choice,2)!=pc_rtx||!find_reg_note(jump,REG_DEAD,tmp)) continue;
   rtx_insn *label=as_a<rtx_insn *>(XEXP(XEXP(choice,1),0));
   if(LABEL_NUSES(label)!=1||next_op(label)!=i) continue;
   // Whole-function proof: temporary is used only by the copy and comparison.
   bool private_tmp=true;
   for(rtx_insn *j=get_insns();j;j=NEXT_INSN(j))
    if(NONDEBUG_INSN_P(j)&&j!=i&&j!=jump&&reg_mentioned_p(tmp,PATTERN(j))) private_tmp=false;
   if(!private_tmp) continue;
   rtx replacement=gen_match_thumb_register_countdown(copy_rtx(base),copy_rtx(step),label);
   if(!validate_change(jump,&PATTERN(jump),replacement,false)) fatal_error(UNKNOWN_LOCATION,"Thumb countdown pattern rejected");
   REG_NOTES(jump)=nullptr;delete_insn(i);delete_insn(sub);folded++;
  }
  if(folded!=1) fatal_error(UNKNOWN_LOCATION,"Thumb countdown requires one exact loop");
  return 0;
 }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
 if(!plugin_default_version_check(version,&gcc_version)||info->argc) return 1;
 register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);
 register_pass_info p={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};
 register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);return 0;
}
