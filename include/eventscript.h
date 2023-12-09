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
    EV_CMD_SCRIPT_BATTLE    = 0x3F,
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
    EVSUBCMD_SENQUEUE_S1 = 1,
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

    /* EV_CMD_BGMCHANGE_12 */

    /* EV_CMD_BGMCHANGE_13 */
    EVSUBCMD_MUSCFAST = 2,
    EVSUBCMD_MUSCMID = 4,
    EVSUBCMD_MUSCSLOW = 6,

    /* EV_CMD_BGMVOLUMECHANGE */
    EVSUBCMD_MUSI = 0,
    EVSUBCMD_MUNO = 1,

    /* EV_CMD_FADE */
    EVSUBCMD_FADU = 0,
    EVSUBCMD_FADI = 1,
    EVSUBCMD_FAWU = 2,
    EVSUBCMD_FAWI = 3,

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

    /* EV_CMD_SETTEXTTYPE */
    EVSUBCMD_TEXTSTART = 0,
    EVSUBCMD_REMOVEPORTRAITS = 1,
    EVSUBCMD_0x1A22 = 2,
    EVSUBCMD_TUTORIALTEXTBOXSTART = 3,
    EVSUBCMD_SOLOTEXTBOXSTART = 4,
    EVSUBCMD_0x1A25 = 5,

    /* EV_CMD_DISPLAYTEXT */
    EVSUBCMD_TEXTSHOW = 0,
    EVSUBCMD_TEXTSHOW2 = 1,
    EVSUBCMD_REMA = 2,

    /* EV_CMD_LOADUNIT */
    EVSUBCMD_LOAD1 = 0x0,
    EVSUBCMD_LOAD2 = 0x1,
    EVSUBCMD_LOAD3 = 0x2,
    EVSUBCMD_LOAD4 = 0x3,

    /* EV_CMD_MOVEUNIT */
    EVSUBCMD_MOVE = 0,
    EVSUBCMD_MOVEONTO = 1,
    EVSUBCMD_MOVE_1STEP = 2,
    EVSUBCMD_MOVEFORCED = 3,
    EVSUBCMD_MOVE_TO_CLOSE_IF_TERRAIN = 8,

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

    /* EV_CMD_DISPLAYPOPUP */
    EVSUBCMD_POPUP = 0,
    EVSUBCMD_BROWNTEXTBOX = 1,

    /* EV_CMD_DISPLAYCURSOR */
    EVSUBCMD_CURSOR_AT = 0x0,
    EVSUBCMD_CURSOR_UNIT = 0x1,
    EVSUBCMD_CURE = 0x2,
    EVSUBCMD_CURSOR_FLASHING_AT = 0x4,
    EVSUBCMD_CURSOR_FLASHING_UNIT = 0x5,

    /* EV_CMD_SCRIPT_BATTLE */
    EVSUBCMD_FIGHT = 0,
    EVSUBCMD_FIGHT_MAP = 1,
    EVSUBCMD_FIGHT_SCRIPT = 2,
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

