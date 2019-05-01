#!/usr/bin/python3

# dump battle animation pointers and data pointed
# by laqieer
# 2019/4/27

import tool
import struct
import json
import os

banim_table = []
offset_dict = {}
sheet_dict = {}

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
    abbr_times = {}
    animation_id = 0
    for p in range(0xC00008, 0xC01928, 0x20):
    # test
#    for p in range(0xC00008, 0xC00048, 0x20):
        fp.seek(p)
#        abbr = fp.read(12).decode().rstrip()
#        abbr = fp.read(12)[:8].decode()
        abbr = fp.read(12).decode()
        # remove 00 in the end
        while abbr[-1] == '\0':
            abbr = abbr[:-1]
        modes = tool.read_rom_offset_here(fp)
        script = tool.read_rom_offset_here(fp)
        oam_r = tool.read_rom_offset_here(fp)
        oam_l = tool.read_rom_offset_here(fp)
        pal = tool.read_rom_offset_here(fp)
        print('reading animation 0x%X: %s' % (animation_id, abbr))
        # abbr may be duplicate, so add number suffix
        if abbr in abbr_times:
            abbr_times[abbr] += 1
            abbr_new = '%s_%d' % (abbr, abbr_times[abbr])
        else:
            abbr_times[abbr] = 1
            abbr_new = abbr
        banim_table.append({'abbr': abbr_new,
            'abbr_original': abbr,
            'modes': modes,
            'script': script,
            'oam_r': oam_r,
            'oam_l': oam_l,
            'pal': pal})
        offset_dict[modes] = {'banim_id': animation_id, 'type': 'modes',
                              'name': 'banim_%s_modes' % abbr_new}
        offset_dict[script] = {'banim_id': animation_id, 'type': 'script',
                               'name': 'banim_%s_script_lz' % abbr_new}
        offset_dict[oam_r] = {'banim_id': animation_id, 'type': 'oam_r',
                              'name': 'banim_%s_oam_r_lz' % abbr_new}
        offset_dict[oam_l] = {'banim_id': animation_id, 'type': 'oam_l',
                              'name': 'banim_%s_oam_l_lz' % abbr_new}
        offset_dict[pal] = {'banim_id': animation_id, 'type': 'pal',
                            'name': 'banim_%s_pal_lz' % abbr_new}
        animation_id += 1

def dump_raw_binary(fp):
    for i, banim in enumerate(banim_table):
        abbr = banim['abbr']
        modes = banim['modes']
        script = banim['script']
        oam_r = banim['oam_r']
        oam_l = banim['oam_l']
        pal = banim['pal']
        fp.seek(modes)
        print('dumping animation 0x%X: %s' % (i, abbr))
        with open('out/banim_' + abbr + '_modes.bin', 'wb') as f_modes:
            f_modes.write(fp.read(96))
        with open('out/banim_' + abbr + '_script.bin.lz', 'wb') as f_script:
            data_script = tool.CompData(fp, offset=script, comp_type=tool.lz77)
            data_script.write_comp_data(f_script)
        tool.decomp_file('out/banim_' + abbr + '_script.bin.lz',
                         'out/banim_' + abbr + '_script.bin')
        with open('out/banim_' + abbr + '_oam_r.bin.lz', 'wb') as f_oam_r:
            data_oam_r = tool.CompData(fp, offset=oam_r, comp_type=tool.lz77)
            data_oam_r.write_comp_data(f_oam_r)
        tool.decomp_file('out/banim_' + abbr + '_oam_r.bin.lz',
                         'out/banim_' + abbr + '_oam_r.bin')
        with open('out/banim_' + abbr + '_oam_l.bin.lz', 'wb') as f_oam_l:
            data_oam_l = tool.CompData(fp, offset=oam_l, comp_type=tool.lz77)
            data_oam_l.write_comp_data(f_oam_l)
        tool.decomp_file('out/banim_' + abbr + '_oam_l.bin.lz',
                         'out/banim_' + abbr + '_oam_l.bin')
        with open('out/banim_' + abbr + '_pal.gbapal.lz', 'wb') as f_pal:
            data_pal = tool.CompData(fp, offset=pal, comp_type=tool.lz77)
            data_pal.write_comp_data(f_pal)
        tool.decomp_file('out/banim_' + abbr + '_pal.gbapal.lz',
                         'out/banim_' + abbr + '_pal.gbapal')
        # to dump sheet with palette
        with open('out/banim_' + abbr + '_pal.gbapal', 'rb') as f_pal, \
            open('out/banim_' + abbr + '_pal_player.gbapal', 'wb') as f_pal_1:
                f_pal_1.write(f_pal.read(32))

