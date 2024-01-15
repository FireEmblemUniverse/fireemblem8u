#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes
from fe8db import PID_IDX

def dump_one_part(rom_data, off):
    print("\t.characters = {")
    cnt = 0
    for i in range(7):
        pid = rom_data[off + 0x0 + i]
        if pid == 0:
            break

        cnt = cnt + 1

        print(f"\t\t{PID_IDX(pid)},")
    
    print("\t},")

    print("\t.supportExpBase = {")
    for i in range(cnt):
        base = rom_data[off + 0x7 + i]
        print(f"\t\t{base},")
    print("\t},")

    print("\t.supportExpGrowth = {")
    for i in range(cnt):
        growth = rom_data[off + 0xE + i]
        print(f"\t\t{growth},")
    print("\t},")

    supportCount = rom_data[off + 0x15]
    print(f'\t.supportCount = {supportCount},')
    
    return off + 0x18

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

        while True:
            print(f"CONST_DATA struct SupportData SupportData_{off + 0x08000000:08X} = " + "{")
            off = dump_one_part(rom_data, off)
            print("};\n")

            if off_end <= off:
                break

        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
