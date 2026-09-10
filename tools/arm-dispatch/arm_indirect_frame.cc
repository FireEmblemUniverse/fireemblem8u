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
    if (TREE_CODE(*node)!=FUNCTION_DECL) { error("matching_arm_indirect_frame requires a function");*no_add=true; }
    return NULL_TREE;
}
const attribute_spec contract={"matching_arm_indirect_frame",0,0,true,false,false,false,validate,nullptr};
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
bool frame_word_load(rtx p) {
    if (GET_CODE(p)==COND_EXEC) {
        if (GET_CODE(COND_EXEC_CODE(p))!=SET) return false;
        return frame_word_load(COND_EXEC_CODE(p));
    }
    if (GET_CODE(p)!=SET||!REG_P(SET_DEST(p))||GET_MODE(SET_DEST(p))!=SImode
        ||REGNO(SET_DEST(p))>=13||!MEM_P(SET_SRC(p))||GET_MODE(SET_SRC(p))!=SImode) return false;
    rtx address=XEXP(SET_SRC(p),0);
    if (reg_is(address,SP_REGNUM)) return true;
    return GET_CODE(address)==PLUS && reg_is(XEXP(address,0),SP_REGNUM)
        && CONST_INT_P(XEXP(address,1)) && INTVAL(XEXP(address,1))>=0
        && INTVAL(XEXP(address,1))<64 && !(INTVAL(XEXP(address,1))&3);
}
const pass_data data={RTL_PASS,"arm_indirect_frame",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_arm_indirect_frame",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!TARGET_ARM||frame_pointer_needed||!known_eq(get_frame_size(),0)||crtl->profile
            ||flag_unwind_tables||flag_asynchronous_unwind_tables||flag_exceptions
            ||debug_info_level!=DINFO_LEVEL_NONE||TREE_CODE(TREE_TYPE(TREE_TYPE(fn->decl)))!=VOID_TYPE
            ||!global_regs[0]||!global_regs[SP_REGNUM]||!global_regs[LR_REGNUM])
            fatal_error(UNKNOWN_LOCATION,"ARM indirect frame requires zero-frame void ARM code and global r0/SP/LR bindings");
        rtx_insn *push=nullptr,*restore=nullptr;
        unsigned phase=0;bool aligned=false,pool_end=false;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (LABEL_P(i) && (phase!=3 || LABEL_NUSES(i)))
                fatal_error(UNKNOWN_LOCATION,"ARM indirect frame unsupported label");
            if (!NONDEBUG_INSN_P(i)) continue;
            rtx p=PATTERN(i);
            if (!phase) {
                if (!lr_push(p)) fatal_error(UNKNOWN_LOCATION,"ARM indirect frame requires sole LR save");
                push=i;phase=1;continue;
            }
            if (phase==1 && GET_CODE(p)==SET && reg_is(SET_DEST(p),LR_REGNUM)
                && MEM_P(SET_SRC(p)) && GET_MODE(SET_SRC(p))==SImode
                && GET_CODE(XEXP(SET_SRC(p),0))==POST_INC
                && reg_is(XEXP(XEXP(SET_SRC(p),0),0),SP_REGNUM)) {
                restore=i;phase=2;continue;
            }
            if (phase==2) {
                if (!CALL_P(i)||!SIBLING_CALL_P(i)||GET_CODE(p)!=PARALLEL||XVECLEN(p,0)!=3)
                    fatal_error(UNKNOWN_LOCATION,"ARM indirect frame requires immediate sibling transfer");
                rtx call=XVECEXP(p,0,0),ret=XVECEXP(p,0,1),use=XVECEXP(p,0,2);
                if (GET_CODE(call)!=CALL||!MEM_P(XEXP(call,0))||!reg_is(XEXP(XEXP(call,0),0),0)
                    ||XEXP(call,1)!=const0_rtx||GET_CODE(ret)!=RETURN||GET_CODE(use)!=USE||XEXP(use,0)!=const0_rtx
                    ||mentions(CALL_INSN_FUNCTION_USAGE(i),SP_REGNUM))
                    fatal_error(UNKNOWN_LOCATION,"ARM indirect frame requires zero-stack-argument transfer through r0");
                phase=3;continue;
            }
            if (phase==3) {
                // PC materialization may leave an empty aligned literal-pool shell.
                if (GET_CODE(p)!=UNSPEC_VOLATILE||XVECLEN(p,0)!=1||XVECEXP(p,0,0)!=const0_rtx)
                    fatal_error(UNKNOWN_LOCATION,"ARM indirect frame executable data after transfer");
                if (XINT(p,1)==VUNSPEC_ALIGN && !aligned && !pool_end) aligned=true;
                else if (XINT(p,1)==VUNSPEC_POOL_END && aligned && !pool_end) pool_end=true;
                else fatal_error(UNKNOWN_LOCATION,"ARM indirect frame unsupported trailing pool");
                continue;
            }
            if (CALL_P(i)||JUMP_P(i)||mentions(p,PC_REGNUM)||executable_asm(p)||(mentions(p,SP_REGNUM)&&!frame_word_load(p)))
                fatal_error(UNKNOWN_LOCATION,"ARM indirect frame unsupported body/frame operation");
            if (mentions(p,LR_REGNUM)) {
                if (GET_CODE(p)!=SET||!reg_is(SET_SRC(p),LR_REGNUM)||!MEM_P(SET_DEST(p))
                    ||GET_MODE(SET_DEST(p))!=SImode||side_effects_p(XEXP(SET_DEST(p),0))
                    ||mentions(XEXP(SET_DEST(p),0),SP_REGNUM)||mentions(XEXP(SET_DEST(p),0),LR_REGNUM))
                    fatal_error(UNKNOWN_LOCATION,"ARM indirect frame permits only a word store of incoming LR");
            }
        }
        if (phase!=3||!push||!restore||aligned!=pool_end)
            fatal_error(UNKNOWN_LOCATION,"ARM indirect frame missing complete terminal contract");
        // Incoming LR now stays live through the transfer instead of being reloaded.
        rtx lr=gen_rtx_REG(SImode,LR_REGNUM);
        for (rtx_insn *i=NEXT_INSN(push);i && i!=restore;i=NEXT_INSN(i))
            if (NONDEBUG_INSN_P(i))
                if (rtx dead=find_reg_note(i,REG_DEAD,lr)) remove_note(i,dead);
        delete_insn(push);delete_insn(restore);
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
