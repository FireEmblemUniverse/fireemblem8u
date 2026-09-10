#!/usr/bin/env python3
"""Check subtraction/unsigned-branch folding and reject unsupported contracts."""
import argparse,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
SOURCE='''register volatile unsigned counter asm("r4");
register volatile unsigned previous asm("r7");
extern void above(void), below(void);
__attribute__((matching_tail_transfer, matching_thumb_subtract_branch))
void fixture(void) {
 previous=counter-1;
 asm("" : "+r"(previous));
 if (counter>1) above(); else below();
}
'''
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/subtract-branch';out.mkdir(exist_ok=True)
 def compile(name,source=SOURCE,fold=True,extra=()):
  src=out/(name+'.c');obj=out/(name+'.o');src.write_text(source)
  cmd=[a.compiler,'-c','-std=gnu89','-O1','-fno-reorder-blocks','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/tail_transfer.so'),'-fplugin-arg-tail_transfer-private-frame64','-fplugin-arg-tail_transfer-acyclic-branches','-fplugin-arg-tail_transfer-destination=above','-fplugin-arg-tail_transfer-destination=below']
  if fold:cmd+=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_subtract_branch.so')]
  result=subprocess.run(cmd+list(extra)+[str(src),'-o',str(obj)],capture_output=True,text=True)
  return result,obj
 result,obj=compile('folded');assert not result.returncode,result.stderr
 elf=out/'fixture.elf';binary=out/'fixture.bin'
 subprocess.run(['arm-none-eabi-ld','-Ttext=0x08001000','--entry=fixture','--defsym=above=0x08001201','--defsym=below=0x08001401',str(obj),'-o',str(elf)],check=True)
 subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
 code=binary.read_bytes();assert code[:4]==bytes.fromhex('671e00d9'),code.hex()
 # Full-width inputs ensure the folding is not accidentally valid only for bytes.
 rng=random.Random(0x5b5);values=list(range(256))+[0x7ffffffe,0x7fffffff,0x80000000,0xfffffffe,0xffffffff]+[rng.getrandbits(32) for _ in range(1000)]
 uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x10000);uc.mem_write(0x08001000,code);uc.mem_map(0x02000000,0x4000)
 cases=0
 for value in values:
  for initial in range(16):
   regs=[rng.getrandbits(32) for _ in range(13)];regs[4]=value;expected=regs.copy();expected[7]=(value-1)&0xffffffff
   for i,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(i)),v)
   uc.reg_write(r.UC_ARM_REG_SP,0x02001000);uc.reg_write(r.UC_ARM_REG_LR,0x12345679);uc.reg_write(r.UC_ARM_REG_CPSR,0x33|initial<<28)
   target=0x08001200 if value>1 else 0x08001400;uc.emu_start(0x08001001,target,count=8)
   assert uc.reg_read(r.UC_ARM_REG_PC)==target and uc.reg_read(r.UC_ARM_REG_CPSR)&0x20
   assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(i))) for i in range(13)]==expected
   result=expected[7];flags=(result>>31)<<3|((result==0)<<2)|((value>=1)<<1)|((((value^1)&(value^result))>>31)&1)
   assert uc.reg_read(r.UC_ARM_REG_CPSR)>>28==flags
   assert uc.reg_read(r.UC_ARM_REG_SP)==0x02001000 and uc.reg_read(r.UC_ARM_REG_LR)==0x12345679
   cases+=1
 negatives={
  'signed':SOURCE.replace('counter>1','(int)counter>1'),
  'wrong_bound':SOURCE.replace('counter>1','counter>2'),
  'wrong_subtract':SOURCE.replace('counter-1','counter-2'),
  'wrong_source':SOURCE.replace('counter-1','previous-1'),
  'nonempty_tie':SOURCE.replace('asm(""','asm("nop"'),
  'missing_tie':SOURCE.replace(' asm("" : "+r"(previous));',''),
  'intervening_write':SOURCE.replace(' if (counter', ' previous+=3;\n if (counter'),
  'high_result':SOURCE.replace('asm("r7")','asm("r8")'),
  'distant_target':SOURCE.replace('if (counter>1) above();', 'if (counter>1) { '+('previous+=3; asm("" : "+r"(previous)); '*140)+'above(); }'),
  'missing_tail':SOURCE.replace('matching_tail_transfer, ',''),
 }
 for name,source in negatives.items():
  result,_=compile(name,source);assert result.returncode,(name,result.stderr)
 result,_=compile('arm',extra=['-marm']);assert result.returncode,result.stderr
 result,_=compile('option',extra=['-fplugin-arg-thumb_subtract_branch-unknown=1']);assert result.returncode,result.stderr
 plain=SOURCE.replace(', matching_thumb_subtract_branch','')
 result,obj=compile('plain',plain,False);assert not result.returncode,result.stderr
 original=obj.read_bytes();result,obj=compile('plain',plain);assert not result.returncode and obj.read_bytes()==original,result.stderr
 print(f'{cases} full-width/NZCV executions pass; 12 unsupported contracts reject; unannotated output unchanged.')
if __name__=='__main__':main()
