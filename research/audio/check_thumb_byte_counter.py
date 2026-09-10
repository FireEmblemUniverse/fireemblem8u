#!/usr/bin/env python3
"""Verify bounded byte decrement bundling and rejection of unproven ranges."""
from pathlib import Path
import argparse
import re
import subprocess
import tempfile
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB
from unicorn import arm_const as r


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--compiler', required=True)
    parser.add_argument('--plugin', type=Path, required=True)
    parser.add_argument('--carry', action='store_true')
    args = parser.parse_args()
    specs = {
        'positive_gt': ('unsigned char', ': : "r"(n)', 1, '>', True),
        'positive_le': ('unsigned char', ': : "r"(n)', 1, '<=', True),
        'opaque_output': ('unsigned char', ': "+r"(n)', 1, '>', False),
        'flags_clobber': ('unsigned char', ': : "r"(n) : "cc"', 1, '>', False),
        'far_target': ('unsigned char', ': : "r"(n)', 1, '>', False),
        'signed_byte': ('signed char', ': : "r"(n)', 1, '>', False),
        'word_input': ('unsigned', ': : "r"(n)', 1, '>', False),
        'other_decrement': ('unsigned char', ': : "r"(n)', 2, '>', False),
    }
    source = ''
    for name, (ctype, constraint, decrement, comparison, _) in specs.items():
        padding = '*result=3;' * 160 if name == 'far_target' else ''
        source += f'''void {name}(volatile {ctype} *input, volatile unsigned char *output,
                                 volatile unsigned *result) {{
            register int n asm("r3") = *input;
            asm("" {constraint});
            n -= {decrement};
            *output = n;
            if (n {comparison} 0) {{ {padding} *result = 11; }} else *result = 22;
        }}\n'''
    flags = ['-O1', '-mthumb', '-mcpu=arm7tdmi', '-mabi=apcs-gnu',
             '-fno-if-conversion', '-fno-if-conversion2', '-fno-reorder-blocks',
             '-fno-schedule-insns', '-fno-schedule-insns2', '-fwrapv']
    baseline = {}
    cases = 0
    senses='hi|ls' if args.carry else 'gt|le'
    bundle = re.compile(r'subs\s+(r\d+),\s*\1,\s*#1\s*\n\s*strb[^\n]*\n\s*b(?:'+senses+r')\s')
    with tempfile.TemporaryDirectory(prefix='thumb-byte-counter-') as temp:
        root = Path(temp)
        (root / 'probe.c').write_text(source)
        for enabled in (False, True):
            extra = ['-fplugin=' + str(args.plugin.resolve()),
                     '-fplugin-arg-thumb_shared_literal-byte-counter'+('-carry' if args.carry else '')] if enabled else []
            subprocess.run([args.compiler, '-S', *flags, *extra, str(root / 'probe.c'),
                            '-o', str(root / 'probe.s')], check=True)
            assembly = (root / 'probe.s').read_text()
            for name, (_, _, _, _, expected_bundle) in specs.items():
                body = assembly.split(name + ':', 1)[1].split('\t.size', 1)[0]
                if enabled:
                    assert bool(bundle.search(body)) == expected_bundle, (name, body)
                    if not expected_bundle:
                        normalize = lambda text: re.sub(r'\.LCB[0-9]+', '.LCB_UNIQUE', text)
                        assert normalize(body) == normalize(baseline[name]), (name, 'negative fixture changed', body, baseline[name])
                else:
                    baseline[name] = body
            subprocess.run(['arm-none-eabi-as', '-mcpu=arm7tdmi', str(root / 'probe.s'),
                            '-o', str(root / 'probe.o')], check=True)
            subprocess.run(['arm-none-eabi-ld', '-Ttext=0x08010000', str(root / 'probe.o'),
                            '-o', str(root / 'probe.elf')], check=True, capture_output=True)
            subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '--only-section=.text',
                            str(root / 'probe.elf'), str(root / 'probe.bin')], check=True)
            symbols = {parts[2]: int(parts[0], 16) for line in subprocess.check_output(
                ['arm-none-eabi-nm', str(root / 'probe.elf')], text=True).splitlines()
                if len(parts := line.split()) == 3}
            uc = Uc(UC_ARCH_ARM, UC_MODE_THUMB)
            uc.mem_map(0x08010000, 0x2000)
            uc.mem_map(0x02000000, 0x1000)
            uc.mem_map(0x03000000, 0x8000)
            uc.mem_write(0x08010000, (root / 'probe.bin').read_bytes())
            for name, (ctype, _, decrement, comparison, _) in specs.items():
                values = list(range(256))
                if ctype == 'unsigned':
                    values += [0x7fffffff, 0x80000000, 0x80000001, 0xffffffff]
                for value in values:
                    n = value - 256 if ctype == 'signed char' and value >= 128 else value
                    n = (n - decrement) & 0xffffffff
                    signed = n - 0x100000000 if n >= 0x80000000 else n
                    expected = 11 if (signed > 0 if comparison == '>' else signed <= 0) else 22
                    for nzcv in range(16):
                        uc.mem_write(0x02000000, value.to_bytes(4, 'little') + bytes(12))
                        uc.reg_write(r.UC_ARM_REG_CPSR, 0x33 | nzcv << 28)
                        for reg in range(13):
                            uc.reg_write(getattr(r, 'UC_ARM_REG_R' + str(reg)), 0x12340000 + reg)
                        for reg, address in ((0, 0x02000000), (1, 0x02000004), (2, 0x02000008)):
                            uc.reg_write(getattr(r, 'UC_ARM_REG_R' + str(reg)), address)
                        uc.reg_write(r.UC_ARM_REG_SP, 0x03007000)
                        uc.reg_write(r.UC_ARM_REG_LR, 0x08011001)
                        uc.emu_start(symbols[name] | 1, 0x08011000, count=1000)
                        assert uc.reg_read(r.UC_ARM_REG_PC) == 0x08011000
                        memory = bytearray(value.to_bytes(4, 'little') + bytes(12))
                        memory[4] = n & 255
                        memory[8:12] = expected.to_bytes(4, 'little')
                        assert bytes(uc.mem_read(0x02000000, 16)) == memory, (enabled, name, value)
                        assert uc.reg_read(r.UC_ARM_REG_SP) == 0x03007000
                        for reg in range(4, 12):
                            assert uc.reg_read(getattr(r, 'UC_ARM_REG_R' + str(reg))) == 0x12340000 + reg
                        cases += 1
    print(f'{cases} baseline/bundled executions pass; both requested branch senses bundle, six unsupported patterns remain unchanged.')


if __name__ == '__main__':
    main()
