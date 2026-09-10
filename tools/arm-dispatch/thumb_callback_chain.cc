// SPDX-License-Identifier: GPL-3.0-or-later
// A private optional/mandatory callback pair using one shared BX trampoline.
#include <string>
#include <vector>
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
#include "options.h"
#include "hard-reg-set.h"
#include "regs.h"
#include "ggc.h"
int plugin_is_GPL_compatible;
namespace {
std::string trampoline;
long offset=-1;
tree validate(tree *node,tree,tree,int,bool *no_add) {
    if (TREE_CODE(*node)!=FUNCTION_DECL) { error("matching_thumb_callback_chain requires a function");*no_add=true; }
    return NULL_TREE;
}
const attribute_spec contract={"matching_thumb_callback_chain",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) { register_attribute(&contract); }
bool reg_is(rtx x,unsigned reg) { return REG_P(x)&&GET_MODE(x)==SImode&&REGNO(x)==reg; }
bool lr_push(rtx p) {
    if (GET_CODE(p)!=PARALLEL || XVECLEN(p,0)!=1) return false;
    rtx set=XVECEXP(p,0,0);
    if (GET_CODE(set)!=SET || !MEM_P(SET_DEST(set))) return false;
    rtx address=XEXP(SET_DEST(set),0),src=SET_SRC(set);
    if (GET_CODE(address)!=PRE_MODIFY || !reg_is(XEXP(address,0),SP_REGNUM)
        || GET_CODE(XEXP(address,1))!=PLUS) return false;
    rtx add=XEXP(address,1);
    return reg_is(XEXP(add,0),SP_REGNUM) && CONST_INT_P(XEXP(add,1)) && INTVAL(XEXP(add,1))==-4
        && GET_CODE(src)==UNSPEC && XINT(src,1)==UNSPEC_PUSH_MULT
        && XVECLEN(src,0)==1 && reg_is(XVECEXP(src,0,0),LR_REGNUM);
}

bool load(rtx p,unsigned dst,unsigned base,long limit) {
    if (GET_CODE(p)!=SET||!reg_is(SET_DEST(p),dst)) return false;
    rtx m=SET_SRC(p);if (!MEM_P(m)||GET_MODE(m)!=SImode||!MEM_VOLATILE_P(m)) return false;
    rtx a=XEXP(m,0);long displacement=0;
    if (GET_CODE(a)==PLUS&&CONST_INT_P(XEXP(a,1))) { displacement=INTVAL(XEXP(a,1));a=XEXP(a,0); }
    return reg_is(a,base)&&displacement>=0&&displacement<=limit&&!(displacement&3);
}
bool tie(rtx p) {
    if (GET_CODE(p)!=SET||!reg_is(SET_DEST(p),3)) return false;
    rtx a=SET_SRC(p);
    return GET_CODE(a)==ASM_OPERANDS&&GET_MODE(a)==SImode&&!ASM_OPERANDS_TEMPLATE(a)[0]
        &&!strcmp(ASM_OPERANDS_OUTPUT_CONSTRAINT(a),"=r")&&ASM_OPERANDS_OUTPUT_IDX(a)==0
        &&ASM_OPERANDS_INPUT_LENGTH(a)==1&&ASM_OPERANDS_LABEL_LENGTH(a)==0
        &&reg_is(ASM_OPERANDS_INPUT(a,0),3)&&!strcmp(ASM_OPERANDS_INPUT_CONSTRAINT(a,0),"0");
}
bool call(rtx_insn *i) {
    if (!CALL_P(i)||SIBLING_CALL_P(i)||CALL_INSN_FUNCTION_USAGE(i)) return false;
    rtx p=PATTERN(i);if (GET_CODE(p)!=PARALLEL||XVECLEN(p,0)!=3) return false;
    rtx c=XVECEXP(p,0,0),u=XVECEXP(p,0,1),k=XVECEXP(p,0,2);
    return GET_CODE(c)==CALL&&MEM_P(XEXP(c,0))&&reg_is(XEXP(XEXP(c,0),0),3)&&XEXP(c,1)==const0_rtx
        &&GET_CODE(u)==USE&&XEXP(u,0)==const0_rtx&&GET_CODE(k)==CLOBBER&&reg_is(XEXP(k,0),LR_REGNUM);
}
const pass_data data={RTL_PASS,"thumb_callback_chain",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_thumb_callback_chain",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!TARGET_THUMB1||frame_pointer_needed||!known_eq(get_frame_size(),0)||crtl->profile
            ||flag_unwind_tables||flag_asynchronous_unwind_tables||flag_exceptions||debug_info_level!=DINFO_LEVEL_NONE
            ||!global_regs[0]||!global_regs[3]||!global_regs[SP_REGNUM]||DECL_ARGUMENTS(fn->decl)
            ||TREE_CODE(TREE_TYPE(TREE_TYPE(fn->decl)))!=VOID_TYPE)
            fatal_error(UNKNOWN_LOCATION,"callback chain requires a private zero-frame void Thumb entry without debug/unwind");
        std::vector<rtx_insn *> ops;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) if (NONDEBUG_INSN_P(i)) ops.push_back(i);
        if (ops.size()!=11||!lr_push(PATTERN(ops[0]))||!load(PATTERN(ops[1]),3,0,124)||!tie(PATTERN(ops[2]))
            ||!load(PATTERN(ops[4]),0,0,124)||!call(ops[5])||!load(PATTERN(ops[6]),0,SP_REGNUM,60)
            ||!load(PATTERN(ops[7]),3,0,124)||!call(ops[8]))
            fatal_error(UNKNOWN_LOCATION,"callback chain load/call layout changed");
        rtx p=PATTERN(ops[3]);
        if (!JUMP_P(ops[3])||GET_CODE(p)!=SET||SET_DEST(p)!=pc_rtx||GET_CODE(SET_SRC(p))!=IF_THEN_ELSE)
            fatal_error(UNKNOWN_LOCATION,"callback chain missing optional branch");
        rtx choice=SET_SRC(p),test=XEXP(choice,0);
        if (GET_CODE(test)!=EQ||!reg_is(XEXP(test,0),3)||XEXP(test,1)!=const0_rtx
            ||GET_CODE(XEXP(choice,1))!=LABEL_REF||XEXP(choice,2)!=pc_rtx)
            fatal_error(UNKNOWN_LOCATION,"callback chain requires a null test on r3");
        rtx_insn *label=as_a<rtx_insn *>(XEXP(XEXP(choice,1),0));
        bool found=false;
        for (rtx_insn *i=NEXT_INSN(ops[6]);i&&i!=ops[7];i=NEXT_INSN(i)) if (i==label) found=true;
        if (!found||LABEL_NUSES(label)!=1||LABEL_PRESERVE_P(label))
            fatal_error(UNKNOWN_LOCATION,"callback chain branch target changed");
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) if (LABEL_P(i)&&i!=label&&(LABEL_NUSES(i)||LABEL_PRESERVE_P(i)))
            fatal_error(UNKNOWN_LOCATION,"callback chain has another live label");
        rtx sp=PATTERN(ops[9]),ep=PATTERN(ops[10]);
        if (GET_CODE(sp)!=UNSPEC||XINT(sp,1)!=UNSPEC_REGISTER_USE||XVECLEN(sp,0)!=1||!reg_is(XVECEXP(sp,0,0),SP_REGNUM)
            ||!JUMP_P(ops[10])||GET_CODE(ep)!=UNSPEC_VOLATILE||XINT(ep,1)!=VUNSPEC_EPILOGUE
            ||XVECLEN(ep,0)!=1||GET_CODE(XVECEXP(ep,0,0))!=RETURN)
            fatal_error(UNKNOWN_LOCATION,"callback chain epilogue changed");
        rtx symbol=gen_rtx_SYMBOL_REF(Pmode,ggc_strdup(trampoline.c_str()));
        for (unsigned n:{5U,8U}) {
            rtx replacement=gen_match_thumb_shared_callback(gen_rtx_REG(SImode,3),copy_rtx(symbol),GEN_INT(offset));
            if (!validate_change(ops[n],&PATTERN(ops[n]),replacement,false))
                fatal_error(UNKNOWN_LOCATION,"callback chain shared call rejected");
            REG_NOTES(ops[n])=nullptr;
        }
        for (unsigned n:{0U,2U,9U,10U}) delete_insn(ops[n]);
        return 0;
    }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
    if (!plugin_default_version_check(version,&gcc_version)) return 1;
    for (int n=0;n<info->argc;n++) {
        const char *key=info->argv[n].key,*value=info->argv[n].value;if (!value||!*value) return 1;
        if (!strcmp(key,"trampoline")&&trampoline.empty()) {
            if (!(ISALPHA(*value)||*value=='_')) return 1;
            for (const char *c=value;*c;c++) if (!(ISALNUM(*c)||*c=='_')) return 1;
            trampoline=value;
        } else if (!strcmp(key,"offset")&&offset<0) {
            char *end=nullptr;offset=strtol(value,&end,0);if (*end||offset<0||offset>1020||(offset&1)) return 1;
        } else return 1;
    }
    if (trampoline.empty()||offset<0) return 1;
    register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);
    register_pass_info p={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};
    register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);
    return 0;
}
