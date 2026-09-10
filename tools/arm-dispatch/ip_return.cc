// SPDX-License-Identifier: GPL-3.0-or-later
// A restricted late frame substitution for explicitly documented private calls.
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
int plugin_is_GPL_compatible;
namespace {
std::set<std::string> callees;
tree validate(tree *node, tree, tree, int, bool *no_add) {
    if (TREE_CODE(*node)!=FUNCTION_DECL) {
        error("matching_ip_return requires a function");*no_add=true;
    }
    return NULL_TREE;
}
const attribute_spec contract={"matching_ip_return",0,0,true,false,false,false,validate,nullptr};
void register_contract(void *,void *) { register_attribute(&contract); }
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
// A single low-register read/write constraint has an empty instruction stream.
// Do not generalize this to clobbers, asm-goto, memory operands or other templates.
bool empty_register_constraint(rtx p) {
    if (GET_CODE(p)!=SET || !REG_P(SET_DEST(p)) || GET_MODE(SET_DEST(p))!=SImode
        || REGNO(SET_DEST(p))>=8) return false;
    rtx value=SET_SRC(p);
    return GET_CODE(value)==ASM_OPERANDS && !*ASM_OPERANDS_TEMPLATE(value)
        && !strcmp(ASM_OPERANDS_OUTPUT_CONSTRAINT(value),"=r")
        && ASM_OPERANDS_LABEL_LENGTH(value)==0 && ASM_OPERANDS_INPUT_LENGTH(value)==1
        && !strcmp(ASM_OPERANDS_INPUT_CONSTRAINT(value,0),"0")
        && rtx_equal_p(ASM_OPERANDS_INPUT(value,0),SET_DEST(p));
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
const pass_data data={RTL_PASS,"ip_return",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_ip_return",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!TARGET_THUMB1)
            fatal_error(UNKNOWN_LOCATION,"matching_ip_return requires Thumb-1");
        if (flag_unwind_tables || flag_asynchronous_unwind_tables || flag_exceptions || debug_info_level!=DINFO_LEVEL_NONE)
            fatal_error(UNKNOWN_LOCATION,"matching_ip_return requires unwind, exceptions and debug information disabled");
        if (global_regs[IP_REGNUM]) fatal_error(UNKNOWN_LOCATION,"matching_ip_return cannot overwrite a global r12 variable");
        if (frame_pointer_needed || !known_eq(get_frame_size(),0) || crtl->profile
            || TREE_CODE(TREE_TYPE(TREE_TYPE(fn->decl)))!=VOID_TYPE)
            fatal_error(UNKNOWN_LOCATION,"matching_ip_return requires a frameless void function");
        rtx_insn *push=nullptr,*epilogue=nullptr;unsigned calls=0;
        bool pool_barrier=false;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (epilogue && BARRIER_P(i)) pool_barrier=true;
            if (!NONDEBUG_INSN_P(i)) continue;
            rtx p=PATTERN(i);
            // Only compiler-generated pool data may follow the terminal return.
            if (epilogue && pool_barrier && GET_CODE(p)==UNSPEC_VOLATILE) {
                int kind=XINT(p,1);
                if (kind==VUNSPEC_ALIGN && XVECLEN(p,0)==1 && XVECEXP(p,0,0)==const0_rtx) continue;
                if (kind==VUNSPEC_POOL_4 && XVECLEN(p,0)==1 && CONST_INT_P(XVECEXP(p,0,0))) continue;
                if (kind==VUNSPEC_POOL_END) continue;
            }

            if (lr_push(p)) {
                if (push || calls) fatal_error(UNKNOWN_LOCATION,"matching_ip_return requires a single entry LR push");
                push=i;continue;
            }
            if (GET_CODE(p)==UNSPEC_VOLATILE && XINT(p,1)==VUNSPEC_EPILOGUE) {
                if (epilogue || !JUMP_P(i)) fatal_error(UNKNOWN_LOCATION,"matching_ip_return requires one epilogue");
                epilogue=i;continue;
            }
            if (GET_CODE(p)==UNSPEC && XINT(p,1)==UNSPEC_REGISTER_USE && XVECLEN(p,0)==1
                && reg_is(XVECEXP(p,0,0),SP_REGNUM)) continue;
            if (CALL_P(i)) {
                if (!push || epilogue || SIBLING_CALL_P(i) || GET_CODE(p)!=PARALLEL || XVECLEN(p,0)!=3)
                    fatal_error(UNKNOWN_LOCATION,"matching_ip_return requires ordinary direct calls");
                rtx call=XVECEXP(p,0,0);
                if (GET_CODE(call)!=CALL || !MEM_P(XEXP(call,0)) || GET_CODE(XEXP(XEXP(call,0),0))!=SYMBOL_REF
                    || XEXP(call,1)!=const0_rtx)
                    fatal_error(UNKNOWN_LOCATION,"matching_ip_return rejects indirect calls and stack arguments");
                rtx symbol=XEXP(XEXP(call,0),0);
                if (!callees.count(XSTR(symbol,0))) fatal_error(UNKNOWN_LOCATION,"matching_ip_return callee lacks explicit r12 preservation contract");
                if (mentions(p,IP_REGNUM) || mentions(p,SP_REGNUM)
                    || mentions(CALL_INSN_FUNCTION_USAGE(i),IP_REGNUM) || mentions(CALL_INSN_FUNCTION_USAGE(i),SP_REGNUM))
                    fatal_error(UNKNOWN_LOCATION,"matching_ip_return call uses r12 or stack arguments");
                calls++;continue;
            }
            if (!push || epilogue || JUMP_P(i) || (asm_noperands(p)>=0 && !empty_register_constraint(p)) || mentions(p,IP_REGNUM)
                || mentions(p,LR_REGNUM) || mentions(p,SP_REGNUM))
                fatal_error(UNKNOWN_LOCATION,"matching_ip_return rejects control flow, asm and stack/return-register uses");
        }
        if (!push || !epilogue || !calls) fatal_error(UNKNOWN_LOCATION,"matching_ip_return requires an LR-only call frame");
        rtx save=gen_rtx_SET(gen_rtx_REG(SImode,IP_REGNUM),gen_rtx_REG(SImode,LR_REGNUM));
        rtx leave=gen_match_thumb_private_return(gen_rtx_REG(SImode,IP_REGNUM));
        if (!validate_change(push,&PATTERN(push),save,true) || !validate_change(epilogue,&PATTERN(epilogue),leave,true)
            || !apply_change_group()) fatal_error(UNKNOWN_LOCATION,"matching_ip_return frame substitution rejected");
        RTX_FRAME_RELATED_P(push)=0;REG_NOTES(push)=nullptr;REG_NOTES(epilogue)=nullptr;
        return 0;
    }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
    if (!plugin_default_version_check(version,&gcc_version)) return 1;
    for (int n=0;n<info->argc;n++) {
        if (std::string(info->argv[n].key)!="preserves-ip" || !info->argv[n].value || !*info->argv[n].value) return 1;
        std::string symbol=info->argv[n].value;
        if (!(ISALPHA(symbol[0]) || symbol[0]=='_')) return 1;
        for (char c:symbol) if (!(ISALNUM(c)||c=='_')) return 1;
        callees.insert(symbol);
    }
    register_callback(info->base_name,PLUGIN_ATTRIBUTES,register_contract,nullptr);
    register_pass_info registration={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};
    register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&registration);
    return 0;
}
