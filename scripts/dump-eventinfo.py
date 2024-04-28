#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes
import symbols
from fe8db import PID_IDX, EVENTINFO_COMMANDS, EVENT_SLOTS, DIRECTION_IDX
from fe8db import EVENT0B_TRIGGER_TYPE, WM_NODES, WM_NATIONS, JID_IDX, FACTION_IDX, FACTION_NAMES
from dump_events import unpack_EvtParams2, unpack_EvtParams4

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
        return hex(val)
# ========================================================================

def parse_eventinfo(rom_data, off):
    arg0 = int.from_bytes(rom_data[off + 0:off + 4], 'little')
    arg1 = int.from_bytes(rom_data[off + 4:off + 8], 'little')
    arg2 = int.from_bytes(rom_data[off + 8:off + 12], 'little')
    arg3 = int.from_bytes(rom_data[off + 12:off + 16], 'little')

    cmd, ent_flag = unpack_EvtParams2(arg0)
    scr_len = 1

    match EVENTINFO_COMMANDS[cmd]:
        case "EVT_LIST_CMD_END":
            scr_len = 1
            print(f"    END_MAIN")

        case "EVT_LIST_CMD_FLAG":
            scr_len = 3
            scr = try_get_ptr_symbol(arg1)
            flag = arg2
            print(f"    AFEV({ent_flag}, {scr}, {flag})")

        case "EVT_LIST_CMD_TURN":
            scr_len = 3
            scr = try_get_ptr_symbol(arg1)
            turn, turn_max, faction, _0 = unpack_EvtParams4(arg2)
            faction = FACTION_NAMES[faction]

            print(f"    TURN({ent_flag}, {scr}, {turn}, {turn_max}, {faction})")

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
            x, y, tile_command, _0 = unpack_EvtParams4(arg2)

            print(f"    LOCA({ent_flag}, {scr}, {x}, {y}, {tile_command})")

        case "EVT_LIST_CMD_VILL":
            scr_len = 3
            scr = try_get_ptr_symbol(arg1)
            x, y, tile_command, _0 = unpack_EvtParams4(arg2)

            print(f"    VILL({ent_flag}, {scr}, {x}, {y}, {tile_command})")

        case "EVT_LIST_CMD_CHES":
            scr_len = 3
            item = arg1
            x, y, tile_command, _0 = unpack_EvtParams4(arg2)

            if tile_command != 20:
                print(f"// EVT_LIST_CMD_CHES ERROR at 0x{off:06X}")

            print(f"    Chest(0x{item:02X}, {x}, {y})")

        case "EVT_LIST_CMD_DOOR":
            scr_len = 3
            scr = arg1
            x, y, tile_command, _0 = unpack_EvtParams4(arg2)

            if scr != 1:
                print(f"// TILE_COMMAND_DOOR ERROR1 at 0x{off:06X}")

            if tile_command != 18:
                print(f"// TILE_COMMAND_DOOR ERROR2 at 0x{off:06X}")

            print(f"    Door({x}, {y})")

        case "EVT_LIST_CMD_SHOP":
            scr_len = 3
            scr = try_get_ptr_symbol(arg1)
            x, y, tile_command, _0 = unpack_EvtParams4(arg2)

            if tile_command == 0x16:
                print(f"    Armory({scr}, {x}, {y})")
            elif tile_command == 0x17:
                print(f"    Vendor({scr}, {x}, {y})")
            elif tile_command == 0x18:
                print(f"    SecretShop({scr}, {x}, {y})")
            else:
                print(f"// ERROR at 0x{off:06X}")

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
