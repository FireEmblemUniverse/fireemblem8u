#!/usr/bin/env python3
"""Validate the PCM loop backedge across full-width arithmetic boundaries."""
import argparse
import hashlib
import itertools
import json
from pathlib import Path
import random
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB, UC_HOOK_CODE, UC_HOOK_MEM_READ, UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT = Path(__file__).resolve().parents[2]
ENTRY, LOOP, ATTACH, EXIT = 0x080cff78, 0x080cff3e, 0x080cff84, 0x080d002a
MASK = 0xffffffff

def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--candidate-bin', type=Path)
    a = p.parse_args()
    rom = (ROOT/'baserom.gba').read_bytes()
    assert hashlib.sha1(rom).hexdigest() == 'c25b145e37456171ada4b0d440bf88a19f4d509f'
    original = rom[ENTRY-0x08000000:ATTACH-0x08000000]
    code = a.candidate_bin.read_bytes() if a.candidate_bin else original
    assert code == original
    uc = Uc(UC_ARCH_ARM, UC_MODE_THUMB)
    uc.mem_map(0x08000000, 0x1000000)
    uc.mem_write(0x08000000, rom)
    uc.mem_write(ENTRY, code)
    def hook(u, address, size, user):
        if address in (LOOP, ATTACH, EXIT):
            u.emu_stop()
        else:
            assert ENTRY <= address < ATTACH
    def memory(*args):
        raise AssertionError('Advancement must not read or write data memory')
    uc.hook_add(UC_HOOK_CODE, hook)
    uc.hook_add(UC_HOOK_MEM_READ | UC_HOOK_MEM_WRITE, memory)
    rng = random.Random(0xfe8ad)
    values = (0,1,2,3,127,255,256,0x7ffffffe,0x7fffffff,0x80000000,0x80000001,0xfffffffe,MASK)
    pointers = (0,1,0x02000000,0x7fffffc0,0x7fffffff,0x80000000,0xffffffbf,0xffffffc0,MASK)
    cases = 0
    outcomes = {'loop':0, 'attach':0, 'exit':0}
    for count, current, selected, nzcv in itertools.product(values, pointers, pointers, range(16)):
        regs = [rng.getrandbits(32) for _ in range(13)]
        regs[3], regs[4], regs[8] = count, current, selected
        wanted = regs.copy()
        wanted[3], wanted[4] = (count-1)&MASK, (current+64)&MASK
        result = wanted[3]
        flags = ((result>>31)<<3) | ((result==0)<<2) | ((count>=1)<<1) | bool(((count^1)&(count^result))&0x80000000)
        if 1 < count < 0x80000000:
            end, outcome = LOOP, 'loop'
        else:
            wanted[4] = selected
            flags = ((selected>>31)<<3) | ((selected==0)<<2) | 2
            end, outcome = (ATTACH,'attach') if selected else (EXIT,'exit')
        uc.reg_write(r.UC_ARM_REG_CPSR, 0x33 | nzcv<<28)
        for n,v in enumerate(regs):
            uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),v)
        sp, lr = 0x0200f000, rng.getrandbits(32)
        uc.reg_write(r.UC_ARM_REG_SP,sp)
        uc.reg_write(r.UC_ARM_REG_LR,lr)
        uc.emu_start(ENTRY|1,0,count=16)
        context = (count,current,selected,nzcv)
        assert uc.reg_read(r.UC_ARM_REG_PC)==end,context
        assert uc.reg_read(r.UC_ARM_REG_CPSR)==0x33|flags<<28,context
        assert [uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13)]==wanted,context
        assert uc.reg_read(r.UC_ARM_REG_SP)==sp and uc.reg_read(r.UC_ARM_REG_LR)==lr,context
        cases += 1
        outcomes[outcome] += 1
    report = dict(cases=cases,outcomes=outcomes,exact_instruction_bytes=len(code),candidate=bool(a.candidate_bin),
                  scope='Full-width count and pointer boundaries, every NZCV, all registers/SP/LR and no data accesses. Stops at loop/attach/shared exit.')
    out = ROOT/'.deps/soundmain-packed/ply-note'
    (out/'pcm-advance-model.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps(report,indent=2))

if __name__=='__main__':
    main()
