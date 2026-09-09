// SPDX-License-Identifier: GPL-3.0-or-later
// Experimental range-checked ARM instruction-table lowering, not production.
#include "gcc-plugin.h"
#include "plugin-version.h"
#include "context.h"
#include "backend.h"
#include "insn-config.h"
#include "memmodel.h"
#include "tree-pass.h"
#include "tree.h"
#include "stringpool.h"
#include "attribs.h"
#include "function.h"
#include "rtl.h"
#include "emit-rtl.h"
#include "recog.h"
#include "tm.h"
#include "diagnostic-core.h"
#include "insn-constants.h"
#include "insn-flags.h"
int plugin_is_GPL_compatible;
namespace {
bool pc_relative=false;
bool sink_trampolines=false;
tree valid_switch_contract(tree *node,tree,tree,int,bool *no_add) {
    if(TREE_CODE(*node)!=FUNCTION_DECL) {
        error("matching_unchecked_switch requires a function declaration");
        *no_add=true;
    }
    return NULL_TREE;
}
const attribute_spec unchecked_attribute={"matching_unchecked_switch",0,0,true,false,false,false,valid_switch_contract,nullptr};
void register_contract(void *,void *) { register_attribute(&unchecked_attribute); }
void checked(rtx_insn *insn) {
    if (recog_memoized(insn)<0) { debug_rtx(PATTERN(insn)); fatal_error(UNKNOWN_LOCATION,"unrecognized instruction-table RTL"); }
}
rtx jump_target(rtx_insn *i) {
    if(!i || !JUMP_P(i) || GET_CODE(PATTERN(i))!=SET || SET_DEST(PATTERN(i))!=pc_rtx) return nullptr;
    rtx target=SET_SRC(PATTERN(i));
    return GET_CODE(target)==LABEL_REF ? XEXP(target,0) : nullptr;
}
// A jump around a jump-only block can become fallthrough if that block moves
// after the following block's unconditional terminator. All labels retain identity.
void sink_jump_only_blocks() {
    bool changed;
    do {
        changed=false;
        for(rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            rtx common=jump_target(i);
            if(!common)continue;
            rtx_insn *skip_barrier=next_nonnote_nondebug_insn(i);
            if(!skip_barrier || !BARRIER_P(skip_barrier))continue;
            rtx_insn *start=next_nonnote_nondebug_insn(skip_barrier);
            if(!start || !LABEL_P(start))continue;
            rtx_insn *jump=next_nonnote_nondebug_insn(start);
            while(jump && INSN_P(jump) && GET_CODE(PATTERN(jump))==ASM_OPERANDS
                  && ASM_OPERANDS_TEMPLATE(PATTERN(jump))[0]=='\0'
                  && ASM_OPERANDS_OUTPUT_CONSTRAINT(PATTERN(jump))[0]=='\0')
                jump=next_nonnote_nondebug_insn(jump);
            if(!jump_target(jump))continue;
            rtx_insn *end=next_nonnote_nondebug_insn(jump);
            if(!end || !BARRIER_P(end) || next_nonnote_nondebug_insn(end)!=common)continue;
            rtx_insn *terminator=next_nonnote_nondebug_insn(as_a<rtx_insn *>(common));
            while(terminator && GET_CODE(terminator)==INSN)terminator=next_nonnote_nondebug_insn(terminator);
            if(!jump_target(terminator))continue;
            rtx_insn *after=next_nonnote_nondebug_insn(terminator);
            if(!after || !BARRIER_P(after))continue;
            reorder_insns_nobb(start,end,after);
            remove_insn(i);
            remove_insn(skip_barrier);
            changed=true;
            break;
        }
    } while(changed);
}
const pass_data data={RTL_PASS,"branch_tables",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        bool unchecked=lookup_attribute("matching_unchecked_switch",DECL_ATTRIBUTES(fn->decl))!=NULL_TREE;
        if (!TARGET_ARM) {
            if(pc_relative || unchecked) fatal_error(UNKNOWN_LOCATION,"matching instruction-table options require ARM mode");
            return 0;
        }
        for(rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            rtx_insn *label=nullptr;rtx_jump_table_data *table=nullptr;
            if(!JUMP_P(i)||!tablejump_p(i,&label,&table))continue;
            rtx pat=PATTERN(i);
            if(GET_CODE(pat)!=PARALLEL||XVECLEN(pat,0)!=4)continue;
            rtx set=XVECEXP(pat,0,0);
            if(GET_CODE(set)!=SET||SET_DEST(set)!=pc_rtx)continue;
            rtx choice=SET_SRC(set);
            if(GET_CODE(choice)!=IF_THEN_ELSE)continue;
            rtx cond=XEXP(choice,0),access=XEXP(choice,1),fallback=XEXP(choice,2);
            if(GET_CODE(cond)!=LEU||!REG_P(XEXP(cond,0))||!CONST_INT_P(XEXP(cond,1))
               ||!MEM_P(access)||GET_CODE(fallback)!=LABEL_REF)continue;
            rtx address=XEXP(access,0);
            if(GET_CODE(address)!=PLUS||GET_CODE(XEXP(address,0))!=MULT||!REG_P(XEXP(address,1)))continue;
            rtx scale=XEXP(address,0),index=XEXP(cond,0),base=XEXP(address,1);
            if(!rtx_equal_p(XEXP(scale,0),index)||!CONST_INT_P(XEXP(scale,1))||INTVAL(XEXP(scale,1))!=4
               ||GET_MODE(index)!=SImode||GET_MODE(base)!=SImode||rtx_equal_p(base,index)
               ||REGNO(base)>=13||!find_regno_note(i,REG_DEAD,REGNO(base)))continue;
            rtx vector=PATTERN(table);
            if(GET_CODE(vector)!=ADDR_DIFF_VEC)continue;
            int n=XVECLEN(vector,1);
            if(n<1||INTVAL(XEXP(cond,1))!=n-1)continue;
            rtx_insn *load=prev_nonnote_nondebug_insn(i);
            if(!load||!INSN_P(load)||GET_CODE(PATTERN(load))!=SET
               ||!rtx_equal_p(SET_DEST(PATTERN(load)),base))continue;
            // Only a source-level valid-index contract permits omitting the guard.
            if(!unchecked) {
            rtx cc=gen_rtx_REG(CCmode,CC_REGNUM);
            checked(emit_insn_before(gen_rtx_SET(cc,gen_rtx_COMPARE(CCmode,copy_rtx(index),copy_rtx(XEXP(cond,1)))),i));
            checked(emit_jump_insn_before(gen_rtx_SET(pc_rtx,gen_rtx_IF_THEN_ELSE(VOIDmode,
                gen_rtx_GTU(VOIDmode,cc,const0_rtx),copy_rtx(fallback),pc_rtx)),i));
            }
#ifdef HAVE_match_arm_read_pc
            if(pc_relative) {
                checked(emit_insn_before(gen_match_arm_read_pc(copy_rtx(base)),i));
                checked(emit_insn_before(gen_rtx_SET(copy_rtx(base),gen_rtx_PLUS(SImode,copy_rtx(base),GEN_INT(8))),i));
            }
#endif
            checked(emit_insn_before(gen_rtx_SET(copy_rtx(base),gen_rtx_PLUS(SImode,gen_rtx_ASHIFT(SImode,copy_rtx(index),GEN_INT(2)),
                copy_rtx(base))),i));
#ifdef HAVE_match_arm_bx
            if(pc_relative) checked(emit_jump_insn_before(gen_match_arm_bx(copy_rtx(base)),i));
            else
#endif
                checked(emit_jump_insn_before(gen_indirect_jump(copy_rtx(base)),i));
            if(pc_relative) remove_insn(load);
            int entries=n;
            rtx_insn *following=next_nonnote_nondebug_insn(table);
            while(following && BARRIER_P(following)) following=next_nonnote_nondebug_insn(following);
            if(following && LABEL_P(following)
               && GET_CODE(XVECEXP(vector,1,n-1))==LABEL_REF
               && XEXP(XVECEXP(vector,1,n-1),0)==following) entries--;
            for(int j=0;j<entries;j++)checked(emit_jump_insn_before(gen_rtx_SET(pc_rtx,copy_rtx(XVECEXP(vector,1,j))),table));
            remove_insn(table);
            rtx_insn *previous=PREV_INSN(i);
            remove_insn(i);
            i=previous;
        }
        if(sink_trampolines) sink_jump_only_blocks();
        return 0;
    }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
    if(!plugin_default_version_check(version,&gcc_version))return 1;
    for(int a=0;a<info->argc;a++) {
        if(info->argv[a].value) return 1;
        if(!strcmp(info->argv[a].key,"pc-relative")) pc_relative=true;
        else if(!strcmp(info->argv[a].key,"sink-trampolines")) sink_trampolines=true;
        else return 1;
    }
#ifndef HAVE_match_arm_read_pc
    if(pc_relative) { error("pc-relative tables require the matching ARM backend"); return 1; }
#endif
    register_callback(info->base_name,PLUGIN_ATTRIBUTES,register_contract,nullptr);
    register_pass_info registration={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};
    register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&registration);
    return 0;
}
