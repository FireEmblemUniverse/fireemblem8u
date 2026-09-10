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
std::string destination,conditional_destination;
bool read_only_lr=false,accumulator_lr=false,masked_lr=false,early_exit=false,frame64=false,branch_transfer=false,pop_pair=false;
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
// Only the exact terminal diamond emitted at -O1 is accepted. Both arms must
// call their declared continuations and converge on the same LR restore/return.
rtx call_symbol(rtx_insn *i) {
    if (!CALL_P(i)||SIBLING_CALL_P(i)) return nullptr;
    rtx p=PATTERN(i);
    if (GET_CODE(p)!=PARALLEL||XVECLEN(p,0)!=3) return nullptr;
    rtx c=XVECEXP(p,0,0),u=XVECEXP(p,0,1),cl=XVECEXP(p,0,2);
    if (GET_CODE(c)!=CALL||!MEM_P(XEXP(c,0))||GET_CODE(XEXP(XEXP(c,0),0))!=SYMBOL_REF
        ||XEXP(c,1)!=const0_rtx||GET_CODE(u)!=USE||XEXP(u,0)!=const0_rtx
        ||GET_CODE(cl)!=CLOBBER||!reg_is(XEXP(cl,0),LR_REGNUM)
        ||mentions(CALL_INSN_FUNCTION_USAGE(i),SP_REGNUM)) return nullptr;
    return XEXP(XEXP(c,0),0);
}
bool named(rtx symbol,const std::string &name) {
    if (!symbol) return false;
    const char *text=XSTR(symbol,0); if (*text=='*') text++;
    return name==text;
}
rtx_insn *lower_diamond() {
    if (conditional_destination.empty()) return nullptr;
    std::vector<rtx_insn *> ops;
    for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) if (NONDEBUG_INSN_P(i)) ops.push_back(i);
    if (ops.size()<7) fatal_error(UNKNOWN_LOCATION,"ARM adjacent missing terminal diamond");
    unsigned n=ops.size()-6;
    if (early_exit) {
        unsigned branches=0;
        for (unsigned k=0;k<ops.size()-5;k++) if (JUMP_P(ops[k])) { n=k;branches++; }
        if (branches!=1) fatal_error(UNKNOWN_LOCATION,"ARM adjacent early exit requires one prefix branch");
    }
    unsigned tail=ops.size()-5;
    rtx_insn *branch=ops[n],*first=ops[tail],*restore=ops[tail+1],*ret=ops[tail+2],*second=ops[tail+3],*back=ops[tail+4];
    rtx p=PATTERN(branch),j=PATTERN(back);
    if (!JUMP_P(branch)||GET_CODE(p)!=SET||SET_DEST(p)!=pc_rtx||GET_CODE(SET_SRC(p))!=IF_THEN_ELSE
        ||!JUMP_P(back)||GET_CODE(j)!=SET||SET_DEST(j)!=pc_rtx||GET_CODE(SET_SRC(j))!=LABEL_REF
        ||!named(call_symbol(first),early_exit?destination:conditional_destination)||!named(call_symbol(second),early_exit?conditional_destination:destination)
        ||!JUMP_P(ret)||GET_CODE(PATTERN(ret))!=SIMPLE_RETURN)
        fatal_error(UNKNOWN_LOCATION,"ARM adjacent unsupported terminal diamond");
    rtx choice=SET_SRC(p),condition=XEXP(choice,0);
    if ((GET_CODE(condition)!=EQ && GET_CODE(condition)!=NE
         && !(early_exit&&(GET_CODE(condition)==LE||GET_CODE(condition)==LT||GET_CODE(condition)==GE||GET_CODE(condition)==GT)))||!REG_P(XEXP(condition,0))
        ||REGNO(XEXP(condition,0))!=CC_REGNUM||XEXP(condition,1)!=const0_rtx
        ||GET_CODE(XEXP(choice,1))!=LABEL_REF||XEXP(choice,2)!=pc_rtx)
        fatal_error(UNKNOWN_LOCATION,"ARM adjacent diamond requires equality branch");
    rtx alternative=XEXP(XEXP(choice,1),0),join=XEXP(SET_SRC(j),0);
    std::set<rtx> labels;
    for (rtx_insn *i=NEXT_INSN(branch);i;i=NEXT_INSN(i)) if (LABEL_P(i)) labels.insert(i);
    if (labels.size()!=2||!labels.count(alternative)||!labels.count(join))
        fatal_error(UNKNOWN_LOCATION,"ARM adjacent diamond labels changed");
    auto next_op=[](rtx_insn *i) { while (i && !NONDEBUG_INSN_P(i)) i=NEXT_INSN(i); return i; };
    if (next_op(as_a<rtx_insn *>(alternative))!=second||next_op(as_a<rtx_insn *>(join))!=restore)
        fatal_error(UNKNOWN_LOCATION,"ARM adjacent diamond targets changed");
    for (unsigned k=0;k<n;k++) if (JUMP_P(ops[k]) && (JUMP_LABEL(ops[k])==alternative||JUMP_LABEL(ops[k])==join))
        fatal_error(UNKNOWN_LOCATION,"ARM adjacent diamond bypass entry");
    rtx reversed=early_exit?copy_rtx(condition):gen_rtx_fmt_ee(GET_CODE(condition)==EQ?NE:EQ,GET_MODE(condition),copy_rtx(XEXP(condition,0)),const0_rtx);
    rtx replacement=gen_match_arm_cond_tail_transfer(copy_rtx(call_symbol(early_exit?second:first)),reversed,copy_rtx(XEXP(condition,0)));
    if (!validate_change(branch,&PATTERN(branch),replacement,false))
        fatal_error(UNKNOWN_LOCATION,"ARM adjacent conditional transfer rejected");
    JUMP_LABEL(branch)=nullptr;
    if (!early_exit) {
        PATTERN(first)=copy_rtx(PATTERN(second)); INSN_CODE(first)=-1;
        CALL_INSN_FUNCTION_USAGE(first)=CALL_INSN_FUNCTION_USAGE(second)
            ? copy_rtx(CALL_INSN_FUNCTION_USAGE(second)) : nullptr;
    }
    delete_insn(second);delete_insn(back);
    for (rtx label:labels) delete_insn(as_a<rtx_insn *>(label));
    return branch;
}
bool lr_read_set(rtx p) {
    if (GET_CODE(p)==PARALLEL) {
        for (int n=0;n<XVECLEN(p,0);n++) if (!lr_read_set(XVECEXP(p,0,n))) return false;
        return true;
    }
    return GET_CODE(p)==SET && REG_P(SET_DEST(p))
        && (REGNO(SET_DEST(p))<13 || REGNO(SET_DEST(p))==CC_REGNUM)
        && !side_effects_p(SET_SRC(p));
}
// Read-only aligned words from the explicitly declared 64-byte private frame.
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
void remove_frame_compare_repeat() {
    if (!frame64) return;
    for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
        if (!NONJUMP_INSN_P(i)) continue;
        rtx p=PATTERN(i);
        if (GET_CODE(p)!=SET||!REG_P(SET_DEST(p))||REGNO(SET_DEST(p))!=CC_REGNUM
            ||GET_CODE(SET_SRC(p))!=COMPARE) continue;
        rtx cmp=SET_SRC(p),reg=XEXP(cmp,0);
        if (!REG_P(reg)||REGNO(reg)>=13||GET_MODE(reg)!=SImode||XEXP(cmp,1)!=const0_rtx) continue;
        rtx_insn *load=NEXT_INSN(i);
        while (load && NOTE_P(load)) load=NEXT_INSN(load);
        if (!load||!NONJUMP_INSN_P(load)||GET_CODE(PATTERN(load))!=COND_EXEC||!frame_word_load(PATTERN(load))) continue;
        rtx conditional=PATTERN(load),test=COND_EXEC_TEST(conditional),body=COND_EXEC_CODE(conditional);
        if ((GET_CODE(test)!=EQ&&GET_CODE(test)!=NE)||!rtx_equal_p(XEXP(test,0),SET_DEST(p))
            ||XEXP(test,1)!=const0_rtx||REGNO(SET_DEST(body))==REGNO(reg)) continue;
        rtx_insn *repeat=NEXT_INSN(load);
        while (repeat && NOTE_P(repeat)) repeat=NEXT_INSN(repeat);
        if (repeat && NONJUMP_INSN_P(repeat) && rtx_equal_p(PATTERN(repeat),p)) {
            // The original flags now remain live through the conditional load.
            if (rtx dead=find_reg_note(load,REG_DEAD,SET_DEST(p))) remove_note(load,dead);
            delete_insn(repeat);
        }
    }
}
// Restore exactly two ordered words at the incoming private SP, then advance it.
rtx_insn *lower_pop_pair() {
    if (!pop_pair) return nullptr;
    auto next=[](rtx_insn *i) { while(i&&!NONDEBUG_INSN_P(i)) { if (LABEL_P(i)) return (rtx_insn *)nullptr; i=NEXT_INSN(i); } return i; };
    rtx_insn *push=next(get_insns());
    if (!push||!lr_push(PATTERN(push))) fatal_error(UNKNOWN_LOCATION,"ARM adjacent pop pair requires sole LR save");
    rtx_insn *first=next(NEXT_INSN(push)),*second=first?next(NEXT_INSN(first)):nullptr;
    rtx_insn *adjust=second?next(NEXT_INSN(second)):nullptr;
    if (!first||!second||!adjust||!NONJUMP_INSN_P(first)||!NONJUMP_INSN_P(second)||!NONJUMP_INSN_P(adjust))
        fatal_error(UNKNOWN_LOCATION,"ARM adjacent pop pair missing prefix");
    rtx a=PATTERN(first),b=PATTERN(second),c=PATTERN(adjust);
    auto load=[](rtx p,int offset) {
        if (GET_CODE(p)!=SET||!REG_P(SET_DEST(p))||GET_MODE(SET_DEST(p))!=SImode||REGNO(SET_DEST(p))>=13
            ||!MEM_P(SET_SRC(p))||GET_MODE(SET_SRC(p))!=SImode) return false;
        rtx address=XEXP(SET_SRC(p),0);
        if (!offset) return reg_is(address,SP_REGNUM);
        return GET_CODE(address)==PLUS&&reg_is(XEXP(address,0),SP_REGNUM)
            &&CONST_INT_P(XEXP(address,1))&&INTVAL(XEXP(address,1))==offset;
    };
    if (!load(a,0)||!load(b,4)||REGNO(SET_DEST(a))>=REGNO(SET_DEST(b))
        ||GET_CODE(c)!=SET||!reg_is(SET_DEST(c),SP_REGNUM)||GET_CODE(SET_SRC(c))!=PLUS
        ||!reg_is(XEXP(SET_SRC(c),0),SP_REGNUM)||!CONST_INT_P(XEXP(SET_SRC(c),1))||INTVAL(XEXP(SET_SRC(c),1))!=8)
        fatal_error(UNKNOWN_LOCATION,"ARM adjacent pop pair requires ascending word loads and SP plus eight");
    rtx replacement=gen_rtx_PARALLEL(VOIDmode,gen_rtvec(3,copy_rtx(c),copy_rtx(a),copy_rtx(b)));
    if (!validate_change(first,&PATTERN(first),replacement,false))
        fatal_error(UNKNOWN_LOCATION,"ARM adjacent pop pair load-multiple rejected");
    REG_NOTES(first)=nullptr;add_reg_note(first,REG_INC,gen_rtx_REG(SImode,SP_REGNUM));
    delete_insn(second);delete_insn(adjust);
    return first;
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
        if ((frame64||pop_pair) && !global_regs[SP_REGNUM])
            fatal_error(UNKNOWN_LOCATION,"ARM adjacent frame requires global SP binding");
        rtx_insn *popped=lower_pop_pair();
        remove_frame_compare_repeat();
        rtx_insn *external_branch=lower_diamond();
        unsigned phase=0;std::vector<rtx_insn *> discard;rtx_insn *terminal_call=nullptr;
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
                if (branch_transfer) terminal_call=i; else discard.push_back(i);phase=2;continue;
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
            bool lr_read=read_only_lr && lr_read_set(p);
            bool lr_add=false;
            if (accumulator_lr && GET_CODE(p)==SET && reg_is(SET_DEST(p),LR_REGNUM)) {
                rtx src=SET_SRC(p);
                lr_add=GET_CODE(src)==PLUS && reg_is(XEXP(src,0),LR_REGNUM)
                    && REG_P(XEXP(src,1)) && GET_MODE(XEXP(src,1))==SImode
                    && REGNO(XEXP(src,1))<13;
            }
            bool lr_mask=false;
            if (masked_lr && GET_CODE(p)==SET && reg_is(SET_DEST(p),LR_REGNUM)) {
                rtx src=SET_SRC(p);
                lr_mask=GET_CODE(src)==AND && reg_is(XEXP(src,0),LR_REGNUM)
                    && CONST_INT_P(XEXP(src,1)) && INTVAL(XEXP(src,1))==-1065353217;
                if (GET_CODE(src)==ASM_OPERANDS && GET_MODE(src)==SImode
                    && !ASM_OPERANDS_TEMPLATE(src)[0] && !strcmp(ASM_OPERANDS_OUTPUT_CONSTRAINT(src),"=r")
                    && ASM_OPERANDS_OUTPUT_IDX(src)==0 && ASM_OPERANDS_INPUT_LENGTH(src)==1
                    && ASM_OPERANDS_LABEL_LENGTH(src)==0 && reg_is(ASM_OPERANDS_INPUT(src,0),LR_REGNUM)
                    && !strcmp(ASM_OPERANDS_INPUT_CONSTRAINT(src,0),"0")) lr_mask=true;
            }
            if (phase!=1||(mentions(p,SP_REGNUM)&&i!=popped&&!(frame64&&frame_word_load(p)))||(mentions(p,LR_REGNUM)&&!lr_read&&!lr_add&&!lr_mask)||executable_asm(p))
                fatal_error(UNKNOWN_LOCATION,"ARM adjacent unsupported frame/body operation");
            if (JUMP_P(i)) {
                if (i==external_branch) continue;
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
        if (terminal_call) {
            rtx p=PATTERN(terminal_call);
            rtx replacement=gen_rtx_PARALLEL(VOIDmode,gen_rtvec(3,
                copy_rtx(XVECEXP(p,0,0)),ret_rtx,copy_rtx(XVECEXP(p,0,1))));
            SIBLING_CALL_P(terminal_call)=1;
            if (!validate_change(terminal_call,&PATTERN(terminal_call),replacement,false))
                fatal_error(UNKNOWN_LOCATION,"ARM adjacent terminal branch rejected");
        }
        for (rtx_insn *i:discard) delete_insn(i);
        return 0;
    }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
    if (!plugin_default_version_check(version,&gcc_version)) return 1;
    bool have_destination=false,have_lr=false,have_conditional=false,have_frame=false,have_transfer=false;
    for (int n=0;n<info->argc;n++) {
        const char *key=info->argv[n].key,*value=info->argv[n].value;
        if (std::string(key)=="destination" && !have_destination && value && *value) {
            destination=value;have_destination=true;
        } else if (std::string(key)=="lr-input" && !have_lr && value && (std::string(value)=="read-only" || std::string(value)=="accumulator" || std::string(value)=="masked")) {
            read_only_lr=true;accumulator_lr=std::string(value)=="accumulator";masked_lr=std::string(value)=="masked";have_lr=true;
        } else if (std::string(key)=="early" && !have_conditional && value && *value) {
            conditional_destination=value;have_conditional=true;early_exit=true;
        } else if (std::string(key)=="conditional" && !have_conditional && value && *value) {
            conditional_destination=value;have_conditional=true;
        } else if (std::string(key)=="transfer" && !have_transfer && value && std::string(value)=="branch") {
            branch_transfer=true;have_transfer=true;
        } else if (std::string(key)=="sp-input" && !have_frame && value && (std::string(value)=="frame64"||std::string(value)=="pop2")) {
            frame64=std::string(value)=="frame64";pop_pair=std::string(value)=="pop2";have_frame=true;
        } else return 1;
    }
    if (have_conditional && conditional_destination==destination) return 1;
    if (!have_destination) return 1;
    register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);
    register_pass_info p={new pass(g),"shorten",1,early_exit?PASS_POS_INSERT_AFTER:PASS_POS_INSERT_BEFORE};
    register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);
    return 0;
}
