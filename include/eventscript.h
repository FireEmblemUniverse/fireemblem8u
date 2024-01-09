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
    EV_CMD_ENQUEUE_CALL     = 0x0B,
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
    EV_CMD_TILE_CHANGE      = 0x27,
    EV_CMD_CHANGEWEATHER    = 0x28,
    EV_CMD_CHANGEFOGVISION  = 0x29,
    EV_CMD_CHANGECHAPTER    = 0x2A,
    EV_CMD_LOAD_PRECONF     = 0x2B,
    EV_CMD_LOADUNIT         = 0x2C,
    EV_CMD_CHANGE_PAL       = 0x2D,
    EV_CMD_GET_PID          = 0x2E,
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
    EV_CMD_MOVE_CURSOR      = 0x3C,
    EV_CMD_MENUOVERRIDE     = 0x3D,
    EV_CMD_PREPSCREEN       = 0x3E,
    EV_CMD_SCRIPT_BATTLE    = 0x3F,
    EV_CMD_40               = 0x40,
    EV_CMD_WARP             = 0x41,
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

    /* EV_CMD_ENQUEUE_CALL */
    EVSUBCMD_ENQUEUE_DIRECT = 0,
    EVSUBCMD_ENQUEUE_TRIGGER = 1,

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
    EVSUBCMD_MUSCSSLOW = 8,

    /* EV_CMD_BGMOVERWRITE */
    EVSUBCMD_MUSS = 0,
    EVSUBCMD_MURE = 1,

    /* EV_CMD_BGMVOLUMECHANGE */
    EVSUBCMD_MUSI = 0,
    EVSUBCMD_MUNO = 1,

    /* EV_CMD_PLAYSE */

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

    /* EV_CMD_SHOWBG */
    EVSUBCMD_BACG = 0,
    EVSUBCMD_0x2141 = 1,
    EVSUBCMD_2142 = 2,
    EVSUBCMD_2143 = 3,

    /* EV_CMD_CAMERACONTROL */
    EVSUBCMD_CAMERA_AT = 0,
    EVSUBCMD_CAMERA_CHAR = 1,
    EVSUBCMD_CAMERA2_AT = 8,
    EVSUBCMD_CAMERA2_CHAR = 9,

    /* EV_CMD_TILE_CHANGE */
    EVSUBCMD_TILECHANGE = 0,
    EVSUBCMD_TILEREVERT = 1,

    /* EV_CMD_CHANGECHAPTER */
    EVSUBCMD_MNTS = 0,
    EVSUBCMD_MNCH = 1,
    EVSUBCMD_MNC2 = 2,
    EVSUBCMD_MNC3 = 3,
    EVSUBCMD_MNC4 = 4,

    /* EV_CMD_LOAD_PRECONF */
    EVSUBCMD_LOAD_SETCOUNT = 0,
    EVSUBCMD_LOAD_SETCHANCE = 1,
    EVSUBCMD_LOAD_NOREDA = 2,

    /* EV_CMD_LOADUNIT */
    EVSUBCMD_LOAD1 = 0x0,
    EVSUBCMD_LOAD2 = 0x1,
    EVSUBCMD_LOAD3 = 0x2,
    EVSUBCMD_LOAD4 = 0x3,

    /* EV_CMD_GET_PID */
    EVSUBCMD_CHECK_AT = 0,
    EVSUBCMD_CHECK_ACTIVE = 1,

    /* EV_CMD_MOVEUNIT */
    EVSUBCMD_MOVE = 0,
    EVSUBCMD_MOVEONTO = 1,
    EVSUBCMD_MOVE_1STEP = 2,
    EVSUBCMD_MOVE_DEFINED = 3,
    EVSUBCMD_MOVE_CLOSEST = 8,
    EVSUBCMD_MOVE_NEXTTO = 9,
    EVSUBCMD_MOVE_1STEP_CLOSEST = 10,
    EVSUBCMD_MOVE_DEFINED_CLOSEST = 11,

    /* EV_CMD_CHECKSTATE */
    EVSUBCMD_CHECK_EXISTS = 0,
    EVSUBCMD_CHECK_STATUS = 1,
    EVSUBCMD_CHECK_ALIVE = 2,
    EVSUBCMD_CHECK_DEPLOYED = 3,
    EVSUBCMD_CHECK_ACTIVEID = 4,
    EVSUBCMD_CHECK_ALLEGIANCE = 5,
    EVSUBCMD_CHECK_COORDS = 6,
    EVSUBCMD_CHECK_CLASS = 7,
    EVSUBCMD_CHECK_LUCK = 8,

    /* EV_CMD_TOGGLERANGE */
    EVSUBCMD_SHOW_ATTACK_RANGE = 0,
    EVSUBCMD_HIDE_ATTACK_RANGE = 1,

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
    EVSUBCMD_KILL = 0xD,
    EVSUBCMD_DISA_IF = 0xE,
    EVSUBCMD_DISA = 0xF,

    /* EV_CMD_LOADSINGLEUNIT */
    EVSUBCMD_SPAWN_ALLY = 0,
    EVSUBCMD_SPAWN_NPC = 1,
    EVSUBCMD_SPAWN_ENEMY = 2,
    EVSUBCMD_SPAWN_CUTSCENE_ALLY = 0xF,

    /* EV_CMD_CHECKINAREA */

    /* EV_CMD_GIVEITEM */
    EVSUBCMD_GIVEITEMTO = 0,
    EVSUBCMD_GIVEITEMTOMAIN = 1,
    EVSUBCMD_GIVETOSLOT3 = 2,

    /* EV_CMD_CHANGEAI */
    EVTSUBCMD_CHAI = 0,
    EVTSUBCMD_CHAI_AT = 1,

    /* EV_CMD_DISPLAYPOPUP */
    EVSUBCMD_POPUP = 0,
    EVSUBCMD_BROWNTEXTBOX = 1,

    /* EV_CMD_DISPLAYCURSOR */
    EVSUBCMD_CURSOR_AT = 0x0,
    EVSUBCMD_CURSOR_UNIT = 0x1,
    EVSUBCMD_CURE = 0x2,
    EVSUBCMD_CURSOR_FLASHING_AT = 0x4,
    EVSUBCMD_CURSOR_FLASHING_UNIT = 0x5,

    /* EV_CMD_MENUOVERRIDE */
    EVSUBCMD_DISABLEOPTIONS = 0,
    EVSUBCMD_DISABLEWEAPONS = 1,

    /* EV_CMD_MOVE_CURSOR */
    EVSUBCMD_CHECK_CURSOR = 0,
    EVSUBCMD_SET_CURSOR = 1,

    /* EV_CMD_SCRIPT_BATTLE */
    EVSUBCMD_FIGHT = 0,
    EVSUBCMD_FIGHT_MAP = 1,
    EVSUBCMD_FIGHT_SCRIPT = 2,

    /* EV_CMD_WARP */
    EVSUBCMD_WARP_OUT = 0,
    EVSUBCMD_WARP_IN = 1,
    EVSUBCMD_WARP_STAL = 0xF,
};

