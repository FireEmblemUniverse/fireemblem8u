#!/usr/bin/env python3
"""Model ply_note command decoding, ordered aliases, and full register/flag effects."""
import argparse
import itertools
import json
import hashlib
import random
from pathlib import Path
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB, UC_HOOK_CODE, UC_HOOK_MEM_READ, UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
ENTRY,END,DATA=0x080cfe64,0x080cfe8a,0x02000000


def flags_sub(a,b):
    v=(a-b)&0xffffffff
    return (v>>31)<<3 | (v==0)<<2 | (a>=b)<<1 | bool((a^b)&(a^v)&0x80000000)


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--candidate-bin',type=Path)
    a=p.parse_args()
    rom=(ROOT/'baserom.gba').read_bytes()
    assert hashlib.sha1(rom).hexdigest()=='c25b145e37456171ada4b0d440bf88a19f4d509f'
    original=rom[ENTRY-0x08000000:END-0x08000000]
    code=a.candidate_bin.read_bytes() if a.candidate_bin else original
    assert len(code)==38
    uc=Uc(UC_ARCH_ARM,UC_MODE_THUMB)
    uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_write(ENTRY,code)
    uc.mem_map(DATA,0x2000)
    state={}
    def on_code(u,address,size,user):
        if address==END:u.emu_stop();return
        assert ENTRY<=address<END
        assert u.reg_read(r.UC_ARM_REG_SP)==DATA+0x1800
    def on_memory(u,kind,address,size,value,user):
        state['accesses'].append((kind,address,size,(value & ((1 << (size*8))-1)) if kind==17 else None))
    uc.hook_add(UC_HOOK_CODE,on_code)
    uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,on_memory)
    triples=set(itertools.product((0,1,127,128,255),repeat=3))
    for n in range(256):triples.update(((n,127,128),(1,n,128),(1,2,n)))
    rng=random.Random(0xfe81dec);cases=0;paths=[0]*4
    track=DATA+0x100
    for values,gate,nz,stream in itertools.product(sorted(triples),(0,1,128,255),range(16),
                                                   (DATA+0x800,track+3,track+4,track+5,track+6,track+64)):
        memory=bytearray([0xa5])*0x2000
        memory[track+4-DATA]=gate
        memory[stream-DATA:stream-DATA+3]=bytes(values)
        memory[track+64-DATA:track+68-DATA]=stream.to_bytes(4,'little')
        expected=memory.copy();accesses=[]
        def read(address,size):
            accesses.append((16,address,size,None))
            return int.from_bytes(expected[address-DATA:address-DATA+size],'little')
        def write(address,value,size):
            value&=(1<<(size*8))-1
            accesses.append((17,address,size,value))
            expected[address-DATA:address-DATA+size]=value.to_bytes(size,'little')
        regs=[rng.getrandbits(32) for _ in range(13)];regs[5]=track;wanted=regs.copy()
        wanted[3]=read(track+64,4);wanted[0]=read(wanted[3],1)
        flags=flags_sub(wanted[0],128);consumed=0
        if wanted[0]<128:
            write(track+5,wanted[0],1);wanted[3]+=1;consumed=1
            wanted[0]=read(wanted[3],1);flags=flags_sub(wanted[0],128)
            if wanted[0]<128:
                write(track+6,wanted[0],1);wanted[3]+=1;consumed=2
                wanted[0]=read(wanted[3],1);flags=flags_sub(wanted[0],128)
                if wanted[0]<128:
                    wanted[1]=read(track+4,1)+wanted[0]
                    write(track+4,wanted[1],1);wanted[3]+=1;consumed=3
                    # These mapped EWRAM pointers cannot wrap or set N/Z/C/V on increment.
                    flags=0
            write(track+64,wanted[3],4)
        uc.mem_write(DATA,bytes(memory));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nz<<28)
        for n,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),v)
        uc.reg_write(r.UC_ARM_REG_SP,DATA+0x1800);uc.reg_write(r.UC_ARM_REG_LR,0x08000101)
        state['accesses']=[];uc.emu_start(ENTRY|1,0,count=30)
        context=(values,gate,nz,hex(stream),consumed)
        assert uc.reg_read(r.UC_ARM_REG_PC)==END,context
        assert uc.reg_read(r.UC_ARM_REG_SP)==DATA+0x1800,context
        assert uc.reg_read(r.UC_ARM_REG_LR)==0x08000101,context
        assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==wanted,context
        assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28,context
        assert bytes(uc.mem_read(DATA,0x2000))==expected,context
        assert state['accesses']==accesses,(context,state['accesses'],accesses)
        cases+=1;paths[consumed]+=1
    report=dict(cases=cases,paths_by_consumed_bytes=paths,instruction_bytes=38,
                candidate=str(a.candidate_bin) if a.candidate_bin else None,exact_bytes=code==original,
                scope='Every byte value in each optional argument position, boundary triples, four gate seeds, '
                      'all NZCV inputs and six stream placements including aliases of gate/key/velocity/cmdPtr. '
                      'Full registers/CPSR/SP/LR/RAM and ordered reads/writes.',
                limitations='Stops at tone selection; uses mapped EWRAM pointers, not pointer wrap or invalid memory. '
                            'Overlapping initialization uses the actual resulting memory, not nominal seed values.')
    out=ROOT/'.deps/soundmain-packed/ply-note';out.mkdir(parents=True,exist_ok=True)
    (out/('command-candidate-model.json' if a.candidate_bin else 'command-original-model.json')).write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps(report,indent=2))


if __name__=='__main__':main()
