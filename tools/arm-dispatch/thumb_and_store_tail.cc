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
std::string destination;
tree validate(tree *node,tree,tree,int,bool *no_add) {
 if (TREE_CODE(*node)!=FUNCTION_DECL) {error("AND/store tail requires a function");*no_add=true;}
 return NULL_TREE;
}
const attribute_spec contract={"matching_thumb_and_store_tail",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) {register_attribute(&contract);}
bool low(rtx x) {return REG_P(x)&&GET_MODE(x)==SImode&&REGNO(x)<8;}
rtx_insn *previous(rtx_insn *i) {
 for(i=PREV_INSN(i);i;i=PREV_INSN(i)) {if(LABEL_P(i)||BARRIER_P(i))return nullptr;if(NONDEBUG_INSN_P(i))return i;}return nullptr;
}
rtx_insn *next_op(rtx_insn *i) {
 for(i=NEXT_INSN(i);i;i=NEXT_INSN(i)) {if(LABEL_P(i)||BARRIER_P(i))return nullptr;if(NONDEBUG_INSN_P(i))return i;}return nullptr;
}
bool frame(rtx m) {
 if(!MEM_P(m)||GET_MODE(m)!=SImode||!MEM_VOLATILE_P(m))return false;
 rtx a=XEXP(m,0);HOST_WIDE_INT offset=0;
 if(GET_CODE(a)==PLUS&&CONST_INT_P(XEXP(a,1))) {offset=INTVAL(XEXP(a,1));a=XEXP(a,0);}
 return REG_P(a)&&GET_MODE(a)==SImode&&REGNO(a)==SP_REGNUM&&offset>=0&&offset<=60&&!(offset&3);
}
const pass_data data={RTL_PASS,"thumb_and_store_tail",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
 pass(gcc::context *c):rtl_opt_pass(data,c) {}
 unsigned int execute(function *fn) override {
  if(!lookup_attribute("matching_thumb_and_store_tail",DECL_ATTRIBUTES(fn->decl)))return 0;
  if(!TARGET_THUMB1||!lookup_attribute("matching_tail_transfer",DECL_ATTRIBUTES(fn->decl)))fatal_error(UNKNOWN_LOCATION,"AND/store requires private Thumb tails");
  unsigned folded=0;
  for(rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
   if(!JUMP_P(i)||GET_CODE(PATTERN(i))!=SET||SET_DEST(PATTERN(i))!=pc_rtx)continue;
   rtx choice=SET_SRC(PATTERN(i));if(GET_CODE(choice)!=IF_THEN_ELSE)continue;
   rtx test=XEXP(choice,0);
   if(GET_CODE(test)!=NE||!low(XEXP(test,0))||XEXP(test,1)!=const0_rtx||GET_CODE(XEXP(choice,1))!=LABEL_REF||XEXP(choice,2)!=pc_rtx)continue;
   rtx reg=XEXP(test,0);auto *store=previous(i);auto *op=store?previous(store):nullptr;auto *stub=next_op(i);
   if(!store||!op||!stub||!NONJUMP_INSN_P(store)||!NONJUMP_INSN_P(op)||!JUMP_P(stub))continue;
   rtx s=PATTERN(store),p=PATTERN(op),tail=PATTERN(stub);
   if(GET_CODE(s)!=SET||!frame(SET_DEST(s))||!rtx_equal_p(SET_SRC(s),reg)
    ||GET_CODE(p)!=SET||!rtx_equal_p(SET_DEST(p),reg)||GET_CODE(SET_SRC(p))!=AND
    ||!rtx_equal_p(XEXP(SET_SRC(p),0),reg)||!low(XEXP(SET_SRC(p),1))
    ||GET_CODE(tail)!=SET||SET_DEST(tail)!=pc_rtx||GET_CODE(SET_SRC(tail))!=SYMBOL_REF||destination!=XSTR(SET_SRC(tail),0))continue;
   auto *label=as_a<rtx_insn *>(XEXP(XEXP(choice,1),0));bool adjacent=false;
   for(auto *j=NEXT_INSN(stub);j;j=NEXT_INSN(j)) {if(j==label){adjacent=true;break;}if(!NOTE_P(j)&&!BARRIER_P(j)&&!DEBUG_INSN_P(j))break;}
   if(!adjacent||LABEL_NUSES(label)!=1||LABEL_PRESERVE_P(label))continue;
   rtx replacement=gen_match_thumb_and_store_zero_tail(copy_rtx(reg),copy_rtx(XEXP(SET_SRC(p),1)),copy_rtx(SET_DEST(s)),copy_rtx(SET_SRC(tail)));
   if(!validate_change(i,&PATTERN(i),replacement,false))fatal_error(UNKNOWN_LOCATION,"AND/store zero transfer rejected");
   REG_NOTES(i)=nullptr;JUMP_LABEL(i)=nullptr;LABEL_NUSES(label)--;
   delete_insn(op);delete_insn(store);delete_insn(stub);folded++;
  }
  if(folded!=1)fatal_error(UNKNOWN_LOCATION,"AND/store tail requires exactly one safe sequence");return 0;
 }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
 if(!plugin_default_version_check(version,&gcc_version))return 1;
 for(int n=0;n<info->argc;n++) {
  if(strcmp(info->argv[n].key,"destination")||!info->argv[n].value||!*info->argv[n].value||!destination.empty())return 1;
  destination=info->argv[n].value;
 }
 if(destination.empty())return 1;
 register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);
 register_pass_info p={new pass(g),"shorten",1,PASS_POS_INSERT_AFTER};register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);return 0;
}
