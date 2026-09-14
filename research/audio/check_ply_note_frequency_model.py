#!/usr/bin/env python3
"""Validate pitch clamping, frequency-path selection and ordered CGB setup."""
import argparse
import hashlib
import itertools
import json
from pathlib import Path
import random
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB, UC_HOOK_CODE, UC_HOOK_MEM_READ, UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT=Path(__file__).resolve().parents[2]
ENTRY,END,PCM,DATA=0x080cffd8,0x080d000c,0x080d0012,0x02000000
MASK=0xffffffff

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
    uc.mem_map(0x08000000,0x1000000);uc.mem_write(0x08000000,rom);uc.mem_write(ENTRY,binary)
    uc.mem_map(DATA,0x1000)
    state={}
    def code(u,address,size,user):
        if address in (END,PCM):u.emu_stop()
        else:assert ENTRY<=address<END
        assert u.reg_read(r.UC_ARM_REG_SP)==state['sp']
    def memory(u,kind,address,size,value,user):state['trace'].append((kind,address,size,value if kind==17 else None))
    uc.hook_add(UC_HOOK_CODE,code);uc.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,memory)
    rng=random.Random(0xfe8f01);patterns=[rng.randbytes(0x1000) for _ in range(16)]
    sp=DATA+0x800
    def inputs():
        for key,offset in itertools.product(range(256),repeat=2):
            yield DATA+0x100,DATA+0x200,DATA+0x300,key,offset,0,0,(key^offset)&15
        for key,offset,bits,selector in itertools.product((0,1,127,128,255),(0,1,127,128,255),range(256),(1,4,256,MASK)):
            yield DATA+0x100,DATA+0x200,DATA+0x300,key,offset,bits,selector,bits&15
        # Exclude channel=SP-24: that would overwrite the bank pointer's high
        # bytes with arbitrary tone flags and leave the mapped address domain.
        for c,t,w,bits,nz in itertools.product((-32,-28,-20,-16,-12,-8,-4,0,4,8,12,16,20,24,28,32),(0,4,8,16,28,32),(0,4,8,16,28,32),(0,0x70,0x80,0x81,0xff),range(16)):
            yield sp+c,sp+c+t,sp+c+w,255,128,bits,1,nz
    cases=0;outcomes={'pcm':0,'cgb':0};clamped=0
    for channel,track,tone,key,offset,bits,selector,nz in inputs():
        ram=bytearray(patterns[nz])
        def put(addr,value,size):ram[addr-DATA:addr-DATA+size]=value.to_bytes(size,'little')
        put(channel+8,key,1);put(track+8,offset,1);put(tone+3,bits,1)
        put(sp+12,selector,4);put(sp+4,DATA+0x600,4)
        expected=ram.copy();trace=[]
        def read(addr,size):
            trace.append((16,addr,size,None));return int.from_bytes(expected[addr-DATA:addr-DATA+size],'little')
        def write(addr,value,size):
            trace.append((17,addr,size,value));expected[addr-DATA:addr-DATA+size]=(value&((1<<(size*8))-1)).to_bytes(size,'little')
        regs=[rng.getrandbits(32) for _ in range(13)];regs[4],regs[5],regs[9]=channel,track,tone;wanted=regs.copy()
        wanted[1]=read(channel+8,1);off=read(track+8,1);signed=off if off<128 else off-256;wanted[0]=signed&MASK
        pitch=wanted[1]+signed
        if pitch<0:clamped+=1;pitch=0
        wanted[3]=pitch;wanted[6]=read(sp+12,4)
        if not wanted[6]:end,flags,outcome=PCM,6,'pcm'
        else:
            wanted[6]=tone;wanted[0]=read(tone+2,1);write(channel+30,wanted[0],1)
            wanted[1]=read(tone+3,1);wanted[0]=128
            if wanted[0]&wanted[1]:wanted[1]=8
            else:
                wanted[0]=112
                if not wanted[0]&wanted[1]:wanted[1]=8
            write(channel+31,wanted[1],1)
            wanted[2]=read(track+9,1);wanted[1]=pitch
            flags=4 if pitch==0 else 0
            wanted[0]=read(sp+12,4);wanted[3]=read(sp+4,4);wanted[3]=read(wanted[3]+48,4)
            end,outcome=END,'cgb'
        uc.mem_write(DATA,bytes(ram));uc.reg_write(r.UC_ARM_REG_CPSR,0x33|nz<<28)
        for n,v in enumerate(regs):uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),v)
        lr=rng.getrandbits(32);uc.reg_write(r.UC_ARM_REG_SP,sp);uc.reg_write(r.UC_ARM_REG_LR,lr)
        state['trace'],state['sp']=[],sp;uc.emu_start(ENTRY|1,0,count=40)
        context=(cases,channel,track,tone,key,offset,bits,selector,nz)
        assert uc.reg_read(r.UC_ARM_REG_PC)==end,context
        assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28,context
        assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==wanted,context
        assert uc.reg_read(r.UC_ARM_REG_LR)==lr and uc.reg_read(r.UC_ARM_REG_SP)==sp,context
        assert bytes(uc.mem_read(DATA,0x1000))==expected and state['trace']==trace,context
        cases+=1;outcomes[outcome]+=1
    report=dict(cases=cases,outcomes=outcomes,clamped_cases=clamped,exact_instruction_bytes=len(binary),candidate=bool(a.candidate_bin),
        scope='Every key/signed-offset byte pair, all CGB flag bytes with boundary pitch inputs, all NZCV across cases, valid aligned alias layouts, full registers/SP/LR/RAM and ordered accesses.',
        limitations='Stops before either frequency callback; sampled CGB pitch combinations and RAM data, valid mapped bank pointers only. No full ply_note execution.')
    (ROOT/'.deps/soundmain-packed/ply-note/frequency-model.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))

if __name__=='__main__':main()
