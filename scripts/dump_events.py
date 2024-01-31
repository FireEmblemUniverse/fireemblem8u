#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import sys, ctypes
import symbols
from fe8db import PID_IDX, EVENT_COMMANDS, EVENT_SLOTS, DIRECTION_IDX
from fe8db import EVENT0B_TRIGGER_TYPE, WM_NODES, WM_NATIONS, JID_IDX, FACTION_IDX
from fe8db import WM_MU_IDX, WM_PATH_IDX

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

def unpack_EvtSubParam16u4(arg16):
    a = (arg16 >> 0x0) & 0xF
    b = (arg16 >> 0x4) & 0xF
    c = (arg16 >> 0x8) & 0xF
    d = (arg16 >> 0xC) & 0xF
    return a, b, c, d

def unpack_EvtSubParam16u8(arg16):
    a = (arg16 >> 0x0) & 0xFF
    b = (arg16 >> 0x8) & 0xFF
    return a, b

def unpack_EvtParams2(arg32):
    x = (arg32 >> 0x0) & 0xFFFF
    y = (arg32 >> 0x10) & 0xFFFF
    return x, y

def unpack_EvtParams4(arg32):
    a = (arg32 >> 0x00) & 0xFF
    b = (arg32 >> 0x08) & 0xFF
    c = (arg32 >> 0x10) & 0xFF
    d = (arg32 >> 0x18) & 0xFF
    return a, b, c, d

def parse_event_err(rom_data, off):
    dat0 = int.from_bytes(rom_data[off + 0:off + 2], 'little')
    dat1 = int.from_bytes(rom_data[off + 2:off + 4], 'little')
    dat2 = int.from_bytes(rom_data[off + 4:off + 6], 'little')
    dat3 = int.from_bytes(rom_data[off + 6:off + 8], 'little')

    print(f"\n[ERROR] at {hex(off)}")
    print(f"dat: {hex(off)}: {hex(dat0)} {hex(dat1)} {hex(dat2)} {hex(dat3)}")

    sub_cmd = rom_data[off] & 0xF
    cmd = rom_data[off + 1]

    print(f"cmd: {hex(cmd)}, sub {hex(sub_cmd)}")

    if cmd in EVENT_COMMANDS:
        print(f"maybe: {EVENT_COMMANDS[cmd]}")

    print("")

def parse_event_todo(rom_data, off):
    sub_cmd = rom_data[off] & 0xF
    cmd_len = (rom_data[off] >> 4) & 0xF
    cmd = rom_data[off + 1]

    dat0 = int.from_bytes(rom_data[off + 0:off + 2], 'little')
    dat1 = int.from_bytes(rom_data[off + 2:off + 4], 'little')
    dat2 = int.from_bytes(rom_data[off + 4:off + 6], 'little')
    dat3 = int.from_bytes(rom_data[off + 6:off + 8], 'little')

    print("\n[TODO]")
    print(f"cmd: {EVENT_COMMANDS[cmd]}")
    print(f"sub: {hex(sub_cmd)}, len: {cmd_len}")
    print(f"dat: {hex(off)}: {hex(dat0)} {hex(dat1)} {hex(dat2)} {hex(dat3)}")
    print("")

def parse_unknown_event(rom_data, off):
    sub_cmd = rom_data[off] & 0xF
    cmd_len = (rom_data[off] >> 4) & 0xF
    cmd = rom_data[off + 1]

    arg0 = int.from_bytes(rom_data[off + 2:off + 4], 'little')

    print("")
    print(f"\t// [Unknow] at {hex(off)}")
    print(f"\t_EvtArg0({hex(cmd)}, {cmd_len}, {sub_cmd}, {hex(arg0)}),")

    off = off + 4
    cmd_len = cmd_len - 2

    while cmd_len > 0:
        arg32 = int.from_bytes(rom_data[off + 0:off + 4], 'little')
        print(f"\t(EventListScr){hex(arg32)},")

        off = off + 4
        cmd_len = cmd_len - 2

    print("")
    return cmd, off

