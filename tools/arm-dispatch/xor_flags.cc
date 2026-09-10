// SPDX-License-Identifier: GPL-3.0-or-later
// Experimental ARM-only XOR/zero-test fusion. Not used in production.
#include "gcc-plugin.h"
#include "plugin-version.h"
#include "context.h"
#include "backend.h"
#include "insn-config.h"
#include "memmodel.h"
#include "tree-pass.h"
#include "rtl.h"
#include "emit-rtl.h"
#include "recog.h"
#include "tm.h"
#include "insn-constants.h"
int plugin_is_GPL_compatible;
namespace {
const pass_data data = { RTL_PASS, "xor_flags", OPTGROUP_NONE, TV_NONE, 0,0,0,0,0 };
class pass : public rtl_opt_pass {
public:
    pass(gcc::context *ctxt):rtl_opt_pass(data,ctxt) {}
    unsigned int execute(function *) override {
        if (!TARGET_ARM) return 0;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (!NONDEBUG_INSN_P(i) || RTX_FRAME_RELATED_P(i) || GET_CODE(PATTERN(i))!=SET) continue;
            rtx assignment=PATTERN(i),dst=SET_DEST(assignment),value=SET_SRC(assignment);
            if (!REG_P(dst) || GET_MODE(dst)!=SImode || REGNO(dst)>=13 || GET_CODE(value)!=XOR) continue;
            rtx_insn *barrier=next_nonnote_nondebug_insn(i);
            if (!barrier || !INSN_P(barrier) || GET_CODE(PATTERN(barrier))!=SET) continue;
            rtx identity=PATTERN(barrier),a=SET_SRC(identity);
            if (!rtx_equal_p(SET_DEST(identity),dst) || GET_CODE(a)!=ASM_OPERANDS
                || ASM_OPERANDS_TEMPLATE(a)[0]!='\0' || strcmp(ASM_OPERANDS_OUTPUT_CONSTRAINT(a),"=r")
                || ASM_OPERANDS_INPUT_LENGTH(a)!=1 || !rtx_equal_p(ASM_OPERANDS_INPUT(a,0),dst)
                || strcmp(ASM_OPERANDS_INPUT_CONSTRAINT(a,0),"0")) continue;
            rtx_insn *test=next_nonnote_nondebug_insn(barrier);
            if (!test || !INSN_P(test) || GET_CODE(PATTERN(test))!=SET) continue;
            rtx cc=SET_DEST(PATTERN(test)),cmp=SET_SRC(PATTERN(test));
            if (!REG_P(cc) || REGNO(cc)!=CC_REGNUM || GET_CODE(cmp)!=COMPARE
                || !rtx_equal_p(XEXP(cmp,0),dst) || XEXP(cmp,1)!=const0_rtx) continue;
            rtx_insn *branch=next_nonnote_nondebug_insn(test);
            if (!branch || !JUMP_P(branch) || GET_CODE(PATTERN(branch))!=SET || SET_DEST(PATTERN(branch))!=pc_rtx) continue;
            rtx choice=SET_SRC(PATTERN(branch));
            if (GET_CODE(choice)!=IF_THEN_ELSE) continue;
            rtx condition=XEXP(choice,0);
            if ((GET_CODE(condition)!=EQ && GET_CODE(condition)!=NE)
                || !rtx_equal_p(XEXP(condition,0),cc) || XEXP(condition,1)!=const0_rtx
                || !find_regno_note(branch,REG_DEAD,CC_REGNUM)) continue;
            rtx newcc=gen_rtx_REG(CC_NZmode,CC_REGNUM);
            rtx fused=gen_rtx_PARALLEL(VOIDmode,gen_rtvec(2,
                gen_rtx_SET(newcc,gen_rtx_COMPARE(CC_NZmode,copy_rtx(value),const0_rtx)),
                copy_rtx(assignment)));
            rtx newbranch=copy_rtx(PATTERN(branch));
            XEXP(XEXP(SET_SRC(newbranch),0),0)=newcc;
            bool valid=validate_change(i,&PATTERN(i),fused,true);
            valid &= validate_change(branch,&PATTERN(branch),newbranch,true);
            if (valid && apply_change_group()) {
                XEXP(find_regno_note(branch,REG_DEAD,CC_REGNUM),0)=newcc;
                remove_insn(test);
            } else cancel_changes(0);
        }
        return 0;
    }
};
}
int plugin_init(plugin_name_args *info, plugin_gcc_version *version) {
    if (!plugin_default_version_check(version,&gcc_version)) return 1;
    register_pass_info registration={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};
    register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&registration);
    return 0;
}
