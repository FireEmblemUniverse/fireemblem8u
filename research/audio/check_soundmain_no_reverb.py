#!/usr/bin/env python3
"""Verify exact no-reverb candidate bytes and complete private-ABI behavior."""
import argparse, hashlib, json, subprocess
from pathlib import Path
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB, UC_HOOK_MEM_READ, UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
ENTRY=0x080cf5ac;END=0x080cf5da;DATA=0x02000000;RIGHT=DATA+0x800

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
    out=ROOT/'.deps/soundmain-packed/no-reverb';out.mkdir(exist_ok=True)
    obj=out/'candidate.o';elf=out/'candidate.elf';binary=out/'candidate.bin'
    subprocess.run([a.compiler,'-c',str(ROOT/'src/m4a_no_reverb.c'),'-o',str(obj),'-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),'-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/word_postincrement.so'),'-fplugin='+str(ROOT/'.deps/flood-core-new-backend/shift_carry.so')],check=True)
    subprocess.run(['arm-none-eabi-ld','-Ttext=0x08001000','--entry=SoundMainRAM_NoReverb',str(obj),'-o',str(elf)],check=True)
    subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
    code=binary.read_bytes();assert len(code)==END-ENTRY
    rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
    assert code==rom[ENTRY-0x08000000:END-0x08000000], 'candidate bytes differ'
    production=(ROOT/'fireemblem8.gba').read_bytes();assert production==rom
    assert production[ENTRY-0x08000000:END-0x08000000]==code
    symbols=subprocess.check_output(['arm-none-eabi-nm','-S',str(ROOT/'fireemblem8.elf')],text=True)
    assert any(line.split()==['080cf5ac','0000002e','T','SoundMainRAM_NoReverb'] for line in symbols.splitlines())
    machines=[]
    for copied in (False,True):
        for candidate in (False,True):
            uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_map(0x03000000,0x8000);uc.mem_map(DATA,0x4000)
            if candidate:
                start=0x03002000 if copied else 0x08001000;uc.mem_write(start,code);end=start+len(code)
            else:
                delta=0x03002c60-0x080cf54c if copied else 0;start=ENTRY+delta;end=END+delta;uc.mem_write(start,rom[ENTRY-0x08000000:END-0x08000000])
            trace=[]
            def hook(u,kind,address,size,value,user):user.append((kind,address,size,value))
            uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,hook,trace)
            machines.append((uc,start,end,candidate,trace))
    counts=sorted(set(range(64))|set(range(64,529,4))|{1023,1024})
    cases=0;flag_mismatches=0;register_mismatches={};paths={'below_16':0,'normal':0};writes=0
    for count in counts:
        length=4*((1 if count&4 else 0)+(2 if count&8 else 0)+4*max(count>>4,1))
        for offset in (-12,0,4,8,1584):
            for flags in range(16):
                initial=bytes([0xa5])*0x4000;expected=bytearray(initial);expected_trace=[]
                for pos in range(0,length,4):
                    for address in (RIGHT+pos,RIGHT+offset+pos):
                        expected[address-DATA:address-DATA+4]=bytes(4);expected_trace.append((17,address,4,0))
                regs=[0x12340000+i for i in range(13)];regs[5]=RIGHT;regs[6]=offset&0xffffffff;regs[8]=count
                wanted=regs.copy();wanted[0]=0;wanted[1]=0 if count>=16 else 0xffffffff;wanted[5]=RIGHT+length;wanted[6]=RIGHT+offset+length
                end_flags=6 if count>=16 else 8;observed=[]
                for uc,start,end,candidate,trace in machines:
                    uc.mem_write(DATA,initial);frame=bytes([0xa5])*256;uc.mem_write(0x03006f80,frame);trace.clear()
                    for i,value in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(i)),value)
                    lr=0xdeadbeef;uc.reg_write(r.UC_ARM_REG_SP,0x03007000);uc.reg_write(r.UC_ARM_REG_LR,lr);uc.reg_write(r.UC_ARM_REG_CPSR,0x33|flags<<28)
                    uc.emu_start(start|1,end,count=10000)
                    result=[uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(i))) for i in range(13)]
                    actual_flags=uc.reg_read(r.UC_ARM_REG_CPSR)>>28
                    assert uc.reg_read(r.UC_ARM_REG_PC)==end and uc.reg_read(r.UC_ARM_REG_SP)==0x03007000 and uc.reg_read(r.UC_ARM_REG_LR)==lr
                    assert bytes(uc.mem_read(DATA,0x4000))==expected and bytes(uc.mem_read(0x03006f80,256))==frame
                    assert trace==expected_trace,(count,offset,candidate,'access order')
                    for i in (0,1,5,6,8):assert result[i]==wanted[i],(count,i,result,wanted)
                    assert result==wanted and actual_flags==end_flags,(count,offset,candidate,result,wanted,actual_flags,end_flags)
                    observed.append((result,actual_flags))
                assert observed[0]==observed[2] and observed[1]==observed[3]
                cases+=1;writes+=len(expected_trace);paths['below_16' if count<16 else 'normal']+=1
    report=dict(cases=cases,count_values=len(counts),machines_per_case=4,ordered_writes_per_implementation=writes,paths=paths,original_bytes=END-ENTRY,candidate_bytes=len(code),scratch_register_mismatch_cases=register_mismatches,flag_mismatch_cases=flag_mismatches,production_integrated=True,scope='Exact bytes, fallthrough, all registers and flags, ordered stereo stores and complete tested memory in original/candidate ROM and copied RAM.',limitations=['Counts tested from 0 through 1024; larger counts are not execution-tested.'])
    (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
