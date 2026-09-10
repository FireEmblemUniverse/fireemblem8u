// SPDX-License-Identifier: GPL-3.0-or-later
// Materialize a contracted symbol address with ARM ADD rd, PC, #offset.
// The link MUST assert symbol == instruction address + 8 + offset.
#include <string>
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
#include "safe-ctype.h"
int plugin_is_GPL_compatible;
namespace {
std::string symbol;
long offset=-1;
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
tree validate(tree *node,tree,tree,int,bool *no_add) {
    if (TREE_CODE(*node)!=FUNCTION_DECL) {
        error("matching_pc_address requires a function"); *no_add=true;
    }
    return NULL_TREE;
}
const attribute_spec contract={"matching_pc_address",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) { register_attribute(&contract); }
bool general(rtx x) { return REG_P(x) && GET_MODE(x)==SImode && REGNO(x)<13; }
const pass_data data={RTL_PASS,"pc_address",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_pc_address",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!TARGET_ARM) fatal_error(UNKNOWN_LOCATION,"PC address requires ARM mode");
        rtx_insn *word=nullptr; rtx_code_label *pool=nullptr,*last=nullptr;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (LABEL_P(i)) last=as_a<rtx_code_label *>(i);
            if (!NONDEBUG_INSN_P(i)) continue;
            rtx p=PATTERN(i);
            if (GET_CODE(p)!=UNSPEC_VOLATILE||XINT(p,1)!=VUNSPEC_POOL_4) continue;
            if (word||!last||XVECLEN(p,0)!=1||GET_CODE(XVECEXP(p,0,0))!=SYMBOL_REF)
                fatal_error(UNKNOWN_LOCATION,"PC address requires one symbol word pool");
            const char *name=XSTR(XVECEXP(p,0,0),0); if (*name=='*') name++;
            if (symbol!=name) fatal_error(UNKNOWN_LOCATION,"PC address symbol mismatch");
            word=i;pool=last;
        }
        if (!word) fatal_error(UNKNOWN_LOCATION,"PC address has no symbol word pool");
        unsigned uses=0;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (!NONDEBUG_INSN_P(i)||!references(PATTERN(i),pool)) continue;
            if (!NONJUMP_INSN_P(i)||GET_CODE(PATTERN(i))!=SET)
                fatal_error(UNKNOWN_LOCATION,"PC address unsupported pool reference");
            rtx set=PATTERN(i),mem=SET_SRC(set);
            if (!general(SET_DEST(set))||!MEM_P(mem)||GET_MODE(mem)!=SImode||MEM_VOLATILE_P(mem)
                ||GET_CODE(XEXP(mem,0))!=LABEL_REF||XEXP(XEXP(mem,0),0)!=pool)
                fatal_error(UNKNOWN_LOCATION,"PC address requires direct word-pool load");
            if (++uses!=1) fatal_error(UNKNOWN_LOCATION,"PC address requires one load");
            rtx replacement=gen_match_arm_pc_address(copy_rtx(SET_DEST(set)),GEN_INT(offset));
            if (!validate_change(i,&PATTERN(i),replacement,false))
                fatal_error(UNKNOWN_LOCATION,"PC address pattern rejected");
            REG_NOTES(i)=nullptr;
        }
        if (uses!=1) fatal_error(UNKNOWN_LOCATION,"PC address missing pool load");
        delete_insn(word);
        return 0;
    }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
    if (!plugin_default_version_check(version,&gcc_version)) return 1;
    for (int n=0;n<info->argc;n++) {
        if (!info->argv[n].value) return 1;
        std::string key=info->argv[n].key;
        if (key=="symbol" && symbol.empty()) symbol=info->argv[n].value;
        else if (key=="offset" && offset<0) {
            char *end=nullptr;offset=strtol(info->argv[n].value,&end,0);
            if (!*info->argv[n].value||*end||offset<0||offset>255) return 1;
        } else return 1;
    }
    if (symbol.empty()||offset<0) return 1;
    for (char c:symbol) if (!(ISALNUM(c)||c=='_')) return 1;
    if (!(ISALPHA(symbol[0])||symbol[0]=='_')) return 1;
    register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);
    register_pass_info p={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};
    register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);
    return 0;
}
