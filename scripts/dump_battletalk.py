#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes
from fe8db import PID_IDX, CHAPTER_MODES

def dump_one_part(rom_data, off):
    pidA = int.from_bytes(rom_data[off + 0x0:off + 0x2], 'little')
    pidA_idx = PID_IDX(pidA)
    print(f"\t\t.pidA     = {pidA_idx},")

    pidB = int.from_bytes(rom_data[off + 0x2:off + 0x4], 'little')
    if pidB != 0:
        pidB_idx = PID_IDX(pidB)
        print(f"\t\t.pidB     = {pidB_idx},")

    chapter = rom_data[off + 4]
    print(f"\t\t.chapter = 0x{chapter:02X},")

    flag = int.from_bytes(rom_data[off + 0x6:off + 0x8], 'little')
    if flag != 0:
        print(f"\t\t.flag    = 0x{flag:04X},")

    msg = int.from_bytes(rom_data[off + 0x8:off + 0xA], 'little')
    print(f"\t\t.msg     = 0x{msg:04X},")

    event = int.from_bytes(rom_data[off + 0xC:off + 0x10], 'little')
    if event != 0:
        print(f"\t\t.event = (void *)0x{event:08X},")

    return off + 0x10

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

        print("CONST_DATA struct BattleTalkExtEnt gBattleTalkList[] = {")

        while True:
            print("\t{")
            off = dump_one_part(rom_data, off)
            print("\t},")

            if off_end <= off:
                break

        print("};")

        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
