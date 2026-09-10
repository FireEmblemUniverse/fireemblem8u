#!/usr/bin/env python3
"""Verify tempo arithmetic and the private reader ABI against original ROM code."""
import argparse
import json
from pathlib import Path
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB
from unicorn import arm_const as r
ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT/'.deps/tempo-match'
ENTRY, TRACK, PLAYER, RETURN = 0x080cfa24, 0x02000000, 0x02001000, 0x080e0000


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--compiler', required=True)
    parser.add_argument('--plugin', type=Path, required=True)
    parser.add_argument('--source', type=Path, default=ROOT/'src/m4a_tempo.c')
    parser.add_argument('--production', action='store_true')
    args = parser.parse_args()
    OUT.mkdir(exist_ok=True)
    subprocess.run([args.compiler, '-S', '-std=gnu89', '-O1', '-mthumb', '-mcpu=arm7tdmi', '-mabi=apcs-gnu',
                    '-ffreestanding', '-fno-builtin', '-fno-strict-aliasing', '-fno-schedule-insns', '-fno-schedule-insns2',
                    '-fno-unwind-tables', '-fno-asynchronous-unwind-tables', '-Werror=attributes',
                    '-fplugin='+str(args.plugin.resolve()), '-fplugin-arg-ip_return-preserves-ip=ld_r3_tp_adr_i',
                    '-I', str(ROOT/'tools/agbcc/include'), '-iquote', str(ROOT/'include'), str(args.source), '-o', str(OUT/'candidate.s')], check=True)
    with (OUT/'candidate.s').open('a') as f:
        f.write('\n.global ld_r3_tp_adr_i\n.thumb_set ld_r3_tp_adr_i, 0x080cf98d\n')
    subprocess.run(['arm-none-eabi-as', '-mcpu=arm7tdmi', str(OUT/'candidate.s'), '-o', str(OUT/'candidate.o')], check=True)
    subprocess.run(['arm-none-eabi-ld', '-Ttext='+hex(ENTRY), str(OUT/'candidate.o'), '-o', str(OUT/'candidate.elf')], check=True, capture_output=True)
    subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '--only-section=.text', str(OUT/'candidate.elf'), str(OUT/'candidate.bin')], check=True)
    rom = (ROOT/'baserom.gba').read_bytes()
    original = rom[ENTRY-0x08000000:ENTRY-0x08000000+20]
    candidate = (OUT/'candidate.bin').read_bytes()
    assert candidate == original, 'Tempo candidate does not match all 20 bytes'
    if args.production:
        assert candidate == (ROOT/'fireemblem8.gba').read_bytes()[ENTRY-0x08000000:ENTRY-0x08000000+20]
    machines = []
    for code in (original, candidate):
        uc = Uc(UC_ARCH_ARM, UC_MODE_THUMB)
        for address, size in ((0, 0x1000), (TRACK, 0x4000), (0x03000000, 0x8000), (0x08000000, 0x1000000)):
            uc.mem_map(address, size)
        uc.mem_write(0x08000000, rom)
        uc.mem_write(ENTRY, code)
        machines.append(uc)
    count = 0
    for scale in (0, 1, 127, 128, 255, 256, 257, 511, 1024, 0x7fff, 0x8000, 0xffff):
        for command in (TRACK+0x200, 0x200, TRACK+64, TRACK+65, TRACK+66, TRACK+67):
            for value in (range(256) if command in (TRACK+0x200, 0x200) else (0,)):
                track = bytearray([0xa5]*0x100)
                struct.pack_into('<I', track, 64, command)
                expected_track = track.copy()
                struct.pack_into('<I', expected_track, 64, command+1)
                byte = expected_track[command-TRACK] if TRACK <= command < TRACK+0x100 else value
                if command < 0x02000000:
                    byte = 0
                player = bytearray([0x5a]*0x100)
                struct.pack_into('<H', player, 30, scale)
                expected_player = player.copy()
                struct.pack_into('<H', expected_player, 28, byte*2)
                struct.pack_into('<H', expected_player, 32, ((byte*2*scale)>>8)&65535)
                for nzcv in (0, 5, 10, 15):
                    states = []
                    for uc in machines:
                        uc.mem_write(command, bytes([value]))
                        uc.mem_write(TRACK, bytes(track))
                        uc.mem_write(PLAYER, bytes(player))
                        uc.reg_write(r.UC_ARM_REG_CPSR, 0x33 | nzcv<<28)
                        for reg in range(13):
                            uc.reg_write(getattr(r, 'UC_ARM_REG_R'+str(reg)), 0x12340000+reg)
                        uc.reg_write(r.UC_ARM_REG_R0, PLAYER)
                        uc.reg_write(r.UC_ARM_REG_R1, TRACK)
                        uc.reg_write(r.UC_ARM_REG_SP, 0x03007000)
                        uc.reg_write(r.UC_ARM_REG_LR, RETURN|1)
                        uc.emu_start(ENTRY|1, RETURN, count=100)
                        assert uc.reg_read(r.UC_ARM_REG_PC) == RETURN
                        assert uc.reg_read(r.UC_ARM_REG_SP) == 0x03007000
                        assert bytes(uc.mem_read(TRACK, 0x100)) == expected_track
                        assert bytes(uc.mem_read(PLAYER, 0x100)) == expected_player, (scale, command, value)
                        for reg in range(4, 12):
                            assert uc.reg_read(getattr(r, 'UC_ARM_REG_R'+str(reg))) == 0x12340000+reg
                        states.append(([uc.reg_read(getattr(r, 'UC_ARM_REG_R'+str(reg))) for reg in range(13)], uc.reg_read(r.UC_ARM_REG_CPSR)&0xf0000000))
                    assert states[0] == states[1], (scale, command, value, nzcv)
                    count += 1
    report = {'cases': count, 'matched_bytes': 20, 'production': args.production, 'scales': 12,
              'scope': 'Actual ROM reader, player/track RAM, all r0-r12, SP, return PC and flags.'}
    (OUT/'report.json').write_text(json.dumps(report, indent=2)+'\n')
    print(report)


if __name__ == '__main__':
    main()
