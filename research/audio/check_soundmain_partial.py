#!/usr/bin/env python3
"""Check production partial-word completion, aliases, and all packed lanes."""
import argparse
import hashlib
import json
from pathlib import Path
import random
import struct
import subprocess
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UC_HOOK_MEM_READ, UC_HOOK_MEM_WRITE, UC_MEM_WRITE
from unicorn import arm_const as r
ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / '.deps/soundmain-packed'
ENTRY, DATA, OUTPUT, SP = 0x080cf7fc, 0x02000000, 0x02001000, 0x03007000


def rotate(value, shift):
    return ((value >> shift) | (value << ((-shift) & 31))) & 0xffffffff


def main():
    p = argparse.ArgumentParser(description=__doc__); p.add_argument('--copied-ram', action='store_true'); a = p.parse_args()
    original = (ROOT / 'baserom.gba').read_bytes(); production = (ROOT / 'fireemblem8.gba').read_bytes()
    assert hashlib.sha1(original).hexdigest() == 'c25b145e37456171ada4b0d440bf88a19f4d509f'
    nm = subprocess.check_output(['arm-none-eabi-nm', '-S', str(ROOT / 'fireemblem8.elf')], text=True)
    fields = next(line.split() for line in nm.splitlines() if line.endswith(' SoundMainRAM_Partial'))
    assert int(fields[0], 16) == ENTRY and int(fields[1], 16) == 40, fields
    assert production[ENTRY-0x08000000:ENTRY-0x08000000+40] == original[ENTRY-0x08000000:ENTRY-0x08000000+40]
    machines = []
    def access(uc, kind, address, size, value, trace):
        trace.append((kind, address, size, value & ((1 << (8 * size)) - 1)))
    for image in (original, production):
        uc = Uc(UC_ARCH_ARM, UC_MODE_ARM)
        for base, size in ((DATA, 0x2000), (0x03000000, 0x8000), (0x08000000, 0x1000000)): uc.mem_map(base, size)
        uc.mem_write(0x08000000, image)
        if a.copied_ram: uc.mem_write(0x03002c60, image[0xcf54c:0xcf54c+0x400])
        trace = []; uc.hook_add(UC_HOOK_MEM_READ | UC_HOOK_MEM_WRITE, access, trace, begin=DATA, end=DATA+0x1fff)
        machines.append((uc, trace))
    entry = ENTRY + (0x03002c60 - 0x080cf54c if a.copied_ram else 0)
    rng = random.Random(0x50415254)
    pairs = [(0, 0), (0xffffffff, 0x80808080), (0x01234567, 0xfedcba98)]
    pairs += [(rng.getrandbits(32), rng.getrandbits(32)) for _ in range(3)]
    cases = 0
    for byte in range(256):
        for lane in range(4):
            for channel in (DATA + 0x800, OUTPUT, OUTPUT + 1, OUTPUT + 1584, OUTPUT + 1587):
                for right, left in pairs:
                    # Nonzero upper bits also check truncation to the status byte.
                    status = byte | ((0, 0x12340000, 0xffffff00)[cases % 3])
                    shift = (3 - lane) * 8
                    raw = bytes([0xa5]) * 0x2000; expected = bytearray(raw)
                    expected[channel-DATA] = byte
                    struct.pack_into('<I', expected, OUTPUT-DATA+1584, rotate(left, shift))
                    struct.pack_into('<I', expected, OUTPUT-DATA, rotate(right, shift))
                    wanted_trace = [(UC_MEM_WRITE, channel, 1, byte),
                                    (UC_MEM_WRITE, OUTPUT+1584, 4, rotate(left, shift)),
                                    (UC_MEM_WRITE, OUTPUT, 4, rotate(right, shift))]
                    snapshots = []
                    for uc, trace in machines:
                        trace.clear(); uc.mem_write(DATA, raw); uc.mem_write(SP-16, bytes([0xa5]) * 32)
                        flags = 0x13 | (cases % 16) << 28
                        uc.reg_write(r.UC_ARM_REG_CPSR, flags)
                        regs = [0x12340000+n for n in range(13)]
                        regs[2] = status; regs[4] = channel; regs[5] = OUTPUT | lane << 30
                        regs[6] = right; regs[7] = left
                        for n, value in enumerate(regs): uc.reg_write(getattr(r, 'UC_ARM_REG_R'+str(n)), value)
                        lr = (0, 7, 0xdeadbeef)[cases % 3]
                        uc.reg_write(r.UC_ARM_REG_SP, SP); uc.reg_write(r.UC_ARM_REG_LR, lr)
                        uc.emu_start(entry, entry+(0x080cf8c0-ENTRY), count=20)
                        assert uc.reg_read(r.UC_ARM_REG_PC) == entry+(0x080cf8c0-ENTRY)
                        assert uc.reg_read(r.UC_ARM_REG_CPSR) == flags
                        assert uc.reg_read(r.UC_ARM_REG_SP) == SP and uc.reg_read(r.UC_ARM_REG_LR) == lr
                        assert bytes(uc.mem_read(SP-16, 32)) == bytes([0xa5]) * 32
                        assert bytes(uc.mem_read(DATA, len(raw))) == expected
                        assert trace == wanted_trace
                        regs[0] = shift; regs[5] = OUTPUT+4; regs[6] = rotate(right, shift); regs[7] = rotate(left, shift)
                        observed = tuple(uc.reg_read(getattr(r, 'UC_ARM_REG_R'+str(n))) for n in range(13))
                        assert observed == tuple(regs)
                        snapshots.append((observed, trace.copy()))
                    assert snapshots[0] == snapshots[1], (byte, lane, channel, right, left)
                    cases += 1
    report = dict(cases=cases, matching_C_bytes=40, copied_RAM=a.copied_ram,
                  scope='production partial-word finish; four lanes including zero rotate, all status bytes/truncation, channel/output aliases, boundary and seeded packed words; exact ordered writes, independent expected memory/registers, unchanged flags and SP/LR/canaries')
    (OUT / ('partial-production-ram.json' if a.copied_ram else 'partial-production.json')).write_text(json.dumps(report, indent=2)+'\n')
    print(json.dumps(report, indent=2))


if __name__ == '__main__': main()
