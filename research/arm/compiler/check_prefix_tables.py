#!/usr/bin/env python3
"""Execute compiler-generated prefix branch tables, including repeated functions."""
import argparse
from pathlib import Path
import struct
import subprocess
import tempfile
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UC_HOOK_CODE
from unicorn import arm_const as r


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--compiler', required=True)
    parser.add_argument('--plugin', type=Path, required=True)
    args = parser.parse_args()
    with tempfile.TemporaryDirectory(prefix='arm-prefix-tables-') as tmp:
        root = Path(tmp)
        source = 'extern unsigned first[], second[]; extern void hit(unsigned);\n'
        specs = {}
        for size in (5, 6, 9):
            name = f'probe_{size}'
            specs[name] = size
            source += f'void {name}(unsigned x) {{ unsigned y=first[x]+second[x]; switch(x) {{\n'
            for index in range(size):
                source += f'case {index}: hit(y+{101+index*17}); break;\n'
            source += 'default: hit(99); break; } }\n'
        (root/'probe.c').write_text(source)
        common = [args.compiler, '-S', '-O1', '-marm', '-mcpu=arm7tdmi',
                  '-fno-if-conversion', '-fno-if-conversion2', '-fno-tree-switch-conversion',
                  '--param=ggc-min-expand=0', '--param=ggc-min-heapsize=0',
                  '-fplugin='+str(args.plugin.resolve()),
                  '-fplugin-arg-branch_tables-pc-relative',
                  '-fplugin-arg-branch_tables-shared-literal=first,SharedPool,0',
                  '-fplugin-arg-branch_tables-shared-literal=second,SharedPool,4']
        total = 0
        for order in ('first,second', 'second,first'):
            command = common + ['-fplugin-arg-branch_tables-prefix-symbols='+order,
                                str(root/'probe.c'), '-o', str(root/'probe.s')]
            subprocess.run(command, check=True)
            subprocess.run(['arm-none-eabi-as', '-mcpu=arm7tdmi', str(root/'probe.s'), '-o', str(root/'probe.o')], check=True)
            for origin in (0x08010000, 0x08010800):
                (root/'link.ld').write_text(f'SECTIONS {{ . = {origin:#x}; .text : {{ *(.text) }} /DISCARD/ : {{ *(.ARM.attributes) *(.comment) }} }} first = 0x02000000; second = 0x02000100; SharedPool = 0x08010f00; hit = 0x08012000;\n')
                subprocess.run(['arm-none-eabi-ld', '-T', str(root/'link.ld'), str(root/'probe.o'), '-o', str(root/'probe.elf')], check=True)
                subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '--only-section=.text', str(root/'probe.elf'), str(root/'probe.bin')], check=True)
                code = (root/'probe.bin').read_bytes()
                symbols = {parts[2]: int(parts[0], 16) for line in subprocess.check_output(['arm-none-eabi-nm', str(root/'probe.elf')], text=True).splitlines() if len(parts := line.split()) == 3 and parts[2] in specs}
                assert set(symbols) == set(specs)
                for name, size in specs.items():
                    entry = symbols[name]
                    prefix = entry - (12 + size*4)
                    expected = (0x02000000, 0x02000100)
                    if order.startswith('second'): expected = expected[::-1]
                    assert struct.unpack_from('<2I', code, prefix-origin) == expected
                    assert struct.unpack_from('<I', code, entry-origin-4)[0] == prefix+8
                    for j in range(size):
                        word = struct.unpack_from('<I', code, prefix-origin+8+j*4)[0]
                        assert word >> 24 == 0xea, hex(word)
                    for use_prefix in (False, True):
                        for index in range(size):
                            for flags in range(16):
                                uc = Uc(UC_ARCH_ARM, UC_MODE_ARM)
                                uc.mem_map(0x08010000, 0x4000); uc.mem_map(0x02000000, 0x1000); uc.mem_map(0x03000000, 0x8000)
                                uc.mem_write(origin, code)
                                uc.mem_write(0x08010f00, struct.pack('<2I', 0x02000000, 0x02000100))
                                uc.mem_write(0x02000000, struct.pack('<16I', *(i*3 for i in range(16))))
                                uc.mem_write(0x02000100, struct.pack('<16I', *(i*7 for i in range(16))))
                                uc.mem_write(0x08012000, bytes.fromhex('1eff2fe1'))
                                calls = []; redirects = []
                                def hook(machine, address, length, data):
                                    if address == 0x08012000:
                                        calls.append(machine.reg_read(r.UC_ARM_REG_R0))
                                    elif use_prefix and entry <= address < entry+512:
                                        opcode = struct.unpack('<I', machine.mem_read(address, 4))[0]
                                        if opcode & 0xfffffff0 == 0xe12fff10 and opcode & 15 != 14:
                                            # Preserve the function prologue, then exercise the duplicated prefix table.
                                            redirects.append(address)
                                            machine.reg_write(r.UC_ARM_REG_PC, prefix+8+index*4)
                                uc.hook_add(UC_HOOK_CODE, hook)
                                uc.reg_write(r.UC_ARM_REG_CPSR, 0x13 | flags << 28)
                                uc.reg_write(r.UC_ARM_REG_R0, index)
                                for reg in range(4, 12): uc.reg_write(getattr(r, 'UC_ARM_REG_R'+str(reg)), 0x12340000+reg)
                                uc.reg_write(r.UC_ARM_REG_SP, 0x03007000); uc.reg_write(r.UC_ARM_REG_LR, 0x08013000)
                                uc.emu_start(entry, 0x08013000, count=1000)
                                assert uc.reg_read(r.UC_ARM_REG_PC) == 0x08013000
                                assert calls == [101+index*27], (name, index, calls)
                                assert len(redirects) == int(use_prefix)
                                assert uc.reg_read(r.UC_ARM_REG_SP) == 0x03007000
                                for reg in range(4, 12): assert uc.reg_read(getattr(r, 'UC_ARM_REG_R'+str(reg))) == 0x12340000+reg
                                total += 1
        negative = [
            (['-fplugin-arg-branch_tables-prefix-symbols=first,first'], 'failed to initialize'),
            (['-fplugin-arg-branch_tables-prefix-symbols=first,missing'], 'prefix symbol missing'),
            (['-fplugin-arg-branch_tables-prefix-symbols=first,'], 'failed to initialize'),
            (['-fplugin-arg-branch_tables-prefix-symbols=first', '-mthumb'], 'require ARM mode'),
            (['-fplugin-arg-branch_tables-shared-literal=first,Other,0'], 'failed to initialize'),
        ]
        # A surviving literal must prevent removal of the original pool.
        (root/'extra.c').write_text(source.replace('default: hit(99)', 'default: hit(999)'))
        result = subprocess.run(common+['-fplugin-arg-branch_tables-prefix-symbols=first,second', str(root/'extra.c'), '-o', str(root/'bad.s')], capture_output=True, text=True)
        assert result.returncode and 'unconverted literal references' in result.stderr, result.stderr
        for options, diagnostic in negative:
            result = subprocess.run(common+options+[str(root/'probe.c'), '-o', str(root/'bad.s')], capture_output=True, text=True)
            assert result.returncode and diagnostic in result.stderr, result.stderr
    print(f'{total} prefix/body executions pass; pointer orders, relocation, repeated functions, forced GC and six invalid configurations checked.')


if __name__ == '__main__':
    main()
