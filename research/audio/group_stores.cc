// SPDX-License-Identifier: GPL-3.0-or-later
// Fold four adjacent ordered word stores and their explicit pointer update.
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
int plugin_is_GPL_compatible;
namespace {
tree validate(tree *node,tree,tree,int,bool *no_add) {
    if (TREE_CODE(*node)!=FUNCTION_DECL) { error("matching_group_stores requires a function"); *no_add=true; }
    return NULL_TREE;
}
const attribute_spec contract={"matching_group_stores",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) { register_attribute(&contract); }
rtx_insn *next_operation(rtx_insn *i) {
    do { i=NEXT_INSN(i); } while (i && (NOTE_P(i)||DEBUG_INSN_P(i)));
    return i && NONJUMP_INSN_P(i) ? i : nullptr;
}
bool low(rtx x) { return REG_P(x) && GET_MODE(x)==SImode && REGNO(x)<8; }
const pass_data data={RTL_PASS,"group_stores",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_group_stores",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!TARGET_THUMB1) fatal_error(UNKNOWN_LOCATION,"group stores requires Thumb-1");
        unsigned folded=0;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (!NONJUMP_INSN_P(i)) continue;
            rtx_insn *seq[5]={i}; rtx sets[5],base=nullptr; unsigned last=0;
            bool ok=true;
            for (unsigned n=0;n<4;n++) {
                if (n) seq[n]=next_operation(seq[n-1]);
                if (!seq[n] || GET_CODE(PATTERN(seq[n]))!=SET) { ok=false;break; }
                sets[n]=PATTERN(seq[n]);rtx mem=SET_DEST(sets[n]),reg=SET_SRC(sets[n]);
                if (!MEM_P(mem)||GET_MODE(mem)!=SImode||MEM_VOLATILE_P(mem)||MEM_ALIGN(mem)<32||!low(reg)) { ok=false;break; }
                rtx addr=XEXP(mem,0);
                if (!n) { base=addr;if (!low(base)) { ok=false;break; } }
                else if (GET_CODE(addr)!=PLUS || !rtx_equal_p(XEXP(addr,0),base) || !CONST_INT_P(XEXP(addr,1)) || INTVAL(XEXP(addr,1))!=4*n) { ok=false;break; }
                if (REGNO(reg)==REGNO(base)||(n && REGNO(reg)<=last)) { ok=false;break; }
                last=REGNO(reg);
            }
            if (!ok) continue;
            seq[4]=next_operation(seq[3]);
            if (!seq[4] || GET_CODE(PATTERN(seq[4]))!=SET) continue;
            sets[4]=PATTERN(seq[4]);rtx add=SET_SRC(sets[4]);
            if (!rtx_equal_p(SET_DEST(sets[4]),base)||GET_CODE(add)!=PLUS||!rtx_equal_p(XEXP(add,0),base)||!CONST_INT_P(XEXP(add,1))||INTVAL(XEXP(add,1))!=16) continue;
            rtvec vec=rtvec_alloc(5);RTVEC_ELT(vec,0)=copy_rtx(sets[4]);
            for (unsigned n=0;n<4;n++) RTVEC_ELT(vec,n+1)=copy_rtx(sets[n]);
            rtx replacement=gen_rtx_PARALLEL(VOIDmode,vec);
            if (!validate_change(i,&PATTERN(i),replacement,false)) fatal_error(UNKNOWN_LOCATION,"group store pattern rejected");
            REG_NOTES(i)=nullptr;
            for (unsigned n=1;n<5;n++) delete_insn(seq[n]);
            folded++;
        }
        if (!folded) fatal_error(UNKNOWN_LOCATION,"group stores found no eligible sequence");
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
