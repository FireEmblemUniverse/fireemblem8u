#!/usr/bin/env python3
"""Validate fixed-rate setup C arithmetic before private-tail integration."""
import argparse, hashlib, json, random, subprocess
from pathlib import Path
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UC_HOOK_CODE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
ENTRY=0x080cf704

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
    out=ROOT/'.deps/soundmain-packed/fixed-setup';out.mkdir(exist_ok=True)
    obj=out/'candidate.o';elf=out/'candidate.elf';binary=out/'candidate.bin'
    subprocess.run([a.compiler,'-c',str(ROOT/'research/audio/soundmain_fixed_setup.c'),'-o',str(obj),'-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),'-std=gnu89','-O1','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/subtract_compare.so')],check=True)
    subprocess.run(['arm-none-eabi-ld','-Ttext=0x08001000','--entry=SoundMainRAM_FixedSetupCandidate','--defsym=SoundMainRAM_Short=0x08002000','--defsym=SoundMainRAM_Packed=0x08003000',str(obj),'-o',str(elf)],check=True)
    subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
    code=binary.read_bytes();rom=(ROOT/'baserom.gba').read_bytes()
    assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
    # Explicitly skip the compiler's LR push and stop before BL changes LR.
    # These are semantic-body checks, not a matching private-entry replacement.
    assert code[:4].hex()=='04e02de5'
    calls={}
    for offset in range(0,len(code),4):
        word=int.from_bytes(code[offset:offset+4],'little')
        if word>>24==0xeb:
            delta=word&0xffffff
            if delta&0x800000:delta-=0x1000000
            destination=0x08001000+offset+8+delta*4
            assert destination in (0x08002000,0x08003000)
            calls[0x08001000+offset]='short' if destination==0x08002000 else 'packed'
    assert len(calls)==3 and list(calls.values()).count('packed')==2
    machines=[]
    for copied in (False,True):
        for candidate in (False,True):
            uc=Uc(UC_ARCH_ARM,UC_MODE_ARM);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(0x03000000,0x8000)
            delta=0x03002c60-0x080cf54c if copied else 0
            if candidate:
                base=0x03002000 if copied else 0x08001000;uc.mem_write(base,code);start=base+4
                stops={addr+(base-0x08001000):kind for addr,kind in calls.items()}
            else:
                start=ENTRY+delta;uc.mem_write(start,rom[0xcf704:0xcf730]);stops={0x080cf774+delta:'short',0x080cf730+delta:'packed'}
            state={}
            def hook(u,address,size,user):
                exits,result=user
                if address in exits:result['path']=exits[address];u.emu_stop()
            uc.hook_add(UC_HOOK_CODE,hook,(stops,state));machines.append((uc,start,state))
    def signed(x):return x-0x100000000 if x&0x80000000 else x
    def subtract_flags(x,y):
        result=(x-y)&0xffffffff
        return ((result>>31)<<3)|((result==0)<<2)|((x>=y)<<1)|bool(((x^y)&(x^result))&0x80000000)
    rng=random.Random(0xf17e)
    counts=sorted(set(range(256))|{rng.getrandbits(32) for _ in range(128)}|{527,528,529,0x7ffffffe,0x7fffffff,0x80000000,0x80000001,0xfffffffc,0xfffffffe,0xffffffff})
    requested=[0,1,3,4,5,16,32,527,528,529,0x40000000,0x7fffffff,0x80000000,0x80000001,0xfffffffc,0xffffffff]
    paths={'short':0,'packed_remaining':0,'packed_final':0};cases=overflow=0
    for count in counts:
        for need in requested:
            for flags in range(16):
                lr=[0,1,0xffffffff,0xdeadbeef][flags%4]
                regs=[0x12340000+i for i in range(13)];regs[2]=count;regs[8]=need;expected=regs.copy();expected_lr=lr
                expected_flags=subtract_flags(count,4);kind='short'
                if signed(count)>4:
                    expected[2]=(count-need)&0xffffffff;expected_flags=subtract_flags(count,need)
                    overflow+=expected_flags&1
                    if signed(count)>signed(need):
                        expected_lr=0;kind='packed_remaining'
                    else:
                        expected[8]=(count-4)&0xffffffff;expected_lr=(need-expected[8])&0xffffffff
                        masked=count&3;expected[2]=masked or 4
                        expected_flags=(expected_flags&3)|((masked==0)<<2);kind='packed_final'
                for uc,start,state in machines:
                    frame=bytes([0xa5])*256;uc.mem_write(0x03006f80,frame);state.clear()
                    for i,value in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(i)),value)
                    uc.reg_write(r.UC_ARM_REG_SP,0x03007000);uc.reg_write(r.UC_ARM_REG_LR,lr);uc.reg_write(r.UC_ARM_REG_CPSR,0x13|flags<<28)
                    uc.emu_start(start,0,count=30)
                    assert state.get('path')==('short' if kind=='short' else 'packed'),(cases,state,kind)
                    assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(i))) for i in range(13)]==expected,(cases,'registers')
                    assert uc.reg_read(r.UC_ARM_REG_LR)==expected_lr and uc.reg_read(r.UC_ARM_REG_SP)==0x03007000
                    assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x13|expected_flags<<28,(cases,'flags')
                    assert bytes(uc.mem_read(0x03006f80,256))==frame
                paths[kind]+=1;cases+=1
    report=dict(cases=cases,machines_per_case=4,count_values=len(counts),requested_values=len(requested),paths=paths,subtraction_overflow_cases=overflow,original_bytes=44,candidate_bytes=len(code),production_integrated=False,limitations=['Compiler LR push is skipped and execution stops before each terminal BL; private frame/tail conversion and exact 44-byte integration remain unfinished.'],scope='All registers, LR, SP, NZCV, paths and stack canaries; original and candidate semantic bodies in ROM/copied RAM.')
    (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
