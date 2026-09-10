#!/usr/bin/env python3
"""Research oracle for pattern nesting; ordinary calls are not a matching tail transfer."""
import argparse
import json
from pathlib import Path
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB
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
        machines.append(uc)
    count = 0
    register_differences = set()
    flag_differences = 0
    for level in range(256):
        for command in (TRACK+0x300, 0x200, TRACK+64, TRACK+68):
            for initial_flags in (0, 0x40, 0x80, 0xff):
                track = bytearray([0xa5]*256)
                track[0] = initial_flags
                track[2] = level
                struct.pack_into('<I', track, 32, 0)  # Empty channel list for the fine path.
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
                for nzcv in (0, 5, 10, 15):
                    states = []
                    for uc in machines:
                        uc.mem_write(command, bytes.fromhex('78563412'))
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
                        assert bytes(uc.mem_read(TRACK, 256)) == expected, (level, command)
                        regs = [uc.reg_read(getattr(r, 'UC_ARM_REG_R'+str(n))) for n in range(13)]
                        assert regs[4:12] == [0x12340000+n for n in range(4, 12)]
                        states.append((regs, uc.reg_read(r.UC_ARM_REG_CPSR)&0xf0000000))
                    register_differences.update(n for n in range(13) if states[0][0][n] != states[1][0][n])
                    flag_differences += states[0][1] != states[1][1]
                    count += 1
    report = dict(cases=count, original_bytes=28, candidate_bytes=len(candidate), complete_match=candidate==original,
                  differing_registers=sorted(register_differences), flag_difference_cases=flag_differences,
                  scope='All nesting levels, four flags, normal/rejected/aliased commands, actual goto/fine callees with empty channel list, RAM, preserved registers, flags, SP and return PC.')
    if args.require_match:
        assert candidate==original and not register_differences and not flag_differences, report
    (OUT/'report.json').write_text(json.dumps(report, indent=2)+'\n')
    print(report)


if __name__ == '__main__':
    main()
