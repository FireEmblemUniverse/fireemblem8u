// SPDX-License-Identifier: GPL-3.0-or-later
// Explicit private-ABI comparison order; preserve unsigned branch decisions.
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
int plugin_is_GPL_compatible;
static tree validate(tree *node, tree, tree, int, bool *no_add) {
    if (TREE_CODE(*node) != FUNCTION_DECL) {
        error("matching_compare_order requires a function");
        *no_add = true;
    }
    return NULL_TREE;
}
static const attribute_spec contract={"matching_compare_order",0,0,true,false,false,false,validate,nullptr};
static void register_contract(void *,void *) { register_attribute(&contract); }
static const pass_data data={RTL_PASS,"compare_order",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class match_pass:public rtl_opt_pass {
public:
    match_pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_compare_order",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!TARGET_THUMB1) fatal_error(UNKNOWN_LOCATION,"matching_compare_order requires Thumb-1");
        unsigned count=0;
        for (rtx_insn *insn=get_insns();insn;insn=NEXT_INSN(insn)) {
            if (!JUMP_P(insn)||GET_CODE(PATTERN(insn))!=SET) continue;
            rtx original=PATTERN(insn), choice=SET_SRC(original);
            if (SET_DEST(original)!=pc_rtx||GET_CODE(choice)!=IF_THEN_ELSE) continue;
            rtx cond=XEXP(choice,0);
            if (GET_RTX_LENGTH(GET_CODE(cond))!=2) continue;
            rtx lhs=XEXP(cond,0),rhs=XEXP(cond,1);
            if (!REG_P(lhs)||!REG_P(rhs)) continue;
            if (GET_MODE(lhs)!=SImode||GET_MODE(rhs)!=SImode||REGNO(lhs)>=8||REGNO(rhs)>=8||REGNO(lhs)>=REGNO(rhs))
                fatal_error(UNKNOWN_LOCATION,"compare order requires ascending distinct low SI registers");
            rtx_code reversed;
            switch (GET_CODE(cond)) {
                case LTU: reversed=GTU;break;
                case GTU: reversed=LTU;break;
                case LEU: reversed=GEU;break;
                case GEU: reversed=LEU;break;
                default: fatal_error(UNKNOWN_LOCATION,"compare order requires an unsigned inequality");
            }
            rtx replacement=copy_rtx(original),changed=XEXP(SET_SRC(replacement),0);
            PUT_CODE(changed,reversed);XEXP(changed,0)=rhs;XEXP(changed,1)=lhs;
            if (!validate_change(insn,&PATTERN(insn),replacement,false))
                fatal_error(UNKNOWN_LOCATION,"compare order pattern rejected");
            REG_NOTES(insn)=nullptr;count++;
        }
        if (!count) fatal_error(UNKNOWN_LOCATION,"compare order found no register comparison");
        return 0;
    }
};
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
    if (!plugin_default_version_check(version,&gcc_version)||info->argc) return 1;
    register_callback(info->base_name,PLUGIN_ATTRIBUTES,register_contract,nullptr);
    register_pass_info pass={new match_pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};
    register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&pass);
    return 0;
}
