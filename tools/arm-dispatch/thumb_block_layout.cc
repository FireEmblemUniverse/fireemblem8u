// SPDX-License-Identifier: GPL-3.0-or-later
// Reorder closed Thumb regions without changing any control-flow edge.
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
int plugin_is_GPL_compatible;
namespace {
bool tone_selection=false;
tree validate(tree *node,tree,tree,int,bool *no_add) {
    if (TREE_CODE(*node)!=FUNCTION_DECL) { error("matching_thumb_block_layout requires a function");*no_add=true; }
    return NULL_TREE;
}
const attribute_spec contract={"matching_thumb_block_layout",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) { register_attribute(&contract); }
bool unconditional(rtx_insn *i) {
    if (!i||!JUMP_P(i)||GET_CODE(PATTERN(i))!=SET||SET_DEST(PATTERN(i))!=pc_rtx) return false;
    rtx p=SET_SRC(PATTERN(i));return GET_CODE(p)==LABEL_REF||GET_CODE(p)==SYMBOL_REF;
}
rtx_insn *prev_op(rtx_insn *i) {
    for (i=PREV_INSN(i);i;i=PREV_INSN(i)) {
        if (LABEL_P(i)) return nullptr;
        if (NONDEBUG_INSN_P(i)) return i;
    }
    return nullptr;
}
rtx_insn *next_op(rtx_insn *i) {
    for (i=NEXT_INSN(i);i;i=NEXT_INSN(i)) {
        if (LABEL_P(i)) return nullptr;
        if (NONDEBUG_INSN_P(i)) return i;
    }
    return nullptr;
}
bool empty_tie(rtx p) {
    if (GET_CODE(p)!=SET||!REG_P(SET_DEST(p))||REGNO(SET_DEST(p))>=(tone_selection?12:8)) return false;
    rtx a=SET_SRC(p);
    return GET_CODE(a)==ASM_OPERANDS&&!ASM_OPERANDS_TEMPLATE(a)[0]
        &&!strcmp(ASM_OPERANDS_OUTPUT_CONSTRAINT(a),"=r")&&ASM_OPERANDS_INPUT_LENGTH(a)==1
        &&ASM_OPERANDS_LABEL_LENGTH(a)==0&&rtx_equal_p(ASM_OPERANDS_INPUT(a,0),SET_DEST(p))
        &&!strcmp(ASM_OPERANDS_INPUT_CONSTRAINT(a,0),"0");
}
// Both old boundaries must be non-fallthrough edges. Include any internal labels
// and conditional exits, and stop at the first unconditional transfer/barrier.
rtx_insn *closed_end(rtx_insn *origin,rtx_insn *label) {
    bool forward=false;
    for (rtx_insn *i=NEXT_INSN(origin);i;i=NEXT_INSN(i)) if (i==label) { forward=true;break; }
    if (!forward||!unconditional(prev_op(label))) return nullptr;
    for (rtx_insn *i=NEXT_INSN(label);i;i=NEXT_INSN(i)) {
        if (!NONDEBUG_INSN_P(i)) continue;
        if (CALL_P(i)||GET_CODE(PATTERN(i))==UNSPEC_VOLATILE) return nullptr;
        if (unconditional(i)) {
            rtx_insn *end=NEXT_INSN(i);
            return end&&BARRIER_P(end)?end:nullptr;
        }
    }
    return nullptr;
}
bool chosen_test(rtx_insn *branch) {
    if (!JUMP_P(branch)||GET_CODE(PATTERN(branch))!=SET||SET_DEST(PATTERN(branch))!=pc_rtx) return false;
    rtx choice=SET_SRC(PATTERN(branch));if (GET_CODE(choice)!=IF_THEN_ELSE) return false;
    rtx test=XEXP(choice,0);
    if (GET_CODE(test)!=NE||XEXP(test,1)!=const0_rtx||GET_CODE(XEXP(test,0))!=AND
        ||GET_CODE(XEXP(choice,1))!=LABEL_REF||XEXP(choice,2)!=pc_rtx) return false;
    rtx and_expr=XEXP(test,0);
    for (int n=0;n<2;n++) if (!REG_P(XEXP(and_expr,n))||GET_MODE(XEXP(and_expr,n))!=SImode||REGNO(XEXP(and_expr,n))>=8) return false;
    rtx_insn *fall=next_op(branch);
    if (unconditional(fall)&&GET_CODE(SET_SRC(PATTERN(fall)))==LABEL_REF) return true;
    // Select the explicit 0x80 mask by default, or the tone 0xc0/0x40
    // masks in tone-selection mode, each retained through an empty self-tie.
    rtx_insn *tie=prev_op(branch),*load=tie?prev_op(tie):nullptr;
    if (!tie||!load||!empty_tie(PATTERN(tie))||GET_CODE(PATTERN(load))!=SET) return false;
    rtx p=PATTERN(load),reg=SET_DEST(p);
    return CONST_INT_P(SET_SRC(p))&&(tone_selection ? (INTVAL(SET_SRC(p))==192||INTVAL(SET_SRC(p))==64) : INTVAL(SET_SRC(p))==128)
        &&rtx_equal_p(reg,SET_DEST(PATTERN(tie)))
        &&(rtx_equal_p(reg,XEXP(and_expr,0))||rtx_equal_p(reg,XEXP(and_expr,1)));
}
const pass_data data={RTL_PASS,"thumb_block_layout",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_thumb_block_layout",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!lookup_attribute("matching_tail_transfer",DECL_ATTRIBUTES(fn->decl))
            ||!TARGET_THUMB1||frame_pointer_needed||crtl->profile||flag_exceptions||!known_eq(get_frame_size(),0)||DECL_ARGUMENTS(fn->decl)
            ||debug_info_level!=DINFO_LEVEL_NONE||flag_unwind_tables||flag_asynchronous_unwind_tables
            ||TREE_CODE(TREE_TYPE(TREE_TYPE(fn->decl)))!=VOID_TYPE)
            fatal_error(UNKNOWN_LOCATION,"Thumb layout requires private zero-frame void Thumb code without debug/unwind");
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) if (NONDEBUG_INSN_P(i)) {
            rtx p=PATTERN(i);
            if (CALL_P(i)||GET_CODE(p)==UNSPEC_VOLATILE||(asm_noperands(p)>=0&&!empty_tie(p)))
                fatal_error(UNKNOWN_LOCATION,"Thumb layout requires resolved tails, no data and only empty ties");
        }
        unsigned moved=0,removed=0;
        bool again=true;
        while (again) {
            again=false;
            for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
                if (!chosen_test(i)) continue;
                rtx_insn *label=as_a<rtx_insn *>(XEXP(XEXP(SET_SRC(PATTERN(i)),1),0));
                if (tone_selection) {
                    // Swap a closed fallthrough arm with the following arm that
                    // falls into their shared join. Move the existing join jump
                    // to the end of the moved arm; never add/remove an edge.
                    rtx_insn *jump=prev_op(label);
                    if (!unconditional(jump)||GET_CODE(SET_SRC(PATTERN(jump)))!=LABEL_REF) continue;
                    rtx_insn *barrier=NEXT_INSN(jump);
                    if (!barrier||!BARRIER_P(barrier)) continue;
                    auto *join=as_a<rtx_insn *>(XEXP(SET_SRC(PATTERN(jump)),0));
                    bool forward=false,plain=true;
                    for (rtx_insn *j=NEXT_INSN(label);j;j=NEXT_INSN(j)) if (j==join) {forward=true;break;}
                    for (rtx_insn *j=NEXT_INSN(i);j&&j!=jump;j=NEXT_INSN(j))
                        if (LABEL_P(j)||JUMP_P(j)||CALL_P(j)) plain=false;
                    rtx_insn *last=prev_op(join);
                    if (!forward||!plain||!last||JUMP_P(last)||CALL_P(last)) continue;
                    rtx_insn *end=PREV_INSN(join);
                    rtx_code_label *fall=gen_label_rtx();emit_label_after(fall,i);
                    rtx replacement=copy_rtx(PATTERN(i));rtx choice=SET_SRC(replacement);
                    PUT_CODE(XEXP(choice,0),EQ);XEXP(choice,1)=gen_rtx_LABEL_REF(VOIDmode,fall);
                    if (!validate_change(i,&PATTERN(i),replacement,false)) fatal_error(UNKNOWN_LOCATION,"Thumb tone diamond inversion rejected");
                    LABEL_NUSES(label)--;LABEL_NUSES(fall)++;JUMP_LABEL(i)=fall;REG_NOTES(i)=nullptr;
                    reorder_insns(label,end,i);
                    reorder_insns(jump,barrier,end);
                    moved++;again=true;break;
                }
                rtx_insn *end=closed_end(i,label);if (!end) continue;
                rtx_code_label *fall=gen_label_rtx();emit_label_after(fall,i);
                rtx replacement=copy_rtx(PATTERN(i));rtx choice=SET_SRC(replacement);
                PUT_CODE(XEXP(choice,0),EQ);XEXP(choice,1)=gen_rtx_LABEL_REF(VOIDmode,fall);
                if (!validate_change(i,&PATTERN(i),replacement,false)) fatal_error(UNKNOWN_LOCATION,"Thumb layout inversion rejected");
                LABEL_NUSES(label)--;LABEL_NUSES(fall)++;JUMP_LABEL(i)=fall;REG_NOTES(i)=nullptr;
                reorder_insns(label,end,i);moved++;again=true;break;
            }
        }
        again=true;
        while (again) {
            again=false;
            for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
                if (!unconditional(i)||GET_CODE(SET_SRC(PATTERN(i)))!=LABEL_REF) continue;
                rtx_insn *label=as_a<rtx_insn *>(XEXP(SET_SRC(PATTERN(i)),0));
                bool next=false;
                for (rtx_insn *j=NEXT_INSN(i);j&&!NONDEBUG_INSN_P(j);j=NEXT_INSN(j)) if (j==label) {next=true;break;}
                rtx_insn *barrier=NEXT_INSN(i);
                if (!barrier||!BARRIER_P(barrier)) continue;
                if (!next) {
                    rtx_insn *end=closed_end(i,label);if (!end) continue;
                    reorder_insns(label,end,i);moved++;
                }
                delete_insn(i);delete_insn(barrier);removed++;again=true;break;
            }
        }
        // Canonical private-ABI encodings: low-register TST order, ADD #0
        // copies, and the equivalent strict unsigned immediate bound.
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (!NONDEBUG_INSN_P(i)||GET_CODE(PATTERN(i))!=SET) continue;
            rtx p=copy_rtx(PATTERN(i)),dst=SET_DEST(p),src=SET_SRC(p);bool changed=false;
            if (NONJUMP_INSN_P(i)&&REG_P(dst)&&GET_MODE(dst)==SImode&&REGNO(dst)<8) {
                rtx input=src;
                if (GET_CODE(src)==MINUS&&XEXP(src,1)==const0_rtx) input=XEXP(src,0);
                if (REG_P(input)&&GET_MODE(input)==SImode&&REGNO(input)<8&&REGNO(input)!=REGNO(dst)) {
                    p=gen_match_thumb_add_zero(copy_rtx(dst),copy_rtx(input));changed=true;
                }
            }
            if (JUMP_P(i)&&dst==pc_rtx&&GET_CODE(src)==IF_THEN_ELSE) {
                rtx test=XEXP(src,0);
                if ((GET_CODE(test)==EQ||GET_CODE(test)==NE)&&XEXP(test,1)==const0_rtx&&GET_CODE(XEXP(test,0))==AND) {
                    rtx x=XEXP(test,0),a=XEXP(x,0),b=XEXP(x,1);
                    if (REG_P(a)&&REG_P(b)&&GET_MODE(a)==SImode&&GET_MODE(b)==SImode&&REGNO(a)<8&&REGNO(b)<REGNO(a)) {
                        XEXP(x,0)=b;XEXP(x,1)=a;changed=true;
                    }
                }
                if (GET_CODE(test)==LEU&&REG_P(XEXP(test,0))&&REGNO(XEXP(test,0))<8&&CONST_INT_P(XEXP(test,1))) {
                    HOST_WIDE_INT bound=INTVAL(XEXP(test,1));
                    if (bound>=0&&bound<255) { PUT_CODE(test,LTU);XEXP(test,1)=GEN_INT(bound+1);changed=true; }
                }
            }
            if (changed&&!validate_change(i,&PATTERN(i),p,false)) fatal_error(UNKNOWN_LOCATION,"Thumb layout encoding normalization rejected");
        }
        if (tone_selection ? (moved!=2||removed!=0) : (!moved||!removed)) fatal_error(UNKNOWN_LOCATION,"Thumb layout found no closed-region improvement (moved %u, removed %u)",moved,removed);
        return 0;
    }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
    if (!plugin_default_version_check(version,&gcc_version)) return 1;
    for (int n=0;n<info->argc;n++) {
        if (!strcmp(info->argv[n].key,"tone-selection")&&!info->argv[n].value&&!tone_selection) tone_selection=true;
        else return 1;
    }
    register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);
    register_pass_info p={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};
    register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);
    return 0;
}
