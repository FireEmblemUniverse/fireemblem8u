#!/usr/bin/env python3
"""Verify the production stereo-word block, including aliasing and access order."""
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
ENTRY, DATA, OUTPUT, SP = 0x080cf730, 0x02000000, 0x02001000, 0x03007000


def main():
    p = argparse.ArgumentParser(description=__doc__); p.add_argument('--copied-ram', action='store_true'); a = p.parse_args()
    original = (ROOT / 'baserom.gba').read_bytes(); production = (ROOT / 'fireemblem8.gba').read_bytes()
    assert hashlib.sha1(original).hexdigest() == 'c25b145e37456171ada4b0d440bf88a19f4d509f'
    nm = subprocess.check_output(['arm-none-eabi-nm', '-S', str(ROOT / 'fireemblem8.elf')], text=True)
    fields = next(line.split() for line in nm.splitlines() if line.endswith(' SoundMainRAM_Packed'))
    assert int(fields[0], 16) == ENTRY and int(fields[1], 16) == 52, fields
    assert production[ENTRY-0x08000000:ENTRY-0x08000000+52] == original[ENTRY-0x08000000:ENTRY-0x08000000+52]
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
    cases = 0
    for byte in range(256):
        for source in (DATA + 0x1800, OUTPUT, OUTPUT + 1, OUTPUT + 1584):
            for right, left in ((0, 0), (1, 255), (255, 1), (128, 128), (255, 255), (17, 73)):
                for packed_right, packed_left in ((0, 0), (0xffffffff, 0x80808080), (0x01234567, 0xfedcba98)):
                    raw = bytearray([0xa5]) * 0x2000
                    struct.pack_into('<I', raw, OUTPUT-DATA, packed_right)
                    struct.pack_into('<I', raw, OUTPUT-DATA+1584, packed_left)
                    raw[source-DATA:source-DATA+4] = bytes((byte, byte ^ 128, 255-byte, (byte << 1 | byte >> 7) & 255))
                    snapshots = []
                    for uc, trace in machines:
                        trace.clear(); uc.mem_write(DATA, bytes(raw)); uc.mem_write(SP-16, bytes([0xa5]) * 32)
                        uc.reg_write(r.UC_ARM_REG_CPSR, 0x13 | (cases % 16) << 28)
                        regs = [0x12340000+n for n in range(13)]; regs[3] = source; regs[5] = OUTPUT
                        regs[10] = right << 16; regs[11] = left << 16
                        for n, value in enumerate(regs): uc.reg_write(getattr(r, 'UC_ARM_REG_R'+str(n)), value)
                        lr = (0, 7, 0xdeadbeef)[cases % 3]
                        uc.reg_write(r.UC_ARM_REG_SP, SP); uc.reg_write(r.UC_ARM_REG_LR, lr)
                        uc.emu_start(entry, entry+52, count=100)
                        assert uc.reg_read(r.UC_ARM_REG_PC) == entry+52
                        assert uc.reg_read(r.UC_ARM_REG_R3) == source+4
                        assert uc.reg_read(r.UC_ARM_REG_R5) == OUTPUT+4
                        assert uc.reg_read(r.UC_ARM_REG_SP) == SP and uc.reg_read(r.UC_ARM_REG_LR) == lr
                        assert bytes(uc.mem_read(SP-16, 32)) == bytes([0xa5]) * 32
                        assert len(trace) == 8
                        snapshots.append((tuple(uc.reg_read(getattr(r, 'UC_ARM_REG_R'+str(n))) for n in range(13)),
                                          uc.reg_read(r.UC_ARM_REG_CPSR), bytes(uc.mem_read(DATA, len(raw))), trace.copy()))
                    assert snapshots[0] == snapshots[1], (byte, source, right, left, packed_right, packed_left)
                    cases += 1
    report = dict(cases=cases, matching_C_bytes=52, copied_RAM=a.copied_ram,
                  scope='production stereo-word loads, packed loop and stores; all source byte values, source/output aliases, stereo boundaries; exact ordered accesses, full memory, r0-r12, flags, SP/LR and canaries')
    (OUT / ('word-production-ram.json' if a.copied_ram else 'word-production.json')).write_text(json.dumps(report, indent=2)+'\n')
    print(json.dumps(report, indent=2))


if __name__ == '__main__': main()
