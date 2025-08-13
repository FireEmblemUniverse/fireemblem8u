#!/usr/bin/env python3

import sys
from dump_img import dump_img

rom = "baserom.gba"
IMGs = 0x085d7c90
TSAs = 0x085d7c70
PALs = 0x085d7cb0
LENGTH = 8
PREFIX = "graphics/efxdragon/DemonLightBg4_Close_"
WIDTH = 30
HEIGHT = 20

with open(rom, 'rb') as f:
    rom_data = f.read()

IMGs = IMGs & 0x00FFFFFF
TSAs = TSAs & 0x00FFFFFF
PALs = PALs & 0x00FFFFFF

for i in range(LENGTH):
    img_addr = int.from_bytes(rom_data[IMGs + 4 * i:IMGs + 4 * i + 4], 'little')
    tsa_addr = int.from_bytes(rom_data[TSAs + 4 * i:TSAs + 4 * i + 4], 'little')
    pal_addr = int.from_bytes(rom_data[PALs + 4 * i:PALs + 4 * i + 4], 'little')

    print(f"IMG 0x{img_addr:08X}, TSA 0x{tsa_addr:08X}, PAL 0x{pal_addr:08X}")
    dump_img(f"{PREFIX}{i + 1}", img_addr, tsa_addr, pal_addr, 30, 20)
