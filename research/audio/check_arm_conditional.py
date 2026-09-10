#!/usr/bin/env python3
"""Check the guarded ARM two-continuation diamond, flags and copied-code branches."""
import argparse
from pathlib import Path
import random
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UC_HOOK_CODE
from unicorn import arm_const as r
ROOT = Path(__file__).resolve().parents[2]


def main():
    p = argparse.ArgumentParser(description=__doc__); p.add_argument('--compiler', required=True); p.add_argument('--plugin', type=Path, required=True); a = p.parse_args()
    out = ROOT / '.deps/soundmain-packed/conditional-guards'; out.mkdir(exist_ok=True)
    source = '''register unsigned fraction asm("lr");
register unsigned step asm("r4");
register volatile unsigned shifted asm("r9");
extern void adjacent(void); extern void conditional(void);
__attribute__((matching_arm_adjacent)) void fixture(void) {
 fraction += step;
 shifted = fraction >> 23;
 if (shifted == 0) conditional(); else adjacent();
}
'''
    def compile_case(name, text, extra=(), conditional='conditional'):
        src = out / (name + '.c'); src.write_text(text); obj = src.with_suffix('.o')
        result = subprocess.run([a.compiler, '-c', '-O1', '-marm', '-mcpu=arm7tdmi', '-mabi=apcs-gnu',
                                 '-fplugin=' + str(a.plugin.resolve()), '-fplugin-arg-arm_adjacent-destination=adjacent',
                                 '-fplugin-arg-arm_adjacent-lr-input=accumulator',
                                 *(['-fplugin-arg-arm_adjacent-conditional=' + conditional] if conditional else []),
                                 *extra, str(src), '-o', str(obj)], capture_output=True, text=True)
        return result, obj
    result, obj = compile_case('accepted', source); assert not result.returncode, result.stderr
    asm = out / 'destinations.s'; asm.write_text('.syntax unified\n.arm\n.section .text.adjacent,"ax",%progbits\n.global adjacent\n.type adjacent,%function\nadjacent:\n mov r2,#1\n.section .text.conditional,"ax",%progbits\n.global conditional\n.type conditional,%function\nconditional:\n mov r2,#2\n')
    dest = out / 'destinations.o'; subprocess.run(['arm-none-eabi-as', '-mcpu=arm7tdmi', '-meabi=gnu', str(asm), '-o', str(dest)], check=True)
    script, elf = out / 'test.ld', out / 'test.elf'
    def link(gap=0, target=0x08001100):
        script.write_text(f'''SECTIONS {{ . = 0x08001000; .text : {{ {obj}(.text) fixture_end = .; . += {gap}; {dest}(.text.adjacent) }} .conditional {target} : {{ {dest}(.text.conditional) }}
ASSERT(fixture_end - fixture == 12, "fixture extent")
ASSERT(adjacent == fixture_end, "adjacent ARM contract")
ASSERT(conditional == {target}, "conditional placement")
ASSERT((conditional & 3) == 0, "conditional ARM alignment")
ASSERT(conditional - (fixture + 16) < 0x2000000, "conditional ARM range") }}\n''')
        return subprocess.run(['arm-none-eabi-ld', '-T', str(script), str(obj), str(dest), '-o', str(elf)], capture_output=True, text=True)
    result = link(); assert not result.returncode, result.stderr
    binary = out / 'test.bin'; subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', str(elf), str(binary)], check=True)
    code = binary.read_bytes(); assert code[:12] == bytes.fromhex('04e08ee0ae9bb0e13c00000a'), code[:12].hex()
    rng = random.Random(0x4449414d)
    values = [0, 1, 0x7fffff, 0x800000, 0x7fffffff, 0x80000000, 0xffffffff] + [rng.getrandbits(32) for _ in range(64)]
    cases = 0; taken = 0
    for base in (0x08001000, 0x03002000):
        uc = Uc(UC_ARCH_ARM, UC_MODE_ARM); uc.mem_map(base, 0x1000); uc.mem_write(base, code)
        uc.mem_map(0x02000000, 0x1000); raw = bytes([0xa5]) * 0x1000
        stops = []
        def stop(uc, address, size, data):
            if address in (base+12, base+256): data.append(address); uc.emu_stop()
        uc.hook_add(UC_HOOK_CODE, stop, stops)
        for fraction in values:
            for step in (0, 1, 0x7fffff, 0x800000, 0xffffffff, (-fraction) & 0xffffffff):
                for flags in range(16):
                    stops.clear(); uc.mem_write(0x02000000, raw)
                    regs = [0x12340000+n for n in range(13)]; regs[4] = step
                    for n, value in enumerate(regs): uc.reg_write(getattr(r, 'UC_ARM_REG_R'+str(n)), value)
                    uc.reg_write(r.UC_ARM_REG_CPSR, 0x13 | flags << 28); uc.reg_write(r.UC_ARM_REG_LR, fraction); uc.reg_write(r.UC_ARM_REG_SP, 0x02000800)
                    uc.emu_start(base, base+0x1000, count=8)
                    updated = (fraction + step) & 0xffffffff; shifted = updated >> 23; regs[9] = shifted
                    expected_flags = 0x13 | ((flags & 1) << 28) | ((updated >> 22 & 1) << 29) | ((shifted == 0) << 30)
                    assert stops == [base + (256 if shifted == 0 else 12)], (fraction, step, stops)
                    assert [uc.reg_read(getattr(r, 'UC_ARM_REG_R'+str(n))) for n in range(13)] == regs
                    assert uc.reg_read(r.UC_ARM_REG_LR) == updated and uc.reg_read(r.UC_ARM_REG_SP) == 0x02000800
                    assert uc.reg_read(r.UC_ARM_REG_CPSR) == expected_flags
                    assert bytes(uc.mem_read(0x02000000, 0x1000)) == raw
                    cases += 1; taken += shifted == 0
    for gap, target in ((4, 0x08001100), (0, 0x08001102), (0, 0x0a001100)):
        result = link(gap, target); assert result.returncode, (gap, target)
    rejects = [('missing_arm', source.replace('if (shifted == 0) conditional(); else adjacent();', 'adjacent();'), (), 'conditional'),
               ('missing_option', source, (), None),
               ('wrong_target', source, (), 'other'),
               ('same_target', source, (), 'adjacent'),
               ('after_call', source.replace('conditional(); else', 'conditional(); shifted++; } else').replace('if (shifted == 0) ', 'if (shifted == 0) { '), (), 'conditional'),
               ('after_join', source.replace('else adjacent();', 'else adjacent(); shifted++;'), (), 'conditional'),
               ('signed_branch', source.replace('shifted == 0', '(int)shifted < 0'), (), 'conditional'),
               ('stack', source.replace('fraction += step;', 'volatile unsigned local[8]; local[0] = step; fraction += local[0];'), (), 'conditional'),
               ('return_bypass', source.replace('fraction += step;', 'if (step) return; fraction += step;'), (), 'conditional'),
               ('lr_assignment', source.replace('fraction += step;', 'fraction = step;'), (), 'conditional'),
               ('debug', source, ('-g',), 'conditional')]
    for name, text, extra, target in rejects:
        result, _ = compile_case(name, text, extra, target)
        assert result.returncode and ('ARM adjacent' in result.stderr or 'initialize plugin' in result.stderr), (name, result.stderr)
    print(f'{cases} ROM/copied-code conditional executions pass ({taken} taken); {len(rejects)} compiler rejections; three link rejections.')


if __name__ == '__main__': main()
