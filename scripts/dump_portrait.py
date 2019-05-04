#!/usr/bin/env python3

import os
import tool
import struct

name_list = []
address_list = [None] * 0x8ACBE0

def read_portrait_name_list():
    global name_list
    with open('portrait_name_list.txt', 'r') as f:
        name_list = f.read().splitlines()

def handle_pointer(fp, addr, name):
    if addr > 0x8000000:
        addr -= 0x8000000
    if addr == 0:
        fp.write('0')
    elif address_list[addr] is not None:
        fp.write(address_list[addr])
    else:
        address_list[addr] = name
        fp.write(name)
    fp.write(', ')

def dump_portrait_table():
    global name_list
    global address_list
    with open('../baserom.gba', 'rb') as f_rom, \
        open('out/portrait_data.txt', 'w') as f_out:
        f_rom.seek(0x8ACBE0)
        for i in range(172):
            tileset, chibi, palette, mouth, card, \
                x_mouth, y_mouth, x_eye, y_eye, eye_status = struct.unpack(
                    '<5I4bI', f_rom.read(28))
            if eye_status == 1:
                eye_status = 'EYE_STATE_NORMAL'
            elif eye_status == 6:
                eye_status = 'EYE_STATE_CLOSED'
            name = 'portrait_' + name_list[i]
            f_out.write('\t{')
            handle_pointer(f_out, tileset, name + '_tileset')
            handle_pointer(f_out, chibi, name + '_chibi')
            handle_pointer(f_out, palette, name + '_palette')
            handle_pointer(f_out, mouth, name + '_mouth')
            handle_pointer(f_out, card, name + '_card')
            f_out.write('{}, {}, {}, {}, {}}}, // {}\n'.format(
                x_mouth, y_mouth, x_eye, y_eye, eye_status, i))
    pass

def dump_portrait_image_and_palette():
    global address_list
    with open('../baserom.gba', 'rb') as f_rom, \
        open('out/data_portrait.s', 'w') as f_out, \
        open('out/portrait_data.h', 'w') as f_header:
        for addr in range(len(address_list)):
            if address_list[addr] is not None:
#               print('0x%X: %s' % (addr, address_list[addr]))
                f_out.write(
                    '\t.global {0}\n{0}:\n\t.incbin "graphics/portrait/{0}'.format(
                        address_list[addr]))
                if address_list[addr].endswith('palette'):
                    with open('out/%s.gbapal' % address_list[addr], 'wb') as f:
                        f_rom.seek(addr)
                        f.write(f_rom.read(32))
                    f_out.write('.agbpal')
                    f_header.write('extern unsigned short %s[];\n' %
                                   address_list[addr])
                elif address_list[addr].endswith('mouth'):
                    with open('out/%s.4bpp' % address_list[addr], 'wb') as f:
                        f_rom.seek(addr)
                        f.write(f_rom.read(1536))
                    palfile = 'out/' + address_list[addr].replace(
                        'mouth', 'palette') + '.gbapal'
                    if not os.path.exists(palfile):
                        palfile = None
                    tool.save_image('out/%s.4bpp' % address_list[addr],
                                    width=4, palfile=palfile)
                    f_out.write('.4bpp')
                    f_header.write('extern unsigned char %s[];\n' %
                                   address_list[addr])
                else:
                    data = tool.CompData(f_rom, addr)
                    with open('out/%s.4bpp' % address_list[addr], 'wb') as f:
                        data.write_uncomp_data(f)
                    if address_list[addr].endswith('tileset'):
                        width = 32
                        palfile = 'out/' + address_list[addr].replace(
                            'tileset', 'palette') + '.gbapal'
                        f_out.write('.4bpp.fk')
                    elif address_list[addr].endswith('chibi'):
                        width = 4
                        palfile = 'out/' + address_list[addr].replace(
                            'chibi', 'palette') + '.gbapal'
                        f_out.write('.4bpp.lz')
                    else: # card
                        width = 10
                        palfile = 'out/' + address_list[addr].replace(
                            'card', 'palette') + '.gbapal'
                        f_out.write('.4bpp.lz')
                    if not os.path.exists(palfile):
                        palfile = None
                    tool.save_image('out/%s.4bpp' % address_list[addr],
                                    width=width, palfile=palfile)
                    f_header.write('extern unsigned char %s[];\n' %
                                   address_list[addr])
                f_out.write('"\n\t.align 2, 0\n')
    pass

def main():
    read_portrait_name_list()
    dump_portrait_table()
    dump_portrait_image_and_palette()
    pass

if __name__ == "__main__":
    main()
