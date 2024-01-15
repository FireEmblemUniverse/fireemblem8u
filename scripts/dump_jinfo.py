#!/usr/bin/python3
# -*- coding: UTF-8 -*-
from fe8db import JID_IDX, UNIT_AFFIN, WPN_EXP
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

    start = 0x8807164
    off = (start & 0x01FFFFFF) + 0x54 * i

    jid_idx = JID_IDX(i + 1)

    print(f"    [{jid_idx} - 1] = " + "{")

    nameTextId = int.from_bytes(rom_data[off + 0x00:off + 0x02], 'little')
    if nameTextId != 0:
        print(f"        .nameTextId = {hex(nameTextId)},")

    descTextId = int.from_bytes(rom_data[off + 0x02:off + 0x04], 'little')
    if descTextId != 0:
        print(f"        .descTextId = {hex(descTextId)},")

    number = JID_IDX(rom_data[off + 0x04])
    print(f"        .number = {number},")

    promotion = JID_IDX(rom_data[off + 0x05])
    if promotion != "CLASS_NONE":
        print(f"        .promotion = {promotion},")

    SMSId = rom_data[off + 0x6]
    print(f"        .SMSId = {hex(SMSId)},")

    slowWalking = rom_data[off + 0x7]
    if slowWalking != 0:
        print(f"        .slowWalking = {hex(slowWalking)},")

    defaultPortraitId = int.from_bytes(rom_data[off + 0x08:off + 0x0A], 'little')
    if defaultPortraitId != 0:
        print(f"        .defaultPortraitId = {hex(defaultPortraitId)},")

    sort_order = rom_data[off + 0xA]
    if sort_order != 0:
        print(f"        .sort_order = {hex(sort_order)},")

    print("")
    baseHP = rom_data[off + 0x0B]
    print(f"        .baseHP  = {baseHP},")
    basePow = rom_data[off + 0x0C]
    print(f"        .basePow = {basePow},")
    baseSkl = rom_data[off + 0x0D]
    print(f"        .baseSkl = {baseSkl},")
    baseSpd = rom_data[off + 0x0E]
    print(f"        .baseSpd = {baseSpd},")
    baseDef = rom_data[off + 0x0F]
    print(f"        .baseDef = {baseDef},")
    baseRes = rom_data[off + 0x10]
    print(f"        .baseRes = {baseRes},")
    baseCon = rom_data[off + 0x11]
    print(f"        .baseCon = {baseCon},")
    baseMov = rom_data[off + 0x12]
    print(f"        .baseMov = {baseMov},")

    print("")
    maxHP = rom_data[off + 0x13]
    print(f"        .maxHP  = {maxHP},")
    maxPow = rom_data[off + 0x14]
    print(f"        .maxPow = {maxPow},")
    maxSkl = rom_data[off + 0x15]
    print(f"        .maxSkl = {maxSkl},")
    maxSpd = rom_data[off + 0x16]
    print(f"        .maxSpd = {maxSpd},")
    maxDef = rom_data[off + 0x17]
    print(f"        .maxDef = {maxDef},")
    maxRes = rom_data[off + 0x18]
    print(f"        .maxRes = {maxRes},")
    maxCon = rom_data[off + 0x19]
    print(f"        .maxCon = {maxCon},")

    classRelativePower = rom_data[off + 0x1A]
    if classRelativePower != 0:
        print(f"        .classRelativePower = {classRelativePower},")
        print("")

    print("")
    growthHP = rom_data[off + 0x1B]
    print(f"        .growthHP  = {growthHP},")
    growthPow = rom_data[off + 0x1C]
    print(f"        .growthPow = {growthPow},")
    growthSkl = rom_data[off + 0x1D]
    print(f"        .growthSkl = {growthSkl},")
    growthSpd = rom_data[off + 0x1E]
    print(f"        .growthSpd = {growthSpd},")
    growthDef = rom_data[off + 0x1F]
    print(f"        .growthDef = {growthDef},")
    growthRes = rom_data[off + 0x20]
    print(f"        .growthRes = {growthRes},")
    growthLck = rom_data[off + 0x21]
    print(f"        .growthLck = {growthLck},")

    print("")
    promotionHp = rom_data[off + 0x22]
    print(f"        .promotionHp  = {promotionHp},")
    promotionPow = rom_data[off + 0x23]
    print(f"        .promotionPow = {promotionPow},")
    promotionSkl = rom_data[off + 0x24]
    print(f"        .promotionSkl = {promotionSkl},")
    promotionSpd = rom_data[off + 0x25]
    print(f"        .promotionSpd = {promotionSpd},")
    promotionDef = rom_data[off + 0x26]
    print(f"        .promotionDef = {promotionDef},")
    promotionRes = rom_data[off + 0x27]
    print(f"        .promotionRes = {promotionRes},")

    attributes = int.from_bytes(rom_data[off + 0x28:off + 0x2C], 'little')
    if attributes != 0:
        print("")
        print(f"        .attributes = {dump_attr(attributes)},")

    baseRanks = {}
    baseRanks[0] = rom_data[off + 0x2C]
    baseRanks[1] = rom_data[off + 0x2D]
    baseRanks[2] = rom_data[off + 0x2E]
    baseRanks[3] = rom_data[off + 0x2F]
    baseRanks[4] = rom_data[off + 0x30]
    baseRanks[5] = rom_data[off + 0x31]
    baseRanks[6] = rom_data[off + 0x32]
    baseRanks[7] = rom_data[off + 0x33]
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

    _pBattleAnimDef = int.from_bytes(rom_data[off + 0x34:off + 0x38], 'little')
    if _pBattleAnimDef != 0:
        pBattleAnimDef = try_get_ptr_symbol(_pBattleAnimDef)
        if pBattleAnimDef == None:
            print(f"        .pBattleAnimDef = (void *)0x{_pBattleAnimDef:08X},")
        else:
            print(f"        .pBattleAnimDef = {pBattleAnimDef},")

    pMovCostTable = {}
    pMovCostTable[0] = int.from_bytes(rom_data[off + 0x38:off + 0x3C], 'little')
    pMovCostTable[1] = int.from_bytes(rom_data[off + 0x3C:off + 0x40], 'little')
    pMovCostTable[2] = int.from_bytes(rom_data[off + 0x40:off + 0x44], 'little')
    print("        .pMovCostTable = {")
    pMovCostTable_0 = try_get_ptr_symbol(pMovCostTable[0])
    if pMovCostTable_0 == None:
        print(f"            (void *)0x{pMovCostTable[0]:08X},")
    else:
        print(f"            {pMovCostTable_0},")
    pMovCostTable_1 = try_get_ptr_symbol(pMovCostTable[1])
    if pMovCostTable_1 == None:
        print(f"            (void *)0x{pMovCostTable[1]:08X},")
    else:
        print(f"            {pMovCostTable_1},")
    pMovCostTable_2 = try_get_ptr_symbol(pMovCostTable[2])
    if pMovCostTable_2 == None:
        print(f"            (void *)0x{pMovCostTable[2]:08X},")
    else:
        print(f"            {pMovCostTable_2},")
    print("        },")

    _pTerrainAvoidLookup = int.from_bytes(rom_data[off + 0x44:off + 0x48], 'little')
    if _pTerrainAvoidLookup != 0:
        pTerrainAvoidLookup = try_get_ptr_symbol(_pTerrainAvoidLookup)
        if pTerrainAvoidLookup == None:
            print(f"        .pTerrainAvoidLookup = (void *)0x{_pTerrainAvoidLookup:08X},")
        else:
            print(f"        .pTerrainAvoidLookup = {pTerrainAvoidLookup},")

    _pTerrainDefenseLookup = int.from_bytes(rom_data[off + 0x48:off + 0x4C], 'little')
    if _pTerrainDefenseLookup != 0:
        pTerrainDefenseLookup = try_get_ptr_symbol(_pTerrainDefenseLookup)
        if pTerrainDefenseLookup == None:
            print(f"        .pTerrainDefenseLookup = (void *)0x{_pTerrainDefenseLookup:08X},")
        else:
            print(f"        .pTerrainDefenseLookup = {pTerrainDefenseLookup},")

    _pTerrainResistanceLookup = int.from_bytes(rom_data[off + 0x4C:off + 0x50], 'little')
    if _pTerrainResistanceLookup != 0:
        pTerrainResistanceLookup = try_get_ptr_symbol(_pTerrainResistanceLookup)
        if pTerrainResistanceLookup == None:
            print(f"        .pTerrainResistanceLookup = (void *)0x{_pTerrainResistanceLookup:08X},")
        else:
            print(f"        .pTerrainResistanceLookup = {pTerrainResistanceLookup},")

    __pU50 = int.from_bytes(rom_data[off + 0x50:off + 0x54], 'little')
    if __pU50 != 0:
        _pU50 = try_get_ptr_symbol(__pU50)
        if _pU50 == None:
            print(f"        ._pU50 = (void *)0x{__pU50:08X},")
        else:
            print(f"        ._pU50 = &{_pU50},")

    print("    },")

def main(args):
    rom = "baserom.gba"

    with open(rom, 'rb') as f:
        rom_data = f.read()

        print("CONST_DATA struct ClassData gClassData[] = {")

        for i in range(0x7F):
            dump_one_dat(rom_data, i)

        print("};")

if __name__ == '__main__':
    main(sys.argv)
