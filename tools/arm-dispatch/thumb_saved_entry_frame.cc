// SPDX-License-Identifier: GPL-3.0-or-later
// Validate explicit stack operations before selecting POP/PUSH banks and fallthrough.
#include <string>
#include <vector>
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
#include "insn-constants.h"
#include "insn-flags.h"
#include "options.h"
#include "hard-reg-set.h"
#include "regs.h"
int plugin_is_GPL_compatible;
namespace {
std::string continuation;
tree validate(tree *node,tree,tree,int,bool *no_add) {
 if (TREE_CODE(*node)!=FUNCTION_DECL) {error("saved entry frame requires a function");*no_add=true;}
 return NULL_TREE;
}
const attribute_spec contract={"matching_thumb_saved_entry_frame",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) {register_attribute(&contract);}
bool reg(rtx x,unsigned n) {return REG_P(x)&&GET_MODE(x)==SImode&&REGNO(x)==n;}
bool add(rtx p,unsigned n,long amount) {
 return GET_CODE(p)==SET&&reg(SET_DEST(p),n)&&GET_CODE(SET_SRC(p))==PLUS
  &&reg(XEXP(SET_SRC(p),0),n)&&CONST_INT_P(XEXP(SET_SRC(p),1))&&INTVAL(XEXP(SET_SRC(p),1))==amount;
}
bool memory(rtx m,long offset) {
 if (!MEM_P(m)||GET_MODE(m)!=SImode||!MEM_VOLATILE_P(m)) return false;
 rtx a=XEXP(m,0);
 return offset ? GET_CODE(a)==PLUS&&reg(XEXP(a,0),SP_REGNUM)&&CONST_INT_P(XEXP(a,1))&&INTVAL(XEXP(a,1))==offset : reg(a,SP_REGNUM);
}
bool store(rtx p,long offset,unsigned n) {return GET_CODE(p)==SET&&memory(SET_DEST(p),offset)&&reg(SET_SRC(p),n);}
bool move(rtx p,unsigned to,unsigned from) {return GET_CODE(p)==SET&&reg(SET_DEST(p),to)&&reg(SET_SRC(p),from);}
bool lr_push(rtx p) {
 if (GET_CODE(p)!=PARALLEL||XVECLEN(p,0)!=1) return false;
 rtx s=XVECEXP(p,0,0);if (GET_CODE(s)!=SET||!MEM_P(SET_DEST(s))) return false;
 rtx a=XEXP(SET_DEST(s),0),v=SET_SRC(s);
 return GET_CODE(a)==PRE_MODIFY&&reg(XEXP(a,0),SP_REGNUM)&&GET_CODE(XEXP(a,1))==PLUS
  &&reg(XEXP(XEXP(a,1),0),SP_REGNUM)&&CONST_INT_P(XEXP(XEXP(a,1),1))&&INTVAL(XEXP(XEXP(a,1),1))==-4
  &&GET_CODE(v)==UNSPEC&&XINT(v,1)==UNSPEC_PUSH_MULT&&XVECLEN(v,0)==1&&reg(XVECEXP(v,0,0),LR_REGNUM);
}
const pass_data data={RTL_PASS,"thumb_saved_entry_frame",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
 pass(gcc::context *c):rtl_opt_pass(data,c) {}
 unsigned int execute(function *fn) override {
  if (!lookup_attribute("matching_thumb_saved_entry_frame",DECL_ATTRIBUTES(fn->decl))) return 0;
  if (!TARGET_THUMB1||frame_pointer_needed||!known_eq(get_frame_size(),0)||crtl->profile
   ||flag_unwind_tables||flag_asynchronous_unwind_tables||flag_exceptions||debug_info_level!=DINFO_LEVEL_NONE
   ||DECL_ARGUMENTS(fn->decl)||TREE_CODE(TREE_TYPE(TREE_TYPE(fn->decl)))!=VOID_TYPE
   ||!global_regs[0]||!global_regs[SP_REGNUM])
   fatal_error(UNKNOWN_LOCATION,"saved entry frame requires private zero-local-frame void Thumb code without arguments/debug/unwind");
  for (unsigned n=4;n<12;n++) if (!global_regs[n]) fatal_error(UNKNOWN_LOCATION,"saved entry frame requires bound r4-r11");
  std::vector<rtx_insn *> ops;
  for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
   if (LABEL_P(i)) fatal_error(UNKNOWN_LOCATION,"saved entry frame cannot contain control-flow labels");
   if (NONDEBUG_INSN_P(i)) ops.push_back(i);
  }
  if (ops.size()!=19) fatal_error(UNKNOWN_LOCATION,"saved entry frame operation count changed");
  auto p=[&](unsigned n){return PATTERN(ops[n]);};
  if (!lr_push(p(0))||GET_CODE(p(1))!=SET||!reg(SET_DEST(p(1)),0)||!memory(SET_SRC(p(1)),0)
   ||!add(p(2),SP_REGNUM,-12)||!add(p(11),SP_REGNUM,-16))
   fatal_error(UNKNOWN_LOCATION,"saved entry frame load/stack order changed");
  for (unsigned n=0;n<4;n++) if (!store(p(3+n),4*n,4+n)||!move(p(7+n),4+n,8+n)||!store(p(12+n),4*n,4+n))
   fatal_error(UNKNOWN_LOCATION,"saved entry frame register bank order changed");
  rtx c=p(16);
  if (!CALL_P(ops[16])||SIBLING_CALL_P(ops[16])||CALL_INSN_FUNCTION_USAGE(ops[16])
   ||GET_CODE(c)!=PARALLEL||XVECLEN(c,0)!=3)
   fatal_error(UNKNOWN_LOCATION,"saved entry frame continuation shape changed");
  rtx call=XVECEXP(c,0,0),use=XVECEXP(c,0,1),clobber=XVECEXP(c,0,2);
  if (GET_CODE(call)!=CALL||!MEM_P(XEXP(call,0))||GET_CODE(XEXP(XEXP(call,0),0))!=SYMBOL_REF
   ||continuation!=XSTR(XEXP(XEXP(call,0),0),0)||XEXP(call,1)!=const0_rtx
   ||GET_CODE(use)!=USE||XEXP(use,0)!=const0_rtx||GET_CODE(clobber)!=CLOBBER||!reg(XEXP(clobber,0),LR_REGNUM))
   fatal_error(UNKNOWN_LOCATION,"saved entry frame requires its declared no-argument continuation");
  if (GET_CODE(p(17))!=UNSPEC||XINT(p(17),1)!=UNSPEC_REGISTER_USE||XVECLEN(p(17),0)!=1||!reg(XVECEXP(p(17),0,0),SP_REGNUM)
   ||!JUMP_P(ops[18])||GET_CODE(p(18))!=UNSPEC_VOLATILE||XINT(p(18),1)!=VUNSPEC_EPILOGUE)
   fatal_error(UNKNOWN_LOCATION,"saved entry frame return shape changed");
  if (!validate_change(ops[1],&PATTERN(ops[1]),gen_match_thumb_pop_word(gen_rtx_REG(SImode,0)),false)
   ||!validate_change(ops[2],&PATTERN(ops[2]),gen_match_thumb_push_saved4(),false)
   ||!validate_change(ops[11],&PATTERN(ops[11]),gen_match_thumb_push_saved4(),false))
   fatal_error(UNKNOWN_LOCATION,"saved entry frame grouped operations rejected");
  REG_NOTES(ops[1])=REG_NOTES(ops[2])=REG_NOTES(ops[11])=nullptr;
  for (unsigned n=0;n<19;n++) if (n==0||(n>=3&&n<=6)||(n>=12)) delete_insn(ops[n]);
  return 0;
 }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
 if (!plugin_default_version_check(version,&gcc_version)) return 1;
 for (int n=0;n<info->argc;n++) {
  if (!strcmp(info->argv[n].key,"continuation")&&info->argv[n].value&&*info->argv[n].value&&continuation.empty()) continuation=info->argv[n].value;
  else return 1;
 }
 if (continuation.empty()) return 1;
 register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);
 register_pass_info p={new pass(g),"shorten",1,PASS_POS_INSERT_AFTER};
 register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);return 0;
}
