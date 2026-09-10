// SPDX-License-Identifier: GPL-3.0-or-later
// Combine x-1 and unsigned x<=1 when only an exact empty self-tie separates them.
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
    if (TREE_CODE(*node)!=FUNCTION_DECL) { error("matching_thumb_subtract_branch requires a function");*no_add=true; }
    return NULL_TREE;
}
const attribute_spec contract={"matching_thumb_subtract_branch",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) { register_attribute(&contract); }
bool low(rtx x) { return REG_P(x)&&GET_MODE(x)==SImode&&REGNO(x)<8; }
rtx_insn *previous_op(rtx_insn *i) {
    for (i=PREV_INSN(i);i;i=PREV_INSN(i)) {
        if (LABEL_P(i)||BARRIER_P(i)) return nullptr;
        if (NONDEBUG_INSN_P(i)) return i;
    }
    return nullptr;
}
bool tie(rtx p,rtx reg) {
    if (GET_CODE(p)!=SET||!rtx_equal_p(SET_DEST(p),reg)) return false;
    rtx a=SET_SRC(p);
    return GET_CODE(a)==ASM_OPERANDS&&GET_MODE(a)==SImode&&!ASM_OPERANDS_TEMPLATE(a)[0]
        &&!strcmp(ASM_OPERANDS_OUTPUT_CONSTRAINT(a),"=r")&&ASM_OPERANDS_OUTPUT_IDX(a)==0
        &&ASM_OPERANDS_INPUT_LENGTH(a)==1&&ASM_OPERANDS_LABEL_LENGTH(a)==0
        &&rtx_equal_p(ASM_OPERANDS_INPUT(a,0),reg)&&!strcmp(ASM_OPERANDS_INPUT_CONSTRAINT(a,0),"0");
}
const pass_data data={RTL_PASS,"thumb_subtract_branch",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_thumb_subtract_branch",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!TARGET_THUMB1||!lookup_attribute("matching_tail_transfer",DECL_ATTRIBUTES(fn->decl)))
            fatal_error(UNKNOWN_LOCATION,"Thumb subtract branch requires private Thumb tails");
        unsigned folded=0;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (!JUMP_P(i)||GET_CODE(PATTERN(i))!=SET||SET_DEST(PATTERN(i))!=pc_rtx) continue;
            rtx choice=SET_SRC(PATTERN(i));if (GET_CODE(choice)!=IF_THEN_ELSE) continue;
            rtx test=XEXP(choice,0);
            if (GET_CODE(test)!=LEU||!low(XEXP(test,0))||!CONST_INT_P(XEXP(test,1))||INTVAL(XEXP(test,1))!=1
                ||GET_CODE(XEXP(choice,1))!=LABEL_REF||XEXP(choice,2)!=pc_rtx) continue;
            rtx src=XEXP(test,0);rtx_insn *t=previous_op(i);if (!t) continue;
            rtx p=PATTERN(t);if (GET_CODE(p)!=SET||!low(SET_DEST(p))) continue;
            rtx dst=SET_DEST(p);if (rtx_equal_p(src,dst)||!tie(p,dst)) continue;
            rtx_insn *sub=previous_op(t);if (!sub||!NONJUMP_INSN_P(sub)||GET_CODE(PATTERN(sub))!=SET) continue;
            p=PATTERN(sub);rtx v=SET_SRC(p);
            if (!rtx_equal_p(SET_DEST(p),dst)||GET_CODE(v)!=PLUS||!rtx_equal_p(XEXP(v,0),src)
                ||!CONST_INT_P(XEXP(v,1))||INTVAL(XEXP(v,1))!=-1) continue;
            rtx_insn *label=as_a<rtx_insn *>(XEXP(XEXP(choice,1),0));
            // Conservative forward reach proof, including each intervening instruction.
            bool forward=false;unsigned span=0;
            for (rtx_insn *j=NEXT_INSN(i);j;j=NEXT_INSN(j)) {
                if (j==label) { forward=true;break; }
                if (NONDEBUG_INSN_P(j)) {
                    if (CALL_P(j)) { span=1000;break; }
                    if (asm_noperands(PATTERN(j))>=0) {
                        rtx q=PATTERN(j);
                        if (GET_CODE(q)!=SET||!low(SET_DEST(q))||!tie(q,SET_DEST(q))) { span=1000;break; }
                    } else span+=get_attr_length(j);
                }
            }
            if (!forward||span>200) continue;
            rtx replacement=gen_match_thumb_subtract_branch(copy_rtx(dst),copy_rtx(src),label);
            if (!validate_change(i,&PATTERN(i),replacement,false))
                fatal_error(UNKNOWN_LOCATION,"Thumb subtract branch pattern rejected");
            REG_NOTES(i)=nullptr;delete_insn(sub);delete_insn(t);folded++;
        }
        if (!folded) fatal_error(UNKNOWN_LOCATION,"Thumb subtract branch found no safe pair");
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
