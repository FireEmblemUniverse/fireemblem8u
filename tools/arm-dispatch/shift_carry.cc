// SPDX-License-Identifier: GPL-3.0-or-later
// Retain an unsigned shifted value while branching on its discarded bit.
#include <vector>
#include <map>
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
#include "insn-attr.h"
#include "hard-reg-set.h"
#include "regs.h"
#include "options.h"
int plugin_is_GPL_compatible;
namespace {
tree validate(tree *node,tree,tree,int,bool *no_add) {
    if (TREE_CODE(*node)!=FUNCTION_DECL) { error("matching_shift_carry requires a function");*no_add=true; }
    return NULL_TREE;
}
const attribute_spec contract={"matching_shift_carry",0,0,true,false,false,false,validate,nullptr};
const attribute_spec loop_contract={"matching_shift_loop_fallthrough",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) { register_attribute(&contract); register_attribute(&loop_contract); }
bool low(rtx x) { return REG_P(x)&&GET_MODE(x)==SImode&&REGNO(x)<8; }
rtx_insn *next_operation(rtx_insn *i) {
    do { i=NEXT_INSN(i); } while(i&&(NOTE_P(i)||DEBUG_INSN_P(i)));
    return i&&NONDEBUG_INSN_P(i)?i:nullptr;
}
bool tie(rtx p,rtx reg) {
    if (GET_CODE(p)!=SET||!rtx_equal_p(SET_DEST(p),reg)) return false;
    rtx a=SET_SRC(p);
    return GET_CODE(a)==ASM_OPERANDS&&GET_MODE(a)==SImode&&!ASM_OPERANDS_TEMPLATE(a)[0]
        &&!strcmp(ASM_OPERANDS_OUTPUT_CONSTRAINT(a),"=r")&&ASM_OPERANDS_OUTPUT_IDX(a)==0
        &&ASM_OPERANDS_INPUT_LENGTH(a)==1&&ASM_OPERANDS_LABEL_LENGTH(a)==0
        &&rtx_equal_p(ASM_OPERANDS_INPUT(a,0),reg)&&!strcmp(ASM_OPERANDS_INPUT_CONSTRAINT(a,0),"0");
}
bool mentions(rtx x,unsigned reg) {
    if (!x||LABEL_P(x)) return false;
    if (REG_P(x)) return REGNO(x)==reg;
    const char *format=GET_RTX_FORMAT(GET_CODE(x));
    for (int n=0;n<GET_RTX_LENGTH(GET_CODE(x));n++) {
        if (format[n]=='e'&&mentions(XEXP(x,n),reg)) return true;
        if (format[n]=='E') for (int k=0;k<XVECLEN(x,n);k++) if (mentions(XVECEXP(x,n,k),reg)) return true;
    }
    return false;
}
void lower_loop(function *fn) {
    if (!lookup_attribute("matching_shift_loop_fallthrough",DECL_ATTRIBUTES(fn->decl))) return;
    if (frame_pointer_needed||!known_eq(get_frame_size(),0)||crtl->profile||flag_unwind_tables
        ||flag_asynchronous_unwind_tables||flag_exceptions||debug_info_level!=DINFO_LEVEL_NONE
        ||DECL_ARGUMENTS(fn->decl)||TREE_CODE(TREE_TYPE(TREE_TYPE(fn->decl)))!=VOID_TYPE)
        fatal_error(UNKNOWN_LOCATION,"shift loop requires zero-frame private void entry without debug/unwind");
    std::vector<rtx_insn *> ops;std::map<rtx,unsigned> positions;unsigned position=0;
    for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
        positions[i]=position++;
        if (NONDEBUG_INSN_P(i)) ops.push_back(i);
    }
    if (ops.size()<7) fatal_error(UNKNOWN_LOCATION,"shift loop missing complete leaf tail");
    unsigned n=ops.size();rtx_insn *sub=ops[n-5],*branch=ops[n-4],*spuse=ops[n-3],*lruse=ops[n-2],*ret=ops[n-1];
    rtx sp=PATTERN(spuse),lr=PATTERN(lruse),ep=PATTERN(ret),jump=PATTERN(branch),update=PATTERN(sub);
    if (GET_CODE(sp)!=UNSPEC||XINT(sp,1)!=UNSPEC_REGISTER_USE||XVECLEN(sp,0)!=1
        ||!REG_P(XVECEXP(sp,0,0))||REGNO(XVECEXP(sp,0,0))!=SP_REGNUM
        ||GET_CODE(lr)!=USE||!REG_P(XEXP(lr,0))||REGNO(XEXP(lr,0))!=LR_REGNUM
        ||!JUMP_P(ret)||GET_CODE(ep)!=UNSPEC_VOLATILE||XINT(ep,1)!=VUNSPEC_EPILOGUE
        ||XVECLEN(ep,0)!=1||GET_CODE(XVECEXP(ep,0,0))!=RETURN)
        fatal_error(UNKNOWN_LOCATION,"shift loop leaf epilogue changed");
    if (!JUMP_P(branch)||GET_CODE(jump)!=SET||SET_DEST(jump)!=pc_rtx||GET_CODE(SET_SRC(jump))!=IF_THEN_ELSE)
        fatal_error(UNKNOWN_LOCATION,"shift loop requires terminal signed-positive branch");
    rtx choice=SET_SRC(jump),test=XEXP(choice,0);
    if (GET_CODE(test)!=GT||!low(XEXP(test,0))||XEXP(test,1)!=const0_rtx
        ||GET_CODE(XEXP(choice,1))!=LABEL_REF||XEXP(choice,2)!=pc_rtx)
        fatal_error(UNKNOWN_LOCATION,"shift loop requires low-register signed-positive test");
    rtx counter=XEXP(test,0),label=XEXP(XEXP(choice,1),0);
    if (!NONJUMP_INSN_P(sub)||GET_CODE(update)!=SET||!rtx_equal_p(SET_DEST(update),counter)
        ||GET_CODE(SET_SRC(update))!=PLUS||!rtx_equal_p(XEXP(SET_SRC(update),0),counter)
        ||!CONST_INT_P(XEXP(SET_SRC(update),1))||INTVAL(XEXP(SET_SRC(update),1))!=-1
        ||!positions.count(label)||positions[label]>=positions[sub])
        fatal_error(UNKNOWN_LOCATION,"shift loop requires backward decrement-by-one loop");
    bool bounded=false,inside=false;unsigned span=0,shifts=0;
    for (rtx_insn *i=get_insns();i&&i!=branch;i=NEXT_INSN(i)) {
        if (i==label) { if (!bounded) fatal_error(UNKNOWN_LOCATION,"shift loop counter lacks unsigned-shift bound");inside=true; }
        else if (inside&&LABEL_P(i)) fatal_error(UNKNOWN_LOCATION,"shift loop body must be one straight block");
        if (!NONDEBUG_INSN_P(i)) continue;
        rtx p=PATTERN(i);
        if (CALL_P(i)||mentions(p,SP_REGNUM)||mentions(p,LR_REGNUM)) fatal_error(UNKNOWN_LOCATION,"shift loop body touches private frame or calls");
        if (asm_noperands(p)>=0&&!(GET_CODE(p)==SET&&low(SET_DEST(p))&&tie(p,SET_DEST(p))))
            fatal_error(UNKNOWN_LOCATION,"shift loop rejects executable or untied assembly");
        if (i==sub) continue;
        if (JUMP_P(i)) {
            if (inside||recog_memoized(i)!=CODE_FOR_match_thumb_shift_carry)
                fatal_error(UNKNOWN_LOCATION,"shift loop prefix allows only proven forward shift branches");
            rtx set=XVECEXP(p,0,1),c=SET_SRC(XVECEXP(p,0,0));
            rtx target=XEXP(XEXP(c,1),0);
            if (!rtx_equal_p(SET_DEST(set),counter)||!positions.count(target)
                ||positions[target]<=positions[i]||positions[target]>positions[label])
                fatal_error(UNKNOWN_LOCATION,"shift loop shift branch bypasses initializer or loop");
            // Every prefix branch writes a nonnegative counter before its edge.
            bounded=true;shifts++;
        } else if (reg_set_p(counter,i)) {
            if (inside) fatal_error(UNKNOWN_LOCATION,"shift loop changes counter inside body");
            bounded=false;
        }
        if (inside) { span+=get_attr_length(i);if (span>200) fatal_error(UNKNOWN_LOCATION,"shift loop backward branch too far"); }
    }
    if (!inside||!shifts) fatal_error(UNKNOWN_LOCATION,"shift loop missing bounded entry");
    if (!validate_change(branch,&PATTERN(branch),gen_match_thumb_countdown(copy_rtx(counter),label),false))
        fatal_error(UNKNOWN_LOCATION,"shift loop countdown rewrite rejected");
    REG_NOTES(branch)=nullptr;
    delete_insn(sub);delete_insn(spuse);delete_insn(lruse);delete_insn(ret);
}
const pass_data data={RTL_PASS,"shift_carry",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_shift_carry",DECL_ATTRIBUTES(fn->decl))) {
            if (lookup_attribute("matching_shift_loop_fallthrough",DECL_ATTRIBUTES(fn->decl)))
                fatal_error(UNKNOWN_LOCATION,"shift loop requires the matching shift-carry contract");
            return 0;
        }
        if (!TARGET_THUMB1) fatal_error(UNKNOWN_LOCATION,"shift carry requires Thumb-1");
        unsigned folded=0;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (!NONJUMP_INSN_P(i)||GET_CODE(PATTERN(i))!=SET) continue;
            rtx copy=PATTERN(i),tmp=SET_DEST(copy),counter=SET_SRC(copy);
            if (!low(tmp)||!low(counter)||REGNO(tmp)==REGNO(counter)||global_regs[REGNO(tmp)]) continue;
            rtx_insn *shift=next_operation(i),*barrier=shift?next_operation(shift):nullptr,*branch=barrier?next_operation(barrier):nullptr;
            if (!shift||!barrier||!branch||!NONJUMP_INSN_P(shift)||!NONJUMP_INSN_P(barrier)||!JUMP_P(branch)) continue;
            rtx p=PATTERN(shift);
            if (GET_CODE(p)!=SET||!rtx_equal_p(SET_DEST(p),counter)||GET_CODE(SET_SRC(p))!=LSHIFTRT
                ||!rtx_equal_p(XEXP(SET_SRC(p),0),counter)||!CONST_INT_P(XEXP(SET_SRC(p),1))) continue;
            HOST_WIDE_INT amount=INTVAL(XEXP(SET_SRC(p),1));
            if (amount<1||amount>31||!tie(PATTERN(barrier),counter)) continue;
            rtx jump=PATTERN(branch);
            if (GET_CODE(jump)!=PARALLEL||XVECLEN(jump,0)!=2) continue;
            rtx set=XVECEXP(jump,0,0),clobber=XVECEXP(jump,0,1);
            if (GET_CODE(set)!=SET||SET_DEST(set)!=pc_rtx||GET_CODE(SET_SRC(set))!=IF_THEN_ELSE
                ||GET_CODE(clobber)!=CLOBBER||!rtx_equal_p(XEXP(clobber,0),tmp)) continue;
            rtx choice=SET_SRC(set),condition=XEXP(choice,0);
            if ((GET_CODE(condition)!=EQ&&GET_CODE(condition)!=NE)||XEXP(condition,1)!=const0_rtx
                ||GET_CODE(XEXP(condition,0))!=ZERO_EXTRACT||GET_CODE(XEXP(choice,1))!=LABEL_REF||XEXP(choice,2)!=pc_rtx) continue;
            rtx extract=XEXP(condition,0);
            if (!rtx_equal_p(XEXP(extract,0),tmp)||XEXP(extract,1)!=const1_rtx
                ||!CONST_INT_P(XEXP(extract,2))||INTVAL(XEXP(extract,2))!=amount-1
                ||!find_regno_note(branch,REG_DEAD,REGNO(tmp))||!find_regno_note(branch,REG_UNUSED,REGNO(tmp))) continue;
            rtx_insn *label=as_a<rtx_insn *>(XEXP(XEXP(choice,1),0));
            unsigned span=0;bool reached=false;
            for (rtx_insn *j=NEXT_INSN(branch);j;j=NEXT_INSN(j)) {
                if (j==label) { reached=true;break; }
                if (LABEL_P(j)||JUMP_P(j)||CALL_P(j)) break;
                if (NONDEBUG_INSN_P(j)) {
                    rtx body=PATTERN(j);
                    if (asm_noperands(body)>=0 && !(GET_CODE(body)==SET&&low(SET_DEST(body))&&tie(body,SET_DEST(body)))) break;
                    span+=get_attr_length(j);
                }
                if (span>240) break;
            }
            if (!reached) fatal_error(UNKNOWN_LOCATION,"shift carry requires a short forward single-block target");
            rtx test=copy_rtx(condition);
            XEXP(test,0)=gen_rtx_UNSPEC(SImode,gen_rtvec(2,copy_rtx(counter),GEN_INT(amount)),UNSPEC_MATCH_THUMB_SHIFT_CARRY);
            rtx replacement=gen_match_thumb_shift_carry(test,copy_rtx(counter),GEN_INT(amount),label);
            if (!validate_change(branch,&PATTERN(branch),replacement,false)) fatal_error(UNKNOWN_LOCATION,"shift carry replacement rejected");
            REG_NOTES(branch)=nullptr;
            delete_insn(i);delete_insn(shift);delete_insn(barrier);folded++;i=branch;
        }
        if (!folded) fatal_error(UNKNOWN_LOCATION,"shift carry found no eligible sequence");
        lower_loop(fn);
        return 0;
    }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
    if (!plugin_default_version_check(version,&gcc_version)||info->argc) return 1;
    register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);
    register_pass_info p={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};
    register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);
    return 0;
}
