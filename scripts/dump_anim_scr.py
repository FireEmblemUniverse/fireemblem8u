#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys
import elf2sym
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

def dump_one_part(rom_data, off):
    while True:
        data = int.from_bytes(rom_data[off + 0:off + 4], 'little')
        off = off + 4

        if (data & 0x80000000) == 0:
            time1 = data & 3
            time2 = (data >> 26) & 0x1C
            time = time1 | time2

            sprite_ptr = data & 0x08FFFFFC
            ANIM_SPRITE = try_get_ptr_symbol(sprite_ptr)
            if ANIM_SPRITE == None:
                ANIM_SPRITE = f"{sprite_ptr:08X}"

            print(f"    ANIMSCR_FORCE_SPRITE " + ANIM_SPRITE + f", {time}")

        if (data & 0x80000000):
            ins = (0x7F000000 & data) >> 24
            match ins:
                case 0: # ANFMT_INS_TYPE_STOP
                    print("    ANIMSCR_BLOCKED")
                    break

                case 1: # ANFMT_INS_TYPE_END
                    print("[ERROR]: ANFMT_INS_TYPE_END")

                case 2: # ANFMT_INS_TYPE_LOOP
                    print("    ANIMSCR_LOOP")

                case 3: # ANFMT_INS_TYPE_MOVE
                    print("[ERROR]: ANFMT_INS_TYPE_MOVE")

                case 4: # ANFMT_INS_TYPE_WAIT
                    time = data & 0x00FFFFFF
                    print(f"    ANIMSCR_WAIT {time}")

                case 5: # ANIM_INS_TYPE_COMMAND
                    print("[ERROR]: ANIM_INS_TYPE_COMMAND")

                case 6: # ANIM_INS_TYPE_FRAME
                    print("[ERROR]: ANIM_INS_TYPE_FRAME")

                case _:
                    print("[ERROR] {ins}")

        if data == 0x80000000:
            print("    ANIMSCR_BLOCKED")
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

    index = 1
    PreName = ""

    with open(rom, 'rb') as f:
        rom_data = f.read()

        while True:
            name = try_get_ptr_symbol(off + 0x08000000)
            if name == None:
                name = f"AnimScr_{PreName}_{index}"

            print(f".global {name}")
            print(f"{name}: @ 0x{off:06X}")
            off = dump_one_part(rom_data, off)
            print("")
            index = index + 1

            if off_end <= off:
                break

        print(f"// End at: 0x{off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
