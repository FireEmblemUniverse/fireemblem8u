#pragma once

#include "global.h"
#include "bmguide.h"
#include "bmunit.h"
#include "event.h"
#include "eventinfo.h"
#include "eventscript-stdlib.h"
#include "constants/characters.h"

CONST_DATA EventListScr EventScr_Prologue_BeginingScene[] = {
    CALL(EventScr_Prologue_RenaisThroneCutscene)
    SVAL(EVT_SLOT_2, EventScr_Prologue_9EF1BC)
    CALL(EventScr_RunTutIfEasyMode)
    CHECK_TUTORIAL
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ASMC(BmGuideTextSetAllGreen)

LABEL(0x0)
    ENUT(0x8)
    LOAD1(1, UnitDef_Blue_Prologue)
    ENUN
    SVAL(EVT_SLOT_1, 13)
    SET_HP(CHARACTER_SETH)
    FlashCursorCHAR(CHARACTER_EIRIKA, 60)
    MUSI
    Text_BG(0x1D, 0x90D)
    MUNO
    MOVE(0x18, CHARACTER_SETH, 4, 4)
    ENUN
    FlashCursorCHAR(CHARACTER_SETH, 60)
    Text(0x90E)
    SVAL(EVT_SLOT_2, EventScr_Prologue_9EF27C)
    CALL(EventScr_RunTutIfEasyMode)
    _WARP(0x0, CHARACTER_EIRIKA, 4, 5)
    ENUN
    CALL(EventScr_Prologue_GiveRapier)
    CALL(EventScr_Prologue_ONeillSpawn)
    NoFade
    ENDA
};
