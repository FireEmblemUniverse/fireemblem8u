#!/usr/bin/env python3
"""Check the integrated audio byte reader's private register ABI against the ROM."""
from pathlib import Path
import struct
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_THUMB
from unicorn import arm_const as r

ROOT = Path(__file__).resolve().parents[2]
ADDRESS = 0x080D00A0
TRACK = 0x02000000
RETURN = 0x08010000


def main():
    machines = []
    for name in ('baserom.gba', 'fireemblem8.gba'):
        data = (ROOT/name).read_bytes()[ADDRESS-0x08000000:ADDRESS-0x08000000+10]
        uc = Uc(UC_ARCH_ARM, UC_MODE_THUMB)
        uc.mem_map(ADDRESS & ~0xfff, 0x1000)
        uc.mem_map(RETURN, 0x1000)
        uc.mem_map(TRACK, 0x1000)
        uc.mem_map(0x03000000, 0x8000)
        uc.mem_write(ADDRESS, data)
        machines.append(uc)
    count = 0
    # Four stream alignments plus aliasing the track's own command pointer.
    for offset in (0x100, 0x101, 0x102, 0x103, 0x40, 0x41, 0x42, 0x43):
        for byte in range(256):
            for flags in range(16):
                initial = bytearray([0xa5]*0x200)
                initial[offset] = byte
                pointer = TRACK+offset
                struct.pack_into('<I', initial, 0x40, pointer)
                expected = initial.copy()
                struct.pack_into('<I', expected, 0x40, pointer+1)
                value = expected[offset]
                results = []
                for uc in machines:
                    uc.mem_write(TRACK, bytes(initial))
                    uc.reg_write(r.UC_ARM_REG_CPSR, 0x33 | flags << 28)
                    for reg in range(13):
                        uc.reg_write(getattr(r, 'UC_ARM_REG_R'+str(reg)), 0x12340000+reg)
                    uc.reg_write(r.UC_ARM_REG_R1, TRACK)
                    uc.reg_write(r.UC_ARM_REG_SP, 0x03007000)
                    uc.reg_write(r.UC_ARM_REG_LR, RETURN|1)
                    uc.emu_start(ADDRESS|1, RETURN, count=16)
                    registers = [uc.reg_read(getattr(r, 'UC_ARM_REG_R'+str(reg))) for reg in range(13)]
                    assert uc.reg_read(r.UC_ARM_REG_PC) == RETURN
                    assert uc.reg_read(r.UC_ARM_REG_SP) == 0x03007000
                    assert registers == [0x12340000, TRACK, pointer, value]+[0x12340000+i for i in range(4,13)]
                    memory = bytes(uc.mem_read(TRACK, 0x200))
                    assert memory == expected
                    results.append((registers, uc.reg_read(r.UC_ARM_REG_CPSR), memory))
                assert results[0] == results[1]
                count += 1
    print(f'{count} original/production byte-reader cases pass: all byte values, NZCV, stream alignments, pointer-field aliases, registers and memory.')


if __name__ == '__main__':
    main()
