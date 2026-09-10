#!/usr/bin/env python3
"""Check every byte input and NZCV through the exact SUBS/STRB/BHI-or-BLS bundle."""
import argparse,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/byte-counter-carry';out.mkdir(exist_ok=True);cases=0
 for comparison in ('>','<='):
  src=out/'probe.c';src.write_text('void probe(volatile unsigned char *in, volatile unsigned char *out, volatile unsigned *result) { register int n asm("r3")=*in; asm("" : : "r"(n)); n--; *out=n; if(n '+comparison+' 0) *result=11; else *result=22; }')
  obj=out/'probe.o';binary=out/'probe.bin'
  subprocess.run([a.compiler,'-c','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-fno-if-conversion','-fno-if-conversion2','-fno-reorder-blocks','-fno-schedule-insns','-fno-schedule-insns2','-fwrapv','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_shared_literal.so'),'-fplugin-arg-thumb_shared_literal-byte-counter-carry',str(src),'-o',str(obj)],check=True)
  subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(obj),str(binary)],check=True);code=binary.read_bytes()
  positions=[i for i in range(0,len(code)-5,2) if code[i:i+4]==bytes.fromhex('013b0b70') and code[i+5] in (0xd8,0xd9)]
  assert len(positions)==1,code.hex();offset=positions[0];sense=code[offset+5];disp=int.from_bytes(code[offset+4:offset+5],'little',signed=True)*2
  for base in (0x08001000,0x03002000):
   uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(base,0x1000);uc.mem_write(base,code);uc.mem_map(0x02000000,0x1000);trace=[]
   def hook(u,kind,addr,size,value,user):user.append((addr,size,value&255))
   uc.hook_add(UC_HOOK_MEM_WRITE,hook,trace)
   for address in (0x02000100,0x02000101,0x02000104):
    for value in range(256):
     for flags in range(16):
      regs=[0x12340000+i for i in range(13)];regs[1]=address;regs[3]=value;expected=regs.copy();expected[3]=(value-1)&0xffffffff
      memory=bytearray([0xa5])*0x1000;uc.mem_write(0x02000000,bytes(memory));trace.clear();memory[address-0x02000000]=(value-1)&255
      for i,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(i)),v)
      uc.reg_write(r.UC_ARM_REG_SP,0x02000f00);uc.reg_write(r.UC_ARM_REG_LR,0xdeadbeef);uc.reg_write(r.UC_ARM_REG_CPSR,0x33|flags<<28)
      taken=value>1 if sense==0xd8 else value<=1;target=base+offset+(8+disp if taken else 6)
      uc.emu_start((base+offset)|1,target,count=3)
      assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(i))) for i in range(13)]==expected
      assert uc.reg_read(r.UC_ARM_REG_PC)==target and uc.reg_read(r.UC_ARM_REG_SP)==0x02000f00 and uc.reg_read(r.UC_ARM_REG_LR)==0xdeadbeef
      expected_flags=8 if value==0 else 6 if value==1 else 2
      assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|expected_flags<<28
      assert bytes(uc.mem_read(0x02000000,0x1000))==memory and trace==[(address,1,(value-1)&255)]
      cases+=1
 print(f'{cases} exact countdown/store/carry-branch executions pass across both polarities, all byte values/NZCV, three store addresses and ROM/RAM.')
if __name__=='__main__':main()
