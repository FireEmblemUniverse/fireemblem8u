// SPDX-License-Identifier: GPL-3.0-or-later
// Explicit private Thumb fallthrough with read-only access to the mixer frame.
#include <vector>
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
#include "insn-constants.h"
#include "insn-flags.h"
#include "insn-attr.h"
#include "hard-reg-set.h"
#include "regs.h"
#include "options.h"
int plugin_is_GPL_compatible;
namespace {
tree validate(tree *node,tree,tree,int,bool *no_add) {
    if (TREE_CODE(*node)!=FUNCTION_DECL) { error("matching_thumb_fallthrough requires a function");*no_add=true; }
    return NULL_TREE;
}
const attribute_spec contract={"matching_thumb_fallthrough",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) { register_attribute(&contract); }
bool mentions(rtx x,unsigned reg) {
    if (!x||LABEL_P(x)) return false;
    if (REG_P(x)) return REGNO(x)==reg;
    const char *format=GET_RTX_FORMAT(GET_CODE(x));
    for (int n=0;n<GET_RTX_LENGTH(GET_CODE(x));n++) {
        if (format[n]=='e'&&mentions(XEXP(x,n),reg)) return true;
        if (format[n]=='E') for (int k=0;k<XVECLEN(x,n);k++) if (mentions(XVECEXP(x,n,k),reg)) return true;
    }
    return false;
}

const pass_data data={RTL_PASS,"thumb_fallthrough",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_thumb_fallthrough",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!TARGET_THUMB1||frame_pointer_needed||!known_eq(get_frame_size(),0)||crtl->profile
            ||flag_unwind_tables||flag_asynchronous_unwind_tables||flag_exceptions||debug_info_level!=DINFO_LEVEL_NONE
            ||DECL_ARGUMENTS(fn->decl)||TREE_CODE(TREE_TYPE(TREE_TYPE(fn->decl)))!=VOID_TYPE)
            fatal_error(UNKNOWN_LOCATION,"Thumb fallthrough requires a zero-frame private void Thumb-1 entry without debug/unwind");
        std::vector<rtx_insn *> ops;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) if (NONDEBUG_INSN_P(i)) ops.push_back(i);
        if (ops.size()<4) fatal_error(UNKNOWN_LOCATION,"Thumb fallthrough missing complete leaf tail");
        unsigned n=ops.size();rtx_insn *spuse=ops[n-3],*lruse=ops[n-2],*ret=ops[n-1];
        rtx sp=PATTERN(spuse),lr=PATTERN(lruse),ep=PATTERN(ret);
        if (GET_CODE(sp)!=UNSPEC||XINT(sp,1)!=UNSPEC_REGISTER_USE||XVECLEN(sp,0)!=1
            ||!REG_P(XVECEXP(sp,0,0))||REGNO(XVECEXP(sp,0,0))!=SP_REGNUM
            ||GET_CODE(lr)!=USE||!REG_P(XEXP(lr,0))||REGNO(XEXP(lr,0))!=LR_REGNUM
            ||!JUMP_P(ret)||GET_CODE(ep)!=UNSPEC_VOLATILE||XINT(ep,1)!=VUNSPEC_EPILOGUE
            ||XVECLEN(ep,0)!=1||GET_CODE(XVECEXP(ep,0,0))!=RETURN)
            fatal_error(UNKNOWN_LOCATION,"Thumb fallthrough leaf epilogue changed");
        for (rtx_insn *i=get_insns();i&&i!=spuse;i=NEXT_INSN(i)) {
            if (LABEL_P(i)) fatal_error(UNKNOWN_LOCATION,"Thumb fallthrough requires a straight body");
            if (!NONDEBUG_INSN_P(i)) continue;
            rtx p=PATTERN(i);
            if (CALL_P(i)||JUMP_P(i)||asm_noperands(p)>=0||mentions(p,LR_REGNUM))
                fatal_error(UNKNOWN_LOCATION,"Thumb fallthrough rejects calls, branches, assembly or LR accesses");
            if (!mentions(p,SP_REGNUM)) continue;
            // The private frame is read-only: one aligned SI load at an offset 0..60.
            if (GET_CODE(p)!=SET||!REG_P(SET_DEST(p))||REGNO(SET_DEST(p))>=13
                ||GET_MODE(SET_DEST(p))!=SImode||!MEM_P(SET_SRC(p))||GET_MODE(SET_SRC(p))!=SImode)
                fatal_error(UNKNOWN_LOCATION,"Thumb fallthrough permits only word reads from the private frame");
            rtx address=XEXP(SET_SRC(p),0);HOST_WIDE_INT offset=0;
            if (GET_CODE(address)==PLUS&&CONST_INT_P(XEXP(address,1))) {
                offset=INTVAL(XEXP(address,1));address=XEXP(address,0);
            }
            if (!REG_P(address)||REGNO(address)!=SP_REGNUM||offset<0||offset>60||(offset&3))
                fatal_error(UNKNOWN_LOCATION,"Thumb fallthrough frame read outside aligned 64-byte contract");
        }
        delete_insn(spuse);delete_insn(lruse);delete_insn(ret);
        return 0;
    }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
    if (!plugin_default_version_check(version,&gcc_version)||info->argc) return 1;
    register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);
    register_pass_info p={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};
    register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);
    return 0;
}
