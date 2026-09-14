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
    if (TREE_CODE(*node)!=FUNCTION_DECL) { error("matching_arm_irq_frame requires a function");*no_add=true; }
    if (!TARGET_ARM) { error("IRQ frame requires ARM mode"); *no_add=true; }
    return NULL_TREE;
}
const attribute_spec contract={"matching_arm_irq_frame",0,0,true,false,false,false,validate,nullptr};
const attribute_spec save_contract={"matching_arm_irq_save_frame",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) { register_attribute(&contract); register_attribute(&save_contract); }
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
            || !reg_is(ASM_OPERANDS_INPUT(a,0),3)
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
std::string external_pool,save_adjacent;
std::string handler_symbol = "gIRQHandlers";
void convert_save_frame(const std::vector<rtx_insn *> &ops) {
    if(ops.size()!=6 || !lr_push(PATTERN(ops[0])) || save_adjacent.empty())
        fatal_error(UNKNOWN_LOCATION,"IRQ frame save requires six operations and adjacent target");
    auto p=[&](int n){return PATTERN(ops[n]);};
    rtx read=p(1),tie=p(3),stores=p(4),call=p(5);
    if(GET_CODE(read)!=SET || !reg_is(SET_DEST(read),0) || GET_CODE(SET_SRC(read))!=ASM_OPERANDS)
        fatal_error(UNKNOWN_LOCATION,"IRQ frame save requires SPSR capture");
    rtx a=SET_SRC(read);
    if(std::string(ASM_OPERANDS_TEMPLATE(a))!="mrs %0, spsr" || ASM_OPERANDS_INPUT_LENGTH(a)
        || ASM_OPERANDS_LABEL_LENGTH(a) || !stack_add(p(2),-16)
        || GET_CODE(tie)!=SET || !reg_is(SET_DEST(tie),SP_REGNUM)
        || GET_CODE(SET_SRC(tie))!=ASM_OPERANDS || executable_asm(tie)
        || ASM_OPERANDS_INPUT_LENGTH(SET_SRC(tie))!=1
        || ASM_OPERANDS_LABEL_LENGTH(SET_SRC(tie))
        || !reg_is(ASM_OPERANDS_INPUT(SET_SRC(tie),0),SP_REGNUM)
        || GET_CODE(stores)!=PARALLEL || XVECLEN(stores,0)!=4)
        fatal_error(UNKNOWN_LOCATION,"IRQ frame save requires SPSR and sixteen-byte stack frame");
    unsigned regs[]={0,1,3,LR_REGNUM};
    for(int n=0;n<4;n++) {
        rtx x=XVECEXP(stores,0,n);
        if(GET_CODE(x)!=SET || !reg_is(SET_SRC(x),regs[n]) || !MEM_P(SET_DEST(x))
            || GET_MODE(SET_DEST(x))!=SImode)
            fatal_error(UNKNOWN_LOCATION,"IRQ frame save register layout rejected");
        rtx address=XEXP(SET_DEST(x),0);
        if(n ? !plus(address,SP_REGNUM,4*n) : !reg_is(address,SP_REGNUM))
            fatal_error(UNKNOWN_LOCATION,"IRQ frame save stack offsets rejected");
    }
    if(!CALL_P(ops[5]) || SIBLING_CALL_P(ops[5]) || CALL_INSN_FUNCTION_USAGE(ops[5])
        || GET_CODE(call)!=PARALLEL || XVECLEN(call,0)!=3)
        fatal_error(UNKNOWN_LOCATION,"IRQ frame save terminal call rejected");
    rtx c=XVECEXP(call,0,0),u=XVECEXP(call,0,1),k=XVECEXP(call,0,2);
    if(GET_CODE(c)!=CALL || !MEM_P(XEXP(c,0)) || GET_CODE(XEXP(XEXP(c,0),0))!=SYMBOL_REF
        || std::string(XSTR(XEXP(XEXP(c,0),0),0))!=save_adjacent || XEXP(c,1)!=const0_rtx
        || GET_CODE(u)!=USE || XEXP(u,0)!=const0_rtx || GET_CODE(k)!=CLOBBER
        || !reg_is(XEXP(k,0),LR_REGNUM))
        fatal_error(UNKNOWN_LOCATION,"IRQ frame save adjacent call contract rejected");
    // Use GCC's canonical multiple-register push representation.
    rtvec vec=rtvec_alloc(4);
    rtx address=gen_rtx_PRE_MODIFY(SImode,stack_pointer_rtx,
        gen_rtx_PLUS(SImode,stack_pointer_rtx,GEN_INT(-16)));
    RTVEC_ELT(vec,0)=gen_rtx_SET(gen_rtx_MEM(BLKmode,address),
        gen_rtx_UNSPEC(BLKmode,gen_rtvec(1,gen_rtx_REG(SImode,0)),UNSPEC_PUSH_MULT));
    for(int n=1;n<4;n++) RTVEC_ELT(vec,n)=gen_rtx_USE(VOIDmode,gen_rtx_REG(SImode,regs[n]));
    rtx_insn *push=emit_insn_before(gen_rtx_PARALLEL(VOIDmode,vec),ops[2]);
    if(recog_memoized(push)<0) fatal_error(UNKNOWN_LOCATION,"IRQ frame save writeback STM rejected");
    for(int n:{0,2,3,4,5}) delete_insn(ops[n]);
}

