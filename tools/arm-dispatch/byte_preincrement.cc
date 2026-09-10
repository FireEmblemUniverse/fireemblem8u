// SPDX-License-Identifier: GPL-3.0-or-later
// Select ARM byte-load writeback for adjacent C address copy, update and load.
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
        error("matching_byte_preincrement requires a function"); *no_add=true;
    }
    return NULL_TREE;
}
const attribute_spec contract={"matching_byte_preincrement",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) { register_attribute(&contract); }
bool general(rtx x) { return REG_P(x) && GET_MODE(x)==SImode && REGNO(x)<13; }
const pass_data data={RTL_PASS,"byte_preincrement",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_byte_preincrement",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!TARGET_ARM) fatal_error(UNKNOWN_LOCATION,"byte preincrement requires ARM mode");
        unsigned folded=0;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (!NONJUMP_INSN_P(i)) continue;
            rtx condition=nullptr;
            rtx copy=PATTERN(i);
            if (GET_CODE(copy)==COND_EXEC) { condition=COND_EXEC_TEST(copy);copy=COND_EXEC_CODE(copy); }
            if (GET_CODE(copy)!=SET) continue;
            rtx tmp=SET_DEST(copy),base=SET_SRC(copy);
            if (!general(tmp)||!general(base)||REGNO(tmp)==REGNO(base)) continue;
            rtx_insn *update=NEXT_INSN(i);
            while (update && NOTE_P(update)) update=NEXT_INSN(update);
            if (!update||!NONJUMP_INSN_P(update)) continue;
            rtx addset=PATTERN(update);
            if (condition) {
                if (GET_CODE(addset)!=COND_EXEC||!rtx_equal_p(COND_EXEC_TEST(addset),condition)) continue;
                addset=COND_EXEC_CODE(addset);
            }
            if (GET_CODE(addset)!=SET||!rtx_equal_p(SET_DEST(addset),base)) continue;
            rtx add=SET_SRC(addset);
            if (GET_CODE(add)!=PLUS||!rtx_equal_p(XEXP(add,0),tmp)) continue;
            rtx amount=XEXP(add,1);
            if (!(CONST_INT_P(amount)&&INTVAL(amount)==1)
                && !(general(amount)&&REGNO(amount)!=REGNO(base)&&REGNO(amount)!=REGNO(tmp))) continue;
            rtx_insn *load=NEXT_INSN(update);
            while (load && NOTE_P(load)) load=NEXT_INSN(load);
            if (!load||!NONJUMP_INSN_P(load)) continue;
            rtx set=PATTERN(load);
            if (condition) {
                if (GET_CODE(set)!=COND_EXEC||!rtx_equal_p(COND_EXEC_TEST(set),condition)) continue;
                set=COND_EXEC_CODE(set);
            }
            if (GET_CODE(set)!=SET||!rtx_equal_p(SET_DEST(set),tmp)) continue;
            rtx extension=SET_SRC(set);
            if (GET_CODE(extension)!=SIGN_EXTEND||GET_MODE(extension)!=SImode) continue;
            rtx mem=XEXP(extension,0);
            if (!MEM_P(mem)||GET_MODE(mem)!=QImode||!rtx_equal_p(XEXP(mem,0),add)) continue;
            rtx replacement=copy_rtx(set);
            rtx address=gen_rtx_PRE_MODIFY(SImode,copy_rtx(base),
                gen_rtx_PLUS(SImode,copy_rtx(base),copy_rtx(amount)));
            // Keep the complete original MEM, including volatility/alias metadata.
            XEXP(XEXP(SET_SRC(replacement),0),0)=address;
            if (condition) replacement=gen_rtx_COND_EXEC(VOIDmode,copy_rtx(condition),replacement);
            if (!validate_change(i,&PATTERN(i),replacement,false))
                fatal_error(UNKNOWN_LOCATION,"byte preincrement pattern rejected");
            REG_NOTES(i)=nullptr;
            add_reg_note(i,REG_INC,copy_rtx(base));
            delete_insn(update);delete_insn(load);
            folded++;
        }
        if (!folded) fatal_error(UNKNOWN_LOCATION,"byte preincrement found no eligible sequence");
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
