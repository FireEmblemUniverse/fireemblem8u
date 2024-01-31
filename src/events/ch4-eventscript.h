#pragma once

#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "eventcall.h"
#include "EAstdlib.h"
#include "constants/characters.h"

CONST_DATA EventListScr EventScr_Ch4_BeginingScene[] = {
    LOAD2(0x1, UnitDef_088B49CC)
    ENUN
    MUSC(0x52)
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x23)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0x9a3)
    TEXTEND
    REMA
    FADI(16)
    CLEAN
    LOAD1(0x1, UnitDef_088B4A80)
    ENUN
    FADU(16)
    MUSC(0x25)
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0x9a4)
    TEXTEND
    REMA
    FADI(16)
    CAMERA(0, 14)
    FADU(16)
    MUSI
    CUMO_AT(1, 11)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x2)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0x9a5)
    TEXTEND
    REMA
    MUNO
    SVAL(EVT_SLOT_2, EventScr_089F1C60)
    CALL(EventScr_CallOnTutorialMode)
    FADI(16)
    CLEAN
    CAMERA(0, 0)
    FADU(16)
    LOAD1(0x1, UnitDef_088B4BD4)
    ENUN
    CUMO_CHAR(CHARACTER_ARTUR)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0x9a6)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_B, 0x6000b)
    MOVE(0x0, CHAR_EVT_POSITION_AT_SLOTB, 9, 3)
    ENUN
    CUMO_CHAR(CHARACTER_ARTUR)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0x9a7)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x10000)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xffffffff)
    SENQUEUE1
    SVAL(EVT_SLOT_B, 0x30009)
    FIGHT(CHARACTER_ARTUR, CHAR_EVT_ACTIVE_UNIT, 63, 0)
    SVAL(EVT_SLOT_B, 0x30009)
    KILL(CHAR_EVT_POSITION_AT_SLOTB)
    DISA_IF(CHAR_EVT_POSITION_AT_SLOTB)
    SVAL(EVT_SLOT_2, EventScr_089F1C80)
    CALL(EventScr_CallOnTutorialMode)
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0x9a8)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, EventScr_089F1CA4)
    CALL(EventScr_CallOnTutorialMode)
    CALL(EventScr_08591FD8)
    CAMERA(0, 0)
    FADU(16)
    MUSC(0x9)
    CUMO_CHAR(CHARACTER_ARTUR)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0x9a9)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, EventScr_089F1CC4)
    CALL(EventScr_CallOnTutorialMode)
    ENUT(8)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F199C[] = {
    CAMERA2(7, 0)
    STAL(15)
    LOAD1(0x1, UnitDef_088B4CD8)
    ENUN
    MUSC(0x2a)
    CUMO_CHAR(CHARACTER_LARACHEL)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0x9ac)
    TEXTEND
    REMA
    MOVE(0x18, CHARACTER_LARACHEL, 15, 2)
    MOVE(0x18, CHARACTER_DOZLA, 15, 1)
    MOVE(0x18, CHARACTER_RENNAC, 15, 1)
    ENUN
    CLEN
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F19F8[] = {
    MUSC(0x31)
    CHECK_EXISTS(CHARACTER_LUTE)
    BNE(0xa, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, 0x2)
    CALL(EventScr_SetBackground)
    CHECK_ALIVE(CHARACTER_ARTUR)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, 0x9ad)
    GOTO(0x1)
LABEL(0x0)
    SVAL(EVT_SLOT_2, 0x9ae)
LABEL(0x1)
    TEXTSHOW(0xffff)
    TEXTEND
    REMA
    FADI(16)
    LOAD1(0x1, UnitDef_088B4BFC)
    ENUN
LABEL(0xa)
    MUSC(0x32)
    SVAL(EVT_SLOT_2, 0x18)
    CALL(EventScr_SetBackground)
    CHECK_ALIVE(CHARACTER_ARTUR)
    BEQ(0xb, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_LUTE)
    BEQ(0xb, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, 0x9af)
    GOTO(0xc)
LABEL(0xb)
    SVAL(EVT_SLOT_2, 0x9b0)
LABEL(0xc)
    TEXTSHOW(0xffff)
    TEXTEND
    REMA
    FADI(16)
    MUSCMID(0x7fff)
    CLEAN
    CAMERA2(7, 7)
    CLEA
    CLEE
    CLEN
    LOAD2(0x1, UnitDef_088B4D28)
    ENUN
    FADU(16)
    LOAD1(0x1, UnitDef_088B4D64)
    ENUN
    MUSC(0x2a)
    CUMO_CHAR(CHARACTER_LARACHEL)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x18)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0x9b1)
    TEXTEND
    REMA
    ENUT(210)
    ENUT(187)
    ENUT(190)
    ENUT(191)
    ENUT(230)
    ENUT(205)
    MNCH(0x6)
    ENDA
};

CONST_DATA EventListScr EventScr_089F1B38[] = {
    MUSS(0x30)
    STAL(33)
    CHECK_ACTIVE
    SVAL(EVT_SLOT_7, 0x13)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x1)
    BEQ(0x1, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_2, 0x2)
    SVAL(EVT_SLOT_3, 0x9b4)
    CALL(Event_TextWithBG)
    GOTO(0x2)
LABEL(0x0)
    SVAL(EVT_SLOT_2, 0x2)
    SVAL(EVT_SLOT_3, 0x9b2)
    CALL(Event_TextWithBG)
    GOTO(0x2)
LABEL(0x1)
    SVAL(EVT_SLOT_2, 0x2)
    SVAL(EVT_SLOT_3, 0x9b3)
    CALL(Event_TextWithBG)
LABEL(0x2)
    MURE(0x4)
    LOAD1(0x1, UnitDef_088B4BFC)
    ENUN
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F1BD8[] = {
    MUSI
    SVAL(EVT_SLOT_2, 0x2)
    SVAL(EVT_SLOT_3, 0x9b5)
    CALL(Event_TextWithBG)
    MUNO
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x1f)
    GIVEITEMTO(CHAR_EVT_ACTIVE_UNIT)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F1C14[] = {
    SVAL(EVT_SLOT_2, UnitDef_088B4C88)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F1C2C[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(8)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F1C48[] = {
    SVAL(EVT_SLOT_2, UnitDef_088B4C24)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F1C60[] = {
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x9b6)
    TEXTEND
    REMA
    ENUT(187)
    ENDA
};

CONST_DATA EventListScr EventScr_089F1C80[] = {
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x9b7)
    TEXTEND
    REMA
    ENUT(190)
    ENUT(191)
    ENDA
};

CONST_DATA EventListScr EventScr_089F1CA4[] = {
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x9b8)
    TEXTEND
    REMA
    ENUT(230)
    ENDA
};

CONST_DATA EventListScr EventScr_089F1CC4[] = {
    MOVE(0x0, CHARACTER_ARTUR, 6, 3)
    ENUN
    CUMO_CHAR(CHARACTER_ARTUR)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0x9aa)
    TEXTEND
    REMA
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0x9ab)
    TEXTEND
    REMA
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x9b9)
    TEXTEND
    REMA
    ENUT(205)
    ENDA
};
