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
std::string destination;
bool read_only_lr=false,accumulator_lr=false;
tree validate(tree *node,tree,tree,int,bool *no_add) {
    if (TREE_CODE(*node)!=FUNCTION_DECL) { error("matching_arm_adjacent requires a function");*no_add=true; }
    return NULL_TREE;
}
const attribute_spec contract={"matching_arm_adjacent",0,0,true,false,false,false,validate,nullptr};
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
const pass_data data={RTL_PASS,"arm_adjacent",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_arm_adjacent",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!TARGET_ARM||frame_pointer_needed||!known_eq(get_frame_size(),0)||crtl->profile
            ||flag_unwind_tables||flag_asynchronous_unwind_tables||flag_exceptions
            ||debug_info_level!=DINFO_LEVEL_NONE||TREE_CODE(TREE_TYPE(TREE_TYPE(fn->decl)))!=VOID_TYPE)
            fatal_error(UNKNOWN_LOCATION,"ARM adjacent requires zero-local-frame void code without debug/unwind");
        if (read_only_lr && !global_regs[LR_REGNUM])
            fatal_error(UNKNOWN_LOCATION,"ARM adjacent LR input requires global register binding");
        unsigned phase=0;std::vector<rtx_insn *> discard;
        std::set<rtx> labels,targets;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (LABEL_P(i)) {
                if (phase>1) fatal_error(UNKNOWN_LOCATION,"ARM adjacent label can bypass continuation");
                labels.insert(i);
            }
            if (!NONDEBUG_INSN_P(i)) continue;
            rtx p=PATTERN(i);
            if (!phase) {
                if (!lr_push(p)) fatal_error(UNKNOWN_LOCATION,"ARM adjacent requires sole LR save");
                discard.push_back(i);phase=1;continue;
            }
            if (phase==1 && CALL_P(i)) {
                if (SIBLING_CALL_P(i)||GET_CODE(p)!=PARALLEL||XVECLEN(p,0)!=3)
                    fatal_error(UNKNOWN_LOCATION,"ARM adjacent unsupported call");
                rtx call=XVECEXP(p,0,0),use=XVECEXP(p,0,1),clobber=XVECEXP(p,0,2);
                if (GET_CODE(call)!=CALL||!MEM_P(XEXP(call,0))||GET_CODE(XEXP(XEXP(call,0),0))!=SYMBOL_REF
                    ||XEXP(call,1)!=const0_rtx||GET_CODE(use)!=USE||XEXP(use,0)!=const0_rtx
                    ||GET_CODE(clobber)!=CLOBBER||!reg_is(XEXP(clobber,0),LR_REGNUM)
                    ||mentions(CALL_INSN_FUNCTION_USAGE(i),SP_REGNUM))
                    fatal_error(UNKNOWN_LOCATION,"ARM adjacent requires direct register-argument call");
                const char *name=XSTR(XEXP(XEXP(call,0),0),0);if (*name=='*') name++;
                if (destination!=name) fatal_error(UNKNOWN_LOCATION,"ARM adjacent destination mismatch");
                discard.push_back(i);phase=2;continue;
            }
            if (phase==2) {
                if (GET_CODE(p)!=SET||!reg_is(SET_DEST(p),LR_REGNUM)||!MEM_P(SET_SRC(p))
                    ||GET_MODE(SET_SRC(p))!=SImode||GET_CODE(XEXP(SET_SRC(p),0))!=POST_INC
                    ||!reg_is(XEXP(XEXP(SET_SRC(p),0),0),SP_REGNUM))
                    fatal_error(UNKNOWN_LOCATION,"ARM adjacent requires immediate LR restore");
                discard.push_back(i);phase=3;continue;
            }
            if (phase==3) {
                if (!JUMP_P(i)||GET_CODE(p)!=SIMPLE_RETURN) fatal_error(UNKNOWN_LOCATION,"ARM adjacent requires terminal return");
                discard.push_back(i);phase=4;continue;
            }
            // An explicit fixed LR input may be read by a general-register SET.
            // Accumulator mode additionally permits LR += a general register.
            // No implicit writeback, control effects or volatile access.
            bool lr_read=read_only_lr && GET_CODE(p)==SET && REG_P(SET_DEST(p))
                && GET_MODE(SET_DEST(p))==SImode && REGNO(SET_DEST(p))<13
                && !side_effects_p(SET_SRC(p));
            bool lr_add=false;
            if (accumulator_lr && GET_CODE(p)==SET && reg_is(SET_DEST(p),LR_REGNUM)) {
                rtx src=SET_SRC(p);
                lr_add=GET_CODE(src)==PLUS && reg_is(XEXP(src,0),LR_REGNUM)
                    && REG_P(XEXP(src,1)) && GET_MODE(XEXP(src,1))==SImode
                    && REGNO(XEXP(src,1))<13;
            }
            if (phase!=1||mentions(p,SP_REGNUM)||(mentions(p,LR_REGNUM)&&!lr_read&&!lr_add)||executable_asm(p))
                fatal_error(UNKNOWN_LOCATION,"ARM adjacent unsupported frame/body operation");
            if (JUMP_P(i)) {
                if (GET_CODE(p)!=SET||SET_DEST(p)!=pc_rtx) fatal_error(UNKNOWN_LOCATION,"ARM adjacent unsupported jump");
                rtx target=SET_SRC(p);
                if (GET_CODE(target)==IF_THEN_ELSE) {
                    if (XEXP(target,2)!=pc_rtx) fatal_error(UNKNOWN_LOCATION,"ARM adjacent complex branch");
                    target=XEXP(target,1);
                }
                if (GET_CODE(target)!=LABEL_REF) fatal_error(UNKNOWN_LOCATION,"ARM adjacent nonlocal jump");
                targets.insert(XEXP(target,0));
            }
        }
        if (phase!=4) fatal_error(UNKNOWN_LOCATION,"ARM adjacent missing complete terminal frame");
        for (rtx target:targets) if (!labels.count(target)) fatal_error(UNKNOWN_LOCATION,"ARM adjacent branch bypasses continuation");
        for (rtx_insn *i:discard) delete_insn(i);
        return 0;
    }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
    if (!plugin_default_version_check(version,&gcc_version)) return 1;
    bool have_destination=false,have_lr=false;
    for (int n=0;n<info->argc;n++) {
        const char *key=info->argv[n].key,*value=info->argv[n].value;
        if (std::string(key)=="destination" && !have_destination && value && *value) {
            destination=value;have_destination=true;
        } else if (std::string(key)=="lr-input" && !have_lr && value && (std::string(value)=="read-only" || std::string(value)=="accumulator")) {
            read_only_lr=true;accumulator_lr=std::string(value)=="accumulator";have_lr=true;
        } else return 1;
    }
    if (!have_destination) return 1;
    register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);
    register_pass_info p={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};
    register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);
    return 0;
}
