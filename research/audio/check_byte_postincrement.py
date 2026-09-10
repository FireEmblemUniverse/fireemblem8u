#!/usr/bin/env python3
"""Validate opt-in ARM byte-load writeback and its rejection boundaries."""
import argparse
from pathlib import Path
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM
from unicorn import arm_const as r
ROOT = Path(__file__).resolve().parents[2]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--compiler', required=True)
    parser.add_argument('--plugin', type=Path, required=True)
    args = parser.parse_args()
    out = ROOT / '.deps/soundmain-reverb/postincrement-guards'
    out.mkdir(exist_ok=True)
    attr = '__attribute__((matching_byte_postincrement)) '
    template = 'register volatile int value asm("r0");\nregister volatile TYPE * volatile source asm("r7");\n' + attr + 'void fixture(void) { value = *source; source++; }\n'
    def compile_case(name, text, mode='-marm', plugin=True):
        src, dest = out / (name + '.c'), out / (name + '.o')
        src.write_text(text)
        result = subprocess.run([args.compiler, '-c', '-O1', mode, '-mcpu=arm7tdmi', '-mabi=apcs-gnu',
                                 *(['-fplugin=' + str(args.plugin.resolve())] if plugin else []),
                                 str(src), '-o', str(dest)], capture_output=True, text=True)
        return result, dest
    cases = 0
    for typename in ('signed char', 'unsigned char'):
        source = template.replace('TYPE', typename)
        result, obj = compile_case(typename.replace(' ', '_'), source)
        assert not result.returncode, result.stderr
        binary = obj.with_suffix('.bin')
        subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '--only-section=.text', str(obj), str(binary)], check=True)
        code = binary.read_bytes()
        # Exactly one writeback load and one return; no implicit extra effects.
        assert len(code) == 8 and code[-4:] == bytes.fromhex('1eff2fe1'), code.hex()
        assert code[:4] == bytes.fromhex('d100d7e0' if typename == 'signed char' else '0100d7e4'), code.hex()
        uc = Uc(UC_ARCH_ARM, UC_MODE_ARM)
        uc.mem_map(0x08000000, 0x1000); uc.mem_write(0x08000000, code)
        uc.mem_map(0x02000000, 0x1000)
        for byte in range(256):
            for flags in range(16):
                raw = bytes([0xa5]) * 31 + bytes([byte]) + bytes([0x5a]) * 32
                uc.mem_write(0x02000000, raw)
                initial = [0x12340000 + n for n in range(13)]
                initial[7] = 0x0200001f
                uc.reg_write(r.UC_ARM_REG_CPSR, 0x13 | flags << 28)
                for n, value in enumerate(initial): uc.reg_write(getattr(r, 'UC_ARM_REG_R' + str(n)), value)
                uc.reg_write(r.UC_ARM_REG_SP, 0x02000800); uc.reg_write(r.UC_ARM_REG_LR, 0x08000100)
                uc.emu_start(0x08000000, 0x08000100, count=10)
                expected = initial.copy(); expected[7] += 1
                expected[0] = (byte - 256 if typename == 'signed char' and byte >= 128 else byte) & 0xffffffff
                assert [uc.reg_read(getattr(r, 'UC_ARM_REG_R' + str(n))) for n in range(13)] == expected
                assert uc.reg_read(r.UC_ARM_REG_PC) == 0x08000100
                assert uc.reg_read(r.UC_ARM_REG_SP) == 0x02000800
                assert uc.reg_read(r.UC_ARM_REG_LR) == 0x08000100
                assert uc.reg_read(r.UC_ARM_REG_CPSR) & 0xf000003f == 0x13 | flags << 28
                assert bytes(uc.mem_read(0x02000000, 64)) == raw
                cases += 1
    source = template.replace('TYPE', 'signed char')
    rejected = [('thumb', source, '-mthumb'),
                ('word', template.replace('TYPE', 'int'), '-marm'),
                ('step_two', source.replace('source++', 'source += 2'), '-marm'),
                ('decrement', source.replace('source++', 'source--'), '-marm'),
                ('no_update', source.replace('source++;', ''), '-marm'),
                ('barrier', source.replace('source++;', 'asm volatile("" ::: "memory"); source++;'), '-marm'),
                ('intervening_store', source.replace('source++;', '*source = 0; source++;'), '-marm')]
    for name, text, mode in rejected:
        result, _ = compile_case(name, text, mode)
        assert result.returncode and 'byte postincrement' in result.stderr, (name, result.stderr)
    plain = source.replace(attr, '')
    result, obj = compile_case('plain', plain, plugin=False); assert not result.returncode, result.stderr
    before = obj.read_bytes()
    result, obj = compile_case('plain', plain); assert not result.returncode and before == obj.read_bytes(), result.stderr
    print(f'{cases} signed/unsigned byte and NZCV executions pass; {len(rejected)} unsupported patterns rejected; unannotated object unchanged.')


if __name__ == '__main__':
    main()
