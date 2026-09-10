#!/usr/bin/env python3
"""Check actual generated Thumb PC-address instruction across offsets and alignment."""
import argparse,subprocess
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
 out=ROOT/'.deps/soundmain-packed/sample-handoff/address';out.mkdir(exist_ok=True)
 source=(ROOT/'research/audio/soundmain_sample_handoff.c').read_text().replace('void SoundMainRAM_', '__attribute__((matching_thumb_pc_handoff))\nvoid SoundMainRAM_');src=out/'fixture.c';src.write_text(source);cases=0
 for offset in (0,4,252,256,508,512,1016,1020):
  obj=out/(str(offset)+'.o');binary=obj.with_suffix('.bin')
  subprocess.run([a.compiler,'-c','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),'-fplugin='+str(ROOT/'.deps/flood-core-new-backend/thumb_pc_handoff.so'),'-fplugin-arg-thumb_pc_handoff-symbol=SoundMainRAM_SampleEntry','-fplugin-arg-thumb_pc_handoff-site=6','-fplugin-arg-thumb_pc_handoff-offset='+str(offset),str(src),'-o',str(obj)],check=True,stdout=subprocess.DEVNULL,stderr=None)
  subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(obj),str(binary)],check=True)
  code=binary.read_bytes();assert len(code)==12 and code[6:8]==(0xa000+offset//4).to_bytes(2,'little')
  for base in (0x08001000,0x08001002,0x03002000,0x03002002):
   uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(base&~0xfff,0x1000);uc.mem_write(base,code)
   for flags in range(16):
    regs=[0x87650000+i for i in range(13)];wanted=regs.copy();wanted[0]=((base+6+4)&~3)+offset
    for i,value in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(i)),value)
    uc.reg_write(r.UC_ARM_REG_SP,0x02001000);uc.reg_write(r.UC_ARM_REG_LR,0xdeadbeef);uc.reg_write(r.UC_ARM_REG_CPSR,0x33|flags<<28)
    uc.emu_start((base+6)|1,base+8,count=1)
    assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(i))) for i in range(13)]==wanted
    assert uc.reg_read(r.UC_ARM_REG_SP)==0x02001000 and uc.reg_read(r.UC_ARM_REG_LR)==0xdeadbeef
    assert uc.reg_read(r.UC_ARM_REG_PC)==base+8 and uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28
    cases+=1
 print(f'{cases} generated ADR checks pass across eight offsets, both alignments, ROM/RAM and all NZCV.')
if __name__=='__main__':main()