#define _EvtSubParam16u8(u8a, u8b) \
    (((u8a) & 0xFF) + ((u8b & 0xFF) << 8))
#define _EvtSubParam16u4(u4a, u4b, u4c, u4d) \
    (((u4a) & 0xF) + ((u4b & 0xF) << 4) + ((u4c & 0xF) << 8) + ((u4d & 0xF) << 12))

#define _EvtParams2(x, y) ((((y) & 0xFFFF) << 16) + ((x) & 0xFFFF))
#define _EvtParams4(a, b, c, d) ((((d) & 0xFF) << 24) + (((c) & 0xFF) << 16) + (((b) & 0xFF) << 8) + ((a) & 0xFF))
#define _EvtCmd(cmd, len, sub) \
( \
    (((cmd) & 0xFF) << 8) + \
    (((len) & 0x0F) << 4) + \
    (((sub) & 0x0F)) \
)
#define _EvtArg0(cmd, len, sub, arg0) _EvtParams2(_EvtCmd(cmd, len, sub), arg0)
#define _EvtAutoCmdLen2(cmd) _EvtArg0(cmd, 2, 0, 0)
#define _EvtAutoCmdLen4(cmd) _EvtArg0(cmd, 4, 0, 0)

#define EvtNop _EvtAutoCmdLen2(EV_CMD_NOP),
#define EvtReturn _EvtArg0(EV_CMD_END, 2, EVSUBCMD_ENDA, 0),
#define EvtEndAll _EvtArg0(EV_CMD_END, 2, EVSUBCMD_ENDB, 0),
#define EvtClearEvBits(flag) _EvtArg0(EV_CMD_EVSET, 2, EVSUBCMD_EVBIT_F, (flag)),
#define EvtSetEvBits(flag) _EvtArg0(EV_CMD_EVSET, 2, EVSUBCMD_EVBIT_T, (flag)),
#define EvtClearFlag(flag) _EvtArg0(EV_CMD_EVSET, 2, EVSUBCMD_ENUF, (flag)),
#define EvtClearFlagAtSlot2 EvtClearFlag(-1)
#define EvtSetFlag(flag) _EvtArg0(EV_CMD_EVSET, 2, EVSUBCMD_ENUT, (flag)),
#define EventCheckEvbit(index) _EvtArg0(EV_CMD_EVCHECK, 2, EVSUBCMD_CHECK_EVBIT, (index)),
#define EventCheckFlag(flag) _EvtArg0(EV_CMD_EVCHECK, 2, EVSUBCMD_CHECK_EVENTID, (flag)),
#define EvtGetRandom(max) _EvtArg0(EV_CMD_RANDOMNUMBER, 2, 0, (max)),
#define EvtSetSlot(slot, value) _EvtArg0(EV_CMD_SVAL, 4, 0, (slot)), (EventListScr)(value),
#define EvtSlotADD(to, a, b) _EvtArg0(EV_CMD_SLOT_OPS, 2, EVSUBCMD_SADD, _EvtSubParam16u4(to, a, b, 0)),
#define EvtSlotSUB(to, a, b) _EvtArg0(EV_CMD_SLOT_OPS, 2, EVSUBCMD_SSUB, _EvtSubParam16u4(to, a, b, 0)),
#define EvtSlotMUL(to, a, b) _EvtArg0(EV_CMD_SLOT_OPS, 2, EVSUBCMD_SMUL, _EvtSubParam16u4(to, a, b, 0)),
#define EvtSlotDIV(to, a, b) _EvtArg0(EV_CMD_SLOT_OPS, 2, EVSUBCMD_SDIV, _EvtSubParam16u4(to, a, b, 0)),
#define EvtSlotMOD(to, a, b) _EvtArg0(EV_CMD_SLOT_OPS, 2, EVSUBCMD_SMOD, _EvtSubParam16u4(to, a, b, 0)),
#define EvtSlotAND(to, a, b) _EvtArg0(EV_CMD_SLOT_OPS, 2, EVSUBCMD_SAND, _EvtSubParam16u4(to, a, b, 0)),
#define EvtSlotORR(to, a, b) _EvtArg0(EV_CMD_SLOT_OPS, 2, EVSUBCMD_SORR, _EvtSubParam16u4(to, a, b, 0)),
#define EvtSlotXOR(to, a, b) _EvtArg0(EV_CMD_SLOT_OPS, 2, EVSUBCMD_SXOR, _EvtSubParam16u4(to, a, b, 0)),
#define EvtSlotLSL(to, a, b) _EvtArg0(EV_CMD_SLOT_OPS, 2, EVSUBCMD_SLSL, _EvtSubParam16u4(to, a, b, 0)),
#define EvtSlotLSR(to, a, b) _EvtArg0(EV_CMD_SLOT_OPS, 2, EVSUBCMD_SLSR, _EvtSubParam16u4(to, a, b, 0)),
#define EvtEnqueueFormSlot(slot) _EvtArg0(EV_CMD_QUEUE_OPS, 2, EVSUBCMD_SENQUEUE, (slot)),
#define EvtEnqueueFormSlot1 _EvtArg0(EV_CMD_QUEUE_OPS, 2, EVSUBCMD_SENQUEUE_S1, 0),
#define EvtDequeueToSlot(slot) _EvtArg0(EV_CMD_QUEUE_OPS, 2, EVSUBCMD_SDEQUEUE, (slot)),
#define EvtLabel(label) _EvtArg0(EV_CMD_LABEL, 2, 0, (label)),
#define EvtGoto(label) _EvtArg0(EV_CMD_GOTO, 2, 0, (label)),
#define EvtCall(scr) _EvtAutoCmdLen4(EV_CMD_CALL), (EventListScr)(scr),
#define EvtEnqueueCallDirectly(scr) _EvtArg0(EV_CMD_ENQUEUE_CALL, 4, EVSUBCMD_ENQUEUE_DIRECT, 0), (EventListScr)(scr),
#define EvtEnqueueConditionalTutCall(scr, exec_type) _EvtArg0(EV_CMD_ENQUEUE_CALL, 4, EVSUBCMD_ENQUEUE_TRIGGER, (exec_type)), (EventListScr)(scr),
#define EvtBEQ(label, s1, s2) _EvtArg0(EV_CMD_BRANCH, 4, EVSUBCMD_BEQ, (label)), _EvtParams2((s1), (s2)),
#define EvtBNE(label, s1, s2) _EvtArg0(EV_CMD_BRANCH, 4, EVSUBCMD_BNE, (label)), _EvtParams2((s1), (s2)),
#define EvtBGE(label, s1, s2) _EvtArg0(EV_CMD_BRANCH, 4, EVSUBCMD_BGE, (label)), _EvtParams2((s1), (s2)),
#define EvtBGT(label, s1, s2) _EvtArg0(EV_CMD_BRANCH, 4, EVSUBCMD_BGT, (label)), _EvtParams2((s1), (s2)),
#define EvtBLE(label, s1, s2) _EvtArg0(EV_CMD_BRANCH, 4, EVSUBCMD_BLE, (label)), _EvtParams2((s1), (s2)),
#define EvtBLT(label, s1, s2) _EvtArg0(EV_CMD_BRANCH, 4, EVSUBCMD_BLT, (label)), _EvtParams2((s1), (s2)),
#define EvtAsmCall(func) _EvtAutoCmdLen4(EV_CMD_ASMC), (EventListScr)(func),
#define EvtSleep(time) _EvtArg0(EV_CMD_STALL, 2, EVSUBCMD_STAL, (time)),
#define EvtSleepWithCancel(time) _EvtArg0(EV_CMD_STALL, 2, EVSUBCMD_STAL1, (time)),
#define EvtSleepWithGameCtrl(time) _EvtArg0(EV_CMD_STALL, 2, EVSUBCMD_STAL2, (time)),
#define EvtSleepWithCancelGameCtrl(time) _EvtArg0(EV_CMD_STALL, 2, EVSUBCMD_STAL3, (time)),
#define EvtModifyEvBit(type) _EvtArg0(EV_CMD_EVBITMODIFY, 2, 0, (type)),
#define EvtSetKeyIgnore(mask) _EvtArg0(EV_CMD_IGNOREKEYS, 2, 0, (mask)),
#define EvtStartBgm(bgm) _EvtArg0(EV_CMD_BGMCHANGE_12, 2, 0, (bgm)),
#define EvtBgmFadeInFast(bgm) _EvtArg0(EV_CMD_BGMCHANGE_13, 2, EVSUBCMD_MUSCFAST, (bgm)),
#define EvtBgmFadeInMiddleSpeed(bgm) _EvtArg0(EV_CMD_BGMCHANGE_13, 2, EVSUBCMD_MUSCMID, (bgm)),
#define EvtBgmFadeInSlowly(bgm) _EvtArg0(EV_CMD_BGMCHANGE_13, 2, EVSUBCMD_MUSCSLOW, (bgm)),
#define EvtBgmFadeInSpeed8(bgm) _EvtArg0(EV_CMD_BGMCHANGE_13, 2, EVSUBCMD_MUSCSSLOW, (bgm)),
#define EvtOverrideBgm(bgm) _EvtArg0(EV_CMD_BGMOVERWRITE, 2, EVSUBCMD_MUSS, (bgm)),
#define EvtRestoreBgm(speed) _EvtArg0(EV_CMD_BGMOVERWRITE, 2, EVSUBCMD_MURE, (speed)),
#define EvtSetVolumeDown _EvtArg0(EV_CMD_BGMVOLUMECHANGE, 2, EVSUBCMD_MUSI, 0),
#define EvtUnsetVolumeDown _EvtArg0(EV_CMD_BGMVOLUMECHANGE, 2, EVSUBCMD_MUNO, 0),
#define EvtPlaySong(songid) _EvtArg0(EV_CMD_PLAYSE, 2, 0, (songid)),
#define EvtFadeOutBlack(speed) _EvtArg0(EV_CMD_FADE, 2, EVSUBCMD_FADU, (speed)),
#define EvtFadeInBlack(speed) _EvtArg0(EV_CMD_FADE, 2, EVSUBCMD_FADI, (speed)),
#define EvtFadeOutWhite(speed) _EvtArg0(EV_CMD_FADE, 2, EVSUBCMD_FAWU, (speed)),
#define EvtFadeInWhite(speed) _EvtArg0(EV_CMD_FADE, 2, EVSUBCMD_FAWI, (speed)),
#define EvtGetMode _EvtArg0(EV_CMD_CHECKVARIOUS, 2, EVSUBCMD_CHECK_MODE, 0),
#define EvtGetChapterIndex _EvtArg0(EV_CMD_CHECKVARIOUS, 2, EVSUBCMD_CHECK_CHAPTER_NUMBER, 0),
#define EvtGetIsHard _EvtArg0(EV_CMD_CHECKVARIOUS, 2, EVSUBCMD_CHECK_HARD, 0),
#define EvtGetCurrentTurn _EvtArg0(EV_CMD_CHECKVARIOUS, 2, EVSUBCMD_CHECK_TURNS, 0),
#define EvtGetEnemyAmount _EvtArg0(EV_CMD_CHECKVARIOUS, 2, EVSUBCMD_CHECK_ENEMIES, 0),
#define EvtGetNpcAmount _EvtArg0(EV_CMD_CHECKVARIOUS, 2, EVSUBCMD_CHECK_OTHERS, 0),
#define EvtGetSkirmishType _EvtArg0(EV_CMD_CHECKVARIOUS, 2, EVSUBCMD_CHECK_SKIRMISH, 0),
#define EvtGetIsTutorial _EvtArg0(EV_CMD_CHECKVARIOUS, 2, EVSUBCMD_CHECK_TUTORIAL, 0),
#define EvtGetMoney _EvtArg0(EV_CMD_CHECKVARIOUS, 2, EVSUBCMD_CHECK_MONEY, 0),
#define EvtGetTriggeredEid _EvtArg0(EV_CMD_CHECKVARIOUS, 2, EVSUBCMD_19CHECK_EVENTID, 0),
#define EvtGetIsGameCompleted _EvtArg0(EV_CMD_CHECKVARIOUS, 2, EVSUBCMD_CHECK_POSTGAME, 0),
#define EvtTextStart _EvtArg0(EV_CMD_SETTEXTTYPE, 2, EVSUBCMD_TEXTSTART, 0),
#define EvtTextStartType1 _EvtArg0(EV_CMD_SETTEXTTYPE, 2, EVSUBCMD_REMOVEPORTRAITS, 0),
#define EvtTextStartType2 _EvtArg0(EV_CMD_SETTEXTTYPE, 2, EVSUBCMD_0x1A22, 0),
#define EvtTextStartType3 _EvtArg0(EV_CMD_SETTEXTTYPE, 2, EVSUBCMD_TUTORIALTEXTBOXSTART, 0),
#define EvtTextStartType4 _EvtArg0(EV_CMD_SETTEXTTYPE, 2, EVSUBCMD_SOLOTEXTBOXSTART, 0),
#define EvtTextStartType5 _EvtArg0(EV_CMD_SETTEXTTYPE, 2, EVSUBCMD_0x1A25, 0),
#define EvtTextTuorialStart EvtTextStartType3
#define EvtTextShow(msg) _EvtArg0(EV_CMD_DISPLAYTEXT, 2, EVSUBCMD_TEXTSHOW, (msg)),
#define EvtTextShow2(msg) _EvtArg0(EV_CMD_DISPLAYTEXT, 2, EVSUBCMD_TEXTSHOW2, (msg)),
#define EvtTextRemoveAll _EvtArg0(EV_CMD_DISPLAYTEXT, 2, EVSUBCMD_REMA, 0),
#define EvtContinueText _EvtAutoCmdLen2(EV_CMD_CONTINUETEXT),
#define EvtTextEnd _EvtAutoCmdLen2(EV_CMD_ENDTEXT),
#define EvtDisplayTextBg(bg) _EvtArg0(EV_CMD_SHOWBG, 4, EVSUBCMD_BACG, (bg)), 0,
#define EvtClearScreen _EvtAutoCmdLen2(EV_CMD_CLEARSCREEN),
#define EvtLoadMap(chapter) _EvtArg0(EV_CMD_LOMA, 2, 0, (chapter)),
#define EvtMoveCameraTo(x, y) _EvtArg0(EV_CMD_CAMERACONTROL, 2, EVSUBCMD_CAMERA_AT, _EvtSubParam16u8((x), (y))),
#define EvtMoveCameraToChar(pid) _EvtArg0(EV_CMD_CAMERACONTROL, 2, EVSUBCMD_CAMERA_CHAR, (pid)),
#define EvtMoveCameraToCenter(x, y) _EvtArg0(EV_CMD_CAMERACONTROL, 2, EVSUBCMD_CAMERA2_AT, _EvtSubParam16u8((x), (y))),
#define EvtMoveCameraToCharCenter(pid) _EvtArg0(EV_CMD_CAMERACONTROL, 2, EVSUBCMD_CAMERA2_CHAR, (pid)),
#define EvtTriggerMapChange(id) _EvtArg0(EV_CMD_TILE_CHANGE, 2, EVSUBCMD_TILECHANGE, (id)),
#define EvtRevertMapChange(id) _EvtArg0(EV_CMD_TILE_CHANGE, 2, EVSUBCMD_TILEREVERT, (id)),
#define EvtBackToTitle(chapter) _EvtArg0(EV_CMD_CHANGECHAPTER, 2, EVSUBCMD_MNTS, (chapter)),
#define EvtChangeChapterWM(chapter) _EvtArg0(EV_CMD_CHANGECHAPTER, 2, EVSUBCMD_MNCH, (chapter)),
#define EvtChangeChapterBM(chapter) _EvtArg0(EV_CMD_CHANGECHAPTER, 2, EVSUBCMD_MNC2, (chapter)),
#define EvtChangeChapterNoSave(chapter) _EvtArg0(EV_CMD_CHANGECHAPTER, 2, EVSUBCMD_MNC3, (chapter)),
#define EvtMoveToGameEnding _EvtArg0(EV_CMD_CHANGECHAPTER, 2, EVSUBCMD_MNC4, 0),
#define EvtSetLoadUnitCount(cnt) _EvtArg0(EV_CMD_LOAD_PRECONF, 2, EVSUBCMD_LOAD_SETCOUNT, (cnt)),
#define EvtSetLoadUnitChance(chance) _EvtArg0(EV_CMD_LOAD_PRECONF, 2, EVSUBCMD_LOAD_SETCHANCE, (chance)),
#define EvtSetLoadUnitNoREDA _EvtArg0(EV_CMD_LOAD_PRECONF, 2, EVSUBCMD_LOAD_NOREDA, 0),
#define EvtLoadUnit1(restriction, units) _EvtArg0(EV_CMD_LOADUNIT, 4, EVSUBCMD_LOAD1, (restriction)), (EventListScr)(units),
#define EvtLoadUnit2(restriction, units) _EvtArg0(EV_CMD_LOADUNIT, 4, EVSUBCMD_LOAD2, (restriction)), (EventListScr)(units),
#define EvtLoadUnit3(restriction, units) _EvtArg0(EV_CMD_LOADUNIT, 4, EVSUBCMD_LOAD3, (restriction)), (EventListScr)(units),
#define EvtLoadUnit4(restriction, units) _EvtArg0(EV_CMD_LOADUNIT, 4, EVSUBCMD_LOAD4, (restriction)), (EventListScr)(units),
#define EvtChangePalSMS(pal) _EvtArg0(EV_CMD_CHANGE_PAL, 2, 0, (pal)),
#define EvtGetPidAt(x, y) _EvtArg0(EV_CMD_GET_PID, 2, EVSUBCMD_CHECK_AT, _EvtSubParam16u8((x), (y))),
#define EvrGetActiveUnitPid _EvtArg0(EV_CMD_GET_PID, 2, EVSUBCMD_CHECK_ACTIVE, 0),
#define EvtMoveUnit(modify, speed, pid, x, y) _EvtArg0(EV_CMD_MOVEUNIT, 4, (EVSUBCMD_MOVE | (modify) << 3), (speed)), _EvtParams2((pid), _EvtSubParam16u8((x), (y))),
#define EvtMoveUnitToTarget(modify, speed, pid, pid_target) _EvtArg0(EV_CMD_MOVEUNIT, 4, (EVSUBCMD_MOVEONTO | (modify) << 3), (speed)), _EvtParams2((pid), (pid_target)),
#define EvtMoveUnitOneStep(modify, speed, pid, direction) _EvtArg0(EV_CMD_MOVEUNIT, 4, (EVSUBCMD_MOVE_1STEP | (modify) << 3), (speed)), _EvtParams2((pid), (direction)),
#define EvtMoveUnitByQueue(modify, pid) _EvtArg0(EV_CMD_MOVEUNIT, 4, (EVSUBCMD_MOVE_DEFINED | (modify) << 3), 0), _EvtParams2((pid), 0),
#define EvtCheckUnitExists(pid) _EvtArg0(EV_CMD_CHECKSTATE, 2, EVSUBCMD_CHECK_EXISTS, (pid)),
#define EvtGetUnitVisitGroup(pid) _EvtArg0(EV_CMD_CHECKSTATE, 2, EVSUBCMD_CHECK_STATUS, (pid)),
#define EvtCheckUnitNotDead(pid) _EvtArg0(EV_CMD_CHECKSTATE, 2, EVSUBCMD_CHECK_ALIVE, (pid)),
#define EvtCheckUnitDeployed(pid) _EvtArg0(EV_CMD_CHECKSTATE, 2, EVSUBCMD_CHECK_DEPLOYED, (pid)),
#define EvtCheckUnitActive(pid) _EvtArg0(EV_CMD_CHECKSTATE, 2, EVSUBCMD_CHECK_ACTIVEID, (pid)),
#define EvtGetUnitFaction(pid) _EvtArg0(EV_CMD_CHECKSTATE, 2, EVSUBCMD_CHECK_ALLEGIANCE, (pid)),
#define EvtGetUnitPosition(pid) _EvtArg0(EV_CMD_CHECKSTATE, 2, EVSUBCMD_CHECK_COORDS, (pid)),
#define EvtGetUnitJid(pid) _EvtArg0(EV_CMD_CHECKSTATE, 2, EVSUBCMD_CHECK_CLASS, (pid)),
#define EvtGetUnitLuck(pid) _EvtArg0(EV_CMD_CHECKSTATE, 2, EVSUBCMD_CHECK_LUCK, (pid)),
#define EvtWaitUnitMoving _EvtAutoCmdLen2(EV_CMD_ENUN),
#define EvtShowAttackRange(pid) _EvtArg0(EV_CMD_TOGGLERANGE, 2, EVSUBCMD_SHOW_ATTACK_RANGE, (pid)),
#define EvtHideAttackRange _EvtArg0(EV_CMD_TOGGLERANGE, 2, EVSUBCMD_HIDE_ATTACK_RANGE, 0),
#define EvtSetUnitHidden(pid) _EvtArg0(EV_CMD_CHANGESTATE, 2, EVSUBCMD_REMU, (pid)),
#define EvtSetUnitUnhidden(pid) _EvtArg0(EV_CMD_CHANGESTATE, 2, EVSUBCMD_REVEAL, (pid)),
#define EvtChangeFaction(pid, faction) _EvtArg0(EV_CMD_CHANGESTATE, 2, EVSUBCMD_CUSA + (faction), (pid)),
#define EvtSetUnitHpFormSlot1(pid) _EvtArg0(EV_CMD_CHANGESTATE, 2, EVSUBCMD_SET_HP, (pid)),
#define EvtSetUnitUnselectable(pid) _EvtArg0(EV_CMD_CHANGESTATE, 2, EVSUBCMD_SET_ENDTURN, (pid)),
#define EvtSetUnitHasMoved(pid) _EvtArg0(EV_CMD_CHANGESTATE, 2, EVSUBCMD_3427, (pid)),
#define EvtSetUnitStateFormSlot1(pid) _EvtArg0(EV_CMD_CHANGESTATE, 2, EVSUBCMD_SET_STATE, (pid)),
#define EvtHideAllAlliess _EvtArg0(EV_CMD_CHANGESTATE, 2, EVSUBCMD_CLEA, 0),
#define EvtRemoveAllNpcs _EvtArg0(EV_CMD_CHANGESTATE, 2, EVSUBCMD_CLEN, 0),
#define EvtRemoveAllEimies _EvtArg0(EV_CMD_CHANGESTATE, 2, EVSUBCMD_CLEE, 0),
#define EvtKillUnit(pid) _EvtArg0(EV_CMD_CHANGESTATE, 2, EVSUBCMD_KILL, (pid)),
#define EvtWaitUnitDeathFade(pid) _EvtArg0(EV_CMD_CHANGESTATE, 2, EVSUBCMD_DISA_IF, (pid)),
#define EvtLoadSingleUnit(faction, pid, x, y) _EvtArg0(EV_CMD_LOADSINGLEUNIT, 4, (faction), (pid)), _EvtParams4((x), (y), 0, 0),
#define EvtRemoveUnit(pid) _EvtArg0(EV_CMD_CHANGESTATE, 2, EVSUBCMD_DISA, (pid)),
#define EvtCheckInArea(pid, x, y, w, h) _EvtArg0(EV_CMD_CHECKINAREA, 4, 0, (pid)), _EvtParams4(x, y, w, h),
#define EvtGiveItemAtSlot3(pid) _EvtArg0(EV_CMD_GIVEITEM, 2, EVSUBCMD_GIVEITEMTO, (pid)),
#define EvtGiveMoneymAtSlot3(pid) _EvtArg0(EV_CMD_GIVEITEM, 2, EVSUBCMD_GIVEITEMTOMAIN, (pid)),
#define EvtGiveMoneymAtSlot3NoPopup(pid) _EvtArg0(EV_CMD_GIVEITEM, 2, EVSUBCMD_GIVETOSLOT3, (pid)),
#define EvtSetActiveUnit(pid) _EvtArg0(EV_CMD_CHANGEACTIVEUNIT, 2, 0, (pid)),
#define EvtChangeAI(pid) _EvtArg0(EV_CMD_CHANGEAI, 2, EVTSUBCMD_CHAI, (pid)),
#define EvtChangeAIat(x, y) _EvtArg0(EV_CMD_CHANGEAI, 2, EVTSUBCMD_CHAI_AT, _EvtSubParam16u8((x), (y))),
#define EvtDisplayPopup(msg, songid) _EvtArg0(EV_CMD_DISPLAYPOPUP, 4, EVSUBCMD_POPUP, (msg)), _EvtParams2((songid), 0),
#define EvtDisplayPopupSilently(msg, x, y) _EvtArg0(EV_CMD_DISPLAYPOPUP, 4, EVSUBCMD_BROWNTEXTBOX, (msg)), _EvtParams2((x), (y)),
#define EvtDisplayCursorAt(x, y) _EvtArg0(EV_CMD_DISPLAYCURSOR, 2, EVSUBCMD_CURSOR_AT, _EvtSubParam16u8((x), (y))),
#define EvtDisplayCursorAtUnit(pid) _EvtArg0(EV_CMD_DISPLAYCURSOR, 2, EVSUBCMD_CURSOR_UNIT, (pid)),
#define EvtEndCursor _EvtArg0(EV_CMD_DISPLAYCURSOR, 2, EVSUBCMD_CURE, 0),
#define EvtDisplayFlashingCursorAt(x, y) _EvtArg0(EV_CMD_DISPLAYCURSOR, 2, EVSUBCMD_CURSOR_FLASHING_AT, _EvtSubParam16u8((x), (y))),
#define EvtDisplayFlashingCursorAtUnit(pid) _EvtArg0(EV_CMD_DISPLAYCURSOR, 2, EVSUBCMD_CURSOR_FLASHING_UNIT, (pid)),
#define EvtOverrideUnitMenu(bitfile) _EvtArg0(EV_CMD_MENUOVERRIDE, 2, EVSUBCMD_DISABLEOPTIONS, (bitfile)),
#define EvtOverrideWeaponMenu(bitfile) _EvtArg0(EV_CMD_MENUOVERRIDE, 2, EVSUBCMD_DISABLEWEAPONS, (bitfile)),
#define EvtGetCursorPosition _EvtArg0(EV_CMD_MOVE_CURSOR, 2, EVSUBCMD_CHECK_CURSOR, 0),
#define EvtSetCursorPosition(x, y) _EvtArg0(EV_CMD_MOVE_CURSOR, 2, EVSUBCMD_SET_CURSOR, _EvtSubParam16u8((x), (y))),
#define EvtStartEventBattle(actor, target, weapon, ballista) _EvtArg0(EV_CMD_SCRIPT_BATTLE, 4, EVSUBCMD_FIGHT, (actor)), _EvtParams2((target), _EvtSubParam16u8((weapon), (ballista))),
#define EvtStartEventMapBattle(actor, target, weapon, ballista) _EvtArg0(EV_CMD_SCRIPT_BATTLE, 4, EVSUBCMD_FIGHT_MAP, (actor)), _EvtParams2((target), _EvtSubParam16u8((weapon), (ballista))),
#define EvtSetScriptedBattle _EvtArg0(EV_CMD_SCRIPT_BATTLE, 4, EVSUBCMD_FIGHT_SCRIPT, 0), (EventListScr)0,
#define EvtWarpOUT(x, y)  _EvtArg0(EV_CMD_WARP, 2, EVSUBCMD_WARP_OUT, _EvtSubParam16u8(x, y)),
#define EvtWarpIN(x, y) _EvtArg0(EV_CMD_WARP, 2, EVSUBCMD_WARP_IN, _EvtSubParam16u8(x, y)),
#define EvtWarpSTAL _EvtArg0(EV_CMD_WARP, 2, EVSUBCMD_WARP_STAL, 0),

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
    _EvtParams2(EVT_LIST_CMD_FLAG, (ent_flag)), \
    (EventListScr) (scr), (flag),

