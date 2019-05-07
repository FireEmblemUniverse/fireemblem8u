#!/usr/bin/env python3

# dump battle animation terrain image (tileset and palette)

# EE0000: entry number
# EE0004: data block total size
# EE0008: pointer table (12-byte-length string + 2 pointers
# EE0C00: data area

import struct
import tool
import os

rom = '../baserom.gba'

address = 0xEE0000
offset = 0xC00

def read_block_header(f_rom):
    f_rom.seek(address)
    return struct.unpack('<2I', f_rom.read(8))

def dump_pointer_table(f_rom, number):
    addr_dict = {}
    name_dict = {}
    f_rom.seek(address + 8)
    with open('out/banim_terrain_data.c', 'w') as f_c, \
        open('out/banim_terrain_pointer.h', 'w') as f_h:
        for i in range(number):
            abbr = f_rom.read(12).decode()
            while abbr[-1] == '\0':
                abbr = abbr[:-1]
            p_tileset, p_palette = struct.unpack('<2I', f_rom.read(8))
            f_rom.read(4)
            addr_tileset = p_tileset - 0x8000000
            addr_palette = p_palette - 0x8000000
            if addr_palette in addr_dict:
                name_palette = addr_dict[addr_palette]
            else:
                name_palette = 'battle_terrain_{}_pal'.format(abbr)
                if name_palette in name_dict:
                    name_dict[name_palette] += 1
                    name_palette = '%s_%d' % (
                        name_palette, name_dict[name_palette])
                else:
                    name_dict[name_palette] = 1
                addr_dict[addr_palette] = name_palette
                f_h.write('extern short {}[];\n'.format(name_palette))
            if addr_tileset in addr_dict:
                name_tileset = addr_dict[addr_tileset][0]
            else:
                name_tileset = 'battle_terrain_{}_tileset'.format(abbr)
                if name_tileset in name_dict:
                    name_dict[name_tileset] += 1
                    name_tileset = '%s_%d' % (
                        name_tileset, name_dict[name_tileset])
                else:
                    name_dict[name_tileset] = 1
                addr_dict[addr_tileset] = (name_tileset, name_palette)
                f_h.write('extern char {}[];\n'.format(name_tileset))
            f_c.write('\t{"%s", %s, %s, 0}, // %d\n' % (
                abbr, name_tileset, name_palette, i))
    return addr_dict

def dump_tileset_image(f_rom, addr_dict, size):
    with open('out/data_banim_terrain.s', 'w') as f_s:
        f_s.write('\t.section .data\n')
        for addr, name in sorted(addr_dict.items(), key=lambda x:x[0]):
            if addr >= address + offset and addr <= address + size:
                if type(name) is not str:
                    data = tool.CompData(f_rom, addr)
                    with open('out/%s.4bpp' % name[0], 'wb') as f:
                        data.write_uncomp_data(f)
                    if os.path.exists('out/%s.gbapal' % name[1]):
                        tool.save_image('out/%s.4bpp' % name[0],
                                        palfile='out/%s.gbapal' % name[1])
                    else:
                        tool.save_image('out/%s.4bpp' % name[0])
                    f_s.write('\t.global {0}\n{0}:\n\
\t.incbin "graphics/banim/terrain/{0}.4bpp.lz"\n\
\t.align 2, 0\n'.format(name[0]))
                else:
                    f_rom.seek(addr)
                    with open('out/%s.gbapal' % name, 'wb') as f:
                        f.write(f_rom.read(32))
                    f_s.write('\t.global {0}\n{0}:\n\
\t.incbin "graphics/banim/terrain/{0}.agbpal"\n\
\t.align 2, 0\n'.format(name))
            else:
                print('%X(%s): Out of range\n' % (addr, name))

def main():
    with open(rom, 'rb') as f_rom:
        print('------reading data block header---------\n')
        number, size = read_block_header(f_rom)
        print('Number: {}\nSize: {}\n'.format(number, size))
        print('------dumping data pointer table--------\n')
        addr_dict = dump_pointer_table(f_rom, number)
        print('------dumping tileset and palette-------\n')
        dump_tileset_image(f_rom, addr_dict, size)
        dump_tileset_image(f_rom, addr_dict, size)
        os.system("rename 's/\.gbapal/\.agbpal/' out/*")

if __name__ == "__main__":
    main()
