#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes
import symbols
from fe8db import PID_IDX, FACTION_IDX, ITEM_IDX, JID_IDX

# ========================================================================
elf = "fireemblem8.elf"
with open(elf, 'rb') as f:
    _symbols = { addr: name for addr, name in symbols.from_elf(f) }

def try_get_ptr_symbol(val):
    is_symbol = False

    ptr = val

    if ptr > 0x08000000 and ptr < 0x09000000:
        is_symbol = True
    if ptr > 0x02000000 and ptr < 0x02040000:
        is_symbol = True
    if ptr > 0x03000000 and ptr < 0x03008000:
        is_symbol = True

    if ptr not in _symbols:
        is_symbol = False

    if is_symbol == True:
        return _symbols[ptr]
    else:
        return f"(void *){hex(val)}"
# ========================================================================

def dump_one_udef(rom_data, off):
    udef = {}

    pid = rom_data[off + 0]
    if pid != 0:
        udef['charIndex'] = PID_IDX(pid)
        udef['classIndex'] = rom_data[off + 1]

        if rom_data[off + 2] != 0:
            udef['leaderCharIndex'] = PID_IDX(rom_data[off + 2])
        else:
            udef['leaderCharIndex'] = 0

        val_03 = rom_data[off + 3]

        udef['autolevel'] = val_03 & 0x1
        udef['allegiance'] = FACTION_IDX[(val_03 >> 1) & 0x3]
        udef['level'] = (val_03 >> 3) & 0x1F

        val_04 = int.from_bytes(rom_data[off + 4:off + 6], 'little')

        udef['xPosition'] = (val_04) & 0x3F
        udef['yPosition'] = (val_04 >> 6) & 0x3F
        udef['genMonster'] = (val_04 >> 12) & 0x1
        udef['itemDrop'] = (val_04 >> 13) & 0x1
        udef['sumFlag'] = (val_04 >> 14) & 0x1
        udef['unk_05_7'] = (val_04 >> 15) & 0x1

        if udef['xPosition'] == 63 and udef['yPosition'] == 63:
            print("// ============================================================")
            print("// [WARNING]: Maybe REDA data!")
            print("// ============================================================")

        udef['extraData'] = rom_data[off + 6]
        udef['redaCount'] = rom_data[off + 7]

        redas = int.from_bytes(rom_data[off + 8:off + 12], 'little')
        udef['redas'] = try_get_ptr_symbol(redas)

        udef['items'] = {}
        udef['items'][0] = ITEM_IDX(rom_data[off + 12])
        udef['items'][1] = ITEM_IDX(rom_data[off + 13])
        udef['items'][2] = ITEM_IDX(rom_data[off + 14])
        udef['items'][3] = ITEM_IDX(rom_data[off + 15])

        udef['ai'] = {}
        udef['ai'][0] = rom_data[off + 16]
        udef['ai'][1] = rom_data[off + 17]
        udef['ai'][2] = rom_data[off + 18]
        udef['ai'][3] = rom_data[off + 19]

        print("    {")
        print(f"        .charIndex = {udef['charIndex']},")

        if udef['genMonster'] == 0:
            print(f"        .classIndex = {JID_IDX(udef['classIndex'])},")
        else:
            print(f"        .classIndex = {hex(udef['classIndex'])}, // Group idx for gMonsterClassWeights")

        if udef['leaderCharIndex'] != 0:
            print(f"        .leaderCharIndex = {udef['leaderCharIndex']},")

        if udef['autolevel'] != 0:
            print(f"        .autolevel = {udef['autolevel']},")

        print(f"        .allegiance = {udef['allegiance']},")
        print(f"        .level = {udef['level']},")
        print(f"        .xPosition = {udef['xPosition']},")
        print(f"        .yPosition = {udef['yPosition']},")

        if udef['genMonster'] != 0:
            print(f"        .genMonster = {udef['genMonster']},")

        if udef['itemDrop'] != 0:
            print(f"        .itemDrop = {udef['itemDrop']},")

        if udef['sumFlag'] != 0:
            print(f"        .sumFlag = {udef['sumFlag']},")

        if udef['unk_05_7'] != 0:
            print(f"        .unk_05_7 = {udef['unk_05_7']},")

        if udef['extraData'] != 0:
            print(f"        .extraData = {hex(udef['extraData'])},")

        if udef['redaCount'] != 0:
            print(f"        .redaCount = {udef['redaCount']},")
            print(f"        .redas = {udef['redas']},")

        if udef['items'][0] != 'ITEM_NONE':
            print("        .items = {")
            for i in range(4):
                if udef['items'][i] == 'ITEM_NONE':
                    break
                else:
                    print(f"            {udef['items'][i]},")

            print("        },")

        if udef['ai'][0] != 0 or udef['ai'][1] != 0 or udef['ai'][2] != 0 or udef['ai'][3] != 0:
            print(f"        .ai = " + "{" + f"{hex(udef['ai'][0])}, {hex(udef['ai'][1])}, {hex(udef['ai'][2])}, {hex(udef['ai'][3])}" + "},")

        print("    },")

    else:
        print("    { 0 },")

    return pid

def dump_udef_group(rom_data, off):
    ptr = 0x08000000 | off
    if ptr not in _symbols:
        udef_name = f"UnitDef_{off + 0x08000000:08X}"
    else:
        udef_name = _symbols[ptr]

    print(f"// 0x{off + 0x08000000:07X}")
    print(f"CONST_DATA struct UnitDefinition {udef_name}[] = " + "{")
    while True:
        pid = dump_one_udef(rom_data, off)

        off = off + 0x14

        if pid == 0:
            break

    print("};\n")
    return off

def main(args):
    rom = "baserom.gba"

    try:
        start = eval(args[1])
    except IndexError:
        sys.exit(f"Usage: {args[0]} START [END]")

    try:
        end = eval(args[2])
    except IndexError:
        end = 0

    off = start & 0x01FFFFFF
    off_end = end & 0x01FFFFFF

    with open(rom, 'rb') as f:
        rom_data = f.read()

        while True:
            off = dump_udef_group(rom_data, off)

            if off_end <= off:
                break

    print(f"// 0x{off:06X}")

if __name__ == '__main__':
    main(sys.argv)
