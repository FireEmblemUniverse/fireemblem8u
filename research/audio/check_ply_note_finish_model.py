#!/usr/bin/env python3
"""Validate ordered note-completion writes and preserved carry/overflow flags."""
import argparse
import hashlib
import itertools
import json
from pathlib import Path
import random
from unicorn import Uc,UC_ARCH_ARM,UC_MODE_THUMB,UC_HOOK_CODE,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
ENTRY,END,DATA=0x080d001c,0x080d002a,0x02000000

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--candidate-bin',type=Path);a=p.parse_args()
    rom=(ROOT/'baserom.gba').read_bytes();assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
    original=rom[ENTRY-0x08000000:END-0x08000000]
    binary=a.candidate_bin.read_bytes() if a.candidate_bin else original;assert binary==original
    uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB);uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_write(ENTRY,binary);uc.mem_map(DATA,0x1000)
    state={}
    def code(u,address,size,user):
        if address==END:u.emu_stop()
        else:assert ENTRY<=address<END
    def memory(u,kind,address,size,value,user):state['trace'].append((kind,address,size,value if kind==17 else None))
    uc.hook_add(UC_HOOK_CODE,code);uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,memory)
    rng=random.Random(0xfe8f17);channel=DATA+0x100;cases=0
    values=(0,0x80,0xf0,0x100,0x12345678,0x80000000,0xffffffff)
    for offset,status,frequency,nz in itertools.product((0,1,16,31,32,33,34,35,36,128),range(256),values,range(16)):
        track=channel+offset;ram=bytearray([0xa5])*0x1000;ram[track-DATA]=status;expected=ram.copy();trace=[]
        def write(addr,value,size):trace.append((17,addr,size,value));expected[addr-DATA:addr-DATA+size]=value.to_bytes(size,'little')
        write(channel+32,frequency,4);write(channel,128,1)
        trace.append((16,track,1,None));loaded=expected[track-DATA];masked=loaded&240;write(track,masked,1)
        regs=[rng.getrandbits(32) for _ in range(13)];regs[0],regs[4],regs[5]=frequency,channel,track;wanted=regs.copy();wanted[0],wanted[1]=masked,loaded
        flags=(nz&3)|((masked==0)<<2)
        uc.mem_write(DATA,bytes(ram));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nz<<28)
        for n,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),v)
        sp,lr=DATA+0xf00,rng.getrandbits(32);uc.reg_write(r.UC_ARM_REG_SP,sp);uc.reg_write(r.UC_ARM_REG_LR,lr)
        state['trace']=[];uc.emu_start(ENTRY|1,0,count=12);context=(offset,status,frequency,nz)
        assert uc.reg_read(r.UC_ARM_REG_PC)==END,context
        assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28,context
        assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==wanted,context
        assert uc.reg_read(r.UC_ARM_REG_SP)==sp and uc.reg_read(r.UC_ARM_REG_LR)==lr,context
        assert bytes(uc.mem_read(DATA,0x1000))==expected and state['trace']==trace,context
        cases+=1
    report=dict(cases=cases,exact_instruction_bytes=len(binary),candidate=bool(a.candidate_bin),
        scope='All status bytes and NZCV, seven full-width frequency values, channel/status/frequency-byte aliases, all registers/SP/LR, full RAM and ordered accesses.',
        limitations='Synthetic mapped byte-access aliases and sampled frequency values; starts after frequency calculation and stops at the shared return entry.')
    (ROOT/'.deps/soundmain-packed/ply-note/finish-model.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))

if __name__=='__main__':main()