def parse_banim_script(animation_id, code_dict=None):
    abbr = banim_table[animation_id]['abbr']
    with open('out/banim_' + abbr + '_modes.bin', 'rb') as f_modes:
        offset_modes = struct.unpack('<12I', f_modes.read(4 * 12))
    offset_oam = {}
    with open('out/banim_' + abbr + '_script.bin', 'rb') as f_bin, \
        open('../baserom.gba', 'rb') as f_rom, \
        open('out/banim_' + abbr + '_script.s', 'w') as f_asm:
        f_asm.write('@ vim:ft=armv4\n')
        s = ['\t.section .data\nbanim_%s_script:\n' % abbr]
        codes = f_bin.read()
        code_number = len(codes) // 4
        codes = struct.unpack('<%dI' % code_number, codes)
        sheet_id = 0
        frame_id = 0
        for i, code in enumerate(codes):
            if 4 * i in offset_modes:
                s += 'banim_%s_mode_%s:\n' % (
                    abbr, banim_mode_name[offset_modes.index(4 * i)])
            if code_dict is not None and code in code_dict:
                s += '\t' + code_dict[code] + '\n'
            elif code >> 24 == 0x85:
                s += '\tbanim_code_85 0x%X\n' % (code & 0xFFFFFF)
            elif code >> 24 == 0x86:
                duration = code & 0xFFFF
                frame_number = (code >> 16) & 0xFF
                sheet_addr = codes[i + 1]
                sheet_offset = sheet_addr - 0x8000000
                if sheet_offset not in sheet_dict:
                    sheet_name = 'banim_%s_sheet_%d' % (abbr, sheet_id)
                    sheet_dict[sheet_offset] = sheet_name
                    # save sheet as image with player's palette
                    sheet_data = tool.CompData(f_rom, offset=sheet_offset)
                    with open('out/%s.4bpp.lz' % sheet_name, 'wb') as f_lz:
                        sheet_data.write_comp_data(f_lz)
                    tool.decomp_file('out/%s.4bpp.lz' % sheet_name,
                                     'out/%s.4bpp' % sheet_name)
                    tool.save_image('out/%s.4bpp' % sheet_name,
                                    palfile='out/banim_%s_pal_player.gbapal' % abbr)
                    offset_dict[sheet_offset] = {'name': sheet_name,
                                                 'type': 'sheet',
                                                 'banim_id': animation_id}
                    sheet_id += 1
                else:
                    sheet_name = sheet_dict[sheet_offset]
                oam_offset = codes[i + 2]
                if oam_offset in offset_oam:
                    oam_frame_id = offset_oam[oam_offset]
                else:
                    oam_frame_id = frame_id
                    offset_oam[oam_offset] = oam_frame_id
                    frame_id += 1
                oam_frame_name = 'banim_%s_oam_frame_%d_r' % (
                    abbr, oam_frame_id)
                oam_offset_name = '%s - banim_%s_oam_r' % (oam_frame_name, abbr)
                s += '\tbanim_code_frame %d, %s, %d, %s\n' % (
                    duration, sheet_name, frame_number, oam_offset_name)
            elif i >= 2 and codes[i - 2] >> 24 != 0x86 \
                and codes[i - 1] >> 24 != 0x86:
                s += '\t.word 0x%X\n' % code
        # export symbols
        s_head = '\t.global banim_%s_script\n' % abbr
        for mode in range(12):
            s_head += '\t.global banim_%s_mode_%s\n' % (
                abbr, banim_mode_name[mode])
        # external symbols
        s_head += '\t.include "../include/banim.inc"\n'
        f_asm.writelines(s_head)
        f_asm.writelines(s)
    banim_table[animation_id]['offset_oam'] = offset_oam

