// SPDX-License-Identifier: GPL-3.0-or-later
// Fold a tied private decrement/zero test when only equality flags are live.
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
    if (TREE_CODE(*node)!=FUNCTION_DECL) { error("matching_subtract_zero requires a function");*no_add=true; }
    return NULL_TREE;
}
const attribute_spec contract={"matching_subtract_zero",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) { register_attribute(&contract); }
bool general(rtx x) { return REG_P(x)&&GET_MODE(x)==SImode&&REGNO(x)<13; }
bool mentions(rtx x,unsigned reg) {
    if (!x||LABEL_P(x)) return false;
    if (REG_P(x)) return REGNO(x)==reg;
    const char *f=GET_RTX_FORMAT(GET_CODE(x));
    for (int n=0;n<GET_RTX_LENGTH(GET_CODE(x));n++) {
        if (f[n]=='e'&&mentions(XEXP(x,n),reg)) return true;
        if (f[n]=='E') for (int j=0;j<XVECLEN(x,n);j++) if (mentions(XVECEXP(x,n,j),reg)) return true;
    }
    return false;
}
rtx_insn *following(rtx_insn *i) { i=NEXT_INSN(i);while (i&&NOTE_P(i)) i=NEXT_INSN(i);return i; }
bool tied_identity(rtx p,rtx base) {
    if (GET_CODE(p)!=SET||!rtx_equal_p(SET_DEST(p),base)) return false;
    rtx a=SET_SRC(p);
    return GET_CODE(a)==ASM_OPERANDS&&GET_MODE(a)==SImode&&!ASM_OPERANDS_TEMPLATE(a)[0]
        &&!strcmp(ASM_OPERANDS_OUTPUT_CONSTRAINT(a),"=r")&&ASM_OPERANDS_OUTPUT_IDX(a)==0
        &&ASM_OPERANDS_INPUT_LENGTH(a)==1&&ASM_OPERANDS_LABEL_LENGTH(a)==0
        &&rtx_equal_p(ASM_OPERANDS_INPUT(a,0),base)
        &&!strcmp(ASM_OPERANDS_INPUT_CONSTRAINT(a,0),"0");
}
bool equality_lifetime(rtx_insn *cmp,rtx cc) {
    unsigned users=0;
    for (rtx_insn *i=NEXT_INSN(cmp);i;i=NEXT_INSN(i)) {
        if (NOTE_P(i)||DEBUG_INSN_P(i)) continue;
        if (!NONDEBUG_INSN_P(i)) return false;
        if (CALL_P(i)) return users&&!mentions(CALL_INSN_FUNCTION_USAGE(i),CC_REGNUM);
        rtx p=PATTERN(i);
        if (JUMP_P(i)) return users&&(GET_CODE(p)==SIMPLE_RETURN||GET_CODE(p)==RETURN);
        if (GET_CODE(p)==SET&&REG_P(SET_DEST(p))&&REGNO(SET_DEST(p))==CC_REGNUM)
            return users&&!mentions(SET_SRC(p),CC_REGNUM);
        if (asm_noperands(p)>=0) return false;
        if (GET_CODE(p)==COND_EXEC) {
            rtx test=COND_EXEC_TEST(p);
            if ((GET_CODE(test)!=EQ&&GET_CODE(test)!=NE)||!rtx_equal_p(XEXP(test,0),cc)
                ||XEXP(test,1)!=const0_rtx||mentions(COND_EXEC_CODE(p),CC_REGNUM)) return false;
            users++;continue;
        }
        if (mentions(p,CC_REGNUM)||GET_CODE(p)==ASM_INPUT||GET_CODE(p)==ASM_OPERANDS) return false;
    }
    return false;
}
const pass_data data={RTL_PASS,"subtract_zero",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_subtract_zero",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!TARGET_ARM) fatal_error(UNKNOWN_LOCATION,"subtract zero requires ARM mode");
        unsigned folded=0;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (!NONJUMP_INSN_P(i)||GET_CODE(PATTERN(i))!=SET) continue;
            rtx set=PATTERN(i),base=SET_DEST(set),add=SET_SRC(set);
            if (!general(base)||GET_CODE(add)!=PLUS||!rtx_equal_p(XEXP(add,0),base)
                ||!CONST_INT_P(XEXP(add,1))||INTVAL(XEXP(add,1))!=-1) continue;
            rtx_insn *tie=following(i);
            if (!tie||!NONJUMP_INSN_P(tie)||!tied_identity(PATTERN(tie),base)) continue;
            rtx_insn *cmp=following(tie);
            if (!cmp||!NONJUMP_INSN_P(cmp)||GET_CODE(PATTERN(cmp))!=SET) continue;
            rtx comparison=PATTERN(cmp),cc=SET_DEST(comparison),test=SET_SRC(comparison);
            if (!REG_P(cc)||REGNO(cc)!=CC_REGNUM||GET_MODE(cc)!=CCmode||GET_CODE(test)!=COMPARE
                ||!rtx_equal_p(XEXP(test,0),base)||XEXP(test,1)!=const0_rtx||!equality_lifetime(cmp,cc)) continue;
            rtx flags=gen_rtx_SET(copy_rtx(cc),gen_rtx_COMPARE(CCmode,copy_rtx(base),const1_rtx));
            rtx value=gen_rtx_SET(copy_rtx(base),gen_rtx_MINUS(SImode,copy_rtx(base),const1_rtx));
            rtx replacement=gen_rtx_PARALLEL(VOIDmode,gen_rtvec(2,flags,value));
            if (!validate_change(i,&PATTERN(i),replacement,false)) fatal_error(UNKNOWN_LOCATION,"subtract zero pattern rejected");
            REG_NOTES(i)=nullptr;
            delete_insn(tie);delete_insn(cmp);folded++;
        }
        if (!folded) fatal_error(UNKNOWN_LOCATION,"subtract zero found no eligible equality-only sequence");
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
