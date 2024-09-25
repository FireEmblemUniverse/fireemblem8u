#!/bin/python3

import sys
from dump_img import dump_img

rom = "baserom.gba"
ImgLut_EfxSkill = 0x5d9370
TsaLut_EfxSkill = 0x5d9330
PalLut_EfxSkill = 0x5d93b0

with open(rom, 'rb') as f:
    rom_data = f.read()

for i in range(11, 16):
    img_addr = int.from_bytes(rom_data[ImgLut_EfxSkill + 4 * i:ImgLut_EfxSkill + 4 * i + 4], 'little')
    tsa_addr = int.from_bytes(rom_data[TsaLut_EfxSkill + 4 * i:TsaLut_EfxSkill + 4 * i + 4], 'little')
    pal_addr = int.from_bytes(rom_data[PalLut_EfxSkill + 4 * i:PalLut_EfxSkill + 4 * i + 4], 'little')

    print(f"IMG 0x{img_addr:08X}, TSA 0x{tsa_addr:08X}, PAL 0x{pal_addr:08X}")
    dump_img(f"graphics/efxskill/efxskill_{i + 1}", img_addr, tsa_addr, pal_addr, 30, 20)
