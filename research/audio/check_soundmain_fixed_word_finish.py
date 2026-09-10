#!/usr/bin/env python3
"""Check production fixed-rate stereo-word completion and signed counter branches."""
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UC_HOOK_MEM_READ, UC_HOOK_MEM_WRITE, UC_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/soundmain-packed'
ENTRY,SP,DATA=0x080cf7a8,0x03006000,0x02000000

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--copied-ram',action='store_true');a=p.parse_args()
    rom=(ROOT/'baserom.gba').read_bytes();production=(ROOT/'fireemblem8.gba').read_bytes()
    assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
    assert rom[0xcf7a8:0xcf7bc]==production[0xcf7a8:0xcf7bc]
    nm=subprocess.check_output(['arm-none-eabi-nm','-S',str(ROOT/'fireemblem8.elf')],text=True)
    fields=next(line.split() for line in nm.splitlines() if line.endswith(' SoundMainRAM_FixedWordFinish'))
    assert int(fields[0],16)==ENTRY and int(fields[1],16)==20,fields
    symbols={line.split()[-1]:int(line.split()[0],16) for line in nm.splitlines() if len(line.split())>=3}
    assert symbols['SoundMainRAM_FixedSetup']==0x080cf704 and symbols['SoundMainRAM_SaveChannel']==0x080cf8b8
    machines=[]
    def access(uc,kind,address,size,value,trace):trace.append((kind,address,size,value&0xffffffff))
    for image in (rom,production):
        uc=Uc(UC_ARCH_ARM,UC_MODE_ARM);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,image);uc.mem_map(DATA,0x2000);uc.mem_map(0x03000000,0x8000)
        if a.copied_ram:uc.mem_write(0x03002c60,image[0xcf54c:0xcf94c])
        trace=[]
        for begin,end in ((DATA,DATA+0x1fff),(SP-0x800,SP+0x7ff)):
            uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,access,trace,begin=begin,end=end)
        machines.append((uc,trace))
    delta=0x03002c60-0x080cf54c if a.copied_ram else 0
    counts=sorted({n*0x01010101 for n in range(256)}|{0,1,2,3,4,5,255,256,0x7fffffff,0x80000000})
    cases=0;paths={'repeat':0,'finish':0}
    for count in counts:
        outcome='repeat' if (count if count<0x80000000 else count-0x100000000)>4 else 'finish'
        updated=(count-4)&0xffffffff;overflow=bool((count^4)&(count^updated)&0x80000000)
        expected_flags=((updated>>31)<<3)|((updated==0)<<2)|((count>=4)<<1)|overflow
        target=(0x080cf704 if outcome=='repeat' else 0x080cf8b8)+delta
        for output in (DATA+0x800,SP,SP-0x630,SP-4):
            for left,right in ((0,0),(0xffffffff,0xffffffff),(0x80000000,0x7fffffff),(0x01020304,0xdeadbeef),(0xff00ff00,0x00ff00ff),(0x12345678,0x87654321)):
                for flags in range(16):
                    regions=[(DATA,bytearray([0xa5])*0x2000),(SP-0x800,bytearray([0x5a])*0x1000)]
                    expected=[(address,raw.copy()) for address,raw in regions]
                    writes=[(UC_MEM_WRITE,output+1584,4,left),(UC_MEM_WRITE,output,4,right)]
                    for _,address,_,value in writes:
                        for base,raw in expected:
                            if base<=address<base+len(raw):struct.pack_into('<I',raw,address-base,value);break
                        else:raise AssertionError('unmapped expected store')
                    regs=[0x12340000+i for i in range(13)];regs[5]=output;regs[6]=right;regs[7]=left;regs[8]=count
                    final=regs.copy();final[5]+=4;final[8]=updated
                    lr=(0,7,0x80000000,0xffffffff,0xdeadbeef)[cases%5]
                    for uc,trace in machines:
                        for base,raw in regions:uc.mem_write(base,bytes(raw))
                        trace.clear()
                        for i,value in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(i)),value)
                        uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,lr);uc.reg_write(r.UC_ARM_REG_CPSR,0x13|flags<<28)
                        uc.emu_start(ENTRY+delta,target,count=6)
                        assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(i))) for i in range(13)]==final
                        assert uc.reg_read(r.UC_ARM_REG_SP)==SP and uc.reg_read(r.UC_ARM_REG_LR)==lr
                        assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x13|expected_flags<<28
                        assert uc.reg_read(r.UC_ARM_REG_PC)==target
                        for base,raw in expected:assert bytes(uc.mem_read(base,len(raw)))==raw
                        assert trace==writes
                    paths[outcome]+=1;cases+=1
    report=dict(cases=cases,count_values=len(counts),paths=paths,matching_C_bytes=20,copied_RAM=a.copied_ram,scope='Original/production stereo stores left then right, output writeback, signed original-count branch including overflow, full registers/NZCV/LR/SP and memory/canaries with frame aliases')
    (OUT/('fixed-word-finish-production-ram.json' if a.copied_ram else 'fixed-word-finish-production.json')).write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
