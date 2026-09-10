#!/usr/bin/env python3
"""Check exact ADDS flags and carry, and opt-in boundaries."""
import argparse
import itertools
from pathlib import Path
import random
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM
from unicorn import arm_const as r
ROOT = Path(__file__).resolve().parents[2]


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--compiler', required=True); p.add_argument('--plugin', type=Path, required=True)
    a = p.parse_args(); out = ROOT / '.deps/soundmain-packed/add-carry-guards'; out.mkdir(exist_ok=True)
    attr = '__attribute__((matching_add_carry)) '
    template = 'register unsigned counter asm("r4"); register unsigned value asm("r0");\n' + attr + 'void fixture(void) { unsigned next; int carry; do { asm("" : "+r"(value)); carry=__builtin_add_overflow(counter, AMOUNTu, &next); counter=next; } while (!carry); }\n'
    def compile_case(name, source, mode='-marm', plugin=True):
        src = out / (name + '.c'); src.write_text(source); obj = out / (name + '.o')
        result = subprocess.run([a.compiler, '-c', '-O1', mode, '-mcpu=arm7tdmi', '-mabi=apcs-gnu',
                                 *(['-fplugin=' + str(a.plugin.resolve())] if plugin else []),
                                 str(src), '-o', str(obj)], capture_output=True, text=True)
        return result, obj
    rng = random.Random(0xfe8)
    values = list(range(256)) + [0x7ffffffe, 0x7fffffff, 0x80000000, 0x80000001, 0xfffffffe, 0xffffffff]
    values += [rng.getrandbits(32) for _ in range(256)]
    cases = 0
    for amount, reverse in itertools.product((1, 127, 255, 0x01000000, 0x10000000, 0x40000000, 0x7f000000), (False, True)):
        fixture = template.replace('AMOUNT', str(amount))
        if reverse: fixture = fixture.replace('!carry', 'carry')
        result, obj = compile_case('amount' + str(amount) + ('_carry' if reverse else '_no_carry'), fixture)
        assert not result.returncode, result.stderr
        binary = obj.with_suffix('.bin')
        subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '--only-section=.text', str(obj), str(binary)], check=True)
        code = binary.read_bytes()
        encoded = next((rotation << 8) | imm for rotation in range(16) for imm in range(256)
                       if ((imm >> (rotation * 2)) | (imm << ((32 - rotation * 2) % 32))) & 0xffffffff == amount)
        assert code == struct.pack('<III', 0xe2944000 | encoded, (0x2afffffd if reverse else 0x3afffffd), 0xe12fff1e), code.hex()
        uc = Uc(UC_ARCH_ARM, UC_MODE_ARM); uc.mem_map(0x08000000, 0x1000); uc.mem_write(0x08000000, code)
        for value in values:
            for flags in range(16):
                initial = [0x12340000 + n for n in range(13)]; initial[4] = value
                for n, x in enumerate(initial): uc.reg_write(getattr(r, 'UC_ARM_REG_R' + str(n)), x)
                uc.reg_write(r.UC_ARM_REG_CPSR, 0x13 | flags << 28)
                uc.reg_write(r.UC_ARM_REG_SP, 0x02000800); uc.reg_write(r.UC_ARM_REG_LR, 0x08000100)
                uc.emu_start(0x08000000, 0x08000004, count=1)
                answer = (value + amount) & 0xffffffff
                initial[4] = answer
                assert [uc.reg_read(getattr(r, 'UC_ARM_REG_R' + str(n))) for n in range(13)] == initial
                overflow = bool(~(value ^ amount) & (value ^ answer) & 0x80000000)
                expected_flags = ((answer >> 31) << 3 | (answer == 0) << 2 | (value + amount > 0xffffffff) << 1 | overflow) << 28
                assert uc.reg_read(r.UC_ARM_REG_CPSR) & 0xf0000000 == expected_flags
                assert uc.reg_read(r.UC_ARM_REG_SP) == 0x02000800
                assert uc.reg_read(r.UC_ARM_REG_LR) == 0x08000100
                # Check the exact unsigned carry decision for one branch.
                uc.emu_start(0x08000004, 0x08000ffc, count=1)
                assert uc.reg_read(r.UC_ARM_REG_PC) == (0x08000000 if ((value + amount > 0xffffffff) == reverse) else 0x08000008)
                cases += 1
    source = template.replace('AMOUNT', str(0x40000000))
    rejected = [('thumb', source, '-mthumb'),
                ('barrier', source.replace('counter=next;', 'counter=next; asm volatile("" ::: "memory");'), '-marm'),
                ('signed', source.replace('register unsigned counter', 'register int counter').replace('unsigned next', 'int next').replace('1073741824u', '1073741824'), '-marm'),
                ('no_arithmetic', source.replace('carry=__builtin_add_overflow(counter, 1073741824u, &next); counter=next;', 'carry=1;'), '-marm')]
    for name, text, mode in rejected:
        result, _ = compile_case(name, text, mode)
        assert result.returncode and 'add carry' in result.stderr, (name, result.stderr)
    plain = source.replace(attr, '')
    result, obj = compile_case('plain', plain, plugin=False); assert not result.returncode, result.stderr
    before = obj.read_bytes(); result, obj = compile_case('plain', plain)
    assert not result.returncode and obj.read_bytes() == before, result.stderr
    print(f'{cases} addition/branch executions pass; {len(rejected)} rejected cases; unannotated object unchanged.')


if __name__ == '__main__': main()
