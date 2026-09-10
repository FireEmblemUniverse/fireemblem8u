// SPDX-License-Identifier: GPL-3.0-or-later
// Select flag-setting ARM ADD for an equivalent negative-immediate subtract.
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
#include "insn-flags.h"
int plugin_is_GPL_compatible;
namespace {
tree validate(tree *node,tree,tree,int,bool *no_add) {
    if (TREE_CODE(*node)!=FUNCTION_DECL) {
        error("matching_add_carry requires a function"); *no_add=true;
    }
    return NULL_TREE;
}
const attribute_spec contract={"matching_add_carry",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) { register_attribute(&contract); }
bool general(rtx x) { return REG_P(x) && GET_MODE(x)==SImode && REGNO(x)<13; }
const pass_data data={RTL_PASS,"add_carry",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_add_carry",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!TARGET_ARM) fatal_error(UNKNOWN_LOCATION,"add carry requires ARM mode");
        unsigned folded=0;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (!NONJUMP_INSN_P(i)||GET_CODE(PATTERN(i))!=PARALLEL||XVECLEN(PATTERN(i),0)!=2) continue;
            rtx flags=XVECEXP(PATTERN(i),0,0),value=XVECEXP(PATTERN(i),0,1);
            if (GET_CODE(flags)!=SET||GET_CODE(value)!=SET) continue;
            rtx cc=SET_DEST(flags),cmp=SET_SRC(flags),dst=SET_DEST(value),add=SET_SRC(value);
            if (!REG_P(cc)||REGNO(cc)!=CC_REGNUM||GET_MODE(cc)!=CCmode
                ||GET_CODE(cmp)!=COMPARE||GET_CODE(add)!=PLUS||!general(dst)) continue;
            rtx base=XEXP(add,0),amount=XEXP(add,1);
            if (!general(base)||!CONST_INT_P(amount)||INTVAL(amount)<=0||INTVAL(amount)>0x7fffffff
                ||!rtx_equal_p(XEXP(cmp,0),base)||!CONST_INT_P(XEXP(cmp,1))
                ||INTVAL(XEXP(cmp,1))!=-INTVAL(amount)) continue;
            rtx_insn *branch=NEXT_INSN(i);
            while (branch&&NOTE_P(branch)) branch=NEXT_INSN(branch);
            if (!branch||!JUMP_P(branch)||GET_CODE(PATTERN(branch))!=SET||SET_DEST(PATTERN(branch))!=pc_rtx) continue;
            rtx select=SET_SRC(PATTERN(branch));
            if (GET_CODE(select)!=IF_THEN_ELSE) continue;
            rtx condition=XEXP(select,0);
            if ((GET_CODE(condition)!=LTU&&GET_CODE(condition)!=GEU)
                ||!rtx_equal_p(XEXP(condition,0),cc)||XEXP(condition,1)!=const0_rtx
                ||!find_reg_note(branch,REG_DEAD,cc)) continue;
            // CC_C represents comparison of the wrapped sum against its old
            // operand; invert the unsigned predicate to preserve BCC/BCS.
            rtx replacement=gen_addsi3_compare_op1(copy_rtx(dst),copy_rtx(base),copy_rtx(amount));
            rtx jump=copy_rtx(PATTERN(branch));
            XEXP(SET_SRC(jump),0)=gen_rtx_fmt_ee(GET_CODE(condition)==LTU ? GEU : LTU,VOIDmode,
                                              gen_rtx_REG(CC_Cmode,CC_REGNUM),const0_rtx);
            validate_change(i,&PATTERN(i),replacement,true);
            validate_change(branch,&PATTERN(branch),jump,true);
            if (!apply_change_group()) fatal_error(UNKNOWN_LOCATION,"add carry pattern rejected");
            REG_NOTES(i)=nullptr;REG_NOTES(branch)=nullptr;folded++;
        }
        if (!folded) fatal_error(UNKNOWN_LOCATION,"add carry found no eligible sequence");
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
