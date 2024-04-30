#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes
import symbols
from fe8db import PID_IDX, EVENTINFO_COMMANDS, EVENT_SLOTS, DIRECTION_IDX, TILE_COMMANDS, EVENT_FLAGS
from fe8db import EVENT0B_TRIGGER_TYPE, WM_NODES, WM_NATIONS, JID_IDX, FACTION_IDX, FACTION_NAMES, ITEM_IDX
from dump_events import unpack_EvtParams2, unpack_EvtParams4

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

def parse_eventinfo(rom_data, off):
    arg0 = int.from_bytes(rom_data[off + 0:off + 4], 'little')
    arg1 = int.from_bytes(rom_data[off + 4:off + 8], 'little')
    arg2 = int.from_bytes(rom_data[off + 8:off + 12], 'little')
    arg3 = int.from_bytes(rom_data[off + 12:off + 16], 'little')

    cmd, ent_flag = unpack_EvtParams2(arg0)
    scr_len = 1

    ent_flag = EVENT_FLAGS(ent_flag)

    match EVENTINFO_COMMANDS[cmd]:
        case "EVT_LIST_CMD_END":
            scr_len = 1
            print(f"    END_MAIN")

        case "EVT_LIST_CMD_FLAG":
            scr_len = 3
            scr = try_get_ptr_symbol(arg1)
            flag = arg2

            if scr == "EventScr_GameOver" and flag == 101:
                print("    CauseGameOverIfLordDies")
            elif ent_flag == "EVFLAG_WIN" and flag == 2:
                print(f"    DefeatBoss({scr})")
            elif ent_flag == "EVFLAG_WIN" and flag == 6:
                print(f"    DefeatAll({scr})")
            else:
                print(f"    AFEV({ent_flag}, {scr}, {flag})")

        case "EVT_LIST_CMD_TURN":
            scr_len = 3
            scr = try_get_ptr_symbol(arg1)
            turn, turn_max, faction, _0 = unpack_EvtParams4(arg2)

            faction = FACTION_NAMES[faction]
            duration = turn_max - turn + 1

            if faction == "FACTION_BLUE" and ent_flag == 0 and turn_max == 0 and turn == 1:
                print(f"    OpeningTurnEvent({scr})")
            elif turn_max == 0:
                if faction == "FACTION_BLUE":
                    print(f"    TurnEventPlayer({ent_flag}, {scr}, {turn})")
                elif faction == "FACTION_RED":
                    print(f"    TurnEventEnemy({ent_flag}, {scr}, {turn})")
                elif faction == "FACTION_GREEN":
                    print(f"    TurnEventNPC({ent_flag}, {scr}, {turn})")
            else:
                if faction == "FACTION_BLUE":
                    print(f"    TurnEventPlayer_({ent_flag}, {scr}, {turn}, {duration})")
                elif faction == "FACTION_RED":
                    print(f"    TurnEventEnemy_({ent_flag}, {scr}, {turn}, {duration})")
                elif faction == "FACTION_GREEN":
                    print(f"    TurnEventNPC_({ent_flag}, {scr}, {turn}, {duration})")

            # print(f"    TURN({ent_flag}, {scr}, {turn}, {turn_max}, {faction})")

        case "EVT_LIST_CMD_CHAR":
            scr_len = 4
            ent_script = try_get_ptr_symbol(arg1)
            pid_a, pid_b, _0a, _0b = unpack_EvtParams4(arg2)
            trigg_eid, _3 = unpack_EvtParams2(arg3)

            pid_a = PID_IDX(pid_a)
            pid_b = PID_IDX(pid_b)

            if trigg_eid == 0:
                print(f"    CHAR({ent_flag}, {ent_script}, {pid_a}, {pid_b})")
            else:
                print(f"    CHAR_({ent_flag}, {ent_script}, {pid_a}, {pid_b}, {trigg_eid})")

        case "EVT_LIST_CMD_LOCA":
            scr_len = 3
            scr = try_get_ptr_symbol(arg1)
            x, y, tile_command_idx, _0 = unpack_EvtParams4(arg2)
            tile_command = TILE_COMMANDS(tile_command_idx)

            if ent_flag == "EVFLAG_WIN" and arg1 == 1 and tile_command_idx == 17:
                print(f"    Seize({x}, {y})")
            elif tile_command == "TILE_COMMAND_VISIT":
                print(f"    House({ent_flag}, {scr}, {x}, {y})")
            else:
                print(f"    LOCA({ent_flag}, {scr}, {x}, {y}, {TILE_COMMANDS(tile_command_idx)})")

        case "EVT_LIST_CMD_VILL":
            scr_len = 3
            scr = try_get_ptr_symbol(arg1)
            x, y, tile_command_idx, _0 = unpack_EvtParams4(arg2)
            tile_command = TILE_COMMANDS(tile_command_idx)

            if tile_command == "TILE_COMMAND_VISIT":
                scr_len = 6
                print(f"    Village({ent_flag}, {scr}, {x}, {y})")
            else:
                print(f"    VILL({ent_flag}, {scr}, {x}, {y}, {TILE_COMMANDS(tile_command_idx)})")

        case "EVT_LIST_CMD_CHES":
            scr_len = 3
            item = ITEM_IDX(arg1 & 0xFFFF)
            x, y, tile_command_idx, _0 = unpack_EvtParams4(arg2)

            if tile_command_idx != 20:
                print(f"// EVT_LIST_CMD_CHES ERROR at 0x{off:06X}")

            if item == "ITEM_GOLD":
                amt = (arg1 >> 16)
                print(f"    ChestMoney({amt}, {x}, {y})")
            else:
                print(f"    Chest({item}, {x}, {y})")

        case "EVT_LIST_CMD_DOOR":
            scr_len = 3
            scr = arg1
            x, y, tile_command_idx, _0 = unpack_EvtParams4(arg2)

            if scr != 1:
                print(f"// TILE_COMMAND_DOOR ERROR1 at 0x{off:06X}")

            if tile_command_idx != 18:
                print(f"// TILE_COMMAND_DOOR ERROR2 at 0x{off:06X}")

            print(f"    Door({x}, {y})")

        case "EVT_LIST_CMD_SHOP":
            scr_len = 3
            scr = try_get_ptr_symbol(arg1)
            x, y, tile_command_idx, _0 = unpack_EvtParams4(arg2)

            if tile_command_idx == 0x16:
                print(f"    Armory({scr}, {x}, {y})")
            elif tile_command_idx == 0x17:
                print(f"    Vendor({scr}, {x}, {y})")
            elif tile_command_idx == 0x18:
                print(f"    SecretShop({scr}, {x}, {y})")
            else:
                print(f"// ERROR at 0x{off:06X}")

        case "EVT_LIST_CMD_AREA":
            scr_len = 3
            scr = try_get_ptr_symbol(arg1)
            x1, y1, x2, y2 = unpack_EvtParams4(arg2)

            print(f"    AREA({ent_flag}, {scr}, {x1}, {y1}, {x2}, {y2})")

        case _:
            print(f"// ERROR at 0x{off:06X}")

    return cmd, off + scr_len * 4

def dump_one_eventinfo(rom_data, off):
    ptr = 0x08000000 | off
    if ptr not in _symbols:
        scr_name = f"EventListScr_{off + 0x08000000:08X}"
    else:
        scr_name = _symbols[ptr]

    print(f"CONST_DATA EventListScr {scr_name}[] = " + "{")

    while True:
        cmd, off = parse_eventinfo(rom_data, off)
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
        end = eval(args[2])
    except IndexError:
        end = 0

    off = start & 0x01FFFFFF
    off_end = end & 0x01FFFFFF

    prefix = "ch1"

    with open(rom, 'rb') as f:
        rom_data = f.read()

        while True:
            off = dump_one_eventinfo(rom_data, off)

            if off_end <= off:
                break

    print(f"// end at 0x{0x08000000 + off:08X}")

if __name__ == '__main__':
    main(sys.argv)
