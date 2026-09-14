// SPDX-License-Identifier: GPL-3.0-or-later
// Preserve the legacy Thumb division-zero helper's register-transparent return.
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
int plugin_is_GPL_compatible;
namespace {
void fail() { fatal_error(UNKNOWN_LOCATION,"division zero return requires an LR-only Thumb call to __div0 and zero result"); }
tree validate(tree *node,tree,tree,int,bool *no_add) {
 if(TREE_CODE(*node)!=FUNCTION_DECL) {error("matching_divzero_return requires a function");*no_add=true;}return NULL_TREE;
}
const attribute_spec contract={"matching_divzero_return",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) {register_attribute(&contract);}
bool reg(rtx x,unsigned n) {return REG_P(x)&&GET_MODE(x)==SImode&&REGNO(x)==n;}
const pass_data data={RTL_PASS,"divzero_return",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
 pass(gcc::context *c):rtl_opt_pass(data,c) {}
 unsigned int execute(function *fn) override {
  if(!lookup_attribute("matching_divzero_return",DECL_ATTRIBUTES(fn->decl))) return 0;
  if(!TARGET_THUMB1||DECL_ARGUMENTS(fn->decl)||flag_unwind_tables||flag_asynchronous_unwind_tables||flag_exceptions||debug_info_level!=DINFO_LEVEL_NONE) fail();
  rtx_insn *ops[6];unsigned count=0;
  for(rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {if(LABEL_P(i)) fail();if(INSN_P(i)) {if(count==6) fail();ops[count++]=i;}}
  if(count!=6) fail();
  rtx p=PATTERN(ops[0]);if(GET_CODE(p)!=PARALLEL||XVECLEN(p,0)!=1) fail();
  p=XVECEXP(p,0,0);if(GET_CODE(p)!=SET||!MEM_P(SET_DEST(p))||GET_MODE(SET_DEST(p))!=BLKmode) fail();
  rtx a=XEXP(SET_DEST(p),0),v=SET_SRC(p);
  if(GET_CODE(a)!=PRE_MODIFY||!reg(XEXP(a,0),13)) fail();a=XEXP(a,1);
  if(GET_CODE(a)!=PLUS||!reg(XEXP(a,0),13)||!CONST_INT_P(XEXP(a,1))||INTVAL(XEXP(a,1))!=-4) fail();
  if(GET_CODE(v)!=UNSPEC||XINT(v,1)!=UNSPEC_PUSH_MULT||XVECLEN(v,0)!=1||!reg(XVECEXP(v,0,0),14)) fail();
  p=PATTERN(ops[1]);if(!CALL_P(ops[1])||SIBLING_CALL_P(ops[1])||CALL_INSN_FUNCTION_USAGE(ops[1])||GET_CODE(p)!=PARALLEL||XVECLEN(p,0)!=3) fail();
  v=XVECEXP(p,0,0);if(GET_CODE(v)!=CALL||!MEM_P(XEXP(v,0))||XEXP(v,1)!=const0_rtx) fail();
  a=XEXP(XEXP(v,0),0);if(GET_CODE(a)!=SYMBOL_REF||strcmp(XSTR(a,0),"__div0")) fail();
  v=XVECEXP(p,0,1);if(GET_CODE(v)!=USE||XEXP(v,0)!=const0_rtx) fail();
  v=XVECEXP(p,0,2);if(GET_CODE(v)!=CLOBBER||!reg(XEXP(v,0),14)) fail();
  p=PATTERN(ops[2]);if(GET_CODE(p)!=UNSPEC||XINT(p,1)!=UNSPEC_REGISTER_USE||XVECLEN(p,0)!=1||!reg(XVECEXP(p,0,0),13)) fail();
  p=PATTERN(ops[3]);if(GET_CODE(p)!=SET||!reg(SET_DEST(p),0)||SET_SRC(p)!=const0_rtx) fail();
  p=PATTERN(ops[4]);if(GET_CODE(p)!=USE||!reg(XEXP(p,0),0)) fail();
  p=PATTERN(ops[5]);if(!JUMP_P(ops[5])||GET_CODE(p)!=UNSPEC_VOLATILE||XINT(p,1)!=VUNSPEC_EPILOGUE||XVECLEN(p,0)!=1||GET_CODE(XVECEXP(p,0,0))!=RETURN) fail();
  rtx_insn *ret=emit_jump_insn_before(gen_match_thumb_pop_pc(),ops[5]);if(recog_memoized(ret)<0) fail();delete_insn(ops[5]);return 0;
 }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
 if(!plugin_default_version_check(version,&gcc_version)||info->argc) return 1;
 register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);
 register_pass_info p={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);return 0;
}
