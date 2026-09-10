#!/usr/bin/env python3
"""Verify SoundMain setup ordering across callbacks that mutate shared state."""
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
    subprocess.run([a.compiler,'-S','-std=gnu89','-O1','-mthumb','-mcpu=arm7tdmi','-mabi=apcs-gnu','-ffreestanding','-I'+str(ROOT/'tools/agbcc/include'),'-iquote',str(ROOT/'include'),str(ROOT/'research/audio/soundmain_setup.c'),'-o',str(OUT/'callbacks.s')],check=True)
    subprocess.run(['arm-none-eabi-as','-mcpu=arm7tdmi',str(OUT/'callbacks.s'),'-o',str(OUT/'callbacks.o')],check=True)
    subprocess.run(['arm-none-eabi-ld','-Ttext='+hex(MODEL),str(OUT/'callbacks.o'),'-L'+str(ROOT/'tools/agbcc/lib'),'-lgcc','-o',str(OUT/'callbacks.elf')],check=True,capture_output=True)
    subprocess.run(['arm-none-eabi-objcopy','-O','binary','--only-section=.text',str(OUT/'callbacks.elf'),str(OUT/'callbacks.bin')],check=True)
    nm=subprocess.check_output(['arm-none-eabi-nm',str(OUT/'callbacks.elf')],text=True)
    entry=int(next(line.split()[0] for line in nm.splitlines() if line.endswith(' SoundMainEntryModel')),16)
    rom=(ROOT/'baserom.gba').read_bytes();machines=[]
    for model in (False,True):
        uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB)
        for address,size in ((0x02000000,0x4000),(0x03000000,0x8000),(0x04000000,0x1000),(0x08000000,0x1000000)):uc.mem_map(address,size)
        uc.mem_write(0x08000000,rom)
        for address in (0x080e0000,0x080e0010,0x080e0020):uc.mem_write(address,bytes.fromhex('7047'))
        if model:uc.mem_write(MODEL,(OUT/'callbacks.bin').read_bytes())
        state={'trace':[],'policy':0}
        def callback(uc,address,size,state):
            if address not in (0x080e0000,0x080e0010,0x080e0020):return
            ident=struct.unpack('<I',uc.mem_read(SOUND,4))[0]
            state['trace'].append((address,uc.reg_read(r.UC_ARM_REG_R0),ident))
            mutate=(address==0x080e0010 and state['policy']&1) or (address!=0x080e0010 and state['policy']&2)
            if mutate:
                uc.mem_write(SOUND+4,bytes([255 if address==0x080e0010 else 2]))
                uc.mem_write(SOUND+11,bytes([1,255]))
                uc.mem_write(SOUND+16,struct.pack('<I',0xffffffff if address==0x080e0010 else 1584))
                uc.mem_write(0x03007ff0,struct.pack('<I',SOUND+0x1000))
                if address==0x080e0010:uc.mem_write(SOUND+40,struct.pack('<I',0x080e0021))
                else:uc.mem_write(SOUND,struct.pack('<I',0x87654321))
        uc.hook_add(UC_HOOK_CODE,callback,state,begin=0x080e0000,end=0x080e0020)
        machines.append((uc,state))
    valid=invalid=0
    for ident in (ID,ID+1,0,0xffffffff):
        for counter in (0,1,2,3,255):
            for maxlines in (0,1,255):
                for vcount in (0,159,160,227,255):
                    for policy in range(4):
                        for optional in (False,True):
                            raw=bytearray(0x2000);struct.pack_into('<I',raw,0,ident);raw[4]=counter;raw[11]=3;raw[12]=maxlines
                            struct.pack_into('<I',raw,16,528);struct.pack_into('<III',raw,32,0x080e0011 if optional else 0,0x12345678,0x080e0001)
                            results=[]
                            for model,(uc,state) in enumerate(machines):
                                state['trace'].clear();state['policy']=policy
                                uc.mem_write(SOUND,bytes(raw));uc.mem_write(OUTPUT,bytes([0xa5])*20);uc.mem_write(0x03007ff0,struct.pack('<I',SOUND));uc.mem_write(0x04000006,bytes([vcount]))
                                uc.reg_write(r.UC_ARM_REG_CPSR,0xf0000033)
                                for n in range(13):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),0x12340000+n)
                                uc.reg_write(r.UC_ARM_REG_SP,0x03007000);uc.reg_write(r.UC_ARM_REG_LR,RETURN|1)
                                if model:
                                    uc.reg_write(r.UC_ARM_REG_R0,OUTPUT);uc.reg_write(r.UC_ARM_REG_R1,SOUND);uc.reg_write(r.UC_ARM_REG_R2,vcount)
                                uc.emu_start((entry if model else ORIGINAL)|1,RETURN if model or ident!=ID else MIXER,count=400)
                                if model:
                                    assert uc.reg_read(r.UC_ARM_REG_PC)==RETURN and uc.reg_read(r.UC_ARM_REG_SP)==0x03007000
                                    assert uc.reg_read(r.UC_ARM_REG_R0)==(ident==ID)
                                    values=tuple(struct.unpack('<5I',uc.mem_read(OUTPUT,20))) if ident==ID else None
                                    if ident!=ID:assert bytes(uc.mem_read(OUTPUT,20))==bytes([0xa5])*20
                                elif ident==ID:
                                    assert uc.reg_read(r.UC_ARM_REG_PC)==MIXER and uc.reg_read(r.UC_ARM_REG_SP)==0x03006fc0
                                    values=(struct.unpack('<I',uc.mem_read(0x03006fd4,4))[0],uc.reg_read(r.UC_ARM_REG_R7),uc.reg_read(r.UC_ARM_REG_R8),uc.reg_read(r.UC_ARM_REG_R5),uc.reg_read(r.UC_ARM_REG_R6))
                                    assert uc.reg_read(r.UC_ARM_REG_R0)==SOUND
                                else:
                                    assert uc.reg_read(r.UC_ARM_REG_PC)==RETURN and uc.reg_read(r.UC_ARM_REG_SP)==0x03007000;values=None
                                if ident!=ID:assert not state['trace'] and bytes(uc.mem_read(SOUND,0x2000))==raw
                                elif optional:assert state['trace'][0]==(0x080e0010,0x12345678,ID+1)
                                results.append((values,bytes(uc.mem_read(SOUND,0x2000)),list(state['trace']),bytes(uc.mem_read(0x03007ff0,4))))
                            assert results[0]==results[1],(ident,counter,maxlines,vcount,policy,optional,results[0][0],results[1][0])
                            if ident==ID:valid+=1
                            else:invalid+=1
    report=dict(valid_cases=valid,rejected_entry_cases=invalid,scope='callback mutations, replacement Cgb callback, changed global pointer, pre-callback deadline/post-callback buffer, lock and memory effects; semantic model, not frame/flags matching')
    (OUT/'callback-report.json').write_text(json.dumps(report,indent=2)+'\n');print(report)
if __name__=='__main__':main()
