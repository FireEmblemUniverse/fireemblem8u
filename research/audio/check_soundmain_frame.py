#!/usr/bin/env python3
"""Verify the original SoundMain frame through copied RAM mixer execution."""
import json
from pathlib import Path
import struct
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_CODE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
ENTRY,SOURCE,MIXER,SOUND,RETURN,SP=0x080cf4c8,0x080cf54c,0x03002c60,0x02000000,0x080f0000,0x03007000
ID=0x68736d53

def main():
    rom=(ROOT/'baserom.gba').read_bytes();uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB)
    for base,size in ((0x02000000,0x4000),(0x03000000,0x8000),(0x04000000,0x1000),(0x08000000,0x1000000)):uc.mem_map(base,size)
    uc.mem_write(0x08000000,rom)
    uc.mem_write(MIXER,rom[SOURCE-0x08000000:SOURCE-0x08000000+0x400])
    uc.mem_write(0x080e0000,bytes.fromhex('7047'))
    state={}
    def mixer_entry(uc,address,size,state):
        if address!=MIXER:return
        frame=struct.unpack('<16I',uc.mem_read(SP-64,64))
        assert uc.reg_read(r.UC_ARM_REG_SP)==SP-64
        expected=[0xa5a5a5a5]*16
        expected[2]=state['buffer'];expected[5]=state['deadline'];expected[6]=SOUND
        expected[7:11]=state['registers'][8:12];expected[11:15]=state['registers'][4:8];expected[15]=state['lr']
        assert frame==tuple(expected),(frame,expected)
        state['entries']+=1
    uc.hook_add(UC_HOOK_CODE,mixer_entry,state,begin=MIXER,end=MIXER)
    cases=0
    for samples in (16,20,24,28,32,528):
        for counter in (0,1,2,3):
            for channels in (1,4,12):
                for maxlines in (0,1,255):
                    for vcount in (0,159,160,227):
                        for seed in range(4):
                            for thumb in (False,True):
                                raw=bytearray(0x2000);struct.pack_into('<I',raw,0,ID);raw[4]=counter;raw[6]=channels;raw[11]=3;raw[12]=maxlines
                                struct.pack_into('<I',raw,16,samples);struct.pack_into('<I',raw,24,0x11223344);struct.pack_into('<I',raw,40,0x080e0001)
                                raw[0x350:0xfb0]=bytes([0x5a])*0xc60
                                uc.mem_write(SOUND,bytes(raw));uc.mem_write(SP-0x100,bytes([0xa5])*0x110)
                                uc.mem_write(0x03007ff0,struct.pack('<I',SOUND));uc.mem_write(0x04000006,bytes([vcount]))
                                regs=[(0x12340000+n)^(seed*0x11111111) for n in range(13)]
                                deadline=maxlines+(vcount+228 if vcount<160 else vcount) if maxlines else 0
                                buffer=SOUND+0x350+(samples*(3-(counter-1)) if counter>1 else 0)
                                state.update(registers=regs,lr=RETURN|thumb,deadline=deadline,buffer=buffer,entries=0)
                                uc.reg_write(r.UC_ARM_REG_CPSR,0x33|(seed*5)<<28)
                                for n,value in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),value)
                                uc.reg_write(r.UC_ARM_REG_SP,SP);uc.reg_write(r.UC_ARM_REG_LR,RETURN|thumb)
                                uc.emu_start(ENTRY|1,RETURN,count=10000)
                                assert state['entries']==1
                                assert uc.reg_read(r.UC_ARM_REG_PC)==RETURN and uc.reg_read(r.UC_ARM_REG_SP)==SP
                                assert bool(uc.reg_read(r.UC_ARM_REG_CPSR)&32)==thumb
                                after=[uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]
                                assert after[:4]==regs[8:11]+[RETURN|thumb]
                                assert after[4:12]==regs[4:12]
                                expected=raw.copy()
                                offset=buffer-SOUND
                                expected[offset:offset+samples]=bytes(samples)
                                expected[offset+1584:offset+1584+samples]=bytes(samples)
                                assert bytes(uc.mem_read(SOUND,len(raw)))==expected
                                assert bytes(uc.mem_read(SP,16))==bytes([0xa5])*16
                                assert bytes(uc.mem_read(SP-68,4))==bytes([0xa5])*4
                                cases+=1
    report=dict(cases=cases,frame_bytes=64,scope='original full entry and copied RAM mixer, no reverb and inactive channels, exact saved frame, stereo clearing, lock release, r4-r11 restoration and ARM/Thumb return',C_replacement=False)
    out=ROOT/'.deps/soundmain-setup/frame-report.json';out.write_text(json.dumps(report,indent=2)+'\n');print(report)
if __name__=='__main__':main()
