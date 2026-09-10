// SPDX-License-Identifier: GPL-3.0-or-later
// Experimental relocation of selected constant words from a Thumb literal pool.
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
int plugin_is_GPL_compatible;
namespace {
struct entry { unsigned long value; std::string symbol; };
std::vector<entry> manifest;
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
                if ((unsigned long)(unsigned int)INTVAL(value)==manifest[n].value) { shared=n;found[n]++; }
            literals.push_back({i,offset,shared,0});
            if (shared<0) offset+=4;
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
        if (std::string(info->argv[n].key)!="literal" || !info->argv[n].value) return 1;
        std::string text=info->argv[n].value;auto split=text.find(',');if (split==std::string::npos) return 1;
        char *end=nullptr;unsigned long value=strtoul(text.c_str(),&end,0);
        if (end==text.c_str() || end!=text.c_str()+split || value>0xffffffffUL) return 1;
        std::string symbol=text.substr(split+1);
        if (symbol.empty() || !(ISALPHA(symbol[0]) || symbol[0]=='_')) return 1;
        for (char c:symbol) if (!(ISALNUM(c)||c=='_')) return 1;
        for (const auto &old:manifest) if (old.value==value) return 1;
        manifest.push_back({value,symbol});
    }
    if (manifest.empty()) return 1;
    register_pass_info registration={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};
    register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&registration);
    return 0;
}
