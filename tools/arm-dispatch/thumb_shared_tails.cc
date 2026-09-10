// SPDX-License-Identifier: GPL-3.0-or-later
// Bypass one isolated shared private tail stub, preserving comparison flags.
#include <string>
#include <vector>
#include <cstdlib>
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
#include "insn-flags.h"
int plugin_is_GPL_compatible;
namespace {
std::string destination;
unsigned expected=0;
tree validate(tree *node,tree,tree,int,bool *no_add) {
 if(TREE_CODE(*node)!=FUNCTION_DECL){error("shared tails require a function");*no_add=true;}return NULL_TREE;
}
const attribute_spec contract={"matching_thumb_shared_tails",0,0,true,false,false,false,validate,nullptr};
void attributes(void *,void *){register_attribute(&contract);}
bool low(rtx x){return REG_P(x)&&GET_MODE(x)==SImode&&REGNO(x)<8;}
rtx_insn *next_plain(rtx_insn *i){
 for(i=NEXT_INSN(i);i;i=NEXT_INSN(i)) {if(NOTE_P(i)||DEBUG_INSN_P(i))continue;return i;}return nullptr;
}
const pass_data data={RTL_PASS,"thumb_shared_tails",OPTGROUP_NONE,TV_NONE,0,0,0,0,0};
class pass:public rtl_opt_pass {
public:
 pass(gcc::context *c):rtl_opt_pass(data,c){}
 unsigned int execute(function *fn) override {
  if(!lookup_attribute("matching_thumb_shared_tails",DECL_ATTRIBUTES(fn->decl)))return 0;
  if(!TARGET_THUMB1||!lookup_attribute("matching_tail_transfer",DECL_ATTRIBUTES(fn->decl)))
   fatal_error(UNKNOWN_LOCATION,"shared tails require private Thumb tails");
  rtx_insn *stub=nullptr;rtx_code_label *label=nullptr;rtx symbol=nullptr;
  for(auto *i=get_insns();i;i=NEXT_INSN(i)) {
   if(!LABEL_P(i)||LABEL_PRESERVE_P(i))continue;
   auto *j=next_plain(i);
   if(!j||!JUMP_P(j)||GET_CODE(PATTERN(j))!=SET||SET_DEST(PATTERN(j))!=pc_rtx)continue;
   rtx target=SET_SRC(PATTERN(j));
   if(GET_CODE(target)!=SYMBOL_REF||destination!=XSTR(target,0))continue;
   auto *before=PREV_INSN(i);
   while(before&&(NOTE_P(before)||DEBUG_INSN_P(before)))before=PREV_INSN(before);
   // No fallthrough or label alias may enter the stub; all uses must be rewritten.
   if(!before||!BARRIER_P(before)||stub)
    fatal_error(UNKNOWN_LOCATION,"shared tail requires one isolated stub");
   stub=j;label=as_a<rtx_code_label *>(i);symbol=target;
  }
  if(!stub)fatal_error(UNKNOWN_LOCATION,"shared tail stub not found");
  std::vector<std::pair<rtx_insn *,rtx>> changes;
  for(auto *i=get_insns();i;i=NEXT_INSN(i)) {
   if(!JUMP_P(i)||GET_CODE(PATTERN(i))!=SET||SET_DEST(PATTERN(i))!=pc_rtx)continue;
   rtx choice=SET_SRC(PATTERN(i));
   if(GET_CODE(choice)!=IF_THEN_ELSE||GET_CODE(XEXP(choice,1))!=LABEL_REF
      ||XEXP(XEXP(choice,1),0)!=label||XEXP(choice,2)!=pc_rtx)continue;
   rtx test=XEXP(choice,0),left=XEXP(test,0),right=XEXP(test,1),replacement=nullptr;
   if((GET_CODE(test)==EQ||GET_CODE(test)==NE)&&right==const0_rtx&&GET_CODE(left)==AND
      &&low(XEXP(left,0))&&low(XEXP(left,1))) {
    rtx a=XEXP(left,0),b=XEXP(left,1);if(REGNO(a)>REGNO(b)){rtx t=a;a=b;b=t;}
    replacement=GET_CODE(test)==EQ?gen_match_thumb_mask_zero_tail(copy_rtx(a),copy_rtx(b),copy_rtx(symbol))
      :gen_match_thumb_mask_nonzero_tail(copy_rtx(a),copy_rtx(b),copy_rtx(symbol));
   } else if((GET_CODE(test)==LTU||GET_CODE(test)==GEU)&&low(left)&&low(right)) {
    replacement=gen_match_thumb_unsigned_reg_tail(copy_rtx(left),copy_rtx(right),copy_rtx(test),copy_rtx(symbol));
   }
   if(!replacement)fatal_error(UNKNOWN_LOCATION,"unsupported shared tail comparison");
   changes.push_back({i,replacement});
  }
  if(changes.size()!=expected||LABEL_NUSES(label)!=expected)
   fatal_error(UNKNOWN_LOCATION,"shared tails expected %u exclusive edges, found %u with %d uses",expected,unsigned(changes.size()),LABEL_NUSES(label));
  for(auto &change:changes){
   if(!validate_change(change.first,&PATTERN(change.first),change.second,false))
    fatal_error(UNKNOWN_LOCATION,"shared tail pattern rejected");
   REG_NOTES(change.first)=nullptr;JUMP_LABEL(change.first)=nullptr;LABEL_NUSES(label)--;
  }
  delete_insn(stub);return 0;
 }
};
}
int plugin_init(plugin_name_args *info,plugin_gcc_version *version){
 if(!plugin_default_version_check(version,&gcc_version))return 1;
 for(int n=0;n<info->argc;n++){
  std::string key=info->argv[n].key;const char *v=info->argv[n].value;
  if(key=="destination"&&v&&*v&&destination.empty()){destination=v;continue;}
  if(key=="expected-transfers"&&v&&*v&&!expected){char *end=nullptr;unsigned long value=strtoul(v,&end,10);if(*end||value<1||value>100)return 1;expected=value;continue;}
  return 1;
 }
 if(destination.empty()||!expected)return 1;
 register_callback(info->base_name,PLUGIN_ATTRIBUTES,attributes,nullptr);
 register_pass_info p={new pass(g),"shorten",1,PASS_POS_INSERT_AFTER};
 register_callback(info->base_name,PLUGIN_PASS_MANAGER_SETUP,nullptr,&p);return 0;
}
