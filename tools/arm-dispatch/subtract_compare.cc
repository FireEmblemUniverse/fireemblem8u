// SPDX-License-Identifier: GPL-3.0-or-later
// Combine a saved old value, subtraction and comparison into ARM SUBS.
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
#include "regs.h"
int plugin_is_GPL_compatible;
namespace {
tree validate(tree *node,tree,tree,int,bool *no_add) {
    if (TREE_CODE(*node)!=FUNCTION_DECL) {
        error("matching_subtract_compare requires a function"); *no_add=true;
    }
    return NULL_TREE;
}
const attribute_spec contract={"matching_subtract_compare",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) { register_attribute(&contract); }
bool general(rtx x) { return REG_P(x) && GET_MODE(x)==SImode && REGNO(x)<13; }
const pass_data data={RTL_PASS,"subtract_compare",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_subtract_compare",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!TARGET_ARM) fatal_error(UNKNOWN_LOCATION,"subtract compare requires ARM mode");
        unsigned folded=0;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (!NONJUMP_INSN_P(i)||GET_CODE(PATTERN(i))!=SET) continue;
            rtx copy=PATTERN(i),tmp=SET_DEST(copy),base=SET_SRC(copy);
            if (!general(tmp)||!general(base)||REGNO(tmp)==REGNO(base)||global_regs[REGNO(tmp)]) continue;
            rtx_insn *sub=NEXT_INSN(i);
            while (sub && NOTE_P(sub)) sub=NEXT_INSN(sub);
            if (!sub||!NONJUMP_INSN_P(sub)||GET_CODE(PATTERN(sub))!=SET) continue;
            rtx update=PATTERN(sub),add=SET_SRC(update);
            if (!rtx_equal_p(SET_DEST(update),base)) continue;
            rtx amount=nullptr;
            if (GET_CODE(add)==PLUS && rtx_equal_p(XEXP(add,0),base)
                && CONST_INT_P(XEXP(add,1))) {
                HOST_WIDE_INT delta=INTVAL(XEXP(add,1));
                if (delta>=0||delta < -255) continue;
                amount=GEN_INT(-delta);
            } else if (GET_CODE(add)==MINUS && rtx_equal_p(XEXP(add,0),base)
                       && general(XEXP(add,1))
                       && REGNO(XEXP(add,1))!=REGNO(base)
                       && REGNO(XEXP(add,1))!=REGNO(tmp)) {
                amount=XEXP(add,1);
            } else continue;
            rtx_insn *cmp=NEXT_INSN(sub);
            while (cmp && NOTE_P(cmp)) cmp=NEXT_INSN(cmp);
            if (!cmp||!NONJUMP_INSN_P(cmp)||GET_CODE(PATTERN(cmp))!=SET) continue;
            rtx comparison=PATTERN(cmp),cc=SET_DEST(comparison),test=SET_SRC(comparison);
            if (!REG_P(cc)||REGNO(cc)!=CC_REGNUM||GET_MODE(cc)!=CCmode
                ||GET_CODE(test)!=COMPARE||!rtx_equal_p(XEXP(test,0),tmp)
                ||!rtx_equal_p(XEXP(test,1),amount)
                ||!find_reg_note(cmp,REG_DEAD,tmp)) continue;
            // SUBS computes the exact same NZCV as comparing the OLD base to
            // amount. This holds for every 32-bit input, including overflow.
            rtx flags=gen_rtx_SET(copy_rtx(cc),gen_rtx_COMPARE(CCmode,copy_rtx(base),copy_rtx(amount)));
            rtx value=gen_rtx_SET(copy_rtx(base),gen_rtx_MINUS(SImode,copy_rtx(base),copy_rtx(amount)));
            rtx replacement=gen_rtx_PARALLEL(VOIDmode,gen_rtvec(2,flags,value));
            if (!validate_change(i,&PATTERN(i),replacement,false))
                fatal_error(UNKNOWN_LOCATION,"subtract compare pattern rejected");
            REG_NOTES(i)=nullptr;
            delete_insn(sub);delete_insn(cmp);folded++;
        }
        if (!folded) fatal_error(UNKNOWN_LOCATION,"subtract compare found no eligible sequence");
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
