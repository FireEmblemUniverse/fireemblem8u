#!/usr/bin/env python3
"""Validate guarded ARM word-store writeback against the unmodified compiler."""
import argparse
from pathlib import Path
import random
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UC_HOOK_MEM_WRITE
from unicorn import arm_const as r
ROOT = Path(__file__).resolve().parents[2]


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--compiler', required=True); p.add_argument('--plugin', type=Path, required=True); a = p.parse_args()
    out = ROOT / '.deps/soundmain-packed/word-store-guards'; out.mkdir(exist_ok=True)
    attr = '__attribute__((matching_word_postincrement)) '
    source = 'register unsigned value asm("r0"); register volatile unsigned * volatile dest asm("r5");\n' + attr + 'void fixture(void) { *dest = value; dest++; }\n'
    def compile_case(name, text, mode='-marm', plugin=True):
        src = out / (name + '.c'); src.write_text(text); obj = src.with_suffix('.o')
        result = subprocess.run([a.compiler, '-c', '-O1', mode, '-mcpu=arm7tdmi', '-mabi=apcs-gnu',
                                 *(['-fplugin=' + str(a.plugin.resolve())] if plugin else []), str(src), '-o', str(obj)], capture_output=True, text=True)
        return result, obj
    codes = []
    for name, text, plugin in (('folded', source, True), ('baseline', source.replace(attr, ''), False)):
        result, obj = compile_case(name, text, plugin=plugin); assert not result.returncode, result.stderr
        binary = obj.with_suffix('.bin'); subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '--only-section=.text', str(obj), str(binary)], check=True)
        codes.append(binary.read_bytes())
    assert codes[0] == bytes.fromhex('040085e41eff2fe1'), codes[0].hex()
    assert len(codes[1]) == 12, codes[1].hex()
    machines = []
    for code in codes:
        uc = Uc(UC_ARCH_ARM, UC_MODE_ARM); uc.mem_map(0x08000000, 0x1000); uc.mem_write(0x08000000, code)
        uc.mem_map(0x02000000, 0x1000); trace = []
        uc.hook_add(UC_HOOK_MEM_WRITE, lambda uc, kind, address, size, value, log: log.append((address, size, value)), trace)
        machines.append((uc, trace))
    rng = random.Random(0x574f5244)
    values = [n * 0x01010101 for n in range(256)] + [0x7fffffff, 0x80000000] + [rng.getrandbits(32) for _ in range(128)]
    cases = 0
    for value in values:
        for offset in (0, 124, 4092):
            for flags in range(16):
                for thumb in (False, True):
                    initial = [0x12340000 + n for n in range(13)]; initial[0] = value; initial[5] = 0x02000000 + offset
                    expected = initial.copy(); expected[5] += 4
                    raw = bytes([0xa5]) * 0x1000; changed = bytearray(raw); struct.pack_into('<I', changed, offset, value)
                    snapshots = []
                    for uc, trace in machines:
                        trace.clear(); uc.mem_write(0x02000000, raw)
                        uc.reg_write(r.UC_ARM_REG_CPSR, 0x13 | flags << 28)
                        for n, x in enumerate(initial): uc.reg_write(getattr(r, 'UC_ARM_REG_R'+str(n)), x)
                        uc.reg_write(r.UC_ARM_REG_SP, 0x02000800); uc.reg_write(r.UC_ARM_REG_LR, 0x08000100 | thumb)
                        uc.emu_start(0x08000000, 0x08000100, count=10)
                        observed = [uc.reg_read(getattr(r, 'UC_ARM_REG_R'+str(n))) for n in range(13)]
                        assert observed == expected
                        assert uc.reg_read(r.UC_ARM_REG_CPSR) & 0xf000003f == (0x13 | flags << 28 | thumb << 5)
                        assert uc.reg_read(r.UC_ARM_REG_SP) == 0x02000800
                        assert uc.reg_read(r.UC_ARM_REG_LR) == 0x08000100 | thumb
                        assert uc.reg_read(r.UC_ARM_REG_PC) == 0x08000100
                        assert bytes(uc.mem_read(0x02000000, 0x1000)) == changed
                        assert trace == [(initial[5], 4, value)]
                        snapshots.append((observed, trace.copy()))
                    assert snapshots[0] == snapshots[1]; cases += 1
    rejects = [('thumb', source, '-mthumb'),
               ('byte', source.replace('volatile unsigned *', 'volatile unsigned char *'), '-marm'),
               ('step_eight', source.replace('dest++;', 'dest += 2;'), '-marm'),
               ('decrement', source.replace('dest++;', 'dest--;'), '-marm'),
               ('missing', source.replace('dest++;', ''), '-marm'),
               ('barrier', source.replace('dest++;', 'asm volatile("" ::: "memory"); dest++;'), '-marm'),
               ('same_register', source.replace('*dest = value;', '*dest = (unsigned)dest;'), '-marm'),
               ('offset_store', source.replace('*dest = value;', 'dest[1] = value;'), '-marm'),
               ('load', source.replace('*dest = value;', 'value = *dest;'), '-marm')]
    for name, text, mode in rejects:
        result, _ = compile_case(name, text, mode); assert result.returncode and 'word postincrement' in result.stderr, (name, result.stderr)
    plain = source.replace(attr, ''); result, obj = compile_case('plain', plain, plugin=False)
    assert not result.returncode, result.stderr
    before = obj.read_bytes(); result, obj = compile_case('plain', plain)
    assert not result.returncode and before == obj.read_bytes(), result.stderr
    print(f'{cases} word-store execution comparisons pass; {len(rejects)} rejected patterns; unannotated object unchanged.')


if __name__ == '__main__': main()
