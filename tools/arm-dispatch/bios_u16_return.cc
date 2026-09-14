// SPDX-License-Identifier: GPL-3.0-or-later
// BIOS services 8 and 10 already return a zero-extended 16-bit value in r0.
// Remove only the redundant narrowing in an explicitly contracted leaf wrapper.
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
#include "tm.h"
#include "stringpool.h"
#include "attribs.h"
#include "diagnostic-core.h"
int plugin_is_GPL_compatible;
namespace {
void fail() { fatal_error(UNKNOWN_LOCATION,"BIOS u16 return requires a canonical Thumb service 8/10 leaf wrapper"); }
tree validate(tree *node,tree,tree,int,bool *no_add) {
    if (TREE_CODE(*node)!=FUNCTION_DECL) {
        error("matching_bios_u16_return requires a function"); *no_add=true;
    }
    return NULL_TREE;
}
const attribute_spec contract={"matching_bios_u16_return",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) { register_attribute(&contract); }
bool reg(rtx x, unsigned n, machine_mode mode=SImode) {
    return REG_P(x)&&GET_MODE(x)==mode&&REGNO(x)==n;
}
bool shift(rtx p, rtx_code code) {
    if (GET_CODE(p)!=SET||!reg(SET_DEST(p),0)) return false;
    rtx v=SET_SRC(p);
    return GET_CODE(v)==code&&GET_MODE(v)==SImode&&reg(XEXP(v,0),0)
        &&CONST_INT_P(XEXP(v,1))&&INTVAL(XEXP(v,1))==16;
}
const pass_data data={RTL_PASS,"bios_u16_return",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_bios_u16_return",DECL_ATTRIBUTES(fn->decl))) return 0;
        tree result=TREE_TYPE(TREE_TYPE(fn->decl));
        if (!TARGET_THUMB1||TREE_CODE(result)!=INTEGER_TYPE||TYPE_PRECISION(result)!=16||!TYPE_UNSIGNED(result)) fail();
        rtx_insn *ops[7]; unsigned count=0;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (LABEL_P(i)||CALL_P(i)) fail();
            if (INSN_P(i)) { if (count==7) fail(); ops[count++]=i; }
        }
        if (count!=7) fail();
        rtx p=PATTERN(ops[0]);
        if (GET_CODE(p)!=PARALLEL||XVECLEN(p,0)!=5) fail();
        rtx first=XVECEXP(p,0,0);
        if (GET_CODE(first)!=SET||!reg(SET_DEST(first),0)||GET_CODE(SET_SRC(first))!=ASM_OPERANDS) fail();
        rtx a=SET_SRC(first);
        int outputs=!strcmp(ASM_OPERANDS_TEMPLATE(a),"swi 8")?1:!strcmp(ASM_OPERANDS_TEMPLATE(a),"swi 0xa")?2:0;
        if (!outputs) fail();
        for (int n=0;n<outputs;n++) {
            rtx v=XVECEXP(p,0,n);
            if (GET_CODE(v)!=SET||!reg(SET_DEST(v),n)||GET_CODE(SET_SRC(v))!=ASM_OPERANDS) fail();
            rtx x=SET_SRC(v);
            if (!MEM_VOLATILE_P(x)||GET_MODE(x)!=SImode||strcmp(ASM_OPERANDS_TEMPLATE(x),ASM_OPERANDS_TEMPLATE(a))
                ||strcmp(ASM_OPERANDS_OUTPUT_CONSTRAINT(x),"=r")||ASM_OPERANDS_OUTPUT_IDX(x)!=n
                ||ASM_OPERANDS_INPUT_LENGTH(x)!=outputs||ASM_OPERANDS_LABEL_LENGTH(x)) fail();
            for (int k=0;k<outputs;k++) {
                if (!reg(ASM_OPERANDS_INPUT(x,k),k)||strcmp(ASM_OPERANDS_INPUT_CONSTRAINT(x,k),k?"1":"0")) fail();
            }
        }
        for (int n=outputs;n<5;n++) {
            rtx v=XVECEXP(p,0,n);
            if (GET_CODE(v)!=CLOBBER) fail();
            if (n==outputs) { if (!reg(XEXP(v,0),CC_REGNUM,CCmode)) fail(); }
            else if (!reg(XEXP(v,0),3-(n-outputs-1))) fail();
        }
        if (!shift(PATTERN(ops[1]),ASHIFT)||!shift(PATTERN(ops[2]),LSHIFTRT)) fail();
        p=PATTERN(ops[3]);
        if (GET_CODE(p)!=UNSPEC||XINT(p,1)!=UNSPEC_REGISTER_USE||XVECLEN(p,0)!=1||!reg(XVECEXP(p,0,0),13)) fail();
        for (int n=4;n<6;n++) {
            p=PATTERN(ops[n]);if (GET_CODE(p)!=USE||!reg(XEXP(p,0),n==4?0:14)) fail();
        }
        p=PATTERN(ops[6]);
        if (!JUMP_P(ops[6])||GET_CODE(p)!=UNSPEC_VOLATILE||XINT(p,1)!=VUNSPEC_EPILOGUE
            ||XVECLEN(p,0)!=1||GET_CODE(XVECEXP(p,0,0))!=RETURN) fail();
        delete_insn(ops[1]);delete_insn(ops[2]);
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
