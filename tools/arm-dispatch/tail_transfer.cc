// SPDX-License-Identifier: GPL-3.0-or-later
// Restricted terminal transfer conversion with explicit destination contracts.
#include <vector>
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
#include "insn-constants.h"
#include "insn-flags.h"
#include "options.h"
#include "hard-reg-set.h"
int plugin_is_GPL_compatible;
namespace {
std::set<std::string> callees;
bool raise_bound=false;
tree validate(tree *node, tree, tree, int, bool *no_add) {
    if (TREE_CODE(*node)!=FUNCTION_DECL) {
        error("matching_tail_transfer requires a function");*no_add=true;
    }
    return NULL_TREE;
}
const attribute_spec contract={"matching_tail_transfer",0,0,true,false,false,false,validate,nullptr};
void register_contract(void *,void *) { register_attribute(&contract); }
bool reg_is(rtx x,unsigned reg) { return REG_P(x) && GET_MODE(x)==SImode && REGNO(x)==reg; }
bool mentions(rtx x,unsigned reg) {
    if (!x) return false;
    if (REG_P(x)) return REGNO(x)==reg;
    if (LABEL_P(x)) return false;
    const char *format=GET_RTX_FORMAT(GET_CODE(x));
    for (int n=0;n<GET_RTX_LENGTH(GET_CODE(x));n++) {
        if (format[n]=='e' && mentions(XEXP(x,n),reg)) return true;
        if (format[n]=='E') for (int j=0;j<XVECLEN(x,n);j++) if (mentions(XVECEXP(x,n,j),reg)) return true;
    }
    return false;
}
bool lr_push(rtx p) {
    if (GET_CODE(p)!=PARALLEL || XVECLEN(p,0)!=1) return false;
    rtx set=XVECEXP(p,0,0);
    if (GET_CODE(set)!=SET || !MEM_P(SET_DEST(set))) return false;
    rtx address=XEXP(SET_DEST(set),0),src=SET_SRC(set);
    if (GET_CODE(address)!=PRE_MODIFY || !reg_is(XEXP(address,0),SP_REGNUM)
        || GET_CODE(XEXP(address,1))!=PLUS) return false;
    rtx add=XEXP(address,1);
    return reg_is(XEXP(add,0),SP_REGNUM) && CONST_INT_P(XEXP(add,1)) && INTVAL(XEXP(add,1))==-4
        && GET_CODE(src)==UNSPEC && XINT(src,1)==UNSPEC_PUSH_MULT
        && XVECLEN(src,0)==1 && reg_is(XVECEXP(src,0,0),LR_REGNUM);
}

bool sp_marker(rtx p) {
    return GET_CODE(p)==UNSPEC && XINT(p,1)==UNSPEC_REGISTER_USE && XVECLEN(p,0)==1
        && reg_is(XVECEXP(p,0,0),SP_REGNUM);
}
bool epilogue_p(rtx_insn *i) {
    return JUMP_P(i) && GET_CODE(PATTERN(i))==UNSPEC_VOLATILE && XINT(PATTERN(i),1)==VUNSPEC_EPILOGUE;
}
// Follow only zero-code notes and forward unconditional jumps to the return.
bool terminal_path(rtx_insn *call, std::set<rtx_insn *> &discard) {
    std::set<rtx_insn *> seen;
    for (rtx_insn *i=NEXT_INSN(call);i;i=NEXT_INSN(i)) {
        if (!seen.insert(i).second) return false;
        if (!NONDEBUG_INSN_P(i)) continue;
        if (epilogue_p(i)) { discard.insert(i);return true; }
        rtx p=PATTERN(i);
        if (sp_marker(p)) { discard.insert(i);continue; }
        if (!JUMP_P(i) || GET_CODE(p)!=SET || SET_DEST(p)!=pc_rtx || GET_CODE(SET_SRC(p))!=LABEL_REF) return false;
        rtx_insn *target=as_a<rtx_insn *>(XEXP(SET_SRC(p),0));
        rtx_insn *probe=NEXT_INSN(i);
        while (probe && probe!=target) probe=NEXT_INSN(probe);
        if (!probe) return false;
        discard.insert(i); i=target;
    }
    return false;
}
// Prove every original control-flow path reaches a terminal call, not a bare return.
bool all_paths_call(rtx_insn *i,std::set<rtx_insn *> path) {
    while (i && !NONDEBUG_INSN_P(i)) i=NEXT_INSN(i);
    if (!i || !path.insert(i).second) return false;
    if (CALL_P(i)) return true;
    if (epilogue_p(i)) return false;
    if (JUMP_P(i)) {
        rtx source=SET_SRC(PATTERN(i));
        if (GET_CODE(source)==LABEL_REF)
            return all_paths_call(as_a<rtx_insn *>(XEXP(source,0)),path);
        return all_paths_call(as_a<rtx_insn *>(XEXP(XEXP(source,1),0)),path)
            && all_paths_call(NEXT_INSN(i),path);
    }
    return all_paths_call(NEXT_INSN(i),path);
}
const pass_data data={RTL_PASS,"tail_transfer",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_tail_transfer",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!TARGET_THUMB1 || frame_pointer_needed || !known_eq(get_frame_size(),0) || crtl->profile
            || flag_unwind_tables || flag_asynchronous_unwind_tables || flag_exceptions
            || debug_info_level!=DINFO_LEVEL_NONE || TREE_CODE(TREE_TYPE(TREE_TYPE(fn->decl)))!=VOID_TYPE)
            fatal_error(UNKNOWN_LOCATION,"matching_tail_transfer requires frameless Thumb void code without debug/unwind");
        rtx_insn *push=nullptr; unsigned returns=0;
        std::vector<std::pair<rtx_insn *,rtx>> calls;
        std::set<rtx_insn *> discard;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (!NONDEBUG_INSN_P(i)) continue;
            rtx p=PATTERN(i);
            if (lr_push(p)) {
                if (push) fatal_error(UNKNOWN_LOCATION,"duplicate tail frame");
                push=i;discard.insert(i);continue;
            }
            if (!push) fatal_error(UNKNOWN_LOCATION,"tail transfer requires entry LR-only frame");
            if (epilogue_p(i)) { returns++;continue; }
            if (sp_marker(p)) continue;
            if (CALL_P(i)) {
                if (SIBLING_CALL_P(i) || GET_CODE(p)!=PARALLEL || XVECLEN(p,0)!=3)
                    fatal_error(UNKNOWN_LOCATION,"unsupported tail call shape");
                rtx call=XVECEXP(p,0,0);
                if (GET_CODE(call)!=CALL || !MEM_P(XEXP(call,0)) || GET_CODE(XEXP(XEXP(call,0),0))!=SYMBOL_REF
                    || XEXP(call,1)!=const0_rtx || mentions(p,SP_REGNUM)
                    || mentions(CALL_INSN_FUNCTION_USAGE(i),SP_REGNUM))
                    fatal_error(UNKNOWN_LOCATION,"tail transfer requires direct call without stack arguments");
                rtx symbol=XEXP(XEXP(call,0),0);
                if (!callees.count(XSTR(symbol,0)) || !terminal_path(i,discard))
                    fatal_error(UNKNOWN_LOCATION,"tail destination missing or call has post-call work");
                calls.push_back({i,symbol});continue;
            }
            if (asm_noperands(p)>=0 || mentions(p,SP_REGNUM) || mentions(p,LR_REGNUM))
                fatal_error(UNKNOWN_LOCATION,"tail transfer rejects asm or stack/return-register access");
            if (JUMP_P(i)) {
                if (GET_CODE(p)!=SET || SET_DEST(p)!=pc_rtx) fatal_error(UNKNOWN_LOCATION,"unsupported tail control flow");
                rtx target=SET_SRC(p);
                if (GET_CODE(target)==IF_THEN_ELSE) {
                    if (XEXP(target,2)!=pc_rtx) fatal_error(UNKNOWN_LOCATION,"unsupported conditional fallthrough");
                    target=XEXP(target,1);
                }
                if (GET_CODE(target)!=LABEL_REF) fatal_error(UNKNOWN_LOCATION,"unsupported tail branch target");
                rtx_insn *label=as_a<rtx_insn *>(XEXP(target,0)),*next=NEXT_INSN(i);
                while (next && next!=label) next=NEXT_INSN(next);
                if (!next) fatal_error(UNKNOWN_LOCATION,"tail transfer rejects backward branches");
            }
        }
        if (!push || calls.empty() || returns!=1) fatal_error(UNKNOWN_LOCATION,"tail transfer needs one return and terminal calls");
        if (!all_paths_call(NEXT_INSN(push),{})) fatal_error(UNKNOWN_LOCATION,"tail transfer has a path without a terminal call");
        // Every route into the common return must belong to a terminal call.
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) if (NONDEBUG_INSN_P(i) && epilogue_p(i) && !discard.count(i))
            fatal_error(UNKNOWN_LOCATION,"uncovered return path");
        for (auto item:calls) {
            rtx_insn *jump=emit_jump_insn_before(gen_match_thumb_tail_transfer(copy_rtx(item.second)),item.first);
            emit_barrier_after(jump);delete_insn(item.first);
        }
        for (rtx_insn *i:discard) delete_insn(i);
        if (raise_bound) for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (!JUMP_P(i)) continue;
            rtx p=PATTERN(i);
            if (GET_CODE(p)!=SET || GET_CODE(SET_SRC(p))!=IF_THEN_ELSE) continue;
            rtx test=XEXP(SET_SRC(p),0);
            if (GET_CODE(test)!=GTU || !REG_P(XEXP(test,0)) || !CONST_INT_P(XEXP(test,1))) continue;
            HOST_WIDE_INT bound=INTVAL(XEXP(test,1));
            if (bound<0 || bound>=255) continue;
            rtx replacement=copy_rtx(p);
            XEXP(SET_SRC(replacement),0)=gen_rtx_GEU(GET_MODE(test),copy_rtx(XEXP(test,0)),GEN_INT(bound+1));
            if (!validate_change(i,&PATTERN(i),replacement,false)) fatal_error(UNKNOWN_LOCATION,"tail comparison rewrite rejected");
        }
        return 0;
    }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
    if (!plugin_default_version_check(version,&gcc_version)) return 1;
    for (int n=0;n<info->argc;n++) {
        std::string key=info->argv[n].key;
        if (key=="raise-unsigned-bound" && !info->argv[n].value) { raise_bound=true;continue; }
        if (key!="destination" || !info->argv[n].value || !*info->argv[n].value) return 1;
        callees.insert(info->argv[n].value);
    }
    register_callback(info->base_name,PLUGIN_ATTRIBUTES,register_contract,nullptr);
    register_pass_info registration={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};
    register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&registration);
    return 0;
}
