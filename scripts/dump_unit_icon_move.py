#!/usr/bin/env python3

# dump moving map sprite

import os
import struct
import tool

pointers = {}

rom = "../baserom.gba"

table_addr = 0x9A2E00
# end: 0x9A31F8
entry_number = 127

gas = 'arm-none-eabi-as'
objcopy = 'arm-none-eabi-objcopy'

def dump_unit_icon_move_table():
    global pointers
    with open(rom, 'rb') as f_rom, \
        open('out/unit_icon_move_data.txt', 'w') as f_c:
        f_rom.seek(table_addr)
        for i in range(entry_number):
            pSheet, pMotion = struct.unpack('<2I', f_rom.read(8))
            if pSheet in pointers:
                pSheetName = pointers[pSheet]
            else:
                pSheetName = 'unit_icon_move_%d_sheet' % i
                pointers[pSheet] = pSheetName
            if pMotion in pointers:
                pMotionName = pointers[pMotion]
            else:
                pMotionName = 'unit_icon_move_%d_motion' % i
                pointers[pMotion] = pMotionName
            f_c.write('\t{{{}, {}}}, // {}\n'.format(
                pSheetName, pMotionName, i))

def dump_move_animation():
    with open(rom, 'rb') as f_rom, \
        open('out/unit_icon_move_pointer.h', 'w') as f_h, \
        open('out/unit_icon_move_makefile.mk', 'w') as f_m, \
        open('out/const_data_unit_icon_move.s', 'w') as f_s:
        f_s.write('\t.section .rodata\n')
        f_m.write('MOVEUNITGFXDIR := graphics/unit_icon/move\n\n')
        f_m.write('### Move Unit Icon Animation Sheets ###\n\n')
        p_name_pair = sorted(pointers.items(), key=lambda x: x[0])
        i = 0
        for p, name in p_name_pair:
            f_h.write('extern char {}[];\n'.format(name))
            i += 1
            p -= 0x8000000
            f_s.write('\n')
            if name.endswith('sheet'):
                f_s.write('\t.global {0}\n{0}:\n\t.incbin "\
graphics/unit_icon/move/{0}.4bpp.lz"\n\
\t.align 2, 0\n'.format(name))
                data = tool.CompData(f_rom, p)
                with open('out/{}.4bpp'.format(name), 'wb') as f:
                    data.write_uncomp_data(f)
                tool.save_image('out/{}.4bpp'.format(name), width=4,
                                palfile='out/unit_icon.gbapal')
                if data.size != 0x1E00:
                    tiles = data.size // 32
                    f_m.write('$(MOVEUNITGFXDIR)/{}.4bpp: %.4bpp: %.png\n\
\t$(GBAGFX) $< $@ -num_tiles {}\n\n'.format(name, tiles))
            else:
                if i >= len(p_name_pair):
                    p_next = 0x205700 # end address
                else:
                    p_next = p_name_pair[i][0] - 0x8000000
                f_rom.seek(p)
                with open('out/{}.bin'.format(name), 'wb') as f:
                    f.write(f_rom.read(p_next - p))
                '''
                # need original apdump.py
                os.system('echo ".section .rodata" > out/{}.s'.format(name))
                os.system('echo ".global {0}" >> out/{0}.s'.format(name))
                os.system('echo "{0}:" >> out/{0}.s'.format(name))
                os.system('./apdump.py out/{0}.bin >> out/{0}.s'.format(name))
                os.system('echo ".align 2, 0" >> out/{0}.s'.format(name))
                # assemble, compare to check matching
                os.system('{1} out/{0}.s -o out/{0}.o'.format(name, gas))
                os.system('{1} -O binary out/{0}.o out/{0}_as.bin'.format(
                    name, objcopy))
                os.system('cmp out/{0}.bin out/{0}_as.bin'.format(name))
                '''
                # merge into const_data_unit_icon_move.s
                f_s.write('\t.global {0}\n'.format(name))
                f_s.writelines(os.popen(
                    './apdump.py out/{}.bin {}'.format(
                        name, name.replace('motion', ''))).readlines())
                f_s.write('\t.align 2, 0\n')

def main():
    dump_unit_icon_move_table()
    dump_move_animation()
    pass

if __name__ == "__main__":
    main()