#define EvtListTurn(ent_flag, scr, turn, turn_max, faction) \
    _EvtParams2(EVT_LIST_CMD_TURN, (ent_flag)), \
    (EventListScr) (scr), \
    _EvtParams4((turn), (turn_max), (faction), 0),

#define EvtListTalk(ent_flag, ent_script, pid_a, pid_b) \
    _EvtParams2(EVT_LIST_CMD_CHAR, (ent_flag)), \
    (EventListScr) (ent_script), \
    _EvtParams4((pid_a), (pid_b), 0, 0), \
    (EventListScr) 0,

#define EvtListConditionalTalk(ent_flag, ent_script, pid_a, pid_b, trigg_eid) \
    _EvtParams2(EVT_LIST_CMD_CHAR, (ent_flag)), \
    (EventListScr) (ent_script), \
    _EvtParams4((pid_a), (pid_b), 0, 0), \
    _EvtParams2((trigg_eid), 3),

#define EvtListTile(ent_flag, ent_script, x, y, tile_command) \
    _EvtParams2(EVT_LIST_CMD_LOCA, (ent_flag)), \
    (EventListScr) (ent_script), \
    _EvtParams4((x), (y), (tile_command), 0),

#define EvtListArea(ent_flag, ent_script, x1, y1, x2, y2) \
    _EvtParams2(EVT_LIST_CMD_AREA, (ent_flag)), \
    (EventListScr) (ent_script), \
    _EvtParams4((x1), (y1), (x2), (y2)),