def make_headers():
    with open('out/banim_pointer.h', 'w') as f_ptr, \
        open('out/banim_data.c', 'w') as f_data, \
        open('out/banim_script.inc', 'w') as f_script, \
        open('out/banim_oam.inc', 'w') as f_oam:
        f_data.write('#include "banim_data.h"\n')
        f_data.write('__attribute__((section(".data.banim_array")))\n')
#        f_data.write('long long banim_number = %d;\n' % len(banim_table))
        # TODO another way is to pack length and array to a struct
        f_data.write('BattleAnim banim_data[] = {\n')
        f_ptr.write('#pragma once\n')
        f_script.write('@ vim:ft=armv4\n')
        for i, anim in enumerate(banim_table):
            abbr = anim['abbr']
            abbr_ori = anim['abbr_original']
            n_modes = 'banim_%s_modes' % abbr
            n_script = 'banim_%s_script' % abbr
            f_script.write('\t@ battle animation 0x%X\n' % i)
            f_script.write('\t.extern %s\n' % n_script)
            for mode in range(12):
                n_mode = 'banim_%s_mode_%s' % (abbr, banim_mode_name[mode])
                f_script.write('\t.extern %s\n' % n_mode)
            n_oam_r = 'banim_%s_oam_r' % abbr
            n_oam_l = 'banim_%s_oam_l' % abbr
            n_pal = 'banim_%s_pal' % abbr
            f_data.write('\t{"%s", &%s, &%s_lz, &%s_lz, &%s_lz, &%s_lz}, // 0x%X\n' %
                         (abbr_ori, n_modes, n_script, n_oam_r, n_oam_l,
                          n_pal, i))
            f_ptr.write('// battle animation 0x%X\n' % i)
            f_oam.write('@ battle animation 0x%X\n' % i)
            f_ptr.write('extern int %s[];\n' % n_modes)
            f_ptr.write('extern char %s_lz[];\n' % n_script)
            f_ptr.write('extern char %s_lz[];\n' % n_oam_r)
            f_ptr.write('extern char %s_lz[];\n' % n_oam_l)
            f_ptr.write('extern char %s_lz[];\n' % n_pal)
            for offset in anim['offset_oam']:
                frame_id = anim['offset_oam'][offset]
                n_frame = 'banim_%s_oam_frame_%d' % (abbr, frame_id)
                f_oam.write('\t.extern %s_r\n' % n_frame)
                f_oam.write('\t.extern %s_l\n' % n_frame)
        f_data.write('};\n')
        f_data.write('__attribute__((section(".data.banim_array_len")))\n')
        f_data.write(
            'long long banim_number = sizeof(banim_data) / sizeof(banim_data[0]);\n')
    with open('out/banim_sheet.inc', 'w') as f_sheet:
        for i in sheet_dict:
            f_sheet.write('\t.extern %s\n' % sheet_dict[i])
    with open('out/banim_sheet_addr.inc', 'w') as f_sheet:
        for i in sheet_dict:
            f_sheet.write('\t.equ %s, 0x%X\n' % (sheet_dict[i], i))

