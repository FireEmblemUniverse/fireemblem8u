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
};
