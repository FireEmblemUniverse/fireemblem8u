// SPDX-License-Identifier: GPL-3.0-or-later
// Select ARM word-store writeback for adjacent C store and pointer increment.
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
    if (TREE_CODE(*node)!=FUNCTION_DECL) {
        error("matching_word_postincrement requires a function"); *no_add=true;
    }
    return NULL_TREE;
}
const attribute_spec contract={"matching_word_postincrement",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) { register_attribute(&contract); }
bool general(rtx x) { return REG_P(x) && GET_MODE(x)==SImode && REGNO(x)<13; }
const pass_data data={RTL_PASS,"word_postincrement",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_word_postincrement",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!TARGET_ARM) fatal_error(UNKNOWN_LOCATION,"word postincrement requires ARM mode");
        unsigned folded=0;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (!NONJUMP_INSN_P(i)||GET_CODE(PATTERN(i))!=SET) continue;
            rtx set=PATTERN(i),mem=SET_DEST(set),value=SET_SRC(set);
            if (!MEM_P(mem)||GET_MODE(mem)!=SImode||!general(value)) continue;
            rtx base=XEXP(mem,0);
            if (!general(base)||REGNO(base)==REGNO(value)) continue;
            rtx_insn *next=NEXT_INSN(i);
            while (next && NOTE_P(next)) next=NEXT_INSN(next);
            // Never cross another access, instruction, label or control transfer.
            if (!next||!NONJUMP_INSN_P(next)||GET_CODE(PATTERN(next))!=SET) continue;
            rtx update=PATTERN(next),add=SET_SRC(update);
            if (!rtx_equal_p(SET_DEST(update),base)||GET_CODE(add)!=PLUS
                ||!rtx_equal_p(XEXP(add,0),base)||!CONST_INT_P(XEXP(add,1))||INTVAL(XEXP(add,1))!=4) continue;
            rtx replacement=copy_rtx(set);
            // Copy the entire MEM, including volatility and alias attributes.
            XEXP(SET_DEST(replacement),0)=gen_rtx_POST_INC(SImode,copy_rtx(base));
            if (!validate_change(i,&PATTERN(i),replacement,false))
                fatal_error(UNKNOWN_LOCATION,"word postincrement pattern rejected");
            REG_NOTES(i)=nullptr;
            add_reg_note(i,REG_INC,copy_rtx(base));
            delete_insn(next);
            folded++;
        }
        if (!folded) fatal_error(UNKNOWN_LOCATION,"word postincrement found no eligible sequence");
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
