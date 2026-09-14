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
void fail(){fatal_error(UNKNOWN_LOCATION,"empty Thumb return requires a no-argument void function with only the return epilogue");}
tree validate(tree*node,tree,tree,int,bool*no){if(TREE_CODE(*node)!=FUNCTION_DECL){error("empty return requires a function");*no=true;}return NULL_TREE;}
const attribute_spec attr={"matching_empty_thumb_return",0,0,true,false,false,false,validate,nullptr};
void attributes(void*,void*){register_attribute(&attr);}
bool reg(rtx x,unsigned n){return REG_P(x)&&GET_MODE(x)==SImode&&REGNO(x)==n;}
const pass_data data={RTL_PASS,"empty_thumb_return",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass{
public:pass(gcc::context*c):rtl_opt_pass(data,c){}
unsigned int execute(function*fn)override{
 if(!lookup_attribute("matching_empty_thumb_return",DECL_ATTRIBUTES(fn->decl)))return 0;
 if(!TARGET_THUMB1||DECL_ARGUMENTS(fn->decl)||TREE_CODE(TREE_TYPE(TREE_TYPE(fn->decl)))!=VOID_TYPE||flag_unwind_tables||flag_asynchronous_unwind_tables||flag_exceptions||debug_info_level!=DINFO_LEVEL_NONE)fail();
 rtx_insn*ops[3];unsigned count=0;
 for(rtx_insn*i=get_insns();i;i=NEXT_INSN(i)){if(LABEL_P(i)||CALL_P(i))fail();if(INSN_P(i)){if(count==3)fail();ops[count++]=i;}}
 if(count!=3)fail();rtx p=PATTERN(ops[0]);
 if(GET_CODE(p)!=UNSPEC||XINT(p,1)!=UNSPEC_REGISTER_USE||XVECLEN(p,0)!=1||!reg(XVECEXP(p,0,0),13))fail();
 p=PATTERN(ops[1]);if(GET_CODE(p)!=USE||!reg(XEXP(p,0),14))fail();
 p=PATTERN(ops[2]);if(!JUMP_P(ops[2])||GET_CODE(p)!=UNSPEC_VOLATILE||XINT(p,1)!=VUNSPEC_EPILOGUE||XVECLEN(p,0)!=1||GET_CODE(XVECEXP(p,0,0))!=RETURN)fail();
 auto*r=emit_jump_insn_before(gen_rtx_SET(pc_rtx,gen_rtx_REG(SImode,14)),ops[2]);if(recog_memoized(r)<0)fail();delete_insn(ops[2]);return 0;
}
};
}
int plugin_init(plugin_name_args*info,plugin_gcc_version*version){if(!plugin_default_version_check(version,&gcc_version)||info->argc)return 1;register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);register_pass_info p={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);return 0;}
