#include <vector>
// SPDX-License-Identifier: GPL-3.0-or-later
// Private monitor snippet: r8 is a result register, not a callee-saved value.
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
void fail(){fatal_error(UNKNOWN_LOCATION,"private r8 monitor core requires the exact two-argument SWI frame and result transfer");}
tree validate(tree*n,tree,tree,int,bool*no){if(TREE_CODE(*n)!=FUNCTION_DECL){error("private monitor core requires a function");*no=true;}return NULL_TREE;}
const attribute_spec attr={"matching_monitor_r8_core",0,0,true,false,false,false,validate,nullptr};
void attributes(void*,void*){register_attribute(&attr);}
bool reg(rtx x,unsigned n){return REG_P(x)&&GET_MODE(x)==SImode&&REGNO(x)==n;}
bool copy(rtx p,unsigned d,unsigned s){return GET_CODE(p)==SET&&reg(SET_DEST(p),d)&&reg(SET_SRC(p),s);}
bool argument(rtx p,unsigned d,unsigned s){
 if(copy(p,d,s))return true;
 if(GET_CODE(p)!=SET||!reg(SET_DEST(p),d))return false;
 rtx v=SET_SRC(p);return GET_CODE(v)==UNSPEC&&XINT(v,1)==UNSPEC_MATCH_THUMB_ADD_ZERO&&XVECLEN(v,0)==1&&reg(XVECEXP(v,0,0),s);
}
bool push(rtx p){
 if(GET_CODE(p)!=PARALLEL||XVECLEN(p,0)!=1)return false;
 rtx s=XVECEXP(p,0,0);if(GET_CODE(s)!=SET||!MEM_P(SET_DEST(s)))return false;
 rtx a=XEXP(SET_DEST(s),0),v=SET_SRC(s);
 if(GET_CODE(a)!=PRE_MODIFY||!reg(XEXP(a,0),13))return false;
 rtx plus=XEXP(a,1);
 return GET_CODE(plus)==PLUS&&reg(XEXP(plus,0),13)&&CONST_INT_P(XEXP(plus,1))&&INTVAL(XEXP(plus,1))==-4
 &&GET_CODE(v)==UNSPEC&&XINT(v,1)==UNSPEC_PUSH_MULT&&XVECLEN(v,0)==1&&reg(XVECEXP(v,0,0),7);
}
bool monitor(rtx p){
 if(GET_CODE(p)!=PARALLEL||XVECLEN(p,0)!=2)return false;
 for(unsigned n=0;n<2;n++){
  rtx s=XVECEXP(p,0,n);if(GET_CODE(s)!=SET||!reg(SET_DEST(s),n))return false;
  rtx a=SET_SRC(s);
  if(GET_CODE(a)!=ASM_OPERANDS||!MEM_VOLATILE_P(a)||strcmp(ASM_OPERANDS_TEMPLATE(a),"swi 171")||strcmp(ASM_OPERANDS_OUTPUT_CONSTRAINT(a),"=r")||ASM_OPERANDS_OUTPUT_IDX(a)!=n||ASM_OPERANDS_INPUT_LENGTH(a)!=2||ASM_OPERANDS_LABEL_LENGTH(a)!=0)return false;
  for(unsigned j=0;j<2;j++)if(!reg(ASM_OPERANDS_INPUT(a,j),j)||strcmp(ASM_OPERANDS_INPUT_CONSTRAINT(a,j),j?"1":"0"))return false;
 }
 return true;
}
const pass_data data={RTL_PASS,"monitor_r8_core",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass{
public:pass(gcc::context*c):rtl_opt_pass(data,c){}
unsigned int execute(function*fn)override{
 if(!lookup_attribute("matching_monitor_r8_core",DECL_ATTRIBUTES(fn->decl)))return 0;
 if(!TARGET_THUMB1||DECL_ARGUMENTS(fn->decl)||TREE_CODE(TREE_TYPE(TREE_TYPE(fn->decl)))!=VOID_TYPE||frame_pointer_needed||!known_eq(get_frame_size(),0)||crtl->profile||flag_unwind_tables||flag_asynchronous_unwind_tables||flag_exceptions||debug_info_level!=DINFO_LEVEL_NONE)fail();
 std::vector<rtx_insn*> ops;for(rtx_insn*i=get_insns();i;i=NEXT_INSN(i)){if(LABEL_P(i)||CALL_P(i))fail();if(NONDEBUG_INSN_P(i))ops.push_back(i);}
 if(ops.size()!=10)fail();
 if(!push(PATTERN(ops[0]))||!copy(PATTERN(ops[1]),7,8)||!argument(PATTERN(ops[2]),0,2)||!push(PATTERN(ops[3]))||!argument(PATTERN(ops[4]),1,3)||!monitor(PATTERN(ops[5]))||!copy(PATTERN(ops[7]),8,0))fail();
 rtx p=PATTERN(ops[6]);if(GET_CODE(p)!=UNSPEC||XINT(p,1)!=UNSPEC_REGISTER_USE||XVECLEN(p,0)!=1||!reg(XVECEXP(p,0,0),13))fail();
 p=PATTERN(ops[8]);if(GET_CODE(p)!=USE||!reg(XEXP(p,0),14))fail();
 p=PATTERN(ops[9]);if(!JUMP_P(ops[9])||GET_CODE(p)!=UNSPEC_VOLATILE||XINT(p,1)!=VUNSPEC_EPILOGUE||XVECLEN(p,0)!=1||GET_CODE(XVECEXP(p,0,0))!=RETURN)fail();
 auto*j=emit_jump_insn_before(gen_match_thumb_private_return(gen_rtx_REG(SImode,14)),ops[9]);if(recog_memoized(j)<0)fail();
 for(unsigned n:{0u,1u,3u,9u})delete_insn(ops[n]);return 0;
}
};
}
int plugin_init(plugin_name_args*info,plugin_gcc_version*version){if(!plugin_default_version_check(version,&gcc_version)||info->argc)return 1;register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);register_pass_info p={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);return 0;}
