// SPDX-License-Identifier: GPL-3.0-or-later
// A private register callback followed by a declared direct continuation.
#include <string>
#include <vector>
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
#include "regs.h"
#include "ggc.h"
int plugin_is_GPL_compatible;
namespace {
std::string trampoline,continuation;
bool fallthrough=false;
tree validate(tree *node,tree,tree,int,bool *no_add) {
    if (TREE_CODE(*node)!=FUNCTION_DECL) { error("matching_thumb_callback_tail requires a function");*no_add=true; }
    return NULL_TREE;
}
const attribute_spec contract={"matching_thumb_callback_tail",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) { register_attribute(&contract); }
bool reg_is(rtx x,unsigned reg) { return REG_P(x)&&GET_MODE(x)==SImode&&REGNO(x)==reg; }
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

bool call(rtx_insn *i,bool indirect) {
    if (!CALL_P(i)||SIBLING_CALL_P(i)||CALL_INSN_FUNCTION_USAGE(i)) return false;
    rtx p=PATTERN(i);if (GET_CODE(p)!=PARALLEL||XVECLEN(p,0)!=3) return false;
    rtx c=XVECEXP(p,0,0),u=XVECEXP(p,0,1),k=XVECEXP(p,0,2);
    if (GET_CODE(c)!=CALL||!MEM_P(XEXP(c,0))||XEXP(c,1)!=const0_rtx
        ||GET_CODE(u)!=USE||XEXP(u,0)!=const0_rtx||GET_CODE(k)!=CLOBBER||!reg_is(XEXP(k,0),LR_REGNUM)) return false;
    rtx target=XEXP(XEXP(c,0),0);
    return indirect?reg_is(target,3):(GET_CODE(target)==SYMBOL_REF&&continuation==XSTR(target,0));
}
const pass_data data={RTL_PASS,"thumb_callback_tail",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_thumb_callback_tail",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!TARGET_THUMB1||frame_pointer_needed||!known_eq(get_frame_size(),0)||crtl->profile
            ||flag_unwind_tables||flag_asynchronous_unwind_tables||flag_exceptions||debug_info_level!=DINFO_LEVEL_NONE
            ||!global_regs[0]||!global_regs[1]||!global_regs[2]||!global_regs[3]||DECL_ARGUMENTS(fn->decl)
            ||TREE_CODE(TREE_TYPE(TREE_TYPE(fn->decl)))!=VOID_TYPE)
            fatal_error(UNKNOWN_LOCATION,"callback tail requires private r0-r3 zero-frame void Thumb entry without debug/unwind");
        std::vector<rtx_insn *> ops;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (NONDEBUG_INSN_P(i)) ops.push_back(i);
            if (LABEL_P(i)&&(LABEL_NUSES(i)||LABEL_PRESERVE_P(i)))
                fatal_error(UNKNOWN_LOCATION,"callback tail rejects live labels");
        }
        if (ops.size()!=5||!lr_push(PATTERN(ops[0]))||!call(ops[1],true)||!call(ops[2],false))
            fatal_error(UNKNOWN_LOCATION,"callback tail requires exactly one r3 callback and one declared continuation");
        rtx sp=PATTERN(ops[3]),ep=PATTERN(ops[4]);
        if (GET_CODE(sp)!=UNSPEC||XINT(sp,1)!=UNSPEC_REGISTER_USE||XVECLEN(sp,0)!=1||!reg_is(XVECEXP(sp,0,0),SP_REGNUM)
            ||!JUMP_P(ops[4])||GET_CODE(ep)!=UNSPEC_VOLATILE||XINT(ep,1)!=VUNSPEC_EPILOGUE
            ||XVECLEN(ep,0)!=1||GET_CODE(XVECEXP(ep,0,0))!=RETURN)
            fatal_error(UNKNOWN_LOCATION,"callback tail epilogue changed");
        rtx symbol=gen_rtx_SYMBOL_REF(Pmode,ggc_strdup(trampoline.c_str()));
        rtx shared=gen_match_thumb_shared_callback(gen_rtx_REG(SImode,3),symbol,const0_rtx);
        if (!validate_change(ops[1],&PATTERN(ops[1]),shared,false))
            fatal_error(UNKNOWN_LOCATION,"callback tail shared call rejected");
        REG_NOTES(ops[1])=nullptr;
        if (!fallthrough) {
            rtx target=XEXP(XEXP(XVECEXP(PATTERN(ops[2]),0,0),0),0);
            rtx_insn *jump=emit_jump_insn_before(gen_match_thumb_tail_transfer(copy_rtx(target)),ops[2]);
            if (recog_memoized(jump)<0) fatal_error(UNKNOWN_LOCATION,"callback tail continuation rejected");
            emit_barrier_after(jump);
        }
        for (unsigned n:{0U,2U,3U,4U}) delete_insn(ops[n]);
        return 0;
    }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
    if (!plugin_default_version_check(version,&gcc_version)) return 1;
    for (int n=0;n<info->argc;n++) {
        const char *key=info->argv[n].key,*value=info->argv[n].value;
        if (!strcmp(key,"fallthrough")) {
            if (value||fallthrough) return 1;fallthrough=true;continue;
        }
        if (!value||!*value) return 1;
        if (!(ISALPHA(*value)||*value=='_')) return 1;
        for (const char *c=value;*c;c++) if (!(ISALNUM(*c)||*c=='_')) return 1;
        if (!strcmp(key,"trampoline")&&trampoline.empty()) trampoline=value;
        else if (!strcmp(key,"continuation")&&continuation.empty()) continuation=value;
        else return 1;
    }
    if (trampoline.empty()||continuation.empty()||trampoline==continuation) return 1;
    register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);
    register_pass_info p={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};
    register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);
    return 0;
}
