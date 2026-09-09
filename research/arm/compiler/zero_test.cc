// SPDX-License-Identifier: GPL-3.0-or-later
#include "gcc-plugin.h"
#include "plugin-version.h"
#include "context.h"
#include "backend.h"
#include "insn-config.h"
#include "tree-pass.h"
#include "rtl.h"
#include "memmodel.h"
#include "emit-rtl.h"
#include "recog.h"
#include "tm.h"
#include "function.h"
int plugin_is_GPL_compatible;
namespace {
const pass_data data = {RTL_PASS, "equality_tst", OPTGROUP_NONE, TV_NONE, PROP_rtl, 0, 0, 0, 0};
class pass_tst : public rtl_opt_pass {
public:
    pass_tst(gcc::context *ctxt) : rtl_opt_pass(data, ctxt) {}
    unsigned int execute(function *) override {
        if (!TARGET_ARM) return 0;
        for (rtx_insn *insn = get_insns(); insn; insn = NEXT_INSN(insn)) {
            if (!NONDEBUG_INSN_P(insn) || GET_CODE(PATTERN(insn)) != SET) continue;
            rtx set = PATTERN(insn), cc = SET_DEST(set), comparison = SET_SRC(set);
            if (!REG_P(cc) || REGNO(cc) != CC_REGNUM || GET_CODE(comparison) != COMPARE
                || !REG_P(XEXP(comparison,0)) || GET_MODE(XEXP(comparison,0)) != SImode) continue;
            rtx_insn *branch = next_nonnote_nondebug_insn(insn);
            if (!branch || !JUMP_P(branch) || GET_CODE(PATTERN(branch)) != SET) continue;
            rtx branch_pattern = PATTERN(branch), choice = SET_SRC(branch_pattern);
            if (SET_DEST(branch_pattern) != pc_rtx || GET_CODE(choice) != IF_THEN_ELSE) continue;
            rtx condition = XEXP(choice,0);
            if (!rtx_equal_p(XEXP(condition,0), cc)
                || XEXP(condition,1) != const0_rtx
                || !find_reg_note(branch, REG_DEAD, cc)) continue;
            // Equivalent unsigned power-of-two boundaries, with no live flags
            // after the immediate consumer. Reject overflow and signed tests.
            rtx bound = XEXP(comparison,1);
            if (CONST_INT_P(bound) && INTVAL(bound) >= 0 && INTVAL(bound) < 0x7fffffff
                && (INTVAL(bound) & (INTVAL(bound) + 1)) == 0
                && (GET_CODE(condition) == LEU || GET_CODE(condition) == GTU)) {
                rtx replacement = copy_rtx(set);
                XEXP(SET_SRC(replacement),1) = GEN_INT(INTVAL(bound) + 1);
                rtx newbranch = copy_rtx(branch_pattern);
                PUT_CODE(XEXP(SET_SRC(newbranch),0), GET_CODE(condition) == LEU ? LTU : GEU);
                bool valid = validate_change(insn, &PATTERN(insn), replacement, true);
                valid &= validate_change(branch, &PATTERN(branch), newbranch, true);
                if (!(valid && apply_change_group())) cancel_changes(0);
                continue;
            }
            if (bound != const0_rtx || (GET_CODE(condition) != EQ && GET_CODE(condition) != NE)) continue;
            rtx value = XEXP(comparison,0), newcc = gen_rtx_REG(CC_NZmode, CC_REGNUM);
            rtx replacement = gen_rtx_SET(newcc, gen_rtx_COMPARE(CC_NZmode,
                gen_rtx_AND(SImode, copy_rtx(value), copy_rtx(value)), const0_rtx));
            replacement = gen_rtx_PARALLEL(VOIDmode, gen_rtvec(2, replacement,
                gen_rtx_CLOBBER(VOIDmode, gen_rtx_SCRATCH(SImode))));
            rtx newbranch = copy_rtx(branch_pattern);
            XEXP(XEXP(SET_SRC(newbranch),0),0) = newcc;
            bool valid = validate_change(insn, &PATTERN(insn), replacement, true);
            valid &= validate_change(branch, &PATTERN(branch), newbranch, true);
            if (valid && apply_change_group())
                REG_NOTES(branch) = replace_rtx(REG_NOTES(branch), cc, newcc);
            else
                cancel_changes(0);
        }
        return 0;
    }
};
}
int plugin_init(plugin_name_args *info, plugin_gcc_version *version) {
    if (!plugin_default_version_check(version, &gcc_version)) return 1;
    register_pass_info pass = {new pass_tst(g), "shorten", 1, PASS_POS_INSERT_BEFORE};
    register_callback(info->base_name, PLUGIN_PASS_MANAGER_SETUP, nullptr, &pass);
    return 0;
}
