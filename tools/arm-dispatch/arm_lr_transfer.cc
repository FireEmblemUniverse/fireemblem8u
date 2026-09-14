// SPDX-License-Identifier: GPL-3.0-or-later
// Restricted terminal transfer conversion with explicit destination contracts.
#include <vector>
#include <set>
#include <string>
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
int plugin_is_GPL_compatible;
namespace {

tree validate(tree *node,tree,tree,int,bool *no_add) {
    if (TREE_CODE(*node)!=FUNCTION_DECL) { error("matching_arm_lr_transfer requires a function");*no_add=true; }
    return NULL_TREE;
}
const attribute_spec contract={"matching_arm_lr_transfer",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) { register_attribute(&contract); }
bool reg_is(rtx x,unsigned reg) { return REG_P(x) && GET_MODE(x)==SImode && REGNO(x)==reg; }
bool mentions(rtx x,unsigned reg) {
    if (!x) return false;
    if (REG_P(x)) return REGNO(x)==reg;
    if (LABEL_P(x)) return false;
    const char *format=GET_RTX_FORMAT(GET_CODE(x));
    for (int n=0;n<GET_RTX_LENGTH(GET_CODE(x));n++) {
        if (format[n]=='e' && mentions(XEXP(x,n),reg)) return true;
        if (format[n]=='E') for (int j=0;j<XVECLEN(x,n);j++) if (mentions(XVECEXP(x,n,j),reg)) return true;
    }
    return false;
}
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


bool executable_asm(rtx x) {
    if (!x||LABEL_P(x)) return false;
    if (GET_CODE(x)==ASM_INPUT) return true;
    if (GET_CODE(x)==ASM_OPERANDS) return *ASM_OPERANDS_TEMPLATE(x);
    const char *format=GET_RTX_FORMAT(GET_CODE(x));
    for (int n=0;n<GET_RTX_LENGTH(GET_CODE(x));n++) {
        if (format[n]=='e' && executable_asm(XEXP(x,n))) return true;
        if (format[n]=='E') for (int j=0;j<XVECLEN(x,n);j++) if (executable_asm(XVECEXP(x,n,j))) return true;
    }
    return false;
}


bool bios_asm(rtx p) {
    if (GET_CODE(p)!=PARALLEL || XVECLEN(p,0)!=7) return false;
    for (int n=0;n<2;n++) {
        rtx x=XVECEXP(p,0,n);
        if (GET_CODE(x)!=SET || !reg_is(SET_DEST(x),n)) return false;
        rtx a=SET_SRC(x);
        if (GET_CODE(a)!=ASM_OPERANDS || std::string(ASM_OPERANDS_TEMPLATE(a))!="svc #0x110000"
            || ASM_OPERANDS_INPUT_LENGTH(a)!=2 || ASM_OPERANDS_LABEL_LENGTH(a)
            || !reg_is(ASM_OPERANDS_INPUT(a,0),0) || !reg_is(ASM_OPERANDS_INPUT(a,1),1)) return false;
    }
    rtx memory=XVECEXP(p,0,2);
    if (GET_CODE(memory)!=CLOBBER || !MEM_P(XEXP(memory,0))
        || GET_CODE(XEXP(XEXP(memory,0),0))!=SCRATCH) return false;
    unsigned regs[]={CC_REGNUM,12,3,2};
    for (int n=0;n<4;n++) {
        rtx x=XVECEXP(p,0,n+3);
        if (GET_CODE(x)!=CLOBBER || !REG_P(XEXP(x,0)) || REGNO(XEXP(x,0))!=regs[n]) return false;
    }
    return true;
}
const pass_data data={RTL_PASS,"arm_lr_transfer",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_arm_lr_transfer",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!TARGET_ARM || !TARGET_INTERWORK || !arm_arch4t || arm_arch5t
            || lookup_attribute("interrupt",DECL_ATTRIBUTES(fn->decl))
            || lookup_attribute("isr",DECL_ATTRIBUTES(fn->decl))
            || !TREE_THIS_VOLATILE(fn->decl) || DECL_ARGUMENTS(fn->decl)
            || frame_pointer_needed || !known_eq(get_frame_size(),0) || crtl->profile
            || flag_unwind_tables || flag_asynchronous_unwind_tables || flag_exceptions
            || debug_info_level!=DINFO_LEVEL_NONE || !global_regs[LR_REGNUM]
            || TREE_CODE(TREE_TYPE(TREE_TYPE(fn->decl)))!=VOID_TYPE)
            fatal_error(UNKNOWN_LOCATION,"ARM LR transfer requires private noreturn ARM void frame");
        std::vector<rtx_insn *> ops;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (LABEL_P(i) && LABEL_NUSES(i)) fatal_error(UNKNOWN_LOCATION,"ARM LR transfer disallows branch labels");
            if (!NONDEBUG_INSN_P(i)) continue;
            rtx p=PATTERN(i);
            if (GET_CODE(p)==UNSPEC_VOLATILE && (XINT(p,1)==VUNSPEC_ALIGN
                || XINT(p,1)==VUNSPEC_POOL_4 || XINT(p,1)==VUNSPEC_POOL_END)) continue;
            ops.push_back(i);
        }
        if (ops.size()!=7 || !lr_push(PATTERN(ops[0])) || !bios_asm(PATTERN(ops[3])))
            fatal_error(UNKNOWN_LOCATION,"ARM LR transfer requires sole save, two inputs, BIOS, LR load/tie and terminal call");
        for (int n:{1,2,4}) {
            rtx p=PATTERN(ops[n]);unsigned reg=n==4?LR_REGNUM:n-1;
            if (GET_CODE(p)!=SET || !reg_is(SET_DEST(p),reg) || !MEM_P(SET_SRC(p))
                || GET_MODE(SET_SRC(p))!=SImode || mentions(SET_SRC(p),SP_REGNUM)
                || mentions(SET_SRC(p),LR_REGNUM) || side_effects_p(XEXP(SET_SRC(p),0)))
                fatal_error(UNKNOWN_LOCATION,"ARM LR transfer requires pure literal loads");
        }
        rtx tie=PATTERN(ops[5]);
        if (GET_CODE(tie)!=SET || !reg_is(SET_DEST(tie),LR_REGNUM)
            || GET_CODE(SET_SRC(tie))!=ASM_OPERANDS)
            fatal_error(UNKNOWN_LOCATION,"ARM LR transfer requires LR tie");
        rtx a=SET_SRC(tie);
        if (*ASM_OPERANDS_TEMPLATE(a) || ASM_OPERANDS_INPUT_LENGTH(a)!=1
            || ASM_OPERANDS_LABEL_LENGTH(a) || !reg_is(ASM_OPERANDS_INPUT(a,0),LR_REGNUM))
            fatal_error(UNKNOWN_LOCATION,"ARM LR transfer invalid LR tie");
        rtx_insn *insn=ops[6];rtx p=PATTERN(insn);
        if (!CALL_P(insn) || SIBLING_CALL_P(insn) || GET_CODE(p)!=PARALLEL || XVECLEN(p,0)!=3
            || CALL_INSN_FUNCTION_USAGE(insn)) fatal_error(UNKNOWN_LOCATION,"ARM LR transfer invalid terminal call");
        rtx call=XVECEXP(p,0,0),use=XVECEXP(p,0,1),clobber=XVECEXP(p,0,2);
        if (GET_CODE(call)!=CALL || !MEM_P(XEXP(call,0)) || !reg_is(XEXP(XEXP(call,0),0),LR_REGNUM)
            || XEXP(call,1)!=const0_rtx || GET_CODE(use)!=USE || XEXP(use,0)!=const0_rtx
            || GET_CODE(clobber)!=CLOBBER || !reg_is(XEXP(clobber,0),LR_REGNUM))
            fatal_error(UNKNOWN_LOCATION,"ARM LR transfer requires zero-argument LR call");
        rtx_insn *leave=emit_jump_insn_before(gen_simple_return(),insn);
        if (recog_memoized(leave)<0) fatal_error(UNKNOWN_LOCATION,"ARM LR transfer return pattern rejected");
        delete_insn(insn);
        delete_insn(ops[0]);
        return 0;
    }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
    if (!plugin_default_version_check(version,&gcc_version) || info->argc) return 1;
    register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);
    register_pass_info p={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};
    register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);
    return 0;
}
