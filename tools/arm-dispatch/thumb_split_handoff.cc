// SPDX-License-Identifier: GPL-3.0-or-later
// Fold a byte-selected Thumb terminal stub and adjacent ARM PC handoff.
#include <vector>
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
#include "attribs.h"
#include "diagnostic-core.h"
#include "insn-constants.h"
#include "insn-flags.h"
#include "insn-attr.h"
#include "options.h"
int plugin_is_GPL_compatible;
namespace {
std::string arm_destination,thumb_destination;
tree validate(tree *node,tree,tree,int,bool *no_add) {
    if (TREE_CODE(*node)!=FUNCTION_DECL) { error("matching_thumb_split_handoff requires a function");*no_add=true; }
    return NULL_TREE;
}
const attribute_spec contract={"matching_thumb_split_handoff",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *) { register_attribute(&contract); }
bool low(rtx x) { return REG_P(x)&&GET_MODE(x)==SImode&&REGNO(x)<8; }
bool named(rtx x,const std::string &name) {
    if (GET_CODE(x)!=SYMBOL_REF) return false;
    const char *p=XSTR(x,0);if (*p=='*') p++;return name==p;
}
bool tie(rtx p,rtx reg) {
    if (GET_CODE(p)!=SET||!rtx_equal_p(SET_DEST(p),reg)) return false;
    rtx a=SET_SRC(p);
    return GET_CODE(a)==ASM_OPERANDS&&!ASM_OPERANDS_TEMPLATE(a)[0]
        &&!strcmp(ASM_OPERANDS_OUTPUT_CONSTRAINT(a),"=r")&&ASM_OPERANDS_INPUT_LENGTH(a)==1
        &&ASM_OPERANDS_LABEL_LENGTH(a)==0&&rtx_equal_p(ASM_OPERANDS_INPUT(a,0),reg)
        &&!strcmp(ASM_OPERANDS_INPUT_CONSTRAINT(a,0),"0");
}
void reject(int line) { fatal_error(UNKNOWN_LOCATION,"Thumb split handoff shape rejected at contract check %d",line); }
const pass_data data={RTL_PASS,"thumb_split_handoff",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *fn) override {
        if (!lookup_attribute("matching_thumb_split_handoff",DECL_ATTRIBUTES(fn->decl))) return 0;
        if (!lookup_attribute("matching_tail_transfer",DECL_ATTRIBUTES(fn->decl))||!TARGET_THUMB1
            ||frame_pointer_needed||!known_eq(get_frame_size(),0)||crtl->profile||DECL_ARGUMENTS(fn->decl)
            ||flag_exceptions||flag_unwind_tables||flag_asynchronous_unwind_tables||debug_info_level!=DINFO_LEVEL_NONE
            ||TREE_CODE(TREE_TYPE(TREE_TYPE(fn->decl)))!=VOID_TYPE) reject(__LINE__);
        std::vector<rtx_insn *> ops;rtx_insn *last_label=nullptr,*pool=nullptr;
        for (rtx_insn *i=get_insns();i;i=NEXT_INSN(i)) {
            if (LABEL_P(i)) last_label=i;
            if (!NONDEBUG_INSN_P(i)) continue;
            ops.push_back(i);
            rtx p=PATTERN(i);
            if (GET_CODE(p)==UNSPEC_VOLATILE&&XINT(p,1)==VUNSPEC_POOL_4) pool=last_label;
        }
        if (ops.size()!=9||!pool) reject(__LINE__);
        rtx load=PATTERN(ops[0]),branch=PATTERN(ops[1]),address=PATTERN(ops[2]);
        if (GET_CODE(load)!=SET||!low(SET_DEST(load))||GET_CODE(SET_SRC(load))!=ZERO_EXTEND
            ||!MEM_P(XEXP(SET_SRC(load),0))||GET_MODE(XEXP(SET_SRC(load),0))!=QImode) reject(__LINE__);
        rtx condition_reg=SET_DEST(load);
        if (!JUMP_P(ops[1])||GET_CODE(branch)!=SET||SET_DEST(branch)!=pc_rtx||GET_CODE(SET_SRC(branch))!=IF_THEN_ELSE) reject(__LINE__);
        rtx choice=SET_SRC(branch),test=XEXP(choice,0);
        if (GET_CODE(test)!=EQ||!rtx_equal_p(XEXP(test,0),condition_reg)||XEXP(test,1)!=const0_rtx
            ||GET_CODE(XEXP(choice,1))!=LABEL_REF||XEXP(choice,2)!=pc_rtx) reject(__LINE__);
        rtx_insn *label=as_a<rtx_insn *>(XEXP(XEXP(choice,1),0));
        if (LABEL_NUSES(label)!=1||LABEL_PRESERVE_P(label)) reject(__LINE__);
        if (GET_CODE(address)!=SET||!low(SET_DEST(address))||!MEM_P(SET_SRC(address))
            ||GET_MODE(SET_SRC(address))!=SImode||MEM_VOLATILE_P(SET_SRC(address))
            ||GET_CODE(XEXP(SET_SRC(address),0))!=LABEL_REF||XEXP(XEXP(SET_SRC(address),0),0)!=pool) reject(__LINE__);
        rtx target_reg=SET_DEST(address);
        if (!tie(PATTERN(ops[3]),target_reg)) reject(__LINE__);
        rtx indirect=PATTERN(ops[4]);
        if (!JUMP_P(ops[4])||GET_CODE(indirect)!=PARALLEL||XVECLEN(indirect,0)!=2
            ||GET_CODE(XVECEXP(indirect,0,0))!=RETURN||GET_CODE(XVECEXP(indirect,0,1))!=USE
            ||!rtx_equal_p(XEXP(XVECEXP(indirect,0,1),0),target_reg)) reject(__LINE__);
        bool reached=false;
        for (rtx_insn *i=NEXT_INSN(ops[4]);i&&i!=ops[5];i=NEXT_INSN(i)) {
            if (i==label) reached=true;
            else if (LABEL_P(i)&&(LABEL_NUSES(i)||LABEL_PRESERVE_P(i))) reject(__LINE__);
        }
        if (!reached) reject(__LINE__);
        rtx direct=PATTERN(ops[5]);
        if (!JUMP_P(ops[5])||GET_CODE(direct)!=SET||SET_DEST(direct)!=pc_rtx||!named(SET_SRC(direct),thumb_destination)) reject(__LINE__);
        for (unsigned k=6;k<9;k++) {
            rtx p=PATTERN(ops[k]);int expected=k==6?VUNSPEC_ALIGN:k==7?VUNSPEC_POOL_4:VUNSPEC_POOL_END;
            if (GET_CODE(p)!=UNSPEC_VOLATILE||XINT(p,1)!=expected||XVECLEN(p,0)!=1) reject(__LINE__);
            if (k==7 ? !named(XVECEXP(p,0,0),arm_destination) : XVECEXP(p,0,0)!=const0_rtx) reject(__LINE__);
        }
        if (get_attr_length(ops[0])!=2||get_attr_length(ops[2])!=2) reject(__LINE__);
        if (!validate_change(ops[1],&PATTERN(ops[1]),gen_match_thumb_zero_tail(copy_rtx(condition_reg),copy_rtx(SET_SRC(direct))),false)
            ||!validate_change(ops[2],&PATTERN(ops[2]),gen_match_thumb_pc_address(copy_rtx(target_reg),GEN_INT(4)),false)
            ||!validate_change(ops[6],&PATTERN(ops[6]),gen_match_thumb_zero_pool_align(),false)) reject(__LINE__);
        LABEL_NUSES(label)--;JUMP_LABEL(ops[1])=nullptr;REG_NOTES(ops[1])=nullptr;REG_NOTES(ops[2])=nullptr;
        delete_insn(ops[3]);delete_insn(ops[5]);delete_insn(ops[7]);
        return 0;
    }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
    if (!plugin_default_version_check(version,&gcc_version)) return 1;
    for (int n=0;n<info->argc;n++) {
        if (!info->argv[n].value||!*info->argv[n].value) return 1;
        std::string key=info->argv[n].key;
        if (key=="arm-destination"&&arm_destination.empty()) arm_destination=info->argv[n].value;
        else if (key=="thumb-destination"&&thumb_destination.empty()) thumb_destination=info->argv[n].value;
        else return 1;
    }
    if (arm_destination.empty()||thumb_destination.empty()) return 1;
    register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);
    register_pass_info p={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};
    register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);
    return 0;
}
