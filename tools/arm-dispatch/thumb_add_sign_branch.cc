// SPDX-License-Identifier: GPL-3.0-or-later
// Fold a private wrapped addition and nonnegative branch with addition flags.
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
    if (TREE_CODE(*node)!=FUNCTION_DECL) { error("matching_thumb_add_sign_branch requires a function");*no_add=true; }
    return NULL_TREE;
}
const attribute_spec contract={"matching_thumb_add_sign_branch",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) { register_attribute(&contract); }
bool low(rtx x) { return REG_P(x)&&GET_MODE(x)==SImode&&REGNO(x)<8; }
rtx_insn *previous_op(rtx_insn *i) {
    for (i=PREV_INSN(i);i;i=PREV_INSN(i)) {
        if (LABEL_P(i)||BARRIER_P(i)) return nullptr;
        if (NONDEBUG_INSN_P(i)) return i;
    }
    return nullptr;
}
const pass_data data={RTL_PASS,"thumb_add_sign_branch",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_thumb_add_sign_branch",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!TARGET_THUMB1||!lookup_attribute("matching_tail_transfer",DECL_ATTRIBUTES(fn->decl)))
            fatal_error(UNKNOWN_LOCATION,"Thumb add/sign requires private Thumb tails");
        unsigned folded=0;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (!JUMP_P(i)||GET_CODE(PATTERN(i))!=SET||SET_DEST(PATTERN(i))!=pc_rtx) continue;
            rtx choice=SET_SRC(PATTERN(i));if (GET_CODE(choice)!=IF_THEN_ELSE) continue;
            rtx test=XEXP(choice,0);
            if (GET_CODE(test)!=GE||!low(XEXP(test,0))||XEXP(test,1)!=const0_rtx
                ||GET_CODE(XEXP(choice,1))!=LABEL_REF||XEXP(choice,2)!=pc_rtx) continue;
            rtx_insn *add=previous_op(i);
            if (!add||!NONJUMP_INSN_P(add)||GET_CODE(PATTERN(add))!=SET) continue;
            rtx p=PATTERN(add),sum=SET_SRC(p),result=XEXP(test,0);
            if (!rtx_equal_p(SET_DEST(p),result)||GET_CODE(sum)!=PLUS
                ||!low(XEXP(sum,0))||!low(XEXP(sum,1))) continue;
            rtx_insn *label=as_a<rtx_insn *>(XEXP(XEXP(choice,1),0));
            bool forward=false;unsigned span=0;
            for (rtx_insn *j=NEXT_INSN(i);j;j=NEXT_INSN(j)) {
                if (j==label) {forward=true;break;}
                if (LABEL_P(j)||BARRIER_P(j)||CALL_P(j)) {span=1000;break;}
                if (!NONDEBUG_INSN_P(j)) continue;
                if (asm_noperands(PATTERN(j))>=0) {span=1000;break;}
                span+=get_attr_length(j);
            }
            if (!forward||span>200) continue;
            rtx replacement=gen_match_thumb_add_nonnegative_branch(copy_rtx(result),copy_rtx(XEXP(sum,0)),copy_rtx(XEXP(sum,1)),label);
            if (!validate_change(i,&PATTERN(i),replacement,false))
                fatal_error(UNKNOWN_LOCATION,"Thumb add/sign pattern rejected");
            REG_NOTES(i)=nullptr;delete_insn(add);folded++;
        }
        if (folded!=1) fatal_error(UNKNOWN_LOCATION,"Thumb add/sign requires exactly one safe sequence");
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
