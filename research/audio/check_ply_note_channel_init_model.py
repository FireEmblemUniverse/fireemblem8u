#!/usr/bin/env python3
"""Validate channel initialization, including aliases between frame, track and tone."""
import argparse
import hashlib
import itertools
import json
from pathlib import Path
import random
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB, UC_HOOK_CODE, UC_HOOK_MEM_READ, UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
ENTRY,END,DATA=0x080cffb2,0x080cffd4,0x02000000

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
        assert u.reg_read(r.UC_ARM_REG_SP)==state['sp']
    def memory(u,kind,address,size,value,user):
        state['trace'].append((kind,address,size,value if kind==17 else None))
    uc.hook_add(UC_HOOK_CODE,code)
    uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,memory)
    rng=random.Random(0xfe8c11)
    patterns=[rng.randbytes(0x1000) for _ in range(16)]
    addresses=tuple(DATA+0x100+n for n in range(0,40,4))
    cases=0
    for channel,track,tone,sp,nz in itertools.product(addresses,addresses,addresses,addresses,range(16)):
        ram=patterns[nz]
        expected=bytearray(ram)
        trace=[]
        def read(addr,size):
            trace.append((16,addr,size,None))
            return int.from_bytes(expected[addr-DATA:addr-DATA+size],'little')
        def write(addr,value,size):
            # Unicorn exposes the full source register for narrow stores.
            trace.append((17,addr,size,value))
            value &= (1<<(size*8))-1
            expected[addr-DATA:addr-DATA+size]=value.to_bytes(size,'little')
        regs=[rng.getrandbits(32) for _ in range(13)]
        regs[4],regs[5],regs[9]=channel,track,tone
        wanted=regs.copy()
        wanted[0]=read(track+4,4);write(channel+16,wanted[0],4)
        wanted[0]=read(sp+16,4);write(channel+19,wanted[0],1)
        wanted[0]=read(sp+8,4);write(channel+8,wanted[0],1)
        wanted[0]=read(sp+20,4);write(channel+20,wanted[0],1)
        wanted[6]=tone
        wanted[0]=read(tone,1);write(channel+1,wanted[0],1)
        wanted[7]=read(tone+4,4);write(channel+36,wanted[7],4)
        wanted[0]=read(tone+8,4);write(channel+4,wanted[0],4)
        wanted[0]=read(track+30,2);write(channel+12,wanted[0],2)
        uc.mem_write(DATA,ram)
        uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nz<<28)
        for n,v in enumerate(regs):
            uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),v)
        lr=rng.getrandbits(32)
        uc.reg_write(r.UC_ARM_REG_SP,sp)
        uc.reg_write(r.UC_ARM_REG_LR,lr)
        state['trace'],state['sp']=[],sp
        uc.emu_start(ENTRY|1,0,count=24)
        context=(channel,track,tone,sp,nz)
        assert uc.reg_read(r.UC_ARM_REG_PC)==END,context
        assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|nz<<28,context
        assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==wanted,context
        assert uc.reg_read(r.UC_ARM_REG_SP)==sp and uc.reg_read(r.UC_ARM_REG_LR)==lr,context
        assert bytes(uc.mem_read(DATA,0x1000))==expected and state['trace']==trace,(context,bytes(uc.mem_read(DATA,0x1000))==expected,state['trace'],trace)
        cases+=1
    report=dict(cases=cases,exact_instruction_bytes=len(binary),candidate=bool(a.candidate_bin),
        scope='Every combination of aligned channel/track/tone/frame addresses in a 40-byte window, all NZCV with seeded data, full registers/SP/LR/RAM and ordered accesses.',
        limitations='Starts after TrkVolPitSet returns and stops before ChnVolSetAsm; synthetic aligned valid addresses and sampled data values, without either callback or full ply_note execution.')
    (ROOT/'.deps/soundmain-packed/ply-note/channel-init-model.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps(report,indent=2))

if __name__=='__main__':
    main()
