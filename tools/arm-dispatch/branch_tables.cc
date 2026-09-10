// SPDX-License-Identifier: GPL-3.0-or-later
// ARM instruction-table lowering for the pinned matching backend.
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
#include "stringpool.h"
#include "attribs.h"
#include "function.h"
#include "ggc.h"
#include "rtl.h"
#include "emit-rtl.h"
#include "recog.h"
#include "tm.h"
#include "diagnostic-core.h"
#include "insn-constants.h"
#include "insn-flags.h"
#include "output.h"
int plugin_is_GPL_compatible;
namespace {
bool pc_relative=false;
bool sink_trampolines=false;
std::vector<std::string> prefix_symbols;
struct shared_entry { std::string source,target; long offset; };
std::vector<shared_entry> shared_entries;
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
void shared_literal(const shared_entry &entry) {
    const auto &shared_source=entry.source;
    const auto &shared_target=entry.target;
    long shared_offset=entry.offset;
#ifdef HAVE_match_arm_literal
    rtx_code_label *last=nullptr,*pool=nullptr;
    long offset=0,wanted=-1;
    for(rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
        if(LABEL_P(i))last=as_a<rtx_code_label *>(i);
        if(!NONDEBUG_INSN_P(i))continue;
        rtx p=PATTERN(i);
        if(GET_CODE(p)!=UNSPEC_VOLATILE || XINT(p,1)!=VUNSPEC_POOL_4)continue;
        if(!pool)pool=last;
        if(pool!=last || XVECLEN(p,0)!=1)fatal_error(UNKNOWN_LOCATION,"shared literal needs one word pool");
        rtx value=XVECEXP(p,0,0);
        if(GET_CODE(value)==SYMBOL_REF && shared_source==XSTR(value,0)) {
            if(wanted>=0)fatal_error(UNKNOWN_LOCATION,"duplicate shared literal");
            wanted=offset;
        }
        offset+=4;
    }
    if(wanted<0)fatal_error(UNKNOWN_LOCATION,"shared literal source missing");
    unsigned changed=0;
    for(rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
        if(!NONDEBUG_INSN_P(i)||GET_CODE(PATTERN(i))!=SET)continue;
        rtx set=PATTERN(i),memory=SET_SRC(set);
        if(!MEM_P(memory))continue;
        rtx address=XEXP(memory,0);
        if(GET_CODE(address)==CONST)address=XEXP(address,0);
        long displacement=0;
        if(GET_CODE(address)==PLUS && CONST_INT_P(XEXP(address,1))) {
            displacement=INTVAL(XEXP(address,1));address=XEXP(address,0);
        }
        if(GET_CODE(address)!=LABEL_REF || XEXP(address,0)!=pool || displacement!=wanted)continue;
        rtx target=gen_rtx_SYMBOL_REF(Pmode,ggc_strdup(shared_target.c_str()));
        if(shared_offset)target=gen_rtx_CONST(Pmode,gen_rtx_PLUS(Pmode,target,GEN_INT(shared_offset)));
        rtx replacement=gen_match_arm_literal(copy_rtx(SET_DEST(set)),target);
        if(!validate_change(i,&PATTERN(i),replacement,true)) {
            cancel_changes(0);fatal_error(UNKNOWN_LOCATION,"shared literal instruction rejected");
        }
        changed++;
    }
    if(!changed || !apply_change_group())fatal_error(UNKNOWN_LOCATION,"shared literal rewrite failed");
#endif
}
bool references(rtx x,rtx label) {
    if(!x)return false;
    if(GET_CODE(x)==LABEL_REF)return XEXP(x,0)==label;
    if(LABEL_P(x))return false;
    const char *format=GET_RTX_FORMAT(GET_CODE(x));
    for(int j=0;j<GET_RTX_LENGTH(GET_CODE(x));j++) {
        if(format[j]=='e' && references(XEXP(x,j),label))return true;
        if(format[j]=='E')for(int k=0;k<XVECLEN(x,j);k++)if(references(XVECEXP(x,j,k),label))return true;
    }
    return false;
}
void emit_prefix(const std::vector<rtx> &targets) {
    if(prefix_symbols.empty())return;
    if(targets.empty())fatal_error(UNKNOWN_LOCATION,"prefix table missing");
    std::vector<rtx> values;
    std::vector<rtx_insn *> literals;
    rtx_insn *end=nullptr;
    rtx_code_label *last=nullptr,*pool=nullptr;
    for(rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
        if(LABEL_P(i))last=as_a<rtx_code_label *>(i);
        if(!NONDEBUG_INSN_P(i))continue;
        rtx p=PATTERN(i);
        if(GET_CODE(p)!=UNSPEC_VOLATILE)continue;
        if(XINT(p,1)==VUNSPEC_POOL_4) {
            if(!pool)pool=last;
            if(pool!=last || XVECLEN(p,0)!=1)fatal_error(UNKNOWN_LOCATION,"prefix needs one simple word pool");
            values.push_back(XVECEXP(p,0,0));literals.push_back(i);
        } else if(XINT(p,1)==VUNSPEC_POOL_END) {
            if(end)fatal_error(UNKNOWN_LOCATION,"multiple prefix pools");
            end=i;
        }
    }
    if(!pool || !end)fatal_error(UNKNOWN_LOCATION,"prefix pool missing");
    for(rtx_insn *i=get_insns();i;i=NEXT_INSN(i))
        if(NONDEBUG_INSN_P(i) && references(PATTERN(i),pool))fatal_error(UNKNOWN_LOCATION,"prefix has unconverted literal references");
    std::vector<rtx> selected;
    for(const auto &name:prefix_symbols) {
        rtx found=nullptr;
        for(rtx value:values)if(GET_CODE(value)==SYMBOL_REF && name==XSTR(value,0)) {
            if(found)fatal_error(UNKNOWN_LOCATION,"duplicate prefix symbol");found=value;
        }
        if(!found)fatal_error(UNKNOWN_LOCATION,"prefix symbol missing");
        selected.push_back(found);
    }
    switch_to_section(function_section(current_function_decl));
    assemble_align(32);
    for(rtx value:selected) { fputs("\t.word\t",asm_out_file);output_addr_const(asm_out_file,value);fputc('\n',asm_out_file); }
    rtx_code_label *prefix=gen_label_rtx();
    char name[64];ASM_GENERATE_INTERNAL_LABEL(name,"L",CODE_LABEL_NUMBER(prefix));
    ASM_OUTPUT_INTERNAL_LABEL(asm_out_file,name);
    fputs("\t.arm\n",asm_out_file);
    for(rtx target:targets) {
        // Targets come from the compiler's checked branch vector, never ROM bytes.
        output_asm_insn("b\t%l0",&target);
    }
    fputs("\t.word\t",asm_out_file);
    output_addr_const(asm_out_file,gen_rtx_LABEL_REF(Pmode,prefix));fputc('\n',asm_out_file);
    for(rtx_insn *i:literals)remove_insn(i);
    remove_insn(end);
}
const pass_data data={RTL_PASS,"branch_tables",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        bool unchecked=lookup_attribute("matching_unchecked_switch",DECL_ATTRIBUTES(fn->decl))!=NULL_TREE;
        if (!TARGET_ARM) {
            if(pc_relative || unchecked || !shared_entries.empty() || !prefix_symbols.empty()) fatal_error(UNKNOWN_LOCATION,"matching instruction-table options require ARM mode");
            return 0;
        }
        std::vector<rtx> prefix_targets;
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
            if(!prefix_symbols.empty()) {
                if(!prefix_targets.empty())fatal_error(UNKNOWN_LOCATION,"multiple prefix dispatch tables");
                for(int j=0;j<n;j++)prefix_targets.push_back(copy_rtx(XVECEXP(vector,1,j)));
            }
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
        for(const auto &entry:shared_entries) shared_literal(entry);
        emit_prefix(prefix_targets);
        return 0;
    }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
    if(!plugin_default_version_check(version,&gcc_version))return 1;
    for(int a=0;a<info->argc;a++) {
        if(!strcmp(info->argv[a].key,"prefix-symbols")) {
            if(!info->argv[a].value || !prefix_symbols.empty())return 1;
            std::string text=info->argv[a].value;
            size_t start=0;
            do {
                size_t end=text.find(',',start);
                std::string symbol=text.substr(start,end==std::string::npos?end:end-start);
                if(symbol.empty())return 1;
                for(const auto &old:prefix_symbols)if(old==symbol)return 1;
                prefix_symbols.push_back(symbol);
                if(end==std::string::npos)break;
                start=end+1;
            } while(true);
            continue;
        }
        if(!strcmp(info->argv[a].key,"shared-literal")) {
            if(!info->argv[a].value)return 1;
            std::string shared_source,shared_target;
            long shared_offset;
            std::string text=info->argv[a].value;
            auto first=text.find(','),second=text.find(',',first==std::string::npos?first:first+1);
            if(first==std::string::npos || second==std::string::npos)return 1;
            shared_source=text.substr(0,first);shared_target=text.substr(first+1,second-first-1);
            char *end=nullptr;shared_offset=strtol(text.c_str()+second+1,&end,10);
            auto symbol=[](const std::string &name) {
                if(name.empty() || (name[0]!='_' && !(name[0]>='A' && name[0]<='Z') && !(name[0]>='a' && name[0]<='z')))return false;
                for(char c:name)if(c!='_' && !(c>='A' && c<='Z') && !(c>='a' && c<='z') && !(c>='0' && c<='9'))return false;
                return true;
            };
            if(second+1==text.size() || !end || *end || !symbol(shared_source) || !symbol(shared_target)
               || shared_offset<0 || shared_offset>4092 || shared_offset%4)return 1;
            for(const auto &entry:shared_entries)if(entry.source==shared_source)return 1;
            shared_entries.push_back({shared_source,shared_target,shared_offset});
            continue;
        }
        if(info->argv[a].value) return 1;
        if(!strcmp(info->argv[a].key,"pc-relative")) pc_relative=true;
        else if(!strcmp(info->argv[a].key,"sink-trampolines")) sink_trampolines=true;
        else return 1;
    }
#ifndef HAVE_match_arm_read_pc
    if(pc_relative) { error("pc-relative tables require the matching ARM backend"); return 1; }
#endif
#ifndef HAVE_match_arm_literal
    if(!shared_entries.empty()) { error("shared literals require the matching ARM backend"); return 1; }
#endif
    register_callback(info->base_name,PLUGIN_ATTRIBUTES,register_contract,nullptr);
    register_pass_info registration={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};
    register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&registration);
    return 0;
}
