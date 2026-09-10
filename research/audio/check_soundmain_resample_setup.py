#!/usr/bin/env python3
"""Compile and verify the complete resampling setup candidate against ROM/RAM."""
import argparse, hashlib, json, random, subprocess
from pathlib import Path
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UC_HOOK_MEM_READ, UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
ENTRY=0x080cf824

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
    out=ROOT/'.deps/soundmain-packed/resample-setup';out.mkdir(exist_ok=True)
    obj=out/'candidate.o';elf=out/'candidate.elf';binary=out/'candidate.bin'
    command=[a.compiler,'-c',str(ROOT/'src/m4a_resample_setup.c'),'-o',str(obj),'-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),'-std=gnu89','-O1','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes']
    for plugin in ('byte_preincrement','arm_adjacent'):command+=['-fplugin='+str(ROOT/'.deps/flood-core-new-backend'/f'{plugin}.so')]
    command+=['-fplugin-arg-arm_adjacent-destination=SoundMainRAM_Resample','-fplugin-arg-arm_adjacent-sp-input=push2','-fplugin-arg-arm_adjacent-lr-input=load-word']
    subprocess.run(command,check=True)
    subprocess.run(['arm-none-eabi-ld',f'-Ttext={hex(ENTRY)}','--entry=SoundMainRAM_ResampleSetup',str(obj),'-o',str(elf)],check=True)
    subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
    code=binary.read_bytes();rom=(ROOT/'baserom.gba').read_bytes()
    assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
    assert len(code)==28 and code==rom[ENTRY-0x08000000:ENTRY-0x08000000+28]
    production=(ROOT/'fireemblem8.gba').read_bytes()
    assert production[ENTRY-0x08000000:ENTRY-0x08000000+28]==code
    nm=subprocess.check_output(['arm-none-eabi-nm','-S',str(ROOT/'fireemblem8.elf')],text=True)
    fields=next(line.split() for line in nm.splitlines() if line.endswith(' SoundMainRAM_ResampleSetup'))
    assert int(fields[0],16)==ENTRY and int(fields[1],16)==28
    machines=[]
    for copied in (False,True):
        for candidate in (False,True):
            uc=Uc(UC_ARCH_ARM,UC_MODE_ARM);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom)
            uc.mem_map(0x03000000,0x8000);uc.mem_map(0x02000000,0x1000)
            start=ENTRY+(0x03002c60-0x080cf54c if copied else 0)
            uc.mem_write(start,(production if candidate else rom)[ENTRY-0x08000000:ENTRY-0x08000000+28])
            events=[]
            def hook(u,access,address,size,value,user): user.append((access,address,size,value if access==17 else int.from_bytes(u.mem_read(address,size),'little')))
            uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,hook,events)
            machines.append((uc,start,events))
    products=[0,1,0x7fffffff,0x80000000,0xffffffff,0x12345678,528,0x40000000]
    cases=0;rng=random.Random(0x524)
    def check(first,second,product,flags,channel,source,freq,fraction):
        nonlocal cases
        sp=0x03007000;ram=bytearray([0xa5])*0x200;data=bytearray([0x5a])*0x1000
        def write(addr,value,size):
            buf,base=(ram,0x03006f00) if addr>=0x03000000 else (data,0x02000000)
            buf[addr-base:addr-base+size]=value.to_bytes(size,'little')
        def read(addr,size):
            buf,base=(ram,0x03006f00) if addr>=0x03000000 else (data,0x02000000)
            return int.from_bytes(buf[addr-base:addr-base+size],'little')
        write(channel+28,fraction,4);write(channel+32,freq,4);write(source,first,1);write(source+1,second,1)
        initial=(bytes(ram),bytes(data))
        write(sp-8,channel,4);write(sp-4,product,4)
        fw=read(channel+28,4);rate=read(channel+32,4);x=read(source,1);y=read(source+1,1)
        expected_events=[(17,sp-8,4,channel),(17,sp-4,4,product),(16,channel+28,4,fw),(16,channel+32,4,rate),(16,source,1,x),(16,source+1,1,y)]
        sx=x-256 if x>=128 else x;sy=y-256 if y>=128 else y
        regs=[0x12340000+i for i in range(13)];regs[3]=source;regs[4]=channel;regs[12]=product
        expected=regs.copy();expected[0]=sx&0xffffffff;expected[1]=(sy-sx)&0xffffffff;expected[3]=source+1;expected[4]=(rate*product)&0xffffffff
        for uc,start,events in machines:
            uc.mem_write(0x03006f00,initial[0]);uc.mem_write(0x02000000,initial[1]);events.clear()
            for i,value in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(i)),value)
            uc.reg_write(r.UC_ARM_REG_SP,sp);uc.reg_write(r.UC_ARM_REG_LR,0xdeadbeef);uc.reg_write(r.UC_ARM_REG_CPSR,0x13|flags<<28)
            uc.emu_start(start,start+28,count=8)
            assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(i))) for i in range(13)]==expected,(cases,'regs')
            assert uc.reg_read(r.UC_ARM_REG_PC)==start+28 and uc.reg_read(r.UC_ARM_REG_SP)==sp-8
            assert uc.reg_read(r.UC_ARM_REG_LR)==fw and uc.reg_read(r.UC_ARM_REG_CPSR)==0x13|flags<<28
            assert bytes(uc.mem_read(0x03006f00,0x200))==bytes(ram) and bytes(uc.mem_read(0x02000000,0x1000))==bytes(data)
            assert events==expected_events,(cases,events,expected_events)
        cases+=1
    for first in range(256):
        for second in range(256):check(first,second,products[second%8],first%16,0x02000100,0x02000800,rng.getrandbits(32),rng.getrandbits(32))
    for channel in (0x02000100,0x03007000-36,0x03007000-40,0x03007000-32):
        for source in (0x03007000-8,0x03007000-4):
            for product in products:
                for flags in range(16):check(rng.randrange(256),rng.randrange(256),product,flags,channel,source,rng.getrandbits(32),rng.getrandbits(32))
    report=dict(cases=cases,machines_per_case=4,matching_bytes=28,all_sample_byte_pairs=65536,alias_cases=1024,production_integrated=True,scope='Original and production ROM/copied RAM; full registers/NZCV/SP/LR, ordered stack stores and channel/sample reads, complete data/frame memory and alias effects.')
    (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
