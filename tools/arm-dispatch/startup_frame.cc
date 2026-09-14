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
    if (TREE_CODE(*node)!=FUNCTION_DECL) { error("matching_arm_startup_frame requires a function");*no_add=true; }
    if (!TARGET_ARM) { error("Startup frame requires ARM mode"); *no_add=true; }
    return NULL_TREE;
}
const attribute_spec contract={"matching_arm_startup_frame",0,0,true,false,false,false,validate,nullptr};
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
bool memory_clobber(rtx x) {
    return GET_CODE(x)==CLOBBER && MEM_P(XEXP(x,0))
        && GET_CODE(XEXP(XEXP(x,0),0))==SCRATCH;
}
bool plus(rtx x,unsigned r,HOST_WIDE_INT amount) {
    return GET_CODE(x)==PLUS && reg_is(XEXP(x,0),r)
        && CONST_INT_P(XEXP(x,1)) && INTVAL(XEXP(x,1))==amount;
}
bool stack_add(rtx p,int amount) {
    return GET_CODE(p)==SET && reg_is(SET_DEST(p),SP_REGNUM)
        && plus(SET_SRC(p),SP_REGNUM,amount);
}
bool status_read(rtx p) {
    if (GET_CODE(p)!=SET || !reg_is(SET_DEST(p),3)) return false;
    rtx a=SET_SRC(p);
    return GET_CODE(a)==ASM_OPERANDS && std::string(ASM_OPERANDS_TEMPLATE(a))=="mrs %0, cpsr"
        && !ASM_OPERANDS_INPUT_LENGTH(a) && !ASM_OPERANDS_LABEL_LENGTH(a);
}
bool mode_write(rtx p) {
    if (GET_CODE(p)!=PARALLEL || XVECLEN(p,0)!=3 || !memory_clobber(XVECEXP(p,0,2))) return false;
    unsigned regs[]={SP_REGNUM,LR_REGNUM};
    for(int n=0;n<2;n++) {
        rtx x=XVECEXP(p,0,n);
        if(GET_CODE(x)!=SET || !reg_is(SET_DEST(x),regs[n])) return false;
        rtx a=SET_SRC(x);
        if(GET_CODE(a)!=ASM_OPERANDS || std::string(ASM_OPERANDS_TEMPLATE(a))!="msr cpsr_fc, %2"
            || ASM_OPERANDS_INPUT_LENGTH(a)!=3 || ASM_OPERANDS_LABEL_LENGTH(a)
            || !reg_is(ASM_OPERANDS_INPUT(a,0),0)
            || !reg_is(ASM_OPERANDS_INPUT(a,1),SP_REGNUM)
            || !reg_is(ASM_OPERANDS_INPUT(a,2),LR_REGNUM)
            || std::string(ASM_OPERANDS_OUTPUT_CONSTRAINT(a))!=(n==0?"=k":"=r")) return false;
    }
    return true;
}
bool saved_status_write(rtx p) {
    if(GET_CODE(p)!=PARALLEL || XVECLEN(p,0)!=2 || !memory_clobber(XVECEXP(p,0,1))) return false;
    rtx a=XVECEXP(p,0,0);
    return GET_CODE(a)==ASM_OPERANDS && std::string(ASM_OPERANDS_TEMPLATE(a))=="msr spsr_fc, %0"
        && ASM_OPERANDS_INPUT_LENGTH(a)==1 && !ASM_OPERANDS_LABEL_LENGTH(a)
        && reg_is(ASM_OPERANDS_INPUT(a,0),0);
}
bool private_call(rtx_insn *i,unsigned r) {
    rtx p=PATTERN(i);
    if(!CALL_P(i)||SIBLING_CALL_P(i)||CALL_INSN_FUNCTION_USAGE(i)
        ||GET_CODE(p)!=PARALLEL||XVECLEN(p,0)!=3) return false;
    rtx c=XVECEXP(p,0,0),u=XVECEXP(p,0,1),k=XVECEXP(p,0,2);
    return GET_CODE(c)==CALL && MEM_P(XEXP(c,0)) && reg_is(XEXP(XEXP(c,0),0),r)
        && XEXP(c,1)==const0_rtx && GET_CODE(u)==USE && XEXP(u,0)==const0_rtx
        && GET_CODE(k)==CLOBBER && reg_is(XEXP(k,0),LR_REGNUM);
}
bool frame_load(rtx p) {
    if(GET_CODE(p)!=PARALLEL || XVECLEN(p,0)!=4) return false;
    unsigned regs[]={0,1,3,LR_REGNUM};
    for(int n=0;n<4;n++) {
        rtx x=XVECEXP(p,0,n);
        if(GET_CODE(x)!=SET || !reg_is(SET_DEST(x),regs[n]) || !MEM_P(SET_SRC(x))
            || GET_MODE(SET_SRC(x))!=SImode) return false;
        rtx address=XEXP(SET_SRC(x),0);
        if(n ? !plus(address,SP_REGNUM,4*n) : !reg_is(address,SP_REGNUM)) return false;
    }
    return true;
}
bool tie_reg(rtx p,unsigned reg) {
    if(GET_CODE(p)!=SET || !reg_is(SET_DEST(p),reg) || GET_CODE(SET_SRC(p))!=ASM_OPERANDS) return false;
    rtx a=SET_SRC(p);
    return !*ASM_OPERANDS_TEMPLATE(a) && ASM_OPERANDS_INPUT_LENGTH(a)==1
        && !ASM_OPERANDS_LABEL_LENGTH(a) && reg_is(ASM_OPERANDS_INPUT(a,0),reg);
}
bool literal_load(rtx p,unsigned reg) {
    if(GET_CODE(p)!=SET || !reg_is(SET_DEST(p),reg) || !MEM_P(SET_SRC(p)) || GET_MODE(SET_SRC(p))!=SImode) return false;
    rtx address=XEXP(SET_SRC(p),0);
    if(GET_CODE(address)==CONST) address=XEXP(address,0);
    if(GET_CODE(address)==PLUS) {
        if(!CONST_INT_P(XEXP(address,1))) return false;
        address=XEXP(address,0);
    }
    return GET_CODE(address)==LABEL_REF;
}
bool exact_layout=false;
const pass_data data={RTL_PASS,"startup_frame",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if(!lookup_attribute("matching_arm_startup_frame",DECL_ATTRIBUTES(fn->decl))) return 0;
        if(!TARGET_ARM || !TARGET_INTERWORK || !arm_arch4t || arm_arch5t
            || lookup_attribute("interrupt",DECL_ATTRIBUTES(fn->decl))
            || lookup_attribute("isr",DECL_ATTRIBUTES(fn->decl))
            || !TREE_THIS_VOLATILE(fn->decl) || DECL_ARGUMENTS(fn->decl)
            || frame_pointer_needed || !known_eq(get_frame_size(),0) || crtl->profile
            || flag_unwind_tables || flag_asynchronous_unwind_tables || flag_exceptions
            || debug_info_level!=DINFO_LEVEL_NONE || !global_regs[LR_REGNUM] || !global_regs[SP_REGNUM]
            || TREE_CODE(TREE_TYPE(TREE_TYPE(fn->decl)))!=VOID_TYPE)
            fatal_error(UNKNOWN_LOCATION,"Startup frame requires private noreturn ARM frame");
        std::vector<rtx_insn *> ops;std::vector<rtx_insn *> labels;
        for(rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if(LABEL_P(i) && LABEL_NUSES(i)) labels.push_back(i);
            if(!NONDEBUG_INSN_P(i)) continue;
            rtx p=PATTERN(i);
            if(GET_CODE(p)==UNSPEC_VOLATILE && (XINT(p,1)==VUNSPEC_ALIGN
                || XINT(p,1)==VUNSPEC_POOL_4 || XINT(p,1)==VUNSPEC_POOL_END)) continue;
            ops.push_back(i);
        }
        if(ops.size()!=18 || !lr_push(PATTERN(ops[0])) || labels.size()!=1)
            fatal_error(UNKNOWN_LOCATION,"Startup frame requires bounded loop and sole entry save");
        auto p=[&](int n){return PATTERN(ops[n]);};
        for(int n:{1,5}) {
            rtx x=p(n);
            if(GET_CODE(x)!=SET || !reg_is(SET_DEST(x),0) || !CONST_INT_P(SET_SRC(x))
                || INTVAL(SET_SRC(x))!=(n==1?0x12:0x1f))
                fatal_error(UNKNOWN_LOCATION,"Startup frame mode value rejected");
        }
        if(!mode_write(p(2)) || !mode_write(p(6)) || !literal_load(p(3),SP_REGNUM)
            || !literal_load(p(7),SP_REGNUM) || !literal_load(p(9),1)
            || !literal_load(p(11),0) || !literal_load(p(14),1)
            || !tie_reg(p(4),SP_REGNUM) || !tie_reg(p(8),SP_REGNUM)
            || !tie_reg(p(10),1) || !tie_reg(p(12),0) || !tie_reg(p(15),1)
            || !private_call(ops[16],1))
            fatal_error(UNKNOWN_LOCATION,"Startup frame initialization/call contract rejected");
        rtx store=p(13),branch=p(17);
        if(GET_CODE(store)!=SET || !MEM_P(SET_DEST(store)) || GET_MODE(SET_DEST(store))!=SImode
            || !reg_is(XEXP(SET_DEST(store),0),1) || !reg_is(SET_SRC(store),0)
            || !JUMP_P(ops[17]) || GET_CODE(branch)!=SET || SET_DEST(branch)!=pc_rtx
            || GET_CODE(SET_SRC(branch))!=LABEL_REF || XEXP(SET_SRC(branch),0)!=labels[0])
            fatal_error(UNKNOWN_LOCATION,"Startup frame vector store/restart rejected");
        rtx_insn *next=NEXT_INSN(labels[0]);
        while(next && !NONDEBUG_INSN_P(next)) next=NEXT_INSN(next);
        if(next!=ops[1] || LABEL_NUSES(labels[0])!=1)
            fatal_error(UNKNOWN_LOCATION,"Startup frame restart must precede first mode assignment");
        if(exact_layout) {
            std::vector<rtx_insn *> pool;
            rtx pool_label=nullptr,last=nullptr;
            for(rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
                if(LABEL_P(i)) last=i;
                if(!NONDEBUG_INSN_P(i)) continue;
                rtx x=PATTERN(i);
                if(GET_CODE(x)==UNSPEC_VOLATILE && XINT(x,1)==VUNSPEC_POOL_4) {
                    if(pool.empty()) pool_label=last;
                    pool.push_back(i);
                }
            }
            if(pool.size()!=5 || !pool_label) fatal_error(UNKNOWN_LOCATION,"Startup frame requires five-word source pool");
            const char *names[]={"__sp_irq","__sp_usr",nullptr,"IrqMain","AgbMain"};
            int indexes[]={3,7,9,11,14};
            for(int n=0;n<5;n++) {
                rtx x=PATTERN(pool[n]);
                if(XVECLEN(x,0)!=1) fatal_error(UNKNOWN_LOCATION,"Startup frame invalid pool word");
                rtx value=XVECEXP(x,0,0);
                if(names[n] ? (GET_CODE(value)!=SYMBOL_REF || std::string(XSTR(value,0))!=names[n])
                    : (!CONST_INT_P(value) || INTVAL(value)!=0x03007ffc))
                    fatal_error(UNKNOWN_LOCATION,"Startup frame source pool value rejected");
                rtx address=XEXP(SET_SRC(p(indexes[n])),0);
                if(n) {
                    if(GET_CODE(address)!=CONST || GET_CODE(XEXP(address,0))!=PLUS)
                        fatal_error(UNKNOWN_LOCATION,"Startup frame pool offset rejected");
                    address=XEXP(address,0);
                    if(!CONST_INT_P(XEXP(address,1)) || INTVAL(XEXP(address,1))!=4*n)
                        fatal_error(UNKNOWN_LOCATION,"Startup frame pool displacement rejected");
                    address=XEXP(address,0);
                }
                if(GET_CODE(address)!=LABEL_REF || XEXP(address,0)!=pool_label)
                    fatal_error(UNKNOWN_LOCATION,"Startup frame pool label rejected");
                rtx replacement;
                if(n==3) replacement=gen_match_arm_pc_address(copy_rtx(SET_DEST(p(indexes[n]))),GEN_INT(24));
                else {
                    rtx symbol=gen_rtx_SYMBOL_REF(SImode,ggc_strdup(n<2?"StartupStackPointers":"StartupFarPointers"));
                    int offset=n==0 || n==4 ? 4 : 0;
                    if(offset) symbol=gen_rtx_CONST(SImode,gen_rtx_PLUS(SImode,symbol,GEN_INT(offset)));
                    replacement=gen_match_arm_literal(copy_rtx(SET_DEST(p(indexes[n]))),symbol);
                }
                if(!validate_change(ops[indexes[n]],&PATTERN(ops[indexes[n]]),replacement,false))
                    fatal_error(UNKNOWN_LOCATION,"Startup frame address pattern %d rejected",n);
                REG_NOTES(ops[indexes[n]])=nullptr;
            }
            for(rtx_insn *word:pool) delete_insn(word);
        }
        delete_insn(ops[0]);
        return 0;
    }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
    if(!plugin_default_version_check(version,&gcc_version)) return 1;
    if(info->argc) {
        if(info->argc!=1 || std::string(info->argv[0].key)!="layout" || info->argv[0].value) return 1;
        exact_layout=true;
    }
    register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);
    register_pass_info p={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};
    register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);
    return 0;
}
