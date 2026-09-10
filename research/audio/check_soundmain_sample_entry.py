#!/usr/bin/env python3
"""Verify shared sample entry, ordered frame/channel effects and TST flags."""
import argparse, hashlib, json, random, subprocess
from pathlib import Path
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UC_HOOK_MEM_READ, UC_HOOK_MEM_WRITE, UC_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
ENTRY=0x080cf6e4

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args()
    out=ROOT/'.deps/soundmain-packed/sample-entry';out.mkdir(exist_ok=True)
    obj=out/'candidate.o';elf=out/'candidate.elf';binary=out/'candidate.bin'
    subprocess.run([a.compiler,'-c',str(ROOT/'src/m4a_sample_entry.c'),'-o',str(obj),'-I',str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),'-std=gnu89','-O1','-marm','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-Werror=attributes','-fplugin='+str(ROOT/'.deps/flood-core-new-backend/arm_adjacent.so'),'-fplugin-arg-arm_adjacent-destination=SoundMainRAM_FixedSetup','-fplugin-arg-arm_adjacent-early=SoundMainRAM_ResampleSetup','-fplugin-arg-arm_adjacent-sp-input=store0'],check=True)
    subprocess.run(['arm-none-eabi-ld',f'-Ttext={hex(ENTRY)}','--entry=SoundMainRAM_SampleEntry','--defsym=SoundMainRAM_ResampleSetup=0x080cf824',str(obj),'-o',str(elf)],check=True)
    subprocess.run(['arm-none-eabi-objcopy','-O','binary','-j','.text',str(elf),str(binary)],check=True)
    code=binary.read_bytes();rom=(ROOT/'baserom.gba').read_bytes();production=(ROOT/'fireemblem8.gba').read_bytes()
    assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
    assert len(code)==32 and code==rom[0xcf6e4:0xcf704]==production[0xcf6e4:0xcf704]
    nm=subprocess.check_output(['arm-none-eabi-nm','-S',str(ROOT/'fireemblem8.elf')],text=True)
    fields=next(line.split() for line in nm.splitlines() if line.endswith(' SoundMainRAM_SampleEntry'))
    assert int(fields[0],16)==ENTRY and int(fields[1],16)==32
    machines=[]
    for copied in (False,True):
        for image in (rom,production):
            uc=Uc(UC_ARCH_ARM,UC_MODE_ARM);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,image);uc.mem_map(0x03000000,0x8000);uc.mem_map(0x02000000,0x1000)
            delta=0x03002c60-0x080cf54c if copied else 0
            if copied:uc.mem_write(ENTRY+delta,image[0xcf6e4:0xcf704])
            events=[]
            def hook(u,access,address,size,value,user):user.append((access,address,size,value if access==UC_MEM_WRITE else int.from_bytes(u.mem_read(address,size),'little')))
            uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,hook,events);machines.append((uc,delta,events))
    rng=random.Random(0x6e4);cases=0;paths={'fixed':0,'resample':0}
    def check(right,left,kind,count,flags,channel):
        nonlocal cases
        sp=0x03007000;ram=bytearray([0xa5])*0x200;data=bytearray([0x5a])*0x1000
        def write(addr,value,size):
            buf,base=(ram,0x03006f00) if addr>=0x03000000 else (data,0x02000000)
            buf[addr-base:addr-base+size]=value.to_bytes(size,'little')
        def read(addr):return ram[addr-0x03006f00] if addr>=0x03000000 else data[addr-0x02000000]
        write(channel+10,right,1);write(channel+11,left,1);write(channel+1,kind,1);initial=(bytes(ram),bytes(data));write(sp,count,4)
        er=read(channel+10);el=read(channel+11);type_byte=read(channel+1)
        resample=not(type_byte&8);target=0x080cf824 if resample else 0x080cf704
        expected_flags=(flags&3)|(resample<<2)
        regs=[0x12340000+i for i in range(13)];regs[4]=channel;regs[8]=count;expected=regs.copy();expected[0]=type_byte;expected[10]=er<<16;expected[11]=el<<16
        lr=[0,1,0xffffffff,0xdeadbeef][flags%4]
        accesses=[(17,sp,4,count),(16,channel+10,1,er),(16,channel+11,1,el),(16,channel+1,1,type_byte)]
        for uc,delta,events in machines:
            uc.mem_write(0x03006f00,initial[0]);uc.mem_write(0x02000000,initial[1]);events.clear()
            for i,value in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(i)),value)
            uc.reg_write(r.UC_ARM_REG_SP,sp);uc.reg_write(r.UC_ARM_REG_LR,lr);uc.reg_write(r.UC_ARM_REG_CPSR,0x13|flags<<28)
            uc.emu_start(ENTRY+delta,target+delta,count=9)
            assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(i))) for i in range(13)]==expected
            assert uc.reg_read(r.UC_ARM_REG_SP)==sp and uc.reg_read(r.UC_ARM_REG_LR)==lr
            assert uc.reg_read(r.UC_ARM_REG_PC)==target+delta and uc.reg_read(r.UC_ARM_REG_CPSR)==0x13|expected_flags<<28
            assert events==accesses,(cases,events,accesses)
            assert bytes(uc.mem_read(0x03006f00,0x200))==bytes(ram) and bytes(uc.mem_read(0x02000000,0x1000))==bytes(data)
        cases+=1;paths['resample' if resample else 'fixed']+=1
    for right in range(256):
        for left in range(256):check(right,left,right^left,rng.getrandbits(32),right%16,0x02000100)
    kinds=[0,1,7,8,9,15,16,31,63,127,128,129,247,248,254,255]
    for channel in (0x03007000-10,0x03007000-11,0x03007000-1,0x03007000,0x03007000-8):
        for count in (0,1,16,528,0x7fffffff,0x80000000,0xffffffff,0x12345678):
            for kind in kinds:
                for flags in range(16):check(rng.randrange(256),rng.randrange(256),kind,count,flags,channel)
    report=dict(cases=cases,machines_per_case=4,matching_bytes=32,all_volume_pairs=65536,alias_cases=cases-65536,paths=paths,production_integrated=True,scope='Original/production ROM and copied RAM; exact r0-r12/SP/LR/NZCV/PC, ordered count store then volume/type reads, full tested frame/data memory and aliases.')
    (out/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
if __name__=='__main__':main()
