#!/usr/bin/python3
# -*- coding: UTF-8 -*-

# struct MapAnimSpellfxConf

import sys, ctypes

def dump_one_part(rom_data, off):
    tsa_idx = ctypes.c_int8(rom_data[off + 0]).value
    blend = ctypes.c_int8(rom_data[off + 1]).value
    duration = ctypes.c_int8(rom_data[off + 2]).value

    print("    {" + f"{tsa_idx}, {blend}, {duration}" + "},")

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
            off = dump_one_part(rom_data, off)

            if off_end <= off:
                break

        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
