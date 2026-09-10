// SPDX-License-Identifier: GPL-3.0-or-later
// Fold a positive-size pointer fork into a widened signed-addition tail.
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
#include "insn-attr.h"
#include "regs.h"
#include <string>
int plugin_is_GPL_compatible;
namespace {
std::string destination;
tree validate(tree *node,tree,tree,int,bool *no_add) {
    if (TREE_CODE(*node)!=FUNCTION_DECL) { error("matching_thumb_positive_advance requires a function");*no_add=true; }
    return NULL_TREE;
}
const attribute_spec contract={"matching_thumb_positive_advance",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) { register_attribute(&contract); }
rtx_insn *next_op(rtx_insn *i) {
    for (i=NEXT_INSN(i);i;i=NEXT_INSN(i)) {
        if (LABEL_P(i)||BARRIER_P(i)) return nullptr;
        if (NONDEBUG_INSN_P(i)) return i;
    }
    return nullptr;
}
bool empty_tie(rtx p) {
    if (GET_CODE(p)!=SET||!REG_P(SET_DEST(p))||GET_MODE(SET_DEST(p))!=SImode||REGNO(SET_DEST(p))>=13) return false;
    rtx a=SET_SRC(p);
    return GET_CODE(a)==ASM_OPERANDS&&GET_MODE(a)==SImode&&!ASM_OPERANDS_TEMPLATE(a)[0]
        &&!strcmp(ASM_OPERANDS_OUTPUT_CONSTRAINT(a),"=r")&&ASM_OPERANDS_OUTPUT_IDX(a)==0
        &&ASM_OPERANDS_INPUT_LENGTH(a)==1&&ASM_OPERANDS_LABEL_LENGTH(a)==0
        &&rtx_equal_p(ASM_OPERANDS_INPUT(a,0),SET_DEST(p))&&!strcmp(ASM_OPERANDS_INPUT_CONSTRAINT(a,0),"0");
}
rtx_insn *previous_op(rtx_insn *i) {
    for(i=PREV_INSN(i);i;i=PREV_INSN(i)) {
        if(LABEL_P(i)||BARRIER_P(i)) return nullptr;
        if(NONDEBUG_INSN_P(i)) return i;
    }
    return nullptr;
}
bool low(rtx x) {return REG_P(x)&&GET_MODE(x)==SImode&&REGNO(x)<8;}
bool add(rtx_insn *i,rtx base,rtx size) {
    if(!i||!NONJUMP_INSN_P(i)||GET_CODE(PATTERN(i))!=SET) return false;
    rtx p=PATTERN(i),v=SET_SRC(p);
    return rtx_equal_p(SET_DEST(p),base)&&GET_CODE(v)==PLUS
        &&((rtx_equal_p(XEXP(v,0),base)&&rtx_equal_p(XEXP(v,1),size))
          ||(rtx_equal_p(XEXP(v,1),base)&&rtx_equal_p(XEXP(v,0),size)));
}
const pass_data data={RTL_PASS,"thumb_positive_advance",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if(!lookup_attribute("matching_thumb_positive_advance",DECL_ATTRIBUTES(fn->decl))) return 0;
        if(!TARGET_THUMB1||!lookup_attribute("matching_tail_transfer",DECL_ATTRIBUTES(fn->decl)))
            fatal_error(UNKNOWN_LOCATION,"Thumb positive advance requires private Thumb tails");
        unsigned folded=0;
        for(rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if(!JUMP_P(i)||GET_CODE(PATTERN(i))!=SET||SET_DEST(PATTERN(i))!=pc_rtx) continue;
            rtx choice=SET_SRC(PATTERN(i));if(GET_CODE(choice)!=IF_THEN_ELSE) continue;
            rtx test=XEXP(choice,0);
            if(GET_CODE(test)!=GE||!low(XEXP(test,0))||!low(XEXP(test,1))
                ||GET_CODE(XEXP(choice,1))!=LABEL_REF||XEXP(choice,2)!=pc_rtx) continue;
            rtx tmp=XEXP(test,0),base=XEXP(test,1);
            if(global_regs[REGNO(tmp)]||REGNO(tmp)==REGNO(base)||!find_regno_note(i,REG_DEAD,REGNO(tmp))) continue;
            rtx_insn *neg=previous_op(i);if(!neg||GET_CODE(PATTERN(neg))!=SET) continue;
            rtx p=PATTERN(neg),v=SET_SRC(p);
            if(!rtx_equal_p(SET_DEST(p),tmp)||GET_CODE(v)!=NEG||!low(XEXP(v,0))) continue;
            rtx size=XEXP(v,0);if(REGNO(size)==REGNO(base)||REGNO(size)==REGNO(tmp)) continue;
            rtx_insn *tie=previous_op(neg);if(!tie||!empty_tie(PATTERN(tie))||!rtx_equal_p(SET_DEST(PATTERN(tie)),size)) continue;
            rtx_insn *constant=previous_op(tie);if(!constant||GET_CODE(PATTERN(constant))!=SET) continue;
            p=PATTERN(constant);
            if(!rtx_equal_p(SET_DEST(p),size)||!CONST_INT_P(SET_SRC(p))||INTVAL(SET_SRC(p))<1||INTVAL(SET_SRC(p))>255) continue;
            rtx_insn *fall=next_op(i),*tail=fall?next_op(fall):nullptr;
            if(!add(fall,base,size)||!tail||!JUMP_P(tail)||GET_CODE(PATTERN(tail))!=SET||SET_DEST(PATTERN(tail))!=pc_rtx) continue;
            rtx symbol=SET_SRC(PATTERN(tail));if(GET_CODE(symbol)!=SYMBOL_REF||destination!=XSTR(symbol,0)) continue;
            rtx_insn *label=as_a<rtx_insn *>(XEXP(XEXP(choice,1),0));
            if(LABEL_NUSES(label)!=1||LABEL_PRESERVE_P(label)) continue;
            rtx_insn *cursor=NEXT_INSN(tail);while(cursor&&(NOTE_P(cursor)||DEBUG_INSN_P(cursor)||BARRIER_P(cursor))) cursor=NEXT_INSN(cursor);
            if(cursor!=label) continue;
            rtx_insn *taken=next_op(label);if(!add(taken,base,size)) continue;
            rtx_insn *join=next_op(taken);if(!join||!JUMP_P(join)||GET_CODE(PATTERN(join))!=SET||SET_DEST(PATTERN(join))!=pc_rtx||GET_CODE(SET_SRC(PATTERN(join)))!=LABEL_REF) continue;
            rtx_insn *end=as_a<rtx_insn *>(XEXP(SET_SRC(PATTERN(join)),0));
            cursor=NEXT_INSN(join);while(cursor&&(NOTE_P(cursor)||DEBUG_INSN_P(cursor)||BARRIER_P(cursor))) cursor=NEXT_INSN(cursor);
            rtx_insn *keep=cursor;
            while(cursor&&cursor!=end&&(NOTE_P(cursor)||DEBUG_INSN_P(cursor)||LABEL_P(cursor))) cursor=NEXT_INSN(cursor);
            if(cursor!=end) continue;
            if(!validate_change(i,&PATTERN(i),gen_match_thumb_add_positive_tail(copy_rtx(base),copy_rtx(size),copy_rtx(symbol)),false))
                fatal_error(UNKNOWN_LOCATION,"Thumb positive advance pattern rejected");
            REG_NOTES(i)=nullptr;
            // Remove the closed alternative region, retaining the shared join.
            cursor=NEXT_INSN(i);while(cursor!=keep) {rtx_insn *next=NEXT_INSN(cursor);delete_insn(cursor);cursor=next;}
            delete_insn(neg);folded++;
        }
        if(folded!=1) fatal_error(UNKNOWN_LOCATION,"Thumb positive advance requires exactly one safe fork");
        return 0;
    }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
    if(!plugin_default_version_check(version,&gcc_version)||info->argc!=1||strcmp(info->argv[0].key,"destination")||!info->argv[0].value||!info->argv[0].value[0]) return 1;
    destination=info->argv[0].value;
    register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);
    register_pass_info p={new pass(g),"shorten",1,PASS_POS_INSERT_AFTER};
    register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);
    return 0;
}
