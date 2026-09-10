// SPDX-License-Identifier: GPL-3.0-or-later
// Matching Thumb literal pools, carry tests and bounded byte counters.
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
#include "ggc.h"
#include "rtl.h"
#include "emit-rtl.h"
#include "recog.h"
#include "tm.h"
#include "tm-preds.h"
#include "diagnostic-core.h"
#include "insn-constants.h"
#include "insn-flags.h"
#include "insn-attr.h"
int plugin_is_GPL_compatible;
namespace {
struct entry { unsigned long value; std::string symbol; std::string source_symbol; };
std::vector<entry> manifest;
bool carry_tests=false, byte_counter=false, zero_pool_padding=false;
rtx_insn *previous_operation(rtx_insn *i) {
    for (i=PREV_INSN(i);i;i=PREV_INSN(i)) {
        if (NOTE_P(i) || DEBUG_INSN_P(i)) continue;
        return NONJUMP_INSN_P(i) ? i : nullptr;
    }
    return nullptr;
}
bool low_register(rtx x, machine_mode mode) {
    return REG_P(x) && GET_MODE(x)==mode && REGNO(x)<8;
}
void combine_byte_counter(rtx_insn *branch) {
    if (!JUMP_P(branch) || GET_CODE(PATTERN(branch))!=SET) return;
    rtx jump=PATTERN(branch);
    if (SET_DEST(jump)!=pc_rtx || GET_CODE(SET_SRC(jump))!=IF_THEN_ELSE) return;
    rtx choice=SET_SRC(jump),condition=XEXP(choice,0),target=XEXP(choice,1);
    if ((GET_CODE(condition)!=GT && GET_CODE(condition)!=LE) || XEXP(condition,1)!=const0_rtx
        || !low_register(XEXP(condition,0),SImode) || GET_CODE(target)!=LABEL_REF
        || XEXP(choice,2)!=pc_rtx) return;
    // Keep this first implementation within an unambiguously short forward span.
    unsigned span=0;rtx_insn *scan=NEXT_INSN(branch);
    for (;scan && scan!=XEXP(target,0);scan=NEXT_INSN(scan)) {
        if (NONDEBUG_INSN_P(scan)) span+=get_attr_length(scan);
        if (LABEL_P(scan)) span+=4; // conservatively allow label alignment
        if (span>200) return;
    }
    if (!scan) return;
    rtx reg=XEXP(condition,0);
    rtx_insn *store=previous_operation(branch);
    rtx_insn *sub=store ? previous_operation(store) : nullptr;
    if (!sub || GET_CODE(PATTERN(store))!=SET || GET_CODE(PATTERN(sub))!=SET) return;
    rtx write=PATTERN(store),decrement=PATTERN(sub),memory=SET_DEST(write),sum=SET_SRC(decrement);
    if (!MEM_P(memory) || GET_MODE(memory)!=QImode || !low_register(SET_SRC(write),QImode)
        || REGNO(SET_SRC(write))!=REGNO(reg) || !rtx_equal_p(SET_DEST(decrement),reg)
        || GET_CODE(sum)!=PLUS || !rtx_equal_p(XEXP(sum,0),reg)
        || !CONST_INT_P(XEXP(sum,1)) || INTVAL(XEXP(sum,1))!=-1) return;
    // Thumb STRB permits a low base plus an unsigned five-bit byte offset.
    // Reject an address depending on the changing counter register.
    rtx address=XEXP(memory,0),base=address;long offset=0;
    if (GET_CODE(address)==PLUS && CONST_INT_P(XEXP(address,1))) {
        base=XEXP(address,0);offset=INTVAL(XEXP(address,1));
    }
    if (!low_register(base,SImode) || REGNO(base)==REGNO(reg) || offset<0 || offset>31) return;
    rtx_insn *load=previous_operation(sub);
    if (!load) return;
    rtx p=PATTERN(load);
    // An input-only empty asm does not change the value. Never accept an output
    // or clobber, even if the text is empty: those intentionally hide ranges.
    if (GET_CODE(p)==ASM_OPERANDS && !*ASM_OPERANDS_TEMPLATE(p)
        && !*ASM_OPERANDS_OUTPUT_CONSTRAINT(p) && ASM_OPERANDS_LABEL_LENGTH(p)==0) {
        load=previous_operation(load);if (!load) return;p=PATTERN(load);
    }
    if (GET_CODE(p)!=SET || !rtx_equal_p(SET_DEST(p),reg)
        || GET_CODE(SET_SRC(p))!=ZERO_EXTEND || GET_MODE(SET_SRC(p))!=SImode
        || !MEM_P(XEXP(SET_SRC(p),0)) || GET_MODE(XEXP(SET_SRC(p),0))!=QImode) return;
    rtx new_condition=gen_rtx_fmt_ee(GET_CODE(condition),VOIDmode,
        gen_rtx_UNSPEC(SImode,gen_rtvec(1,copy_rtx(reg)),UNSPEC_MATCH_THUMB_BYTE_DEC),const0_rtx);
    rtx replacement=gen_match_thumb_byte_dec(copy_rtx(reg),copy_rtx(memory),new_condition,XEXP(target,0));
    if (!validate_change(branch,&PATTERN(branch),replacement,false))
        fatal_error(UNKNOWN_LOCATION,"Thumb byte decrement bundle rejected");
    delete_insn(sub);delete_insn(store);
    // The old branch's REG_DEAD note describes the pre-bundle value only.
    REG_NOTES(branch)=nullptr;
}
struct literal { rtx_insn *insn; long offset; int shared; unsigned uses; };
bool references(rtx x,rtx label) {
    if (!x) return false;
    if (GET_CODE(x)==LABEL_REF) return XEXP(x,0)==label;
    if (LABEL_P(x)) return false;
    const char *format=GET_RTX_FORMAT(GET_CODE(x));
    for (int n=0;n<GET_RTX_LENGTH(GET_CODE(x));n++) {
        if (format[n]=='e' && references(XEXP(x,n),label)) return true;
        if (format[n]=='E') for (int j=0;j<XVECLEN(x,n);j++) if (references(XVECEXP(x,n,j),label)) return true;
    }
    return false;
}
const pass_data data={RTL_PASS,"thumb_shared_literal",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *) override {
        if (!TARGET_THUMB1) fatal_error(UNKNOWN_LOCATION,"shared Thumb literals require Thumb-1");
        if (byte_counter) for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) combine_byte_counter(i);
        if (carry_tests) for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (!JUMP_P(i) || GET_CODE(PATTERN(i))!=PARALLEL || XVECLEN(PATTERN(i),0)!=2) continue;
            rtx p=PATTERN(i),set=XVECEXP(p,0,0),clobber=XVECEXP(p,0,1);
            if (GET_CODE(set)!=SET || SET_DEST(set)!=pc_rtx || GET_CODE(SET_SRC(set))!=IF_THEN_ELSE
                || GET_CODE(clobber)!=CLOBBER || !REG_P(XEXP(clobber,0)) || REGNO(XEXP(clobber,0))>=8) continue;
            rtx condition=XEXP(SET_SRC(set),0);
            if (GET_CODE(condition)!=EQ && GET_CODE(condition)!=NE) continue;
            rtx extract=XEXP(condition,0);
            if (XEXP(condition,1)!=const0_rtx || GET_CODE(extract)!=ZERO_EXTRACT
                || GET_MODE(extract)!=SImode || !REG_P(XEXP(extract,0)) || REGNO(XEXP(extract,0))>=8
                || XEXP(extract,1)!=const1_rtx || !CONST_INT_P(XEXP(extract,2))) continue;
            long bit=INTVAL(XEXP(extract,2));if (bit<0 || bit>=32) continue;
            rtx replacement=copy_rtx(p),target=XEXP(SET_SRC(XVECEXP(replacement,0,0)),0);
            XEXP(target,0)=gen_rtx_UNSPEC(SImode,gen_rtvec(2,copy_rtx(XEXP(extract,0)),GEN_INT(bit)),UNSPEC_MATCH_THUMB_BIT);
            if (!validate_change(i,&PATTERN(i),replacement,false)) fatal_error(UNKNOWN_LOCATION,"Thumb carry-bit rewrite rejected");
        }
        if (manifest.empty()) return 0;
        std::vector<literal> literals; std::vector<unsigned> found(manifest.size());
        rtx_code_label *last=nullptr,*pool=nullptr;
        long offset=0;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (LABEL_P(i)) last=as_a<rtx_code_label *>(i);
            if (!NONDEBUG_INSN_P(i)) continue;
            rtx p=PATTERN(i);
            if (GET_CODE(p)!=UNSPEC_VOLATILE || XINT(p,1)!=VUNSPEC_POOL_4) continue;
            if (!pool) pool=last;
            if (pool!=last || XVECLEN(p,0)!=1) fatal_error(UNKNOWN_LOCATION,"expected one simple Thumb word pool");
            rtx value=XVECEXP(p,0,0);int shared=-1;
            if (CONST_INT_P(value)) for (unsigned n=0;n<manifest.size();n++)
                if (manifest[n].source_symbol.empty() && (unsigned long)(unsigned int)INTVAL(value)==manifest[n].value) { shared=n;found[n]++; }
            if (GET_CODE(value)==SYMBOL_REF) {
                const char *name=XSTR(value,0);if (*name=='*') name++;
                for (unsigned n=0;n<manifest.size();n++) if (manifest[n].source_symbol==name) { shared=n;found[n]++; }
            }
            literals.push_back({i,offset,shared,0});
            if (shared<0) offset+=4;
        }
        if (zero_pool_padding) {
            rtx_insn *align=pool ? previous_operation(pool) : nullptr;
            if (!align || GET_CODE(PATTERN(align))!=UNSPEC_VOLATILE
                || XINT(PATTERN(align),1)!=VUNSPEC_ALIGN
                || XVECLEN(PATTERN(align),0)!=1 || XVECEXP(PATTERN(align),0,0)!=const0_rtx)
                fatal_error(UNKNOWN_LOCATION,"expected word alignment immediately before Thumb pool");
            rtx_insn *before=PREV_INSN(align);
            while (before && (NOTE_P(before) || DEBUG_INSN_P(before) || LABEL_P(before))) before=PREV_INSN(before);
            if (!before || !BARRIER_P(before)) fatal_error(UNKNOWN_LOCATION,"zero pool padding requires a preceding control-flow barrier");
            rtx replacement=gen_match_thumb_zero_pool_align();
            if (!validate_change(align,&PATTERN(align),replacement,false)) fatal_error(UNKNOWN_LOCATION,"Thumb zero pool alignment rejected");
        }
        for (unsigned count:found) if (count!=1) fatal_error(UNKNOWN_LOCATION,"shared Thumb constant missing or duplicated");
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (!NONDEBUG_INSN_P(i) || !references(PATTERN(i),pool)) continue;
            if (GET_CODE(PATTERN(i))!=SET) fatal_error(UNKNOWN_LOCATION,"unsupported Thumb pool reference");
            rtx set=PATTERN(i),memory=SET_SRC(set);
            if (!MEM_P(memory)) fatal_error(UNKNOWN_LOCATION,"non-load Thumb pool reference");
            rtx address=XEXP(memory,0);
            if (GET_CODE(address)==CONST) address=XEXP(address,0);
            long displacement=0;
            if (GET_CODE(address)==PLUS && CONST_INT_P(XEXP(address,1))) {
                displacement=INTVAL(XEXP(address,1));address=XEXP(address,0);
            }
            if (GET_CODE(address)!=LABEL_REF || XEXP(address,0)!=pool) fatal_error(UNKNOWN_LOCATION,"complex Thumb pool address");
            if (displacement<0 || displacement%4 || (unsigned long)displacement/4>=literals.size()) fatal_error(UNKNOWN_LOCATION,"invalid Thumb pool offset");
            auto &literal=literals[displacement/4];rtx replacement;
            if (literal.shared>=0) {
                rtx symbol=gen_rtx_SYMBOL_REF(Pmode,ggc_strdup(manifest[literal.shared].symbol.c_str()));
                replacement=gen_match_thumb_literal(copy_rtx(SET_DEST(set)),symbol);
            } else {
                replacement=copy_rtx(set);
                rtx newaddress=gen_rtx_LABEL_REF(Pmode,pool);
                if (literal.offset) newaddress=gen_rtx_CONST(Pmode,gen_rtx_PLUS(Pmode,newaddress,GEN_INT(literal.offset)));
                XEXP(SET_SRC(replacement),0)=newaddress;
            }
            if (!validate_change(i,&PATTERN(i),replacement,false)) { debug_rtx(replacement);fatal_error(UNKNOWN_LOCATION,"Thumb pool rewrite rejected"); }
            literal.uses++;
        }
        for (const auto &literal:literals) if (literal.shared>=0) {
            if (!literal.uses) fatal_error(UNKNOWN_LOCATION,"unused shared Thumb constant");
            remove_insn(literal.insn);
        }
        return 0;
    }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
    if (!plugin_default_version_check(version,&gcc_version)) return 1;
    for (int n=0;n<info->argc;n++) {
        if (std::string(info->argv[n].key)=="zero-pool-padding" && !info->argv[n].value) { zero_pool_padding=true;continue; }
        if (std::string(info->argv[n].key)=="byte-counter" && !info->argv[n].value) { byte_counter=true;continue; }
        if (std::string(info->argv[n].key)=="carry-tests" && !info->argv[n].value) { carry_tests=true;continue; }
        bool named=std::string(info->argv[n].key)=="symbol-literal";
        if ((!named && std::string(info->argv[n].key)!="literal") || !info->argv[n].value) return 1;
        std::string text=info->argv[n].value;auto split=text.find(',');if (split==std::string::npos) return 1;
        unsigned long value=0;std::string source;
        if (named) {
            source=text.substr(0,split);
            if (source.empty() || !(ISALPHA(source[0]) || source[0]=='_')) return 1;
            for (char c:source) if (!(ISALNUM(c)||c=='_')) return 1;
        } else {
            char *end=nullptr;value=strtoul(text.c_str(),&end,0);
            if (end==text.c_str() || end!=text.c_str()+split || value>0xffffffffUL) return 1;
        }
        std::string symbol=text.substr(split+1);
        if (symbol.empty() || !(ISALPHA(symbol[0]) || symbol[0]=='_')) return 1;
        for (char c:symbol) if (!(ISALNUM(c)||c=='_')) return 1;
        for (const auto &old:manifest) if (old.source_symbol==source && (named || old.value==value)) return 1;
        manifest.push_back({value,symbol,source});
    }
    if (zero_pool_padding && manifest.empty()) return 1;
    if (manifest.empty() && !carry_tests && !byte_counter) return 1;
    register_pass_info registration={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};
    register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&registration);
    return 0;
}
