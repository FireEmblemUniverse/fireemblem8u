#!/usr/bin/python3
# -*- coding: UTF-8 -*-

from fe8db import ITEM_IDX, ITYPE_IDX, WPN_EXP, WPN_EFFECT
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

def dump_item_attr(attr):
    if attr == 0:
        return "IA_NONE"

    ret = ""

    if attr & 1:
        ret = append_attr(ret, "IA_WEAPON")

    attr = attr >> 1
    if attr & 1:
        ret = append_attr(ret, "IA_MAGIC")

    attr = attr >> 1
    if attr & 1:
        ret = append_attr(ret, "IA_STAFF")

    attr = attr >> 1
    if attr & 1:
        ret = append_attr(ret, "IA_UNBREAKABLE")

    attr = attr >> 1
    if attr & 1:
        ret = append_attr(ret, "IA_UNSELLABLE")

    attr = attr >> 1
    if attr & 1:
        ret = append_attr(ret, "IA_BRAVE")

    attr = attr >> 1
    if attr & 1:
        ret = append_attr(ret, "IA_MAGICDAMAGE")

    attr = attr >> 1
    if attr & 1:
        ret = append_attr(ret, "IA_UNCOUNTERABLE")

    attr = attr >> 1
    if attr & 1:
        ret = append_attr(ret, "IA_REVERTTRIANGLE")

    attr = attr >> 1
    if attr & 1:
        ret = append_attr(ret, "IA_HAMMERNE")

    attr = attr >> 1
    if attr & 1:
        ret = append_attr(ret, "IA_LOCK_3")

    attr = attr >> 1
    if attr & 1:
        ret = append_attr(ret, "IA_LOCK_1")

    attr = attr >> 1
    if attr & 1:
        ret = append_attr(ret, "IA_LOCK_2")

    attr = attr >> 1
    if attr & 1:
        ret = append_attr(ret, "IA_LOCK_0")

    attr = attr >> 1
    if attr & 1:
        ret = append_attr(ret, "IA_NEGATE_FLYING")

    attr = attr >> 1
    if attr & 1:
        ret = append_attr(ret, "IA_NEGATE_CRIT")

    attr = attr >> 1
    if attr & 1:
        ret = append_attr(ret, "IA_UNUSABLE")

    attr = attr >> 1
    if attr & 1:
        ret = append_attr(ret, "IA_NEGATE_DEFENSE")

    attr = attr >> 1
    if attr & 1:
        ret = append_attr(ret, "IA_LOCK_4")

    attr = attr >> 1
    if attr & 1:
        ret = append_attr(ret, "IA_LOCK_5")

    attr = attr >> 1
    if attr & 1:
        ret = append_attr(ret, "IA_LOCK_6")

    attr = attr >> 1
    if attr & 1:
        ret = append_attr(ret, "IA_LOCK_7")

    return ret

def dump_one_dat(rom_data, i):

    start = 0x08809B10
    off = (start & 0x01FFFFFF) + 0x24 * i

    item_idx = ITEM_IDX(i)

    print(f"\t[{item_idx}] = " + "{")

    nameTextId = int.from_bytes(rom_data[off + 0x00:off + 0x02], 'little')
    if nameTextId != 0:
        print(f"\t\t.nameTextId = {hex(nameTextId)},")

    descTextId = int.from_bytes(rom_data[off + 0x02:off + 0x04], 'little')
    if descTextId != 0:
        print(f"\t\t.descTextId = {hex(descTextId)},")

    useDescTextId = int.from_bytes(rom_data[off + 0x04:off + 0x06], 'little')
    if useDescTextId != 0:
        print(f"\t\t.useDescTextId = {hex(useDescTextId)},")

    number = ITEM_IDX(rom_data[off + 0x06])
    print(f"\t\t.number = {number},")

    weaponType = ITYPE_IDX(rom_data[off + 0x07])
    print(f"\t\t.weaponType = {weaponType},")

    attributes = int.from_bytes(rom_data[off + 0x08:off + 0x0C], 'little')
    if attributes != 0:
        print(f"\t\t.attributes = {dump_item_attr(attributes)},")

    _pStatBonuses = int.from_bytes(rom_data[off + 0x0C:off + 0x10], 'little')
    if _pStatBonuses != 0:
        pStatBonuses = try_get_ptr_symbol(_pStatBonuses)
        if pStatBonuses == None:
            print(f"\t\t.pStatBonuses = (void *)0x{_pStatBonuses:08X},")
        else:
            print(f"\t\t.pStatBonuses = &{pStatBonuses},")

    _pEffectiveness = int.from_bytes(rom_data[off + 0x10:off + 0x14], 'little')
    if _pEffectiveness != 0:
        pEffectiveness = try_get_ptr_symbol(_pEffectiveness)
        if pEffectiveness == None:
            pEffectiveness = f"(void *)0x{_pEffectiveness:08X}"

        print(f"\t\t.pEffectiveness = {pEffectiveness},")

    maxUses = rom_data[off + 0x14]
    if maxUses != 0:
        print(f"\t\t.maxUses = {maxUses},")

    might = rom_data[off + 0x15]
    if might != 0:
        print(f"\t\t.might = {might},")

    hit = rom_data[off + 0x16]
    if hit != 0:
        print(f"\t\t.hit = {hit},")

    weight = rom_data[off + 0x17]
    if weight != 0:
        print(f"\t\t.weight = {weight},")

    crit = rom_data[off + 0x18]
    if crit != 0:
        print(f"\t\t.crit = {crit},")

    encodedRange = rom_data[off + 0x19]
    if encodedRange != 0:
        print(f"\t\t.encodedRange = 0x{encodedRange:02X},")

    costPerUse = int.from_bytes(rom_data[off + 0x1A:off + 0x1C], 'little')
    if costPerUse != 0:
        print(f"\t\t.costPerUse = {costPerUse},")

    weaponRank = rom_data[off + 0x1C]
    if weaponRank != 0:
        print(f"\t\t.weaponRank = {WPN_EXP(weaponRank)},")

    iconId = hex(rom_data[off + 0x1D])
    print(f"\t\t.iconId = {iconId},")

    useEffectId = rom_data[off + 0x1E]
    if useEffectId != 0:
        print(f"\t\t.useEffectId = {useEffectId},")

    weaponEffectId = rom_data[off + 0x1F]
    if weaponEffectId != 0:
        print(f"\t\t.weaponEffectId = {WPN_EFFECT[weaponEffectId]},")

    weaponExp = rom_data[off + 0x20]
    if weaponExp != 0:
        print(f"\t\t.weaponExp = {weaponExp},")

    print("\t},")

def main(args):
    rom = "baserom.gba"

    with open(rom, 'rb') as f:
        rom_data = f.read()

        print("CONST_DATA struct ItemData gItemData[] = {")

        for i in range(0xCE):
            dump_one_dat(rom_data, i)

        print("};")

if __name__ == '__main__':
    main(sys.argv)
