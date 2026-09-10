#!/usr/bin/env python3
"""Check both production packed-lane advances, full ADDS flags and carry exits."""
import argparse
import hashlib
import json
from pathlib import Path
import random
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/soundmain-packed'
def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--copied-ram',action='store_true');a=p.parse_args()
    rom=(ROOT/'baserom.gba').read_bytes();production=(ROOT/'fireemblem8.gba').read_bytes()
    assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
    nm=subprocess.check_output(['arm-none-eabi-nm','-S',str(ROOT/'fireemblem8.elf')],text=True)
    rng=random.Random(0x1a4e)
    values=sorted({n*0x01010101 for n in range(256)}|{rng.getrandbits(32) for _ in range(512)}|{0,1,0x3fffffff,0x40000000,0x7fffffff,0x80000000,0xbfffffff,0xc0000000,0xffffffff}|{0x02000800+lane*0x40000000 for lane in range(4)})
    cases=0;paths={'mix':0,'word':0};entries={}
    delta=0x03002c60-0x080cf54c if a.copied_ram else 0
    for name,entry,mix in [('SoundMainRAM_ShortCount',0x080cf7a0,0x080cf77c),('SoundMainRAM_ResampleNoAdvance',0x080cf894,0x080cf848)]:
        fields=next(line.split() for line in nm.splitlines() if line.endswith(' '+name));assert int(fields[0],16)==entry and int(fields[1],16)==8,fields
        offset=entry-0x08000000;assert rom[offset:offset+8]==production[offset:offset+8]
        machines=[]
        for image in (rom,production):
            uc=Uc(UC_ARCH_ARM,UC_MODE_ARM);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,image);uc.mem_map(0x03000000,0x8000)
            if a.copied_ram:uc.mem_write(0x03002c60,image[0xcf54c:0xcf94c])
            machines.append(uc)
        entries[name]=0
        for value in values:
            answer=(value+0x40000000)&0xffffffff;carry=value>=0xc0000000
            overflow=bool((~(value^0x40000000)&(value^answer))&0x80000000)
            expected_flags=((answer>>31)<<3)|((answer==0)<<2)|(carry<<1)|overflow
            target=(entry+8 if carry else mix)+delta
            for flags in range(16):
                regs=[0x12340000+i for i in range(13)];regs[5]=value;expected=regs.copy();expected[5]=answer
                lr=(0,1,7,0x80000000,0xffffffff,0xdeadbeef)[cases%6];raw=bytes([0xa5])*256
                for uc in machines:
                    uc.mem_write(0x03006f80,raw)
                    for i,x in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(i)),x)
                    uc.reg_write(r.UC_ARM_REG_SP,0x03007000);uc.reg_write(r.UC_ARM_REG_LR,lr);uc.reg_write(r.UC_ARM_REG_CPSR,0x13|flags<<28)
                    uc.emu_start(entry+delta,target,count=3)
                    assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(i))) for i in range(13)]==expected
                    assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x13|expected_flags<<28
                    assert uc.reg_read(r.UC_ARM_REG_SP)==0x03007000 and uc.reg_read(r.UC_ARM_REG_LR)==lr
                    assert uc.reg_read(r.UC_ARM_REG_PC)==target
                    assert bytes(uc.mem_read(0x03006f80,256))==raw
                cases+=1;entries[name]+=1;paths['word' if carry else 'mix']+=1
    report=dict(cases=cases,output_values=len(values),entries=entries,paths=paths,matching_C_bytes=16,copied_RAM=a.copied_ram,scope='Two production/original lane advances: all selected 32-bit outputs, four valid packed lanes, all input flags; expected wrapped r5, exact ADDS NZCV, all registers/SP/LR, frame canaries and carry-selected destinations')
    (OUT/('lane-production-ram.json' if a.copied_ram else 'lane-production.json')).write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