def parse_frame(animation_id, side='r'):
    anim = banim_table[animation_id]
    abbr = anim['abbr']
    offset_frame = anim['offset_oam']
    n_oam = 'banim_%s_oam_%s' % (abbr, side)
    with open('out/%s.bin' % n_oam, 'rb') as f_bin, \
        open('out/%s.s' % n_oam, 'w') as f_asm:
        f_asm.write('@ vim:ft=armv4\n')
        f_asm.write('\t.include "../include/banim_code_frame.inc"\n')
        f_asm.write('@ battle animation 0x%X\n' % animation_id)
        for offset in offset_frame:
            frame_id = offset_frame[offset]
            f_asm.write('\t.global banim_%s_oam_frame_%d_%s\n' %
                        (abbr, frame_id, side))
        f_asm.write('\t.section .data\n')
        f_asm.write(n_oam + ':\n')
        p = 0
        while True:
            if p in offset_frame:
                frame_id = offset_frame[p]
                f_asm.write('banim_%s_oam_frame_%d_%s:\n' % (
                    abbr, frame_id, side))
            element = f_bin.read(12)
            p += 12
            if len(element) == 0:
                break
            else:
                # hardcoded macro parse
                element = struct.unpack('<6h', element)
                if element[0] == 1 and element[1] == 0 and element[2] == 0 \
                        and element[3] == 0 and element[4] == 0 \
                        and element[5] == 0:
                    f_asm.write('\tbanim_frame_end\n')
                elif element[1] == -1:
                    total = element[0]
                    f_asm.write('\tbanim_frame_affine %d, %d, %d, %d, %d\n'
                                % (element[2], element[3], element[4],
                                   element[5], total))
                    if total > 1:
                        for i in range(total - 1):
                            element = f_bin.read(12)
                            n, _, pa, pb, pcc, pd = struct.unpack(
                                '<6h', element)
                            f_asm.write('\tbanim_frame_affine %d, %d, %d, %d, %d\n'
                                        % (pa, pb, pcc, pd, n))
                            p += 12
                elif element[5] == 0:
                    attr0, attr1, attr2, dx, dy, _ = element
                    if attr0 < 0:
                        attr0 = struct.unpack('<H', struct.pack('<h', attr0))[0]
                    if attr1 < 0:
                        attr1 = struct.unpack('<H', struct.pack('<h', attr1))[0]
                    if attr2 < 0:
                        attr2 = struct.unpack('<H', struct.pack('<h', attr2))[0]
                    f_asm.write('\tbanim_frame_oam 0x%X, 0x%X, 0x%X, %d, %d\n'
                                % (attr0, attr1, attr2, dx, dy))
                else:
                    f_asm.write('\t.hword %d, %d, %d, %d, %d, %d\n' %
                                (element[0], element[1], element[2],
                                 element[3], element[4], element[5]))

def parse_frame_r(animation_id):
    parse_frame(animation_id, side='r')

def parse_frame_l(animation_id):
    parse_frame(animation_id, side='l')

def parse_frame_all(animation_id):
    parse_frame_r(animation_id)
    parse_frame_l(animation_id)

def parse_pal_group(animation_id):
    anim = banim_table[animation_id]
    abbr = anim['abbr']
    n_pal = 'banim_%s_pal' % abbr
    with open('out/%s.gbapal' % n_pal, 'rb') as f_bin, \
        open('out/%s.s' % n_pal, 'w') as f_asm:
        f_asm.write('@ vim:ft=armv4\n')
        f_asm.write('@ battle animaton 0x%X\n' % animation_id)
        f_asm.write('\t.global %s\n' % n_pal)
        f_asm.write('\t.section .data\n')
        f_asm.write('%s:\n' % n_pal)
        f_asm.write('%s_player:\n\t.hword ' % n_pal)
        for i in range(16):
            color = struct.unpack('<H', f_bin.read(2))
            f_asm.write('0x%X' % color)
            if i < 15:
                f_asm.write(', ')
            else:
                f_asm.write('\n')
        f_asm.write('%s_enemy:\n\t.hword ' % n_pal)
        for i in range(16):
            color = struct.unpack('<H', f_bin.read(2))
            f_asm.write('0x%X' % color)
            if i < 15:
                f_asm.write(', ')
            else:
                f_asm.write('\n')
        f_asm.write('%s_npc:\n\t.hword ' % n_pal)
        for i in range(16):
            color = struct.unpack('<H', f_bin.read(2))
            f_asm.write('0x%X' % color)
            if i < 15:
                f_asm.write(', ')
            else:
                f_asm.write('\n')
        f_asm.write('%s_p4:\n\t.hword ' % n_pal)
        for i in range(16):
            color = struct.unpack('<H', f_bin.read(2))
            f_asm.write('0x%X' % color)
            if i < 15:
                f_asm.write(', ')
            else:
                f_asm.write('\n')
        color_s = f_bin.read(2)
        if len(color_s) > 0:
            f_asm.write('%s_p5:\n\t.hword ' % n_pal)
            color = struct.unpack('<H', color_s)
            f_asm.write('0x%X, ' % color)
            for i in range(1, 16):
                color = struct.unpack('<H', f_bin.read(2))
                f_asm.write('0x%X' % color)
                if i < 15:
                    f_asm.write(', ')
                else:
                    f_asm.write('\n')

