#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes
from fe8db import ITEM_IDX, ITYPE_IDX

def dump_one_part(rom_data, off):

    ret = "\t"
    end_cnd = 0
    i = 0

    while True:
        data = int.from_bytes(rom_data[off:off + 2], 'little')
        off = off + 2
        i = i + 1

        if data == 0:
            end_cnd = end_cnd + 1
            if end_cnd == 2:
                ret = ret + f"0x{data:04X}"
                break

        if i == 4:
            i = 0
            ret = ret + f"0x{data:04X},\n\t"
        else:
            ret = ret + f"0x{data:04X}, "

    print(ret)

    return off

def main(args):
    rom = "baserom.gba"

    start = 0x8AF6F4
    end   = 0x8AF834

    off = start & 0x01FFFFFF
    off_end = end & 0x01FFFFFF

    with open(rom, 'rb') as f:
        rom_data = f.read()

        while True:
            print(f"CONST_DATA u16 Unk_{off + 0x08000000:08X}[] = " + "{")
            off = dump_one_part(rom_data, off)
            print("};\n")

            if off_end <= off:
                break

        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
