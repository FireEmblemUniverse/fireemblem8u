#!/usr/bin/python3

import sys

def read_int(f, count, signed = False):
    return int.from_bytes(f.read(count), byteorder = 'little', signed = signed)

SHAPE_LUT = {
    0x00: "8x8",
    0x01: "16x8",
    0x02: "8x16",
    0x10: "16x16",
    0x11: "32x8",
    0x12: "8x32",
    0x20: "32x32",
    0x21: "32x16",
    0x22: "16x32",
    0x30: "64x64",
    0x31: "64x32",
    0x32: "32x64"}

def get_shape(oam0, oam1):
    lut_value = (oam0 >> 14) + ((oam1 >> 14) << 4)
    return SHAPE_LUT[lut_value]

def pretty_oam0(oam0, affine, shape):
    components = []

    components.append("OAM0_SHAPE_{}".format(shape))

    if oam0 & 0x00FF != 0:
        components.append("OAM0_Y({})".format(oam0 & 0x00FF))

    if oam0 & 0x0100 != 0:
        components.append("OAM0_AFFINE_ENABLE")

    if oam0 & 0x0200 != 0:
        if affine:
            components.append("OAM0_DOUBLESIZE")

        else:
            components.append("OAM0_DISABLE")

    if oam0 & 0x0400 != 0:
        components.append("OAM0_BLEND")

    if oam0 & 0x0800 != 0:
        components.append("OAM0_WINDOW")

    if oam0 & 0x1000 != 0:
        components.append("OAM0_MOSAIC")

    if oam0 & 0x2000 != 0:
        components.append("OAM0_256COLORS")

    return ' + '.join(components)

def pretty_oam1(oam1, affine, shape):
    components = []

    components.append("OAM1_SIZE_{}".format(shape))

    if oam1 & 0x01FF != 0:
        components.append("OAM1_X({})".format(oam1 & 0x01FF))

    if affine:
        if oam1 & 0x3E00 != 0:
            components.append("OAM1_AFFINE_ID({})".format((oam1 & 0x3E00) >> 9))

    else:
        if oam1 & 0x1000 != 0:
            components.append("OAM1_HFLIP")

        if oam1 & 0x2000 != 0:
            components.append("OAM1_VFLIP")

    return ' + '.join(components)

def pretty_oam2(oam2):
    components = []

    if oam2 & 0x03FF != 0:
        components.append("OAM2_CHR(0x{:X})".format(oam2 & 0x03FF))

    if oam2 & 0x0C00 != 0:
        components.append("OAM2_LAYER({})".format((oam2 & 0x0C00) >> 10))

    if oam2 & 0xF000 != 0:
        components.append("OAM2_PAL({})".format((oam2 & 0xF000) >> 12))

    return ' + '.join(components) if len(components) > 0 else "0"

def main(args):
    try:
        rom = args[0]
        sprite_offset = int(args[1], base=0) & 0x1FFFFFF

    except IndexError:
        sys.exit("Usage: {} ROM OFFSET".format(sys.argv[0]))

    with open(rom, 'rb') as f:
        name = f"Sprite_{sprite_offset + 0x08000000:08X}"

        f.seek(sprite_offset)

        print(f"u16 CONST_DATA {name}[] =")
        print("{")

        num_oam = read_int(f, 2)

        print("    {},".format(num_oam))

        for _ in range(num_oam):
            oam0 = read_int(f, 2)
            oam1 = read_int(f, 2)
            oam2 = read_int(f, 2)

            affine = oam0 & 0x0100 != 0
            shape = get_shape(oam0, oam1)

            print("    {}, {}, {},".format(
                pretty_oam0(oam0, affine, shape),
                pretty_oam1(oam1, affine, shape),
                pretty_oam2(oam2)))

        print("};")

        print(f"// end at {sprite_offset + 2 + 6 * num_oam + 0x08000000:08X}")

if __name__ == '__main__':
    main(sys.argv[1:])
