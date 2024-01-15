#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes
from fe8db import PID_IDX

def dump_one_part(rom_data, off):
    hpBonus = rom_data[off + 0]
    if hpBonus != 0:
        print(f"\t.hpBonus  = {hpBonus},")

    powBonus = rom_data[off + 1]
    if powBonus != 0:
        print(f"\t.powBonus = {powBonus},")

    sklBonus = rom_data[off + 2]
    if sklBonus != 0:
        print(f"\t.sklBonus = {sklBonus},")

    spdBonus = rom_data[off + 3]
    if spdBonus != 0:
        print(f"\t.spdBonus = {spdBonus},")

    defBonus = rom_data[off + 4]
    if defBonus != 0:
        print(f"\t.defBonus = {defBonus},")

    resBonus = rom_data[off + 5]
    if resBonus != 0:
        print(f"\t.resBonus = {resBonus},")

    lckBonus = rom_data[off + 6]
    if lckBonus != 0:
        print(f"\t.lckBonus = {lckBonus},")

    movBonus = rom_data[off + 7]
    if movBonus != 0:
        print(f"\t.movBonus = {movBonus},")

    conBonus = rom_data[off + 8]
    if conBonus != 0:
        print(f"\t.conBonus = {conBonus},")

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

        while True:
            print(f"CONST_DATA struct ItemStatBonuses ItemBonus_{off + 0x08000000:08X} = " + "{")
            off = dump_one_part(rom_data, off)
            print("};\n")

            if off_end <= off:
                break

        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
