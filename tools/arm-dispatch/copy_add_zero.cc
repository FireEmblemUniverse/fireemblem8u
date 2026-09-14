// SPDX-License-Identifier: GPL-3.0-or-later
// Select ARM ADD #0 or flag-setting Thumb ADDS #0 under explicit contracts.
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
int plugin_is_GPL_compatible;
static bool preserve_thumb_high_copies=false;
static bool preserve_thumb_sp_copies=false;
static tree validate(tree *node, tree, tree, int, bool *no_add) {
    if (TREE_CODE(*node) != FUNCTION_DECL) {
        error("matching_copy_add_zero requires a function");
        *no_add = true;
    }
    return NULL_TREE;
}
static const attribute_spec contract={"matching_copy_add_zero",0,0,true,false,false,false,validate,nullptr};
static const attribute_spec thumb_contract={"matching_thumb_copy_add_zero",0,0,true,false,false,false,validate,nullptr};
static tree validate_pair(tree *node, tree, tree args, int, bool *no_add) {
    if (TREE_CODE(*node)!=FUNCTION_DECL || !args || !TREE_CHAIN(args)
        || TREE_CODE(TREE_VALUE(args))!=INTEGER_CST || TREE_CODE(TREE_VALUE(TREE_CHAIN(args)))!=INTEGER_CST
        || !tree_fits_uhwi_p(TREE_VALUE(args)) || !tree_fits_uhwi_p(TREE_VALUE(TREE_CHAIN(args)))
        || tree_to_uhwi(TREE_VALUE(args))>=8 || tree_to_uhwi(TREE_VALUE(TREE_CHAIN(args)))>=8
        || tree_to_uhwi(TREE_VALUE(args))==tree_to_uhwi(TREE_VALUE(TREE_CHAIN(args)))) {
        error("matching_thumb_copy_add_zero_pair requires distinct low destination/source registers");
        *no_add=true;
    }
    return NULL_TREE;
}
static const attribute_spec pair_contract={"matching_thumb_copy_add_zero_pair",2,2,true,false,false,false,validate_pair,nullptr};
static void register_contract(void *,void *) { register_attribute(&contract);register_attribute(&thumb_contract);register_attribute(&pair_contract); }
static const pass_data data={RTL_PASS,"copy_add_zero",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class match_pass:public rtl_opt_pass {
public:
    match_pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        bool arm=lookup_attribute("matching_copy_add_zero",DECL_ATTRIBUTES(fn->decl));
        bool thumb=lookup_attribute("matching_thumb_copy_add_zero",DECL_ATTRIBUTES(fn->decl));
        tree pair=lookup_attribute("matching_thumb_copy_add_zero_pair",DECL_ATTRIBUTES(fn->decl));
        if (!arm&&!thumb&&!pair) return 0;
        unsigned pair_dst=0,pair_src=0;
        if (pair) {
            if (arm||thumb||preserve_thumb_high_copies||preserve_thumb_sp_copies)
                fatal_error(UNKNOWN_LOCATION,"copy add zero pair requires an exclusive contract");
            tree args=TREE_VALUE(pair);
            pair_dst=tree_to_uhwi(TREE_VALUE(args));pair_src=tree_to_uhwi(TREE_VALUE(TREE_CHAIN(args)));
            thumb=true;
        }
        if (arm==thumb||(arm&&!TARGET_ARM)||(thumb&&!TARGET_THUMB1)||((preserve_thumb_high_copies||preserve_thumb_sp_copies)&&!thumb))
            fatal_error(UNKNOWN_LOCATION,"copy add zero requires one mode-specific contract");
        unsigned copies=0;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (!NONJUMP_INSN_P(i)||GET_CODE(PATTERN(i))!=SET) continue;
            rtx set=PATTERN(i),dst=SET_DEST(set),src=SET_SRC(set);
            if (!REG_P(dst)||!REG_P(src)||GET_MODE(dst)!=SImode||GET_MODE(src)!=SImode) continue;
            if (pair&&(REGNO(dst)!=pair_dst||REGNO(src)!=pair_src)) continue;
            if (thumb&&preserve_thumb_sp_copies&&REGNO(dst)<8&&REGNO(src)==13) continue;
            if (thumb&&preserve_thumb_high_copies&&REGNO(dst)<13&&REGNO(src)<13
                &&REGNO(dst)!=REGNO(src)&&(REGNO(dst)>=8||REGNO(src)>=8)) continue;
            if (REGNO(dst)>=(thumb?8:13)||REGNO(src)>=(thumb?8:13)||REGNO(dst)==REGNO(src))
                fatal_error(UNKNOWN_LOCATION,"copy add zero requires distinct general registers");
            rtx replacement=thumb?gen_match_thumb_add_zero(copy_rtx(dst),copy_rtx(src))
                :gen_rtx_SET(copy_rtx(dst),gen_rtx_PLUS(SImode,copy_rtx(src),const0_rtx));
            if (!validate_change(i,&PATTERN(i),replacement,false))
                fatal_error(UNKNOWN_LOCATION,"copy add zero pattern rejected");
            REG_NOTES(i)=nullptr;copies++;
        }
        if (!copies) fatal_error(UNKNOWN_LOCATION,"copy add zero found no register copies");
        return 0;
    }
};
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
    if (!plugin_default_version_check(version,&gcc_version)) return 1;
    for (int n=0;n<info->argc;n++) {
        if (!strcmp(info->argv[n].key,"preserve-thumb-sp-copies")&&!info->argv[n].value&&!preserve_thumb_sp_copies) { preserve_thumb_sp_copies=true;continue; }
        if (strcmp(info->argv[n].key,"preserve-thumb-high-copies")||info->argv[n].value||preserve_thumb_high_copies) return 1;
        preserve_thumb_high_copies=true;
    }
    register_callback(info->base_name,PLUGIN_ATTRIBUTES,register_contract,nullptr);
    register_pass_info pass={new match_pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};
    register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&pass);
    return 0;
}
