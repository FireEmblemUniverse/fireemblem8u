#!/usr/bin/env python3
"""Check production interpolation arithmetic and its shared entry with private LR."""
import argparse
import hashlib
import json
from pathlib import Path
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UC_HOOK_MEM_READ, UC_HOOK_MEM_WRITE, UC_MEM_READ
from unicorn import arm_const as r
ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / '.deps/soundmain-packed'
ENTRY, DATA, OUTPUT, SP = 0x080cf840, 0x02000000, 0x02001000, 0x03007000
MASK = 0xffffffff


def signed(value):
    return value - 0x100000000 if value & 0x80000000 else value


def mix(word, volume, sample):
    product = (volume * sample & MASK) & ~0xff0000
    return (product + ((word >> 8) | ((word << 24) & MASK))) & MASK


def main():
    p = argparse.ArgumentParser(description=__doc__); p.add_argument('--copied-ram', action='store_true'); a = p.parse_args()
    original = (ROOT / 'baserom.gba').read_bytes(); production = (ROOT / 'fireemblem8.gba').read_bytes()
    assert hashlib.sha1(original).hexdigest() == 'c25b145e37456171ada4b0d440bf88a19f4d509f'
    nm = subprocess.check_output(['arm-none-eabi-nm', '-S', str(ROOT / 'fireemblem8.elf')], text=True)
    fields = next(line.split() for line in nm.splitlines() if line.endswith(' SoundMainRAM_Resample'))
    assert int(fields[0], 16) == ENTRY and int(fields[1], 16) == 40, fields
    symbols = {line.split()[-1]: int(line.split()[0], 16) for line in nm.splitlines() if len(line.split()) >= 3}
    assert symbols['SoundMainRAM_ResampleMix'] == ENTRY+8 and symbols['SoundMainRAM_ResampleAdvance'] == ENTRY+40
    assert production[ENTRY-0x08000000:ENTRY-0x08000000+40] == original[ENTRY-0x08000000:ENTRY-0x08000000+40]
    machines = []
    def access(uc, kind, address, size, value, trace):
        if kind == UC_MEM_READ: value = int.from_bytes(uc.mem_read(address, size), 'little')
        trace.append((kind, address, size, value & ((1 << (8 * size)) - 1)))
    for image in (original, production):
        uc = Uc(UC_ARCH_ARM, UC_MODE_ARM)
        for base, size in ((DATA, 0x2000), (0x03000000, 0x8000), (0x08000000, 0x1000000)): uc.mem_map(base, size)
        uc.mem_write(0x08000000, image)
        if a.copied_ram: uc.mem_write(0x03002c60, image[0xcf54c:0xcf54c+0x400])
        trace = []; uc.hook_add(UC_HOOK_MEM_READ | UC_HOOK_MEM_WRITE, access, trace, begin=DATA, end=DATA+0x1fff)
        machines.append((uc, trace))
    entry = ENTRY + (0x03002c60 - 0x080cf54c if a.copied_ram else 0)
    cases = 0; entries = {'word_load': 0, 'interpolation_reentry': 0}
    volumes = ((0, 0), (1, 255), (255, 1), (128, 128), (255, 255), (17, 73))
    pairs = ((0, 0), (0xffffffff, 0x80808080), (0x01234567, 0xfedcba98))
    for current in range(-128, 128):
        for difference in (-255, -128, -1, 0, 1, 127, 255):
            for fraction in (0, 1, 0x7fffff, 0x800000, 0x7fffffff, 0x80000000, 0xffffffff, 0x12345678):
                for offset, lane in ((0, 0), (8, 0), (8, 1), (8, 2), (8, 3)):
                    right_vol, left_vol = volumes[cases % len(volumes)]
                    right, left = pairs[(cases // len(volumes)) % len(pairs)]
                    right_vol <<= 16; left_vol <<= 16
                    raw = bytearray([0xa5]) * 0x2000
                    struct.pack_into('<II', raw, OUTPUT-DATA, right, 0xa5a5a5a5)
                    struct.pack_into('<I', raw, OUTPUT-DATA+1584, left)
                    interpolated = (current + (signed(fraction * difference & MASK) >> 23)) & MASK
                    snapshots = []
                    for uc, trace in machines:
                        trace.clear(); uc.mem_write(DATA, bytes(raw)); uc.mem_write(SP-16, bytes([0xa5]) * 32)
                        flags = 0x13 | (cases % 16) << 28; uc.reg_write(r.UC_ARM_REG_CPSR, flags)
                        regs = [0x12340000+n for n in range(13)]; regs[0] = current & MASK; regs[1] = difference & MASK
                        regs[5] = OUTPUT | lane << 30; regs[6] = right; regs[7] = left
                        regs[10] = right_vol; regs[11] = left_vol
                        for n, value in enumerate(regs): uc.reg_write(getattr(r, 'UC_ARM_REG_R'+str(n)), value)
                        uc.reg_write(r.UC_ARM_REG_SP, SP); uc.reg_write(r.UC_ARM_REG_LR, fraction)
                        uc.emu_start(entry+offset, entry+40, count=20)
                        assert uc.reg_read(r.UC_ARM_REG_PC) == entry+40
                        assert uc.reg_read(r.UC_ARM_REG_CPSR) == flags
                        assert uc.reg_read(r.UC_ARM_REG_SP) == SP and uc.reg_read(r.UC_ARM_REG_LR) == fraction
                        assert bytes(uc.mem_read(SP-16, 32)) == bytes([0xa5]) * 32
                        assert bytes(uc.mem_read(DATA, len(raw))) == raw
                        assert trace == ([] if offset else [(UC_MEM_READ, OUTPUT, 4, right), (UC_MEM_READ, OUTPUT+1584, 4, left)])
                        regs[6] = mix(right, right_vol, interpolated); regs[7] = mix(left, left_vol, interpolated)
                        regs[9] = interpolated; regs[12] = (left_vol * interpolated & MASK) & ~0xff0000
                        observed = tuple(uc.reg_read(getattr(r, 'UC_ARM_REG_R'+str(n))) for n in range(13))
                        assert observed == tuple(regs), (current, difference, fraction, offset, lane, observed, regs)
                        snapshots.append((observed, trace.copy()))
                    assert snapshots[0] == snapshots[1]
                    entries['interpolation_reentry' if offset else 'word_load'] += 1; cases += 1
    report = dict(cases=cases, entries=entries, matching_C_bytes=40, copied_RAM=a.copied_ram,
                  scope='production interpolation and shared entry; every current signed byte, difference/fraction boundaries and wrap, four lanes; distributed volume/packed-word boundaries; independent expected arithmetic/registers, ordered reads, unchanged memory/flags/SP/LR')
    (OUT / ('resample-production-ram.json' if a.copied_ram else 'resample-production.json')).write_text(json.dumps(report, indent=2)+'\n')
    print(json.dumps(report, indent=2))


if __name__ == '__main__': main()
