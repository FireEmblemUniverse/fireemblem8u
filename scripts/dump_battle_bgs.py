#!/usr/bin/env python3

import tool

table_address = 0x75A794
table_entries = 69

bgs = []
ptrs = {}

with open('../baserom.gba', 'rb') as f_rom:
    f_rom.seek(table_address)
    for i in range(table_entries):
        img = tool.read_pointer_here(f_rom)
        if img in ptrs:
            print(f'{ptrs[img]} == btl_bg_{i}_tiles: {img:x}')
        else:
            ptrs[img] = f'btl_bg_{i}_tiles'
        tsa = tool.read_pointer_here(f_rom)
        if tsa in ptrs:
            print(f'{ptrs[tsa]} == btl_bg_{i}_map: {tsa:x}')
        else:
            ptrs[tsa] = f'btl_bg_{i}_map'
        pal = tool.read_pointer_here(f_rom)
        if pal in ptrs:
            print(f'{ptrs[pal]} == btl_bg_{i}_palette: {pal:x}')
        else:
            ptrs[pal] = f'btl_bg_{i}_palette'
        bgs.append({'img': img, 'tsa': tsa, 'pal': pal})
    for i in range(table_entries):
        if ptrs[bgs[i]['img']] == f'btl_bg_{i}_tiles':
            tool.decomp_image(f_rom, bgs[i]['img'], width=1, name=f'out/btl_bg_{i}')
        if ptrs[bgs[i]['tsa']] == f'btl_bg_{i}_map':
            tool.dump_map(f_rom, bgs[i]['tsa'], comp_type=tool.lz77, name=f'out/btl_bg_{i}')
        if ptrs[bgs[i]['pal']] == f'btl_bg_{i}_palette':
            tool.dump_palette(f_rom, bgs[i]['pal'], comp_type=tool.lz77, name=f'out/btl_bg_{i}')

with open('../data/data_btl_bg.s', 'w') as f:
    f.write('\t.section .data\n')
    for i in range(table_entries):
        f.write(f"\t.word {ptrs[bgs[i]['img']]}, {ptrs[bgs[i]['tsa']]}, {ptrs[bgs[i]['pal']]}\n")
    for ptr in sorted(ptrs.keys()):
        label = ptrs[ptr]
        filename = label.replace('_tiles', '.4bpp.lz').replace('_map', '.bin.lz').replace('_palette', '.gbapal.lz')
        f.writelines(['\n\t.align 2, 0\n',
                        f'\t.global {label}\n',
                        f'{label}: @{ptr:x}\n',
                        f'\t.incbin "graphics/btl_bg/{filename}"\n',])
