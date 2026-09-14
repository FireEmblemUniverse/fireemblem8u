#!/usr/bin/env python3
"""Check channel-list insertion with overlapping channel, track and old-head fields."""
import argparse
import hashlib
import itertools
import json
from pathlib import Path
import random
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB, UC_HOOK_CODE, UC_HOOK_MEM_READ, UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
ENTRY,END,DATA=0x080cff8a,0x080cff9c,0x02000000

def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--candidate-bin',type=Path)
    a=p.parse_args()
    rom=(ROOT/'baserom.gba').read_bytes()
    assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
    original=rom[ENTRY-0x08000000:END-0x08000000]
    binary=a.candidate_bin.read_bytes() if a.candidate_bin else original
    assert binary==original
    uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB)
    uc.mem_map(0x08000000,0x1000000)
    uc.mem_write(0x08000000,rom)
    uc.mem_write(ENTRY,binary)
    uc.mem_map(DATA,0x1000)
    state={}
    def code(u,address,size,user):
        if address==END:
            u.emu_stop()
        else:
            assert ENTRY<=address<END
    def memory(u,kind,address,size,value,user):
        state['trace'].append((kind,address,size,value if kind==17 else None))
    uc.hook_add(UC_HOOK_CODE,code)
    uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,memory)
    rng=random.Random(0xfe8a77)
    addresses=tuple(DATA+0x100+n for n in range(0,68,4))
    cases=0
    empty=0
    for channel,track,head,nz in itertools.product(addresses,addresses,(0,)+addresses,range(16)):
        ram=bytearray([0xa5])*0x1000
        ram[track+32-DATA:track+36-DATA]=head.to_bytes(4,'little')
        expected=ram.copy()
        trace=[]
        def write(addr,value):
            trace.append((17,addr,4,value))
            expected[addr-DATA:addr-DATA+4]=value.to_bytes(4,'little')
        def read(addr):
            trace.append((16,addr,4,None))
            return int.from_bytes(expected[addr-DATA:addr-DATA+4],'little')
        write(channel+48,0)
        previous=read(track+32)
        write(channel+52,previous)
        if previous:
            write(previous+48,channel)
        else:
            empty+=1
        write(track+32,channel)
        write(channel+44,track)
        regs=[rng.getrandbits(32) for _ in range(13)]
        regs[4],regs[5]=channel,track
        wanted=regs.copy()
        wanted[1],wanted[3]=0,previous
        flags=((previous>>31)<<3)|((previous==0)<<2)|2
        uc.mem_write(DATA,bytes(ram))
        uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nz<<28)
        for n,v in enumerate(regs):
            uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),v)
        sp,lr=DATA+0xf00,rng.getrandbits(32)
        uc.reg_write(r.UC_ARM_REG_SP,sp)
        uc.reg_write(r.UC_ARM_REG_LR,lr)
        state['trace']=[]
        uc.emu_start(ENTRY|1,0,count=16)
        context=(channel,track,head,nz)
        assert uc.reg_read(r.UC_ARM_REG_PC)==END,context
        assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28,context
        assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==wanted,context
        assert uc.reg_read(r.UC_ARM_REG_SP)==sp and uc.reg_read(r.UC_ARM_REG_LR)==lr,context
        assert bytes(uc.mem_read(DATA,0x1000))==expected and state['trace']==trace,context
        cases+=1
    report=dict(cases=cases,empty_head_cases=empty,exact_instruction_bytes=len(binary),candidate=bool(a.candidate_bin),
        scope='Every combination of aligned channel/track/head addresses in a 68-byte window plus null head, every NZCV, full registers/SP/LR/RAM and ordered accesses.',
        limitations='Starts after ClearChain returns and stops before LFO initialization; synthetic aligned valid addresses, without unlink callback or full ply_note execution.')
    out=ROOT/'.deps/soundmain-packed/ply-note'
    (out/'channel-link-model.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps(report,indent=2))

if __name__=='__main__':
    main()
