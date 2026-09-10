#!/usr/bin/env python3
"""Check guarded ARM continuation fallthrough and frame-rejection cases."""
import argparse
from pathlib import Path
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UC_HOOK_CODE
from unicorn import arm_const as r
ROOT = Path(__file__).resolve().parents[2]


def main():
    p = argparse.ArgumentParser(description=__doc__); p.add_argument('--compiler', required=True); p.add_argument('--plugin', type=Path, required=True); a = p.parse_args()
    out = ROOT / '.deps/soundmain-packed/adjacent-guards'; out.mkdir(exist_ok=True)
    attr = '__attribute__((matching_arm_adjacent)) '
    source = 'register volatile unsigned value asm("r0"); extern void destination(void);\n' + attr + 'void fixture(void) { value++; destination(); }\n'
    def compile_case(name, text, mode='-marm', extra=(), destination='destination', plugin=True):
        src = out / (name + '.c'); src.write_text(text); obj = out / (name + '.o')
        result = subprocess.run([a.compiler, '-c', '-O1', mode, '-mcpu=arm7tdmi', '-mabi=apcs-gnu',
                                 *(['-fplugin=' + str(a.plugin.resolve()), '-fplugin-arg-arm_adjacent-destination=' + destination] if plugin else []),
                                 *extra, str(src), '-o', str(obj)], capture_output=True, text=True)
        return result, obj
    result, obj = compile_case('accepted', source); assert not result.returncode, result.stderr
    asm = out / 'destination.s'; asm.write_text('.syntax unified\n.arm\n.section .text.destination,"ax",%progbits\n.global destination\n.type destination,%function\ndestination:\n bx lr\n')
    dest = out / 'destination.o'; subprocess.run(['arm-none-eabi-as', '-mcpu=arm7tdmi', '-meabi=gnu', str(asm), '-o', str(dest)], check=True)
    script = out / 'test.ld'; elf = out / 'test.elf'
    def link(gap):
        script.write_text(f'SECTIONS {{ . = 0x08001000; .text : {{ {obj}(.text) end_fixture = .; . += {gap}; {dest}(.text.destination) }} ASSERT(destination == end_fixture, "adjacent destination contract") }}\n')
        return subprocess.run(['arm-none-eabi-ld', '-T', str(script), str(obj), str(dest), '-o', str(elf)], capture_output=True, text=True)
    result = link(0); assert not result.returncode, result.stderr
    binary = out / 'test.bin'; subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '--only-section=.text', str(elf), str(binary)], check=True)
    code = binary.read_bytes(); assert code == bytes.fromhex('010080e21eff2fe1'), code.hex()
    cases = 0
    for value in (0, 1, 0x7fffffff, 0x80000000, 0xffffffff):
        for flags in range(16):
            for thumb in (False, True):
                uc = Uc(UC_ARCH_ARM, UC_MODE_ARM); uc.mem_map(0x08001000, 0x1000); uc.mem_write(0x08001000, code)
                uc.mem_map(0x02000000, 0x1000); uc.mem_write(0x02000000, bytes([0xa5]) * 0x1000)
                initial = [0x12340000 + n for n in range(13)]; initial[0] = value
                for n, x in enumerate(initial): uc.reg_write(getattr(r, 'UC_ARM_REG_R' + str(n)), x)
                uc.reg_write(r.UC_ARM_REG_CPSR, 0x13 | flags << 28); uc.reg_write(r.UC_ARM_REG_SP, 0x02000800); uc.reg_write(r.UC_ARM_REG_LR, 0x08001800 | thumb)
                observed = []
                def entry(uc, address, size, data):
                    data.append((uc.reg_read(r.UC_ARM_REG_SP), uc.reg_read(r.UC_ARM_REG_LR), uc.reg_read(r.UC_ARM_REG_R0)))
                uc.hook_add(UC_HOOK_CODE, entry, observed, begin=0x08001004, end=0x08001004)
                uc.emu_start(0x08001000, 0x08001800, count=10)
                initial[0] = (value + 1) & 0xffffffff
                assert observed == [(0x02000800, 0x08001800 | thumb, initial[0])]
                assert [uc.reg_read(getattr(r, 'UC_ARM_REG_R' + str(n))) for n in range(13)] == initial
                assert uc.reg_read(r.UC_ARM_REG_CPSR) & 0xf000003f == (0x13 | flags << 28 | thumb << 5)
                assert uc.reg_read(r.UC_ARM_REG_PC) == 0x08001800
                assert bytes(uc.mem_read(0x02000000, 0x1000)) == bytes([0xa5]) * 0x1000
                cases += 1
    for gap in (4, 8):
        result = link(gap); assert result.returncode and 'adjacent destination contract' in result.stderr
    rejects = [('thumb', source, '-mthumb', ()), ('debug', source, '-marm', ('-g',)),
               ('unwind', source, '-marm', ('-funwind-tables',)),
               ('missing', source.replace('destination();', ''), '-marm', ()),
               ('two_calls', source.replace('destination();', 'destination(); destination();'), '-marm', ()),
               ('after_call', source.replace('destination();', 'destination(); value++;'), '-marm', ()),
               ('conditional', source.replace('destination();', 'if (value) destination();'), '-marm', ()),
               ('local_stack', source.replace('value++;', 'volatile unsigned local[8]; local[0]=value; value=local[0];'), '-marm', ()),
               ('assembly', source.replace('value++;', 'asm volatile("nop");'), '-marm', ()),
               ('nonvoid', source.replace('void fixture', 'unsigned fixture').replace('destination();', 'destination(); return value;'), '-marm', ())]
    for name, text, mode, extra in rejects:
        result, _ = compile_case(name, text, mode, extra)
        assert result.returncode and 'ARM adjacent' in result.stderr, (name, result.stderr)
    result, _ = compile_case('wrong_destination', source, destination='other')
    assert result.returncode and 'destination mismatch' in result.stderr, result.stderr
    plain = source.replace(attr, '')
    result, obj = compile_case('plain', plain, plugin=False); assert not result.returncode, result.stderr
    before = obj.read_bytes(); result, obj = compile_case('plain', plain)
    assert not result.returncode and before == obj.read_bytes(), result.stderr
    print(f'{cases} adjacent-continuation executions pass; {len(rejects)+1} compiler rejections and two link rejections; unannotated object unchanged.')


if __name__ == '__main__': main()
