// SPDX-License-Identifier: GPL-3.0-or-later
// Select flag-preserving ARM ADD #0 for explicit register-copy contracts.
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
        error("matching_copy_add_zero requires a function");
        *no_add = true;
    }
    return NULL_TREE;
}
static const attribute_spec contract={"matching_copy_add_zero",0,0,true,false,false,false,validate,nullptr};
static void register_contract(void *,void *) { register_attribute(&contract); }
static const pass_data data={RTL_PASS,"copy_add_zero",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class match_pass:public rtl_opt_pass {
public:
    match_pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_copy_add_zero",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!TARGET_ARM) fatal_error(UNKNOWN_LOCATION,"copy add zero requires ARM mode");
        unsigned copies=0;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (!NONJUMP_INSN_P(i)||GET_CODE(PATTERN(i))!=SET) continue;
            rtx set=PATTERN(i),dst=SET_DEST(set),src=SET_SRC(set);
            if (!REG_P(dst)||!REG_P(src)||GET_MODE(dst)!=SImode||GET_MODE(src)!=SImode) continue;
            if (REGNO(dst)>=13||REGNO(src)>=13||REGNO(dst)==REGNO(src))
                fatal_error(UNKNOWN_LOCATION,"copy add zero requires distinct general registers");
            rtx replacement=gen_rtx_SET(copy_rtx(dst),gen_rtx_PLUS(SImode,copy_rtx(src),const0_rtx));
            if (!validate_change(i,&PATTERN(i),replacement,false))
                fatal_error(UNKNOWN_LOCATION,"copy add zero pattern rejected");
            REG_NOTES(i)=nullptr;copies++;
        }
        if (!copies) fatal_error(UNKNOWN_LOCATION,"copy add zero found no register copies");
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
