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
    if (TREE_CODE(*node)!=FUNCTION_DECL) { error("matching_arm_noreturn_frame requires a function");*no_add=true; }
    return NULL_TREE;
}
const attribute_spec contract={"matching_arm_noreturn_frame",0,0,true,false,false,false,validate,nullptr};
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

const pass_data data={RTL_PASS,"arm_noreturn_frame",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
std::set<std::string> callees;
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_arm_noreturn_frame",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!TARGET_ARM || !TREE_THIS_VOLATILE(fn->decl) || DECL_ARGUMENTS(fn->decl)
            || frame_pointer_needed || !known_eq(get_frame_size(),0) || crtl->profile
            || flag_unwind_tables || flag_asynchronous_unwind_tables || flag_exceptions
            || debug_info_level!=DINFO_LEVEL_NONE
            || TREE_CODE(TREE_TYPE(TREE_TYPE(fn->decl)))!=VOID_TYPE)
            fatal_error(UNKNOWN_LOCATION,"ARM noreturn frame requires zero-frame noreturn void(void) ARM code without debug/unwind");
        rtx_insn *push=nullptr; unsigned calls=0;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (LABEL_P(i) && !push) fatal_error(UNKNOWN_LOCATION,"ARM noreturn frame label before entry save");
            if (!NONDEBUG_INSN_P(i)) continue;
            rtx p=PATTERN(i);
            if (!push) {
                if (!lr_push(p)) fatal_error(UNKNOWN_LOCATION,"ARM noreturn frame requires sole entry LR save");
                push=i;continue;
            }
            if (executable_asm(p) || mentions(p,SP_REGNUM)
                || (CALL_P(i) && mentions(CALL_INSN_FUNCTION_USAGE(i),SP_REGNUM)))
                fatal_error(UNKNOWN_LOCATION,"ARM noreturn frame disallows assembly and stack references");
            if (CALL_P(i)) {
                if (SIBLING_CALL_P(i) || GET_CODE(p)!=PARALLEL || XVECLEN(p,0)!=3)
                    fatal_error(UNKNOWN_LOCATION,"ARM noreturn frame requires direct zero-argument calls");
                rtx call=XVECEXP(p,0,0),use=XVECEXP(p,0,1),clobber=XVECEXP(p,0,2);
                if (GET_CODE(call)!=CALL || !MEM_P(XEXP(call,0))
                    || GET_CODE(XEXP(XEXP(call,0),0))!=SYMBOL_REF || XEXP(call,1)!=const0_rtx
                    || GET_CODE(use)!=USE || XEXP(use,0)!=const0_rtx
                    || GET_CODE(clobber)!=CLOBBER || !reg_is(XEXP(clobber,0),LR_REGNUM)
                    || CALL_INSN_FUNCTION_USAGE(i)
                    || !callees.count(XSTR(XEXP(XEXP(call,0),0),0)))
                    fatal_error(UNKNOWN_LOCATION,"ARM noreturn frame call outside explicit private callee contract");
                ++calls;continue;
            }
            if (mentions(p,LR_REGNUM)) fatal_error(UNKNOWN_LOCATION,"ARM noreturn frame disallows LR data use");
            if (JUMP_P(i)) {
                if (GET_CODE(p)!=SET || SET_DEST(p)!=pc_rtx)
                    fatal_error(UNKNOWN_LOCATION,"ARM noreturn frame disallows returns or complex jumps");
                rtx dst=SET_SRC(p);
                if (GET_CODE(dst)==IF_THEN_ELSE) {
                    if (GET_CODE(XEXP(dst,1))!=LABEL_REF || XEXP(dst,2)!=pc_rtx)
                        fatal_error(UNKNOWN_LOCATION,"ARM noreturn frame requires local conditional branches");
                } else if (GET_CODE(dst)!=LABEL_REF)
                    fatal_error(UNKNOWN_LOCATION,"ARM noreturn frame requires local direct branches");
            }
        }
        if (!push || !calls) fatal_error(UNKNOWN_LOCATION,"ARM noreturn frame missing save or calls");
        // The explicit private ABI observes no incoming LR and does not return.
        // No remaining instruction or call can access the removed stack slot.
        delete_insn(push);
        return 0;
    }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
    if (!plugin_default_version_check(version,&gcc_version)) return 1;
    for (int n=0;n<info->argc;n++) {
        if (std::string(info->argv[n].key)!="callee" || !info->argv[n].value || !*info->argv[n].value) return 1;
        callees.insert(info->argv[n].value);
    }
    if (callees.empty()) return 1;
    register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);
    register_pass_info p={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};
    register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);
    return 0;
}