def parse_banim_all(code_dict=None):
    for i in range(len(banim_table)):
        parse_banim_script(i, code_dict)
        parse_frame_all(i)
        parse_pal_group(i)

def scan_banim_data_area():
    # save offset_dict to text to compare with the rebuilt data later
    with open('out/address_list.txt', 'w') as f_addr:
        for offset, info in sorted(offset_dict.items(), key=lambda x:x[0]):
            f_addr.write('0x%x\t%s\n' % (offset + 0x8000000, info['name']))
    with open('out/data_banim.s', 'w') as f_asm:
        f_asm.write('@ vim:ft=armv4\n')
        f_asm.write('@ range: 0xC02000 ~ 0xE47180\n')
#        f_asm.write('\t.include "../include/banim_script.inc"\n')
#        f_asm.write(
#            '.macro banim_modes_end\n\t.rept 12\n\t.word 0\n\t.endr\n.endm\n')
        f_asm.write('\t.section .data\n')
        p = 0xC02000
        while p < 0xE47180:
        # test
#        while p < 0xC0B2FC:
            if p in offset_dict:
                data_type = offset_dict[p]['type']
                name = offset_dict[p]['name']
                index = offset_dict[p]['banim_id']
                f_asm.write('@ battle animation 0x%X\n' % index)
                abbr = banim_table[index]['abbr']
                f_asm.write('\t.global %s\n' % name)
                f_asm.write('%s:\n' % name)
                if data_type == 'modes':
#                    for i in range(12):
#                        f_asm.write(
#                            '\t.word banim_%s_mode_%s - banim_%s_script @ mode %d\n'
#                            % (abbr, banim_mode_name[i], abbr, i + 1))
                    f_asm.write('\t.incbin "banim/%s.bin"\n' % name)
                    p += 96
                elif data_type == 'sheet':
                    f_asm.write('\t.incbin "graphics/banim/%s.4bpp.lz"\n'
                                % name)
                    f_asm.write('\t.align 2, 0\n')
#                    p += os.path.getsize('graphics/banim/%s.4bpp.lz' % name)
                    p += os.path.getsize('out/%s.4bpp.lz' % name)
                    p = tool.align(p)
                else:
                    if name.endswith('_lz'):
                        name = name[:-3]
                    f_asm.write('\t.incbin "banim/%s.bin.lz"\n' % name)
                    f_asm.write('\t.align 2, 0\n')
#                    p += os.path.getsize('banim/%s.bin.lz' % name)
                    if data_type == 'pal':
                        p += os.path.getsize('out/%s.gbapal.lz' % name)
                    else:
                        p += os.path.getsize('out/%s.bin.lz' % name)
                    p = tool.align(p)
            else:
                p_last = p
                while p not in offset_dict:
                    p += 4
                name = 'gUnknown_%X' % p_last
                f_asm.write('\t.global %s\n' % name)
                f_asm.write('%s:\n' % name)
                f_asm.write('\t.incbin "baserom.gba", 0x%X, 0x%X\n' %
                            (p_last, p - p_last))
            f_asm.write('\n')

def main():
    print('-----reading battle animation script code macro-----')
    with open('../include/banim_code.inc', 'r') as f_macro:
        code_dict = tool.read_asm_macro(f_macro)
    with open('banim_codes.json', 'w') as f_dict:
        json.dump(code_dict, f_dict)
    with open('../baserom.gba', 'rb') as f_rom:
        print('-----scanning battle animation pointer table-----')
        read_banim_pointer_table(f_rom)
        print('-----dumping raw binaries of pointed data-----')
        dump_raw_binary(f_rom)
    print('-----output source files-----')
    parse_banim_all(code_dict)
    make_headers()
    scan_banim_data_area()

if __name__ == '__main__':
    main()
