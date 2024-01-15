#!/usr/bin/python3
# -*- coding: UTF-8 -*-
from fe8db import PID_IDX, JID_IDX, UNIT_AFFIN, WPN_EXP
import symbols
import sys

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
        return None
# ========================================================================

def append_attr(old, new):
    if old == "":
        ret = f"{new}"
    else:
        ret = f"{old} | {new}"

    return ret

def dump_attr(attr):
    if attr == 0:
        return "CA_NONE"

    ret = ""

    if attr & (1 << 0):
        ret = append_attr(ret, "CA_MOUNTEDAID")

    if attr & (1 << 1):
        ret = append_attr(ret, "CA_CANTO")

    if attr & (1 << 2):
        ret = append_attr(ret, "CA_STEAL")

    if attr & (1 << 3):
        ret = append_attr(ret, "CA_THIEF")

    if attr & (1 << 4) and attr & (1 << 5):
        ret = append_attr(ret, "CA_REFRESHER")
    else:
        if attr & (1 << 4):
            ret = append_attr(ret, "CA_DANCE")
        if attr & (1 << 5):
            ret = append_attr(ret, "CA_PLAY")

    if attr & (1 << 6):
        ret = append_attr(ret, "CA_CRITBONUS")

    if attr & (1 << 7):
        ret = append_attr(ret, "CA_BALLISTAE")

    if attr & (1 << 8):
        ret = append_attr(ret, "CA_PROMOTED")

    if attr & (1 << 9):
        ret = append_attr(ret, "CA_SUPPLY")

    if attr & (1 << 10):
        ret = append_attr(ret, "CA_MOUNTED")

    if attr & (1 << 11) and attr & (1 << 12):
        ret = append_attr(ret, "CA_FLYER")
    else:
        if attr & (1 << 11):
            ret = append_attr(ret, "CA_WYVERN")
        if attr & (1 << 12):
            ret = append_attr(ret, "CA_PEGASUS")

    if attr & (1 << 13):
        ret = append_attr(ret, "CA_LORD")

    if attr & (1 << 14):
        ret = append_attr(ret, "CA_FEMALE")

    if attr & (1 << 15):
        ret = append_attr(ret, "CA_BOSS")

    if attr & (1 << 16):
        ret = append_attr(ret, "CA_LOCK_1")

    if attr & (1 << 17):
        ret = append_attr(ret, "CA_LOCK_2")

    if attr & (1 << 18):
        ret = append_attr(ret, "CA_LOCK_3")

    if attr & (1 << 19):
        ret = append_attr(ret, "CA_MAXLEVEL10")

    if attr & (1 << 20):
        ret = append_attr(ret, "CA_UNSELECTABLE")

    if attr & (1 << 21) and attr & (1 << 22):
        ret = append_attr(ret, "CA_TRIANGLEATTACK_ANY")
    else:
        if attr & (1 << 21):
            ret = append_attr(ret, "CA_TRIANGLEATTACK_PEGASI")
        if attr & (1 << 22):
            ret = append_attr(ret, "CA_TRIANGLEATTACK_ARMORS")

    if attr & (1 << 23):
        ret = append_attr(ret, "CA_BIT_23")

    if attr & (1 << 24):
        ret = append_attr(ret, "CA_NEGATE_LETHALITY")

    if attr & (1 << 25):
        ret = append_attr(ret, "CA_ASSASSIN")

    if attr & (1 << 26):
        ret = append_attr(ret, "CA_MAGICSEAL")

    if attr & (1 << 27):
        ret = append_attr(ret, "CA_SUMMON")

    if attr & (1 << 28):
        ret = append_attr(ret, "CA_LOCK_4")

    if attr & (1 << 29):
        ret = append_attr(ret, "CA_LOCK_5")

    if attr & (1 << 30):
        ret = append_attr(ret, "CA_LOCK_6")

    if attr & (1 << 31):
        ret = append_attr(ret, "CA_LOCK_7")

    return ret

