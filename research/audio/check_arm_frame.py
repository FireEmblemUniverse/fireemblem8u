#!/usr/bin/env python3
"""Check private frame loads, conditional comparison reuse and rejection bounds."""
import argparse
from pathlib import Path
import random
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UC_HOOK_CODE, UC_HOOK_MEM_READ, UC_HOOK_MEM_WRITE, UC_MEM_READ
from unicorn import arm_const as r
ROOT = Path(__file__).resolve().parents[2]


def main():
    p = argparse.ArgumentParser(description=__doc__); p.add_argument('--compiler', required=True); p.add_argument('--plugin', type=Path, required=True); a = p.parse_args()
    out = ROOT / '.deps/soundmain-packed/frame-guards'; out.mkdir(exist_ok=True)
    attr = '__attribute__((matching_arm_adjacent)) '
    source = '''register volatile unsigned count asm("r2"); register unsigned source asm("r3");
register unsigned *frame asm("sp");
extern void conditional(void); extern void adjacent(void);
''' + attr + '''void fixture(void) {
 count = frame[4]; asm("" : "+r"(count));
 if (count != 0) source = frame[3];
 if (count != 0) conditional(); else adjacent();
}
'''
    def compile_case(name, text, frame=True, extra=(), plugin=True):
        src = out / (name + '.c'); src.write_text(text); obj = src.with_suffix('.o')
        result = subprocess.run([a.compiler, '-c', '-O1', '-marm', '-mcpu=arm7tdmi', '-mabi=apcs-gnu',
                                 *(['-fplugin=' + str(a.plugin.resolve()), '-fplugin-arg-arm_adjacent-destination=adjacent', '-fplugin-arg-arm_adjacent-conditional=conditional',
                                    *(['-fplugin-arg-arm_adjacent-sp-input=frame64'] if frame else [])] if plugin else []),
                                 *extra, str(src), '-o', str(obj)], capture_output=True, text=True)
        return result, obj
    asm = out / 'dest.s'; asm.write_text('.syntax unified\n.arm\n.section .text.conditional,"ax",%progbits\n.global conditional\nconditional:\n mov r0,#1\n.section .text.adjacent,"ax",%progbits\n.global adjacent\nadjacent:\n mov r0,#2\n')
    dest = asm.with_suffix('.o'); subprocess.run(['arm-none-eabi-as', '-mcpu=arm7tdmi', '-meabi=gnu', str(asm), '-o', str(dest)], check=True)
    rng = random.Random(0x4652414d)
    counts = [0, 1, 2, 255, 256, 0x7fffffff, 0x80000000, 0xffffffff] + [rng.getrandbits(32) for _ in range(64)]
    pointers = [0, 1, 0x02000000, 0x03007000, 0x7fffffff, 0x80000000, 0xffffffff, 0x12345678]
    cases = 0
    for name, text, slot, overwritten, size in (('normal', source, 4, False, 16), ('last_word', source.replace('frame[4]', 'frame[15]'), 15, False, 16),
                                               ('overwrite_compare_input', source.replace('source = frame[3]', 'count = frame[3]'), 4, True, 20)):
        result, obj = compile_case(name, text); assert not result.returncode, result.stderr
        script, elf = out / (name+'.ld'), out / (name+'.elf')
        script.write_text(f'SECTIONS {{ .conditional 0x08001000 : {{ {dest}(.text.conditional) }} .text 0x08001100 : {{ {obj}(.text) end_fixture = .; {dest}(.text.adjacent) }} ASSERT(end_fixture-fixture == {size}, "frame fixture size") ASSERT(adjacent == end_fixture, "frame adjacent") }}\n')
        subprocess.run(['arm-none-eabi-ld', '-T', str(script), str(obj), str(dest), '-o', str(elf)], check=True, capture_output=True)
        binary = elf.with_suffix('.bin'); subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', str(elf), str(binary)], check=True)
        code = binary.read_bytes(); body = code[256:256+size]
        if name == 'normal': assert body == bytes.fromhex('10209de5000052e30c309d15bbffff1a'), body.hex()
        # The compared-register overwrite MUST retain both CMP instructions.
        assert body.count(bytes.fromhex('000052e3')) == (2 if overwritten else 1), body.hex()
        for base in (0x08001000, 0x03002000):
            uc = Uc(UC_ARCH_ARM, UC_MODE_ARM); uc.mem_map(base, 0x1000); uc.mem_write(base, code)
            uc.mem_map(0x02000000, 0x1000); sp = 0x02000800; stops = []; trace = []
            def stop(uc, address, length, data):
                if address in (base, base+256+size): data.append(address); uc.emu_stop()
            def access(uc, kind, address, length, value, data):
                if kind == UC_MEM_READ: value = int.from_bytes(uc.mem_read(address, length), 'little')
                data.append((kind, address, length, value))
            uc.hook_add(UC_HOOK_CODE, stop, stops); uc.hook_add(UC_HOOK_MEM_READ | UC_HOOK_MEM_WRITE, access, trace, begin=0x02000000, end=0x02000fff)
            for count in counts:
                for pointer in pointers:
                    for flags in range(16):
                        raw = bytearray([0xa5]) * 0x1000; struct.pack_into('<I', raw, 0x800+slot*4, count); struct.pack_into('<I', raw, 0x80c, pointer)
                        uc.mem_write(0x02000000, bytes(raw)); stops.clear(); trace.clear()
                        regs = [0x12340000+n for n in range(13)]
                        for n, value in enumerate(regs): uc.reg_write(getattr(r, 'UC_ARM_REG_R'+str(n)), value)
                        lr = (0, 7, 0xdeadbeef)[cases % 3]; uc.reg_write(r.UC_ARM_REG_LR, lr); uc.reg_write(r.UC_ARM_REG_SP, sp)
                        uc.reg_write(r.UC_ARM_REG_CPSR, 0x13 | flags << 28); uc.emu_start(base+256, base+0x1000, count=10)
                        final_count = pointer if overwritten and count else count; regs[2] = final_count
                        if count and not overwritten: regs[3] = pointer
                        assert stops == [base if final_count else base+256+size]
                        assert [uc.reg_read(getattr(r, 'UC_ARM_REG_R'+str(n))) for n in range(13)] == regs
                        assert uc.reg_read(r.UC_ARM_REG_CPSR) == 0x20000013 | (final_count & 0x80000000) | ((final_count == 0) << 30)
                        assert uc.reg_read(r.UC_ARM_REG_SP) == sp and uc.reg_read(r.UC_ARM_REG_LR) == lr
                        assert bytes(uc.mem_read(0x02000000, 0x1000)) == raw
                        assert trace == [(UC_MEM_READ, sp+slot*4, 4, count)] + ([(UC_MEM_READ, sp+12, 4, pointer)] if count else [])
                        cases += 1
    rejects = [('not_enabled', source, False), ('outside', source.replace('frame[4]', 'frame[16]'), True),
               ('negative', source.replace('frame[4]', 'frame[-1]'), True), ('byte', source.replace('count = frame[4]', 'count = *(unsigned char *)frame'), True),
               ('write', source.replace('count = frame[4]', 'frame[4] = count'), True), ('update_sp', source.replace('count = frame[4]', 'frame++; count = frame[4]'), True),
               ('no_binding', source.replace('frame asm("sp")', 'frame asm("r5")'), True),
               ('local_stack', source.replace('count = frame[4]', 'volatile unsigned local[8]; local[0]=frame[4]; count=local[0]'), True)]
    for name, text, enabled in rejects:
        result, _ = compile_case(name, text, enabled)
        assert result.returncode and 'ARM adjacent' in result.stderr, (name, result.stderr)
    plain = source.replace(attr, '')
    result, obj = compile_case('plain', plain, plugin=False); assert not result.returncode, result.stderr
    before = obj.read_bytes(); result, obj = compile_case('plain', plain)
    assert not result.returncode and before == obj.read_bytes(), result.stderr
    print(f'{cases} frame/conditional executions pass; compared-input overwrite retains CMP; {len(rejects)} rejected contracts; unannotated object unchanged.')


if __name__ == '__main__': main()
