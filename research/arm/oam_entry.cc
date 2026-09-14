// SPDX-License-Identifier: GPL-3.0-or-later
// Restricted terminal transfer conversion with explicit destination contracts.
#include <vector>
#include <set>
#include <string>
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
#include "ggc.h"
#include "attribs.h"
#include "diagnostic-core.h"
#include "insn-constants.h"
#include "insn-flags.h"
#include "options.h"
#include "hard-reg-set.h"
#include "regs.h"
int plugin_is_GPL_compatible;
namespace {

tree validate(tree *node,tree,tree,int,bool *no_add) {
    if (TREE_CODE(*node)!=FUNCTION_DECL) { error("research_arm_oam_entry requires a function");*no_add=true; }
    if (!TARGET_ARM) { error("OAM entry requires ARM mode"); *no_add=true; }
    return NULL_TREE;
}
const attribute_spec contract={"research_arm_oam_entry",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) { register_attribute(&contract); }
bool reg_is(rtx x,unsigned reg) { return REG_P(x) && GET_MODE(x)==SImode && REGNO(x)==reg; }
bool mentions(rtx x,unsigned reg) {
    if (!x) return false;
    if (REG_P(x)) return REGNO(x)==reg;
    if (LABEL_P(x)) return false;
    const char *format=GET_RTX_FORMAT(GET_CODE(x));
    for (int n=0;n<GET_RTX_LENGTH(GET_CODE(x));n++) {
        if (format[n]=='e' && mentions(XEXP(x,n),reg)) return true;
        if (format[n]=='E') for (int j=0;j<XVECLEN(x,n);j++) if (mentions(XVECEXP(x,n,j),reg)) return true;
    }
    return false;
}
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


bool executable_asm(rtx x) {
    if (!x||LABEL_P(x)) return false;
    if (GET_CODE(x)==ASM_INPUT) return true;
    if (GET_CODE(x)==ASM_OPERANDS) return *ASM_OPERANDS_TEMPLATE(x);
    const char *format=GET_RTX_FORMAT(GET_CODE(x));
    for (int n=0;n<GET_RTX_LENGTH(GET_CODE(x));n++) {
        if (format[n]=='e' && executable_asm(XEXP(x,n))) return true;
        if (format[n]=='E') for (int j=0;j<XVECLEN(x,n);j++) if (executable_asm(XVECEXP(x,n,j))) return true;
    }
    return false;
}


bool references_label(rtx x,rtx label) {
    if(!x || LABEL_P(x)) return false;
    if(GET_CODE(x)==LABEL_REF) return XEXP(x,0)==label;
    const char *format=GET_RTX_FORMAT(GET_CODE(x));
    for(int n=0;n<GET_RTX_LENGTH(GET_CODE(x));n++) {
        if(format[n]=='e' && references_label(XEXP(x,n),label)) return true;
        if(format[n]=='E') for(int j=0;j<XVECLEN(x,n);j++)
            if(references_label(XVECEXP(x,n,j),label)) return true;
    }
    return false;
}
const pass_data data={RTL_PASS,"oam_entry",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if(!lookup_attribute("research_arm_oam_entry",DECL_ATTRIBUTES(fn->decl))) return 0;
        unsigned nargs=0;for(tree a=DECL_ARGUMENTS(fn->decl);a;a=DECL_CHAIN(a)) nargs++;
        if(!TARGET_ARM || !arm_arch4t || arm_arch5t || !TARGET_INTERWORK || nargs!=4
            || !TREE_THIS_VOLATILE(fn->decl) || frame_pointer_needed || !known_eq(get_frame_size(),0)
            || crtl->profile || flag_unwind_tables || flag_asynchronous_unwind_tables || flag_exceptions
            || debug_info_level!=DINFO_LEVEL_NONE || !global_regs[SP_REGNUM]
            || TREE_CODE(TREE_TYPE(TREE_TYPE(fn->decl)))!=VOID_TYPE)
            fatal_error(UNKNOWN_LOCATION,"OAM entry requires private four-argument ARM frame");
        std::vector<rtx_insn *> ops;rtx_insn *word=nullptr;rtx last=nullptr,pool=nullptr;
        for(rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if(LABEL_P(i)) {if(LABEL_NUSES(i)) fatal_error(UNKNOWN_LOCATION,"OAM entry rejects control labels");last=i;}
            if(!NONDEBUG_INSN_P(i)) continue;
            rtx p=PATTERN(i);
            if(GET_CODE(p)==UNSPEC_VOLATILE) {
                if(XINT(p,1)==VUNSPEC_POOL_4) {
                    if(word || XVECLEN(p,0)!=1 || GET_CODE(XVECEXP(p,0,0))!=SYMBOL_REF
                        || std::string(XSTR(XVECEXP(p,0,0),0))!="gOamLoPutIt")
                        fatal_error(UNKNOWN_LOCATION,"OAM entry requires sole cursor pool");
                    word=i;pool=last;continue;
                }
                if(XINT(p,1)==VUNSPEC_ALIGN || XINT(p,1)==VUNSPEC_POOL_END) continue;
            }
            ops.push_back(i);
        }
        if(ops.size()!=7 || !word || !pool) fatal_error(UNKNOWN_LOCATION,"OAM entry requires seven-operation body");
        auto p=[&](int n){return PATTERN(ops[n]);};
        rtx push=p(0);
        if(GET_CODE(push)!=PARALLEL || XVECLEN(push,0)!=2)
            fatal_error(UNKNOWN_LOCATION,"OAM entry requires compiler r7/LR save");
        rtx first=XVECEXP(push,0,0),second=XVECEXP(push,0,1);
        if(GET_CODE(first)!=SET || !MEM_P(SET_DEST(first)) || GET_CODE(SET_SRC(first))!=UNSPEC
            || XINT(SET_SRC(first),1)!=UNSPEC_PUSH_MULT || XVECLEN(SET_SRC(first),0)!=1
            || !reg_is(XVECEXP(SET_SRC(first),0,0),7) || GET_CODE(second)!=USE || !reg_is(XEXP(second,0),LR_REGNUM))
            fatal_error(UNKNOWN_LOCATION,"OAM entry compiler save registers rejected");
        rtx address=XEXP(SET_DEST(first),0);
        if(GET_CODE(address)!=PRE_MODIFY || !reg_is(XEXP(address,0),SP_REGNUM)
            || GET_CODE(XEXP(address,1))!=PLUS || !reg_is(XEXP(XEXP(address,1),0),SP_REGNUM)
            || !CONST_INT_P(XEXP(XEXP(address,1),1)) || INTVAL(XEXP(XEXP(address,1),1))!=-8)
            fatal_error(UNKNOWN_LOCATION,"OAM entry compiler save size rejected");
        rtx sub=p(1);
        if(GET_CODE(sub)!=SET || !reg_is(SET_DEST(sub),SP_REGNUM) || GET_CODE(SET_SRC(sub))!=PLUS
            || !reg_is(XEXP(SET_SRC(sub),0),SP_REGNUM) || !CONST_INT_P(XEXP(SET_SRC(sub),1))
            || INTVAL(XEXP(SET_SRC(sub),1))!=-16)
            fatal_error(UNKNOWN_LOCATION,"OAM entry requires sixteen-byte private frame");
        for(int n:{2,5}) {
            unsigned reg=n==2?SP_REGNUM:7;rtx tie=p(n);
            if(GET_CODE(tie)!=SET || !reg_is(SET_DEST(tie),reg) || GET_CODE(SET_SRC(tie))!=ASM_OPERANDS
                || executable_asm(tie) || ASM_OPERANDS_INPUT_LENGTH(SET_SRC(tie))!=1
                || ASM_OPERANDS_LABEL_LENGTH(SET_SRC(tie)) || !reg_is(ASM_OPERANDS_INPUT(SET_SRC(tie),0),reg))
                fatal_error(UNKNOWN_LOCATION,"OAM entry tie rejected");
        }
        rtx stores=p(3);
        if(GET_CODE(stores)!=PARALLEL || XVECLEN(stores,0)!=4) fatal_error(UNKNOWN_LOCATION,"OAM entry requires four stores");
        for(int n=0;n<4;n++) {
            rtx x=XVECEXP(stores,0,n);
            if(GET_CODE(x)!=SET || !MEM_P(SET_DEST(x)) || GET_MODE(SET_DEST(x))!=SImode || !reg_is(SET_SRC(x),4+n))
                fatal_error(UNKNOWN_LOCATION,"OAM entry saved registers rejected");
            rtx a=XEXP(SET_DEST(x),0);
            if(n) {
                if(GET_CODE(a)!=PLUS || !CONST_INT_P(XEXP(a,1)) || INTVAL(XEXP(a,1))!=4*n)
                    fatal_error(UNKNOWN_LOCATION,"OAM entry stack offsets rejected");
                a=XEXP(a,0);
            }
            if(!reg_is(a,SP_REGNUM)) fatal_error(UNKNOWN_LOCATION,"OAM entry stack base rejected");
        }
        rtx load=p(4);
        if(GET_CODE(load)!=SET || !reg_is(SET_DEST(load),7) || !MEM_P(SET_SRC(load))
            || GET_MODE(SET_SRC(load))!=SImode || GET_CODE(XEXP(SET_SRC(load),0))!=LABEL_REF
            || XEXP(XEXP(SET_SRC(load),0),0)!=pool)
            fatal_error(UNKNOWN_LOCATION,"OAM entry cursor load rejected");
        rtx call=p(6);
        if(!CALL_P(ops[6]) || SIBLING_CALL_P(ops[6]) || CALL_INSN_FUNCTION_USAGE(ops[6])
            || GET_CODE(call)!=PARALLEL || XVECLEN(call,0)!=3)
            fatal_error(UNKNOWN_LOCATION,"OAM entry terminal call rejected");
        rtx c=XVECEXP(call,0,0),u=XVECEXP(call,0,1),k=XVECEXP(call,0,2);
        if(GET_CODE(c)!=CALL || !MEM_P(XEXP(c,0)) || GET_CODE(XEXP(XEXP(c,0),0))!=SYMBOL_REF
            || std::string(XSTR(XEXP(XEXP(c,0),0),0))!="PutOamSharedBody" || XEXP(c,1)!=const0_rtx
            || GET_CODE(u)!=USE || XEXP(u,0)!=const0_rtx || GET_CODE(k)!=CLOBBER || !reg_is(XEXP(k,0),LR_REGNUM))
            fatal_error(UNKNOWN_LOCATION,"OAM entry shared-body call contract rejected");
        rtvec vec=rtvec_alloc(4);
        RTVEC_ELT(vec,0)=gen_rtx_SET(gen_rtx_MEM(BLKmode,gen_rtx_PRE_MODIFY(SImode,stack_pointer_rtx,
            gen_rtx_PLUS(SImode,stack_pointer_rtx,GEN_INT(-16)))),
            gen_rtx_UNSPEC(BLKmode,gen_rtvec(1,gen_rtx_REG(SImode,4)),UNSPEC_PUSH_MULT));
        for(int n=1;n<4;n++) RTVEC_ELT(vec,n)=gen_rtx_USE(VOIDmode,gen_rtx_REG(SImode,4+n));
        rtx_insn *save=emit_insn_before(gen_rtx_PARALLEL(VOIDmode,vec),ops[1]);
        rtx_insn *tail=emit_call_insn_before(gen_sibcall_internal(copy_rtx(XEXP(c,0)),const0_rtx,const0_rtx),ops[6]);
        SIBLING_CALL_P(tail)=1;
        if(recog_memoized(save)<0 || recog_memoized(tail)<0) fatal_error(UNKNOWN_LOCATION,"OAM entry target patterns rejected");
        rtx literal=gen_match_arm_literal(copy_rtx(SET_DEST(load)),gen_rtx_SYMBOL_REF(SImode,ggc_strdup("PutOamLoCursorPointer")));
        if(!validate_change(ops[4],&PATTERN(ops[4]),literal,false)) fatal_error(UNKNOWN_LOCATION,"OAM entry external literal rejected");
        REG_NOTES(ops[4])=nullptr;
        for(int n:{0,1,2,3,6}) delete_insn(ops[n]);delete_insn(word);
        return 0;
    }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
    if(!plugin_default_version_check(version,&gcc_version) || info->argc) return 1;
    register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);
    register_pass_info p={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};
    register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);
    return 0;
}