def parse_event(rom_data, off):
    sub_cmd = rom_data[off] & 0xF
    cmd_len = (rom_data[off] >> 4) & 0xF
    cmd = rom_data[off + 1]

    if cmd not in EVENT_COMMANDS:
        # sys.exit(f"[ERROR] Unknown command at {hex(off)}")
        return parse_unknown_event(rom_data, off)

    arg1_u32_le = int.from_bytes(rom_data[off + 4:off + 8], 'little')
    arg1_u32_be = int.from_bytes(rom_data[off + 4:off + 8], 'big')
    arg2_u32_le = int.from_bytes(rom_data[off + 8:off + 12], 'little')
    arg3_u32_le = int.from_bytes(rom_data[off + 12:off + 16], 'little')
    arg4_u32_le = int.from_bytes(rom_data[off + 16:off + 20], 'little')
    arg5_u32_le = int.from_bytes(rom_data[off + 20:off + 24], 'little')

    arg32 = arg1_u32_le

    arg0 = int.from_bytes(rom_data[off + 2:off + 4], 'little')
    arg1, arg2 = unpack_EvtParams2(arg32)

    match EVENT_COMMANDS[cmd]:
        case "EV_CMD_END":
            match sub_cmd:
                case 0:
                    print(f"\tENDA")
                case 1:
                    print(f"\tENDB")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_EVSET":
            match sub_cmd:
                case 0:
                    print(f"\tEVBIT_F({arg0})")
                case 1:
                    print(f"\tENUF({arg0})")
                case 8:
                    print(f"\tEVBIT_T({arg0})")
                case 9:
                    print(f"\tENUT({arg0})")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_EVCHECK":
            match sub_cmd:
                case 0:
                    print(f"\tCHECK_EVBIT({arg0})")
                case 1:
                    print(f"\tCHECK_EVENTID({arg0})")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_RANDOMNUMBER":
            print(f"\tRANDOMNUMBER({arg0})")

        case "EV_CMD_SVAL":
            print(f"\tSVAL({EVENT_SLOTS[arg0]}, {try_get_ptr_symbol(arg1_u32_le)})")

        case "EV_CMD_SLOT_OPS":
            to, a, b, __unused__ = unpack_EvtSubParam16u4(arg0)
            match sub_cmd:
                case 0:
                    print(f"\tSADD({EVENT_SLOTS[to]}, {EVENT_SLOTS[a]}, {EVENT_SLOTS[b]})")
                case 1:
                    print(f"\tSSUB({EVENT_SLOTS[to]}, {EVENT_SLOTS[a]}, {EVENT_SLOTS[b]})")
                case 2:
                    print(f"\tSMUL({EVENT_SLOTS[to]}, {EVENT_SLOTS[a]}, {EVENT_SLOTS[b]})")
                case 3:
                    print(f"\tSDIV({EVENT_SLOTS[to]}, {EVENT_SLOTS[a]}, {EVENT_SLOTS[b]})")
                case 4:
                    print(f"\tSMOD({EVENT_SLOTS[to]}, {EVENT_SLOTS[a]}, {EVENT_SLOTS[b]})")
                case 5:
                    print(f"\tSAND({EVENT_SLOTS[to]}, {EVENT_SLOTS[a]}, {EVENT_SLOTS[b]})")
                case 6:
                    print(f"\tSORR({EVENT_SLOTS[to]}, {EVENT_SLOTS[a]}, {EVENT_SLOTS[b]})")
                case 7:
                    print(f"\tSXOR({EVENT_SLOTS[to]}, {EVENT_SLOTS[a]}, {EVENT_SLOTS[b]})")
                case 8:
                    print(f"\tSLSL({EVENT_SLOTS[to]}, {EVENT_SLOTS[a]}, {EVENT_SLOTS[b]})")
                case 9:
                    print(f"\tSLSR({EVENT_SLOTS[to]}, {EVENT_SLOTS[a]}, {EVENT_SLOTS[b]})")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_QUEUE_OPS":
            match sub_cmd:
                case 0:
                    print(f"\tSENQUEUE({EVENT_SLOTS[arg0]})")
                case 1:
                    print(f"\tSENQUEUE1")
                case 2:
                    print(f"\tSDEQUEUE({EVENT_SLOTS[arg0]})")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_LABEL":
            print(f"LABEL({hex(arg0)})")

        case "EV_CMD_GOTO":
            print(f"\tGOTO({hex(arg0)})")

        case "EV_CMD_CALL":
            print(f"\tCALL({try_get_ptr_symbol(arg32)})")

        case "EV_CMD_ENQUEUE_CALL":
            match sub_cmd:
                case 0:
                    print(f"\tEvtEnqueueCallDirectly({try_get_ptr_symbol(arg32)}) // ENOSUPP in EAstdlib")
                case 1:
                    if arg0 not in EVENT0B_TRIGGER_TYPE:
                        parse_event_err(rom_data, off)
                    else:
                        print(f"\tEvtEnqueueConditionalTutCall({try_get_ptr_symbol(arg32)}, {EVENT0B_TRIGGER_TYPE[arg0]}) // ENOSUPP in EAstdlib")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_BRANCH":
            label = arg0
            s1, s2 = unpack_EvtParams2(arg32)
            match sub_cmd:
                case 0:
                    print(f"\tBEQ({hex(label)}, {EVENT_SLOTS[s1]}, {EVENT_SLOTS[s2]})")
                case 1:
                    print(f"\tBNE({hex(label)}, {EVENT_SLOTS[s1]}, {EVENT_SLOTS[s2]})")
                case 2:
                    print(f"\tBGE({hex(label)}, {EVENT_SLOTS[s1]}, {EVENT_SLOTS[s2]})")
                case 3:
                    print(f"\tBGT({hex(label)}, {EVENT_SLOTS[s1]}, {EVENT_SLOTS[s2]})")
                case 4:
                    print(f"\tBLE({hex(label)}, {EVENT_SLOTS[s1]}, {EVENT_SLOTS[s2]})")
                case 5:
                    print(f"\tBLT({hex(label)}, {EVENT_SLOTS[s1]}, {EVENT_SLOTS[s2]})")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_ASMC":
            match sub_cmd:
                case 0:
                    print(f"\tASMC({try_get_ptr_symbol(arg32)})")
                case 1:
                    print(f"\tASMC2({try_get_ptr_symbol(arg32)})")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_STALL":
            time = arg0
            match sub_cmd:
                case 0:
                    print(f"\tSTAL({time})")
                case 1:
                    print(f"\tSTAL1({time})")
                case 2:
                    print(f"\tSTAL2({time})")
                case 3:
                    print(f"\tSTAL3({time})")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_COUNTER":
            idx, val = unpack_EvtSubParam16u8(arg0)
            match sub_cmd:
                case 0:
                    print(f"\tCOUNTER_CHECK({hex(idx)})")
                case 1:
                    print(f"\tCOUNTER_SET({hex(idx)}, {val})")
                case 2:
                    print(f"\tCOUNTER_INC({hex(idx)})")
                case 3:
                    print(f"\tCOUNTER_DEC({hex(idx)})")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_EVBITMODIFY":
            print(f"\tEVBIT_MODIFY({hex(arg0)})")

        case "EV_CMD_IGNOREKEYS":
            print(f"\tIGNORE_KEYS({hex(arg0)})")

        case "EV_CMD_BGMCHANGE_12":
            print(f"\tMUSC({hex(arg0)})")

        case "EV_CMD_BGMCHANGE_13":
            bgm = ctypes.c_int16(arg0).value
            match sub_cmd:
                case 2:
                    print(f"\tMUSCFAST({hex(bgm)})")
                case 4:
                    print(f"\tMUSCMID({hex(bgm)})")
                case 6:
                    print(f"\tMUSCSLOW({hex(bgm)})")
                case _:
                    print(f"\tEvtBgmFadeIn({hex(bgm)}, {sub_cmd}) // ENOSUPP in EAstdlib")

        case "EV_CMD_BGMOVERWRITE":
            match sub_cmd:
                case 0:
                    print(f"\tMUSS({hex(arg0)})")
                case 1:
                    print(f"\tMURE({hex(arg0)})")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_BGMVOLUMECHANGE":
            match sub_cmd:
                case 0:
                    print(f"\tMUSI")
                case 1:
                    print(f"\tMUNO")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_PLAYSE":
            songid = arg0
            print(f"\tSOUN({hex(songid)})")

        case "EV_CMD_FADE":
            speed = arg0
            match sub_cmd:
                case 0:
                    print(f"\tFADU({speed})")
                case 1:
                    print(f"\tFADI({speed})")
                case 2:
                    print(f"\tFAWU({speed})")
                case 3:
                    print(f"\tFAWI({speed})")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_COLORFADE":
            form, to = unpack_EvtSubParam16u8(arg0)
            speed, r = unpack_EvtParams2(arg32)
            g, b = unpack_EvtParams2(arg2_u32_le)

            match sub_cmd:
                case 0:
                    print(f"\tSTARTFADE")
                case 1:
                    print(f"\tENDFADE")
                case 2:
                    print(f"\tEvtColorFadeSetup({hex(form)}, {hex(to)}, {speed}, {r}, {g}, {b}) // ENOSUPP in EAstdlib")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_CHECKVARIOUS":
            match sub_cmd:
                case 0:
                    print(f"\tCHECK_MODE")
                case 1:
                    print(f"\tCHECK_CHAPTER_NUMBER")
                case 2:
                    print(f"\tCHECK_HARD")
                case 3:
                    print(f"\tCHECK_TURNS")
                case 4:
                    print(f"\tCHECK_ENEMIES")
                case 5:
                    print(f"\tCHECK_OTHERS")
                case 6:
                    print(f"\tCHECK_SKIRMISH")
                case 7:
                    print(f"\tCHECK_TUTORIAL")
                case 8:
                    print(f"\tCHECK_MONEY")
                case 9:
                    print(f"\tCHECK_EVENTID_")
                case 10:
                    print(f"\tCHECK_POSTGAME")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_SETTEXTTYPE":
            match sub_cmd:
                case 0:
                    print(f"\tTEXTSTART")
                case 1:
                    print(f"\tREMOVEPORTRAITS")
                case 2:
                    print(f"\tEvtTextStartType2 // ENOSUPP in EAstdlib")
                case 3:
                    print(f"\tTUTORIALTEXTBOXSTART")
                case 4:
                    print(f"\tSOLOTEXTBOXSTART")
                case 5:
                    print(f"\tEvtTextStartType5 // ENOSUPP in EAstdlib")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_DISPLAYTEXT":
            msg = arg0
            match sub_cmd:
                case 0:
                    print(f"\tTEXTSHOW({hex(msg)})")
                case 1:
                    print(f"\tEvtTextShow2({hex(msg)}) // ENOSUPP in EAstdlib")
                case 2:
                    print(f"\tREMA")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_CONTINUETEXT":
            print(f"\tTEXTCONT")

        case "EV_CMD_ENDTEXT":
            print(f"\tTEXTEND")

        case "EV_CMD_DISPLAYFACE":
            print(f"\tFACE_SHOW({EVENT_SLOTS[sub_cmd]}, {hex(arg0)})")

        case "EV_CMD_MOVEFACE":
            parse_event_todo(rom_data, off)
        case "EV_CMD_CLEARTEXTBOX":
            parse_event_todo(rom_data, off)

        case "EV_CMD_SHOWBG":
            bg = arg0
            match sub_cmd:
                case 0:
                    print(f"\tBACG({hex(bg)})")
                case 1:
                    _type, speed = unpack_EvtParams2(arg32)
                    print(f"\tEvtBgTransion({hex(bg)}, {_type}, {speed}) // ENOSUPP in EAstdlib")
                case 2:
                    color, speed = unpack_EvtParams2(arg32)
                    print(f"\tEvtBgFadeIn({hex(bg)}, {color}, {speed}) // ENOSUPP in EAstdlib")
                case 3:
                    color, speed = unpack_EvtParams2(arg32)
                    print(f"\tEvtBgFadeOut({color}, {speed}) // ENOSUPP in EAstdlib")
                case _:
                    parse_event_todo(rom_data, off) # todo

        case "EV_CMD_CLEARSCREEN":
            print(f"\tCLEAN")

        case "EV_CMD_23":
            parse_event_todo(rom_data, off)
        case "EV_CMD_24":
            parse_event_todo(rom_data, off)

        case "EV_CMD_LOMA":
            print(f"\tLOMA({hex(arg0)})")

        case "EV_CMD_CAMERACONTROL":
            x, y = unpack_EvtSubParam16u8(arg0)
            pid = ctypes.c_int16(arg0).value
            match sub_cmd:
                case 0:
                    print(f"\tCAMERA({x}, {y})")
                case 1:
                    print(f"\tCAMERA_CAHR({PID_IDX(pid)})")
                case 8:
                    print(f"\tCAMERA2({x}, {y})")
                case 9:
                    print(f"\tCAMERA2_CAHR({PID_IDX(pid)})")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_TILE_CHANGE":
            match sub_cmd:
                case 0:
                    print(f"\tTILECHANGE({hex(arg0)})")
                case 1:
                    print(f"\tTILEREVERT({hex(arg0)})")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_CHANGEWEATHER":
            parse_event_todo(rom_data, off)

        case "EV_CMD_CHANGEFOGVISION":
            match sub_cmd:
                case 0:
                    print(f"\tVCWF({arg0})")
                case 1:
                    print(f"\tEvtChangeFogVision(true, {arg0}) // ENOSUPP in EAstdlib")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_CHANGECHAPTER":
            match sub_cmd:
                case 0:
                    print(f"\tMNTS({hex(arg0)})")
                case 1:
                    print(f"\tMNCH({hex(arg0)})")
                case 2:
                    print(f"\tMNC2({hex(arg0)})")
                case 3:
                    print(f"\tMNC3({hex(arg0)})")
                case 4:
                    print(f"\tMNC4")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_LOAD_PRECONF":
            match sub_cmd:
                case 0:
                    print(f"\tEvtSetLoadUnitCount({hex(arg0)}) // ENOSUPP in EAstdlib")
                case 1:
                    print(f"\tEvtSetLoadUnitChance({hex(arg0)}) // ENOSUPP in EAstdlib")
                case 2:
                    print(f"\tEvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_LOADUNIT":
            match sub_cmd:
                case 0:
                    print(f"\tLOAD1({hex(arg0)}, {try_get_ptr_symbol(arg32)})")
                case 1:
                    print(f"\tLOAD2({hex(arg0)}, {try_get_ptr_symbol(arg32)})")
                case 2:
                    print(f"\tLOAD3({hex(arg0)}, {try_get_ptr_symbol(arg32)})")
                case 3:
                    print(f"\tLOAD4({hex(arg0)}, {try_get_ptr_symbol(arg32)})")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_CHANGE_PAL":
            print(f"\tUNIT_COLORS({hex(arg0)})")

        case "EV_CMD_GET_PID":
            match sub_cmd:
                case 0:
                    x, y = unpack_EvtSubParam16u8(arg0)
                    print(f"\tCHECK_AT({hex(x)}, {hex(y)})")
                case 1:
                    print(f"\tCHECK_ACTIVE")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_MOVEUNIT":
            match sub_cmd:
                case 0:
                    speed = arg0
                    pid = ctypes.c_int16(arg1).value
                    x, y = unpack_EvtSubParam16u8(arg2)
                    print(f"\tMOVE({hex(speed)}, {PID_IDX(pid)}, {x}, {y})")
                case 1:
                    speed = arg0
                    pid1 = ctypes.c_int16(arg1).value
                    pid2 = ctypes.c_int16(arg2).value
                    print(f"\tMOVEONTO({hex(speed)}, {PID_IDX(pid1)}, {PID_IDX(pid2)})")
                case 2:
                    speed = arg0
                    pid = ctypes.c_int16(arg1).value
                    direction = arg2
                    print(f"\tMOVE_1STEP({hex(speed)}, {PID_IDX(pid)}, {DIRECTION_IDX[direction]})")
                case 3:
                    pid = ctypes.c_int16(arg1).value
                    print(f"\tMOVE_DEFINED({PID_IDX(pid)})")
                case 8:
                    speed = arg0
                    pid = ctypes.c_int16(arg1).value
                    x, y = unpack_EvtSubParam16u8(arg2)
                    print(f"\tMOVE_CLOSEST({hex(speed)}, {PID_IDX(pid)}, {x}, {y})")
                case 9:
                    speed = arg0
                    pid1 = ctypes.c_int16(arg1).value
                    pid2 = ctypes.c_int16(arg2).value
                    print(f"\tMOVE_NEXTTO({hex(speed)}, {PID_IDX(pid1)}, {PID_IDX(pid2)})")
                case 10:
                    speed = arg0
                    pid = ctypes.c_int16(arg1).value
                    direction = arg2
                    print(f"\tMOVE_1STEP_CLOSEST({hex(speed)}, {PID_IDX(pid)}, {DIRECTION_IDX[direction]})")
                case 11:
                    pid = ctypes.c_int16(arg1).value
                    print(f"\tMOVE_DEFINED_CLOSEST({PID_IDX(pid)})")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_ENUN":
            print(f"\tENUN")

        case "EV_CMD_TOGGLERANGE":
            match sub_cmd:
                case 0:
                    pid = ctypes.c_int16(arg0).value
                    print(f"\tSHOW_ATTACK_RANGE({PID_IDX(pid)})")
                case 1:
                    print(f"\tHIDE_ATTACK_RANGE")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_LOADSINGLEUNIT":
            pid = ctypes.c_int16(arg0).value
            x, y, __unused1__, __unused2__ = unpack_EvtParams4(arg32)

            match sub_cmd:
                case 0:
                    print(f"\tSPAWN_ALLY({PID_IDX(pid)}, {x}, {y})")
                case 1:
                    print(f"\tSPAWN_NPC({PID_IDX(pid)}, {x}, {y})")
                case 2:
                    print(f"\tSPAWN_ENEMY({PID_IDX(pid)}, {x}, {y})")
                case 0xF:
                    print(f"\tSPAWN_CUTSCENE_ALLY({PID_IDX(pid)}, {x}, {y})")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_CHECKSTATE":
            pid = ctypes.c_int16(arg0).value

            match sub_cmd:
                case 0:
                    print(f"\tCHECK_EXISTS({PID_IDX(pid)})")
                case 1:
                    print(f"\tCHECK_STATUS({PID_IDX(pid)})")
                case 2:
                    print(f"\tCHECK_ALIVE({PID_IDX(pid)})")
                case 3:
                    print(f"\tCHECK_DEPLOYED({PID_IDX(pid)})")
                case 4:
                    print(f"\tCHECK_ACTIVEID({PID_IDX(pid)})")
                case 5:
                    print(f"\tCHECK_ALLEGIANCE({PID_IDX(pid)})")
                case 6:
                    print(f"\tCHECK_COORDS({PID_IDX(pid)})")
                case 7:
                    print(f"\tCHECK_CLASS({PID_IDX(pid)})")
                case 8:
                    print(f"\tCHECK_LUCK({PID_IDX(pid)})")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_CHANGESTATE":
            pid_idx = PID_IDX(ctypes.c_int16(arg0).value)

            match sub_cmd:
                case 0:
                    print(f"\tREMU({pid_idx})")
                case 1:
                    print(f"\tREVEAL({pid_idx})")
                case 2:
                    print(f"\tCUSA({pid_idx})")
                case 3:
                    print(f"\tCUSN({pid_idx})")
                case 4:
                    print(f"\tCUSE({pid_idx})")
                case 5:
                    print(f"\tSET_HP({pid_idx})")
                case 6:
                    print(f"\tSET_ENDTURN({pid_idx})")
                case 7:
                    print(f"\t_3427({pid_idx})")
                case 8:
                    print(f"\tSET_STATE({pid_idx})")
                case 9:
                    print(f"\t_3529({pid_idx})")
                case 10:
                    print(f"\tCLEA")
                case 11:
                    print(f"\tCLEN")
                case 12:
                    print(f"\tCLEE")
                case 13:
                    print(f"\tKILL({pid_idx})")
                case 14:
                    print(f"\tDISA_IF({pid_idx})")
                case 15:
                    print(f"\tDISA({pid_idx})")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_CHANGECLASS":
            parse_event_todo(rom_data, off)

        case "EV_CMD_CHECKINAREA":
            pid_idx = PID_IDX(ctypes.c_int16(arg0).value)
            x, y, w, h = unpack_EvtParams4(arg32)
            print(f"\tCHECK_INAREA({pid_idx}, {x}, {y}, {w}, {h})")

        case "EV_CMD_GIVEITEM":
            pid_idx = PID_IDX(ctypes.c_int16(arg0).value)

            match sub_cmd:
                case 0:
                    print(f"\tGIVEITEMTO({pid_idx})")
                case 1:
                    print(f"\tGIVEITEMTOMAIN({pid_idx})")
                case 2:
                    print(f"\tGIVETOSLOT3({pid_idx})")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_CHANGEACTIVEUNIT":
            pid_idx = PID_IDX(ctypes.c_int16(arg0).value)
            print(f"\tCHANGEACTIVEUNIT({pid_idx})")

        case "EV_CMD_CHANGEAI":
            match sub_cmd:
                case 0:
                    pid_idx = PID_IDX(ctypes.c_int16(arg0).value)
                    print(f"\tCHAI({pid_idx})")
                case 1:
                    x, y = unpack_EvtSubParam16u8(arg0)
                    print(f"\tCHAI_AT({x}, {y})")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_DISPLAYPOPUP":
            match sub_cmd:
                case 0:
                    msg = arg0
                    songid, __unused__ = unpack_EvtParams2(arg32)
                    print(f"\tNOTIFY({hex(msg)}, {hex(songid)})")
                case 1:
                    msg = arg0
                    x, y = unpack_EvtParams2(arg32)
                    print(f"\tBROWNBOXTEXT({hex(msg)}, {x}, {y})")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_DISPLAYCURSOR":
            x, y = unpack_EvtSubParam16u8(arg0)
            pid_idx = PID_IDX(ctypes.c_int16(arg0).value)

            match sub_cmd:
                case 0:
                    print(f"\tCUMO_AT({x}, {y})")
                case 1:
                    print(f"\tCUMO_CHAR({pid_idx})")
                case 2:
                    print(f"\tCURE")
                case 4:
                    print(f"\tCURSOR_FLASHING({x}, {y})")
                case 5:
                    print(f"\tCURSOR_FLASHING_CHAR({pid_idx})")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_MOVE_CURSOR":
            match sub_cmd:
                case 0:
                    print(f"\tCHECK_CURSOR")
                case 1:
                    x, y = unpack_EvtSubParam16u8(arg0)
                    print(f"\tSET_CURSOR({x}, {y})")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_MENUOVERRIDE":
            match sub_cmd:
                case 0:
                    print(f"\tDISABLEOPTIONS({hex(arg0)})")
                case 1:
                    print(f"\tDISABLEWEAPONS({hex(arg0)})")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_PREPSCREEN":
            print(f"\tPREP")

        case "EV_CMD_SCRIPT_BATTLE":
            tmp1, tmp2 = unpack_EvtParams2(arg32)

            actor_idx  = PID_IDX(ctypes.c_int16(arg0).value)
            target_idx = PID_IDX(ctypes.c_int16(tmp1).value)
            weapon, ballista = unpack_EvtSubParam16u8(tmp2)

            match sub_cmd:
                case 0:
                    print(f"\tFIGHT({actor_idx}, {target_idx}, {weapon}, {ballista})")
                case 1:
                    print(f"\tFIGHT_MAP({actor_idx}, {target_idx}, {weapon}, {ballista})")
                case 2:
                    print(f"\tFIGHT_SCRIPT")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_PROM":
            pid_idx = PID_IDX(ctypes.c_int16(arg0).value)
            jid, item = unpack_EvtParams2(arg32)
            print(f"\tPROM({pid_idx}, {hex(jid)}, {hex(item)})")

        case "EV_CMD_WARP":
            parse_event_todo(rom_data, off)

        case "EV_CMD_EARTHQUAKE":
            direction, playse = unpack_EvtSubParam16u8(arg0)
            match sub_cmd:
                case 0:
                    print(f"\tEARTHQUAKE_START({direction}, {playse})")
                case 0xF:
                    print(f"\tEARTHQUAKE_END")
                case _:
                    parse_event_err(rom_data, off)

        case "EV_CMD_SUMMONUNIT":
            pid_idx = PID_IDX(ctypes.c_int16(arg0).value)
            print(f"\tSUMMONUNIT({pid_idx})")

        case "EV_CMD_BREAKSTONE":
            pid_idx = PID_IDX(ctypes.c_int16(arg0).value)
            print(f"\tBREAKSTONE({pid_idx})")

        case "EV_CMD_GLOWING_CROSS":
            pid_idx = PID_IDX(ctypes.c_int16(arg0).value)
            match sub_cmd:
                case 0:
                    print(f"\tGLOWINGCROSS({pid_idx})")
                case 0xF:
                    print(f"\tGLOWINGCROSS_END")
                case _:
                    parse_event_err(rom_data, off)

        # ========================================
        # WM events
        # ========================================
        case "EV_CMD_WM_CENTERCAMONLORD":
            mu_id = arg32
            print(f"\tWM_CENTERCAMONLORD({WM_MU_IDX[mu_id]})")

        case "EV_CMD_WM_SHOWDRAWNMAP":
            x = arg1
            y = arg2
            _map = arg2_u32_le
            x = ctypes.c_int16(x).value
            y = ctypes.c_int16(y).value
            print(f"\tWM_SHOWDRAWNMAP({x}, {y}, {hex(_map)})")

        case "EV_CMD_WM_C2":
            print("\tWmEvtNoFade // ENOSUPP in EAstdlib")

        case "EV_CMD_WM_SPAWNLORD":
            mu_id, pid = unpack_EvtParams2(arg1_u32_le)
            pid_idx = PID_IDX(ctypes.c_int16(pid).value)
            print(f"\tWM_SPAWNLORD({WM_MU_IDX[mu_id]}, {pid_idx}, {WM_NODES[arg2_u32_le]})")

        case "EV_CMD_WM_FADEOUT":
            speed = arg32
            print(f"\tWM_FADEOUT({speed})")

        case "EV_CMD_WM_TEXTDECORATE":
            print("\tWM_TEXTDECORATE // WaitFade")

        case "EV_CMD_WM_SHOWTEXTWINDOW":
            speed = arg1
            blend = arg2
            print(f"\tWM_SHOWTEXTWINDOW({speed}, 0x{blend:04X})")

        case "EV_CMD_WM_WAITFORTEXT":
            print("\tWM_WAITFORTEXT")

        case "EV_CMD_WM_TEXTSTART":
            print("\tWM_TEXTSTART")

        case "EV_CMD_WM_TEXT":
            text, unk = unpack_EvtParams2(arg32)
            print(f"\tWM_TEXT(0x{text:04X}, {unk})")

        case "EV_CMD_WM_MOVECAM2":
            x1, y1 = unpack_EvtParams2(arg32)
            x2, y2 = unpack_EvtParams2(arg2_u32_le)
            x1 = ctypes.c_int16(x1).value
            y1 = ctypes.c_int16(y1).value
            x2 = ctypes.c_int16(x2).value
            y2 = ctypes.c_int16(y2).value
            speed, delay = unpack_EvtParams2(arg3_u32_le)
            print(f"\tWM_MOVECAM2({x1}, {y1}, {x2}, {y2}, {speed}, {delay})")

        case "EV_CMD_WM_SHOWPORTRAIT":
            face_slot, face = unpack_EvtParams2(arg32)
            config, delay = unpack_EvtParams2(arg2_u32_le)
            print(f"\tWM_SHOWPORTRAIT({face_slot}, 0x{face:04X}, 0x{config:04X}, {delay})")

        case "EV_CMD_WM_HIGHLIGHT":
            nation = WM_NATIONS[arg32]
            print(f"\tWM_HIGHLIGHT({nation})")

        case "EV_CMD_WM_HIGHLIGHTCLEAR1":
            nation = WM_NATIONS[arg32]
            print(f"\tWM_HIGHLIGHTCLEAR1({nation})")

        case "EV_CMD_WM_HIGHLIGHTCLEAR2":
            nation = WM_NATIONS[arg32]
            print(f"\tWM_HIGHLIGHTCLEAR2({nation})")

        case "EV_CMD_WM_CLEARPORTRAIT":
            face_slot = arg0
            config, delay = unpack_EvtParams2(arg32)
            print(f"\tWM_CLEARPORTRAIT({face_slot}, 0x{config:04X}, {delay})")

        case "EV_CMD_WM_PLACEDOT":
            a, pal = unpack_EvtParams2(arg1_u32_le)
            node, eff = unpack_EvtParams2(arg2_u32_le)
            print(f"\tWM_PLACEDOT({a}, {pal}, {WM_NODES[node]}, {eff})")

        case "EV_CMD_WM_FXCLEAR1":
            a = ctypes.c_int32(arg1_u32_le).value
            print(f"\tWM_FXCLEAR1({hex(a)})")

        case "EV_CMD_WM_FXCLEAR2":
            a = ctypes.c_int32(arg1_u32_le).value
            print(f"\tWM_FXCLEAR2({hex(a)})")

        case "EV_CMD_PUTSPRITE":
            mu_id, jid = unpack_EvtParams2(arg1_u32_le)
            faction, node = unpack_EvtParams2(arg2_u32_le)
            print(f"\tPUTSPRITE({WM_MU_IDX[mu_id]}, {JID_IDX(jid)}, {FACTION_IDX[faction]}, {WM_NODES[node]})")

        case "EV_CMD_WM_PUTMOVINGSPRITE":
            mu_id, acc = unpack_EvtParams2(arg1_u32_le)
            x1, y1 = unpack_EvtParams2(arg2_u32_le)
            x2, y2 = unpack_EvtParams2(arg3_u32_le)
            time, flag = unpack_EvtParams2(arg4_u32_le)
            delay, _0 = unpack_EvtParams2(arg5_u32_le)
            print(f"\tWM_PUTMOVINGSPRITE({WM_MU_IDX[mu_id]}, {acc}, {hex(x1)}, {hex(y1)}, {hex(x2)}, {hex(y2)}, {time}, {hex(flag)}, {delay})")

        case "EV_CMD_WM_WAITFORSPRITES":
            mu_id = ctypes.c_int32(arg1_u32_le).value
            print(f"\tWM_WAITFORSPRITES({WM_MU_IDX[mu_id]})")

        case "EV_CMD_WM_REMSPRITE":
            mu_id = ctypes.c_int32(arg1_u32_le).value
            print(f"\tWM_REMSPRITE({WM_MU_IDX[mu_id]})")

        case "EV_CMD_WM_PUTSPRITE":
            mu_id, _0 = unpack_EvtParams2(arg1_u32_le)
            x, y = unpack_EvtParams2(arg2_u32_le)
            print(f"\tWM_PUTSPRITE({WM_MU_IDX[mu_id]}, {hex(x)}, {hex(y)})")

        case "EV_CMD_WM_FADEINSPRITE":
            mu_id, delay = unpack_EvtParams2(arg1_u32_le)
            print(f"\tWM_FADEINSPRITE({WM_MU_IDX[mu_id]}, {delay})")

        case "EV_CMD_WM_WAITFORSPRITELOAD":
            print("\tWM_WAITFORSPRITELOAD")

        case "EV_CMD_WM_REMOVETEXT":
            print("\tWM_REMOVETEXT")

        case "EV_CMD_WM_SKIPWN":
            print("\tSKIPWN")

        case "EV_CMD_WM_CREATENEXTDESTINATION":
            print("\tWM_CREATENEXTDESTINATION")

        case "EV_CMD_WM_WAITFORFX":
            print("\tWM_WAITFORFX")

        case "EV_CMD_WM_MAKELORDVISIBLE":
            mu_id = ctypes.c_int32(arg1_u32_le).value
            print(f"\tWM_MAKELORDVISIBLE({WM_MU_IDX[mu_id]})")

        case "EV_CMD_WM_DRAWPATH":
            path_idx = WM_PATH_IDX[arg32]
            print(f"\tWM_DRAWPATH({path_idx})")

        case "EV_CMD_WM_MOVECAM":
            x1, y1 = unpack_EvtParams2(arg32)
            x2, y2 = unpack_EvtParams2(arg2_u32_le)
            x1 = ctypes.c_int16(x1).value
            y1 = ctypes.c_int16(y1).value
            x2 = ctypes.c_int16(x2).value
            y2 = ctypes.c_int16(y2).value
            speed, delay = unpack_EvtParams2(arg3_u32_le)
            print(f"\tWM_MOVECAM({x1}, {y1}, {x2}, {y2}, {speed}, {delay})")

        case "EV_CMD_WM_WAITFORCAM":
            print("\tWM_WAITFORCAM")

        case "EV_CMD_WM_WAITFORFXCLEAR1":
            print("\tWmEvtRemoveBigMap // WM_WAITFORFXCLEAR1")

        case "EV_CMD_WM_WAITFORFXCLEAR2":
            print("\tWmEvtWaitBigMapRemove // WM_WAITFORFXCLEAR2")

        case "EV_CMD_WM_MOVESPRITETO":
            wm_uid, conf = unpack_EvtParams2(arg1_u32_le)
            node1, node2 = unpack_EvtParams2(arg2_u32_le)
            speed, delay = unpack_EvtParams2(arg3_u32_le)
            speed = ctypes.c_int16(speed).value
            print(f"\tWM_MOVESPRITETO({WM_MU_IDX[wm_uid]}, 0x{conf:04X}, {WM_NODES[node1]}, {WM_NODES[node2]}, {speed}, {delay})")

        case "EV_CMD_WM_MAKELORDDISAPPEAR":
            wm_uid = arg1_u32_le
            print(f"\tWM_MAKELORDDISAPPEAR({WM_MU_IDX[wm_uid]})")

        case "EV_CMD_WM_FADEOUTSPRITE":
            wm_uid, speed = unpack_EvtParams2(arg1_u32_le)
            print(f"\tWM_FADEOUTSPRITE({WM_MU_IDX[wm_uid]}, {speed})")

        case "EV_CMD_WM_84":
            node = arg1_u32_le
            print(f"\tWmEvtSetCamToNode({WM_NODES[node]}) // ENOSUPP in EAstdlib")

        case "EV_CMD_WM_A6":
            wm_uid, node = unpack_EvtParams2(arg1_u32_le)
            print(f"\tWmEvtSetUnitOnNode({WM_MU_IDX[wm_uid]}, {WM_NODES[node]}) // ENOSUPP in EAstdlib")

        case "EV_CMD_WM_9B":
            node = arg1_u32_le
            print(f"\tWmEvtSetNextStoryNode({WM_NODES[node]}) // ENOSUPP in EAstdlib")

        case "EV_CMD_WM_REMOVELOCATION":
            node = arg1_u32_le
            print(f"\tWM_REMOVELOCATION({WM_NODES[node]})")

        case "EV_CMD_WM_REMOVEPATH":
            path = arg1_u32_le
            print(f"\tWM_REMOVEPATH({WM_PATH_IDX[path]})")

        case "EV_CMD_WM_LOADLOCATION2":
            node = arg1_u32_le
            print(f"\tWM_LOADLOCATION2({WM_NODES[node]})")

        case "EV_CMD_WM_SETDESTINATION":
            node = arg1_u32_le
            print(f"\tWM_SETDESTINATION({WM_NODES[node]})")

        case "EV_CMD_WM_LOADLOCATION3":
            node = arg1_u32_le
            print(f"\tWM_LOADLOCATION3({WM_NODES[node]})")

        case "EV_CMD_WM_DRAWPATH2":
            path = arg1_u32_le
            print(f"\tWM_DRAWPATH2({WM_PATH_IDX[path]})")

        case "EV_CMD_WM_88":
            x, y = unpack_EvtParams2(arg1_u32_le)
            wm_uid, speed = unpack_EvtParams2(arg2_u32_le)
            delay, _0 = unpack_EvtParams2(arg3_u32_le)

            x = ctypes.c_int16(x).value
            y = ctypes.c_int16(y).value
            print(f"\tWmEvtMoveCamToUnit({x}, {y}, {WM_MU_IDX[wm_uid]}, {speed}, {delay}) // ENOSUPP in EAstdlib")

        case "EV_CMD_WM_MOVECAMTO":
            x, y = unpack_EvtParams2(arg1_u32_le)
            node, speed = unpack_EvtParams2(arg2_u32_le)
            delay, _0 = unpack_EvtParams2(arg3_u32_le)

            x = ctypes.c_int16(x).value
            y = ctypes.c_int16(y).value
            print(f"\tWM_MOVECAMTO({x}, {y}, {WM_NODES[node]}, {speed}, {delay})")

        case "EV_CMD_WM_AA":
            wm_uid = arg1_u32_le
            print(f"\tWmEvtPasueMove({WM_MU_IDX[wm_uid]}) // ENOSUPP in EAstdlib")

        case "EV_CMD_WM_AB":
            wm_uid = arg1_u32_le
            print(f"\tWmEvtResumeMove({WM_MU_IDX[wm_uid]}) // ENOSUPP in EAstdlib")

        case "EV_CMD_WM_SETCAM":
            x, y = unpack_EvtParams2(arg1_u32_le)
            x = ctypes.c_int16(x).value
            y = ctypes.c_int16(y).value
            print(f"\tWM_SETCAM({x}, {y})")

        case "EV_CMD_DRAWPATH3":
            path = arg1_u32_le
            print(f"\tDRAWPATH3({WM_PATH_IDX[path]})")

        case "EV_CMD_WM_9D":
            node = arg1_u32_le
            print(f"\tWmEvtSetNodeStateNot2({WM_NODES[node]}) // ENOSUPP in EAstdlib")

        case "EV_CMD_WM_SATURATE_COLORS":
            speed = arg1_u32_le
            print(f"\tWmEvtFadeInDark({speed}) // WM_SATURATE_COLORS")

        case "EV_CMD_WM_AE":
            print("\tWmEvtWaitFadeInDark // ENOSUPP in EAstdlib")

        case _:
            parse_event_todo(rom_data, off)

    return cmd, off + cmd_len * 2 # sizeof(u16)

def dump_one_event(rom_data, off):
    ptr = 0x08000000 | off
    if ptr not in _symbols:
        scr_name = f"EventScr_{off + 0x08000000:08X}"
    else:
        scr_name = _symbols[ptr]

    print(f"CONST_DATA EventScr {scr_name}[] = " + "{")
    while True:
        cmd, off = parse_event(rom_data, off)

        if cmd in EVENT_COMMANDS and EVENT_COMMANDS[cmd] == "EV_CMD_END":
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
            off = dump_one_event(rom_data, off)

            if off_end <= off:
                break

if __name__ == '__main__':
    main(sys.argv)
