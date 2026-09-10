// SPDX-License-Identifier: GPL-3.0-or-later
// Fold an explicit one-word entry stack allocation and store to Thumb PUSH.
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
#include "insn-constants.h"
#include "flags.h"
int plugin_is_GPL_compatible;
static tree validate(tree *node, tree, tree, int, bool *no_add) {
    if (TREE_CODE(*node) != FUNCTION_DECL) {
        error("matching_stack_word requires a function");
        *no_add = true;
    }
    return NULL_TREE;
}
static const attribute_spec contract={"matching_stack_word",0,0,true,false,false,false,validate,nullptr};
static void register_contract(void *,void *) { register_attribute(&contract); }
static const pass_data data={RTL_PASS,"stack_word",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class match_pass:public rtl_opt_pass {
public:
    match_pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_stack_word",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!TARGET_THUMB1) fatal_error(UNKNOWN_LOCATION,"stack word requires Thumb-1");
        if (flag_unwind_tables || flag_asynchronous_unwind_tables || flag_exceptions)
            fatal_error(UNKNOWN_LOCATION,"stack word does not support unwind metadata");
        rtx_insn *first=get_insns();
        while (first && (NOTE_P(first)||DEBUG_INSN_P(first))) first=NEXT_INSN(first);
        rtx_insn *second=first ? NEXT_INSN(first) : nullptr;
        while (second && (NOTE_P(second)||DEBUG_INSN_P(second))) second=NEXT_INSN(second);
        if (!first||!second||!NONJUMP_INSN_P(first)||!NONJUMP_INSN_P(second)||GET_CODE(PATTERN(first))!=SET||GET_CODE(PATTERN(second))!=SET)
            fatal_error(UNKNOWN_LOCATION,"stack word requires an entry allocation and store");
        rtx alloc=PATTERN(first),store=PATTERN(second),add=SET_SRC(alloc),mem=SET_DEST(store),reg=SET_SRC(store);
        if (!rtx_equal_p(SET_DEST(alloc),stack_pointer_rtx)||GET_CODE(add)!=PLUS||!rtx_equal_p(XEXP(add,0),stack_pointer_rtx)||!CONST_INT_P(XEXP(add,1))||INTVAL(XEXP(add,1))!=-4
            ||!MEM_P(mem)||GET_MODE(mem)!=SImode||!rtx_equal_p(XEXP(mem,0),stack_pointer_rtx)||!REG_P(reg)||GET_MODE(reg)!=SImode||REGNO(reg)>=8)
            fatal_error(UNKNOWN_LOCATION,"stack word requires one low register stored at newly allocated SP");
        rtx address=gen_rtx_PRE_MODIFY(SImode,stack_pointer_rtx,copy_rtx(add));
        rtx pushed=gen_rtx_MEM(BLKmode,address);
        MEM_VOLATILE_P(pushed)=MEM_VOLATILE_P(mem);
        rtx value=gen_rtx_UNSPEC(BLKmode,gen_rtvec(1,reg),UNSPEC_PUSH_MULT);
        rtx replacement=gen_rtx_PARALLEL(VOIDmode,gen_rtvec(1,gen_rtx_SET(pushed,value)));
        if (!validate_change(first,&PATTERN(first),replacement,false)) fatal_error(UNKNOWN_LOCATION,"stack push pattern rejected");
        RTX_FRAME_RELATED_P(first)=0;REG_NOTES(first)=nullptr;
        delete_insn(second);
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
