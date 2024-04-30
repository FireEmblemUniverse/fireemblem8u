#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes
import symbols
from fe8db import ITEM_IDX

# ========================================================================
symbol_inited = 0
_symbols = {}

def init_symbol():
    global symbol_inited
    global _symbols

    elf = "fireemblem8.elf"

    if symbol_inited != 0x12345678:
        symbol_inited = 0x12345678
        with open(elf, 'rb') as f:
            _symbols = { addr: name for addr, name in symbols.from_elf(f) }

def try_get_ptr_symbol(val):
    global _symbols

    is_symbol = False

    ptr = val

    if ptr > 0x08000000 and ptr < 0x09000000:
        is_symbol = True
    if ptr > 0x02000000 and ptr < 0x02040000:
        is_symbol = True
    if ptr > 0x03000000 and ptr < 0x03008000:
        is_symbol = True

    init_symbol()

    if ptr not in _symbols:
        is_symbol = False

    if is_symbol == True:
        return _symbols[ptr]
    else:
        return f"(void *){hex(val)}"
# ========================================================================

def _events_sym(ptr):
    global _symbols

    init_symbol()

    if ptr == 0:
        return "NULL"
    else:
        return _symbols[ptr]

def dump_chaperasset(rom_data, off):
    ptr = 0x08000000 | off
    if ptr not in _symbols:
        name = f"ChapterData_{off + 0x08000000:08X}"
    else:
        name = _symbols[ptr]

    print(f"// 0x{off + 0x08000000:07X}")
    print(f"CONST_DATA struct ChapterEventGroup {name} = " + "{")

    turnBasedEvents = _events_sym(int.from_bytes(rom_data[off + 0:off + 4], 'little'))
    print(f"    .turnBasedEvents               = {turnBasedEvents},")
    off = off + 4

    characterBasedEvents = _events_sym(int.from_bytes(rom_data[off + 0:off + 4], 'little'))
    print(f"    .characterBasedEvents          = {characterBasedEvents},")
    off = off + 4

    locationBasedEvents = _events_sym(int.from_bytes(rom_data[off + 0:off + 4], 'little'))
    print(f"    .locationBasedEvents           = {locationBasedEvents},")
    off = off + 4

    miscBasedEvents = _events_sym(int.from_bytes(rom_data[off + 0:off + 4], 'little'))
    print(f"    .miscBasedEvents               = {miscBasedEvents},")
    off = off + 4

    specialEventsWhenUnitSelected = _events_sym(int.from_bytes(rom_data[off + 0:off + 4], 'little'))
    print(f"    .specialEventsWhenUnitSelected = {specialEventsWhenUnitSelected},")
    off = off + 4

    specialEventsWhenDestSelected = _events_sym(int.from_bytes(rom_data[off + 0:off + 4], 'little'))
    print(f"    .specialEventsWhenDestSelected = {specialEventsWhenDestSelected},")
    off = off + 4

    specialEventsAfterUnitMoved = _events_sym(int.from_bytes(rom_data[off + 0:off + 4], 'little'))
    print(f"    .specialEventsAfterUnitMoved   = {specialEventsAfterUnitMoved},")
    off = off + 4

    tutorialEvents = _events_sym(int.from_bytes(rom_data[off + 0:off + 4], 'little'))
    print(f"    .tutorialEvents                = {tutorialEvents},")
    off = off + 4

    print("")
    traps = _events_sym(int.from_bytes(rom_data[off + 0:off + 4], 'little'))
    print(f"    .traps            = {traps},")
    off = off + 4

    extraTrapsInHard = _events_sym(int.from_bytes(rom_data[off + 0:off + 4], 'little'))
    print(f"    .extraTrapsInHard = {extraTrapsInHard},")
    off = off + 4

    print("")
    playerUnitsInNormal = _events_sym(int.from_bytes(rom_data[off + 0:off + 4], 'little'))
    print(f"    .playerUnitsInNormal = {playerUnitsInNormal},")
    off = off + 4

    playerUnitsInHard = _events_sym(int.from_bytes(rom_data[off + 0:off + 4], 'little'))
    print(f"    .playerUnitsInHard   = {playerUnitsInHard},")
    off = off + 4

    print("")
    playerUnitsChoice1InEncounter = _events_sym(int.from_bytes(rom_data[off + 0:off + 4], 'little'))
    print(f"    .playerUnitsChoice1InEncounter = {playerUnitsChoice1InEncounter},")
    off = off + 4

    playerUnitsChoice2InEncounter = _events_sym(int.from_bytes(rom_data[off + 0:off + 4], 'little'))
    print(f"    .playerUnitsChoice2InEncounter = {playerUnitsChoice2InEncounter},")
    off = off + 4

    playerUnitsChoice3InEncounter = _events_sym(int.from_bytes(rom_data[off + 0:off + 4], 'little'))
    print(f"    .playerUnitsChoice3InEncounter = {playerUnitsChoice3InEncounter},")
    off = off + 4

    print("")
    enemyUnitsChoice1InEncounter = _events_sym(int.from_bytes(rom_data[off + 0:off + 4], 'little'))
    print(f"    .enemyUnitsChoice1InEncounter = {enemyUnitsChoice1InEncounter},")
    off = off + 4

    enemyUnitsChoice2InEncounter = _events_sym(int.from_bytes(rom_data[off + 0:off + 4], 'little'))
    print(f"    .enemyUnitsChoice2InEncounter = {enemyUnitsChoice2InEncounter},")
    off = off + 4

    enemyUnitsChoice3InEncounter = _events_sym(int.from_bytes(rom_data[off + 0:off + 4], 'little'))
    print(f"    .enemyUnitsChoice3InEncounter = {enemyUnitsChoice3InEncounter},")
    off = off + 4

    print("")
    beginningSceneEvents = _events_sym(int.from_bytes(rom_data[off + 0:off + 4], 'little'))
    print(f"    .beginningSceneEvents = {beginningSceneEvents},")
    off = off + 4

    endingSceneEvents = _events_sym(int.from_bytes(rom_data[off + 0:off + 4], 'little'))
    print(f"    .endingSceneEvents    = {endingSceneEvents},")
    off = off + 4

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
            off = dump_chaperasset(rom_data, off)

            if off_end <= off:
                break

    print(f"// 0x{off:06X}")

if __name__ == '__main__':
    main(sys.argv)
