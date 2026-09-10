#!/usr/bin/env python3
"""Verify the private r12 return contract and its rejected frame/call forms."""
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
    flags = ['-S', '-O1', '-mthumb', '-mcpu=arm7tdmi', '-mabi=apcs-gnu', '-fno-unwind-tables',
             '-fno-asynchronous-unwind-tables', '-Werror=attributes']
    plugin = ['-fplugin='+str(args.plugin.resolve()), '-fplugin-arg-ip_return-preserves-ip=helper']
    decl = 'extern void helper(void);\n'
    attr = '__attribute__((matching_ip_return)) '
    simple = 'void probe(void) { helper(); }\n'
    negatives = [
        (decl+attr+simple, [], plugin[:1], 'missing callee contract'),
        ('extern void unknown(void);\n'+attr+'void probe(void) { unknown(); }', [], plugin, 'unknown call'),
        (attr+'void probe(void (*callback)(void)) { callback(); }', [], plugin, 'indirect call'),
        (decl+attr+'void probe(void) { volatile unsigned array[8]; helper(); array[0]=1; }', [], plugin, 'stack local'),
        (decl+attr+'void probe(void) { helper(); asm volatile("" ::: "r12"); }', [], plugin, 'r12 clobber'),
        (decl+attr+'void probe(volatile unsigned *p) { helper(); if (*p) helper(); }', [], plugin, 'control flow'),
        (decl+attr+simple, ['-fno-omit-frame-pointer'], plugin, 'frame pointer'),
        (decl+attr+simple, ['-g'], plugin, 'debug information'),
        (decl+attr+simple, ['-funwind-tables'], plugin, 'unwind information'),
        (decl+attr+'unsigned probe(void) { helper(); return 1; }', [], plugin, 'nonvoid return'),
        (decl+attr+simple, ['-marm'], plugin, 'ARM mode'),
        (decl+'register unsigned saved asm("r12");\n'+attr+simple, [], plugin, 'global r12 variable'),
        (attr+'unsigned variable;', [], plugin, 'variable attribute'),
        (decl+'volatile void *saved;\n'+attr+'void probe(void) { helper(); saved=__builtin_return_address(0); }', [], plugin, 'return address use'),
    ]
    register_decl = 'register unsigned operand asm("r3");\n'
    for body, label in [
        ('asm("adds %0, #1" : "+r"(operand));', 'instruction-bearing low-register asm'),
        ('asm("" : "+r"(operand) : "r"(other));', 'extra constraint input'),
        ('asm("" : "+r"(operand) : : "cc");', 'constraint clobber'),
        ('asm("" : "+m"(cell));', 'memory constraint'),
        ('asm("" : "+r"(high));', 'high-register constraint'),
    ]:
        source = decl + register_decl + 'register unsigned other asm("r2"); register unsigned high asm("r8"); unsigned cell;\n'
        source += attr + 'void probe(void) { helper(); ' + body + ' }'
        negatives.append((source, [], plugin, label))
    with tempfile.TemporaryDirectory(prefix='ip-return-') as temp:
        root = Path(temp)
        command = [args.compiler, *flags, str(root/'probe.c'), '-o', str(root/'probe.s')]
        for source, extra, selected, label in negatives:
            (root/'probe.c').write_text(source)
            result = subprocess.run(command+selected+extra, capture_output=True, text=True)
            assert result.returncode, (label, 'unsupported contract accepted')
            assert 'internal compiler error' not in result.stderr, (label, result.stderr)
        # Loading the plugin must leave unannotated functions byte-for-byte alone.
        (root/'probe.c').write_text(decl+simple)
        subprocess.run(command, check=True)
        normal = (root/'probe.s').read_text()
        subprocess.run(command+plugin, check=True)
        assert (root/'probe.s').read_text() == normal
        # A real two-call body exercises the lifetime spanning both LR clobbers.
        source = decl+'register volatile unsigned *output asm("r1");\nregister unsigned value asm("r3");\n'
        source += attr+'void probe(void) { helper(); asm("" : "+r"(value)); *output=value; helper(); *output=value+1; }\n'
        (root/'probe.c').write_text(source)
        subprocess.run(command+plugin, check=True)
        assembly = (root/'probe.s').read_text()
        assert 'push' not in assembly and 'pop' not in assembly, assembly
        assert 'mov\tip, lr' in assembly and 'bx\tip' in assembly, assembly
        assembly += '\n.thumb\n.global helper\n.thumb_func\nhelper:\n movs r0,#17\n movs r2,#19\n movs r3,#23\n bx lr\n'
        (root/'probe.s').write_text(assembly)
        subprocess.run(['arm-none-eabi-as', '-mcpu=arm7tdmi', str(root/'probe.s'), '-o', str(root/'probe.o')], check=True)
        subprocess.run(['arm-none-eabi-ld', '-Ttext=0x08010000', str(root/'probe.o'), '-o', str(root/'probe.elf')], check=True, capture_output=True)
        subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '--only-section=.text', str(root/'probe.elf'), str(root/'probe.bin')], check=True)
        uc = Uc(UC_ARCH_ARM, UC_MODE_THUMB)
        for address, size in ((0x08010000, 0x2000), (0x02000000, 0x1000), (0x03000000, 0x8000)):
            uc.mem_map(address, size)
        uc.mem_write(0x08010000, (root/'probe.bin').read_bytes())
        for nzcv in range(16):
            for initial_ip in (0, 1, 0x12345678, 0xffffffff):
                for thumb_return in (0, 1):
                    uc.mem_write(0x02000000, bytes(4))
                    uc.reg_write(r.UC_ARM_REG_CPSR, 0x33 | nzcv << 28)
                    for reg in range(13):
                        uc.reg_write(getattr(r, 'UC_ARM_REG_R'+str(reg)), 0x12340000+reg)
                    uc.reg_write(r.UC_ARM_REG_R1, 0x02000000)
                    uc.reg_write(r.UC_ARM_REG_R12, initial_ip)
                    uc.reg_write(r.UC_ARM_REG_SP, 0x03007000)
                    uc.reg_write(r.UC_ARM_REG_LR, (0x08011000 | thumb_return))
                    uc.emu_start(0x08010001, 0x08011000, count=100)
                    assert uc.reg_read(r.UC_ARM_REG_PC) == 0x08011000
                    assert uc.reg_read(r.UC_ARM_REG_SP) == 0x03007000
                    assert uc.reg_read(r.UC_ARM_REG_R12) == (0x08011000 | thumb_return)
                    assert int.from_bytes(uc.mem_read(0x02000000, 4), 'little') == 24
                    for reg in range(4, 12):
                        assert uc.reg_read(getattr(r, 'UC_ARM_REG_R'+str(reg))) == 0x12340000+reg
                    assert bool(uc.reg_read(r.UC_ARM_REG_CPSR) & 0x20) == bool(thumb_return)
    print(f'128 two-call private-return executions pass; {len(negatives)} unsupported contracts rejected; unannotated assembly unchanged.')


if __name__ == '__main__':
    main()