def dump_one_dat(rom_data, i):

    start = 0x08803d64
    off = (start & 0x01FFFFFF) + 0x34 * i

    pid_idx = PID_IDX(i + 1)

    print(f"    [{pid_idx} - 1] = " + "{")

    nameTextId = int.from_bytes(rom_data[off + 0x00:off + 0x02], 'little')
    if nameTextId != 0:
        print(f"        .nameTextId = {hex(nameTextId)},")

    descTextId = int.from_bytes(rom_data[off + 0x02:off + 0x04], 'little')
    if descTextId != 0:
        print(f"        .descTextId = {hex(descTextId)},")

    number = PID_IDX(rom_data[off + 0x04])
    print(f"        .number = {number},")

    defaultClass = JID_IDX(rom_data[off + 0x05])
    if defaultClass != "CLASS_NONE":
        print(f"        .defaultClass = {defaultClass},")

    portraitId = int.from_bytes(rom_data[off + 0x06:off + 0x08], 'little')
    if portraitId != 0:
        print(f"        .portraitId = {hex(portraitId)},")

    miniPortrait = rom_data[off + 0x08]
    if miniPortrait != 0:
        print(f"        .miniPortrait = {hex(miniPortrait)},")

    affinity = UNIT_AFFIN(rom_data[off + 0x09])
    if affinity != None:
        print(f"        .affinity = {affinity},")

    sort_order = rom_data[off + 0x0A]
    if sort_order != 0:
        print(f"        .sort_order = {hex(sort_order)},")

    baseLevel = rom_data[off + 0x0B]
    if baseLevel != 0:
        print(f"        .baseLevel = {baseLevel},")

    print("")
    baseHP = rom_data[off + 0x0C]
    print(f"        .baseHP  = {baseHP},")
    basePow = rom_data[off + 0x0D]
    print(f"        .basePow = {basePow},")
    baseSkl = rom_data[off + 0x0E]
    print(f"        .baseSkl = {baseSkl},")
    baseSpd = rom_data[off + 0x0F]
    print(f"        .baseSpd = {baseSpd},")
    baseDef = rom_data[off + 0x10]
    print(f"        .baseDef = {baseDef},")
    baseRes = rom_data[off + 0x11]
    print(f"        .baseRes = {baseRes},")
    baseLck = rom_data[off + 0x12]
    print(f"        .baseLck = {baseLck},")
    baseCon = rom_data[off + 0x13]
    print(f"        .baseCon = {baseCon},")

    baseRanks = {}
    baseRanks[0] = rom_data[off + 0x14]
    baseRanks[1] = rom_data[off + 0x15]
    baseRanks[2] = rom_data[off + 0x16]
    baseRanks[3] = rom_data[off + 0x17]
    baseRanks[4] = rom_data[off + 0x18]
    baseRanks[5] = rom_data[off + 0x19]
    baseRanks[6] = rom_data[off + 0x1A]
    baseRanks[7] = rom_data[off + 0x1B]

    if baseRanks[0] != 0 or baseRanks[1] != 0 or baseRanks[2] != 0 or baseRanks[3] != 0 or baseRanks[4] != 0 or baseRanks[5] != 0 or baseRanks[6] != 0 or baseRanks[7] != 0:
        print("")
        print("        .baseRanks = {")
        if baseRanks[0] != 0:
            print(f"            [ITYPE_SWORD] = {WPN_EXP(baseRanks[0])},")
        if baseRanks[1] != 0:
            print(f"            [ITYPE_LANCE] = {WPN_EXP(baseRanks[1])},")
        if baseRanks[2] != 0:
            print(f"            [ITYPE_AXE]   = {WPN_EXP(baseRanks[2])},")
        if baseRanks[3] != 0:
            print(f"            [ITYPE_BOW]   = {WPN_EXP(baseRanks[3])},")
        if baseRanks[4] != 0:
            print(f"            [ITYPE_STAFF] = {WPN_EXP(baseRanks[4])},")
        if baseRanks[5] != 0:
            print(f"            [ITYPE_ANIMA] = {WPN_EXP(baseRanks[5])},")
        if baseRanks[6] != 0:
            print(f"            [ITYPE_LIGHT] = {WPN_EXP(baseRanks[6])},")
        if baseRanks[7] != 0:
            print(f"            [ITYPE_DARK]  = {WPN_EXP(baseRanks[7])},")
        print("        },")

    print("")
    growthHP = rom_data[off + 0x1C]
    print(f"        .growthHP  = {growthHP},")
    growthPow = rom_data[off + 0x1D]
    print(f"        .growthPow = {growthPow},")
    growthSkl = rom_data[off + 0x1E]
    print(f"        .growthSkl = {growthSkl},")
    growthSpd = rom_data[off + 0x1F]
    print(f"        .growthSpd = {growthSpd},")
    growthDef = rom_data[off + 0x20]
    print(f"        .growthDef = {growthDef},")
    growthRes = rom_data[off + 0x21]
    print(f"        .growthRes = {growthRes},")
    growthLck = rom_data[off + 0x22]
    print(f"        .growthLck = {growthLck},")

    _u23 = rom_data[off + 0x23]
    if _u23 != 0:
        print(f"        ._u23 = {hex(_u23)},")
    _u24 = rom_data[off + 0x24]
    if _u24 != 0:
        print(f"        ._u23 = {hex(_u24)},")
    _u25 = rom_data[off + 0x25]
    if _u25 != 0:
        print(f"        ._u23 = {hex(_u25)},")
    _u26 = rom_data[off + 0x26]
    if _u26 != 0:
        print(f"        ._u23 = {hex(_u26)},")
    _u27 = rom_data[off + 0x27]
    if _u27 != 0:
        print(f"        ._u23 = {hex(_u27)},")

    attributes = int.from_bytes(rom_data[off + 0x28:off + 0x2C], 'little')
    if attributes != 0:
        print(f"        .attributes = {dump_attr(attributes)},")

    _pSupportData = int.from_bytes(rom_data[off + 0x2C:off + 0x30], 'little')
    if _pSupportData != 0:
        pSupportData = try_get_ptr_symbol(_pSupportData)
        if pSupportData == None:
            print(f"        .pSupportData = (void *)0x{_pSupportData:08X},")
        else:
            print(f"        .pSupportData = &{pSupportData},")

    visit_group = rom_data[off + 0x30]
    if visit_group != 0:
        print(f"        .visit_group = {hex(visit_group)},")

    print("    },")

def main(args):
    rom = "baserom.gba"

    with open(rom, 'rb') as f:
        rom_data = f.read()

        print("CONST_DATA struct CharacterData gCharacterData[] = {")

        for i in range(0x100):
            dump_one_dat(rom_data, i)

        print("};")

if __name__ == '__main__':
    main(sys.argv)
