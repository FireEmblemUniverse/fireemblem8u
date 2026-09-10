// SPDX-License-Identifier: GPL-3.0-or-later
// Guarded short countdown loop: positive initializer, one decrement, preserved calls.
#include <set>
#include <string>
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
#include "insn-attr.h"
int plugin_is_GPL_compatible;
namespace {
std::set<std::string> preserves;
tree validate(tree *node,tree,tree,int,bool *no_add) {
    if (TREE_CODE(*node)!=FUNCTION_DECL) { error("matching_countdown requires a function");*no_add=true; }
    return NULL_TREE;
}
const attribute_spec contract={"matching_countdown",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) { register_attribute(&contract); }
rtx_insn *previous(rtx_insn *i) {
    do { i=PREV_INSN(i); } while (i && (NOTE_P(i)||DEBUG_INSN_P(i)));
    return i && NONJUMP_INSN_P(i) ? i : nullptr;
}
const pass_data data={RTL_PASS,"countdown",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_countdown",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!TARGET_THUMB1) fatal_error(UNKNOWN_LOCATION,"countdown requires Thumb-1");
        rtx_insn *branch=nullptr;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) if (JUMP_P(i) && !returnjump_p(i)) {
            if (branch) fatal_error(UNKNOWN_LOCATION,"countdown requires a single loop branch");
            branch=i;
        }
        if (!branch || GET_CODE(PATTERN(branch))!=SET || SET_DEST(PATTERN(branch))!=pc_rtx)
            fatal_error(UNKNOWN_LOCATION,"countdown requires a direct loop branch");
        rtx choice=SET_SRC(PATTERN(branch));
        if (GET_CODE(choice)!=IF_THEN_ELSE || XEXP(choice,2)!=pc_rtx || GET_CODE(XEXP(choice,1))!=LABEL_REF)
            fatal_error(UNKNOWN_LOCATION,"countdown requires conditional fallthrough");
        rtx test=XEXP(choice,0);
        if (GET_CODE(test)!=GT || XEXP(test,1)!=const0_rtx || !REG_P(XEXP(test,0))
            || GET_MODE(XEXP(test,0))!=SImode || REGNO(XEXP(test,0))>=8)
            fatal_error(UNKNOWN_LOCATION,"countdown requires low-register signed positive test");
        rtx counter=XEXP(test,0);
        rtx_insn *sub=previous(branch);
        if (!sub || GET_CODE(PATTERN(sub))!=SET || !rtx_equal_p(SET_DEST(PATTERN(sub)),counter))
            fatal_error(UNKNOWN_LOCATION,"countdown requires adjacent decrement");
        rtx sum=SET_SRC(PATTERN(sub));
        if (GET_CODE(sum)!=PLUS || !rtx_equal_p(XEXP(sum,0),counter) || !CONST_INT_P(XEXP(sum,1)) || INTVAL(XEXP(sum,1))!=-1)
            fatal_error(UNKNOWN_LOCATION,"countdown requires decrement by one");
        rtx_insn *label=as_a<rtx_insn *>(XEXP(XEXP(choice,1),0));
        bool inside=false,finished=false,initialized=false;unsigned span=0;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (i==label) {
                if (!initialized || finished) fatal_error(UNKNOWN_LOCATION,"countdown requires initialized backward loop");
                inside=true;
            }
            if (i==branch) { if (!inside) fatal_error(UNKNOWN_LOCATION,"countdown is not backward"); finished=true;inside=false; }
            if (!NONDEBUG_INSN_P(i)) continue;
            if (inside) { span+=get_attr_length(i); if (span>200) fatal_error(UNKNOWN_LOCATION,"countdown loop too large"); }
            rtx pattern=PATTERN(i);
            if (asm_noperands(pattern)>=0) fatal_error(UNKNOWN_LOCATION,"countdown rejects inline asm");
            if (CALL_P(i)) {
                if (GET_CODE(pattern)!=PARALLEL || XVECLEN(pattern,0)<1) fatal_error(UNKNOWN_LOCATION,"unsupported countdown call");
                rtx call=XVECEXP(pattern,0,0);
                if (GET_CODE(call)!=CALL || !MEM_P(XEXP(call,0)) || GET_CODE(XEXP(XEXP(call,0),0))!=SYMBOL_REF)
                    fatal_error(UNKNOWN_LOCATION,"countdown requires direct calls");
                if (!preserves.count(XSTR(XEXP(XEXP(call,0),0),0))) fatal_error(UNKNOWN_LOCATION,"countdown callee lacks counter preservation contract");
                continue; // The explicit private contract overrides generic call-clobber analysis.
            }
            if (i!=sub && reg_set_p(counter,i)) {
                if (inside || finished || initialized || GET_CODE(pattern)!=SET || !rtx_equal_p(SET_DEST(pattern),counter)
                    || !CONST_INT_P(SET_SRC(pattern)) || INTVAL(SET_SRC(pattern))<1 || INTVAL(SET_SRC(pattern))>255)
                    fatal_error(UNKNOWN_LOCATION,"countdown requires one positive byte-sized constant initializer");
                initialized=true;
            }
        }
        if (!finished || !initialized) fatal_error(UNKNOWN_LOCATION,"incomplete countdown proof");
        rtx replacement=gen_match_thumb_countdown(copy_rtx(counter),label);
        if (!validate_change(branch,&PATTERN(branch),replacement,false)) fatal_error(UNKNOWN_LOCATION,"countdown rewrite rejected");
        delete_insn(sub);REG_NOTES(branch)=nullptr;
        return 0;
    }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
    if (!plugin_default_version_check(version,&gcc_version)) return 1;
    for (int n=0;n<info->argc;n++) {
        if (std::string(info->argv[n].key)!="preserves-counter" || !info->argv[n].value || !*info->argv[n].value) return 1;
        preserves.insert(info->argv[n].value);
    }
    register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);
    register_pass_info registration={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};
    register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&registration);
    return 0;
}
