// SPDX-License-Identifier: GPL-3.0-or-later
// Opt-in literal loads, selected before Thumb constant synthesis and pool layout.
#include <map>
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
#include "varasm.h"
int plugin_is_GPL_compatible;
namespace {
std::map<HOST_WIDE_INT,unsigned> constants;
tree validate(tree *node,tree,tree,int,bool *no_add) {
    if (TREE_CODE(*node)!=FUNCTION_DECL) { error("matching_thumb_literal_constants requires a function");*no_add=true; }
    return NULL_TREE;
}
const attribute_spec contract={"matching_thumb_literal_constants",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) { register_attribute(&contract); }
const pass_data data={RTL_PASS,"thumb_literal_constants",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_thumb_literal_constants",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!TARGET_THUMB1||!reload_completed) fatal_error(UNKNOWN_LOCATION,"Thumb literal constants require allocated Thumb-1 code");
        auto counts=constants;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (!NONJUMP_INSN_P(i)||GET_CODE(PATTERN(i))!=SET) continue;
            rtx p=PATTERN(i),dst=SET_DEST(p),src=SET_SRC(p);
            if (!CONST_INT_P(src)||!counts.count(INTVAL(src))) continue;
            if (!REG_P(dst)||GET_MODE(dst)!=SImode||REGNO(dst)>=8)
                fatal_error(UNKNOWN_LOCATION,"Thumb literal constant destination must be a low SI register");
            rtx memory=force_const_mem(SImode,src);
            if (!memory||!validate_change(i,&PATTERN(i),gen_rtx_SET(copy_rtx(dst),memory),false))
                fatal_error(UNKNOWN_LOCATION,"Thumb literal constant load rejected");
            REG_NOTES(i)=nullptr;counts[INTVAL(src)]++;
        }
        for (auto item:counts) if (!item.second)
            fatal_error(UNKNOWN_LOCATION,"Thumb literal constant was absent from the allocated code");
        return 0;
    }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
    if (!plugin_default_version_check(version,&gcc_version)) return 1;
    for (int n=0;n<info->argc;n++) {
        if (strcmp(info->argv[n].key,"value")||!info->argv[n].value) return 1;
        char *end=nullptr;long value=strtol(info->argv[n].value,&end,0);
        if (!*info->argv[n].value||*end||value<0||value>0x7fffffff||constants.count(value)) return 1;
        constants[value]=0;
    }
    if (constants.empty()) return 1;
    register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);
    register_pass_info p={new pass(g),"split2",1,PASS_POS_INSERT_BEFORE};
    register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);
    return 0;
}
