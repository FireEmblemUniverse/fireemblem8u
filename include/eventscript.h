#pragma once

#include "event.h"
#include "eventinfo.h"

enum event_cmd_idx {
    EV_CMD_NOP              = 0x00,
    EV_CMD_END              = 0x01,
    EV_CMD_EVSET            = 0x02,
    EV_CMD_EVCHECK          = 0x03,
    EV_CMD_RANDOMNUMBER     = 0x04,
    EV_CMD_SVAL             = 0x05,
    EV_CMD_SLOT_OPS         = 0x06,
    EV_CMD_QUEUE_OPS        = 0x07,
    EV_CMD_LABEL            = 0x08,
    EV_CMD_GOTO             = 0x09,
    EV_CMD_CALL             = 0x0A,
    EV_CMD_0B               = 0x0B,
    EV_CMD_BRANCH           = 0x0C,
    EV_CMD_ASMC             = 0x0D,
    EV_CMD_STALL            = 0x0E,
    EV_CMD_COUNTER          = 0x0F,
    EV_CMD_EVBITMODIFY      = 0x10,
    EV_CMD_IGNOREKEYS       = 0x11,
    EV_CMD_BGMCHANGE_12     = 0x12,
    EV_CMD_BGMCHANGE_13     = 0x13,
    EV_CMD_BGMOVERWRITE     = 0x14,
    EV_CMD_BGMVOLUMECHANGE  = 0x15,
    EV_CMD_PLAYSE           = 0x16,
    EV_CMD_FADE             = 0x17,
    EV_CMD_COLORFADE        = 0x18,
    EV_CMD_CHECKVARIOUS     = 0x19,
    EV_CMD_SETTEXTTYPE      = 0x1A,
    EV_CMD_DISPLAYTEXT      = 0x1B,
    EV_CMD_CONTINUETEXT     = 0x1C,
    EV_CMD_ENDTEXT          = 0x1D,
    EV_CMD_DISPLAYFACE      = 0x1E,
    EV_CMD_MOVEFACE         = 0x1F,
    EV_CMD_CLEARTEXTBOX     = 0x20,
    EV_CMD_SHOWBG           = 0x21,
    EV_CMD_CLEARSCREEN      = 0x22,
    EV_CMD_23               = 0x23,
    EV_CMD_24               = 0x24,
    EV_CMD_LOMA             = 0x25,
    EV_CMD_CAMERACONTROL    = 0x26,
    EV_CMD_27               = 0x27,
    EV_CMD_CHANGEWEATHER    = 0x28,
    EV_CMD_CHANGEFOGVISION  = 0x29,
    EV_CMD_CHANGECHAPTER    = 0x2A,
    EV_CMD_2B               = 0x2B,
    EV_CMD_LOADUNIT         = 0x2C,
    EV_CMD_2D               = 0x2D,
    EV_CMD_2E               = 0x2E,
    EV_CMD_MOVEUNIT         = 0x2F,
    EV_CMD_ENUN             = 0x30,
    EV_CMD_TOGGLERANGE      = 0x31,
    EV_CMD_LOADSINGLEUNIT   = 0x32,
    EV_CMD_CHECKSTATE       = 0x33,
    EV_CMD_CHANGESTATE      = 0x34,
    EV_CMD_CHANGECLASS      = 0x35,
    EV_CMD_CHECKINAREA      = 0x36,
    EV_CMD_GIVEITEM         = 0x37,
    EV_CMD_CHANGEACTIVEUNIT = 0x38,
    EV_CMD_CHANGEAI         = 0x39,
    EV_CMD_DISPLAYPOPUP     = 0x3A,
    EV_CMD_DISPLAYCURSOR    = 0x3B,
    EV_CMD_3C               = 0x3C,
    EV_CMD_3D               = 0x3D,
    EV_CMD_PREPSCREEN       = 0x3E,
    EV_CMD_3F               = 0x3F,
    EV_CMD_40               = 0x40,
    EV_CMD_41               = 0x41,
    EV_CMD_42               = 0x42,
    EV_CMD_43               = 0x43,
    EV_CMD_44               = 0x44,
    EV_CMD_45               = 0x45,
};

enum event_sub_cmd_idx {

    /* EV_CMD_END */
    EVSUBCMD_ENDA = 0,
    EVSUBCMD_ENDB = 1,

    /* EV_CMD_EVSET */
    EVSUBCMD_EVBIT_F = 0,
    EVSUBCMD_EVBIT_T = 8,
    EVSUBCMD_ENUF = 1,
    EVSUBCMD_ENUT = 9,

    /* EV_CMD_EVCHECK */
    EVSUBCMD_CHECK_EVBIT = 0,
    EVSUBCMD_CHECK_EVENTID = 1,

