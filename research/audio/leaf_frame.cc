// SPDX-License-Identifier: GPL-3.0-or-later
// Register the explicit contract used by the experimental Thumb frame backend.
#include "gcc-plugin.h"
#include "plugin-version.h"
#include "tree.h"
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
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
    if (!plugin_default_version_check(version,&gcc_version) || info->argc) return 1;
    register_callback(info->base_name,PLUGIN_ATTRIBUTES,register_contract,nullptr);
    return 0;
}
