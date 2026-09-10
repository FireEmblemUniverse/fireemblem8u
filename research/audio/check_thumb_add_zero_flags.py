#!/usr/bin/env python3
"""Validate the actual two C-generated Thumb ADD #0 copies for full-width inputs."""
import argparse,random
from pathlib import Path
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--volume',action='store_true');a=p.parse_args()
 code=(ROOT/('.deps/soundmain-packed/volume/candidate.bin' if a.volume else '.deps/soundmain-packed/envelope/candidate.bin')).read_bytes()
 original=(ROOT/'baserom.gba').read_bytes()[0xcf6a4:0xcf6d8] if a.volume else (ROOT/'baserom.gba').read_bytes()[0xcf604:0xcf6a4];assert code==original and len(code)==(52 if a.volume else 160)
 rng=random.Random(0xadd0);values=[0,1,0x7fffffff,0x80000000,0xffffffff]+[rng.getrandbits(32) for _ in range(512)];cases=0
 for dst,src in (((0,3),) if a.volume else ((0,3),(5,0))):
  opcode=(0x1c00|(src<<3)|dst).to_bytes(2,'little')
  positions=[i for i in range(0,len(code),2) if code[i:i+2]==opcode];assert len(positions)==1
  offset=positions[0]
  for base in (0x08001000,0x03002000):
   uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(base,0x1000);uc.mem_write(base,code)
   for value in values:
    for flags in range(16):
     regs=[0x12340000+i for i in range(13)];regs[src]=value;expected=regs.copy();expected[dst]=value
     for i,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(i)),v)
     uc.reg_write(r.UC_ARM_REG_SP,0x02001000);uc.reg_write(r.UC_ARM_REG_LR,0xdeadbeef);uc.reg_write(r.UC_ARM_REG_CPSR,0x33|flags<<28)
     uc.emu_start((base+offset)|1,base+offset+2,count=1)
     assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(i))) for i in range(13)]==expected
     assert uc.reg_read(r.UC_ARM_REG_PC)==base+offset+2 and uc.reg_read(r.UC_ARM_REG_SP)==0x02001000 and uc.reg_read(r.UC_ARM_REG_LR)==0xdeadbeef
     wanted=((value>>31)<<3)|((value==0)<<2)
     assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|wanted<<28
     cases+=1
 print(f'{cases} actual C-generated ADD #0 executions pass for selected copies, full-width boundaries/random values, all NZCV and ROM/RAM.')
if __name__=='__main__':main()
