#!/usr/bin/env python3

# dump chapter title images

import struct
import tool

rom = '../baserom.gba'

addr_ptr_table = 0xA01208
num_entry = 88
# end: 0xA01628

images = {0xA10FE0: 'chap_title_blank'}

# according to sub_80895B4, 2 palette set: 8A07C58 & 8A07AD8, only select one
# here to make dumped images colorful
addr_palette = 0xA07C58

def dump_palette():
    with open(rom, 'rb') as f_rom, open('out/chap_title.gbapal', 'wb') as f_pal:
        f_rom.seek(addr_palette)
        f_pal.write(f_rom.read(32))

def dump_pointer_table():
    global images
    with open(rom, 'rb') as f_rom, open('out/chap_title_data.c', 'w') as f_c, \
        open('out/chap_title_pointer.h', 'w') as f_h:
        f_c.write('// Chapter title image pointer table\n')
        f_c.write('#include "chap_title.h"\n')
        f_c.write('ChapTitle chap_title_data[] = {\n')
        f_rom.seek(addr_ptr_table)
        for i in range(num_entry):
            addr_image = struct.unpack('<I', f_rom.read(4))[0] - 0x8000000
            if addr_image in images:
                name_image = images[addr_image]
            else:
                name_image = 'chap_title_{}'.format(i)
                images[addr_image] = name_image
                f_h.write('extern char {}[];\n'.format(name_image))
            f_c.write('\t{{{}, 0, 0}}, // {}\n'.format(name_image, i))
            f_rom.read(8)
        f_c.write('};\n')
    pass

def dump_images():
    with open(rom, 'rb') as f_rom, open('out/data_chap_title.s', 'w') as f_s:
        f_s.write('\t.section .data\n')
        for addr, label in sorted(images.items(), key=lambda x:x[0]):
            f_s.write('\t.global {0}\n{0}:\n\
\t.incbin "graphics/chap_title/{0}.4bpp.lz"\n\t.align 2, 0\n'.format(label))
            data = tool.CompData(f_rom, addr)
            with open('out/' + label + '.4bpp', 'wb') as f:
                data.write_uncomp_data(f)
            tool.save_image('out/' + label + '.4bpp',
                            palfile='out/chap_title.gbapal')
    pass

def main():
    dump_palette()
    dump_pointer_table()
    dump_images()

if __name__ == '__main__':
    main()
