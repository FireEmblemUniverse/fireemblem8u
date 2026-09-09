// SPDX-License-Identifier: GPL-3.0-or-later
#include <vector>
#include <string>
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
#include "output.h"
#include "diagnostic-core.h"
#include "insn-constants.h"
int plugin_is_GPL_compatible;
namespace {
std::vector<std::string> prefix_names;
struct pool_entry { rtx_insn *insn; rtx value; rtx_code_label *label; };

bool references_label(rtx value, rtx_code_label *label) {
    if (!value) return false;
    if (GET_CODE(value) == LABEL_REF) return XEXP(value,0) == label;
    if (LABEL_P(value)) return false;
    const char *format = GET_RTX_FORMAT(GET_CODE(value));
    for (int i = 0; i < GET_RTX_LENGTH(GET_CODE(value)); ++i) {
        if (format[i] == 'e' && references_label(XEXP(value,i), label)) return true;
        if (format[i] == 'E')
            for (int j = 0; j < XVECLEN(value,i); ++j)
                if (references_label(XVECEXP(value,i,j), label)) return true;
    }
    return false;
}

// Explicit research-only layout request. Only a single pool of named pointers
// is accepted; unsupported pools must not silently produce a different layout.
void prefix_pool() {
    if (prefix_names.empty()) return;
    std::vector<pool_entry> entries;
    rtx_code_label *pool = nullptr, *last_label = nullptr;
    rtx_insn *end = nullptr;
    for (rtx_insn *insn = get_insns(); insn; insn = NEXT_INSN(insn)) {
        if (LABEL_P(insn)) last_label = as_a<rtx_code_label *>(insn);
        if (!NONDEBUG_INSN_P(insn)) continue;
        rtx pat = PATTERN(insn);
        if (GET_CODE(pat) != UNSPEC_VOLATILE) continue;
        if (XINT(pat,1) >= VUNSPEC_POOL_1 && XINT(pat,1) <= VUNSPEC_POOL_16
            && XINT(pat,1) != VUNSPEC_POOL_4)
            fatal_error(UNKNOWN_LOCATION, "unsupported prefix pool element size");
        if (XINT(pat,1) == VUNSPEC_POOL_4) {
            if (!pool) pool = last_label;
            if (pool != last_label || XVECLEN(pat,0) != 1
                || GET_CODE(XVECEXP(pat,0,0)) != SYMBOL_REF)
                fatal_error(UNKNOWN_LOCATION, "prefix pool requires one simple pointer pool");
            entries.push_back({insn, XVECEXP(pat,0,0), gen_label_rtx()});
        } else if (XINT(pat,1) == VUNSPEC_POOL_END) {
            if (end) fatal_error(UNKNOWN_LOCATION, "multiple prefix pools unsupported");
            end = insn;
        }
    }
    if (!pool || !end || entries.size() != prefix_names.size())
        fatal_error(UNKNOWN_LOCATION, "prefix pool manifest size mismatch");
    std::vector<unsigned> order;
    for (const auto &name : prefix_names) {
        unsigned found = entries.size();
        for (unsigned i = 0; i < entries.size(); ++i)
            if (name == XSTR(entries[i].value,0)) {
                if (found != entries.size()) fatal_error(UNKNOWN_LOCATION, "duplicate pool symbol");
                found = i;
            }
        if (found == entries.size()) fatal_error(UNKNOWN_LOCATION, "prefix pool symbol missing");
        for (unsigned previous : order)
            if (previous == found) fatal_error(UNKNOWN_LOCATION, "duplicate manifest symbol");
        order.push_back(found);
    }
    for (rtx_insn *insn = get_insns(); insn; insn = NEXT_INSN(insn)) {
        if (!NONDEBUG_INSN_P(insn) || GET_CODE(PATTERN(insn)) != SET) continue;
        rtx source = SET_SRC(PATTERN(insn));
        if (!MEM_P(source)) continue;
        rtx address = XEXP(source,0);
        if (GET_CODE(address) == CONST) address = XEXP(address,0);
        HOST_WIDE_INT offset = 0;
        if (GET_CODE(address) == PLUS && CONST_INT_P(XEXP(address,1))) {
            offset = INTVAL(XEXP(address,1));
            address = XEXP(address,0);
        }
        if (GET_CODE(address) != LABEL_REF || XEXP(address,0) != pool) continue;
        if (offset < 0 || offset % 4 || (unsigned HOST_WIDE_INT)offset / 4 >= entries.size())
            fatal_error(UNKNOWN_LOCATION, "invalid prefix pool reference");
        rtx replacement = copy_rtx(PATTERN(insn));
        XEXP(SET_SRC(replacement),0) = gen_rtx_LABEL_REF(Pmode, entries[offset/4].label);
        if (!validate_change(insn, &PATTERN(insn), replacement, true)) {
            cancel_changes(0);
            fatal_error(UNKNOWN_LOCATION, "prefix pool load rejected");
        }
    }
    if (!apply_change_group()) fatal_error(UNKNOWN_LOCATION, "prefix pool changes rejected");
    for (rtx_insn *insn = get_insns(); insn; insn = NEXT_INSN(insn))
        if (NONDEBUG_INSN_P(insn) && references_label(PATTERN(insn), pool))
            fatal_error(UNKNOWN_LOCATION, "unsupported prefix pool reference remains");
    switch_to_section(function_section(current_function_decl));
    assemble_align(32);
    for (unsigned i : order) {
        char label_name[64];
        ASM_GENERATE_INTERNAL_LABEL(label_name, "L", CODE_LABEL_NUMBER(entries[i].label));
        ASM_OUTPUT_INTERNAL_LABEL(asm_out_file, label_name);
        fputs("\t.word\t", asm_out_file);
        output_addr_const(asm_out_file, entries[i].value);
        fputc('\n', asm_out_file);
    }
    for (const auto &entry : entries) remove_insn(entry.insn);
    remove_insn(end);
}
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
        prefix_pool();
        return 0;
    }
};
}
int plugin_init(plugin_name_args *info, plugin_gcc_version *version) {
    if (!plugin_default_version_check(version, &gcc_version)) return 1;
    for (int i = 0; i < info->argc; ++i) {
        if (strcmp(info->argv[i].key, "prefix-pool") || !info->argv[i].value) return 1;
        std::string names(info->argv[i].value);
        size_t start = 0, comma;
        do {
            comma = names.find(',', start);
            prefix_names.push_back(names.substr(start, comma - start));
            start = comma + 1;
        } while (comma != std::string::npos);
    }
    register_pass_info pass = {new pass_tst(g), "shorten", 1, PASS_POS_INSERT_BEFORE};
    register_callback(info->base_name, PLUGIN_PASS_MANAGER_SETUP, nullptr, &pass);
    return 0;
}
