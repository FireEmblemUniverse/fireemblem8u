#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes
from fe8db import PID_IDX

def is_rom_ptr(ptr):
    if (ptr & 0x08000000) == 0x08000000:
        return True

    return False

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
    ptr_work  = int.from_bytes(rom_data[off + 0x0:off + 0x4], 'little')
    ptr_name  = int.from_bytes(rom_data[off + 0x4:off + 0x8], 'little')
    pos_maybe = int.from_bytes(rom_data[off + 0x8:off + 0xC], 'little')

    print("\t{")

    if ptr_work != 0:
        if is_rom_ptr(ptr_work):
            print(f'\t\t.work = "{dump_string(rom_data, ptr_work)}",')
        else:
            print(f'\t\t.work = (void *){hex(ptr_work)},')

    if ptr_name != 0:
        if is_rom_ptr(ptr_name):
            print(f'\t\t.name = "{dump_string(rom_data, ptr_name)}",')
        else:
            print(f'\t\t.name = (void *){hex(ptr_name)},')

    print(f'\t\t.pos_maybe = {hex(pos_maybe)},')
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

        print("CONST_DATA struct DebugCreditInfo gDebugCreditInfo[] = {")

        while True:
            off = dump_one_part(rom_data, off)

            if off_end <= off:
                break

        print("};")

        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
