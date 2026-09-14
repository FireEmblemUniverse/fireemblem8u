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
bool incoming=false;
bool empty_constraint(rtx p){
 if(GET_CODE(p)==PARALLEL){for(int n=0;n<XVECLEN(p,0);n++)if(!empty_constraint(XVECEXP(p,0,n)))return false;return true;}
 if(GET_CODE(p)!=SET||!REG_P(SET_DEST(p)))return false;
 rtx v=SET_SRC(p);return GET_CODE(v)==ASM_OPERANDS&&!*ASM_OPERANDS_TEMPLATE(v);
}

void fail(){fatal_error(UNKNOWN_LOCATION,"sign branch requires three low-register GE-zero tests in r1, r0, r4 order");}
tree validate(tree *node,tree,tree,int,bool *no_add){if(TREE_CODE(*node)!=FUNCTION_DECL){error("sign branch contract requires a function");*no_add=true;}return NULL_TREE;}
const attribute_spec contract={"matching_thumb_sign_branches",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *){register_attribute(&contract);}
const pass_data data={RTL_PASS,"thumb_sign_branches",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:pass(gcc::context*c):rtl_opt_pass(data,c){}
unsigned int execute(function*fn)override{
 if(!lookup_attribute("matching_thumb_sign_branches",DECL_ATTRIBUTES(fn->decl)))return 0;
 if(!TARGET_THUMB1||flag_unwind_tables||flag_asynchronous_unwind_tables||flag_exceptions||debug_info_level!=DINFO_LEVEL_NONE)fail();
 if(incoming&&(!global_regs[3]||!lookup_attribute("matching_saved_sign_frame",DECL_ATTRIBUTES(fn->decl))))fail();
 const unsigned regs[]={1,0,4};unsigned count=0;
 for(rtx_insn*i=get_insns();i;i=NEXT_INSN(i)){
  if(incoming&&count==0&&LABEL_P(i))fail();
  if(!JUMP_P(i)){if(incoming&&count==0&&INSN_P(i)&&!empty_constraint(PATTERN(i)))fail();continue;}
  rtx p=PATTERN(i);if(GET_CODE(p)!=SET||SET_DEST(p)!=pc_rtx||GET_CODE(SET_SRC(p))!=IF_THEN_ELSE){if(incoming&&count==0)fail();continue;}
  rtx a=SET_SRC(p),c=XEXP(a,0);
  if(GET_CODE(c)!=GE){if(incoming&&count==0)fail();continue;}
  if(count==3||!REG_P(XEXP(c,0))||GET_MODE(XEXP(c,0))!=SImode||REGNO(XEXP(c,0))!=regs[count]||XEXP(c,1)!=const0_rtx||GET_CODE(XEXP(a,1))!=LABEL_REF||XEXP(a,2)!=pc_rtx)fail();
  rtx replacement=(incoming&&count==0)?gen_match_thumb_incoming_nonnegative(XEXP(XEXP(a,1),0)):gen_match_thumb_cmp_zero_nonnegative(copy_rtx(XEXP(c,0)),XEXP(XEXP(a,1),0));
  if(!validate_change(i,&PATTERN(i),replacement,false))fail();REG_NOTES(i)=nullptr;count++;
 }
 if(count!=3)fail();return 0;
}
};
}
int plugin_init(plugin_name_args*info,plugin_gcc_version*version){
 if(!plugin_default_version_check(version,&gcc_version))return 1;
 for(int n=0;n<info->argc;n++){if(strcmp(info->argv[n].key,"incoming-r1-flags")||info->argv[n].value||incoming)return 1;incoming=true;}
 register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);
 register_pass_info p={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);return 0;
}
