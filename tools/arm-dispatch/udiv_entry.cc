// SPDX-License-Identifier: GPL-3.0-or-later
// Private division dispatcher: zero tail plus adjacent nonzero fallthrough.
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
void fail(){fatal_error(UNKNOWN_LOCATION,"udiv entry requires a private r1 zero guard and two declared terminal calls");}
tree validate(tree *node,tree,tree,int,bool *no_add){if(TREE_CODE(*node)!=FUNCTION_DECL){error("matching_udiv_entry requires a function");*no_add=true;}return NULL_TREE;}
const attribute_spec contract={"matching_udiv_entry",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *){register_attribute(&contract);}
bool reg(rtx x,unsigned n){return REG_P(x)&&GET_MODE(x)==SImode&&REGNO(x)==n;}
rtx call_symbol(rtx_insn *i,const char *name){
 rtx p=PATTERN(i);if(!CALL_P(i)||SIBLING_CALL_P(i)||CALL_INSN_FUNCTION_USAGE(i)||!find_reg_note(i,REG_NORETURN,nullptr)||GET_CODE(p)!=PARALLEL||XVECLEN(p,0)!=3)fail();
 rtx c=XVECEXP(p,0,0);if(GET_CODE(c)!=CALL||!MEM_P(XEXP(c,0))||XEXP(c,1)!=const0_rtx)fail();
 rtx symbol=XEXP(XEXP(c,0),0);if(GET_CODE(symbol)!=SYMBOL_REF||strcmp(XSTR(symbol,0),name))fail();
 c=XVECEXP(p,0,1);if(GET_CODE(c)!=USE||XEXP(c,0)!=const0_rtx)fail();
 c=XVECEXP(p,0,2);if(GET_CODE(c)!=CLOBBER||!reg(XEXP(c,0),14))fail();return symbol;
}
const pass_data data={RTL_PASS,"udiv_entry",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass{
public:pass(gcc::context*c):rtl_opt_pass(data,c){}
 unsigned int execute(function *fn) override{
  if(!lookup_attribute("matching_udiv_entry",DECL_ATTRIBUTES(fn->decl)))return 0;
  if(!TARGET_THUMB1||!global_regs[1]||DECL_ARGUMENTS(fn->decl)||flag_unwind_tables||flag_asynchronous_unwind_tables||flag_exceptions||debug_info_level!=DINFO_LEVEL_NONE)fail();
  rtx_insn *ops[4];rtx_code_label *label=nullptr;unsigned count=0;
  for(rtx_insn*i=get_insns();i;i=NEXT_INSN(i)){
   if(LABEL_P(i)){if(label||count!=3)fail();label=as_a<rtx_code_label*>(i);}
   if(INSN_P(i)){if(count==4)fail();ops[count++]=i;}
  }
  if(count!=4||!label)fail();
  rtx p=PATTERN(ops[0]);if(GET_CODE(p)!=PARALLEL||XVECLEN(p,0)!=1)fail();
  p=XVECEXP(p,0,0);if(GET_CODE(p)!=SET||!MEM_P(SET_DEST(p))||GET_MODE(SET_DEST(p))!=BLKmode)fail();
  rtx a=XEXP(SET_DEST(p),0),v=SET_SRC(p);if(GET_CODE(a)!=PRE_MODIFY||!reg(XEXP(a,0),13))fail();a=XEXP(a,1);
  if(GET_CODE(a)!=PLUS||!reg(XEXP(a,0),13)||!CONST_INT_P(XEXP(a,1))||INTVAL(XEXP(a,1))!=-4)fail();
  if(GET_CODE(v)!=UNSPEC||XINT(v,1)!=UNSPEC_PUSH_MULT||XVECLEN(v,0)!=1||!reg(XVECEXP(v,0,0),14))fail();
  p=PATTERN(ops[1]);if(!JUMP_P(ops[1])||GET_CODE(p)!=SET||SET_DEST(p)!=pc_rtx)fail();
  a=SET_SRC(p);if(GET_CODE(a)!=IF_THEN_ELSE||GET_CODE(XEXP(a,1))!=LABEL_REF||XEXP(XEXP(a,1),0)!=label||XEXP(a,2)!=pc_rtx)fail();
  v=XEXP(a,0);if(GET_CODE(v)!=NE||!reg(XEXP(v,0),1)||XEXP(v,1)!=const0_rtx)fail();
  rtx zero=call_symbol(ops[2],"runtime_divzero");call_symbol(ops[3],"runtime_udiv");
  rtx_insn*j=emit_jump_insn_before(gen_match_thumb_zero_tail(gen_rtx_REG(SImode,1),copy_rtx(zero)),ops[1]);if(recog_memoized(j)<0)fail();
  for(unsigned n=0;n<4;n++)delete_insn(ops[n]);return 0;
 }
};
}
int plugin_init(plugin_name_args*info,plugin_gcc_version*version){
 if(!plugin_default_version_check(version,&gcc_version)||info->argc)return 1;
 register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);register_pass_info p={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);return 0;
}
