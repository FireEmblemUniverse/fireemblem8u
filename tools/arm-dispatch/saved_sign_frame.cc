#include <map>
#include <vector>
// SPDX-License-Identifier: GPL-3.0-or-later
// Prune stale r5/r6 saves only from a checked, stack-independent r4 leaf.
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
void fail(){fatal_error(UNKNOWN_LOCATION,"saved sign frame requires an r0 local, unused r5, and ordered private frame regions");}
bool reg(rtx x,unsigned n){return REG_P(x)&&GET_MODE(x)==SImode&&REGNO(x)==n;}
bool forbidden(rtx x,bool prefix){
 if(!x)return false;
 if(MEM_P(x)||CALL_P(x))return true;
 if(REG_P(x)&&(REGNO(x)==5||REGNO(x)==13||REGNO(x)==14||(prefix&&REGNO(x)==4)))return true;
 if(GET_CODE(x)==ASM_OPERANDS&&*ASM_OPERANDS_TEMPLATE(x))return true;
 const char*f=GET_RTX_FORMAT(GET_CODE(x));
 for(int n=0;n<GET_RTX_LENGTH(GET_CODE(x));n++){
  if(f[n]=='e'&&forbidden(XEXP(x,n),prefix))return true;
  if(f[n]=='E')for(int j=0;j<XVECLEN(x,n);j++)if(forbidden(XVECEXP(x,n,j),prefix))return true;
 }return false;
}
tree validate(tree*node,tree,tree,int,bool*no){if(TREE_CODE(*node)!=FUNCTION_DECL){error("saved sign frame requires function");*no=true;}return NULL_TREE;}
const attribute_spec attr={"matching_saved_sign_frame",0,0,true,false,false,false,validate,nullptr};
void attributes(void*,void*){register_attribute(&attr);}
const pass_data data={RTL_PASS,"saved_sign_frame",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass{
public:pass(gcc::context*c):rtl_opt_pass(data,c){}
unsigned int execute(function*fn)override{
 if(!lookup_attribute("matching_saved_sign_frame",DECL_ATTRIBUTES(fn->decl)))return 0;
 if(!TARGET_THUMB1||!lookup_attribute("matching_leaf_frame",DECL_ATTRIBUTES(fn->decl))||flag_unwind_tables||flag_asynchronous_unwind_tables||flag_exceptions||debug_info_level!=DINFO_LEVEL_NONE)fail();
 rtx_insn*push=nullptr,*store=nullptr,*load=nullptr,*ret=nullptr;bool epi=false;unsigned clob=0,sp=0,lr=0;
 std::map<rtx_insn*,unsigned> regions;std::vector<rtx_insn*> jumps;
 unsigned phase=0;
 for(rtx_insn*i=get_insns();i;i=NEXT_INSN(i)){
  regions[i]=phase;
  if(NOTE_P(i)&&NOTE_KIND(i)==NOTE_INSN_EPILOGUE_BEG){if(epi||!load)fail();epi=true;}
  if(!INSN_P(i))continue;if(CALL_P(i))fail();rtx p=PATTERN(i);
  if(!push&&GET_CODE(p)==PARALLEL&&XVECLEN(p,0)==3&&GET_CODE(XVECEXP(p,0,0))==SET&&MEM_P(SET_DEST(XVECEXP(p,0,0)))){
   rtx q=XVECEXP(p,0,0),m=SET_DEST(q),v=SET_SRC(q),a=XEXP(m,0);
   if(epi||phase||GET_MODE(m)!=BLKmode||GET_CODE(a)!=PRE_MODIFY||!reg(XEXP(a,0),13))fail();a=XEXP(a,1);
   if(GET_CODE(a)!=PLUS||!reg(XEXP(a,0),13)||!CONST_INT_P(XEXP(a,1))||INTVAL(XEXP(a,1))!=-12)fail();
   if(GET_CODE(v)!=UNSPEC||XINT(v,1)!=UNSPEC_PUSH_MULT||XVECLEN(v,0)!=1||!reg(XVECEXP(v,0,0),0))fail();
   for(unsigned n=1;n<3;n++)if(GET_CODE(XVECEXP(p,0,n))!=USE||!reg(XEXP(XVECEXP(p,0,n),0),3+n))fail();push=i;continue;
  }
  if(GET_CODE(p)==SET&&MEM_P(SET_DEST(p))){rtx m=SET_DEST(p);if(!push||store||epi||GET_MODE(m)!=SImode||!reg(XEXP(m,0),13)||!reg(SET_SRC(p),0))fail();store=i;phase=1;continue;}
  if(GET_CODE(p)==SET&&MEM_P(SET_SRC(p))){rtx m=SET_SRC(p);if(!store||load||epi||GET_MODE(m)!=SImode||!reg(XEXP(m,0),13)||!reg(SET_DEST(p),4))fail();load=i;phase=2;continue;}
  if(epi){
   if(GET_CODE(p)==CLOBBER&&REG_P(XEXP(p,0))&&(REGNO(XEXP(p,0))==4||REGNO(XEXP(p,0))==5)){unsigned b=1u<<(REGNO(XEXP(p,0))-4);if(clob&b)fail();clob|=b;continue;}
   if(GET_CODE(p)==UNSPEC&&XINT(p,1)==UNSPEC_REGISTER_USE&&XVECLEN(p,0)==1&&reg(XVECEXP(p,0,0),13)){sp++;continue;}
   if(GET_CODE(p)==USE&&reg(XEXP(p,0),14)){lr++;continue;}
   if(JUMP_P(i)&&GET_CODE(p)==UNSPEC_VOLATILE&&XINT(p,1)==VUNSPEC_EPILOGUE&&XVECLEN(p,0)==1&&GET_CODE(XVECEXP(p,0,0))==RETURN){if(ret)fail();ret=i;continue;}
   fail();
  }
  if(forbidden(p,!store))fail();
  if(JUMP_P(i))jumps.push_back(i);
 }
 if(!push||!store||!load||!ret||clob!=3||sp!=1||lr!=1)fail();
 for(auto*i:jumps){rtx p=PATTERN(i);if(GET_CODE(p)!=SET||SET_DEST(p)!=pc_rtx)fail();rtx d=SET_SRC(p);
  if(GET_CODE(d)==IF_THEN_ELSE){if(XEXP(d,2)!=pc_rtx)fail();d=XEXP(d,1);}
  if(GET_CODE(d)!=LABEL_REF)fail();auto target=as_a<rtx_insn*>(XEXP(d,0));if(!regions.count(target)||regions[target]!=regions[i])fail();
 }
 auto push_one=[&](unsigned n){rtx q=copy_rtx(XVECEXP(PATTERN(push),0,0));XEXP(SET_DEST(q),0)=gen_rtx_PRE_MODIFY(SImode,gen_rtx_REG(SImode,13),gen_rtx_PLUS(SImode,gen_rtx_REG(SImode,13),GEN_INT(-4)));XVECEXP(SET_SRC(q),0,0)=gen_rtx_REG(SImode,n);return gen_rtx_PARALLEL(VOIDmode,gen_rtvec(1,q));};
 rtx_insn*a=emit_insn_before(push_one(4),store),*b=emit_insn_before(push_one(0),store);
 rtx_insn*c=emit_insn_before(gen_match_thumb_pop_word(gen_rtx_REG(SImode,4)),load);
 rtx_insn*d=emit_insn_before(gen_match_thumb_pop_word(gen_rtx_REG(SImode,4)),ret);
 rtx_insn*e=emit_jump_insn_before(gen_rtx_SET(pc_rtx,gen_rtx_REG(SImode,14)),ret);
 if(recog_memoized(a)<0||recog_memoized(b)<0||recog_memoized(c)<0||recog_memoized(d)<0||recog_memoized(e)<0)fail();
 delete_insn(push);delete_insn(store);delete_insn(load);delete_insn(ret);return 0;
}
};
}
int plugin_init(plugin_name_args*info,plugin_gcc_version*version){if(!plugin_default_version_check(version,&gcc_version)||info->argc)return 1;register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);register_pass_info p={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);return 0;}
