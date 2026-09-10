// SPDX-License-Identifier: GPL-3.0-or-later
// Bundle decrement, byte store and equality branch with explicit private flag semantics.
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
#include "insn-constants.h"
#include "insn-attr.h"
int plugin_is_GPL_compatible;
namespace {
tree validate(tree *node,tree,tree,int,bool *no_add) {
    if (TREE_CODE(*node)!=FUNCTION_DECL) { error("matching_thumb_store_decrement_zero requires a function");*no_add=true; }
    return NULL_TREE;
}
const attribute_spec contract={"matching_thumb_store_decrement_zero",0,0,true,false,false,false,validate,nullptr};
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
const pass_data data={RTL_PASS,"thumb_store_decrement_zero",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_thumb_store_decrement_zero",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!TARGET_THUMB1||!lookup_attribute("matching_tail_transfer",DECL_ATTRIBUTES(fn->decl)))
            fatal_error(UNKNOWN_LOCATION,"Thumb decrement/store requires private Thumb tails");
        unsigned folded=0;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (!JUMP_P(i)||GET_CODE(PATTERN(i))!=SET||SET_DEST(PATTERN(i))!=pc_rtx) continue;
            rtx choice=SET_SRC(PATTERN(i));if (GET_CODE(choice)!=IF_THEN_ELSE) continue;
            rtx test=XEXP(choice,0);
            if ((GET_CODE(test)!=EQ&&GET_CODE(test)!=NE)||!low(XEXP(test,0))||XEXP(test,1)!=const0_rtx
                ||GET_CODE(XEXP(choice,1))!=LABEL_REF||XEXP(choice,2)!=pc_rtx) continue;
            rtx reg=XEXP(test,0);rtx_insn *store=previous_op(i);if (!store||!NONJUMP_INSN_P(store)) continue;
            rtx p=PATTERN(store);if (GET_CODE(p)!=SET) continue;
            rtx memory=SET_DEST(p),value=SET_SRC(p);
            if (!MEM_P(memory)||GET_MODE(memory)!=QImode||!REG_P(value)||GET_MODE(value)!=QImode
                ||REGNO(value)!=REGNO(reg)) continue;
            rtx address=XEXP(memory,0),base=address;long offset=0;
            if (GET_CODE(address)==PLUS&&CONST_INT_P(XEXP(address,1))) {base=XEXP(address,0);offset=INTVAL(XEXP(address,1));}
            if (!low(base)||REGNO(base)==REGNO(reg)||offset<0||offset>31) continue;
            rtx_insn *t=previous_op(store);
            if (!t||!NONJUMP_INSN_P(t)) continue;
            bool has_tie=tie(PATTERN(t),reg);
            rtx_insn *sub=has_tie?previous_op(t):t;
            if (!sub||!NONJUMP_INSN_P(sub)||GET_CODE(PATTERN(sub))!=SET) continue;
            p=PATTERN(sub);rtx v=SET_SRC(p);
            if (!rtx_equal_p(SET_DEST(p),reg)||GET_CODE(v)!=PLUS||!rtx_equal_p(XEXP(v,0),reg)
                ||!CONST_INT_P(XEXP(v,1))||INTVAL(XEXP(v,1))!=-1) continue;
            rtx_insn *label=as_a<rtx_insn *>(XEXP(XEXP(choice,1),0));
            bool forward=false;unsigned span=0;
            for (rtx_insn *j=NEXT_INSN(i);j;j=NEXT_INSN(j)) {
                if (j==label) {forward=true;break;}
                if (LABEL_P(j)) span+=4;
                if (!NONDEBUG_INSN_P(j)) continue;
                if (CALL_P(j)) {span=1000;break;}
                rtx q=PATTERN(j);
                if (asm_noperands(q)>=0) {
                    if (GET_CODE(q)!=SET||!low(SET_DEST(q))||!tie(q,SET_DEST(q))) {span=1000;break;}
                } else span+=get_attr_length(j);
            }
            if (!forward||span>200) continue;
            rtx condition=gen_rtx_fmt_ee(GET_CODE(test),VOIDmode,
                gen_rtx_UNSPEC(SImode,gen_rtvec(1,copy_rtx(reg)),UNSPEC_MATCH_THUMB_BYTE_DEC),const0_rtx);
            rtx replacement=gen_match_thumb_store_decrement_zero(copy_rtx(reg),copy_rtx(memory),condition,label);
            if (!validate_change(i,&PATTERN(i),replacement,false))
                fatal_error(UNKNOWN_LOCATION,"Thumb decrement/store pattern rejected");
            REG_NOTES(i)=nullptr;delete_insn(sub);if(has_tie) delete_insn(t);delete_insn(store);folded++;
        }
        if (!folded) fatal_error(UNKNOWN_LOCATION,"Thumb decrement/store found no safe sequence");
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
