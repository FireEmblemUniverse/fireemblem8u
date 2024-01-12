#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes
from fe8db import ITEM_IDX, ITYPE_IDX

def dump_one_part(rom_data, off):

    while True:
        _type = rom_data[off + 1]
        index = (rom_data[off + 3] << 8) | rom_data[off + 2]

        if index == 0:
            print("\t { 0 }")
            break

        print("\t{")
        match _type:
            case 0:
                # item
                key = ITEM_IDX(rom_data[off + 0])
                print(f"\t\t.wtype = {key},")

            case 1:
                # wtype
                key = ITYPE_IDX(rom_data[off + 0])
                print(f"\t\t.wtype = 0x0100 | {key},")

        print(f"\t\t.index = 0x{index:04X},")
        print("\t},")
        off = off + 4
    
    return off + 4

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
            print(f"CONST_DATA struct BattleAnimDef AnimConf_{off + 0x08000000:08X}[] = " + "{")
            off = dump_one_part(rom_data, off)
            print("};\n")

            if off_end <= off:
                break

        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
