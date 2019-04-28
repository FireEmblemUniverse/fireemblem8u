#!/usr/bin/python3

# dump battle animation pointers and data pointed
# by laqieer
# 2019/4/27

import tool
import struct
from collections import Counter
import json

banim_table = []
offset_dict = {}

banim_mode_name = ['attack_close',
                   'attack_close_back',
                   'attack_close_critical',
                   'attack_close_critical_back',
                   'attack_range',
                   'attack_range_critical',
                   'dodge_close',
                   'dodge_range',
                   'stand_close',
                   'stand',
                   'stand_range',
                   'attack_miss']

def read_banim_pointer_table(fp):
    for p in range(0xC00008, 0xC01928, 0x20):
        fp.seek(p)
        abbr = fp.read(12).decode()
        modes = tool.read_offset_here(fp)
        script = tool.read_offset_here(fp)
        oam_r = tool.read_offset_here(fp)
        oam_l = tool.read_offset_here(fp)
        pal = tool.read_offset_here(fp)
        banim_table.append({'abbr': abbr,
            'modes': modes,
            'script': script,
            'oam_r': oam_r,
            'oam_l': oam_l,
            'pal': pal})
        offset_dict[modes] = {'banim_id': p, 'type': 'modes'}
    # abbr may be duplicate, so add number suffix
    counts = Counter(banim_table)
    for s,num in counts.items():
        if num > 1:
            for suffix in range(1, num + 1):
                banim_table[banim_table.index(s)] = s + '_' + str(suffix)

def dump_raw_binary(fp):
    for i, banim in banim_table:
        abbr = banim['abbr']
        modes = banim['modes']
        script = banim['script']
        oam_r = banim['oam_r']
        oam_l = banim['oam_l']
        pal = banim['pal']
        fp.seek(modes)
        with open('out/banim_' + abbr + '_modes.bin', 'wb') as f_modes:
            f_modes.write(fp.read(96))
        with open('out/banim_' + abbr + '_script.lz', 'wb') as f_script:
            data_script = tool.CompData(fp, offset=script, comp_type=tool.lz77)
            data_script.write_comp_data(f_script)
        tool.decomp_file('banim_' + abbr + '_script.lz',
                         'banim_' + abbr + '_script.bin')
        with open('out/banim_' + abbr + '_oam_r.lz', 'wb') as f_oam_r:
            data_oam_r = tool.CompData(fp, offset=oam_r, comp_type=tool.lz77)
            data_oam_r.write_comp_data(f_oam_r)
        tool.decomp_file('banim_' + abbr + '_oam_r.lz',
                         'banim_' + abbr + '_oam_r.bin')
        with open('out/banim_' + abbr + '_oam_l.lz', 'wb') as f_oam_l:
            data_oam_l = tool.CompData(fp, offset=oam_l, comp_type=tool.lz77)
            data_oam_l.write_comp_data(f_oam_l)
        tool.decomp_file('banim_' + abbr + '_oam_l.lz',
                         'banim_' + abbr + '_oam_l.bin')
        with open('out/banim_' + abbr + '_pal.lz', 'wb') as f_pal:
            data_pal = tool.CompData(fp, offset=pal, comp_type=tool.lz77)
            data_pal.write_comp_data(f_pal)
        tool.decomp_file('banim_' + abbr + '_pal.lz',
                         'banim_' + abbr + '_pal.bin')

def parse_banim_script(abbr):
    with open('out/banim_' + abbr + '_modes.bin', 'rb') as f_modes:
        offset_modes = struct.unpack('<12I', f_modes.read(4 * 12))
    with open('out/banim_' + abbr + '_script.bin', 'rb') as f_bin, \
        open('out/banim_' + abbr + '_script.s', 'w') as f_asm:
        s = ['\t.section .data\nbanim_%s_script:\n' % abbr]
        codes = f_bin.read()
        code_number = len(codes) // 4
        codes = struct.unpack('<%dI' % code_number, codes)
        for i, code in enumerate(codes):
            if 4 * i in offset_modes:
                s += 'banim_%s_mode_%s:\n' % (
                    abbr, banim_mode_name[offset_modes.index(4 * i)])
            pass
    pass


def main():
    with open('../include/banim.inc', 'r') as f_macro:
        code_dict = tool.read_asm_macro(f_macro)
    with open('banim_codes.json', 'w') as f_dict:
        json.dump(code_dict, f_dict)
#    with open('../baserom.gba', 'rb') as f_rom:
#        read_banim_pointer_table(f_rom)
    pass

if __name__ == '__main__':
    main()
