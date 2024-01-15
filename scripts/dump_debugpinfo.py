#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes
from fe8db import PID_IDX

def dump_string(rom_data, ptr):
    off = ptr & 0x01FFFFFF
    array = bytearray(b'')

    i = 0
    while True:
        byte = rom_data[off + i]
        i = i + 1

        if byte == 0:
            break

        array.append(byte)

    return f"{array.decode('ascii')}".replace('\n', '\\n')

def dump_one_part(rom_data, off):
    pid = int.from_bytes(rom_data[off + 0x0:off + 0x4], 'little')
    pid_idx = PID_IDX(pid)

    ptr_pname = int.from_bytes(rom_data[off + 0x4:off + 0x8], 'little')
    ptr_jname = int.from_bytes(rom_data[off + 0x8:off + 0xC], 'little')

    print("\t{")
    print(f'\t\t.idx = {pid_idx},')

    if ptr_pname != 0:
        print(f'\t\t.pname = "{dump_string(rom_data, ptr_pname)}",')

    if ptr_jname != 0:
        print(f'\t\t.jname = "{dump_string(rom_data, ptr_jname)}",')
    print("\t},")

    return off + 0xC

def main(args):
    rom = "baserom.gba"

    try:
        start = eval(args[1])
    except IndexError:
        sys.exit(f"Usage: {args[0]} START [END]")

    try:
        end = eval(args[2])
    except IndexError:
        end = 0

    off = start & 0x01FFFFFF
    off_end = end & 0x01FFFFFF

    with open(rom, 'rb') as f:
        rom_data = f.read()

        print("CONST_DATA struct DebugPInfo gDebugPInfo[] = {")

        while True:
            off = dump_one_part(rom_data, off)

            if off_end <= off:
                break

        print("};")

        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
