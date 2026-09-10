// SPDX-License-Identifier: GPL-3.0-or-later
// Reduce a widened signed addition's positive test to ARM ADDS/BGT.
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
#include "regs.h"
int plugin_is_GPL_compatible;
namespace {
tree validate(tree *node,tree,tree,int,bool *no_add) {
    if (TREE_CODE(*node)!=FUNCTION_DECL) { error("matching_signed_sum requires a function");*no_add=true; }
    return NULL_TREE;
}
const attribute_spec contract={"matching_signed_sum",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) { register_attribute(&contract); }
bool general(rtx x) { return REG_P(x)&&GET_MODE(x)==SImode&&REGNO(x)<13; }
rtx_insn *following(rtx_insn *i) { i=NEXT_INSN(i);while(i&&NOTE_P(i)) i=NEXT_INSN(i);return i; }
rtx shift(rtx x) { return gen_rtx_ASHIFTRT(SImode,copy_rtx(x),GEN_INT(31)); }
rtx sum(rtx a,rtx b) { return gen_rtx_PLUS(SImode,copy_rtx(a),copy_rtx(b)); }
const pass_data data={RTL_PASS,"signed_sum",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_signed_sum",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!TARGET_ARM) fatal_error(UNKNOWN_LOCATION,"signed sum requires ARM mode");
        unsigned folded=0;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (!NONJUMP_INSN_P(i)||GET_CODE(PATTERN(i))!=SET) continue;
            rtx first=PATTERN(i),tmp=SET_DEST(first),extension=SET_SRC(first);
            if (!general(tmp)||global_regs[REGNO(tmp)]||GET_CODE(extension)!=ASHIFTRT
                ||!general(XEXP(extension,0))||!CONST_INT_P(XEXP(extension,1))||INTVAL(XEXP(extension,1))!=31) continue;
            rtx base=XEXP(extension,0);
            if (REGNO(tmp)==REGNO(base)) continue;
            rtx_insn *ops[5];rtx_insn *cursor=i;bool complete=true;
            for (unsigned n=0;n<5;n++) { cursor=following(cursor);ops[n]=cursor;if (!cursor) {complete=false;break;} }
            if (!complete) continue;
            for (unsigned n=0;n<4;n++) if (!NONJUMP_INSN_P(ops[n])) complete=false;
            if (!complete||!JUMP_P(ops[4])) continue;
            rtx low=PATTERN(ops[0]);
            if (GET_CODE(low)!=PARALLEL||XVECLEN(low,0)!=2) continue;
            rtx value=XVECEXP(low,0,1);
            if (GET_CODE(value)!=SET||!rtx_equal_p(SET_DEST(value),base)||GET_CODE(SET_SRC(value))!=PLUS) continue;
            rtx other=XEXP(SET_SRC(value),0);
            if (!general(other)||REGNO(other)==REGNO(base)||REGNO(other)==REGNO(tmp)) continue;
            rtx carry=gen_rtx_REG(CC_Cmode,CC_REGNUM),cc=gen_rtx_REG(CCmode,CC_REGNUM),nv=gen_rtx_REG(CC_NVmode,CC_REGNUM);
            rtx expected=gen_rtx_PARALLEL(VOIDmode,gen_rtvec(2,
                gen_rtx_SET(copy_rtx(carry),gen_rtx_COMPARE(CC_Cmode,sum(other,base),copy_rtx(other))),
                gen_rtx_SET(copy_rtx(base),sum(other,base))));
            if (!rtx_equal_p(low,expected)) continue;
            expected=gen_rtx_SET(copy_rtx(tmp),gen_rtx_PLUS(SImode,
                gen_rtx_PLUS(SImode,shift(other),gen_rtx_LTU(SImode,copy_rtx(carry),const0_rtx)),copy_rtx(tmp)));
            if (!rtx_equal_p(PATTERN(ops[1]),expected)) continue;
            expected=gen_rtx_SET(copy_rtx(cc),gen_rtx_COMPARE(CCmode,copy_rtx(base),const1_rtx));
            if (!rtx_equal_p(PATTERN(ops[2]),expected)) continue;
            expected=gen_rtx_PARALLEL(VOIDmode,gen_rtvec(2,
                gen_rtx_SET(copy_rtx(nv),gen_rtx_COMPARE(CC_NVmode,gen_rtx_SIGN_EXTEND(DImode,copy_rtx(tmp)),
                    gen_rtx_LTU(DImode,copy_rtx(cc),const0_rtx))),gen_rtx_CLOBBER(VOIDmode,copy_rtx(tmp))));
            if (!rtx_equal_p(PATTERN(ops[3]),expected)||!find_regno_note(ops[3],REG_DEAD,REGNO(tmp))
                ||!find_regno_note(ops[3],REG_UNUSED,REGNO(tmp))) continue;
            rtx branch=PATTERN(ops[4]);
            if (GET_CODE(branch)!=SET||SET_DEST(branch)!=pc_rtx||GET_CODE(SET_SRC(branch))!=IF_THEN_ELSE) continue;
            rtx choice=SET_SRC(branch),condition=XEXP(choice,0);
            if (GET_CODE(condition)!=GE||!rtx_equal_p(XEXP(condition,0),nv)||XEXP(condition,1)!=const0_rtx
                ||GET_CODE(XEXP(choice,1))!=LABEL_REF||XEXP(choice,2)!=pc_rtx||!find_regno_note(ops[4],REG_DEAD,CC_REGNUM)) continue;
            rtx replacement=gen_match_arm_signed_sum_flags(copy_rtx(base),copy_rtx(other),copy_rtx(base));
            rtx newbranch=copy_rtx(branch);
            XEXP(SET_SRC(newbranch),0)=gen_rtx_GT(GET_MODE(condition),copy_rtx(cc),const0_rtx);
            validate_change(i,&PATTERN(i),replacement,true);
            validate_change(ops[4],&PATTERN(ops[4]),newbranch,true);
            if (!apply_change_group()) fatal_error(UNKNOWN_LOCATION,"signed sum replacement rejected");
            REG_NOTES(i)=nullptr;
            if (rtx dead=find_regno_note(ops[4],REG_DEAD,CC_REGNUM)) remove_note(ops[4],dead);
            add_reg_note(ops[4],REG_DEAD,copy_rtx(cc));
            for (unsigned n=0;n<4;n++) delete_insn(ops[n]);
            folded++;
        }
        if (!folded) fatal_error(UNKNOWN_LOCATION,"signed sum found no eligible widened positive test");
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
