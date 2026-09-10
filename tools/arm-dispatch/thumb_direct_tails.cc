// SPDX-License-Identifier: GPL-3.0-or-later
// Retarget local private branch stubs to explicitly declared continuation symbols.
#include <set>
#include <string>
#include <cstdlib>
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
#include "insn-flags.h"
#include "insn-constants.h"
int plugin_is_GPL_compatible;
namespace {
std::set<std::string> destinations;
unsigned expected=0;
tree validate(tree *node,tree,tree,int,bool *no_add) {
    if (TREE_CODE(*node)!=FUNCTION_DECL) {error("matching_thumb_direct_tails requires a function");*no_add=true;}
    return NULL_TREE;
}
const attribute_spec contract={"matching_thumb_direct_tails",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) {register_attribute(&contract);}
bool low(rtx x) {return REG_P(x)&&GET_MODE(x)==SImode&&REGNO(x)<8;}
rtx_insn *next_op(rtx_insn *i) {
    for (i=NEXT_INSN(i);i;i=NEXT_INSN(i)) if (NONDEBUG_INSN_P(i)) return i;
    return nullptr;
}
rtx symbol_of(rtx_insn *i) {
    if (!i||!JUMP_P(i)||GET_CODE(PATTERN(i))!=SET||SET_DEST(PATTERN(i))!=pc_rtx) return nullptr;
    rtx s=SET_SRC(PATTERN(i));
    return GET_CODE(s)==SYMBOL_REF&&destinations.count(XSTR(s,0))?s:nullptr;
}
bool adjacent_unlabelled(rtx_insn *from,rtx_insn *to) {
    for (rtx_insn *i=NEXT_INSN(from);i;i=NEXT_INSN(i)) {
        if (i==to) return true;
        if (!NOTE_P(i)&&!DEBUG_INSN_P(i)) return false;
    }
    return false;
}
bool forward_empty_to(rtx_insn *from,rtx_insn *label) {
    for (rtx_insn *i=NEXT_INSN(from);i;i=NEXT_INSN(i)) {
        if (i==label) return true;
        if (NONDEBUG_INSN_P(i)) return false;
    }
    return false;
}
const pass_data data={RTL_PASS,"thumb_direct_tails",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_thumb_direct_tails",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!TARGET_THUMB1||!lookup_attribute("matching_tail_transfer",DECL_ATTRIBUTES(fn->decl)))
            fatal_error(UNKNOWN_LOCATION,"Thumb direct tails require private Thumb tails");
        unsigned rewritten=0;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (!JUMP_P(i)) continue;
            rtx p=PATTERN(i),set=p;
            bool bundled=GET_CODE(p)==PARALLEL;
            if (bundled) {
                // Only the validated decrement/store pattern may retain side effects.
                if (recog_memoized(i)!=CODE_FOR_match_thumb_store_decrement_zero) continue;
                set=XVECEXP(p,0,0);
            }
            if (GET_CODE(set)!=SET||SET_DEST(set)!=pc_rtx||GET_CODE(SET_SRC(set))!=IF_THEN_ELSE) continue;
            rtx choice=SET_SRC(set),condition=XEXP(choice,0),target=XEXP(choice,1);
            if (GET_CODE(target)!=LABEL_REF||XEXP(choice,2)!=pc_rtx) continue;
            rtx_insn *label=as_a<rtx_insn *>(XEXP(target,0));
            rtx symbol=symbol_of(next_op(label)),replacement=nullptr;
            rtx_insn *remove=nullptr;
            if (symbol) {
                if (bundled) {
                    rtx reg=SET_DEST(XVECEXP(p,0,1)),memory=SET_DEST(XVECEXP(p,0,2));
                    replacement=gen_match_thumb_store_decrement_zero_tail(copy_rtx(reg),copy_rtx(memory),copy_rtx(condition),copy_rtx(symbol));
                } else if (GET_CODE(condition)==EQ&&low(XEXP(condition,0))&&XEXP(condition,1)==const0_rtx) {
                    replacement=gen_match_thumb_zero_tail(copy_rtx(XEXP(condition,0)),copy_rtx(symbol));
                }
            } else if (!bundled&&GET_CODE(condition)==NE&&XEXP(condition,1)==const0_rtx) {
                // Inverse masked test followed by one tail, then its skip label.
                rtx mask=XEXP(condition,0);rtx_insn *stub=next_op(i);symbol=symbol_of(stub);
                if (symbol&&GET_CODE(mask)==AND&&low(XEXP(mask,0))&&low(XEXP(mask,1))
                    &&adjacent_unlabelled(i,stub)&&forward_empty_to(stub,label)) {
                    rtx a=XEXP(mask,0),b=XEXP(mask,1);
                    if (REGNO(a)>REGNO(b)) {rtx t=a;a=b;b=t;}
                    replacement=gen_match_thumb_mask_zero_tail(copy_rtx(a),copy_rtx(b),copy_rtx(symbol));
                    remove=stub;
                }
            }
            if (!replacement) continue;
            if (!validate_change(i,&PATTERN(i),replacement,false))
                fatal_error(UNKNOWN_LOCATION,"Thumb direct tail pattern rejected");
            REG_NOTES(i)=nullptr;JUMP_LABEL(i)=nullptr;
            if (remove) {
                // The unconditional branch's barrier would wrongly terminate the
                // new conditional fallthrough; remove it with the old branch.
                rtx_insn *after=NEXT_INSN(remove);
                while (after&&NOTE_P(after)) after=NEXT_INSN(after);
                if (after&&BARRIER_P(after)) delete_insn(after);
                delete_insn(remove);
            }
            rewritten++;
        }
        if (rewritten!=expected) fatal_error(UNKNOWN_LOCATION,"Thumb direct tails expected %u transfers, found %u",expected,rewritten);
        return 0;
    }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
    if (!plugin_default_version_check(version,&gcc_version)) return 1;
    for (int n=0;n<info->argc;n++) {
        std::string key=info->argv[n].key;const char *v=info->argv[n].value;
        if (key=="destination"&&v&&*v) {if(!destinations.insert(v).second) return 1;continue;}
        if (key=="expected-transfers"&&v&&*v&&!expected) {
            char *end=nullptr;unsigned long value=strtoul(v,&end,10);
            if (*end||value<1||value>100) return 1;expected=value;continue;
        }
        return 1;
    }
    if (destinations.empty()||!expected) return 1;
    register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);
    register_pass_info p={new pass(g),"shorten",1,PASS_POS_INSERT_AFTER};
    register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);
    return 0;
}
