#!/usr/bin/env python3
"""Check link-contracted ARM PC-address selection and rejection boundaries."""
import argparse
from pathlib import Path
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM
from unicorn import arm_const as r
ROOT = Path(__file__).resolve().parents[2]


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--compiler', required=True); p.add_argument('--plugin', type=Path, required=True)
    a = p.parse_args(); out = ROOT / '.deps/soundmain-reverb/pc-address-guards'; out.mkdir(exist_ok=True)
    attr = '__attribute__((matching_pc_address)) '
    source = 'register volatile unsigned value asm("r0"); extern char target[];\n' + attr + 'void fixture(void) { value=(unsigned)target; }\n'
    def compile_case(name, text, offset=47, mode='-marm', symbol='target', plugin=True):
        src = out / (name + '.c'); obj = out / (name + '.o'); src.write_text(text)
        result = subprocess.run([a.compiler, '-c', '-O1', mode, '-mcpu=arm7tdmi', '-mabi=apcs-gnu',
                                 *(['-fplugin=' + str(a.plugin.resolve()), '-fplugin-arg-pc_address-symbol=' + symbol,
                                    '-fplugin-arg-pc_address-offset=' + str(offset)] if plugin else []),
                                 str(src), '-o', str(obj)], capture_output=True, text=True)
        return result, obj
    def link(obj, offset, displacement=0):
        script = obj.with_suffix('.ld'); elf = obj.with_suffix('.elf')
        script.write_text(f'SECTIONS {{ . = 0x08001000; .text : {{ *(.text) }} target = 0x08001008 + {offset + displacement}; ASSERT(target == ADDR(.text) + 8 + {offset}, "PC address contract") ASSERT(SIZEOF(.text) == 8, "fixture size") }}\n')
        return subprocess.run(['arm-none-eabi-ld', '-T', str(script), str(obj), '-o', str(elf)], capture_output=True, text=True), elf
    cases = 0
    for offset in (0, 1, 47, 127, 254, 255):
        result, obj = compile_case('offset' + str(offset), source, offset); assert not result.returncode, result.stderr
        result, elf = link(obj, offset); assert not result.returncode, result.stderr
        binary = elf.with_suffix('.bin')
        subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '--only-section=.text', str(elf), str(binary)], check=True)
        code = binary.read_bytes(); assert code == struct.pack('<II', 0xe28f0000 | offset, 0xe12fff1e), code.hex()
        for flags in range(16):
            uc = Uc(UC_ARCH_ARM, UC_MODE_ARM); uc.mem_map(0x08001000, 0x1000); uc.mem_write(0x08001000, code)
            initial = [0x12340000 + n for n in range(13)]
            for n, value in enumerate(initial): uc.reg_write(getattr(r, 'UC_ARM_REG_R' + str(n)), value)
            uc.reg_write(r.UC_ARM_REG_SP, 0x02000800); uc.reg_write(r.UC_ARM_REG_LR, 0x08001800)
            uc.reg_write(r.UC_ARM_REG_CPSR, 0x13 | flags << 28)
            uc.emu_start(0x08001000, 0x08001800, count=10)
            initial[0] = 0x08001008 + offset
            assert [uc.reg_read(getattr(r, 'UC_ARM_REG_R' + str(n))) for n in range(13)] == initial
            assert uc.reg_read(r.UC_ARM_REG_CPSR) & 0xf000003f == 0x13 | flags << 28
            assert uc.reg_read(r.UC_ARM_REG_SP) == 0x02000800
            assert uc.reg_read(r.UC_ARM_REG_LR) == 0x08001800
            assert uc.reg_read(r.UC_ARM_REG_PC) == 0x08001800
            cases += 1
        for displacement in (-1, 1):
            result, _ = link(obj, offset, displacement)
            assert result.returncode and 'PC address contract' in result.stderr
    rejects = [('thumb', source, 47, '-mthumb', 'target'),
               ('wrong_symbol', source, 47, '-marm', 'other'),
               ('no_pool', source.replace('(unsigned)target', '3'), 47, '-marm', 'target'),
               ('negative', source, -1, '-marm', 'target'),
               ('large', source, 256, '-marm', 'target'),
               ('multiple_symbols', source.replace('extern char target[];', 'extern char target[], other[];').replace('value=(unsigned)target;', 'value=(unsigned)target; asm volatile("" : "+r"(value)); value=(unsigned)other;'), 47, '-marm', 'target')]
    for name, text, offset, mode, symbol in rejects:
        result, _ = compile_case(name, text, offset, mode, symbol)
        assert result.returncode, (name, result.stderr)
    plain = source.replace(attr, '')
    result, obj = compile_case('plain', plain, plugin=False); assert not result.returncode, result.stderr
    before = obj.read_bytes(); result, obj = compile_case('plain', plain)
    assert not result.returncode and obj.read_bytes() == before, result.stderr
    print(f'{cases} PC-address executions pass; {len(rejects)} compiler rejections and 12 link-contract rejections; unannotated object unchanged.')


if __name__ == '__main__': main()
