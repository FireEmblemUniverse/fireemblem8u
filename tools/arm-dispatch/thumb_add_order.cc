// SPDX-License-Identifier: GPL-3.0-or-later
// Opt-in destination-first ordering for commutative low-register additions.
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
namespace {
tree validate(tree *node,tree,tree,int,bool *no_add) {
    if (TREE_CODE(*node)!=FUNCTION_DECL) { error("matching_thumb_add_order requires a function");*no_add=true; }
    return NULL_TREE;
}
const attribute_spec contract={"matching_thumb_add_order",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) { register_attribute(&contract); }
const pass_data data={RTL_PASS,"thumb_add_order",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_thumb_add_order",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!TARGET_THUMB1||!reload_completed) fatal_error(UNKNOWN_LOCATION,"Thumb ADD ordering requires allocated Thumb-1 code");
        unsigned count=0;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (!NONJUMP_INSN_P(i)||GET_CODE(PATTERN(i))!=SET) continue;
            rtx p=PATTERN(i),dst=SET_DEST(p),src=SET_SRC(p);
            if (!REG_P(dst)||GET_MODE(dst)!=SImode||REGNO(dst)>=8||GET_CODE(src)!=PLUS) continue;
            rtx left=XEXP(src,0),right=XEXP(src,1);
            if (!REG_P(left)||GET_MODE(left)!=SImode||REGNO(left)>=8
                ||!rtx_equal_p(dst,right)||rtx_equal_p(dst,left)) continue;
            rtx replacement=gen_rtx_SET(copy_rtx(dst),gen_rtx_PLUS(SImode,copy_rtx(right),copy_rtx(left)));
            if (!validate_change(i,&PATTERN(i),replacement,false))
                fatal_error(UNKNOWN_LOCATION,"Thumb ADD operand ordering rejected");
            REG_NOTES(i)=nullptr;count++;
        }
        if (!count) fatal_error(UNKNOWN_LOCATION,"Thumb ADD ordering found no commuted low-register addition");
        return 0;
    }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
    if (!plugin_default_version_check(version,&gcc_version)) return 1;
    if (info->argc) return 1;
    register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);
    register_pass_info p={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};
    register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);
    return 0;
}
