#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes
import symbols

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
        return None
# ========================================================================

def dump_one_word(rom_data, off):
    ptr = int.from_bytes(rom_data[off:off + 4], 'little')

    symbol = try_get_ptr_symbol(ptr)
    if symbol == None:
        symbol = f"0x{ptr:08X}"

    print(f"\t.4byte {symbol}")

    off = off + 4
    return off

def dump_one_part(rom_data, off):
    while True:
        off = dump_one_word(rom_data, off)

        if try_get_ptr_symbol(off | 0x08000000) != None:
            print("")
            break

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
            name = try_get_ptr_symbol(off | 0x08000000)
            if name == None:
                name = f"gUnknown_08{off:06X}"

            print(f"\t.global {name}")
            print(f"{name}: @ 0x{off:08X}")
            off = dump_one_part(rom_data, off)

            if off_end <= off:
                break

        print(f"// End at: {off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
