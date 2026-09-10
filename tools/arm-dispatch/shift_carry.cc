// SPDX-License-Identifier: GPL-3.0-or-later
// Retain an unsigned shifted value while branching on its discarded bit.
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
#include "insn-attr.h"
#include "hard-reg-set.h"
#include "regs.h"
int plugin_is_GPL_compatible;
namespace {
tree validate(tree *node,tree,tree,int,bool *no_add) {
    if (TREE_CODE(*node)!=FUNCTION_DECL) { error("matching_shift_carry requires a function");*no_add=true; }
    return NULL_TREE;
}
const attribute_spec contract={"matching_shift_carry",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) { register_attribute(&contract); }
bool low(rtx x) { return REG_P(x)&&GET_MODE(x)==SImode&&REGNO(x)<8; }
rtx_insn *next_operation(rtx_insn *i) {
    do { i=NEXT_INSN(i); } while(i&&(NOTE_P(i)||DEBUG_INSN_P(i)));
    return i&&NONDEBUG_INSN_P(i)?i:nullptr;
}
bool tie(rtx p,rtx reg) {
    if (GET_CODE(p)!=SET||!rtx_equal_p(SET_DEST(p),reg)) return false;
    rtx a=SET_SRC(p);
    return GET_CODE(a)==ASM_OPERANDS&&GET_MODE(a)==SImode&&!ASM_OPERANDS_TEMPLATE(a)[0]
        &&!strcmp(ASM_OPERANDS_OUTPUT_CONSTRAINT(a),"=r")&&ASM_OPERANDS_OUTPUT_IDX(a)==0
        &&ASM_OPERANDS_INPUT_LENGTH(a)==1&&ASM_OPERANDS_LABEL_LENGTH(a)==0
        &&rtx_equal_p(ASM_OPERANDS_INPUT(a,0),reg)&&!strcmp(ASM_OPERANDS_INPUT_CONSTRAINT(a,0),"0");
}
const pass_data data={RTL_PASS,"shift_carry",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_shift_carry",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!TARGET_THUMB1) fatal_error(UNKNOWN_LOCATION,"shift carry requires Thumb-1");
        unsigned folded=0;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (!NONJUMP_INSN_P(i)||GET_CODE(PATTERN(i))!=SET) continue;
            rtx copy=PATTERN(i),tmp=SET_DEST(copy),counter=SET_SRC(copy);
            if (!low(tmp)||!low(counter)||REGNO(tmp)==REGNO(counter)||global_regs[REGNO(tmp)]) continue;
            rtx_insn *shift=next_operation(i),*barrier=shift?next_operation(shift):nullptr,*branch=barrier?next_operation(barrier):nullptr;
            if (!shift||!barrier||!branch||!NONJUMP_INSN_P(shift)||!NONJUMP_INSN_P(barrier)||!JUMP_P(branch)) continue;
            rtx p=PATTERN(shift);
            if (GET_CODE(p)!=SET||!rtx_equal_p(SET_DEST(p),counter)||GET_CODE(SET_SRC(p))!=LSHIFTRT
                ||!rtx_equal_p(XEXP(SET_SRC(p),0),counter)||!CONST_INT_P(XEXP(SET_SRC(p),1))) continue;
            HOST_WIDE_INT amount=INTVAL(XEXP(SET_SRC(p),1));
            if (amount<1||amount>31||!tie(PATTERN(barrier),counter)) continue;
            rtx jump=PATTERN(branch);
            if (GET_CODE(jump)!=PARALLEL||XVECLEN(jump,0)!=2) continue;
            rtx set=XVECEXP(jump,0,0),clobber=XVECEXP(jump,0,1);
            if (GET_CODE(set)!=SET||SET_DEST(set)!=pc_rtx||GET_CODE(SET_SRC(set))!=IF_THEN_ELSE
                ||GET_CODE(clobber)!=CLOBBER||!rtx_equal_p(XEXP(clobber,0),tmp)) continue;
            rtx choice=SET_SRC(set),condition=XEXP(choice,0);
            if ((GET_CODE(condition)!=EQ&&GET_CODE(condition)!=NE)||XEXP(condition,1)!=const0_rtx
                ||GET_CODE(XEXP(condition,0))!=ZERO_EXTRACT||GET_CODE(XEXP(choice,1))!=LABEL_REF||XEXP(choice,2)!=pc_rtx) continue;
            rtx extract=XEXP(condition,0);
            if (!rtx_equal_p(XEXP(extract,0),tmp)||XEXP(extract,1)!=const1_rtx
                ||!CONST_INT_P(XEXP(extract,2))||INTVAL(XEXP(extract,2))!=amount-1
                ||!find_regno_note(branch,REG_DEAD,REGNO(tmp))||!find_regno_note(branch,REG_UNUSED,REGNO(tmp))) continue;
            rtx_insn *label=as_a<rtx_insn *>(XEXP(XEXP(choice,1),0));
            unsigned span=0;bool reached=false;
            for (rtx_insn *j=NEXT_INSN(branch);j;j=NEXT_INSN(j)) {
                if (j==label) { reached=true;break; }
                if (LABEL_P(j)||JUMP_P(j)||CALL_P(j)) break;
                if (NONDEBUG_INSN_P(j)) {
                    rtx body=PATTERN(j);
                    if (asm_noperands(body)>=0 && !(GET_CODE(body)==SET&&low(SET_DEST(body))&&tie(body,SET_DEST(body)))) break;
                    span+=get_attr_length(j);
                }
                if (span>240) break;
            }
            if (!reached) fatal_error(UNKNOWN_LOCATION,"shift carry requires a short forward single-block target");
            rtx test=copy_rtx(condition);
            XEXP(test,0)=gen_rtx_UNSPEC(SImode,gen_rtvec(2,copy_rtx(counter),GEN_INT(amount)),UNSPEC_MATCH_THUMB_SHIFT_CARRY);
            rtx replacement=gen_match_thumb_shift_carry(test,copy_rtx(counter),GEN_INT(amount),label);
            if (!validate_change(branch,&PATTERN(branch),replacement,false)) fatal_error(UNKNOWN_LOCATION,"shift carry replacement rejected");
            REG_NOTES(branch)=nullptr;
            delete_insn(i);delete_insn(shift);delete_insn(barrier);folded++;i=branch;
        }
        if (!folded) fatal_error(UNKNOWN_LOCATION,"shift carry found no eligible sequence");
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
