#pragma once

#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "eventcall.h"
#include "EAstdlib.h"
#include "constants/characters.h"

CONST_DATA EventListScr EventScr_Ch5x_BeginingScene[] = {
    ASMC(HandleCh5xUnits_Start)
    MUSC(0x2e)
    SVAL(EVT_SLOT_B, 0x4000a)
    LOMA(0x8)
    FADU(16)
    BROWNBOXTEXT(0x657, 8, 8)
    CUMO_AT(9, 4)
    STAL(60)
    CURE
    FADI(16)
    SVAL(EVT_SLOT_B, 0x4000b)
    LOMA(0x9)
    LOAD1(0x1, UnitDef_088B5DAC)
    ENUN
    FADU(16)
    SPAWN_ENEMY(CHARACTER_VALTER, 10, 10)
    MOVE(0x10, CHARACTER_VALTER, 10, 4)
    ENUN
    MOVE(0x10, CHARACTER_TIRADO, 9, 3)
    ENUN
    MOVE(0x10, CHARACTER_VALTER, 10, 2)
    ENUN
    MOVE(0x10, CHARACTER_TIRADO, 10, 3)
    ENUN
    CUMO_CHAR(CHARACTER_TIRADO)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0x9d7)
    TEXTEND
    REMA
    FADI(16)
    MUSCMID(0x7fff)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0xc0014)
    LOMA(0x7)
    LOAD2(0x1, UnitDef_088B5DFC)
    ENUN
    FADU(16)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x22)
    CALL(EventScr_SetBackground)
    MUSC(0x25)
    TEXTSHOW(0x9d8)
    TEXTEND
    REMA
    FADI(16)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x70009)
    LOMA(0x8)
    FADU(16)
    LOAD2(0x1, UnitDef_088B5E94)
    ENUN
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x21)
    SVAL(EVT_SLOT_3, 0x9d9)
    CALL(Event_TextWithBG)
    MOVE(0x0, CHARACTER_EPHRAIM, 9, 4)
    STAL2(8)
    MOVE(0x0, CHARACTER_FORDE, 9, 5)
    MOVE(0x0, CHARACTER_KYLE, 8, 5)
    MOVE(0x0, CHARACTER_ORSON_CH5X, 8, 6)
    STAL2(8)
    FADI(16)
    ENUN
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x7000e)
    LOMA(0x5)
    LOAD1(0x1, UnitDef_088B5AC8)
    ENUN
    FADU(16)
    CUMO_CHAR(CHARACTER_ZONTA)
    STAL(60)
    CURE
    TEXTSHOW(0x9da)
    TEXTEND
    REMA
    CAMERA(0, 18)
    LOAD1(0x1, UnitDef_Event_Ch5xAlly)
    ENUN
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x10)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0x9db)
    TEXTEND
    REMA
    MUSCFAST(0x7fff)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch5x_EndingScene[] = {
    ASMC(HandleCh5xUnits_End)
    MUSC(0x31)
    SVAL(EVT_SLOT_2, 0x10)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0x9e1)
    TEXTEND
    REMA
    FADI(16)
    MUSCMID(0x7fff)
    CLEA
    CLEE
    CLEN
    CLEAN
    CAMERA2(13, 9)
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_088B5D48)
    ENUN
    FADU(16)
    LOAD1(0x1, UnitDef_088B5D48)
    ENUN
    CUMO_CHAR(CHARACTER_FORDE)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0x9e2)
    TEXTEND
    REMA
    FADI(16)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x4000a)
    LOMA(0x8)
    LOAD1(0x1, UnitDef_088B5FCC)
    ENUN
    FADU(16)
    EVBIT_T(9)
    LOAD2(0x1, UnitDef_088B5F7C)
    ENUN
    EVBIT_F(9)
    MUSC(0x26)
    LOAD1(0x1, UnitDef_088B60A8)
    ENUN
    LOAD1(0x1, UnitDef_088B6120)
    ENUN
    CUMO_CHAR(CHARACTER_VALTER)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x21)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0x9e3)
    TEXTEND
    REMA
    FADI(16)
    MUSCMID(0x7fff)

    // [Unknow] at 0x9f2708
    _EvtArg0(0xa6, 4, 0, 0x0),
    (EventListScr)0x50000,

    MNCH(0x7)
    ENDA
};
