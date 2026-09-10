#!/usr/bin/env python3
"""Research oracle for repeat counter semantics and shared-stack transfers."""
import argparse
import json
from pathlib import Path
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB, UC_HOOK_CODE
from unicorn import arm_const as r
ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT/'.deps/repeat-match'
ENTRY, TRACK, RETURN = 0x080cf9e8, 0x02000000, 0x080e0000


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--compiler', required=True)
    p.add_argument('--source', type=Path, default=ROOT/'src/m4a_repeat.c')
    p.add_argument('--require-match', action='store_true')
    p.add_argument('--plugin', type=Path, required=True)
    p.add_argument('--production', action='store_true')
    args = p.parse_args()
    OUT.mkdir(exist_ok=True)
    flags = ['-S', '-std=gnu89', '-O1', '-mthumb', '-mcpu=arm7tdmi', '-mabi=apcs-gnu',
             '-ffreestanding', '-fno-builtin', '-fno-strict-aliasing', '-fno-schedule-insns',
             '-fno-schedule-insns2', '-fno-unwind-tables', '-fno-asynchronous-unwind-tables']
    if args.plugin:
        flags += ['-DREPEAT_SHARED_FRAME', '-Werror=attributes', '-fno-reorder-blocks', '-fno-if-conversion', '-fno-if-conversion2',
                  '-fplugin='+str(args.plugin.resolve()), '-fplugin-arg-shared_frame-destination=ply_goto',
                  '-fplugin-arg-shared_frame-entry=ply_goto_1', '-fplugin-arg-shared_frame-returning-call=ld_r3_tp_adr_i']
    subprocess.run([args.compiler, *flags, '-I', str(ROOT/'tools/agbcc/include'), '-iquote',
                    str(ROOT/'include'), str(args.source), '-o', str(OUT/'candidate.s')], check=True)
    with (OUT/'candidate.s').open('a') as f:
        f.write('\n.align 2,0\n.global ply_goto,ply_goto_1,ld_r3_tp_adr_i\n.thumb_set ply_goto,0x080cf999\n.thumb_set ply_goto_1,0x080cf99b\n.thumb_set ld_r3_tp_adr_i,0x080cf98d\n')
    subprocess.run(['arm-none-eabi-as', '-mcpu=arm7tdmi', str(OUT/'candidate.s'), '-o', str(OUT/'candidate.o')], check=True)
    subprocess.run(['arm-none-eabi-ld', '-Ttext='+hex(ENTRY), str(OUT/'candidate.o'), '-o', str(OUT/'candidate.elf')], check=True, capture_output=True)
    subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '--only-section=.text', str(OUT/'candidate.elf'), str(OUT/'candidate.bin')], check=True)
    rom = (ROOT/'baserom.gba').read_bytes()
    original = rom[ENTRY-0x08000000:ENTRY-0x08000000+48]
    candidate = (OUT/'candidate.bin').read_bytes()
    if args.require_match:
        assert candidate == original
    if args.production:
        assert candidate == (ROOT/'fireemblem8.gba').read_bytes()[ENTRY-0x08000000:ENTRY-0x08000000+48]
    machines = []
    for code in (original, candidate):
        uc = Uc(UC_ARCH_ARM, UC_MODE_THUMB)
        for address, size in ((0, 0x1000), (TRACK, 0x4000), (0x03000000, 0x8000), (0x08000000, 0x1000000)):
            uc.mem_map(address, size)
        uc.mem_write(0x08000000, rom)
        uc.mem_write(ENTRY, code)
        entries = []
        uc.hook_add(UC_HOOK_CODE, lambda machine, address, size, log: log.append((machine.reg_read(r.UC_ARM_REG_SP), machine.reg_read(r.UC_ARM_REG_LR))), entries, 0x080cf99a, 0x080cf99a)
        machines.append((uc, entries))
    count = jump_cases = finish_cases = 0
    different_regs = set()
    flag_differences = 0
    entry_differences = 0
    for command in (TRACK+0x300, 0x200, TRACK+3, TRACK+64, TRACK+65, TRACK+66, TRACK+67):
        for limit in (range(256) if command in (TRACK+0x300, 0x200) else (0,)):
            for old_count in range(256):
                track = bytearray([0xa5]*256)
                track[3] = old_count
                struct.pack_into('<I', track, 64, command)
                stream = bytes([limit, 0x78, 0x56, 0x34, 0x12])
                def read_byte(memory, address):
                    if TRACK <= address < TRACK+256:
                        return memory[address-TRACK]
                    return stream[address-command]
                expected = track.copy()
                first = read_byte(expected, command)
                take_jump = first == 0
                if take_jump:
                    struct.pack_into('<I', expected, 64, command+1)
                else:
                    increment = old_count+1
                    expected[3] = increment&255
                    struct.pack_into('<I', expected, 64, command+1)
                    checked = read_byte(expected, command) if command >= TRACK else 0
                    take_jump = increment < checked
                    if not take_jump:
                        expected[3] = 0
                        struct.pack_into('<I', expected, 64, command+5)
                if take_jump:
                    address = command+1
                    target = sum(read_byte(expected, address+n) << (8*n) for n in range(4))
                    if address < TRACK:
                        target &= 0xffffff00
                    struct.pack_into('<I', expected, 64, target)
                for nzcv in (0, 15):
                    states = []
                    for uc, entries in machines:
                        entries.clear()
                        uc.mem_write(command, stream)
                        uc.mem_write(TRACK, bytes(track))
                        uc.reg_write(r.UC_ARM_REG_CPSR, 0x33 | nzcv<<28)
                        for n in range(13):
                            uc.reg_write(getattr(r, 'UC_ARM_REG_R'+str(n)), 0x12340000+n)
                        uc.reg_write(r.UC_ARM_REG_R1, TRACK)
                        uc.reg_write(r.UC_ARM_REG_LR, RETURN|1)
                        uc.reg_write(r.UC_ARM_REG_SP, 0x03007000)
                        uc.emu_start(ENTRY|1, RETURN, count=200)
                        assert uc.reg_read(r.UC_ARM_REG_PC) == RETURN
                        assert uc.reg_read(r.UC_ARM_REG_SP) == 0x03007000
                        assert bytes(uc.mem_read(TRACK, 256)) == expected, (command, limit, old_count)
                        regs = [uc.reg_read(getattr(r, 'UC_ARM_REG_R'+str(n))) for n in range(13)]
                        assert regs[4:12] == [0x12340000+n for n in range(4, 12)]
                        assert len(entries) == int(take_jump)
                        states.append((regs, uc.reg_read(r.UC_ARM_REG_CPSR)&0xf0000000, entries.copy()))
                    different_regs.update(n for n in range(13) if states[0][0][n] != states[1][0][n])
                    flag_differences += states[0][1] != states[1][1]
                    entry_differences += states[0][2] != states[1][2]
                    count += 1
                    jump_cases += take_jump
                    finish_cases += not take_jump
    report = dict(cases=count, production=args.production, original_bytes=48, candidate_bytes=len(candidate), complete_match=candidate==original,
                  jump_cases=jump_cases, finish_cases=finish_cases, differing_registers=sorted(different_regs),
                  flag_difference_cases=flag_differences, shared_entry_difference_cases=entry_differences,
                  scope='All repeat limit/counter pairs in normal/rejected RAM, counter/pointer aliases, actual reader and goto, track RAM, r0-r12, flags, SP and return PC. Shared-entry SP/LR differences reported.')
    if args.require_match:
        assert candidate==original and not different_regs and not flag_differences and not entry_differences, report
    (OUT/'report.json').write_text(json.dumps(report, indent=2)+'\n')
    print(report)


if __name__ == '__main__':
    main()
