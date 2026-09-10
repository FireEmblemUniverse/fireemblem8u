#!/usr/bin/env python3
"""Verify sequence pointer decoding through both public and shared-stack entries."""
import argparse
import json
from pathlib import Path
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB
from unicorn import arm_const as r
ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT/'.deps/sequence-goto-match'
ENTRY, TRACK, RETURN = 0x080cf998, 0x02000000, 0x080e0000


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--compiler', required=True)
    p.add_argument('--source', type=Path, default=ROOT/'src/m4a_sequence_goto.c')
    p.add_argument('--production', action='store_true')
    args = p.parse_args()
    OUT.mkdir(exist_ok=True)
    flags = ['-S', '-std=gnu89', '-O1', '-mthumb', '-mcpu=arm7tdmi', '-mabi=apcs-gnu',
             '-ffreestanding', '-fno-builtin', '-fno-strict-aliasing', '-fno-schedule-insns',
             '-fno-schedule-insns2', '-fno-unwind-tables', '-fno-asynchronous-unwind-tables']
    subprocess.run([args.compiler, *flags, '-I', str(ROOT/'tools/agbcc/include'), '-iquote',
                    str(ROOT/'include'), str(args.source), '-o', str(OUT/'candidate.s')], check=True)
    with (OUT/'candidate.s').open('a') as f:
        f.write('\n.align 2,0\n.global ldrb_r3_r2\n.thumb_set ldrb_r3_r2,0x080cf971\n')
    subprocess.run(['arm-none-eabi-as', '-mcpu=arm7tdmi', str(OUT/'candidate.s'), '-o', str(OUT/'candidate.o')], check=True)
    subprocess.run(['arm-none-eabi-ld', '-Ttext='+hex(ENTRY), str(OUT/'candidate.o'), '-o', str(OUT/'candidate.elf')], check=True, capture_output=True)
    subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '--only-section=.text', str(OUT/'candidate.elf'), str(OUT/'candidate.bin')], check=True)
    rom = (ROOT/'baserom.gba').read_bytes()
    original = rom[ENTRY-0x08000000:ENTRY-0x08000000+32]
    candidate = (OUT/'candidate.bin').read_bytes()
    assert candidate == original, (candidate.hex(), original.hex())
    if args.production:
        assert candidate == (ROOT/'fireemblem8.gba').read_bytes()[ENTRY-0x08000000:ENTRY-0x08000000+32]
    machines = []
    for code in (original, candidate):
        uc = Uc(UC_ARCH_ARM, UC_MODE_THUMB)
        for address, size in ((0, 0x1000), (TRACK, 0x4000), (0x03000000, 0x8000), (0x08000000, 0x1000000)):
            uc.mem_map(address, size)
        uc.mem_write(0x08000000, rom)
        uc.mem_write(ENTRY, code)
        machines.append(uc)
    targets = [(0x89abcdef & ~(255 << shift)) | value << shift for shift in (0, 8, 16, 24) for value in range(256)]
    count = 0
    for command in (TRACK+0x300, 0x200, TRACK+64, TRACK+65, TRACK+66, TRACK+67):
        for target in (targets if command in (TRACK+0x300, 0x200) else (0,)):
            track = bytearray([0xa5]*256)
            struct.pack_into('<I', track, 64, command)
            encoded = bytes(track[command-TRACK:command-TRACK+4]) if TRACK <= command < TRACK+256 else target.to_bytes(4, 'little')
            expected = track.copy()
            decoded = int.from_bytes(encoded, 'little')
            if command < TRACK:
                decoded &= 0xffffff00
            struct.pack_into('<I', expected, 64, decoded)
            for nzcv in (0, 5, 10, 15):
                for internal in (False, True):
                    for thumb_return in (False, True):
                        states = []
                        for uc in machines:
                            uc.mem_write(command, encoded)
                            uc.mem_write(TRACK, bytes(track))
                            uc.reg_write(r.UC_ARM_REG_CPSR, 0x33 | nzcv<<28)
                            for n in range(13):
                                uc.reg_write(getattr(r, 'UC_ARM_REG_R'+str(n)), 0x12340000+n)
                            uc.reg_write(r.UC_ARM_REG_R1, TRACK)
                            uc.reg_write(r.UC_ARM_REG_LR, RETURN|thumb_return)
                            uc.reg_write(r.UC_ARM_REG_SP, 0x03006ffc if internal else 0x03007000)
                            if internal:
                                uc.mem_write(0x03006ffc, (RETURN|thumb_return).to_bytes(4, 'little'))
                                uc.reg_write(r.UC_ARM_REG_LR, 0x12345679)
                            uc.emu_start((ENTRY+2*internal)|1, RETURN, count=100)
                            assert uc.reg_read(r.UC_ARM_REG_PC) == RETURN
                            assert uc.reg_read(r.UC_ARM_REG_SP) == 0x03007000
                            assert bytes(uc.mem_read(TRACK, 256)) == expected
                            regs = [uc.reg_read(getattr(r, 'UC_ARM_REG_R'+str(n))) for n in range(13)]
                            assert regs[4:12] == [0x12340000+n for n in range(4, 12)]
                            assert bool(uc.reg_read(r.UC_ARM_REG_CPSR)&32) == thumb_return
                            states.append((regs, uc.reg_read(r.UC_ARM_REG_CPSR)&0xf0000000))
                        assert states[0] == states[1]
                        count += 1
    report = dict(cases=count, matched_bytes=32, production=args.production,
                  scope='Every value in each pointer byte, low-byte rejection, pointer aliases, public/shared-stack entries, ARM/Thumb returns, RAM, r0-r12, flags and SP.')
    (OUT/'report.json').write_text(json.dumps(report, indent=2)+'\n')
    print(report)


if __name__ == '__main__':
    main()
