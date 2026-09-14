#include <vector>
// SPDX-License-Identifier: GPL-3.0-or-later
// Checked incoming-register terminal handoff; no ordinary C ABI frame.
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
#include "hard-reg-set.h"
#include "regs.h"
int plugin_is_GPL_compatible;
namespace {
void fail(){fatal_error(UNKNOWN_LOCATION,"register veneer requires a single no-argument fixed-register call and its compiler frame");}
tree validate(tree*node,tree,tree,int,bool*no){if(TREE_CODE(*node)!=FUNCTION_DECL){error("register veneer requires a function");*no=true;}return NULL_TREE;}
const attribute_spec attr={"matching_register_veneer",0,0,true,false,false,false,validate,nullptr};
void attributes(void*,void*){register_attribute(&attr);}
bool reg(rtx x,unsigned n){return REG_P(x)&&GET_MODE(x)==SImode&&REGNO(x)==n;}
bool copy(rtx p,unsigned d,unsigned s){return GET_CODE(p)==SET&&reg(SET_DEST(p),d)&&reg(SET_SRC(p),s);}
bool push(rtx p,bool high){
 if(GET_CODE(p)!=PARALLEL||XVECLEN(p,0)!=(high?2:1))return false;
 rtx s=XVECEXP(p,0,0);if(GET_CODE(s)!=SET||!MEM_P(SET_DEST(s)))return false;
 rtx a=XEXP(SET_DEST(s),0),v=SET_SRC(s);
 if(GET_CODE(a)!=PRE_MODIFY||!reg(XEXP(a,0),13))return false;
 rtx plus=XEXP(a,1);
 if(GET_CODE(plus)!=PLUS||!reg(XEXP(plus,0),13)||!CONST_INT_P(XEXP(plus,1))||INTVAL(XEXP(plus,1))!=(high?-8:-4))return false;
 if(GET_CODE(v)!=UNSPEC||XINT(v,1)!=UNSPEC_PUSH_MULT||XVECLEN(v,0)!=1||!reg(XVECEXP(v,0,0),high?3:14))return false;
 return !high||(GET_CODE(XVECEXP(p,0,1))==USE&&reg(XEXP(XVECEXP(p,0,1),0),14));
}
const pass_data data={RTL_PASS,"register_veneer",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass{
public:pass(gcc::context*c):rtl_opt_pass(data,c){}
unsigned int execute(function*fn)override{
 if(!lookup_attribute("matching_register_veneer",DECL_ATTRIBUTES(fn->decl)))return 0;
 if(!TARGET_THUMB1||DECL_ARGUMENTS(fn->decl)||TREE_CODE(TREE_TYPE(TREE_TYPE(fn->decl)))!=VOID_TYPE||frame_pointer_needed||!known_eq(get_frame_size(),0)||crtl->profile||flag_unwind_tables||flag_asynchronous_unwind_tables||flag_exceptions||debug_info_level!=DINFO_LEVEL_NONE)fail();
 std::vector<rtx_insn*> ops;
 for(rtx_insn*i=get_insns();i;i=NEXT_INSN(i)){if(LABEL_P(i))fail();if(NONDEBUG_INSN_P(i))ops.push_back(i);}
 if(ops.size()!=4&&ops.size()!=5)fail();
 unsigned ci=ops.size()-3;rtx_insn*c=ops[ci];rtx p=PATTERN(c);
 if(!CALL_P(c)||SIBLING_CALL_P(c)||CALL_INSN_FUNCTION_USAGE(c)||GET_CODE(p)!=PARALLEL||XVECLEN(p,0)!=3)fail();
 rtx call=XVECEXP(p,0,0),use=XVECEXP(p,0,1),clobber=XVECEXP(p,0,2);
 if(GET_CODE(call)!=CALL||!MEM_P(XEXP(call,0))||XEXP(call,1)!=const0_rtx||GET_CODE(use)!=USE||XEXP(use,0)!=const0_rtx||GET_CODE(clobber)!=CLOBBER||!reg(XEXP(clobber,0),14))fail();
 rtx dest=XEXP(XEXP(call,0),0);if(!REG_P(dest)||GET_MODE(dest)!=SImode||REGNO(dest)>14)fail();unsigned target=REGNO(dest);
 if(ci==2&&copy(PATTERN(ops[1]),3,13)&&target==3){target=13;if(!push(PATTERN(ops[0]),false))fail();}
 else if(target>=8&&target<=11){if(ci!=2||!copy(PATTERN(ops[0]),3,target)||!push(PATTERN(ops[1]),true))fail();}
 else if(ci!=1||!push(PATTERN(ops[0]),false))fail();
 // The existing BX pattern excludes SP; reject before emitting invalid RTL.
 if(target==13||!global_regs[target])fail();
 p=PATTERN(ops[ci+1]);if(GET_CODE(p)!=UNSPEC||XINT(p,1)!=UNSPEC_REGISTER_USE||XVECLEN(p,0)!=1||!reg(XVECEXP(p,0,0),13))fail();
 p=PATTERN(ops[ci+2]);if(!JUMP_P(ops[ci+2])||GET_CODE(p)!=UNSPEC_VOLATILE||XINT(p,1)!=VUNSPEC_EPILOGUE||XVECLEN(p,0)!=1||GET_CODE(XVECEXP(p,0,0))!=RETURN)fail();
 auto*j=emit_jump_insn_before(gen_match_thumb_private_return(gen_rtx_REG(SImode,target)),ops[0]);if(recog_memoized(j)<0)fail();
 for(auto*i:ops)delete_insn(i);return 0;
}
};
}
int plugin_init(plugin_name_args*info,plugin_gcc_version*version){if(!plugin_default_version_check(version,&gcc_version)||info->argc)return 1;register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);register_pass_info p={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);return 0;}
