#!/usr/bin/env python3
"""Check the ARM multiply-high C candidate and original Thumb entry."""
import argparse
import json
from pathlib import Path
import random
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
OUT=ROOT/'.deps/audio-multiply-match'
THUMB,ARM,RETURN=0x080cf4b8,0x080cf4bc,0x080e0000

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);p.add_argument('--plugin',type=Path);p.add_argument('--production',action='store_true');p.add_argument('--require-match',action='store_true');a=p.parse_args()
    OUT.mkdir(exist_ok=True)
    subprocess.run([a.compiler,*(['-fplugin='+str(a.plugin.resolve())] if a.plugin else []),'-S','-std=gnu89','-O1','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-I'+str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(ROOT/'src/m4a_multiply_high.c'),'-o',str(OUT/'candidate.s')],check=True)
    subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(OUT/'candidate.s'),'-o',str(OUT/'candidate.o')],check=True)
    subprocess.run(['arm-none-eabi-ld','-Ttext='+hex(ARM),str(OUT/'candidate.o'),'-o',str(OUT/'candidate.elf')],check=True,capture_output=True)
    subprocess.run(['arm-none-eabi-objcopy','-O','binary','--only-section=.text',str(OUT/'candidate.elf'),str(OUT/'candidate.bin')],check=True)
    rom=(ROOT/'baserom.gba').read_bytes();candidate=(OUT/'candidate.bin').read_bytes();original=rom[ARM-0x08000000:ARM+12-0x08000000]
    assert len(candidate)==12
    if a.production: assert candidate==(ROOT/'fireemblem8.gba').read_bytes()[ARM-0x08000000:ARM+12-0x08000000]
    machines=[]
    for code in (original,candidate):
        uc=Uc(UC_ARCH_ARM,UC_MODE_ARM);uc.mem_map(0x08000000,0x1000000);uc.mem_map(0x03000000,0x8000)
        uc.mem_write(0x08000000,(ROOT/'fireemblem8.gba').read_bytes() if a.production and machines else rom);uc.mem_write(ARM,code);machines.append(uc)
    values=(0,1,2,0xffff,0x10000,0x10001,0x7fffffff,0x80000000,0xfffffffe,0xffffffff,0x55555555,0xaaaaaaaa)
    rng=random.Random(0x3232);pairs=[(x,y) for x in values for y in values]+[(rng.getrandbits(32),rng.getrandbits(32)) for _ in range(512)]
    count=0
    for left,right in pairs:
        for flags in range(16):
            for thumb_entry in (False,True):
                for thumb_return in (False,True):
                    product=left*right;expected=[product>>32,right,product&0xffffffff,product>>32]+[0x12340000+n for n in range(4,13)]
                    for uc in machines:
                        uc.reg_write(r.UC_ARM_REG_CPSR,0x13|flags<<28)
                        for n in range(13):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),0x12340000+n)
                        uc.reg_write(r.UC_ARM_REG_R0,left);uc.reg_write(r.UC_ARM_REG_R1,right)
                        uc.reg_write(r.UC_ARM_REG_SP,0x03007000);uc.reg_write(r.UC_ARM_REG_LR,RETURN|thumb_return)
                        uc.emu_start(THUMB|1 if thumb_entry else ARM,RETURN,count=10)
                        regs=[uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]
                        assert regs==expected,(left,right,regs,expected)
                        assert uc.reg_read(r.UC_ARM_REG_PC)==RETURN and uc.reg_read(r.UC_ARM_REG_SP)==0x03007000
                        assert uc.reg_read(r.UC_ARM_REG_CPSR)&0xf0000000==flags<<28
                        assert bool(uc.reg_read(r.UC_ARM_REG_CPSR)&32)==thumb_return
                    count+=1
    report=dict(cases=count,production=a.production,original_bytes=12,candidate_bytes=len(candidate),complete_match=candidate==original,matching_instruction_words=sum(candidate[n:n+4]==original[n:n+4] for n in range(0,12,4)),scope='boundary and seeded 32-bit operands, direct ARM and original Thumb entries, all NZCV, both return modes, r0-r12 and SP')
    (OUT/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(report)
    if a.require_match:assert candidate==original
if __name__=='__main__':main()
