#!/usr/bin/env python3

import tool

table_address = 0x95DD1C
table_entries = 54

bgs = []
ptrs = {}

with open('../baserom.gba', 'rb') as f_rom:
    f_rom.seek(table_address)
    for i in range(table_entries):
        img = tool.read_pointer_here(f_rom)
        if img in ptrs:
            print(f'{ptrs[img]} == bg_{i}_tiles: {img:x}')
        else:
            ptrs[img] = f'bg_{i}_tiles'
        tsa = tool.read_pointer_here(f_rom)
        if tsa in ptrs:
            print(f'{ptrs[tsa]} == bg_{i}_map: {tsa:x}')
        else:
            ptrs[tsa] = f'bg_{i}_map'
        pal = tool.read_pointer_here(f_rom)
        if pal in ptrs:
            print(f'{ptrs[pal]} == bg_{i}_palette: {pal:x}')
        else:
            ptrs[pal] = f'bg_{i}_palette'
        bgs.append({'img': img, 'tsa': tsa, 'pal': pal})
    print(bgs)
    for i, bg in enumerate(bgs):
        tool.decomp_image(f_rom,
                            name=f'out/bg_{i}',
                            offset_img=bg['img'],
                            offset_map=bg['tsa'],
                            offset_pal=bg['pal'],
                            pal_number=8)

with open('../data/data_bg.s', 'w') as f:
    f.write('\t.section .data\n')
    for ptr in sorted(ptrs.keys()):
        label = ptrs[ptr]
        filename = label.replace('_tiles', '_tiles.4bpp.lz').replace('_map', '.bin').replace('_palette', '.gbapal')
        f.writelines(['\n\t.align 2, 0\n',
                        f'\t.global {label}\n',
                        f'{label}:\n',
                        f'\t.incbin "graphics/bg/{filename}"\n',])

with open('../include/bg.h', 'w') as f:
    for ptr in sorted(ptrs.keys()):
        f.write(f'extern unsigned char {ptrs[ptr]}[];\n')

with open('../src/ectscr_.c', 'a') as f:
    f.write('\nstruct CONST_DATA gfx_set gConvoBackgroundData[] = {\n')
    for i in range(table_entries):
        f.write(f"\t{{{ptrs[bgs[i]['img']]}, {ptrs[bgs[i]['tsa']]}, {ptrs[bgs[i]['pal']]}}},\n")
    f.write('};\n')
