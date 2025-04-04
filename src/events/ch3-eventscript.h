#pragma once

#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "eventcall.h"
#include "EAstdlib.h"
#include "constants/characters.h"
#include "constants/backgrounds.h"
#include "constants/songs.h"

CONST_DATA EventListScr EventScr_Ch3_BeginningScene[] = {
    MUSC(SONG_TENSION)
    SetBackground(BG_PLAIN_1)
    TEXTSHOW(0x98b)
    TEXTEND
    REMA
    SetBackground(BG_PLAIN_2)
    TEXTSHOW(0x98c)
    TEXTEND
    REMA
    FADI(16)
    CLEAN
    LOAD1(0x1, UnitDef_088B463C)
    ENUN
    FADU(16)
    LOAD2(0x1, UnitDef_Event_Ch3Ally)
    ENUN
    SVAL(EVT_SLOT_2, EventScr_089F15A0)
    CALL(EventScr_CallOnTutorialMode)
    CHECK_TUTORIAL
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_NEIMI)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0x98e)
    TEXTEND
    REMA
LABEL(0x0)
    SVAL(EVT_SLOT_2, EventScr_089F16EC)
    CALL(EventScr_CallOnTutorialMode)
    SVAL(EVT_SLOT_2, 0x2)
    CALL(EventScr_MoveUnitS2ToLeader)
    FADI(16)
    LOAD1(0x0, UnitDef_Event_Ch3Ally)
    ENUN
    CHECK_TUTORIAL
    BNE(0x1, EVT_SLOT_C, EVT_SLOT_0)
    GOTO(0x2)
LABEL(0x1)
    MOVE(0xffff, CHARACTER_NEIMI, 3, 9)
LABEL(0x2)
    CAMERA_CAHR(CHARACTER_BAZBA)
    FADU(16)
    CHECK_TUTORIAL
    BNE(0xa, EVT_SLOT_C, EVT_SLOT_0)
    MUSC(SONG_SHADOW_OF_THE_ENEMY)
    CUMO_CHAR(CHARACTER_BAZBA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0x990)
    TEXTEND
    REMA
LABEL(0xa)
    SVAL(EVT_SLOT_2, EventScr_089F1658)
    CALL(EventScr_CallOnTutorialMode)
    SVAL(EVT_SLOT_2, EventScr_089F16CC)
    CALL(EventScr_CallOnTutorialMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch3_Turn1Npc[] = {
    CAMERA(0, 0)
    STAL(15)
    LOAD1(0x1, UnitDef_088B4718)
    ENUN
    MUSC(SONG_BINDING_VOW)
    CUMO_CHAR(CHARACTER_COLM)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0x992)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, EventScr_089F1690)
    CALL(EventScr_CallOnTutorialMode)
    MOVE_CLOSEST(0x0, CHARACTER_COLM, 2, 4)
    ENUN
    SVAL(EVT_SLOT_2, EventScr_089F16B0)
    CALL(EventScr_CallOnTutorialMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch3_Turn2Player[] = {
    SVAL(EVT_SLOT_2, EventScr_089F1784)
    CALL(EventScr_CallOnTutorialMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch3_EndingScene[] = {
    MUSC(SONG_VICTORY)
    CHECK_ALIVE(CHARACTER_COLM)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_NEIMI)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SetBackground(BG_FORT_SUNSET)
    TEXTSHOW(0x995)
    TEXTEND
    REMA
    FADI(16)
    SVAL(EVT_SLOT_2, 0x9)
    CALL(EventScr_LoadUniqueAlly)
    GOTO(0x1)
LABEL(0x0)
    SVAL(EVT_SLOT_2, 0x9)
    CALL(EventScr_9EE5BC)
LABEL(0x1)
    SetBackground(BG_FORT)
    TEXTSHOW(0x996)
    TEXTEND
    REMA
    MUSCSLOW(SONG_SILENT)
    FADI(4)
    SVAL(EVT_SLOT_2, 0x2000f)
    CALL(EventScr_9EEA58)
    SetBackground(BG_GRADO_CHAMBER)
    TEXTSHOW(0x997)
    TEXTEND
    REMA
    FADI(16)
    CLEAN
    LOAD1(0x1, UnitDef_088B476C)
    ENUN
    FADU(16)
    MUSC(SONG_SOLVE_THE_RIDDLE)
    CUMO_CHAR(CHARACTER_VIGARDE)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0x998)
    TEXTEND
    REMA
    SOUN(SONG_B1)
    TILECHANGE(0x0)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x1010e)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1010c)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    MOVE_DEFINED(CHARACTER_DUESSEL)
    MOVE_1STEP(0x10, CHARACTER_GLEN, FACING_LEFT)
    MOVE_1STEP(0x10, CHARACTER_SELENA, FACING_RIGHT)
    ENUN
    LOAD1(0x1, UnitDef_088B47E4)
    ENUN
    CUMO_CHAR(CHARACTER_VIGARDE)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0x999)
    TEXTEND
    REMA
    FADI(16)
    ENUT(211)
    ENUT(209)
    ENUT(233)
    ENUT(216)
    ENUT(217)
    ENUT(198)
    REVEAL(CHARACTER_SETH)
    MNCH(0x4)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch3_Talk_NeimiColm[] = {
    MUSS(0x30)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0x99a)
    TEXTEND
    REMA
    MURE(0x2)
    CUSA(CHARACTER_COLM)
    SVAL(EVT_SLOT_2, EventScr_089F1760)
    CALL(EventScr_CallOnTutorialMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F15A0[] = {
    CAMERA2(7, 7)
    STAL(15)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x30002)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xa0006)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5000a)
    SENQUEUE1
    CALL(EventScr_FormatFlashingCursor)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0x98d)
    TEXTEND
    REMA
    CAMERA2(7, 10)
    STAL(15)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x90004)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xc0004)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x80008)
    SENQUEUE1
    CALL(EventScr_FormatFlashingCursor)
    STAL(60)
    CURE
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x99b)
    TEXTEND
    REMA
    ENUT(211)
    ENDA
};

CONST_DATA EventListScr EventScr_089F1658[] = {
    CUMO_CHAR(CHARACTER_BAZBA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0x991)
    TEXTEND
    REMA
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x99c)
    TEXTEND
    REMA
    ENDA
};

CONST_DATA EventListScr EventScr_089F1690[] = {
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x99d)
    TEXTEND
    REMA
    ENUT(209)
    ENDA
};

CONST_DATA EventListScr EventScr_089F16B0[] = {
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x9a0)
    TEXTEND
    REMA
    ENDA
};

CONST_DATA EventListScr EventScr_089F16CC[] = {
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x99e)
    TEXTEND
    REMA
    ENUT(233)
    ENDA
};

CONST_DATA EventListScr EventScr_089F16EC[] = {
    CUMO_CHAR(CHARACTER_NEIMI)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0x98f)
    TEXTEND
    REMA
    MOVE(0x0, CHARACTER_NEIMI, 3, 9)
    ENUN
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xffffffff)
    SENQUEUE1
    SVAL(EVT_SLOT_B, 0x90005)
    FIGHT(CHARACTER_NEIMI, CHAR_EVT_ACTIVE_UNIT, 0, 0)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x99f)
    TEXTEND
    REMA
    ENDA
};

CONST_DATA EventListScr EventScr_089F1760[] = {
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x9a1)
    TEXTEND
    REMA
    ENUT(216)
    ENUT(217)
    ENDA
};

CONST_DATA EventListScr EventScr_089F1784[] = {
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x9a2)
    TEXTEND
    REMA
    ENUT(198)
    ENDA
};
