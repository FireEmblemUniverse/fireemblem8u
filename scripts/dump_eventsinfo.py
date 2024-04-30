#!/usr/bin/python3

import sys, ctypes
import symbols
import dump_eventinfo, dump_chapterasset
from fe8db import EVENTINFO_COMMANDS

# ========================================================================
symbol_inited = 0
_symbols = []

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

def dump_chaperasset_ext(rom_data, off, prefix):
    ptr = 0x08000000 | off

    global _symbols
    init_symbol()

    if ptr not in _symbols:
        name = f"ChapterData_{off + 0x08000000:08X}"
    else:
        name = _symbols[ptr]

    print(f"// 0x{off + 0x08000000:07X}")
    print(f"CONST_DATA struct ChapterEventGroup {name} = " + "{")

    print(f"    .turnBasedEvents               = EventListScr_{prefix}_Turn,")
    off = off + 4
    print(f"    .characterBasedEvents          = EventListScr_{prefix}_Character,")
    off = off + 4
    print(f"    .locationBasedEvents           = EventListScr_{prefix}_Location,")
    off = off + 4
    print(f"    .miscBasedEvents               = EventListScr_{prefix}_Misc,")
    off = off + 4
    print(f"    .specialEventsWhenUnitSelected = EventListScr_{prefix}_SelectUnit,")
    off = off + 4
    print(f"    .specialEventsWhenDestSelected = EventListScr_{prefix}_SelectDestination,")
    off = off + 4
    print(f"    .specialEventsAfterUnitMoved   = EventListScr_{prefix}_UnitMove,")
    off = off + 4
    print(f"    .tutorialEvents                = EventListScr_{prefix}_Tutorial,")
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

def dump_one_eventinfo_prefix(rom_data, off, prefix):
    ptr = 0x08000000 | off
    if ptr not in _symbols:
        scr_name = f"EventListScr_{prefix}"
    else:
        scr_name = _symbols[ptr]

    print(f"CONST_DATA EventListScr {scr_name}[] = " + "{")

    while True:
        cmd, off = dump_eventinfo.parse_eventinfo(rom_data, off)
        if cmd in EVENTINFO_COMMANDS and EVENTINFO_COMMANDS[cmd] == "EVT_LIST_CMD_END":
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
        prefix = args[2]
    except IndexError:
        prefix = ""

    off = start & 0x01FFFFFF

    with open(rom, 'rb') as f:
        rom_data = f.read()

        print("#include \"gbafe.h\"")
        print("")

        # 1st: dump eventinfos
        _prefix = f"{prefix}_Turn"
        off = dump_one_eventinfo_prefix(rom_data, off, _prefix)

        _prefix = f"{prefix}_Character"
        off = dump_one_eventinfo_prefix(rom_data, off, _prefix)

        _prefix = f"{prefix}_Location"
        off = dump_one_eventinfo_prefix(rom_data, off, _prefix)

        _prefix = f"{prefix}_Misc"
        off = dump_one_eventinfo_prefix(rom_data, off, _prefix)

        _prefix = f"{prefix}_SelectUnit"
        off = dump_one_eventinfo_prefix(rom_data, off, _prefix)

        _prefix = f"{prefix}_SelectDestination"
        off = dump_one_eventinfo_prefix(rom_data, off, _prefix)

        _prefix = f"{prefix}_UnitMove"
        off = dump_one_eventinfo_prefix(rom_data, off, _prefix)

        _prefix = f"{prefix}_Tutorial"
        off = dump_one_eventinfo_prefix(rom_data, off, _prefix)

        # 2nd: dump chapter asset
        dump_chaperasset_ext(rom_data, off, prefix)

    print(f"// end at 0x{0x08000000 + off:08X}")

if __name__ == '__main__':
    main(sys.argv)
