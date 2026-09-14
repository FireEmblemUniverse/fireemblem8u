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
bool thumb_return=false;
void fail() { fatal_error(UNKNOWN_LOCATION,"leaf r4 frame requires one r4-r6 save and a stack-independent leaf body"); }
tree validate(tree *node,tree,tree,int,bool *no_add) {
 if (TREE_CODE(*node)!=FUNCTION_DECL) { error("matching_leaf_r4_frame requires a function");*no_add=true; }
 return NULL_TREE;
}
const attribute_spec contract={"matching_leaf_r4_frame",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) { register_attribute(&contract); }
bool reg(rtx x,unsigned n) { return REG_P(x)&&GET_MODE(x)==SImode&&REGNO(x)==n; }
bool forbidden(rtx x) {
 if (!x) return false;
 if (MEM_P(x)||CALL_P(x)) return true;
 if (REG_P(x)&&(REGNO(x)==5||REGNO(x)==6||REGNO(x)==13||REGNO(x)==14)) return true;
 if (GET_CODE(x)==ASM_OPERANDS&&*ASM_OPERANDS_TEMPLATE(x)) return true;
 const char *format=GET_RTX_FORMAT(GET_CODE(x));
 for (int n=0;n<GET_RTX_LENGTH(GET_CODE(x));n++) {
  if (format[n]=='e'&&forbidden(XEXP(x,n))) return true;
  if (format[n]=='E') for (int j=0;j<XVECLEN(x,n);j++) if (forbidden(XVECEXP(x,n,j))) return true;
 }
 return false;
}
const pass_data data={RTL_PASS,"leaf_r4_frame",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
 pass(gcc::context *c):rtl_opt_pass(data,c) {}
 unsigned int execute(function *fn) override {
  if (!lookup_attribute("matching_leaf_r4_frame",DECL_ATTRIBUTES(fn->decl))) return 0;
  if (!TARGET_THUMB1||!lookup_attribute("matching_leaf_frame",DECL_ATTRIBUTES(fn->decl))||flag_unwind_tables||flag_asynchronous_unwind_tables||flag_exceptions||debug_info_level!=DINFO_LEVEL_NONE) fail();
  rtx_insn *push=nullptr,*ret=nullptr;bool epilogue=false;unsigned clobbers=0,sp_uses=0,lr_uses=0,saved_count=0;
  for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
   if (NOTE_P(i)&&NOTE_KIND(i)==NOTE_INSN_EPILOGUE_BEG) { if(epilogue) fail();epilogue=true; }
   if (LABEL_P(i)&&(!push||epilogue)) fail();
   if (!INSN_P(i)) continue;
   if (CALL_P(i)) fail();
   rtx p=PATTERN(i);
   if (GET_CODE(p)==PARALLEL&&(XVECLEN(p,0)==2||XVECLEN(p,0)==3)&&GET_CODE(XVECEXP(p,0,0))==SET&&MEM_P(SET_DEST(XVECEXP(p,0,0)))) {
    if(push||epilogue) fail();push=i;saved_count=XVECLEN(p,0);
    rtx s=XVECEXP(p,0,0),m=SET_DEST(s),v=SET_SRC(s),a=XEXP(m,0);
    if(GET_MODE(m)!=BLKmode||GET_CODE(a)!=PRE_MODIFY||!reg(XEXP(a,0),13)) fail();
    a=XEXP(a,1);
    if(GET_CODE(a)!=PLUS||!reg(XEXP(a,0),13)||!CONST_INT_P(XEXP(a,1))||INTVAL(XEXP(a,1))!=-4*(int)saved_count) fail();
    if(GET_CODE(v)!=UNSPEC||XINT(v,1)!=UNSPEC_PUSH_MULT||XVECLEN(v,0)!=1||!reg(XVECEXP(v,0,0),4)) fail();
    for(unsigned n=1;n<saved_count;n++) if(GET_CODE(XVECEXP(p,0,n))!=USE||!reg(XEXP(XVECEXP(p,0,n),0),4+n)) fail();
    continue;
   }
   if(epilogue&&GET_CODE(p)==CLOBBER&&REG_P(XEXP(p,0))&&REGNO(XEXP(p,0))>=4&&REGNO(XEXP(p,0))<=6) {
    unsigned bit=1u<<(REGNO(XEXP(p,0))-4);if(clobbers&bit) fail();clobbers|=bit;continue;
   }
   if(epilogue&&GET_CODE(p)==UNSPEC&&XINT(p,1)==UNSPEC_REGISTER_USE&&XVECLEN(p,0)==1&&reg(XVECEXP(p,0,0),13)) {sp_uses++;continue;}
   if(epilogue&&GET_CODE(p)==USE&&reg(XEXP(p,0),14)) {lr_uses++;continue;}
   if(epilogue&&JUMP_P(i)&&GET_CODE(p)==UNSPEC_VOLATILE&&XINT(p,1)==VUNSPEC_EPILOGUE&&XVECLEN(p,0)==1&&GET_CODE(XVECEXP(p,0,0))==RETURN) {if(ret) fail();ret=i;continue;}
   if(epilogue||forbidden(p)) fail();
   if(JUMP_P(i)) {
    if(!push||GET_CODE(p)!=SET||SET_DEST(p)!=pc_rtx) fail();
    rtx dest=SET_SRC(p);
    if(GET_CODE(dest)==IF_THEN_ELSE) {if(GET_CODE(XEXP(dest,1))!=LABEL_REF||XEXP(dest,2)!=pc_rtx) fail();}
    else if(GET_CODE(dest)!=LABEL_REF) fail();
   }
  }
  if(!push||!ret||clobbers!=((1u<<saved_count)-1)||sp_uses!=1||lr_uses!=1) fail();
  rtx s=copy_rtx(XVECEXP(PATTERN(push),0,0));
  XEXP(SET_DEST(s),0)=gen_rtx_PRE_MODIFY(SImode,gen_rtx_REG(SImode,13),gen_rtx_PLUS(SImode,gen_rtx_REG(SImode,13),GEN_INT(-4)));
  if(!validate_change(push,&PATTERN(push),gen_rtx_PARALLEL(VOIDmode,gen_rtvec(1,s)),false)) fail();
  REG_NOTES(push)=nullptr;RTX_FRAME_RELATED_P(push)=0;
  rtx_insn *pop=emit_insn_before(gen_match_thumb_pop_word(gen_rtx_REG(SImode,4)),ret);
  rtx_insn *end=emit_jump_insn_before(thumb_return?gen_rtx_SET(pc_rtx,gen_rtx_REG(SImode,14)):gen_match_thumb_private_return(gen_rtx_REG(SImode,14)),ret);
  if(recog_memoized(pop)<0||recog_memoized(end)<0) fail();
  delete_insn(ret);
  return 0;
 }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
 if(!plugin_default_version_check(version,&gcc_version)) return 1;
 for(int n=0;n<info->argc;n++) {
  if(strcmp(info->argv[n].key,"thumb-return")||info->argv[n].value||thumb_return) return 1;
  thumb_return=true;
 }
 register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);
 register_pass_info p={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};
 register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);return 0;
}
