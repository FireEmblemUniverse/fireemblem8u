#!/usr/bin/env python3
"""Check exact production source advancement and private exits in ROM and RAM."""
import argparse
import hashlib
import json
from pathlib import Path
import random
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UC_HOOK_CODE, UC_HOOK_MEM_READ
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
OUT=ROOT/'.deps/soundmain-packed'
MASK=0xffffffff
REGS=[getattr(r,'UC_ARM_REG_R'+str(i)) for i in range(13)]
def signed(n): return (n&MASK)-(0x100000000 if n&0x80000000 else 0)
def subflags(a,b):
    v=(a-b)&MASK
    return ((v>>31)<<3)|((v==0)<<2)|((a>=b)<<1)|(((a^b)&(a^v))>>31)
def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
    obj=OUT/'advance-candidate.o';elf=OUT/'advance-candidate.elf';binary=OUT/'advance-candidate.bin'
    subprocess.run([a.compiler,'-c',str(ROOT/'src/m4a_advance.c'),'-o',str(obj),'-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),'-std=gnu89','-O1','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-fno-builtin','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/arm_adjacent.so'),'-fplugin-arg-arm_adjacent-destination=SoundMainRAM_ResampleNoAdvance','-fplugin-arg-arm_adjacent-early=SoundMainRAM_ResampleLoop','-fplugin-arg-arm_adjacent-lr-input=masked','-Werror=attributes','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/subtract_zero.so'),'-fplugin='+str(ROOT/'.deps/flood-core-new-backend/byte_preincrement.so'),'-fplugin='+str(ROOT/'.deps/flood-core-new-backend/subtract_compare.so')],check=True)
    subprocess.run(['arm-none-eabi-ld','-Ttext=0x080cf874','--entry=SoundMainRAM_ResampleAdvance','--defsym=SoundMainRAM_ResampleLoop=0x080cf7bc','--defsym=SoundMainRAM_ResampleNoAdvance=0x080cf894',str(obj),'-o',str(elf)],check=True)
    subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
    rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
    code=binary.read_bytes()
    assert len(code)==32 and code==rom[0xcf874:0xcf894],code.hex()
    production=(ROOT/'fireemblem8.gba').read_bytes()
    assert production[0xcf874:0xcf894]==code
    symbols=subprocess.check_output(['arm-none-eabi-nm','-S',str(ROOT/'fireemblem8.elf')],text=True)
    fields=next(line.split() for line in symbols.splitlines() if line.endswith(' SoundMainRAM_ResampleAdvance'))
    assert int(fields[0],16)==0x080cf874 and int(fields[1],16)==32,fields
    entries={line.split()[-1]:int(line.split()[0],16) for line in symbols.splitlines() if len(line.split())>=3}
    assert entries['SoundMainRAM_ResampleReload']==0x080cf888
    assert entries['SoundMainRAM_ResampleLoop']==0x080cf7bc and entries['SoundMainRAM_ResampleNoAdvance']==0x080cf894
    machines=[]
    for mode in ('rom','ram','candidate','candidate_ram'):
        uc=Uc(UC_ARCH_ARM,UC_MODE_ARM);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom)
        uc.mem_map(0x02000000,0x2000);uc.mem_map(0x03000000,0x8000)
        delta=0x03002c60-0x080cf54c if mode.endswith('ram') else 0
        if mode.startswith('candidate'):uc.mem_write(0x08000000,production)
        if mode.endswith('ram'):uc.mem_write(0x03002c60,bytes(uc.mem_read(0x080cf54c,0x400)))
        exits={0x080cf7bc+delta:'loop',0x080cf894+delta:'continue'}
        trace=[];state=[]
        def hook(uc,pc,size,user):
            exits,state=user
            if pc in exits:state.append(exits[pc]);uc.emu_stop()
        def read(uc,access,address,size,value,trace):trace.append((address,size,int.from_bytes(uc.mem_read(address,size),'little')))
        uc.hook_add(UC_HOOK_CODE,hook,(exits,state));uc.hook_add(UC_HOOK_MEM_READ,read,trace,begin=0x02000000,end=0x02001fff)
        machines.append((mode,uc,0x080cf874+delta,trace,state))
    rng=random.Random(0x8ad);data=bytes(rng.randrange(256) for _ in range(0x2000));source=0x02000800
    counts=[0,1,2,255,256,511,512,0x7fffffff,0x80000000,0x80000001,0xffffffff]
    skips=[0,1,2,3,127,255,256,511]
    cases=0;outcomes={'loop':0,'continue':0}
    for count in counts:
        for skip in skips:
            for sample in (-128,-1,0,1,127):
                for difference in (-255,-1,0,1,255):
                    for flags in range(16):
                        fraction=rng.getrandbits(32)
                        initial=[0x12340000+i for i in range(13)];initial[0]=sample&MASK;initial[1]=difference&MASK;initial[2]=count;initial[3]=source;initial[9]=skip
                        expected=initial.copy();expected[2]=(count-skip)&MASK;reads=[]
                        outcome='loop' if signed(count)<=signed(skip) else 'continue'
                        expected_flags=subflags(count,skip)
                        if outcome=='continue':
                            expected[9]=(skip-1)&MASK;expected_flags=subflags(skip,1)
                            if expected[9]==0:expected[0]=(sample+difference)&MASK
                            else:
                                expected[3]=(source+expected[9])&MASK
                                byte=data[expected[3]-0x02000000];expected[0]=(byte if byte<128 else byte-256)&MASK;reads.append((expected[3],1,byte))
                            expected[3]+=1;byte=data[expected[3]-0x02000000];reads.append((expected[3],1,byte))
                            expected[1]=((byte if byte<128 else byte-256)-expected[0])&MASK
                        for mode,uc,entry,trace,state in machines:
                            uc.mem_write(0x02000000,data);uc.mem_write(0x03006f00,bytes([0xa5])*512)
                            for reg,value in zip(REGS,initial):uc.reg_write(reg,value)
                            uc.reg_write(r.UC_ARM_REG_SP,0x03007000);uc.reg_write(r.UC_ARM_REG_LR,fraction);uc.reg_write(r.UC_ARM_REG_CPSR,0x13|flags<<28);trace.clear();state.clear()
                            uc.emu_start(entry,0,count=64)
                            assert state==[outcome],(mode,state)
                            for i in range(13):assert uc.reg_read(REGS[i])==expected[i],(mode,i,count,skip)
                            assert uc.reg_read(r.UC_ARM_REG_LR)==fraction&~0x3f800000
                            assert trace==reads,(mode,trace,reads)
                            assert bytes(uc.mem_read(0x02000000,len(data)))==data
                            assert [uc.reg_read(reg) for reg in REGS]==expected
                            assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x13|expected_flags<<28
                            assert uc.reg_read(r.UC_ARM_REG_SP)==0x03007000
                            assert bytes(uc.mem_read(0x03006f00,512))==bytes([0xa5])*512
                        outcomes[outcome]+=1;cases+=1
    report=dict(cases=cases,machines_per_case=4,outcomes=outcomes,candidate_bytes=len(code),original_bytes=32,production_integration=True,scope='Original and C candidate, both in ROM/copied RAM: all r0-r12 and live LR, ordered source reads, immutable source memory, signed overflow boundaries. All engines validate independently expected SP/frame/flags and private exits; exact 32-byte linked candidate matches original bytes. Production symbols, shared reload offset and linked bytes verified.')
    (OUT/'advance-production-report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
