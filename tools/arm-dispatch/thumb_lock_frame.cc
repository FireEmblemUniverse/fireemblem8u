// SPDX-License-Identifier: GPL-3.0-or-later
// Prove a lock gate and explicit private frame before selecting grouped pushes.
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
#include "ggc.h"
int plugin_is_GPL_compatible;
namespace {
std::string continuation;
struct literal { unsigned long value=0; std::string symbol; } id_literal;
tree validate(tree *node,tree,tree,int,bool *no_add) {
    if (TREE_CODE(*node)!=FUNCTION_DECL) { error("matching_thumb_lock_frame requires a function");*no_add=true; }
    return NULL_TREE;
}
const attribute_spec contract={"matching_thumb_lock_frame",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) { register_attribute(&contract); }
bool reg_is(rtx x,unsigned reg) { return REG_P(x)&&GET_MODE(x)==SImode&&REGNO(x)==reg; }
bool lr_push(rtx p) {
    if (GET_CODE(p)!=PARALLEL || XVECLEN(p,0)!=1) return false;
    rtx set=XVECEXP(p,0,0);
    if (GET_CODE(set)!=SET || !MEM_P(SET_DEST(set))) return false;
    rtx address=XEXP(SET_DEST(set),0),src=SET_SRC(set);
    if (GET_CODE(address)!=PRE_MODIFY || !reg_is(XEXP(address,0),SP_REGNUM)
        || GET_CODE(XEXP(address,1))!=PLUS) return false;
    rtx add=XEXP(address,1);
    return reg_is(XEXP(add,0),SP_REGNUM) && CONST_INT_P(XEXP(add,1)) && INTVAL(XEXP(add,1))==-4
        && GET_CODE(src)==UNSPEC && XINT(src,1)==UNSPEC_PUSH_MULT
        && XVECLEN(src,0)==1 && reg_is(XVECEXP(src,0,0),LR_REGNUM);
}

bool tie(rtx p,unsigned reg) {
    if (GET_CODE(p)!=SET||!reg_is(SET_DEST(p),reg)) return false;
    rtx a=SET_SRC(p);
    return GET_CODE(a)==ASM_OPERANDS&&GET_MODE(a)==SImode&&!ASM_OPERANDS_TEMPLATE(a)[0]
        &&!strcmp(ASM_OPERANDS_OUTPUT_CONSTRAINT(a),"=r")&&ASM_OPERANDS_OUTPUT_IDX(a)==0
        &&ASM_OPERANDS_INPUT_LENGTH(a)==1&&ASM_OPERANDS_LABEL_LENGTH(a)==0
        &&reg_is(ASM_OPERANDS_INPUT(a,0),reg)&&!strcmp(ASM_OPERANDS_INPUT_CONSTRAINT(a,0),"0");
}
bool address(rtx a,unsigned reg,long offset) {
    if (!offset) return reg_is(a,reg);
    return GET_CODE(a)==PLUS&&reg_is(XEXP(a,0),reg)&&CONST_INT_P(XEXP(a,1))&&INTVAL(XEXP(a,1))==offset;
}
bool memory(rtx m,unsigned base,long offset) {
    return MEM_P(m)&&GET_MODE(m)==SImode&&MEM_VOLATILE_P(m)&&address(XEXP(m,0),base,offset);
}
bool store(rtx p,unsigned base,long offset,unsigned reg) {
    return GET_CODE(p)==SET&&memory(SET_DEST(p),base,offset)&&reg_is(SET_SRC(p),reg);
}
bool load(rtx p,unsigned dst,unsigned base) {
    return GET_CODE(p)==SET&&reg_is(SET_DEST(p),dst)&&memory(SET_SRC(p),base,0);
}
bool add(rtx p,unsigned reg,long value) {
    return GET_CODE(p)==SET&&reg_is(SET_DEST(p),reg)&&address(SET_SRC(p),reg,value);
}
bool move(rtx p,unsigned dst,unsigned src) {
    return GET_CODE(p)==SET&&reg_is(SET_DEST(p),dst)&&reg_is(SET_SRC(p),src);
}
bool marker(rtx p,int code) {
    return GET_CODE(p)==UNSPEC_VOLATILE&&XINT(p,1)==code&&XVECLEN(p,0)==1&&XVECEXP(p,0,0)==const0_rtx;
}
bool word(rtx p,unsigned long value) {
    return GET_CODE(p)==UNSPEC_VOLATILE&&XINT(p,1)==VUNSPEC_POOL_4&&XVECLEN(p,0)==1
        &&CONST_INT_P(XVECEXP(p,0,0))&&(unsigned long)(unsigned int)INTVAL(XVECEXP(p,0,0))==value;
}
rtx pool_load(rtx p,unsigned reg,long offset) {
    if (GET_CODE(p)!=SET||!reg_is(SET_DEST(p),reg)||!MEM_P(SET_SRC(p))||GET_MODE(SET_SRC(p))!=SImode) return nullptr;
    rtx a=XEXP(SET_SRC(p),0);
    if (GET_CODE(a)==CONST) a=XEXP(a,0);
    if (offset) {
        if (GET_CODE(a)!=PLUS||!CONST_INT_P(XEXP(a,1))||INTVAL(XEXP(a,1))!=offset) return nullptr;
        a=XEXP(a,0);
    }
    return GET_CODE(a)==LABEL_REF?XEXP(a,0):nullptr;
}
bool between(rtx_insn *label,rtx_insn *before,rtx_insn *after) {
    for (rtx_insn *i=NEXT_INSN(before);i&&i!=after;i=NEXT_INSN(i)) if (i==label) return true;
    return false;
}
const pass_data data={RTL_PASS,"thumb_lock_frame",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
 pass(gcc::context *c):rtl_opt_pass(data,c) {}
 unsigned int execute(function *fn) override {
  if (!lookup_attribute("matching_thumb_lock_frame",DECL_ATTRIBUTES(fn->decl))) return 0;
  if (!TARGET_THUMB1||frame_pointer_needed||!known_eq(get_frame_size(),0)||crtl->profile
   ||flag_unwind_tables||flag_asynchronous_unwind_tables||flag_exceptions||debug_info_level!=DINFO_LEVEL_NONE
   ||!global_regs[SP_REGNUM]||!global_regs[LR_REGNUM]||DECL_ARGUMENTS(fn->decl)
   ||TREE_CODE(TREE_TYPE(TREE_TYPE(fn->decl)))!=VOID_TYPE)
   fatal_error(UNKNOWN_LOCATION,"lock frame requires private zero-local-frame void Thumb code without arguments/debug/unwind");
  for (unsigned n=0;n<12;n++) if (!global_regs[n]) fatal_error(UNKNOWN_LOCATION,"lock frame requires bound r0-r11");
  std::vector<rtx_insn *> ops,ties;
  for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) if (NONDEBUG_INSN_P(i)) {
   if (ties.size()<2&&ops.size()==ties.size()+2&&tie(PATTERN(i),ties.size()+2)) {ties.push_back(i);continue;}
   ops.push_back(i);
  }
  if (ops.size()!=18||ties.size()!=2) fatal_error(UNKNOWN_LOCATION,"lock frame operation/tie count changed");
  auto p=[&](unsigned n){return PATTERN(ops[n]);};
  if (!lr_push(p(0))||GET_CODE(p(2))!=SET||!reg_is(SET_DEST(p(2)),3)||!memory(SET_SRC(p(2)),0,52)
   ||!add(p(4),3,1)||!store(p(5),0,52,3)||!add(p(6),SP_REGNUM,-8)
   ||!store(p(7),SP_REGNUM,0,0)||!move(p(8),3,LR_REGNUM)||!store(p(9),SP_REGNUM,4,3))
   fatal_error(UNKNOWN_LOCATION,"lock frame load/store/stack order changed");
  rtx pool=pool_load(p(1),2,0);
  if (!pool||pool_load(p(10),3,4)!=pool||!between(as_a<rtx_insn *>(pool),ops[14],ops[15])
   ||!marker(p(14),VUNSPEC_ALIGN)||!word(p(15),id_literal.value)
   ||!word(p(16),id_literal.value+1)||!marker(p(17),VUNSPEC_POOL_END))
   fatal_error(UNKNOWN_LOCATION,"lock frame literal or restored lock value changed");
  rtx c=p(11);
  if (!CALL_P(ops[11])||SIBLING_CALL_P(ops[11])||CALL_INSN_FUNCTION_USAGE(ops[11])||GET_CODE(c)!=PARALLEL||XVECLEN(c,0)!=3)
   fatal_error(UNKNOWN_LOCATION,"lock frame continuation shape changed");
  rtx call=XVECEXP(c,0,0),use=XVECEXP(c,0,1),clobber=XVECEXP(c,0,2);
  if (GET_CODE(call)!=CALL||!MEM_P(XEXP(call,0))||GET_CODE(XEXP(XEXP(call,0),0))!=SYMBOL_REF
   ||continuation!=XSTR(XEXP(XEXP(call,0),0),0)||XEXP(call,1)!=const0_rtx
   ||GET_CODE(use)!=USE||XEXP(use,0)!=const0_rtx||GET_CODE(clobber)!=CLOBBER||!reg_is(XEXP(clobber,0),LR_REGNUM))
   fatal_error(UNKNOWN_LOCATION,"lock frame requires declared no-argument continuation");
  if (GET_CODE(p(12))!=UNSPEC||XINT(p(12),1)!=UNSPEC_REGISTER_USE||XVECLEN(p(12),0)!=1||!reg_is(XVECEXP(p(12),0,0),SP_REGNUM)
   ||!JUMP_P(ops[13])||GET_CODE(p(13))!=UNSPEC_VOLATILE||XINT(p(13),1)!=VUNSPEC_EPILOGUE
   ||XVECLEN(p(13),0)!=1||GET_CODE(XVECEXP(p(13),0,0))!=RETURN)
   fatal_error(UNKNOWN_LOCATION,"lock frame epilogue changed");
  rtx branch=p(3);
  if (!JUMP_P(ops[3])||GET_CODE(branch)!=SET||SET_DEST(branch)!=pc_rtx||GET_CODE(SET_SRC(branch))!=IF_THEN_ELSE)
   fatal_error(UNKNOWN_LOCATION,"lock frame missing lock branch");
  rtx choice=SET_SRC(branch),test=XEXP(choice,0);
  if (GET_CODE(test)!=NE||!reg_is(XEXP(test,0),2)||!reg_is(XEXP(test,1),3)
   ||GET_CODE(XEXP(choice,1))!=LABEL_REF||XEXP(choice,2)!=pc_rtx)
   fatal_error(UNKNOWN_LOCATION,"lock frame comparison changed");
  rtx_insn *old_label=as_a<rtx_insn *>(XEXP(XEXP(choice,1),0));
  if (!between(old_label,ops[11],ops[12])||LABEL_NUSES(old_label)!=1||LABEL_PRESERVE_P(old_label))
   fatal_error(UNKNOWN_LOCATION,"lock frame return target changed");
  for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) if (LABEL_P(i)&&i!=old_label&&(LABEL_NUSES(i)||LABEL_PRESERVE_P(i)))
   fatal_error(UNKNOWN_LOCATION,"lock frame has another live label");
  if (!validate_change(ops[1],&PATTERN(ops[1]),gen_match_thumb_literal(gen_rtx_REG(SImode,2),gen_rtx_SYMBOL_REF(Pmode,ggc_strdup(id_literal.symbol.c_str()))),false)
   ||!validate_change(ops[6],&PATTERN(ops[6]),gen_match_thumb_push_player_lr(),false))
   fatal_error(UNKNOWN_LOCATION,"lock frame shared load/grouped push rejected");
  REG_NOTES(ops[1])=REG_NOTES(ops[6])=nullptr;
  auto *success=gen_label_rtx();rtx replacement=copy_rtx(branch);rtx ch=SET_SRC(replacement);
  PUT_CODE(XEXP(ch,0),EQ);XEXP(ch,1)=gen_rtx_LABEL_REF(VOIDmode,success);
  if (!validate_change(ops[3],&PATTERN(ops[3]),replacement,false)) fatal_error(UNKNOWN_LOCATION,"lock frame success branch rejected");
  LABEL_NUSES(old_label)--;LABEL_NUSES(success)++;JUMP_LABEL(ops[3])=success;REG_NOTES(ops[3])=nullptr;
  rtx_insn *ret=emit_jump_insn_before(gen_match_thumb_private_return(gen_rtx_REG(SImode,LR_REGNUM)),ops[4]);
  emit_barrier_after(ret);emit_label_before(success,ops[4]);
  for (auto *i:ties) delete_insn(i);
  for (unsigned n=0;n<18;n++) if (n==0||n>=7) delete_insn(ops[n]);
  delete_insn(old_label);
  return 0;
 }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
 if (!plugin_default_version_check(version,&gcc_version)) return 1;
 for (int n=0;n<info->argc;n++) {
  const char *value=info->argv[n].value;
  if (!value||!*value) return 1;
  if (!strcmp(info->argv[n].key,"continuation")&&continuation.empty()) {continuation=value;continue;}
  if (strcmp(info->argv[n].key,"id")||!id_literal.symbol.empty()) return 1;
  char *end=nullptr;id_literal.value=strtoul(value,&end,0);
  if (end==value||*end!=','||id_literal.value>=0xffffffffUL) return 1;
  const char *name=end+1;if (!(ISALPHA(*name)||*name=='_')) return 1;
  for (const char *c=name;*c;c++) if (!(ISALNUM(*c)||*c=='_')) return 1;
  id_literal.symbol=name;
 }
 if (id_literal.symbol.empty()||continuation.empty()) return 1;
 register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);
 register_pass_info p={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};
 register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);return 0;
}