    /* EV_CMD_SLOT_OPS */
    EVSUBCMD_SADD = 0,
    EVSUBCMD_SSUB = 1,
    EVSUBCMD_SMUL = 2,
    EVSUBCMD_SDIV = 3,
    EVSUBCMD_SMOD = 4,
    EVSUBCMD_SAND = 5,
    EVSUBCMD_SORR = 6,
    EVSUBCMD_SXOR = 7,
    EVSUBCMD_SLSL = 8,
    EVSUBCMD_SLSR = 9,

    /* EV_CMD_QUEUE_OPS */
    EVSUBCMD_SENQUEUE = 0,
    EVSUBCMD_SDEQUEUE_S1 = 1,
    EVSUBCMD_SDEQUEUE = 2,

    /* EV_CMD_BRANCH */
    EVSUBCMD_BEQ = 0,
    EVSUBCMD_BNE = 1,
    EVSUBCMD_BGE = 2,
    EVSUBCMD_BGT = 3,
    EVSUBCMD_BLE = 4,
    EVSUBCMD_BLT = 5,

    /* EV_CMD_STALL */
    EVSUBCMD_STAL = 0,
    EVSUBCMD_STAL1 = 1,
    EVSUBCMD_STAL2 = 2,
    EVSUBCMD_STAL3 = 3,

    /* EV_CMD_BGMVOLUMECHANGE */
    EVSUBCMD_MUSI = 0,
    EVSUBCMD_MUNO = 1,

    /* EV_CMD_CHECKVARIOUS */
    EVSUBCMD_CHECK_MODE = 0,
    EVSUBCMD_CHECK_CHAPTER_NUMBER = 0x1,
    EVSUBCMD_CHECK_HARD = 0x2,
    EVSUBCMD_CHECK_TURNS = 0x3,
    EVSUBCMD_CHECK_ENEMIES = 0x4,
    EVSUBCMD_CHECK_OTHERS = 0x5,
    EVSUBCMD_CHECK_SKIRMISH = 0x6,
    EVSUBCMD_CHECK_TUTORIAL = 0x7,
    EVSUBCMD_CHECK_MONEY = 0x8,
    EVSUBCMD_19CHECK_EVENTID = 0x9,
    EVSUBCMD_CHECK_POSTGAME = 0xA,

    /* EV_CMD_LOADUNIT */
    EVSUBCMD_LOAD1 = 0x0,
    EVSUBCMD_LOAD2 = 0x1,
    EVSUBCMD_LOAD3 = 0x2,
    EVSUBCMD_LOAD4 = 0x3,

    /* EV_CMD_CHANGESTATE */
    EVSUBCMD_REMU = 0x0,
    EVSUBCMD_REVEAL = 0x1,
    EVSUBCMD_CUSA = 0x2,
    EVSUBCMD_CUSN = 0x3,
    EVSUBCMD_CUSE = 0x4,
    EVSUBCMD_SET_HP = 0x5,
    EVSUBCMD_SET_ENDTURN = 0x6,
    EVSUBCMD_3427 = 0x7,
    EVSUBCMD_SET_STATE = 0x8,
    EVSUBCMD_3529 = 0x9,
    EVSUBCMD_CLEA = 0xA,
    EVSUBCMD_CLEN = 0xB,
    EVSUBCMD_CLEE = 0xC,
    EVSUBCMD_SET_SOMETHING = 0xD,
    EVSUBCMD_DISA_IF = 0xE,
    EVSUBCMD_DISA = 0xF,

    /* EV_CMD_DISPLAYCURSOR */
    EVSUBCMD_CURSOR_AT = 0x0,
    EVSUBCMD_CURSOR_UNIT = 0x1,
    EVSUBCMD_CURE = 0x2,
    EVSUBCMD_CURSOR_FLASHING_AT = 0x4,
    EVSUBCMD_CURSOR_FLASHING_UNIT = 0x5,
};

#define _EvtParams2(x, y) ((((y) & 0xFFFF) << 16) + ((x) & 0xFFFF))
#define _EvtParams4(a, b, c, d) ((((d) & 0xFF) << 24) + (((c) & 0xFF) << 16) + (((b) & 0xFF) << 8) + ((a) & 0xFF))
#define _EvtCmd(cmd, len, sub) \
( \
    (((cmd) & 0xFF) << 8) + \
    (((len) & 0x0F) << 4) + \
    (((sub) & 0x0F) << 0) \
)
#define _EvtArg0(cmd, len, sub, arg0) _EvtParams2(_EvtCmd(cmd, len, sub), arg0)
#define _EvtAutoCmdLen2(cmd) _EvtArg0(cmd, 2, 0, 0)
#define _EvtAutoCmdLen4(cmd) _EvtArg0(cmd, 4, 0, 0)

