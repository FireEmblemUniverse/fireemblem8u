#!/usr/bin/env python3
"""Check one wrapping iteration, including signed-overflow and non-exiting inputs."""
import argparse
import hashlib
import json
from pathlib import Path
import random
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UC_HOOK_CODE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/soundmain-packed'
MASK=0xffffffff
REGS=[getattr(r,'UC_ARM_REG_R'+str(i)) for i in range(13)]
def signed(n):return n-(0x100000000 if n&0x80000000 else 0)
def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
    obj=OUT/'wrap-candidate.o';elf=obj.with_suffix('.elf');binary=obj.with_suffix('.bin')
    subprocess.run([a.compiler,'-c',str(ROOT/'src/m4a_wrap.c'),'-o',str(obj),'-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),'-std=gnu89','-O1','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/arm_adjacent.so'),'-fplugin-arg-arm_adjacent-destination=SoundMainRAM_ResampleWrap','-fplugin-arg-arm_adjacent-early=SoundMainRAM_ResampleReload','-fplugin-arg-arm_adjacent-transfer=branch','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/signed_sum.so')],check=True)
    subprocess.run(['arm-none-eabi-ld','-Ttext=0x080cf7d0','--entry=SoundMainRAM_ResampleWrap','--defsym=SoundMainRAM_ResampleReload=0x080cf888',str(obj),'-o',str(elf)],check=True)
    subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
    code=binary.read_bytes()
    rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
    production=(ROOT/'fireemblem8.gba').read_bytes()
    assert len(code)==16 and code==rom[0xcf7d0:0xcf7e0]==production[0xcf7d0:0xcf7e0],code.hex()
    symbols=subprocess.check_output(['arm-none-eabi-nm','-S',str(ROOT/'fireemblem8.elf')],text=True)
    fields=next(line.split() for line in symbols.splitlines() if line.endswith(' SoundMainRAM_ResampleWrap'))
    assert int(fields[0],16)==0x080cf7d0 and int(fields[1],16)==16,fields
    machines=[]
    for mode in ('rom','ram','production','production_ram'):
        uc=Uc(UC_ARCH_ARM,UC_MODE_ARM);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(0x03000000,0x8000)
        delta=0x03002c60-0x080cf54c if mode.endswith('ram') else 0
        image=production if mode.startswith('production') else rom
        uc.mem_write(0x08000000,image)
        if mode.endswith('ram'):uc.mem_write(0x03002c60,image[0xcf54c:0xcf94c])
        entry=0x080cf7d0+delta
        stops= {entry:'repeat',0x080cf888+delta:'reload'}
        state=[]
        def hook(uc,pc,size,data):
            entry,stops,state=data
            if not state:
                assert pc==entry;state.append('entered');return
            if pc in stops:state.append(stops[pc]);uc.emu_stop()
        uc.hook_add(UC_HOOK_CODE,hook,(entry,stops,state));machines.append((mode,uc,entry,state))
    boundaries=[0,1,2,3,255,256,511,0x7ffffffe,0x7fffffff,0x80000000,0x80000001,0xfffffffe,0xffffffff]
    rng=random.Random(0x8a91)
    pairs=[(a,b) for a in boundaries for b in boundaries]+[(rng.getrandbits(32),rng.getrandbits(32)) for _ in range(256)]
    cases=0;outcomes={'repeat':0,'reload':0};overflow_cases=0
    for length,count in pairs:
        total=signed(length)+signed(count);answer=total&MASK;outcome='reload' if total>0 else 'repeat'
        overflow=int(total < -0x80000000 or total > 0x7fffffff)
        expected_flags=((answer>>31)<<3)|((answer==0)<<2)|((length+count>MASK)<<1)|overflow
        for skip in (0,1,511,0x7fffffff,0x80000000,0xffffffff):
            for flags in range(16):
                initial=[0x12340000+i for i in range(13)];initial[0]=length;initial[2]=count;initial[9]=skip
                expected=initial.copy();expected[2]=answer
                if outcome=='repeat':expected[9]=(skip-length)&MASK
                lr=rng.getrandbits(32)
                for mode,uc,entry,state in machines:
                    state.clear();raw=bytearray([0xa5])*256;uc.mem_write(0x03006f80,bytes(raw))
                    for reg,value in zip(REGS,initial):uc.reg_write(reg,value)
                    uc.reg_write(r.UC_ARM_REG_CPSR,0x13|flags<<28);uc.reg_write(r.UC_ARM_REG_LR,lr);uc.reg_write(r.UC_ARM_REG_SP,0x03007000)
                    uc.emu_start(entry,0,count=32)
                    assert state==['entered',outcome],(mode,length,count,state)
                    for i in range(13):assert uc.reg_read(REGS[i])==expected[i],(mode,i,length,count)
                    assert uc.reg_read(r.UC_ARM_REG_LR)==lr
                    assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x13|expected_flags<<28
                    assert [uc.reg_read(reg) for reg in REGS]==expected
                    assert uc.reg_read(r.UC_ARM_REG_SP)==0x03007000
                    assert bytes(uc.mem_read(0x03006f80,256))==raw
                cases+=1;outcomes[outcome]+=1;overflow_cases+=overflow
    report=dict(cases=cases,machines_per_case=4,outcomes=outcomes,signed_overflow_cases=overflow_cases,candidate_bytes=len(code),original_bytes=16,production_integration=True,scope='One loop iteration in original and production, each in ROM/copied RAM, including inputs that may repeat forever. Independent mathematical signed sum and wrapped count/skip, continuation selection and LR; all engines match registers/NZCV; full frame preserved; exact linked 16-byte C block and both branch targets verified.')
    (OUT/'wrap-production-report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
