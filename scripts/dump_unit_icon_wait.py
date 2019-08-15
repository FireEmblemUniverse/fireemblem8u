#!/usr/bin/env python3

# dump standing map sprite

import struct
import tool

icon_size = ('UNIT_ICON_SIZE_16x16',
             'UNIT_ICON_SIZE_16x32',
             'UNIT_ICON_SIZE_32x32')

pointers = {}

rom = "../baserom.gba"

palette_addr = 0x59EE20
table_addr = 0x8AF880
entry_number = 107

def dump_unit_icon_palette():
    with open(rom, 'rb') as f_rom, \
        open('out/unit_icon_palette.agbpal', 'wb') as f_pals, \
        open('out/unit_icon.gbapal', 'wb') as f_pal:
        f_rom.seek(palette_addr)
        pal = f_rom.read(32 * 5)
        f_pals.write(pal)
        f_pal.write(pal[:32])

def dump_unit_icon_table():
    global pointers
    with open(rom, 'rb') as f_rom, \
        open('out/unit_icon_wait_data.txt', 'w') as f_c:
        f_rom.seek(table_addr)
        for i in range(entry_number):
            pattern, size, pSheet = struct.unpack('<2hI', f_rom.read(8))
            if size < 3:
                size = icon_size[size]
            if pSheet in pointers:
                pSheetName = pointers[pSheet]
            else:
                pSheetName = 'unit_icon_wait_%d_sheet' % i
                pointers[pSheet] = pSheetName
            f_c.write('\t{{{}, {}, {}}}, // {}\n'.format(
                pattern, size, pSheetName, i))

def dump_animation_sheet():
    with open(rom, 'rb') as f_rom, \
        open('out/unit_icon_wait_pointer.h', 'w') as f_h, \
        open('out/const_data_unit_icon_wait.s', 'w') as f_s:
        f_s.write('\t.section .rodata\n')
        for p, name in sorted(pointers.items(), key=lambda x: x[0]):
            f_h.write('extern char {}[];\n'.format(name))
            p -= 0x8000000
            f_s.write('\t.global {0}\n{0}:\n\t.incbin "\
graphics/unit_icon/wait/{0}.4bpp.lz"\n\
\t.align 2, 0\n'.format(name))
            f_rom.seek(p + 1)
            if struct.unpack('<H', f_rom.read(2))[0] == 0x600:
                width = 32 / 8
            else:
                width = 16 / 8
            data = tool.CompData(f_rom, p)
            with open('out/{}.4bpp'.format(name), 'wb') as f:
                data.write_uncomp_data(f)
            tool.save_image('out/{}.4bpp'.format(name), width=width,
                            palfile='out/unit_icon.gbapal')

def main():
    dump_unit_icon_palette()
    dump_unit_icon_table()
    dump_animation_sheet()
    pass

if __name__ == "__main__":
    main()
