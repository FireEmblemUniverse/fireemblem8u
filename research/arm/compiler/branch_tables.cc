// SPDX-License-Identifier: GPL-3.0-or-later
// Experimental range-checked ARM instruction-table lowering, not production.
#include "gcc-plugin.h"
#include "plugin-version.h"
#include "context.h"
#include "backend.h"
#include "insn-config.h"
#include "memmodel.h"
#include "tree-pass.h"
#include "rtl.h"
#include "emit-rtl.h"
#include "recog.h"
#include "tm.h"
#include "diagnostic-core.h"
#include "insn-constants.h"
int plugin_is_GPL_compatible;
namespace {
void checked(rtx_insn *insn) {
    if (recog_memoized(insn)<0) { debug_rtx(PATTERN(insn)); fatal_error(UNKNOWN_LOCATION,"unrecognized instruction-table RTL"); }
}
const pass_data data={RTL_PASS,"branch_tables",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
    pass(gcc::context *c):rtl_opt_pass(data,c) {}
    unsigned int execute(function *) override {
        if (!TARGET_ARM) return 0;
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
            // Retain the original range check; no unchecked-index assumption.
            rtx cc=gen_rtx_REG(CCmode,CC_REGNUM);
            checked(emit_insn_before(gen_rtx_SET(cc,gen_rtx_COMPARE(CCmode,copy_rtx(index),copy_rtx(XEXP(cond,1)))),i));
            checked(emit_jump_insn_before(gen_rtx_SET(pc_rtx,gen_rtx_IF_THEN_ELSE(VOIDmode,
                gen_rtx_GTU(VOIDmode,cc,const0_rtx),copy_rtx(fallback),pc_rtx)),i));
            checked(emit_insn_before(gen_rtx_SET(copy_rtx(base),gen_rtx_PLUS(SImode,gen_rtx_ASHIFT(SImode,copy_rtx(index),GEN_INT(2)),
                copy_rtx(base))),i));
            checked(emit_jump_insn_before(gen_rtx_SET(pc_rtx,copy_rtx(base)),i));
            for(int j=0;j<n;j++)checked(emit_jump_insn_before(gen_rtx_SET(pc_rtx,copy_rtx(XVECEXP(vector,1,j))),table));
            remove_insn(table);
            rtx_insn *previous=PREV_INSN(i);
            remove_insn(i);
            i=previous;
        }
        return 0;
    }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version) {
    if(!plugin_default_version_check(version,&gcc_version))return 1;
    register_pass_info registration={new pass(g),"shorten",1,PASS_POS_INSERT_BEFORE};
    register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&registration);
    return 0;
}
