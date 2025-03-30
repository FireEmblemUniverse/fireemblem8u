#pragma once

#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "eventcall.h"
#include "EAstdlib.h"
#include "constants/characters.h"
#include "constants/backgrounds.h"
#include "constants/chapters.h"

CONST_DATA EventListScr EventScr_Ch7_BeginningScene[] = {
    MUSC(0x25)
    LOAD1(0x1, UnitDef_088B6F54)
    ENUN
    FADU(16)
    LOAD3(0x0, UnitDef_Event_Ch7Ally)
    ENUN
    STAL(15)
    CAMERA2(9, 4)
    CUMO_AT(9, 4)
    STAL(60)
    CURE
    CAMERA(0, 21)
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    SetBackground(BG_STREAM)
    TEXTSHOW(0x9f6)
    TEXTEND
    CHECK_ALIVE(CHARACTER_FRANZ)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    EvtTextShow2(0x9f7) // ENOSUPP in EAstdlib
    TEXTEND
LABEL(0x0)
    CHECK_ALIVE(CHARACTER_GILLIAM)
    BEQ(0x1, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_MOULDER)
    BEQ(0x1, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_VANESSA)
    BEQ(0x1, EVT_SLOT_C, EVT_SLOT_0)
    EvtTextShow2(0x9f8) // ENOSUPP in EAstdlib
    TEXTEND
LABEL(0x1)
    CHECK_ALIVE(CHARACTER_ROSS)
    BEQ(0x2, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_GARCIA)
    BEQ(0x2, EVT_SLOT_C, EVT_SLOT_0)
    EvtTextShow2(0x9f9) // ENOSUPP in EAstdlib
    TEXTEND
LABEL(0x2)
    CHECK_ALIVE(CHARACTER_COLM)
    BEQ(0x3, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_NEIMI)
    BEQ(0x3, EVT_SLOT_C, EVT_SLOT_0)
    EvtTextShow2(0x9fa) // ENOSUPP in EAstdlib
    TEXTEND
LABEL(0x3)
    CHECK_ALIVE(CHARACTER_LUTE)
    BEQ(0x4, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_ARTUR)
    BEQ(0x4, EVT_SLOT_C, EVT_SLOT_0)
    EvtTextShow2(0x9fb) // ENOSUPP in EAstdlib
    TEXTEND
LABEL(0x4)
    CHECK_ALIVE(CHARACTER_JOSHUA)
    BEQ(0x5, EVT_SLOT_C, EVT_SLOT_0)
    EvtTextShow2(0x9fc) // ENOSUPP in EAstdlib
    TEXTEND
LABEL(0x5)
    CHECK_ALIVE(CHARACTER_NATASHA)
    BEQ(0x6, EVT_SLOT_C, EVT_SLOT_0)
    EvtTextShow2(0x9fd) // ENOSUPP in EAstdlib
    TEXTEND
LABEL(0x6)
    EvtTextShow2(0x9fe) // ENOSUPP in EAstdlib
    TEXTEND
    CALL(EventScr_08591FD8)
    MUSC(0x9)
    FADU(16)
    SVAL(EVT_SLOT_2, EventScr_089F2EBC)
    CALL(EventScr_CallOnTutorialMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F2CFC[] = {
    CAMERA2_CAHR(CHARACTER_MURRAY)
    MUSC(0x13)
    CUMO_CHAR(CHARACTER_MURRAY)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0x9ff)
    TEXTEND
    REMA
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch7_EndingScene[] = {
    FADI(16)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(CHAPTER_44)
    CLEA
    CLEE
    CLEN
    FADU(16)
    MUSC(0x53)
    LOAD2(0x1, UnitDef_088B710C)
    ENUN
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xa04)
    TEXTEND
    REMA
    MOVE_1STEP(0x0, CHARACTER_SETH, FACING_RIGHT)
    MOVE_1STEP(0x0, CHARACTER_EIRIKA, FACING_LEFT)
    LOAD2(0x1, UnitDef_088B7148)
    ENUN
    ENUN
    CUMO_CHAR(CHARACTER_ORSON_CH5X)
    STAL(60)
    CURE
    MUSI
    Text_BG(BG_CASTLE_BRIGHT, 0xa05)
    MUNO
    MOVE_1STEP(0x0, CHARACTER_ORSON_CH5X, FACING_LEFT)
    ENUN
    MOVE(0x0, CHARACTER_ORSON_CH5X, 9, 0)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x109)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x9)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    MOVE_DEFINED(CHARACTER_EIRIKA)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x10a)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xa)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    MOVE_DEFINED(CHARACTER_SETH)
    STAL2(8)
    FADI(16)
    ENUN
    ENUT(213)
    MNCH(0x9)
    ENDA
};

CONST_DATA EventListScr EventScr_089F2E6C[] = {
    MUSI
    Text_BG(BG_HOUSE, 0xa06)
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F2E94[] = {
    MUSI
    Text_BG(BG_HOUSE, 0xa07)
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F2EBC[] = {
    CAMERA(2, 10)
    CURSOR_FLASHING(2, 10)
    STAL(60)
    CURE
    CAMERA(17, 8)
    CURSOR_FLASHING(17, 8)
    STAL(60)
    CURE
    CAMERA_CAHR(CHARACTER_EIRIKA)
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    CHECK_ALIVE(CHARACTER_NEIMI)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_NEIMI)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    TEXTSTART
    TEXTSHOW(0xa01)
    TEXTEND
    REMA
    GOTO(0x1)
LABEL(0x0)
    TEXTSTART
    TEXTSHOW(0xa00)
    TEXTEND
    REMA
LABEL(0x1)
    ENUT(213)
    ENDA
};
