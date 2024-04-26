#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes

def dump_one_part(rom_data, off):
    data1 = int.from_bytes(rom_data[off + 0:off + 2], 'little')
    off = off + 2
    data2 = int.from_bytes(rom_data[off + 0:off + 2], 'little')
    off = off + 2
    data3 = int.from_bytes(rom_data[off + 0:off + 2], 'little')
    off = off + 2
    data4 = int.from_bytes(rom_data[off + 0:off + 2], 'little')
    off = off + 2
    data5 = int.from_bytes(rom_data[off + 0:off + 2], 'little')
    off = off + 2
    data6 = int.from_bytes(rom_data[off + 0:off + 2], 'little')
    off = off + 2
    data7 = int.from_bytes(rom_data[off + 0:off + 2], 'little')
    off = off + 2
    data8 = int.from_bytes(rom_data[off + 0:off + 2], 'little')
    off = off + 2
    print(f"    0x{data1:04X}, 0x{data2:04X}, 0x{data3:04X}, 0x{data4:04X}, 0x{data5:04X}, 0x{data6:04X}, 0x{data7:04X}, 0x{data8:04X},")
    return off

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
