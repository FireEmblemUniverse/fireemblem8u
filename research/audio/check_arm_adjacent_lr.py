#!/usr/bin/env python3
"""Verify explicit read-only private LR input and rejected continuation bodies."""
import argparse
from pathlib import Path
import random
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM
from unicorn import arm_const as r
ROOT = Path(__file__).resolve().parents[2]


def main():
    p = argparse.ArgumentParser(description=__doc__); p.add_argument('--compiler', required=True); p.add_argument('--plugin', type=Path, required=True); a = p.parse_args()
    out = ROOT / '.deps/soundmain-packed/adjacent-lr'; out.mkdir(exist_ok=True)
    source = '''register volatile unsigned value asm("r0");
register unsigned factor asm("r1");
register unsigned fraction asm("lr");
extern void destination(void);
__attribute__((matching_arm_adjacent)) void fixture(void) {
    value = factor * fraction;
    destination();
}
'''
    def compile_case(name, text, lr=True, extra=()):
        src = out / (name + '.c'); src.write_text(text); obj = src.with_suffix('.o')
        result = subprocess.run([a.compiler, '-c', '-O1', '-marm', '-mcpu=arm7tdmi', '-mabi=apcs-gnu',
                                 '-fplugin=' + str(a.plugin.resolve()), '-fplugin-arg-arm_adjacent-destination=destination',
                                 *(['-fplugin-arg-arm_adjacent-lr-input=read-only'] if lr else []),
                                 *extra, str(src), '-o', str(obj)], capture_output=True, text=True)
        return result, obj
    result, obj = compile_case('accepted', source); assert not result.returncode, result.stderr
    binary = obj.with_suffix('.bin'); subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '--only-section=.text', str(obj), str(binary)], check=True)
    code = binary.read_bytes(); assert code == bytes.fromhex('9e0100e0'), code.hex()
    uc = Uc(UC_ARCH_ARM, UC_MODE_ARM); uc.mem_map(0x08000000, 0x1000); uc.mem_write(0x08000000, code)
    uc.mem_map(0x02000000, 0x1000); raw = bytes([0xa5]) * 0x1000
    rng = random.Random(0x4c52494e)
    values = [0, 1, 7, 0x7fffff, 0x800000, 0x7fffffff, 0x80000000, 0xffffffff] + [rng.getrandbits(32) for _ in range(128)]
    cases = 0
    for lr in values:
        for factor in (0, 1, 255, 0xffffffff, 0x80000000, 0x12345678):
            for flags in range(16):
                uc.mem_write(0x02000000, raw); uc.reg_write(r.UC_ARM_REG_CPSR, 0x13 | flags << 28)
                regs = [0x12340000+n for n in range(13)]; regs[1] = factor
                for n, value in enumerate(regs): uc.reg_write(getattr(r, 'UC_ARM_REG_R'+str(n)), value)
                uc.reg_write(r.UC_ARM_REG_SP, 0x02000800); uc.reg_write(r.UC_ARM_REG_LR, lr)
                uc.emu_start(0x08000000, 0x08000004, count=3)
                regs[0] = lr * factor & 0xffffffff
                assert [uc.reg_read(getattr(r, 'UC_ARM_REG_R'+str(n))) for n in range(13)] == regs
                assert uc.reg_read(r.UC_ARM_REG_PC) == 0x08000004
                assert uc.reg_read(r.UC_ARM_REG_SP) == 0x02000800 and uc.reg_read(r.UC_ARM_REG_LR) == lr
                assert uc.reg_read(r.UC_ARM_REG_CPSR) == 0x13 | flags << 28
                assert bytes(uc.mem_read(0x02000000, 0x1000)) == raw
                cases += 1
    rejects = [('not_enabled', source, False, ()),
               ('write_lr', source.replace('value = factor * fraction;', 'fraction = factor;'), True, ()),
               ('update_lr', source.replace('value = factor * fraction;', 'fraction += factor;'), True, ()),
               ('no_global', source.replace('register unsigned fraction asm("lr");', '').replace('value = factor * fraction;', 'value = factor;'), True, ()),
               ('stack', source.replace('value = factor * fraction;', 'volatile unsigned local[8]; local[0] = fraction; value = local[0];'), True, ()),
               ('extra_call', source.replace('value = factor * fraction;', 'destination(); value = factor * fraction;'), True, ()),
               ('conditional', source.replace('destination();', 'if (value) destination();'), True, ()),
               ('assembly', source.replace('value = factor * fraction;', 'asm volatile("mov r0, lr");'), True, ()),
               ('bad_option', source, False, ('-fplugin-arg-arm_adjacent-lr-input=write',))]
    for name, text, lr, extra in rejects:
        result, _ = compile_case(name, text, lr, extra)
        assert result.returncode, (name, result.stderr)
        assert ('ARM adjacent' in result.stderr or 'initialize plugin' in result.stderr), (name, result.stderr)
    print(f'{cases} read-only LR executions pass; {len(rejects)} invalid contracts rejected.')


if __name__ == '__main__': main()
