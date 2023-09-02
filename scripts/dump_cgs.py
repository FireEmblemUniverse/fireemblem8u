#!/usr/bin/env python3

import tool

table_address = 0xA3CCEC
table_entries = 10

cgs = []
ptrs = {}
imgs = []

with open('../baserom.gba', 'rb') as f_rom:
    f_rom.seek(table_address)
    for i in range(table_entries):
        img = tool.read_pointer_here(f_rom)
        ptrs[img] = f'cg_{i}_tiles'
        tsa = tool.read_pointer_here(f_rom)
        ptrs[tsa] = f'cg_{i}_map'
        pal = tool.read_pointer_here(f_rom)
        ptrs[pal] = f'cg_{i}_palette'
        cgs.append({'img': img, 'tsa': tsa, 'pal': pal})
    print(cgs)
    for i, cg in enumerate(cgs):
        f_rom.seek(cg['img'] - 0x8000000)
        img = []
        for j in range(10):
            x = tool.read_pointer_here(f_rom)
            ptrs[x] = f'cg_{i}_part_{j}_tiles'
            img.append(x)
        imgs.append(img)
    for i in range(table_entries):
        tool.dump_palette(f_rom, cgs[i]['pal'], None, 6 * 16, f'out/cg_{i}')
        tool.dump_map(f_rom, cgs[i]['tsa'], None, f'out/cg_{i}')
        for j in range(10):
            tool.decomp_image(f_rom, imgs[i][j], width=1, name=f'out/cg_{i}_part_{j}')

with open('../data/data_cg.s', 'w') as f:
    f.write('\t.section .data\n')
    for ptr in sorted(ptrs.keys()):
        label = ptrs[ptr]
        filename = label.replace('_tiles', '.4bpp.lz').replace('_map', '.bin').replace('_palette', '.gbapal')
        f.writelines(['\n\t.align 2, 0\n',
                        f'\t.global {label}\n',
                        f'{label}: @{ptr:x}\n',
                        f'\t.incbin "graphics/cg/{filename}"\n',])
