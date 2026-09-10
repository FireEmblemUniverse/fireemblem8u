// SPDX-License-Identifier: GPL-3.0-or-later
// Hoist equal decrements from both successors of a signed <= 1 branch.
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
#include "insn-attr.h"
int plugin_is_GPL_compatible;
namespace {
tree validate(tree *node,tree,tree,int,bool *no_add) {
    if (TREE_CODE(*node)!=FUNCTION_DECL) { error("matching_thumb_fork_decrement requires a function");*no_add=true; }
    return NULL_TREE;
}
const attribute_spec contract={"matching_thumb_fork_decrement",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) { register_attribute(&contract); }
rtx_insn *next_op(rtx_insn *i) {
    for (i=NEXT_INSN(i);i;i=NEXT_INSN(i)) {
        if (LABEL_P(i)||BARRIER_P(i)) return nullptr;
        if (NONDEBUG_INSN_P(i)) return i;
    }
    return nullptr;
}
bool decrement(rtx_insn *i,rtx reg) {
    if (!i||!NONJUMP_INSN_P(i)||GET_CODE(PATTERN(i))!=SET) return false;
    rtx p=PATTERN(i),v=SET_SRC(p);
    return rtx_equal_p(SET_DEST(p),reg)&&GET_CODE(v)==PLUS
        &&rtx_equal_p(XEXP(v,0),reg)&&CONST_INT_P(XEXP(v,1))&&INTVAL(XEXP(v,1))==-1;
}
bool empty_tie(rtx p) {
    if (GET_CODE(p)!=SET||!REG_P(SET_DEST(p))||GET_MODE(SET_DEST(p))!=SImode||REGNO(SET_DEST(p))>=13) return false;
    rtx a=SET_SRC(p);
    return GET_CODE(a)==ASM_OPERANDS&&GET_MODE(a)==SImode&&!ASM_OPERANDS_TEMPLATE(a)[0]
        &&!strcmp(ASM_OPERANDS_OUTPUT_CONSTRAINT(a),"=r")&&ASM_OPERANDS_OUTPUT_IDX(a)==0
        &&ASM_OPERANDS_INPUT_LENGTH(a)==1&&ASM_OPERANDS_LABEL_LENGTH(a)==0
        &&rtx_equal_p(ASM_OPERANDS_INPUT(a,0),SET_DEST(p))&&!strcmp(ASM_OPERANDS_INPUT_CONSTRAINT(a,0),"0");
}
const pass_data data={RTL_PASS,"thumb_fork_decrement",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_thumb_fork_decrement",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!TARGET_THUMB1||!lookup_attribute("matching_tail_transfer",DECL_ATTRIBUTES(fn->decl)))
            fatal_error(UNKNOWN_LOCATION,"Thumb fork decrement requires private Thumb tails");
        unsigned folded=0;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (!JUMP_P(i)||GET_CODE(PATTERN(i))!=SET||SET_DEST(PATTERN(i))!=pc_rtx) continue;
            rtx choice=SET_SRC(PATTERN(i));if (GET_CODE(choice)!=IF_THEN_ELSE) continue;
            rtx test=XEXP(choice,0);
            if (GET_CODE(test)!=LE||!REG_P(XEXP(test,0))||GET_MODE(XEXP(test,0))!=SImode||REGNO(XEXP(test,0))>=8
                ||!CONST_INT_P(XEXP(test,1))||INTVAL(XEXP(test,1))!=1
                ||GET_CODE(XEXP(choice,1))!=LABEL_REF||XEXP(choice,2)!=pc_rtx) continue;
            rtx reg=XEXP(test,0);rtx_insn *label=as_a<rtx_insn *>(XEXP(XEXP(choice,1),0));
            if (LABEL_NUSES(label)!=1||LABEL_PRESERVE_P(label)) continue;
            rtx_insn *fall=next_op(i),*taken=next_op(label);
            if (!decrement(fall,reg)||!decrement(taken,reg)) continue;
            // Require a short forward target, with no fallthrough into its block.
            bool forward=false,closed=false;unsigned span=0;
            rtx_insn *previous=nullptr;
            for (rtx_insn *j=NEXT_INSN(i);j;j=NEXT_INSN(j)) {
                if (j==label) { forward=true;closed=previous&&BARRIER_P(previous);break; }
                if (NONDEBUG_INSN_P(j)) {
                    if (CALL_P(j)||(asm_noperands(PATTERN(j))>=0&&!empty_tie(PATTERN(j)))) { span=1000;break; }
                    span+=get_attr_length(j);
                }
                if (!NOTE_P(j)&&!DEBUG_INSN_P(j)) previous=j;
            }
            if (!forward||!closed||span>200) continue;
            rtx replacement=gen_match_thumb_fork_decrement(copy_rtx(reg),label);
            if (!validate_change(i,&PATTERN(i),replacement,false))
                fatal_error(UNKNOWN_LOCATION,"Thumb fork decrement pattern rejected");
            REG_NOTES(i)=nullptr;delete_insn(fall);delete_insn(taken);folded++;
        }
        if (!folded) fatal_error(UNKNOWN_LOCATION,"Thumb fork decrement found no safe fork");
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
