#!/usr/bin/env python3
"""Compare C setup arithmetic with SoundMain stopped at its RAM mixer entry."""
import argparse
import json
from pathlib import Path
import struct
import subprocess
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_CODE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2];OUT=ROOT/'.deps/soundmain-setup'
ORIGINAL,MODEL,SOUND,OUTPUT,MIXER,RETURN=0x080cf4c8,0x080e1000,0x02000000,0x02003000,0x03002c60,0x080f0000
ID=0x68736d53

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--compiler',required=True);a=p.parse_args();OUT.mkdir(exist_ok=True)
    subprocess.run([a.compiler,'-S','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-I'+str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(ROOT/'research/audio/soundmain_setup.c'),'-o',str(OUT/'candidate.s')],check=True)
    subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(OUT/'candidate.s'),'-o',str(OUT/'candidate.o')],check=True)
    subprocess.run(['arm-none-eabi-ld','-Ttext='+hex(MODEL),str(OUT/'candidate.o'),'-o',str(OUT/'candidate.elf')],check=True,capture_output=True)
    subprocess.run(['arm-none-eabi-objcopy','-O','binary','--only-section=.text',str(OUT/'candidate.elf'),str(OUT/'candidate.bin')],check=True)
    rom=(ROOT/'baserom.gba').read_bytes();machines=[]
    for model in (False,True):
        uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB)
        for address,size in ((0x02000000,0x4000),(0x03000000,0x8000),(0x04000000,0x1000),(0x08000000,0x1000000)):uc.mem_map(address,size)
        uc.mem_write(0x08000000,rom);uc.mem_write(0x080e0000,bytes.fromhex('7047'));uc.mem_write(0x080e0010,bytes.fromhex('7047'))
        if model:uc.mem_write(MODEL,(OUT/'candidate.bin').read_bytes())
        machines.append(uc)
    trace=[]
    def callback(uc,address,size,data):
        if address in (0x080e0000,0x080e0010):trace.append((address,uc.reg_read(r.UC_ARM_REG_R0)))
    machines[0].hook_add(UC_HOOK_CODE,callback,begin=0x080e0000,end=0x080e0010)
    rows=[]
    for counter in range(256):
        for period in (0,1,2,255):
            for samples in (0,1,1584,0xffffffff):rows.append((counter,period,samples,(0,1,255)[counter%3],counter))
    for maxlines in (0,1,2,127,255):
        for vcount in range(256):rows.append((2,3,528,maxlines,vcount))
    cases=0
    for counter,period,samples,maxlines,vcount in rows:
        for optional in (False,True):
            for flags in (0,15):
                raw=bytearray(0x1000);struct.pack_into('<I',raw,0,ID);raw[4]=counter;raw[11]=period;raw[12]=maxlines
                struct.pack_into('<I',raw,16,samples)
                struct.pack_into('<III',raw,32,0x080e0011 if optional else 0,0x12345678,0x080e0001)
                trace.clear();values=[]
                for model,uc in enumerate(machines):
                    uc.mem_write(SOUND,bytes(raw));uc.mem_write(0x03007ff0,struct.pack('<I',SOUND));uc.mem_write(0x04000006,bytes([vcount]))
                    uc.reg_write(r.UC_ARM_REG_CPSR,0x33|flags<<28)
                    for n in range(13):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),0x12340000+n)
                    uc.reg_write(r.UC_ARM_REG_SP,0x03007000);uc.reg_write(r.UC_ARM_REG_LR,RETURN|1)
                    if model:
                        uc.reg_write(r.UC_ARM_REG_R0,OUTPUT);uc.reg_write(r.UC_ARM_REG_R1,SOUND);uc.reg_write(r.UC_ARM_REG_R2,vcount)
                        uc.emu_start(MODEL|1,RETURN,count=200);assert uc.reg_read(r.UC_ARM_REG_PC)==RETURN
                        assert uc.reg_read(r.UC_ARM_REG_SP)==0x03007000
                        values.append(struct.unpack('<5I',uc.mem_read(OUTPUT,20)))
                        assert bytes(uc.mem_read(SOUND,0x1000))==raw
                    else:
                        uc.emu_start(ORIGINAL|1,MIXER,count=200);assert uc.reg_read(r.UC_ARM_REG_PC)==MIXER
                        sp=uc.reg_read(r.UC_ARM_REG_SP);assert sp==0x03006fc0
                        deadline=struct.unpack('<I',uc.mem_read(sp+20,4))[0]
                        values.append((deadline,uc.reg_read(r.UC_ARM_REG_R7),uc.reg_read(r.UC_ARM_REG_R8),uc.reg_read(r.UC_ARM_REG_R5),uc.reg_read(r.UC_ARM_REG_R6)))
                        expected=raw.copy();struct.pack_into('<I',expected,0,ID+1)
                        assert bytes(uc.mem_read(SOUND,0x1000))==expected
                        assert uc.reg_read(r.UC_ARM_REG_R0)==SOUND and uc.reg_read(r.UC_ARM_REG_R4)==counter
                assert values[0]==values[1],(counter,period,samples,maxlines,vcount,values)
                assert trace==([(0x080e0010,0x12345678)] if optional else [])+[(0x080e0000,SOUND)]
                cases+=1
    report=dict(cases=cases,scope='setup arithmetic only; all byte counters and VCOUNT values, wraparound periods/products, zero deadline, stable callbacks, lock transition, mixer-entry registers and 64-byte frame',matching_full_SoundMain=False)
    (OUT/'report.json').write_text(json.dumps(report,indent=2)+'\n');print(report)
if __name__=='__main__':main()
