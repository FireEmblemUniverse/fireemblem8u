#pragma once

#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "eventcall.h"
#include "EAstdlib.h"
#include "constants/characters.h"

CONST_DATA EventListScr EventScr_9EEA58[] = {
    CHECK_EVBIT(8)
    BNE(0x801b, EVT_SLOT_C, EVT_SLOT_0)
    FADI(16)
LABEL(0x801b)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x3f)
    FADU(16)
    BROWNBOXTEXT(0x662, 8, 8)
    CUMO_AT(10, 4)
    STAL(60)
    CURE
    FADI(16)
    SADD(EVT_SLOT_B, EVT_SLOT_2, EVT_SLOT_0)
    LOMA(0x1b)
    ENDA
};

CONST_DATA EventListScr EventScr_9EEAAC[] = {
    EVBIT_MODIFY(0x3)
    MUSI
    TEXTSTART
    CHECK_EVENTID(65535)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(65535)
    SDEQUEUE(EVT_SLOT_2)
    TEXTSHOW(0xffff)
    TEXTEND
    SDEQUEUE(EVT_SLOT_2)
    GOTO(0x1)
LABEL(0x0)
    SDEQUEUE(EVT_SLOT_2)
    SDEQUEUE(EVT_SLOT_2)
    TEXTSHOW(0xffff)
    TEXTEND
LABEL(0x1)
    CALL(EventScr_9EEB00)
    ENDA
};

CONST_DATA EventListScr EventScr_9EEB00[] = {
    CHECK_MONEY
    BLT(0x0, EVT_SLOT_C, EVT_SLOT_4)
    EVBIT_F(3)
    SDEQUEUE(EVT_SLOT_2)
    EvtTextShow2(0xffff) // ENOSUPP in EAstdlib
    TEXTEND
    SVAL(EVT_SLOT_7, 0x1)
    BNE(0x1, EVT_SLOT_C, EVT_SLOT_7)
    SDEQUEUE(EVT_SLOT_2)
    MUSS(0x30)
    STAL(33)
    EvtTextShow2(0xffff) // ENOSUPP in EAstdlib
    TEXTEND
    REMA
    SADD(EVT_SLOT_2, EVT_SLOT_3, EVT_SLOT_0)
    CUSA(CHAR_EVT_SLOT2)
    SADD(EVT_SLOT_3, EVT_SLOT_4, EVT_SLOT_0)
    GIVETOSLOT3(CHAR_EVT_PLAYER_LEADER)
    MURE(0x2)
    GOTO(0x2)
LABEL(0x0)
    SDEQUEUE(EVT_SLOT_2)
    SDEQUEUE(EVT_SLOT_2)
    SDEQUEUE(EVT_SLOT_2)
    SDEQUEUE(EVT_SLOT_2)
    EvtTextShow2(0xffff) // ENOSUPP in EAstdlib
    TEXTEND
    REMA
    MUNO
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x1)
    SDEQUEUE(EVT_SLOT_2)
    SDEQUEUE(EVT_SLOT_2)
    EvtTextShow2(0xffff) // ENOSUPP in EAstdlib
    TEXTEND
    REMA
    MUNO
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x2)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_CallBreakStone[] = {
    STARTFADE
    EvtColorFadeSetup(0x0, 0x20, 8, 128, 128, 128) // ENOSUPP in EAstdlib
    STAL(30)
    BREAKSTONE(CHAR_EVT_SLOT2)
    EvtColorFadeSetup(0x0, 0x20, 4, 256, 256, 256) // ENOSUPP in EAstdlib
    ENDA
};
