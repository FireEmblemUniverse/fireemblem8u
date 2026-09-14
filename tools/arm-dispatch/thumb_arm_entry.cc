// SPDX-License-Identifier: GPL-3.0-or-later
// Lower a checked private tail handoff to an adjacent ARM body.
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
namespace {
void fail() { fatal_error(UNKNOWN_LOCATION,"Thumb ARM entry requires one LR-only frame and declared terminal handoff"); }
tree validate(tree *node,tree,tree args,int,bool *no_add) {
    if (TREE_CODE(*node)!=FUNCTION_DECL||!args||TREE_CODE(TREE_VALUE(args))!=STRING_CST) {
        error("matching_thumb_arm_entry requires a function and destination string"); *no_add=true;
    }
    return NULL_TREE;
}
const attribute_spec contract={"matching_thumb_arm_entry",1,1,true,false,false,false,validate,nullptr};
void attributes(void *,void *) { register_attribute(&contract); }
bool reg(rtx x,unsigned n) { return REG_P(x)&&GET_MODE(x)==SImode&&REGNO(x)==n; }
bool lr_push(rtx p) {
    if (GET_CODE(p)!=PARALLEL||XVECLEN(p,0)!=1) return false;
    p=XVECEXP(p,0,0);if (GET_CODE(p)!=SET||!MEM_P(SET_DEST(p))||GET_MODE(SET_DEST(p))!=BLKmode) return false;
    rtx a=XEXP(SET_DEST(p),0),v=SET_SRC(p);
    if (GET_CODE(a)!=PRE_MODIFY||!reg(XEXP(a,0),13)) return false;
    a=XEXP(a,1);
    return GET_CODE(a)==PLUS&&reg(XEXP(a,0),13)&&CONST_INT_P(XEXP(a,1))&&INTVAL(XEXP(a,1))==-4
        &&GET_CODE(v)==UNSPEC&&XINT(v,1)==UNSPEC_PUSH_MULT&&XVECLEN(v,0)==1&&reg(XVECEXP(v,0,0),14);
}
const pass_data data={RTL_PASS,"thumb_arm_entry",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        tree attr=lookup_attribute("matching_thumb_arm_entry",DECL_ATTRIBUTES(fn->decl));
        if (!attr) return 0;
        if (!TARGET_THUMB1||flag_unwind_tables||flag_asynchronous_unwind_tables||flag_exceptions||debug_info_level!=DINFO_LEVEL_NONE) fail();
        const char *target=TREE_STRING_POINTER(TREE_VALUE(TREE_VALUE(attr)));
        rtx_insn *ops[2];unsigned count=0;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (LABEL_P(i)) fail();
            if (INSN_P(i)) { if (count==2) fail();ops[count++]=i; }
        }
        if (count!=2||!lr_push(PATTERN(ops[0]))||!CALL_P(ops[1])||SIBLING_CALL_P(ops[1])||!find_reg_note(ops[1],REG_NORETURN,nullptr)) fail();
        rtx p=PATTERN(ops[1]);if (GET_CODE(p)!=PARALLEL||XVECLEN(p,0)!=3) fail();
        rtx c=XVECEXP(p,0,0);
        if (GET_CODE(c)!=CALL||!MEM_P(XEXP(c,0))||XEXP(c,1)!=const0_rtx) fail();
        rtx symbol=XEXP(XEXP(c,0),0);
        if (GET_CODE(symbol)!=SYMBOL_REF||strcmp(XSTR(symbol,0),target)) fail();
        p=XVECEXP(PATTERN(ops[1]),0,1);
        if (GET_CODE(p)!=USE||XEXP(p,0)!=const0_rtx) fail();
        p=XVECEXP(PATTERN(ops[1]),0,2);
        if (GET_CODE(p)!=CLOBBER||!reg(XEXP(p,0),14)) fail();
        for (rtx u=CALL_INSN_FUNCTION_USAGE(ops[1]);u;u=XEXP(u,1)) {
            p=XEXP(u,0);
            if (GET_CODE(p)!=USE||!REG_P(XEXP(p,0))||GET_MODE(XEXP(p,0))!=SImode||REGNO(XEXP(p,0))>3) fail();
        }
        rtx_insn *jump=emit_jump_insn_before(gen_match_thumb_arm_handoff(copy_rtx(symbol)),ops[1]);
        if (recog_memoized(jump)<0) fail();
        delete_insn(ops[0]);delete_insn(ops[1]);
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
