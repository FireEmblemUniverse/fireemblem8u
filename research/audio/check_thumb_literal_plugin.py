#!/usr/bin/env python3
"""Check shared-literal option rejection and complete local-pool removal."""
import argparse
from pathlib import Path
import subprocess
import tempfile
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB
from unicorn import arm_const as r


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--compiler', required=True)
    parser.add_argument('--plugin', type=Path, required=True)
    args = parser.parse_args()
    prefix = '-fplugin-arg-thumb_shared_literal-'
    cases = 0
    with tempfile.TemporaryDirectory(prefix='thumb-literal-plugin-') as temp:
        root = Path(temp)
        (root/'probe.c').write_text('unsigned probe(unsigned value) { return value + 0x03007ff0U; }\n')
        command = [args.compiler, '-S', '-O1', '-mthumb', '-mcpu=arm7tdmi', '-mabi=apcs-gnu',
                   '-fplugin='+str(args.plugin.resolve()), str(root/'probe.c'), '-o', str(root/'probe.s')]
        rejected = [
            ['zero-pool-padding'], ['unknown-option'], ['literal=garbage,Shared'],
            ['literal=0x03007ff0,'], ['literal=0x03007ff0,Shared+4'],
            ['literal=0x100000000,Shared'],
            ['literal=0x03007ff0,Shared', 'literal=0x03007ff0,Duplicate'],
            ['literal=0x12345678,Missing'],
            ['symbol-literal=,Shared'], ['symbol-literal=Template+4,Shared'],
            ['symbol-literal=Template,Shared+4'], ['symbol-literal=Template,Shared', 'symbol-literal=Template,Other'],
            ['symbol-literal=Missing,Shared'],
        ]
        for options in rejected:
            result = subprocess.run(command+[prefix+option for option in options], capture_output=True, text=True)
            assert result.returncode != 0, options
            assert 'internal compiler error' not in result.stderr, (options, result.stderr)
        for variant in ('integer', 'symbol', 'alias'):
            if variant == 'integer':
                source = 'unsigned probe(unsigned value) { return value + 0x03007ff0U; }\n'
                selected = 'literal=0x03007ff0,Shared'
            else:
                declaration = 'extern char Template[];' if variant == 'symbol' else 'extern char Template[] asm("ActualTemplate");'
                source = declaration+' unsigned probe(unsigned value) { return value + (unsigned)Template; }\n'
                selected = 'symbol-literal='+('Template' if variant == 'symbol' else 'ActualTemplate')+',Shared'
            (root/'probe.c').write_text(source)
            for zero_padding in (False, True):
                options = [prefix+selected]
                if zero_padding:
                    options.append(prefix+'zero-pool-padding')
                subprocess.run(command+options, check=True)
                assembly = (root/'probe.s').read_text()
                assert '.reloc' in assembly and '.word' not in assembly, assembly
                assert ('.balign' in assembly) == zero_padding
                subprocess.run(['arm-none-eabi-as', '-mcpu=arm7tdmi', str(root/'probe.s'), '-o', str(root/'probe.o')], check=True)
                (root/'link.ld').write_text('SECTIONS { . = 0x08010000; .text : { *(.text) } } Shared = 0x08010100;\nASSERT(Shared >= ADDR(.text)+SIZEOF(.text) && Shared+4 <= ADDR(.text)+1024, "literal out of range")\n')
                subprocess.run(['arm-none-eabi-ld', '-T', str(root/'link.ld'), str(root/'probe.o'), '-o', str(root/'probe.elf')], check=True)
                subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '--only-section=.text', str(root/'probe.elf'), str(root/'probe.bin')], check=True)
                uc = Uc(UC_ARCH_ARM, UC_MODE_THUMB)
                uc.mem_map(0x08010000, 0x2000)
                uc.mem_map(0x03000000, 0x8000)
                uc.mem_write(0x08010000, (root/'probe.bin').read_bytes())
                uc.mem_write(0x08010100, (0x03007ff0).to_bytes(4, 'little'))
                for value in (0, 1, 0xffffffff, 0x7fffffff, 0x80000000, 0x55555555, 0xaaaaaaaa):
                    for nzcv in range(16):
                        uc.reg_write(r.UC_ARM_REG_CPSR, 0x33 | nzcv << 28)
                        for reg in range(13):
                            uc.reg_write(getattr(r, 'UC_ARM_REG_R'+str(reg)), 0x12340000+reg)
                        uc.reg_write(r.UC_ARM_REG_R0, value)
                        uc.reg_write(r.UC_ARM_REG_SP, 0x03007000)
                        uc.reg_write(r.UC_ARM_REG_LR, 0x08011001)
                        uc.emu_start(0x08010001, 0x08011000, count=100)
                        assert uc.reg_read(r.UC_ARM_REG_PC) == 0x08011000
                        assert uc.reg_read(r.UC_ARM_REG_R0) == (value+0x03007ff0)&0xffffffff
                        assert uc.reg_read(r.UC_ARM_REG_SP) == 0x03007000
                        for reg in range(4, 12):
                            assert uc.reg_read(getattr(r, 'UC_ARM_REG_R'+str(reg))) == 0x12340000+reg
                        cases += 1
    print(f'{cases} shared-only pool executions pass with both padding modes; {len(rejected)} invalid configurations rejected.')


if __name__ == '__main__':
    main()
