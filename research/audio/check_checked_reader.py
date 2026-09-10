#!/usr/bin/env python3
"""Compare both entries of the checked audio byte reader with the original ROM."""
import argparse
import json
from pathlib import Path
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB
from unicorn import arm_const as r
ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT/'.deps/checked-reader-match'
ENTRY, FILTER, TRACK, RETURN = 0x080cf98c, 0x080cf972, 0x02000000, 0x080e0000

def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--compiler', required=True)
    p.add_argument('--plugin', type=Path, required=True)
    p.add_argument('--production', action='store_true')
    a = p.parse_args()
    OUT.mkdir(exist_ok=True)
    flags = ['-S','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu',
             '-ffreestanding','-fno-builtin','-fno-strict-aliasing','-fno-schedule-insns','-fno-schedule-insns2',
             '-fplugin='+str(a.plugin.resolve()), '-fplugin-arg-tail_transfer-destination=chk_adr_r2']
    subprocess.run([a.compiler,*flags,'-I'+str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(ROOT/'src/m4a_checked_reader.c'),'-o',str(OUT/'candidate.s')],check=True)
    with (OUT/'candidate.s').open('a') as f: f.write('\n.align 2,0\n')
    subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(OUT/'candidate.s'),'-o',str(OUT/'candidate.o')],check=True)
    subprocess.run(['arm-none-eabi-ld','-Ttext='+hex(ENTRY),'--defsym=chk_adr_r2='+hex(FILTER|1),str(OUT/'candidate.o'),'-o',str(OUT/'candidate.elf')],check=True,capture_output=True)
    subprocess.run(['arm-none-eabi-objcopy','-O','binary','--only-section=.text',str(OUT/'candidate.elf'),str(OUT/'candidate.bin')],check=True)
    rom=(ROOT/'baserom.gba').read_bytes()
    original=rom[ENTRY-0x08000000:ENTRY-0x08000000+12]
    candidate=(OUT/'candidate.bin').read_bytes()
    assert candidate==original, (candidate.hex(),original.hex())
    if a.production:
        production=(ROOT/'fireemblem8.gba').read_bytes()[ENTRY-0x08000000:ENTRY-0x08000000+12]
        assert candidate==production
        candidate=production
    machines=[]
    for code in (original,candidate):
        uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB)
        for base,size in ((0,0x1000),(0x01000000,0x1000),(TRACK,0x4000),(0x03000000,0x8000),(0x08000000,0x1000000)):
            uc.mem_map(base,size)
        uc.mem_write(0x08000000,(ROOT/'fireemblem8.gba').read_bytes() if a.production and machines else rom)
        uc.mem_write(ENTRY,code)
        machines.append(uc)
    cases=0
    for pointer in (0x100,0x01000100,TRACK+0x100,TRACK+0x101,TRACK+0x102,TRACK+0x103,0x03000100,TRACK+0x40,TRACK+0x41,TRACK+0x42,TRACK+0x43):
        for byte in range(256):
            for flags in range(16):
                for alternate in (False,True):
                    for thumb in (False,True):
                        states=[]
                        for uc in machines:
                            uc.mem_write(TRACK,bytes([0xa5])*0x200)
                            uc.mem_write(pointer,bytes([byte]))
                            uc.mem_write(TRACK+0x40,struct.pack('<I',TRACK+0x180 if alternate else pointer))
                            expected=bytearray(uc.mem_read(TRACK,0x200))
                            struct.pack_into('<I',expected,0x40,pointer+1)
                            value=expected[pointer-TRACK] if TRACK<=pointer<TRACK+0x200 else byte
                            if pointer<0x02000000: value=0
                            uc.reg_write(r.UC_ARM_REG_CPSR,0x33|flags<<28)
                            for n in range(13): uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),0x12340000+n)
                            uc.reg_write(r.UC_ARM_REG_R1,TRACK)
                            uc.reg_write(r.UC_ARM_REG_R2,pointer if alternate else 0x12340002)
                            uc.reg_write(r.UC_ARM_REG_SP,0x03007000)
                            uc.reg_write(r.UC_ARM_REG_LR,RETURN|thumb)
                            uc.emu_start((ENTRY+2*alternate)|1,RETURN,count=40)
                            regs=[uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]
                            assert regs==[0x12340000,TRACK,pointer,value]+[0x12340000+n for n in range(4,13)]
                            assert uc.reg_read(r.UC_ARM_REG_PC)==RETURN
                            assert uc.reg_read(r.UC_ARM_REG_SP)==0x03007000
                            assert bool(uc.reg_read(r.UC_ARM_REG_CPSR)&32)==thumb
                            memory=bytes(uc.mem_read(TRACK,0x200))
                            assert memory==expected
                            states.append((regs,memory,uc.reg_read(r.UC_ARM_REG_CPSR)))
                        assert states[0]==states[1]
                        cases+=1
    report=dict(cases=cases,production=a.production,complete_match=True,section_bytes=12,entries=[hex(ENTRY),hex(ENTRY+2)],scope='all byte values, sixteen NZCV states, both entries and return modes, low-address rejection, EWRAM/IWRAM, pointer aliases, track memory and r0-r12')
    (OUT/'report.json').write_text(json.dumps(report,indent=2)+'\n')
    print(report)

if __name__=='__main__': main()
