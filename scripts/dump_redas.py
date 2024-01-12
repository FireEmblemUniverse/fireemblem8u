#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes
import symbols

err_cnt = 0

def dump_one_reda(rom_data, off):
    u32_00 = int.from_bytes(rom_data[off + 0:off + 4], 'little')

    x = u32_00 & 0x3F
    y = (u32_00 >> 6) & 0x3F
    flags = (u32_00 >> 12) & 0x3F
    a = rom_data[off + 3]
    b = int.from_bytes(rom_data[off + 4:off + 6], 'little')
    delayFrames = int.from_bytes(rom_data[off + 6:off + 8], 'little')

    print("    {")
    print(f"        .x = {x},")
    print(f"        .y = {y},")

    if flags != 0:
        print(f"        .flags = {hex(flags)},")

    if a != 0:
        print(f"        .a = {hex(a)},")

    if b != 0:
        print(f"        .b = {hex(b)},")

    if delayFrames != 0:
        print(f"        .delayFrames = {delayFrames},")

    global err_cnt
    if b != 0xFFFF and b != 0xFFFE:
        err_cnt = err_cnt + 1
    else:
        err_cnt = 0

    if err_cnt > 2:
        print("    }," + "// [WARNING]" + f"0x{off - 16:06X}")
    else:
        print("    },")

    return off + 8

def dump_udef_redas(rom_data, off, count, prefix):
    for i in range(count):
        if prefix == None:
            print(f"CONST_DATA struct REDA REDA_{off + 0x08000000:08X}[] = " + "{")
        else:
            print(f"CONST_DATA struct REDA REDA_{prefix}{i}[] = " + "{")

        off = dump_one_reda(rom_data, off)

        print("};")

        # b = int.from_bytes(rom_data[off + 4:off + 6], 'little')
        # if b != 0xFFFF: # I think this is the terminator
            # break

    return off

def main(args):
    rom = "baserom.gba"

    try:
        start = eval(args[1])
        count = eval(args[2])
    except IndexError:
        sys.exit(f"Usage: {args[0]} START [count] [NAME]")

    off = start & 0x01FFFFFF

    try:
        prefix = args[3]
    except IndexError:
        prefix = None

    with open(rom, 'rb') as f:
        rom_data = f.read()

        off = dump_udef_redas(rom_data, off, count, prefix)
        print(f"// 0x{off:06X}")

if __name__ == '__main__':
    main(sys.argv)
