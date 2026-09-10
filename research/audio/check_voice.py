#!/usr/bin/env python3
"""Check voice selection and sequential instrument copy against the actual ROM."""
import argparse
import json
from pathlib import Path
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB
from unicorn import arm_const as r
ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT/'.deps/voice-match'
ENTRY, TRACK, PLAYER, RETURN = 0x080cfa4c, 0x02000000, 0x02001000, 0x080e0000


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--compiler', required=True)
    p.add_argument('--plugin', type=Path, required=True)
    p.add_argument('--source', type=Path, default=ROOT/'src/m4a_voice.c')
    p.add_argument('--production', action='store_true')
    args = p.parse_args()
    OUT.mkdir(exist_ok=True)
    flags = ['-S', '-std=gnu89', '-O1', '-mthumb', '-mcpu=arm7tdmi', '-mabi=apcs-gnu',
             '-ffreestanding', '-fno-builtin', '-fno-strict-aliasing', '-fno-schedule-insns',
             '-fno-schedule-insns2', '-fno-unwind-tables', '-fno-asynchronous-unwind-tables', '-Werror=attributes',
             '-fplugin='+str(args.plugin.resolve()), '-fplugin-arg-ip_return-preserves-ip=chk_adr_r2']
    subprocess.run([args.compiler, *flags, '-I', str(ROOT/'tools/agbcc/include'), '-iquote',
                    str(ROOT/'include'), str(args.source), '-o', str(OUT/'candidate.s')], check=True)
    with (OUT/'candidate.s').open('a') as f:
        f.write('\n.align 2,0\n.global chk_adr_r2\n.thumb_set chk_adr_r2,0x080cf973\n')
    subprocess.run(['arm-none-eabi-as', '-mcpu=arm7tdmi', str(OUT/'candidate.s'), '-o', str(OUT/'candidate.o')], check=True)
    subprocess.run(['arm-none-eabi-ld', '-Ttext='+hex(ENTRY), str(OUT/'candidate.o'), '-o', str(OUT/'candidate.elf')], check=True, capture_output=True)
    subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '--only-section=.text', str(OUT/'candidate.elf'), str(OUT/'candidate.bin')], check=True)
    rom = (ROOT/'baserom.gba').read_bytes()
    original = rom[ENTRY-0x08000000:ENTRY-0x08000000+48]
    candidate = (OUT/'candidate.bin').read_bytes()
    assert candidate == original, (candidate.hex(), original.hex())
    if args.production:
        assert candidate == (ROOT/'fireemblem8.gba').read_bytes()[ENTRY-0x08000000:ENTRY-0x08000000+48]
    machines = []
    for code in (original, candidate):
        uc = Uc(UC_ARCH_ARM, UC_MODE_THUMB)
        for address, size in ((0, 0x1000), (TRACK, 0x4000), (0x03000000, 0x8000), (0x08000000, 0x1000000)):
            uc.mem_map(address, size)
        uc.mem_write(0x08000000, rom)
        uc.mem_write(ENTRY, code)
        machines.append(uc)
    count = 0
    for command in (TRACK+0x300, TRACK+64, TRACK+65, TRACK+66, TRACK+67):
        for index in (range(256) if command == TRACK+0x300 else (0,)):
            for source in (TRACK+0x2000, 0x100, TRACK+32, TRACK+36, TRACK+40, TRACK+44):
                for seed in (0, 0x55, 0xaa, 0xff):
                    ram = bytearray((seed+n*17)&255 for n in range(0x4000))
                    struct.pack_into('<I', ram, 64, command)
                    if command == TRACK+0x300:
                        ram[command-TRACK] = index
                    actual_index = ram[command-TRACK]
                    struct.pack_into('<I', ram, PLAYER-TRACK+48, (source-actual_index*12)&0xffffffff)
                    low = bytes((seed+n*31)&255 for n in range(12))
                    expected = ram.copy()
                    struct.pack_into('<I', expected, 64, command+1)
                    for word in range(3):
                        value = bytes(expected[source-TRACK+word*4:source-TRACK+word*4+4]) if source >= TRACK else bytes(4)
                        expected[36+word*4:40+word*4] = value
                    for nzcv in (0, 5, 10, 15):
                        states = []
                        for uc in machines:
                            uc.mem_write(TRACK, bytes(ram))
                            uc.mem_write(0x100, low)
                            uc.reg_write(r.UC_ARM_REG_CPSR, 0x33 | nzcv<<28)
                            for n in range(13):
                                uc.reg_write(getattr(r, 'UC_ARM_REG_R'+str(n)), 0x12340000+n)
                            uc.reg_write(r.UC_ARM_REG_R0, PLAYER)
                            uc.reg_write(r.UC_ARM_REG_R1, TRACK)
                            uc.reg_write(r.UC_ARM_REG_LR, RETURN|1)
                            uc.reg_write(r.UC_ARM_REG_SP, 0x03007000)
                            uc.emu_start(ENTRY|1, RETURN, count=100)
                            assert uc.reg_read(r.UC_ARM_REG_PC) == RETURN
                            assert uc.reg_read(r.UC_ARM_REG_SP) == 0x03007000
                            assert bytes(uc.mem_read(TRACK, 0x4000)) == expected, (command, index, source, seed)
                            regs = [uc.reg_read(getattr(r, 'UC_ARM_REG_R'+str(n))) for n in range(13)]
                            assert regs[4:12] == [0x12340000+n for n in range(4, 12)]
                            states.append((regs, uc.reg_read(r.UC_ARM_REG_CPSR)&0xf0000000))
                        assert states[0] == states[1]
                        count += 1
    report = dict(cases=count, matched_bytes=48, production=args.production,
                  scope='All voice indices, rejected source, four overlapping instrument sources, command-pointer aliases, RAM, r0-r12, flags, SP and return PC.')
    (OUT/'report.json').write_text(json.dumps(report, indent=2)+'\n')
    print(report)


if __name__ == '__main__':
    main()
