#!/usr/bin/env python3
"""Research oracle for pattern nesting; ordinary calls are not a matching tail transfer."""
import argparse
import json
from itertools import product
from pathlib import Path
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB, UC_HOOK_CODE
from unicorn import arm_const as r
ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT/'.deps/pattern-match'
ENTRY, TRACK, RETURN = 0x080cf9b8, 0x02000000, 0x080e0000


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--compiler', required=True)
    p.add_argument('--source', type=Path, default=ROOT/'research/audio/pattern.c')
    p.add_argument('--require-match', action='store_true')
    args = p.parse_args()
    OUT.mkdir(exist_ok=True)
    flags = ['-S', '-std=gnu89', '-O1', '-mthumb', '-mcpu=arm7tdmi', '-mabi=apcs-gnu',
             '-ffreestanding', '-fno-builtin', '-fno-strict-aliasing', '-fno-schedule-insns',
             '-fno-schedule-insns2', '-fno-unwind-tables', '-fno-asynchronous-unwind-tables']
    subprocess.run([args.compiler, *flags, '-I', str(ROOT/'tools/agbcc/include'), '-iquote',
                    str(ROOT/'include'), str(args.source), '-o', str(OUT/'candidate.s')], check=True)
    with (OUT/'candidate.s').open('a') as f:
        f.write('\n.align 2,0\n.global ply_goto,ply_fine\n.thumb_set ply_goto,0x080cf999\n.thumb_set ply_fine,0x080cf929\n')
    subprocess.run(['arm-none-eabi-as', '-mcpu=arm7tdmi', str(OUT/'candidate.s'), '-o', str(OUT/'candidate.o')], check=True)
    subprocess.run(['arm-none-eabi-ld', '-Ttext='+hex(ENTRY), str(OUT/'candidate.o'), '-o', str(OUT/'candidate.elf')], check=True, capture_output=True)
    subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '--only-section=.text', str(OUT/'candidate.elf'), str(OUT/'candidate.bin')], check=True)
    rom = (ROOT/'baserom.gba').read_bytes()
    original = rom[ENTRY-0x08000000:ENTRY-0x08000000+28]
    candidate = (OUT/'candidate.bin').read_bytes()
    if args.require_match:
        assert candidate == original
    machines = []
    for code in (original, candidate):
        uc = Uc(UC_ARCH_ARM, UC_MODE_THUMB)
        for address, size in ((0, 0x1000), (TRACK, 0x4000), (0x03000000, 0x8000), (0x08000000, 0x1000000)):
            uc.mem_map(address, size)
        uc.mem_write(0x08000000, rom)
        uc.mem_write(ENTRY, code)
        entries = []
        def record_entry(machine, address, size, log):
            if address in (0x080cf928, 0x080cf998):
                log.append((address, machine.reg_read(r.UC_ARM_REG_SP), machine.reg_read(r.UC_ARM_REG_LR)))
        uc.hook_add(UC_HOOK_CODE, record_entry, entries, 0x080cf928, 0x080cf998)
        machines.append((uc, entries))
    count = 0
    register_differences = set()
    flag_differences = 0
    callee_stack_differences = 0
    callee_return_differences = 0
    for level in range(256):
        for command in (TRACK+0x300, 0x200, TRACK+64, TRACK+68):
            for initial_flags, channel_count in product((0, 0x40, 0x80, 0xff), range(3)):
                track = bytearray([0xa5]*256)
                track[0] = initial_flags
                track[2] = level
                channel_base = TRACK+0x500
                struct.pack_into('<I', track, 32, channel_base if channel_count else 0)
                channels = bytearray([0x5a]*128)
                for channel in range(channel_count):
                    offset = channel*64
                    channels[offset] = level ^ (0xc7 if channel else 0)
                    struct.pack_into('<III', channels, offset+44, TRACK,
                                     channel_base+(channel-1)*64 if channel else 0,
                                     channel_base+(channel+1)*64 if channel+1 < channel_count else 0)
                expected_channels = channels.copy()
                struct.pack_into('<I', track, 64, command)
                expected = track.copy()
                if level < 3:
                    struct.pack_into('<I', expected, 68+level*4, command+4)
                    expected[2] = level+1
                    encoded = expected[command-TRACK:command-TRACK+4] if TRACK <= command < TRACK+256 else bytes.fromhex('78563412')
                    target = int.from_bytes(encoded, 'little')
                    if command < TRACK:
                        target &= 0xffffff00
                    struct.pack_into('<I', expected, 64, target)
                else:
                    expected[0] = 0
                    struct.pack_into('<I', expected, 32, 0)
                    for channel in range(channel_count):
                        offset = channel*64
                        if expected_channels[offset] & 0xc7:
                            expected_channels[offset] |= 0x40
                        struct.pack_into('<I', expected_channels, offset+44, 0)
                        struct.pack_into('<I', expected_channels, offset+48, 0)
                for nzcv in (0, 5, 10, 15):
                    states = []
                    for uc, entries in machines:
                        entries.clear()
                        uc.mem_write(command, bytes.fromhex('78563412'))
                        uc.mem_write(TRACK, bytes(track))
                        uc.mem_write(channel_base, bytes(channels))
                        uc.reg_write(r.UC_ARM_REG_CPSR, 0x33 | nzcv<<28)
                        for n in range(13):
                            uc.reg_write(getattr(r, 'UC_ARM_REG_R'+str(n)), 0x12340000+n)
                        uc.reg_write(r.UC_ARM_REG_R1, TRACK)
                        uc.reg_write(r.UC_ARM_REG_LR, RETURN|1)
                        uc.reg_write(r.UC_ARM_REG_SP, 0x03007000)
                        uc.emu_start(ENTRY|1, RETURN, count=400)
                        assert uc.reg_read(r.UC_ARM_REG_PC) == RETURN
                        assert uc.reg_read(r.UC_ARM_REG_SP) == 0x03007000
                        assert bytes(uc.mem_read(TRACK, 256)) == expected, (level, command)
                        assert bytes(uc.mem_read(channel_base, 128)) == expected_channels, (level, channel_count)
                        regs = [uc.reg_read(getattr(r, 'UC_ARM_REG_R'+str(n))) for n in range(13)]
                        assert regs[4:12] == [0x12340000+n for n in range(4, 12)]
                        assert len(entries) == 1 and entries[0][0] == (0x080cf998 if level < 3 else 0x080cf928)
                        states.append((regs, uc.reg_read(r.UC_ARM_REG_CPSR)&0xf0000000, entries[0]))
                    register_differences.update(n for n in range(13) if states[0][0][n] != states[1][0][n])
                    flag_differences += states[0][1] != states[1][1]
                    callee_stack_differences += states[0][2][1] != states[1][2][1]
                    callee_return_differences += states[0][2][2] != states[1][2][2]
                    count += 1
    report = dict(cases=count, original_bytes=28, candidate_bytes=len(candidate), complete_match=candidate==original,
                  differing_registers=sorted(register_differences), flag_difference_cases=flag_differences,
                  callee_stack_difference_cases=callee_stack_differences, callee_return_difference_cases=callee_return_differences,
                  scope='All nesting levels, four flags, normal/rejected/aliased commands, actual goto/fine callees with zero/one/two channels and swept status bytes, RAM, preserved registers, flags, SP and return PC.')
    if args.require_match:
        assert candidate==original and not register_differences and not flag_differences and not callee_stack_differences and not callee_return_differences, report
    (OUT/'report.json').write_text(json.dumps(report, indent=2)+'\n')
    print(report)


if __name__ == '__main__':
    main()
