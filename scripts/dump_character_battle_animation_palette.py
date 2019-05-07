#!/usr/bin/env python3

# dump character specific battle animation palette set
# each has 5 palette: player, enemy, npc, p4, dependent

# EF8000: entry number
# EF8004: data block total size
# EF8008: pointer table (12-byte-length string + 1 pointer to compressed data)
# EF9000: compressed data area

import struct
import tool

rom = '../baserom.gba'

address = 0xEF8000
offset = 0x1000

def read_block_header(f_rom):
    f_rom.seek(address)
    return struct.unpack('<2I', f_rom.read(8))

def dump_pointer_table(f_rom, number):
    addr_dict = {}
    name_dict = {}
    f_rom.seek(address + 8)
    with open('out/banim_pal_chara.c', 'w') as f_c, \
        open('out/banim_pal_chara_pointer.h', 'w') as f_h:
        for i in range(number):
            abbr = f_rom.read(12).decode()[:3]
            pointer = struct.unpack('<I', f_rom.read(4))[0]
            addr = pointer - 0x8000000
            if addr in addr_dict:
                name = addr_dict[addr]
            else:
                name = 'banim_pal_{}'.format(abbr)
                if name in name_dict:
                    name_dict[name] += 1
                    name = '%s_%d' % (name, name_dict[name])
                else:
                    name_dict[name] = 1
                addr_dict[addr] = name
                f_h.write('extern char {}[];\n'.format(name))
            f_c.write('\t{"%s", %s}, // %d\n' % (abbr, name, i))
    return addr_dict

def dump_compressed_data(f_rom, addr_dict, size):
    with open('out/data_banim_pal.s', 'w') as f_s:
        f_s.write('\t.section .data\n')
        for addr, name in sorted(addr_dict.items(), key=lambda x:x[0]):
            if addr >= address + offset and addr <= address + size:
                data = tool.CompData(f_rom, addr)
                with open('out/%s.agbpal' % name, 'wb') as f:
                    data.write_uncomp_data(f)
                    f_s.write('\t.global {0}\n{0}:\n\
\t.incbin "graphics/banim/character_palette/{0}.agbpal.lz"\n\
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
        print('------dumping compressed data----------\n')
        dump_compressed_data(f_rom, addr_dict, size)

if __name__ == "__main__":
    main()
