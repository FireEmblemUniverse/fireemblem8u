#!/usr/bin/env python3
"""Check exact SUBS flags, including signed overflow, and opt-in boundaries."""
import argparse
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
    a = p.parse_args(); out = ROOT / '.deps/soundmain-reverb/subtract-guards'; out.mkdir(exist_ok=True)
    attr = '__attribute__((matching_subtract_compare)) '
    template = 'register unsigned counter asm("r4"); register unsigned value asm("r0");\n' + attr + 'void fixture(void) { unsigned old; do { asm("" : "+r"(value)); old=counter; counter-=AMOUNT; } while ((int)old > AMOUNT); }\n'
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
    for amount in (1, 2, 127, 255):
        result, obj = compile_case('amount' + str(amount), template.replace('AMOUNT', str(amount)))
        assert not result.returncode, result.stderr
        binary = obj.with_suffix('.bin')
        subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '--only-section=.text', str(obj), str(binary)], check=True)
        code = binary.read_bytes()
        assert code == struct.pack('<III', 0xe2544000 | amount, 0xcafffffd, 0xe12fff1e), code.hex()
        uc = Uc(UC_ARCH_ARM, UC_MODE_ARM); uc.mem_map(0x08000000, 0x1000); uc.mem_write(0x08000000, code)
        for value in values:
            for flags in range(16):
                initial = [0x12340000 + n for n in range(13)]; initial[4] = value
                for n, x in enumerate(initial): uc.reg_write(getattr(r, 'UC_ARM_REG_R' + str(n)), x)
                uc.reg_write(r.UC_ARM_REG_CPSR, 0x13 | flags << 28)
                uc.reg_write(r.UC_ARM_REG_SP, 0x02000800); uc.reg_write(r.UC_ARM_REG_LR, 0x08000100)
                uc.emu_start(0x08000000, 0x08000004, count=1)
                answer = (value - amount) & 0xffffffff
                initial[4] = answer
                assert [uc.reg_read(getattr(r, 'UC_ARM_REG_R' + str(n))) for n in range(13)] == initial
                overflow = bool((value ^ amount) & (value ^ answer) & 0x80000000)
                expected_flags = ((answer >> 31) << 3 | (answer == 0) << 2 | (value >= amount) << 1 | overflow) << 28
                assert uc.reg_read(r.UC_ARM_REG_CPSR) & 0xf0000000 == expected_flags
                assert uc.reg_read(r.UC_ARM_REG_SP) == 0x02000800
                assert uc.reg_read(r.UC_ARM_REG_LR) == 0x08000100
                # Execute the branch once, checking signed comparison even
                # when the subtraction result overflows into positive values.
                uc.emu_start(0x08000004, 0x08000ffc, count=1)
                signed = value if value < 0x80000000 else value - 0x100000000
                assert uc.reg_read(r.UC_ARM_REG_PC) == (0x08000000 if signed > amount else 0x08000008)
                cases += 1
    source = template.replace('AMOUNT', '1')
    rejected = [('thumb', source, '-mthumb'),
                ('wrong_compare', source.replace('(int)old > 1', '(int)old > 2'), '-marm'),
                ('barrier', source.replace('counter-=1;', 'counter-=1; asm volatile("" ::: "memory");'), '-marm'),
                ('live_old', source.replace('while ((int)old > 1);', 'while ((int)old > 1); value=old;'), '-marm'),
                ('no_subtraction', source.replace('counter-=1;', ''), '-marm')]
    for name, text, mode in rejected:
        result, _ = compile_case(name, text, mode)
        assert result.returncode and 'subtract compare' in result.stderr, (name, result.stderr)
    plain = source.replace(attr, '')
    result, obj = compile_case('plain', plain, plugin=False); assert not result.returncode, result.stderr
    before = obj.read_bytes(); result, obj = compile_case('plain', plain)
    assert not result.returncode and obj.read_bytes() == before, result.stderr
    print(f'{cases} subtraction/branch executions pass; {len(rejected)} rejected cases; unannotated object unchanged.')


if __name__ == '__main__': main()
