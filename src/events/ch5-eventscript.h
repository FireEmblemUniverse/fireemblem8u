#pragma once

#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "eventcall.h"
#include "ea-stdlib.h"
#include "constants/characters.h"

CONST_DATA EventListScr EventScr_Ch5_BeginingScene[] = {
    CHECK_EVENTID(136)
    BEQ(0x8020, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_089F3280)
LABEL(0x8020)
    MUSC(0x25)
    EvtSetLoadUnitNoREDA
    LOAD2(0x1, 0x88b593c)
    ENUN
    SVAL(EVT_SLOT_2, 0x5)
    SVAL(EVT_SLOT_3, 0x9ba)
    CALL(Event_TextWithBG)
    DISA(CHARACTER_JOSHUA)
    LOAD2(0x1, 0x88b593c)
    ENUN
    CUMO_CHAR(CHARACTER_JOSHUA)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x5)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0x9bb)
    TEXTEND
    REMA
    FADI(16)
    CLEA
    CLEE
    CLEN
    CLEAN
    MUSC(0x2e)
    LOAD1(0x1, 0x88b5978)
    ENUN
    FADU(16)
    CUMO_CHAR(CHARACTER_GLEN)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x5)
    SVAL(EVT_SLOT_3, 0x9bc)
    CALL(Event_TextWithBG)
    MOVE(0x0, CHARACTER_SAAR, 9, 4)
    ENUN
    MOVE_1STEP(0x10, CHARACTER_CORMAG, FACING_UP)
    ENUN
    CUMO_CHAR(CHARACTER_GLEN)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x5)
    SVAL(EVT_SLOT_3, 0x9bd)
    CALL(Event_TextWithBG)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x1c9)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1cb)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x10b)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    MOVE_DEFINED(CHARACTER_GLEN)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x1c8)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1cb)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x10b)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    MOVE_DEFINED(CHARACTER_CORMAG)
    STAL2(30)
    FADI(16)
    MUSCMID(32767)
    ENUN
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_2, 0x24)
    CALL(EventScr_SetBackground)
    MUSC(0x24)
    TEXTSHOW(0x9be)
    TEXTEND
    MUSI
    TEXTCONT
    TEXTEND
    REMA
    MUNO
    TEXTSHOW(0x9bf)
    TEXTEND
    MUSCMID(32767)
    STAL3(32)
    TEXTCONT
    TEXTEND
    REMA
    CALL(EventScr_TextShowWithFadeIn)
    LOAD1(0x1, 0x88b59c8)
    ENUN
    LOAD1(0x1, 0x88b56f8)
    ENUN
    MUSC(0x26)
    TEXTSTART
    TEXTSHOW(0x9c0)
    TEXTEND
    REMA
    LOAD1(0x1, 0x88b5798)
    ENUN
    ENUN
    CAMERA2(7, 14)
    LOAD2(0x1, 0x88b59f0)
    ENUN
    CUMO_CHAR(CHARACTER_SETH)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0x9c1)
    TEXTEND
    REMA
    MOVE(0x0, CHARACTER_NATASHA, 6, 15)
    ENUN
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0x9c2)
    TEXTEND
    REMA
    FADI(16)
    MUSCMID(32767)
    LOAD1(0x0, 0x88b4904)
    ENUN
    CALL(0x8591fd8)
    FADU(16)
    CAMERA(0, 0)
    MUSC(0x13)
    CUMO_AT(12, 6)
    STAL(60)
    CURE
    LOAD1(0x1, 0x88b5914)
    ENUN
    MOVE(0x0, CHARACTER_JOSHUA, 9, 7)
    ENUN
    CUMO_CHAR(CHARACTER_JOSHUA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0x9c3)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, EventScr_089F23B4)
    CALL(EventScr_CallOnTutorialMode)
    CAMERA(5, 18)
    MUSC(0x9)
    CUMO_CHAR(CHARACTER_NATASHA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0x9c4)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, EventScr_089F231C)
    CALL(EventScr_CallOnTutorialMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F2090[] = {
    FADI(16)
    SVAL(EVT_SLOT_2, 0x20)
    CALL(EventScr_9EE5BC)
    SVAL(EVT_SLOT_2, 0x5)
    CALL(EventScr_SetBackground)
    CHECK_ALIVE(CHARACTER_NATASHA)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    MUSC(0x31)
    TEXTSHOW(0x9c9)
    TEXTEND
    GOTO(0x1)
LABEL(0x0)
    MUSC(0x32)
    TEXTSHOW(0x9ca)
    TEXTEND
LABEL(0x1)
    REMA
    CHECK_EVENTID(8)
    BEQ(0x2, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_EVENTID(9)
    BEQ(0x2, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_EVENTID(10)
    BEQ(0x2, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_EVENTID(11)
    BEQ(0x2, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, 0x5)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0x9cb)
    TEXTEND
    REMA
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x68)
    GIVEITEMTO(CHAR_EVT_PLAYER_LEADER)
LABEL(0x2)
    ENUT(219)
    ENUT(189)
    ENUT(187)
    ENUT(204)
    ENUT(234)
    MNC2(0x5)

    // [Unknow] at 0x9f2164
    _EvtArg0(0xa6, 4, 0, 0x0),
    (EventListScr)0x80000,

    ENDA
};

CONST_DATA EventListScr EventScr_089F2170[] = {
    MUSI
    SVAL(EVT_SLOT_2, 0x0)
    SVAL(EVT_SLOT_3, 0x9cd)
    CALL(Event_TextWithBG)
    MUNO
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0xe)
    GIVEITEMTO(CHAR_EVT_ACTIVE_UNIT)
    SVAL(EVT_SLOT_2, EventScr_089F2340)
    CALL(EventScr_CallOnTutorialMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F21BC[] = {
    MUSI
    SVAL(EVT_SLOT_2, 0x0)
    SVAL(EVT_SLOT_3, 0x9ce)
    CALL(Event_TextWithBG)
    MUNO
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x60)
    GIVEITEMTO(CHAR_EVT_ACTIVE_UNIT)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F21F8[] = {
    MUSI
    SVAL(EVT_SLOT_2, 0x0)
    SVAL(EVT_SLOT_3, 0x9cf)
    CALL(Event_TextWithBG)
    MUNO
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x5d)
    GIVEITEMTO(CHAR_EVT_ACTIVE_UNIT)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F2234[] = {
    MUSI
    SVAL(EVT_SLOT_2, 0x0)
    SVAL(EVT_SLOT_3, 0x9d0)
    CALL(Event_TextWithBG)
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x70)
    GIVEITEMTO(CHAR_EVT_ACTIVE_UNIT)
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F2270[] = {
    MUSI
    TEXTSTART
    TEXTSHOW(0x9cc)
    TEXTEND
    MUSS(0x30)
    STAL(33)
    TEXTCONT
    TEXTEND
    REMA
    MURE(0x2)
    CUSA(CHARACTER_JOSHUA)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F22A4[] = {
    SVAL(EVT_SLOT_2, EventScr_089F2360)
    CALL(EventScr_CallOnTutorialMode)
    MUSC(0x13)
    SVAL(EVT_SLOT_2, 0x88b5860)
    CALL(EventScr_LoadReinforce)
    CUMO_AT(14, 16)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0x9c5)
    TEXTEND
    REMA
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F22EC[] = {
    SVAL(EVT_SLOT_2, 0x88b589c)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F2304[] = {
    SVAL(EVT_SLOT_2, 0x88b58d8)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F231C[] = {
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x9d1)
    TEXTEND
    REMA
    ENUT(219)
    ENUT(189)
    ENDA
};

CONST_DATA EventListScr EventScr_089F2340[] = {
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x9d2)
    TEXTEND
    REMA
    ENUT(187)
    ENDA
};

CONST_DATA EventListScr EventScr_089F2360[] = {
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x9d3)
    TEXTEND
    REMA
    CAMERA(2, 1)
    CURSOR_FLASHING(2, 1)
    STAL(60)
    CAMERA(6, 10)
    CURSOR_FLASHING(6, 10)
    STAL(60)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x9d4)
    TEXTEND
    REMA
    ENUT(204)
    CURE
    ENDA
};

CONST_DATA EventListScr EventScr_089F23B4[] = {
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0x9d5)
    TEXTEND
    REMA
    CAMERA(12, 6)
    CURSOR_FLASHING(12, 6)
    STAL(60)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0x28ffff)
    TEXTSHOW(0x9d6)
    TEXTEND
    REMA
    ENUT(234)
    CURE
    ENDA
};