/* MISC */
enum event3D_menu1override_bitfiles {
    EVENT_MENUOVERRIDE_ATTACK  = 1 << 0x0,
    EVENT_MENUOVERRIDE_STAFF   = 1 << 0x1,
    EVENT_MENUOVERRIDE_WAIT    = 1 << 0x2,
    EVENT_MENUOVERRIDE_RESCUE  = 1 << 0x3,
    EVENT_MENUOVERRIDE_DROP    = 1 << 0x4,
    EVENT_MENUOVERRIDE_VISIT   = 1 << 0x5,
    EVENT_MENUOVERRIDE_TALK    = 1 << 0x6,
    EVENT_MENUOVERRIDE_ITEM    = 1 << 0x7,
    EVENT_MENUOVERRIDE_DISCARD = 1 << 0x8,
    EVENT_MENUOVERRIDE_TRADE   = 1 << 0x9,
    EVENT_MENUOVERRIDE_SUPPLY  = 1 << 0xA,
    EVENT_MENUOVERRIDE_SUPPORT = 1 << 0xB,
    EVENT_MENUOVERRIDE_ARMORY  = 1 << 0xC,
    EVENT_MENUOVERRIDE_OPTIONS = 1 << 0xD,
    EVENT_MENUOVERRIDE_END     = 1 << 0xE,
};

enum event3D_menu2override_bitfiles {
    EVENT_MENUOVERRIDE_WEAPON1 = 1 << 0,
    EVENT_MENUOVERRIDE_WEAPON2 = 1 << 1,
    EVENT_MENUOVERRIDE_WEAPON3 = 1 << 2,
    EVENT_MENUOVERRIDE_WEAPON4 = 1 << 3,
    EVENT_MENUOVERRIDE_WEAPON5 = 1 << 4,
};
