#pragma once

#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "eventcall.h"
#include "EAstdlib.h"
#include "constants/characters.h"
#include "constants/backgrounds.h"
#include "constants/songs.h"

CONST_DATA EventListScr EventScr_Ch6_BeginningScene[] = {
    MUSC(SONG_SOLVE_THE_RIDDLE)
    SetBackground(BG_PLAIN_1_FOG)
    TEXTSHOW(0x9e4)
    TEXTEND
    REMA
    MUSCSLOW(SONG_SILENT)
    CALL(EventScr_TextShowWithFadeIn)
    EVBIT_T(9)
    LOAD2(0x1, UnitDef_088B64B4)
    ENUN
    EVBIT_F(9)
    CAMERA2(7, 7)
    LOAD1(0x1, UnitDef_088B61A8)
    ENUN
    SVAL(EVT_SLOT_2, 0x4b)
    MOVE_CLOSEST(0xffff, CHAR_EVT_SLOT2, 5, 8)
    CALL(EventScr_UnitWarpIN)
    SVAL(EVT_SLOT_2, 0xf9)
    MOVE_CLOSEST(0xffff, CHAR_EVT_SLOT2, 6, 8)
    CALL(EventScr_UnitWarpIN)
    MOVE_1STEP(0x0, CHARACTER_EIRIKA, FACING_LEFT)
    MOVE_1STEP(0x0, CHARACTER_SETH, FACING_LEFT)
    ENUN
    CUMO_CHAR(CHARACTER_NOVALA)
    STAL(60)
    CURE
    SetBackground(BG_PLAIN_1_FOG)
    TEXTSHOW(0x9e5)
    TEXTEND
    MUSC(SONG_RAID)
    TEXTCONT
    TEXTEND
    REMA
    SetBackground(BG_PLAIN_1_FOG)
    TEXTSHOW(0x9e6)
    TEXTEND
    REMA
    SetBackground(BG_PLAIN_1_FOG)
    TEXTSHOW(0x9e7)
    TEXTEND
    REMA
    CALL(EventScr_TextShowWithFadeIn)
    MOVE(0xffff, 0xfb, 20, 5)
    SVAL(EVT_SLOT_2, 0x4b)
    CALL(EventScr_UnitWarpOUT)
    SVAL(EVT_SLOT_2, 0xf9)
    CALL(EventScr_UnitWarpOUT)
    CAMERA2(19, 5)
    SVAL(EVT_SLOT_2, 0x4b)
    MOVE_CLOSEST(0xffff, CHAR_EVT_SLOT2, 19, 6)
    CALL(EventScr_UnitWarpIN)
    SVAL(EVT_SLOT_2, 0xf9)
    MOVE_CLOSEST(0xffff, CHAR_EVT_SLOT2, 20, 6)
    CALL(EventScr_UnitWarpIN)
    CUMO_CHAR(CHARACTER_NOVALA)
    STAL(60)
    CURE
    Text_BG(BG_PLAIN_2_FOG, 0x9e8)
    STAL(60)
    SVAL(EVT_SLOT_2, 0xf9)
    CALL(EventScr_UnitWarpOUT)
    SVAL(EVT_SLOT_2, 0xfb)
    CALL(EventScr_UnitWarpOUT)
    CAMERA2(21, 11)
    SVAL(EVT_SLOT_2, 0xf9)
    MOVE_CLOSEST(0xffff, CHAR_EVT_SLOT2, 26, 12)
    CALL(EventScr_UnitWarpIN)
    SVAL(EVT_SLOT_2, 0xfb)
    MOVE_CLOSEST(0xffff, CHAR_EVT_SLOT2, 25, 12)
    CALL(EventScr_UnitWarpIN)
    CUMO_CHAR(0xf9)
    STAL(60)
    CURE
    SetBackground(BG_PLAIN_2_FOG)
    TEXTSHOW(0x9e9)
    TEXTEND
    REMA
    FADI(16)
    SVAL(EVT_SLOT_2, EventScr_089F2AE4)
    CALL(EventScr_CallOnTutorialMode)
    CALL(EventScr_08591FD8)
    ENDA
};

CONST_DATA EventListScr EventScr_089F2940[] = {
    CHECK_ALIVE(0xf9)
    BEQ(0x63, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_INAREA(0xf9, 24, 9, 4, 6)
    BEQ(0x4, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, 0xb0)
    CALL(EventScr_UnTriggerIfNotUnit)
    MUSC(SONG_ENVOY_FROM_THE_DARK)
    CAMERA_CAHR(0xf9)
    CUMO_CHAR(0xf9)
    STAL(60)
    CURE
    RANDOMNUMBER(2)
    SVAL(EVT_SLOT_7, 0x1)
    BEQ(0x1, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x2)
    BEQ(0x2, EVT_SLOT_C, EVT_SLOT_7)
LABEL(0x0)
    SVAL(EVT_SLOT_2, 0x9ec)
    GOTO(0x3)
LABEL(0x1)
    SVAL(EVT_SLOT_2, 0x9ed)
    GOTO(0x3)
LABEL(0x2)
    SVAL(EVT_SLOT_2, 0x9ee)
LABEL(0x3)
    TEXTSTART
    TEXTSHOW(0xffff)
    TEXTEND
    REMA
LABEL(0x4)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x63)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch6_EndingScene[] = {
    MUSCFAST(SONG_SILENT)
    SetBackground(BG_PLAIN_1_FOG)
    CHECK_ALIVE(0xfa)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(0xfb)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(0xf9)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    MUSC(SONG_VICTORY)
    TEXTSHOW(0x9f1)
    TEXTEND
    REMA
    MUSCMID(SONG_SILENT)
    CALL(EventScr_RemoveBGIfNeeded)
    GiveItemTo(CHARACTER_EIRIKA, ITEM_ORIONSBOLT)
LABEL(0x0)
    REMA
    MUSC(SONG_LEGACY)
    TEXTSHOW(0x9f2)
    TEXTEND
    MUSCSLOW(SONG_SILENT)
    STAL(60)
    MUSCSLOW(SONG_INTO_THE_SHADOW_OF_VICTORY)
    TEXTCONT
    TEXTEND
    REMA
    ENUT(212)
    ENUT(193)
    MNCH(0x8)
    ENDA
};

CONST_DATA EventListScr EventScr_089F2A98[] = {
    MUSI
    Text_BG(BG_HOUSE, 0x9f3)
    MUNO
    CALL(EventScr_RemoveBGIfNeeded)
    GiveItemTo(CHAR_EVT_ACTIVE_UNIT, ITEM_ANTITOXIN)
    SVAL(EVT_SLOT_2, EventScr_089F2B54)
    CALL(EventScr_CallOnTutorialMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F2AE4[] = {
    CLEAN
    CAMERA2(7, 8)
    FADU(16)
    MUSC(SONG_SHADOWS_APPROACH)
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    SetBackground(BG_PLAIN_1_FOG)
    TEXTSHOW(0x9ea)
    TEXTEND
    CHECK_ALIVE(CHARACTER_COLM)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    EvtTextShow2(0x9eb) // ENOSUPP in EAstdlib
    TEXTEND
LABEL(0x0)
    REMA
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x9f4)
    TEXTEND
    REMA
    ENUT(212)
    ENDA
};

CONST_DATA EventListScr EventScr_089F2B54[] = {
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x9f5)
    TEXTEND
    REMA
    ENUT(193)
    ENDA
};

CONST_DATA EventListScr EventScr_089F2B74[] = {
    SVAL(EVT_SLOT_2, UnitDef_088B64F0)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};
