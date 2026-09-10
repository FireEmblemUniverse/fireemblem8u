// SPDX-License-Identifier: GPL-3.0-or-later
// Explicit private Thumb PC handoff with read-only access to the mixer frame.
#include <vector>
#include <string>
#include "safe-ctype.h"
#include <map>
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
#include "options.h"
int plugin_is_GPL_compatible;
namespace {
std::string symbol;
long offset=-1,site=-1;
bool references(rtx x,rtx label) {
    if (!x) return false;
    if (GET_CODE(x)==LABEL_REF) return XEXP(x,0)==label;
    if (LABEL_P(x)) return false;
    const char *format=GET_RTX_FORMAT(GET_CODE(x));
    for (int n=0;n<GET_RTX_LENGTH(GET_CODE(x));n++) {
        if (format[n]=='e' && references(XEXP(x,n),label)) return true;
        if (format[n]=='E') for (int j=0;j<XVECLEN(x,n);j++) if (references(XVECEXP(x,n,j),label)) return true;
    }
    return false;
}
tree validate(tree *node,tree,tree,int,bool *no_add) {
    if (TREE_CODE(*node)!=FUNCTION_DECL) { error("matching_thumb_pc_handoff requires a function");*no_add=true; }
    return NULL_TREE;
}
const attribute_spec contract={"matching_thumb_pc_handoff",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) { register_attribute(&contract); }
bool mentions(rtx x,unsigned reg) {
    if (!x||LABEL_P(x)) return false;
    if (REG_P(x)) return REGNO(x)==reg;
    const char *format=GET_RTX_FORMAT(GET_CODE(x));
    for (int n=0;n<GET_RTX_LENGTH(GET_CODE(x));n++) {
        if (format[n]=='e'&&mentions(XEXP(x,n),reg)) return true;
        if (format[n]=='E') for (int k=0;k<XVECLEN(x,n);k++) if (mentions(XVECEXP(x,n,k),reg)) return true;
    }
    return false;
}

const pass_data data={RTL_PASS,"thumb_pc_handoff",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_thumb_pc_handoff",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!TARGET_THUMB1||frame_pointer_needed||!known_eq(get_frame_size(),0)||crtl->profile
            ||flag_unwind_tables||flag_asynchronous_unwind_tables||flag_exceptions||debug_info_level!=DINFO_LEVEL_NONE
            ||!global_regs[0]||!global_regs[SP_REGNUM]||DECL_ARGUMENTS(fn->decl)||TREE_CODE(TREE_TYPE(TREE_TYPE(fn->decl)))!=VOID_TYPE)
            fatal_error(UNKNOWN_LOCATION,"Thumb PC handoff requires a zero-frame private void Thumb-1 entry without debug/unwind");
        std::vector<rtx_insn *> ops;
        bool ended=false;unsigned stage=0;
        rtx_insn *word=nullptr,*align=nullptr;rtx_code_label *last=nullptr,*pool=nullptr;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (LABEL_P(i)) last=as_a<rtx_code_label *>(i);
            if (!NONDEBUG_INSN_P(i)) continue;
            rtx p=PATTERN(i);
            if (ended) {
                if (GET_CODE(p)!=UNSPEC_VOLATILE||XVECLEN(p,0)!=1)
                    fatal_error(UNKNOWN_LOCATION,"Thumb PC handoff code after epilogue");
                int kind=XINT(p,1);
                if (stage==0&&kind==VUNSPEC_ALIGN) { align=i;stage=1; }
                else if (stage==1&&kind==VUNSPEC_POOL_4&&GET_CODE(XVECEXP(p,0,0))==SYMBOL_REF) {
                    const char *name=XSTR(XVECEXP(p,0,0),0);if (*name=='*') name++;
                    if (symbol!=name||!last) fatal_error(UNKNOWN_LOCATION,"Thumb PC handoff symbol mismatch");
                    word=i;pool=last;stage=2;
                } else if (stage==2&&kind==VUNSPEC_POOL_END) stage=3;
                else fatal_error(UNKNOWN_LOCATION,"Thumb PC handoff requires one symbol pool");
                continue;
            }
            ops.push_back(i);
            if (GET_CODE(p)==UNSPEC_VOLATILE&&XINT(p,1)==VUNSPEC_EPILOGUE) ended=true;
        }
        if (stage!=3) fatal_error(UNKNOWN_LOCATION,"Thumb PC handoff missing symbol pool");
        if (ops.size()<4) fatal_error(UNKNOWN_LOCATION,"Thumb PC handoff missing complete leaf tail");
        unsigned n=ops.size();rtx_insn *spuse=ops[n-3],*lruse=ops[n-2],*ret=ops[n-1];
        rtx sp=PATTERN(spuse),lr=PATTERN(lruse),ep=PATTERN(ret);
        if (GET_CODE(sp)!=UNSPEC||XINT(sp,1)!=UNSPEC_REGISTER_USE||XVECLEN(sp,0)!=1
            ||!REG_P(XVECEXP(sp,0,0))||REGNO(XVECEXP(sp,0,0))!=SP_REGNUM
            ||GET_CODE(lr)!=USE||!REG_P(XEXP(lr,0))||REGNO(XEXP(lr,0))!=LR_REGNUM
            ||!JUMP_P(ret)||GET_CODE(ep)!=UNSPEC_VOLATILE||XINT(ep,1)!=VUNSPEC_EPILOGUE
            ||XVECLEN(ep,0)!=1||GET_CODE(XVECEXP(ep,0,0))!=RETURN)
            fatal_error(UNKNOWN_LOCATION,"Thumb PC handoff leaf epilogue changed");
        rtx_insn *load=ops[n-4];rtx lp=PATTERN(load);
        if (GET_CODE(lp)!=SET||!REG_P(SET_DEST(lp))||REGNO(SET_DEST(lp))!=0||GET_MODE(SET_DEST(lp))!=SImode
            ||!MEM_P(SET_SRC(lp))||GET_MODE(SET_SRC(lp))!=SImode||MEM_VOLATILE_P(SET_SRC(lp))
            ||GET_CODE(XEXP(SET_SRC(lp),0))!=LABEL_REF||XEXP(XEXP(SET_SRC(lp),0),0)!=pool)
            fatal_error(UNKNOWN_LOCATION,"Thumb PC handoff requires final r0 target load");
        unsigned bytes=0,uses=0;
        for (rtx_insn *i:ops) {
            if (references(PATTERN(i),pool)) uses++;
        }
        for (unsigned k=0;k<n-4;k++) bytes+=get_attr_length(ops[k]);
        if (uses!=1||bytes!=(unsigned)site) fatal_error(UNKNOWN_LOCATION,"Thumb PC handoff target site or pool uses changed");
        for (rtx_insn *i=get_insns();i&&i!=spuse;i=NEXT_INSN(i)) {
            if (LABEL_P(i)) fatal_error(UNKNOWN_LOCATION,"Thumb PC handoff requires a straight body");
            if (!NONDEBUG_INSN_P(i)) continue;
            rtx p=PATTERN(i);
            if (CALL_P(i)||JUMP_P(i)||asm_noperands(p)>=0||mentions(p,LR_REGNUM))
                fatal_error(UNKNOWN_LOCATION,"Thumb PC handoff rejects calls, branches, assembly or LR accesses");
            if (!mentions(p,SP_REGNUM)) continue;
            // The private frame is read-only: one aligned SI load at an offset 0..60.
            if (GET_CODE(p)!=SET||!REG_P(SET_DEST(p))||REGNO(SET_DEST(p))>=13
                ||GET_MODE(SET_DEST(p))!=SImode||!MEM_P(SET_SRC(p))||GET_MODE(SET_SRC(p))!=SImode)
                fatal_error(UNKNOWN_LOCATION,"Thumb PC handoff permits only word reads from the private frame");
            rtx address=XEXP(SET_SRC(p),0);HOST_WIDE_INT offset=0;
            if (GET_CODE(address)==PLUS&&CONST_INT_P(XEXP(address,1))) {
                offset=INTVAL(XEXP(address,1));address=XEXP(address,0);
            }
            if (!REG_P(address)||REGNO(address)!=SP_REGNUM||offset<0||offset>60||(offset&3))
                fatal_error(UNKNOWN_LOCATION,"Thumb PC handoff frame read outside aligned 64-byte contract");
        }
        if (!validate_change(load,&PATTERN(load),gen_match_thumb_pc_address(gen_rtx_REG(SImode,0),GEN_INT(offset)),false)
            ||!validate_change(ret,&PATTERN(ret),gen_match_thumb_private_return(gen_rtx_REG(SImode,0)),false)
            ||!validate_change(align,&PATTERN(align),gen_match_thumb_zero_pool_align(),false))
            fatal_error(UNKNOWN_LOCATION,"Thumb PC handoff instruction selection rejected");
        REG_NOTES(load)=nullptr;REG_NOTES(ret)=nullptr;
        delete_insn(word);delete_insn(spuse);delete_insn(lruse);
        return 0;
    }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
    if (!plugin_default_version_check(version,&gcc_version)) return 1;
    for (int n=0;n<info->argc;n++) {
        if (!info->argv[n].value) return 1;
        std::string key=info->argv[n].key;
        if (key=="symbol"&&symbol.empty()) symbol=info->argv[n].value;
        else if ((key=="offset"&&offset<0)||(key=="site"&&site<0)) {
            char *end=nullptr;long value=strtol(info->argv[n].value,&end,0);
            if (!*info->argv[n].value||*end||value<0||value>1020) return 1;
            if (key=="offset") offset=value;else site=value;
        } else return 1;
    }
    if (symbol.empty()||offset<0||site<0||(offset&3)||(site&1)) return 1;
    for (char c:symbol) if (!(ISALNUM(c)||c=='_')) return 1;
    if (!(ISALPHA(symbol[0])||symbol[0]=='_')) return 1;
    register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);
    register_pass_info p={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};
    register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);
    return 0;
}