const pass_data data={RTL_PASS,"irq_frame",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        bool save_mode=lookup_attribute("matching_arm_irq_save_frame",DECL_ATTRIBUTES(fn->decl));
        if(!save_mode && !lookup_attribute("matching_arm_irq_frame",DECL_ATTRIBUTES(fn->decl))) return 0;
        if(!TARGET_ARM || !TARGET_INTERWORK || !arm_arch4t || arm_arch5t
            || lookup_attribute("interrupt",DECL_ATTRIBUTES(fn->decl))
            || lookup_attribute("isr",DECL_ATTRIBUTES(fn->decl))
            || !TREE_THIS_VOLATILE(fn->decl) || DECL_ARGUMENTS(fn->decl)
            || frame_pointer_needed || !known_eq(get_frame_size(),0) || crtl->profile
            || flag_unwind_tables || flag_asynchronous_unwind_tables || flag_exceptions
            || debug_info_level!=DINFO_LEVEL_NONE || !global_regs[LR_REGNUM] || !global_regs[SP_REGNUM]
            || TREE_CODE(TREE_TYPE(TREE_TYPE(fn->decl)))!=VOID_TYPE)
            fatal_error(UNKNOWN_LOCATION,"IRQ frame requires private noreturn ARM frame");
        std::vector<rtx_insn *> ops;
        for(rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if(LABEL_P(i) && LABEL_NUSES(i)) fatal_error(UNKNOWN_LOCATION,"IRQ frame rejects control-flow labels");
            if(!NONDEBUG_INSN_P(i)) continue;
            rtx p=PATTERN(i);
            if(GET_CODE(p)==UNSPEC_VOLATILE && (XINT(p,1)==VUNSPEC_ALIGN
                || XINT(p,1)==VUNSPEC_POOL_4 || XINT(p,1)==VUNSPEC_POOL_END)) continue;
            ops.push_back(i);
        }
        if(save_mode) { convert_save_frame(ops); return 0; }
        if(ops.size()!=25 || !lr_push(PATTERN(ops[0])))
            fatal_error(UNKNOWN_LOCATION,"IRQ frame requires bounded entry-save skeleton");
        auto p=[&](int n){return PATTERN(ops[n]);};
        if(!status_read(p(2)) || !status_read(p(16)) || !mode_write(p(5)) || !mode_write(p(19))
            || !saved_status_write(p(23)) || !private_call(ops[14],0) || !private_call(ops[24],LR_REGNUM)
            || !stack_add(p(11),-4) || !stack_add(p(21),16) || !frame_load(p(20)))
            fatal_error(UNKNOWN_LOCATION,"IRQ frame requires banked frame and private calls");
        rtx tie=p(12),save=p(13),restore=p(15);
        if(GET_CODE(tie)!=SET || !reg_is(SET_DEST(tie),SP_REGNUM)
            || GET_CODE(SET_SRC(tie))!=ASM_OPERANDS || executable_asm(tie)
            || ASM_OPERANDS_INPUT_LENGTH(SET_SRC(tie))!=1
            || !reg_is(ASM_OPERANDS_INPUT(SET_SRC(tie),0),SP_REGNUM)
            || GET_CODE(save)!=SET || !MEM_P(SET_DEST(save)) || GET_MODE(SET_DEST(save))!=SImode
            || !reg_is(XEXP(SET_DEST(save),0),SP_REGNUM) || !reg_is(SET_SRC(save),LR_REGNUM)
            || GET_CODE(restore)!=SET || !reg_is(SET_DEST(restore),LR_REGNUM)
            || !MEM_P(SET_SRC(restore)) || GET_MODE(SET_SRC(restore))!=SImode
            || GET_CODE(XEXP(SET_SRC(restore),0))!=POST_INC
            || !reg_is(XEXP(XEXP(SET_SRC(restore),0),0),SP_REGNUM))
            fatal_error(UNKNOWN_LOCATION,"IRQ frame requires explicit System LR frame");
        for(int n:{1,3,4,6,7,8,9,10,17,18,22})
            if(CALL_P(ops[n]) || JUMP_P(ops[n]) || mentions(p(n),SP_REGNUM)
                || mentions(p(n),LR_REGNUM) || executable_asm(p(n)))
                fatal_error(UNKNOWN_LOCATION,"IRQ frame rejects other stack/LR/control effects");
        if(!external_pool.empty()) {
            rtx load=p(6);
            if(GET_CODE(load)!=SET || !reg_is(SET_DEST(load),1) || !MEM_P(SET_SRC(load))
                || GET_MODE(SET_SRC(load))!=SImode || GET_CODE(XEXP(SET_SRC(load),0))!=LABEL_REF)
                fatal_error(UNKNOWN_LOCATION,"IRQ frame requires direct handler-pool load");
            rtx label=XEXP(XEXP(SET_SRC(load),0),0);
            for(unsigned n=0;n<ops.size();n++)
                if(n!=6 && references_label(p(n),label))
                    fatal_error(UNKNOWN_LOCATION,"IRQ frame rejects shared handler-pool references");
            rtx_insn *word=nullptr;rtx last=nullptr;
            for(rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
                if(LABEL_P(i)) last=i;
                if(!NONDEBUG_INSN_P(i)) continue;
                rtx x=PATTERN(i);
                if(GET_CODE(x)!=UNSPEC_VOLATILE || XINT(x,1)!=VUNSPEC_POOL_4) continue;
                if(word || last!=label || XVECLEN(x,0)!=1 || GET_CODE(XVECEXP(x,0,0))!=SYMBOL_REF
                    || std::string(XSTR(XVECEXP(x,0,0),0))!=handler_symbol)
                    fatal_error(UNKNOWN_LOCATION,"IRQ frame requires sole handler symbol word");
                word=i;
            }
            if(!word) fatal_error(UNKNOWN_LOCATION,"IRQ frame missing handler symbol word");
            rtx replacement=gen_match_arm_literal(copy_rtx(SET_DEST(load)),
                gen_rtx_SYMBOL_REF(SImode,ggc_strdup(external_pool.c_str())));
            if(!validate_change(ops[6],&PATTERN(ops[6]),replacement,false))
                fatal_error(UNKNOWN_LOCATION,"IRQ frame external literal rejected");
            REG_NOTES(ops[6])=nullptr;
            delete_insn(word);
        }
        rtx_insn *push=emit_insn_before(gen_match_arm_stmdb_word(copy_rtx(SET_SRC(save))),ops[11]);
        rtx_insn *system_pop=emit_insn_before(gen_match_arm_ldmia_word(copy_rtx(SET_DEST(restore))),ops[15]);
        rtx_insn *callback=emit_call_insn_before(gen_match_arm_call_addzero(gen_rtx_REG(SImode,0)),ops[14]);
        if(recog_memoized(push)<0 || recog_memoized(system_pop)<0 || recog_memoized(callback)<0)
            fatal_error(UNKNOWN_LOCATION,"IRQ frame block-transfer/callback patterns rejected");
        delete_insn(ops[11]); delete_insn(ops[12]); delete_insn(ops[13]);
        delete_insn(ops[14]); delete_insn(ops[15]);
        // The validated loads exclude SP as a destination. Combine their following
        // stack advance into the target's standard writeback LDM pattern.
        rtvec loads=rtvec_alloc(5);
        RTVEC_ELT(loads,0)=copy_rtx(p(21));
        for(int n=0;n<4;n++) RTVEC_ELT(loads,n+1)=copy_rtx(XVECEXP(p(20),0,n));
        rtx_insn *pop=emit_insn_before(gen_rtx_PARALLEL(VOIDmode,loads),ops[20]);
        if(recog_memoized(pop)<0) fatal_error(UNKNOWN_LOCATION,"IRQ frame writeback LDM rejected");
        delete_insn(ops[20]); delete_insn(ops[21]);
        rtx_insn *leave=emit_jump_insn_before(gen_simple_return(),ops[24]);
        if(recog_memoized(leave)<0) fatal_error(UNKNOWN_LOCATION,"IRQ frame return pattern rejected");
        delete_insn(ops[24]); delete_insn(ops[0]);
        return 0;
    }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
    if(!plugin_default_version_check(version,&gcc_version)) return 1;
    bool handler_option = false;
    for(int n=0;n<info->argc;n++) {
        if(std::string(info->argv[n].key)=="handler-symbol") {
            if(handler_option || !info->argv[n].value || !*info->argv[n].value) return 1;
            handler_option = true;
            handler_symbol = info->argv[n].value;
            for(char c:handler_symbol) if(!((c>='a'&&c<='z')||(c>='A'&&c<='Z')||(c>='0'&&c<='9')||c=='_')) return 1;
            if(handler_symbol[0]>='0'&&handler_symbol[0]<='9') return 1;
            continue;
        }
        if(std::string(info->argv[n].key)=="save-adjacent" && info->argv[n].value && *info->argv[n].value && save_adjacent.empty()) {
            save_adjacent=info->argv[n].value; continue;
        }
        if(std::string(info->argv[n].key)!="pool" || !info->argv[n].value || !external_pool.empty()) return 1;
        external_pool=info->argv[n].value;
        if(external_pool.empty()) return 1;
        for(char c:external_pool) if(!((c>='a'&&c<='z')||(c>='A'&&c<='Z')||(c>='0'&&c<='9')||c=='_')) return 1;
        if(external_pool[0]>='0'&&external_pool[0]<='9') return 1;
    }
    if(handler_option && (external_pool.empty() || !save_adjacent.empty())) return 1;
    register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);
    register_pass_info p={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};
    register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);
    return 0;
}
