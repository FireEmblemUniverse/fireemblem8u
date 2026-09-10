#!/usr/bin/env python3
"""Characterize a C Thumb wrapper calling the integrated ARM multiply body."""
import argparse
import json
from pathlib import Path
import random
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
OUT=ROOT/'.deps/audio-interwork-match'
ORIGINAL,ARM,CANDIDATE,RETURN=0x080cf4b8,0x080cf4bc,0x080e1000,0x080f0000

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args();OUT.mkdir(exist_ok=True)
    subprocess.run([a.compiler,'-S','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-I'+str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(ROOT/'research/audio/multiply_entry.c'),'-o',str(OUT/'candidate.s')],check=True)
    subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(OUT/'candidate.s'),'-o',str(OUT/'candidate.o')],check=True)
    (OUT/'link.ld').write_text('SECTIONS { . = 0x080cf4bc; .arm : { *m4a_multiply_high.o(.text) } . = 0x080e1000; .text : { *candidate.o(.text) *(.glue_7) *(.glue_7t) } }\n')
    subprocess.run(['arm-none-eabi-ld','-T',str(OUT/'link.ld'),str(OUT/'candidate.o'),str(ROOT/'src/m4a_multiply_high.o'),'-o',str(OUT/'candidate.elf')],check=True,capture_output=True)
    subprocess.run(['arm-none-eabi-objcopy','-O','binary','--only-section=.text',str(OUT/'candidate.elf'),str(OUT/'candidate.bin')],check=True)
    rom=(ROOT/'baserom.gba').read_bytes();candidate=(OUT/'candidate.bin').read_bytes()
    symbols=subprocess.check_output(['arm-none-eabi-nm',str(OUT/'candidate.elf')],text=True)
    assert int(next(line.split()[0] for line in symbols.splitlines() if line.endswith(' umul3232H32')),16)==CANDIDATE
    machines=[]
    for entry in (ORIGINAL,CANDIDATE):
        uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_map(0x03000000,0x8000)
        uc.mem_write(0x08000000,rom)
        if entry==CANDIDATE:uc.mem_write(CANDIDATE,candidate)
        machines.append((uc,entry))
    values=(0,1,2,0xffff,0x10000,0x10001,0x7fffffff,0x80000000,0xfffffffe,0xffffffff,0x55555555,0xaaaaaaaa)
    rng=random.Random(0x3232);pairs=[(x,y) for x in values for y in values]+[(rng.getrandbits(32),rng.getrandbits(32)) for _ in range(512)]
    count=flag_differences=0;different=set()
    for left,right in pairs:
        for flags in range(16):
            for thumb_return in (False,True):
                states=[]
                for uc,entry in machines:
                    uc.reg_write(r.UC_ARM_REG_CPSR,0x33|flags<<28)
                    for n in range(13):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),0x12340000+n)
                    uc.reg_write(r.UC_ARM_REG_R0,left);uc.reg_write(r.UC_ARM_REG_R1,right)
                    uc.reg_write(r.UC_ARM_REG_SP,0x03007000);uc.reg_write(r.UC_ARM_REG_LR,RETURN|thumb_return)
                    uc.emu_start(entry|1,RETURN,count=30)
                    regs=[uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]
                    assert regs[0]==(left*right)>>32
                    assert regs[4:12]==[0x12340000+n for n in range(4,12)]
                    assert uc.reg_read(r.UC_ARM_REG_PC)==RETURN and uc.reg_read(r.UC_ARM_REG_SP)==0x03007000
                    assert bool(uc.reg_read(r.UC_ARM_REG_CPSR)&32)==thumb_return
                    states.append((regs,uc.reg_read(r.UC_ARM_REG_CPSR)&0xf0000000))
                different.update(n for n in range(13) if states[0][0][n]!=states[1][0][n])
                flag_differences+=states[0][1]!=states[1][1];count+=1
    report=dict(cases=count,original_entry_bytes=4,candidate_with_veneer_bytes=len(candidate),differing_registers=sorted(different),flag_difference_cases=flag_differences,scope='boundary and seeded operands, all NZCV, both return modes, result and preserved registers; C wrapper relocated to avoid overlap')
    (OUT/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(report)
if __name__=='__main__':main()
