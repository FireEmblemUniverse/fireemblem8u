#!/usr/bin/env python3
"""Check exact packed-loop bytes and private machine state against the ROM."""
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM
from unicorn import arm_const as r
ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / '.deps/soundmain-packed'
ENTRY, MODEL, DATA, SP = 0x080cf738, 0x080e1000, 0x02000000, 0x03007000


def main():
    p = argparse.ArgumentParser(description=__doc__); p.add_argument('--compiler', required=True); p.add_argument('--plugin', type=Path); p.add_argument('--production', action='store_true'); p.add_argument('--copied-ram', action='store_true'); a = p.parse_args()
    if not a.production and not a.plugin: p.error('--plugin is required for candidate compilation')
    if a.copied_ram and not a.production: p.error('--copied-ram requires --production')
    OUT.mkdir(exist_ok=True)
    if not a.production:
        subprocess.run([a.compiler, '-c', '-std=gnu89', '-O1', '-marm', '-mcpu=arm7tdmi', '-mabi=apcs-gnu', '-ffreestanding',
                        '-DPACKED_ADD_CARRY', '-fplugin=' + str(a.plugin.resolve()), '-I' + str(ROOT / 'tools/agbcc/include'), '-iquote', str(ROOT / 'include'),
                        str(ROOT / 'research/audio/soundmain_packed_private.c'), '-o', str(OUT / 'candidate.o')], check=True)
        subprocess.run(['arm-none-eabi-ld', '-Ttext=' + hex(MODEL), '-e', 'SoundMainPackedPrivate', str(OUT / 'candidate.o'), '-o', str(OUT / 'candidate.elf')], check=True)
        subprocess.run(['arm-none-eabi-objcopy', '-O', 'binary', '--only-section=.text', str(OUT / 'candidate.elf'), str(OUT / 'candidate.bin')], check=True)
    rom = (ROOT / 'baserom.gba').read_bytes()
    production = (ROOT / 'fireemblem8.gba').read_bytes() if a.production else None
    code = production[ENTRY - 0x08000000:ENTRY - 0x08000000 + 36] if a.production else (OUT / 'candidate.bin').read_bytes()
    assert hashlib.sha1(rom).hexdigest() == 'c25b145e37456171ada4b0d440bf88a19f4d509f'
    if not a.production: assert len(code) == 40 and code[-4:] == bytes.fromhex('1eff2fe1')
    assert code[:36] == rom[ENTRY - 0x08000000:ENTRY - 0x08000000 + 36]
    machines = []
    for model in (False, True):
        uc = Uc(UC_ARCH_ARM, UC_MODE_ARM)
        for base, size in ((DATA, 0x1000), (0x03000000, 0x8000), (0x08000000, 0x1000000)): uc.mem_map(base, size)
        image = production if model and a.production else rom
        uc.mem_write(0x08000000, image)
        if a.copied_ram: uc.mem_write(0x03002c60, image[0xcf54c:0xcf54c+0x400])
        if model and not a.production: uc.mem_write(MODEL, code)
        machines.append(uc)
    cases = 0
    for byte in range(256):
        for lane in range(4):
            for right, left in ((0, 0), (1, 255), (255, 1), (128, 128), (255, 255), (17, 73)):
                for packed_right, packed_left in ((0, 0), (0xffffffff, 0x80808080), (0x01234567, 0xfedcba98)):
                    raw = bytes([byte, byte ^ 128, 255 - byte, (byte << 1 | byte >> 7) & 255]) + bytes([0xa5]) * 60
                    snapshots = []
                    for model, uc in enumerate(machines):
                        uc.mem_write(DATA, raw); uc.mem_write(SP - 16, bytes([0xa5]) * 32)
                        uc.reg_write(r.UC_ARM_REG_CPSR, 0x13 | (cases % 16) << 28)
                        regs = [0x12340000 + n for n in range(13)]
                        regs[3] = DATA; regs[5] = 0x02001000 | lane << 30
                        regs[6] = packed_right; regs[7] = packed_left; regs[10] = right << 16; regs[11] = left << 16
                        for n, value in enumerate(regs): uc.reg_write(getattr(r, 'UC_ARM_REG_R' + str(n)), value)
                        uc.reg_write(r.UC_ARM_REG_SP, SP); uc.reg_write(r.UC_ARM_REG_LR, 0x080f0001)
                        entry = (MODEL if model and not a.production else ENTRY) + (0x03002c60 - 0x080cf54c if a.copied_ram else 0)
                        uc.emu_start(entry, entry + 36, count=100)
                        assert uc.reg_read(r.UC_ARM_REG_PC) == entry + 36
                        assert uc.reg_read(r.UC_ARM_REG_R3) == DATA + 4 - lane
                        assert uc.reg_read(r.UC_ARM_REG_R5) == 0x02001000
                        assert uc.reg_read(r.UC_ARM_REG_SP) == SP
                        assert uc.reg_read(r.UC_ARM_REG_LR) == 0x080f0001
                        assert bytes(uc.mem_read(DATA, len(raw))) == raw
                        assert bytes(uc.mem_read(SP - 16, 32)) == bytes([0xa5]) * 32
                        snapshots.append(tuple(uc.reg_read(getattr(r, 'UC_ARM_REG_R' + str(n))) for n in range(13)) + (uc.reg_read(r.UC_ARM_REG_CPSR),))
                    assert snapshots[0] == snapshots[1], (byte, lane, right, left, packed_right, packed_left)
                    cases += 1
    report = dict(cases=cases, matching_loop_bytes=36, candidate_bytes=len(code), C_integration=a.production, copied_RAM=a.copied_ram,
                  scope='all byte values and starting lanes, stereo-volume/packed-word boundaries; r0-r12, flags, unchanged memory/stack; stopped before original stores and C placeholder return')
    if a.production:
        report['scope'] = 'production/original packed loop through store-continuation boundary; all byte values and starting lanes, stereo-volume/packed-word boundaries; r0-r12, flags and unchanged source/stack'
    stem = 'production-ram' if a.copied_ram else 'production' if a.production else 'report'
    (OUT / (stem + '.json')).write_text(json.dumps(report, indent=2) + '\n'); print(json.dumps(report, indent=2))


if __name__ == '__main__': main()