#define EvtReturn _EvtArg0(EV_CMD_END, 2, EVSUBCMD_ENDA, 0),
#define EvtEndAll _EvtArg0(EV_CMD_END, 2, EVSUBCMD_ENDB, 0),
#define EvtClearEvBits(flag) _EvtArg0(EV_CMD_EVSET, 2, EVSUBCMD_EVBIT_F, (flag)),
#define EvtSetEvBits(flag) _EvtArg0(EV_CMD_EVSET, 2, EVSUBCMD_EVBIT_T, (flag)),
#define EvtClearFlag(flag) _EvtArg0(EV_CMD_EVSET, 2, EVSUBCMD_ENUF, (flag)),
#define EvtSetFlag(flag) _EvtArg0(EV_CMD_EVSET, 2, EVSUBCMD_ENUT, (flag)),
#define EvtSetSlot(slot, value) _EvtArg0(EV_CMD_SVAL, 4, 0, (slot)), (EventListScr)(value),
#define EvtEnqueueFormSlot(slot) _EvtArg0(EV_CMD_QUEUE_OPS, 2, EVSUBCMD_SENQUEUE, (slot)),
#define EvtEnqueueFormSlot1 _EvtArg0(EV_CMD_QUEUE_OPS, 2, EVSUBCMD_SENQUEUE_S1, 0),
#define EvtDequeueToSlot(slot) _EvtArg0(EV_CMD_QUEUE_OPS, 2, EVSUBCMD_SDEQUEUE, (slot)),
#define EvtLabel(label) _EvtAutoCmdLen2(EV_CMD_LABEL),
#define EvtCall(scr) _EvtAutoCmdLen4(EV_CMD_CALL), (EventListScr)(scr),
#define EvtBNE(label, s1, s2) _EvtArg0(EV_CMD_BRANCH, 4, EVSUBCMD_BNE, (label)), _EvtParams2((s1), (s2)),
#define EvtAsmCall(func) _EvtAutoCmdLen4(EV_CMD_ASMC), (EventListScr)(func),
#define EvtSleep(time) _EvtArg0(EV_CMD_STALL, 2, EVSUBCMD_STAL, (time)),
#define EvtSleepWithCancel(time) _EvtArg0(EV_CMD_STALL, 2, EVSUBCMD_STAL1, (time)),
#define EvtSleepWithGameCtrl(time) _EvtArg0(EV_CMD_STALL, 2, EVSUBCMD_STAL2, (time)),
#define EvtSleepWithCancelGameCtrl(time) _EvtArg0(EV_CMD_STALL, 2, EVSUBCMD_STAL3, (time)),
#define EvtStartBgm(bgm) _EvtArg0(EV_CMD_BGMCHANGE_12, 2, 0, (bgm)),
#define EvtBgmFadeInFast(bgm) _EvtArg0(EV_CMD_BGMCHANGE_13, 2, EVSUBCMD_MUSCFAST, (bgm)),
#define EvtBgmFadeInMiddleSpeed(bgm) _EvtArg0(EV_CMD_BGMCHANGE_13, 2, EVSUBCMD_MUSCMID, (bgm)),
#define EvtBgmFadeInSlowly(bgm) _EvtArg0(EV_CMD_BGMCHANGE_13, 2, EVSUBCMD_MUSCSLOW, (bgm)),
#define EvtSetVolumeDown _EvtArg0(EV_CMD_BGMVOLUMECHANGE, 2, EVSUBCMD_MUSI, 0),
#define EvtUnsetVolumeDown _EvtArg0(EV_CMD_BGMVOLUMECHANGE, 2, EVSUBCMD_MUNO, 0),
#define EvtFadeOutBlack(speed) _EvtArg0(EV_CMD_FADE, 2, EVSUBCMD_FADU, (speed)),
#define EvtFadeInBlack(speed) _EvtArg0(EV_CMD_FADE, 2, EVSUBCMD_FADI, (speed)),
#define EvtFadeOutWhite(speed) _EvtArg0(EV_CMD_FADE, 2, EVSUBCMD_FAWU, (speed)),
#define EvtFadeInWhite(speed) _EvtArg0(EV_CMD_FADE, 2, EVSUBCMD_FAWI, (speed)),
#define EvtCheckTutorial _EvtArg0(EV_CMD_CHECKVARIOUS, 2, EVSUBCMD_CHECK_TUTORIAL, 0),
#define EvtTextStart _EvtArg0(EV_CMD_SETTEXTTYPE, 2, EVSUBCMD_TEXTSTART, 0),
#define EvtTextShow(msg) _EvtArg0(EV_CMD_DISPLAYTEXT, 2, EVSUBCMD_TEXTSHOW, (msg)),
#define EvtTextRemoveAll _EvtArg0(EV_CMD_DISPLAYTEXT, 2, EVSUBCMD_REMA, 0),
#define EvtTextEnd _EvtAutoCmdLen2(EV_CMD_ENDTEXT),
#define EvtLoadMap(chapter) _EvtArg0(EV_CMD_LOMA, 2, 0, (chapter)),
#define EvtMoveCameraTo(x, y) _EvtArg0(EV_CMD_CAMERACONTROL, 2, 0, ((((y) & 0xFF) << 8) + ((x) & 0xFF))),
#define EvtLoadUnit1(restriction, units) _EvtArg0(EV_CMD_LOADUNIT, 4, EVSUBCMD_LOAD1, (restriction)), (EventListScr)(units),
#define EvtLoadUnit2(restriction, units) _EvtArg0(EV_CMD_LOADUNIT, 4, EVSUBCMD_LOAD2, (restriction)), (EventListScr)(units),
#define EvtMoveUnit(speed, pid, x, y) _EvtArg0(EV_CMD_MOVEUNIT, 4, EVSUBCMD_MOVE, (speed)), _EvtParams4(pid, 0, (x), (y)),
#define EvtMoveUnitToTarget(speed, pid, pid_target) _EvtArg0(EV_CMD_MOVEUNIT, 4, EVSUBCMD_MOVEONTO, (speed)), _EvtParams2((pid), (pid_target)),
#define EvtMoveUnitOneStpe(speed, pid, direction) _EvtArg0(EV_CMD_MOVEUNIT, 4, EVSUBCMD_MOVE_1STEP, (speed)), _EvtParams2((pid), (direction)),
#define EvtMoveUnitByQueue(pid) _EvtArg0(EV_CMD_MOVEUNIT, 4, EVSUBCMD_MOVEFORCED, 0), _EvtParams2((pid), 0),
#define EvtMoveUnitToValidTerrain(speed, pid, x, y) _EvtArg0(EV_CMD_MOVEUNIT, 4, EVSUBCMD_MOVE_TO_CLOSE_IF_TERRAIN, (speed)), _EvtParams4(pid, 0, (x), (y)),
#define EvtWaitUnitMoving _EvtAutoCmdLen2(EV_CMD_ENUN),
#define EvtSetHpFormSlot1(pid) _EvtArg0(EV_CMD_CHANGESTATE, 2, EVSUBCMD_SET_HP, (pid)),
#define EvtHideAllAlliess _EvtArg0(EV_CMD_CHANGESTATE, 2, EVSUBCMD_CLEA, 0),
#define EvtRemoveAllNpcs _EvtArg0(EV_CMD_CHANGESTATE, 2, EVSUBCMD_CLEN, 0),
#define EvtRemoveAllEimies _EvtArg0(EV_CMD_CHANGESTATE, 2, EVSUBCMD_CLEE, 0),
#define EvtRemoveUnit(pid) _EvtArg0(EV_CMD_CHANGESTATE, 2, EVSUBCMD_DISA, (pid)),
#define EvtDisplayPopupSilently(msg, x, y) _EvtArg0(EV_CMD_DISPLAYPOPUP, 4, EVSUBCMD_BROWNTEXTBOX, (msg)), _EvtParams2((x), (y)),
#define EvtDisplayCursorAtUnit(pid) _EvtArg0(EV_CMD_DISPLAYCURSOR, 2, EVSUBCMD_CURSOR_UNIT, (pid)),
#define EvtEndCursor _EvtArg0(EV_CMD_DISPLAYCURSOR, 2, EVSUBCMD_CURE, 0),
#define EvtDisplayFlashingCursorAtUnit(pid) _EvtArg0(EV_CMD_DISPLAYCURSOR, 2, EVSUBCMD_CURSOR_FLASHING_UNIT, (pid)),
#define EvtStartEventBattle(actor, target, weapon, ballista) _EvtArg0(EV_CMD_SCRIPT_BATTLE, 4, EVSUBCMD_FIGHT, (actor)), _EvtParams4((target), 0, (weapon), (ballista)),
#define EvtStartEventMapBattle(actor, target, weapon, ballista) _EvtArg0(EV_CMD_SCRIPT_BATTLE, 4, EVSUBCMD_FIGHT_MAP, (actor)), _EvtParams4((target), 0, (weapon), (ballista)),
#define EvtStartScriptedBattle(actor, target, weapon, ballista) _EvtArg0(EV_CMD_SCRIPT_BATTLE, 4, EVSUBCMD_FIGHT_SCRIPT, (actor)), _EvtParams4((target), 0, (weapon), (ballista)),

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
