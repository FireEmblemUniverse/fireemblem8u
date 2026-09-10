#!/usr/bin/env python3
"""Check production loop metadata reads and both private mixer continuations."""
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UC_HOOK_MEM_READ, UC_HOOK_MEM_WRITE, UC_MEM_READ
from unicorn import arm_const as r
ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / '.deps/soundmain-packed'
ENTRY, SP = 0x080cf7bc, 0x03007000


def main():
    p = argparse.ArgumentParser(description=__doc__); p.add_argument('--copied-ram', action='store_true'); a = p.parse_args()
    original = (ROOT/'baserom.gba').read_bytes(); production = (ROOT/'fireemblem8.gba').read_bytes()
    assert hashlib.sha1(original).hexdigest() == 'c25b145e37456171ada4b0d440bf88a19f4d509f'
    nm = subprocess.check_output(['arm-none-eabi-nm', '-S', str(ROOT/'fireemblem8.elf')], text=True)
    fields = next(line.split() for line in nm.splitlines() if line.endswith(' SoundMainRAM_ResampleLoop'))
    assert int(fields[0],16) == ENTRY and int(fields[1],16) == 20, fields
    symbols = {line.split()[-1]: int(line.split()[0],16) for line in nm.splitlines() if len(line.split())>=3}
    assert symbols['SoundMainRAM_ResampleWrap'] == ENTRY+20 and symbols['SoundMainRAM_ResampleStop'] == ENTRY+36
    assert production[0xcf7bc:0xcf7d0] == original[0xcf7bc:0xcf7d0]
    machines = []
    def access(uc, kind, address, size, value, trace):
        if kind == UC_MEM_READ: value = int.from_bytes(uc.mem_read(address,size),'little')
        trace.append((kind,address,size,value))
    for image in (original, production):
        uc = Uc(UC_ARCH_ARM,UC_MODE_ARM); uc.mem_map(0x08000000,0x1000000); uc.mem_write(0x08000000,image)
        uc.mem_map(0x03000000,0x8000)
        if a.copied_ram: uc.mem_write(0x03002c60,image[0xcf54c:0xcf54c+0x400])
        trace = []; uc.hook_add(UC_HOOK_MEM_READ | UC_HOOK_MEM_WRITE,access,trace,begin=SP-16,end=SP+79)
        machines.append((uc,trace))
    delta = 0x03002c60-0x080cf54c if a.copied_ram else 0
    counts = sorted({n*0x01010101 for n in range(256)} | {0,1,2,3,4,255,256,0x7fffffff,0x80000000,0xffffffff})
    pointers = (0,1,0x02000000,0x03007000,0x7fffffff,0x80000000,0xffffffff,0x12345678)
    cases = 0; paths = {'loop':0,'stop':0}
    for count in counts:
        for pointer in pointers:
            for remaining in (0,1,2,255,0x7fffffff,0x80000000,0xffffffff,0x12345678):
                for flags in range(16):
                    raw = bytearray([0xa5])*96; struct.pack_into('<II',raw,36,pointer,count)
                    expected_pc = (ENTRY+20 if count else ENTRY+36)+delta
                    expected_trace = [(UC_MEM_READ,SP+24,4,count)] + ([(UC_MEM_READ,SP+20,4,pointer)] if count else [])
                    snapshots = []
                    for uc,trace in machines:
                        uc.mem_write(SP-16,bytes(raw)); trace.clear()
                        regs = [0x12340000+n for n in range(13)]; regs[3] = (0,0xffffffff,0x02001234)[cases%3]; regs[2] = remaining
                        for n,value in enumerate(regs): uc.reg_write(getattr(r,'UC_ARM_REG_R'+str(n)),value)
                        lr = (0,7,0xdeadbeef)[cases%3]; uc.reg_write(r.UC_ARM_REG_LR,lr); uc.reg_write(r.UC_ARM_REG_SP,SP)
                        uc.reg_write(r.UC_ARM_REG_CPSR,0x13 | flags<<28); uc.emu_start(ENTRY+delta,expected_pc,count=8)
                        regs[0] = count
                        if count: regs[3] = pointer; regs[9] = (-remaining)&0xffffffff
                        observed = tuple(uc.reg_read(getattr(r,'UC_ARM_REG_R'+str(n))) for n in range(13))
                        assert observed == tuple(regs)
                        assert uc.reg_read(r.UC_ARM_REG_PC) == expected_pc
                        assert uc.reg_read(r.UC_ARM_REG_CPSR) == 0x20000013 | (count & 0x80000000) | ((count==0)<<30)
                        assert uc.reg_read(r.UC_ARM_REG_SP) == SP and uc.reg_read(r.UC_ARM_REG_LR) == lr
                        assert bytes(uc.mem_read(SP-16,len(raw))) == raw
                        assert trace == expected_trace
                        snapshots.append((observed,trace.copy()))
                    assert snapshots[0] == snapshots[1]
                    paths['loop' if count else 'stop'] += 1; cases += 1
    report = dict(cases=cases,count_values=len(counts),paths=paths,matching_C_bytes=20,copied_RAM=a.copied_ram,
                  scope='production resampling loop metadata; eight remaining-count values crossed; all selected byte-pattern/count boundaries and pointer values crossed with sixteen input flags; conditional ordered frame reads, preserved SP/LR/frame/canaries, expected r0-r12/CPSR and both exit PCs')
    (OUT/('resample-loop-production-ram.json' if a.copied_ram else 'resample-loop-production.json')).write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps(report,indent=2))


if __name__=='__main__': main()
