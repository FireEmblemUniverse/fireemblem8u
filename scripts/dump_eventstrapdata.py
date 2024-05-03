#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes
import symbols
from fe8db import ITEM_IDX, TRAP_TYPE_IDX

# ========================================================================
elf = "fireemblem8.elf"
with open(elf, 'rb') as f:
    _symbols = { addr: name for addr, name in symbols.from_elf(f) }

def try_get_ptr_symbol(val):
    is_symbol = False

    ptr = val

    if ptr > 0x08000000 and ptr < 0x09000000:
        is_symbol = True
    if ptr > 0x02000000 and ptr < 0x02040000:
        is_symbol = True
    if ptr > 0x03000000 and ptr < 0x03008000:
        is_symbol = True

    if ptr not in _symbols:
        is_symbol = False

    if is_symbol == True:
        return _symbols[ptr]
    else:
        return f"(void *){hex(val)}"
# ========================================================================

def dump_one_part(rom_data, off):
    ptr = 0x08000000 | off
    if ptr not in _symbols:
        name = f"TrapData_Event_{off + 0x08000000:08X}"
    else:
        name = _symbols[ptr]

    print(f"// 0x{off + 0x08000000:07X}")
    print(f"CONST_DATA u8 {name}[] = " + "{")
    while True:
        trap_type = TRAP_TYPE_IDX[rom_data[off]]

        if trap_type == "TRAP_NONE":
            print(f"    /* type */ {trap_type}")
            off = off + 1
            break
        else:
            print(f"    /* type */ {trap_type},")

            xPos = rom_data[off + 1]
            print(f"    /* xPos */ {xPos},")

            yPos = rom_data[off + 2]
            print(f"    /* yPos */ {yPos},")

            subt = rom_data[off + 3]
            if trap_type == "TRAP_BALLISTA":
                print(f"    /* subt */ {ITEM_IDX(subt)},")
            else:
                print(f"    /* subt */ {subt},")

            cnt = rom_data[off + 4]
            print(f"    /* cnt  */ {cnt},")

            turn = rom_data[off + 5]
            print(f"    /* turn */ {turn},")

            print("")
            off = off + 6

    print("};\n")
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

    print(f"// 0x{off:06X}")

if __name__ == '__main__':
    main(sys.argv)
