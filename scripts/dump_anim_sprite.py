#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes

def dump_one_part(rom_data, off):
    while True:
        oam0 = int.from_bytes(rom_data[off + 0:off + 2], 'little')
        oam1 = int.from_bytes(rom_data[off + 2:off + 4], 'little')
        oam2 = int.from_bytes(rom_data[off + 4:off + 6], 'little')
        x    = ctypes.c_int16(int.from_bytes(rom_data[off + 6:off + 8], 'little')).value
        y    = ctypes.c_int16(int.from_bytes(rom_data[off + 8:off + 10], 'little')).value
        _0   = ctypes.c_int16(int.from_bytes(rom_data[off + 10:off + 12], 'little')).value

        # print(f"@ [debug]: {hex(oam0)} {hex(oam1)} {hex(oam2)} {hex(x)} {hex(y)} {hex(_0)}")

        if oam1 == 0xFFFF:
            # affin
            cnt = int.from_bytes(rom_data[off + 0:off + 2], 'little')
            pa  = ctypes.c_int16(int.from_bytes(rom_data[off + 4:off + 6], 'little')).value
            pb  = ctypes.c_int16(int.from_bytes(rom_data[off + 6:off + 8], 'little')).value
            pc  = ctypes.c_int16(int.from_bytes(rom_data[off + 8:off + 10], 'little')).value
            pd  = ctypes.c_int16(int.from_bytes(rom_data[off + 10:off + 12], 'little')).value
            PREFIX = "ANIM_SPRITE_AFFIN"
            print(f"    {PREFIX} {cnt}, {hex(pa)}, {hex(pb)}, {hex(pc)}, {hex(pd)}")
            off = off + 12
            continue

        if _0 != 0:
            print(f"@ [ERROR]: at hex{off}!")

        PREFIX = "ANIM_SPRITE"

        OAM0 = f"0x{oam0:04X}"
        if (oam0 & (3 << 14)) == (0 << 14):
            OAM0 = "ATTR0_SQUARE"
        if (oam0 & (3 << 14)) == (1 << 14):
            OAM0 = "ATTR0_WIDE"
        if (oam0 & (3 << 14)) == (2 << 14):
            OAM0 = "ATTR0_TALL"

        if oam0 & (1 << 8):
            OAM0 = OAM0 + " + OBJ_ROT_SCALE_ON"
        if oam0 & (1 << 9):
            OAM0 = OAM0 + " + OBJ_DISABLE"

        if oam0 & (1 << 10):
            OAM0 = OAM0 + " + OBJ_MODE_1"
        if oam0 & (2 << 10):
            OAM0 = OAM0 + " + OBJ_MODE_2"
        if oam0 & (3 << 10):
            OAM0 = OAM0 + " + OBJ_MODE_3"

        if oam1 & (1 << 12): # ATTR1_FLIP_X
            PREFIX = "ANIM_SPRITE_XFLIP"
            oam1 = oam1 & ~(1 << 12)

        OAM1 = f"0x{oam1:04X}"
        if oam1 == (0 << 14):
            OAM1 = "ATTR1_SIZE_8"
        if  oam1 == (1 << 14):
            OAM1 = "ATTR1_SIZE_16"
        if  oam1 == (2 << 14):
            OAM1 = "ATTR1_SIZE_32"
        if  oam1 == (3 << 14):
            OAM1 = "ATTR1_SIZE_64"

        OAM2 = f"0x{oam2:04X}"

        off = off + 12

        # end
        if oam0 == 1:
            if oam1 != 0 or oam2 != 0 or x != 0 or y != 0:
                print(f"@ [ERROR]: at hex{off}!")

            print("    ANIM_SPRITE_END")
            break;

        print(f"    {PREFIX} {OAM0}, {OAM1}, {OAM2}, {x}, {y}")

    return off


def main(args):
    rom = "baserom.gba"
    elf = "fireemblem8u.elf"

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

    index = 77

    PreName = None
    PreName = "EkrBaseKaiten"

    with open(rom, 'rb') as f:
        rom_data = f.read()

        while True:
            if PreName != None:
                name = f"AnimSprite_{PreName}_{index}"
            else:
                name = f"AnimSprite_{off + 0x08000000:08X}"

            print(f".global {name}")
            print(f"{name}:  @ 0x{off:06X}")
            off = dump_one_part(rom_data, off)
            print("")
            index = index + 1

            if off_end <= off:
                break

        print(f"@ End at: 0x{off + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv)
