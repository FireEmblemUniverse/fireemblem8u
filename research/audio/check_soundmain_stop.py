#!/usr/bin/env python3
"""Check production resampling frame restoration in ROM and copied RAM."""
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UC_HOOK_MEM_READ, UC_HOOK_MEM_WRITE, UC_MEM_READ
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/soundmain-packed'
ENTRY=0x080cf7e0;TARGET=0x080cf7fc

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--copied-ram',action='store_true');a=p.parse_args()
    rom=(ROOT/'baserom.gba').read_bytes();production=(ROOT/'fireemblem8.gba').read_bytes()
    assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
    assert rom[0xcf7e0:0xcf7ec]==production[0xcf7e0:0xcf7ec]
    nm=subprocess.check_output(['arm-none-eabi-nm','-S',str(ROOT/'fireemblem8.elf')],text=True)
    fields=next(line.split() for line in nm.splitlines() if line.endswith(' SoundMainRAM_ResampleStop'))
    assert int(fields[0],16)==ENTRY and int(fields[1],16)==12,fields
    assert next(int(line.split()[0],16) for line in nm.splitlines() if line.endswith(' SoundMainRAM_Partial'))==TARGET
    machines=[]
    def access(uc,kind,address,size,value,trace):
        if kind==UC_MEM_READ:value=int.from_bytes(uc.mem_read(address,size),'little')
        trace.append((kind,address,size,value))
    for image in (rom,production):
        uc=Uc(UC_ARCH_ARM,UC_MODE_ARM);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,image);uc.mem_map(0x03000000,0x8000)
        if a.copied_ram:uc.mem_write(0x03002c60,image[0xcf54c:0xcf94c])
        trace=[];uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace,begin=0x03006000,end=0x03007fff);machines.append((uc,trace))
    delta=0x03002c60-0x080cf54c if a.copied_ram else 0
    words=sorted({n*0x01010101 for n in range(256)}|{1,2,255,256,0x7fffffff,0x80000000})
    cases=0
    for channel in words:
        for product in (0,1,255,256,0x7fffffff,0x80000000,0xffffffff,0xdeadbeef):
            for sp in (0x03006010,0x03007000,0x03007fb0):
                for flags in range(16):
                    raw=bytearray([0xa5])*96;struct.pack_into('<II',raw,16,channel,product)
                    regs=[0x12340000+i for i in range(13)];regs[2]=(0,1,0xffffffff)[cases%3]
                    expected=regs.copy();expected[2]=0;expected[4]=channel;expected[12]=product
                    lr=(0,1,7,0x80000000,0xffffffff,0xdeadbeef)[cases%6]
                    for uc,trace in machines:
                        uc.mem_write(sp-16,bytes(raw));trace.clear()
                        for i,value in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(i)),value)
                        uc.reg_write(r.UC_ARM_REG_SP,sp);uc.reg_write(r.UC_ARM_REG_LR,lr);uc.reg_write(r.UC_ARM_REG_CPSR,0x13|flags<<28)
                        uc.emu_start(ENTRY+delta,TARGET+delta,count=6)
                        assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(i))) for i in range(13)]==expected
                        assert uc.reg_read(r.UC_ARM_REG_SP)==sp+8 and uc.reg_read(r.UC_ARM_REG_LR)==lr
                        assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x13|flags<<28
                        assert uc.reg_read(r.UC_ARM_REG_PC)==TARGET+delta
                        assert bytes(uc.mem_read(sp-16,96))==raw
                        assert trace==[(UC_MEM_READ,sp,4,channel),(UC_MEM_READ,sp+4,4,product)]
                    cases+=1
    report=dict(cases=cases,channel_values=len(words),matching_C_bytes=12,copied_RAM=a.copied_ram,scope='Production/original stop path; ordered two-word restore, SP advance by eight, zero remaining count, full registers/NZCV/LR and unchanged frame/canaries at three stack placements; exact partial continuation')
    (OUT/('stop-production-ram.json' if a.copied_ram else 'stop-production.json')).write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
