#!/usr/bin/env python3
"""Verify commuted Thumb ADD encoding without changing arithmetic or flags."""
import argparse,random,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
SOURCE='''register volatile unsigned left asm("r0");
register volatile unsigned destination asm("r5");
__attribute__((matching_thumb_add_order))
void fixture(void) { destination=left+destination; }
'''
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/add-order';out.mkdir(exist_ok=True)
 def compile(name,source=SOURCE,plugin=True,extra=()):
  src=out/(name+'.c');obj=out/(name+'.o');src.write_text(source)
  cmd=[a.compiler,'-c','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes']
  if plugin:cmd+=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_add_order.so')]
  result=subprocess.run(cmd+list(extra)+[str(src),'-o',str(obj)],capture_output=True,text=True)
  return result,obj
 result,obj=compile('positive');assert not result.returncode,result.stderr
 binary=out/'code.bin';subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(obj),str(binary)],check=True)
 code=binary.read_bytes();assert code==bytes.fromhex('2d187047'),code.hex()
 rng=random.Random(0xadd05);bounds=[0,1,2,0x7ffffffe,0x7fffffff,0x80000000,0x80000001,0xfffffffe,0xffffffff]
 pairs=[(x,y) for x in bounds for y in bounds]+[(rng.getrandbits(32),rng.getrandbits(32)) for _ in range(1000)]
 uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x10000);uc.mem_write(0x08001000,code)
 cases=0
 for x,y in pairs:
  for initial in range(16):
   regs=[rng.getrandbits(32) for _ in range(13)];regs[0]=x;regs[5]=y;expected=regs.copy();expected[5]=(x+y)&0xffffffff
   for i,value in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(i)),value)
   uc.reg_write(r.UC_ARM_REG_CPSR,0x33|initial<<28);uc.reg_write(r.UC_ARM_REG_SP,0x02001000);uc.reg_write(r.UC_ARM_REG_LR,0x08002001)
   uc.emu_start(0x08001001,0x08002000,count=3)
   assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(i))) for i in range(13)]==expected
   value=expected[5];flags=(value>>31)<<3|((value==0)<<2)|((x+y>0xffffffff)<<1)|(((~(x^y)&(x^value))>>31)&1)
   assert uc.reg_read(r.UC_ARM_REG_CPSR)>>28==flags and uc.reg_read(r.UC_ARM_REG_CPSR)&0x20
   assert uc.reg_read(r.UC_ARM_REG_SP)==0x02001000 and uc.reg_read(r.UC_ARM_REG_LR)==0x08002001 and uc.reg_read(r.UC_ARM_REG_PC)==0x08002000
   cases+=1
 negatives={
  'subtract':SOURCE.replace('left+destination','left-destination'),
  'constant':SOURCE.replace('left+destination','destination+1'),
  'same_register':SOURCE.replace('left+destination','destination+destination'),
  'high_destination':SOURCE.replace('asm("r5")','asm("r8")'),
  'no_add':SOURCE.replace('left+destination','left'),
 }
 for name,source in negatives.items():
  result,_=compile(name,source);assert result.returncode,(name,result.stderr)
 for name,extra in [('arm',['-marm']),('option',['-fplugin-arg-thumb_add_order-unknown=1'])]:
  result,_=compile(name,extra=extra);assert result.returncode,(name,result.stderr)
 plain=SOURCE.replace('__attribute__((matching_thumb_add_order))','')
 result,obj=compile('plain',plain,False);assert not result.returncode,result.stderr
 original=obj.read_bytes();result,obj=compile('plain',plain);assert not result.returncode and original==obj.read_bytes(),result.stderr
 print(f'{cases} arithmetic/NZCV executions pass; seven unsupported contracts reject; unannotated output unchanged.')
if __name__=='__main__':main()
