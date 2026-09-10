// SPDX-License-Identifier: GPL-3.0-or-later
// Register the explicit contract used by the experimental Thumb frame backend.
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
        error("matching_leaf_frame requires a function");
        *no_add = true;
    }
    return NULL_TREE;
}
static const attribute_spec contract={"matching_leaf_frame",0,0,true,false,false,false,validate,nullptr};
static void register_contract(void *,void *) { register_attribute(&contract); }
static const pass_data data={RTL_PASS,"leaf_frame",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class match_pass:public rtl_opt_pass {
public:
    match_pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_leaf_frame",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!TARGET_THUMB1) fatal_error(UNKNOWN_LOCATION,"matching_leaf_frame requires Thumb-1 mode");
        for (rtx_insn *insn=get_insns();insn;insn=NEXT_INSN(insn)) {
            if (!JUMP_P(insn) || GET_CODE(PATTERN(insn))!=SET) continue;
            rtx original=PATTERN(insn), choice=SET_SRC(original);
            if (SET_DEST(original)!=pc_rtx || GET_CODE(choice)!=IF_THEN_ELSE) continue;
            rtx condition=XEXP(choice,0);
            if (GET_RTX_LENGTH(GET_CODE(condition))!=2) continue;
            rtx value=XEXP(condition,0), bound=XEXP(condition,1);
            rtx replacement=copy_rtx(original), changed=XEXP(SET_SRC(replacement),0);
            // Thumb-1 keeps comparison and branch together, with no live CC output.
            if ((GET_CODE(condition)==LEU || GET_CODE(condition)==GTU)
                && REG_P(value) && GET_MODE(value)==SImode && REGNO(value)<8
                && CONST_INT_P(bound) && INTVAL(bound)>=0 && INTVAL(bound)<=254
                && !(INTVAL(bound)&(INTVAL(bound)+1))) {
                PUT_CODE(changed,GET_CODE(condition)==LEU ? LTU : GEU);
                XEXP(changed,1)=GEN_INT(INTVAL(bound)+1);
                validate_change(insn,&PATTERN(insn),replacement,false);
            } else if ((GET_CODE(condition)==EQ || GET_CODE(condition)==NE)
                       && bound==const0_rtx && GET_CODE(value)==AND
                       && GET_MODE(value)==SImode && REG_P(XEXP(value,0)) && REG_P(XEXP(value,1))
                       && REGNO(XEXP(value,0))<8 && REGNO(XEXP(value,1))<8
                       && REGNO(XEXP(value,0))>REGNO(XEXP(value,1))) {
                // Register-only TST is commutative, including unchanged C/V bits.
                rtx and_value=XEXP(changed,0), first=XEXP(and_value,0);
                XEXP(and_value,0)=XEXP(and_value,1);XEXP(and_value,1)=first;
                validate_change(insn,&PATTERN(insn),replacement,false);
            }
        }
        return 0;
    }
};
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
    if (!plugin_default_version_check(version,&gcc_version) || info->argc) return 1;
    register_callback(info->base_name,PLUGIN_ATTRIBUTES,register_contract,nullptr);
    register_pass_info pass={new match_pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};
    register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&pass);
    return 0;
}