#define EvtEnd ((EventListScr)0)
#define EvtClearEvBits(flag) _EvtArg0(EV_CMD_EVSET, 2, EVSUBCMD_EVBIT_F, (flag)),
#define EvtSetEvBits(flag) _EvtArg0(EV_CMD_EVSET, 2, EVSUBCMD_EVBIT_T, (flag)),
#define EvtClearFlag(flag) _EvtArg0(EV_CMD_EVSET, 2, EVSUBCMD_ENUF, (flag)),
#define EvtSetFlag(flag) _EvtArg0(EV_CMD_EVSET, 2, EVSUBCMD_ENUT, (flag)),
#define EvtSetSlot(slot, value) _EvtArg0(EV_CMD_SVAL, 4, 0, (slot)), (EventListScr)(value),
#define EvtLabel(label) _EvtAutoCmdLen2(EV_CMD_LABEL),
#define EvtCall(scr) _EvtAutoCmdLen4(EV_CMD_CALL), (EventListScr)(scr),
#define EvtBNE(label, s1, s2) _EvtArg0(EV_CMD_BRANCH, 4, EVSUBCMD_BNE, (label)), _EvtParams2((s1), (s2)),
#define EvtAsmCall(func) _EvtAutoCmdLen4(EV_CMD_ASMC), (EventListScr)(func),
#define EvtSleep(time) _EvtArg0(EV_CMD_STALL, 2, EVSUBCMD_STAL, (time)),
#define EvtSleepWithCancel(time) _EvtArg0(EV_CMD_STALL, 2, EVSUBCMD_STAL1, (time)),
#define EvtSleepWithGameCtrl(time) _EvtArg0(EV_CMD_STALL, 2, EVSUBCMD_STAL2, (time)),
#define EvtSleepWithCancelGameCtrl(time) _EvtArg0(EV_CMD_STALL, 2, EVSUBCMD_STAL3, (time)),
#define EvtSetVolumeDown _EvtArg0(EV_CMD_BGMVOLUMECHANGE, 2, EVSUBCMD_MUSI, 0),
#define EvtUnsetVolumeDown _EvtArg0(EV_CMD_BGMVOLUMECHANGE, 2, EVSUBCMD_MUNO, 0),
#define EvtCheckTutorial _EvtArg0(EV_CMD_CHECKVARIOUS, 2, EVSUBCMD_CHECK_TUTORIAL, 0),
#define EvtLoadUnit1(restriction, units) _EvtArg0(EV_CMD_LOADUNIT, 4, EVSUBCMD_LOAD1, (restriction)), (EventListScr)(units),
#define EvtWaitMoveUnit _EvtAutoCmdLen2(EV_CMD_ENUN),
#define EvtSetHpFormSlot1(pid) _EvtArg0(EV_CMD_CHANGESTATE, 2, EVSUBCMD_SET_HP, (pid)),
#define EvtDisplayCursorAtUnit(pid) _EvtArg0(EV_CMD_DISPLAYCURSOR, 2, EVSUBCMD_CURSOR_UNIT, (pid)),
#define EvtEndCursor _EvtArg0(EV_CMD_DISPLAYCURSOR, 2, EVSUBCMD_CURE, 0),
#define EvtDisplayFlashingCursorAtUnit(pid) _EvtArg0(EV_CMD_DISPLAYCURSOR, 2, EVSUBCMD_CURSOR_FLASHING_UNIT, (pid)),

enum event_trigger_types {
    EVT_LIST_CMD_END,
    EVT_LIST_CMD_FLAG,
    EVT_LIST_CMD_TURN,
    EVT_LIST_CMD_CHAR,
    EVT_LIST_CMD_CHARASM,
    EVT_LIST_CMD_LOCA,
    EVT_LIST_CMD_VILL,
    EVT_LIST_CMD_CHES,
    EVT_LIST_CMD_DOOR,
    EVT_LIST_CMD_DRAWBRIDGE,
    EVT_LIST_CMD_SHOP,
    EVT_LIST_CMD_AREA,
    EVT_LIST_CMD_NEVER_C,
    EVT_LIST_CMD_NEVER_D,
    EVT_LIST_CMD_E,
    EVT_LIST_CMD_F,
    EVT_LIST_CMD_10,
};

#define EvtListEnd \
    _EvtParams2(EVT_LIST_CMD_END, 0),

#define EvtListFlag(ent_flag, scr, flag) \
    _EvtParams2(EVT_LIST_CMD_FLAG, (ent_flag)), (EventListScr) (scr), (flag),

#define EvtListTurn(ent_flag, scr, turn, turn_max, faction) \
    _EvtParams2(EVT_LIST_CMD_TURN, (ent_flag)), (EventListScr) (scr), _EvtParams4((turn), (turn_max), (faction), 0),
