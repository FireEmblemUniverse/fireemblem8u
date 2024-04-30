#pragma once

#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "eventscript.h"
#include "eventcall.h"
#include "EAstdlib.h"
#include "mapanim.h"
#include "bmio.h"
#include "ending_details.h"
#include "constants/characters.h"

CONST_DATA EventListScr EventScr_Ch11a_BeginingScene[] = {
    MUSC(0x4d)
    LOAD2(0x1, UnitDef_088B9E20)
    ENUN
    CUMO_CHAR(CHARACTER_EWAN)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x1e)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xa46)
    TEXTEND
    MUSCMID(0x7fff)
    TEXTCONT
    TEXTEND
    MUSC(0x25)
    TEXTCONT
    TEXTEND
    REMA
    CALL(EventScr_TextShowWithFadeIn)
    CHECK_ALIVE(CHARACTER_TETHYS)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_TETHYS)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x1e)
    SVAL(EVT_SLOT_3, 0xa47)
    CALL(Event_TextWithBG)
    GOTO(0x1)
LABEL(0x0)
    MOVE_1STEP(0x0, CHARACTER_INNES, FACING_RIGHT)
    ENUN
    CUMO_CHAR(CHARACTER_INNES)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x1e)
    SVAL(EVT_SLOT_3, 0xa48)
    CALL(Event_TextWithBG)
LABEL(0x1)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x86)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x85)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    MOVE_DEFINED(CHARACTER_EWAN)
    ENUN
    DISA(CHARACTER_EWAN)
    FADI(16)
    CLEA
    CAMERA2(12, 13)
    FADU(16)
    LOAD1(0x1, UnitDef_088B9CCC)
    ENUN
    CUMO_CHAR(CHARACTER_LARACHEL)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x27)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xa49)
    TEXTEND
    REMA
    FADI(16)
    LOAD1(0x1, UnitDef_088B9984)
    ENUN
    CALL(EventScr_08591FD8)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch11a_EndingScene[] = {
    MUSC(0x31)
    SVAL(EVT_SLOT_2, 0x27)
    CALL(EventScr_SetBackground)
    CHECK_ALIVE(CHARACTER_LARACHEL)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    TEXTSHOW(0xa4a)
    TEXTEND
    GOTO(0x1)
LABEL(0x0)
    TEXTSHOW(0xa4b)
    TEXTEND
LABEL(0x1)
    FADI(4)
    REMA
    FADU(4)
    TEXTSHOW(0xa4c)
    TEXTEND
    CHECK_ALIVE(CHARACTER_DOZLA)
    BEQ(0x2, EVT_SLOT_C, EVT_SLOT_0)
    EvtTextShow2(0xa4d) // ENOSUPP in EAstdlib
    TEXTEND
LABEL(0x2)
    REMA
    MUSCMID(0x7fff)
    FADI(16)
    SVAL(EVT_SLOT_2, 0x19)
    CALL(EventScr_LoadUniqueAlly)
    SVAL(EVT_SLOT_2, 0x1a)
    CALL(EventScr_LoadUniqueAlly)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0xa0000)
    LOMA(0x41)
    VCWF(0)
    MUSC(0x4a)
    FADU(16)
    LOAD2(0x1, UnitDef_088BA018)
    ENUN
    DISA(CHARACTER_EWAN)
    STAL(30)
    CUMO_AT(2, 6)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x1)
    CALL(EventScr_SetBackground)
    MUSI
    TEXTSHOW(0xa4e)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7fff, 8) // ENOSUPP in EAstdlib
    FADI(2)
    CLEAN
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_088B9F14)
    ENUN
    DISA(CHARACTER_GLEN)
    DISA(0x80)
    DISA(0x81)
    FADU(2)
    LOAD2(0x1, UnitDef_088B9F14)
    ENUN
    CUMO_CHAR(CHARACTER_GLEN)
    STAL(60)
    CURE
    MUSC(0x2e)
    SVAL(EVT_SLOT_2, 0x1d)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xa4f)
    TEXTEND
    MUSC(0x28)
    TEXTCONT
    TEXTEND
    REMA
    CALL(EventScr_TextShowWithFadeIn)
    MOVE(0x0, CHARACTER_SALEH, 13, 0)
    ENUN
    MOVE(0x10, CHARACTER_INNES, 13, 0)
    MOVE(0x10, CHARACTER_LARACHEL, 13, 0)
    MOVE(0x10, CHARACTER_SETH, 13, 0)
    MOVE(0x10, CHARACTER_EIRIKA, 13, 0)
    ENUN
    MOVE(0x10, CHARACTER_GLEN, 8, 5)
    MOVE(0x10, 0x80, 7, 4)
    MOVE(0x10, 0x81, 9, 4)
    LOAD1(0x1, UnitDef_088B9FC8)
    ENUN
    ENUN
    CUMO_CHAR(CHARACTER_VALTER)
    STAL(60)
    CURE
    MUSC(0x2e)
    SVAL(EVT_SLOT_2, 0x1d)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xa50)
    TEXTEND
    MUSC(0x26)
    TEXTCONT
    TEXTEND
    REMA
    CALL(EventScr_TextShowWithFadeIn)
    MOVE_1STEP(0x0, CHARACTER_VALTER, FACING_UP)
    ENUN

    StartBattle
    NormalDamage(ATTACKER, 0)
    MissedAttack(DEFENDER, 0)
    CriticalHit(ATTACKER, 100)
    EndAttack
    FIGHT(CHARACTER_GLEN, CHARACTER_VALTER, 0, 0)

    KILL(CHARACTER_GLEN)
    DISA_IF(CHARACTER_GLEN)

    CUMO_CHAR(CHARACTER_VALTER)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xa52)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x20087)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x20083)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x20003)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    MOVE_DEFINED(0x80)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x20101)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x20001)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    MOVE_DEFINED(0x81)
    STAL2(15)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x20086)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x20083)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x20003)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    MOVE_DEFINED(CHARACTER_BANDIT_CH5)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x20101)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x20001)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    MOVE_DEFINED(0x67)
    ENUN
    CUMO_CHAR(CHARACTER_VALTER)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xa53)
    TEXTEND
    REMA
    ENUT(115)
    MNC2(0xc)
    ENDA
};

CONST_DATA EventListScr EventScr_089F4E54[] = {
    MUSS(0x30)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0xa54)
    TEXTEND
    REMA
    MURE(0x2)
    CUSA(CHARACTER_LARACHEL)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F4E7C[] = {
    MUSS(0x30)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0xa55)
    TEXTEND
    REMA
    MURE(0x2)
    CUSA(CHARACTER_DOZLA)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F4EA4[] = {
    SVAL(EVT_SLOT_2, UnitDef_088B9D08)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F4EBC[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xb4)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F4EE0[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_1, 0x10500)
    CHAI(0xaf)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xbc)
    SVAL(EVT_SLOT_1, 0x11200)
    CHAI(0xb8)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F4F1C[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xae)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F4F40[] = {
    SVAL(EVT_SLOT_2, UnitDef_088B9D30)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F4F58[] = {
    SVAL(EVT_SLOT_2, UnitDef_088B9D80)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F4F70[] = {
    SVAL(EVT_SLOT_2, UnitDef_088B9DD0)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch12a_BeginingScene[] = {
    MUSC(0x47)
    LOAD2(0x1, UnitDef_088BA5F8)
    ENUN
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xa56)
    TEXTEND
    MUSCSLOW(0x7fff)
    TEXTCONT
    TEXTEND
    REMA
    CAMERA2(10, 20)
    LOAD1(0x1, UnitDef_088BA274)
    ENUN
    SVAL(EVT_SLOT_2, UnitDef_088BA6AC)
    SVAL(EVT_SLOT_3, 0x1)
    CALL(EventScr_LoadUnitForTutorial)
    CUMO_CHAR(CHARACTER_SETH)
    STAL(60)
    CURE
    MUSC(0x25)
    TEXTSTART
    TEXTSHOW(0xa57)
    TEXTEND
    REMA
    FADI(16)
    LOAD1(0x0, UnitDef_Event_Ch12aAlly)
    ENUN
    CALL(EventScr_08591FD8)
    MUSCMID(0x7fff)
    CAMERA2(7, 21)
    FADU(16)
    CUMO_CHAR(CHARACTER_SALEH)
    STAL(60)
    CURE
    MUSC(0xa)
    TEXTSTART
    TEXTSHOW(0xa58)
    TEXTEND
    REMA
    CAMERA2(9, 11)
    LOAD2(0x1, UnitDef_088BA670)
    ENUN
    CUMO_CHAR(CHARACTER_EWAN)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xa59)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x2c9)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x309)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x305)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    MOVE_DEFINED(CHARACTER_EWAN)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x2cb)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x2c9)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x309)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x306)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    MOVE_DEFINED(CHARACTER_FADO)
    ENUN
    DISA(CHARACTER_EWAN)
    STAL(30)
    MOVE(0x8, CHARACTER_FADO, 7, 12)
    ENUN
    CUMO_AT(5, 12)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x1)
    CALL(EventScr_SetBackground)
    MUSI
    TEXTSHOW(0xa5a)
    TEXTEND
    REMA
    MUNO
    FADI(16)
    CLEAN
    DISA(CHARACTER_FADO)
    LOAD1(0x1, UnitDef_088BA4F4)
    ENUN
    ENUT(7)
    ENUT(8)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch12a_EndingScene[] = {
    MUSC(0x31)
    FADI(16)
    CLEA
    CLEE
    CLEN
    CHECK_EXISTS(CHARACTER_EWAN)
    BNE(0x2, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_SALEH)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, 0x1)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xa5b)
    TEXTEND
    GOTO(0x1)
LABEL(0x0)
    CHECK_ALIVE(CHARACTER_TETHYS)
    BEQ(0x2, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, 0x1)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xa5c)
    TEXTEND
LABEL(0x1)
    FADI(16)
    LOAD1(0x1, UnitDef_088BA5D0)
    ENUN
LABEL(0x2)
    CLEAN
    CAMERA2(12, 4)
    FADU(16)
    STAL(15)
    CUMO_AT(12, 1)
    STAL(60)
    CURE
    CHECK_ALIVE(CHARACTER_SALEH)
    BEQ(0xa, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, 0x4)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xa5d)
    TEXTEND
    REMA
    MUSCMID(0x7fff)
    FADI(16)
    SVAL(EVT_SLOT_2, 0x1)
    CALL(EventScr_SetBackground)
    MUSC(0x2b)
    TEXTSHOW(0xa5e)
    TEXTEND
    MUSCMID(0x7fff)
    STAL3(32)
    MUSC(0x32)
    TEXTCONT
    TEXTEND
    REMA
    FADI(4)
    SVAL(EVT_SLOT_2, 0x3)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xa5f)
    TEXTEND
    REMA
    GOTO(0xb)
LABEL(0xa)
    MUSC(0x32)
    SVAL(EVT_SLOT_2, 0x3)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xa60)
    TEXTEND
    REMA
    MUSCMID(0x7fff)
    FADI(16)
    SVAL(EVT_SLOT_2, 0x1)
    CALL(EventScr_SetBackground)
    MUSC(0x2b)
    TEXTSHOW(0xa61)
    TEXTEND
    MUSCMID(0x7fff)
    STAL3(32)
    MUSC(0x32)
    TEXTCONT
    TEXTEND
    REMA
    FADI(4)
    SVAL(EVT_SLOT_2, 0x3)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xa62)
    TEXTEND
    REMA
LABEL(0xb)
    ENUT(116)
    MNCH(0xd)
    ENDA
};

CONST_DATA EventListScr EventScr_089F536C[] = {
    MUSI
    SVAL(EVT_SLOT_2, 0x1)
    SVAL(EVT_SLOT_3, 0xa63)
    CALL(Event_TextWithBG)
    MUNO
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x59)
    GIVEITEMTO(CHAR_EVT_ACTIVE_UNIT)
    TILECHANGE(0x2)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F53AC[] = {
    MUSS(0x30)
    STAL(33)
LABEL(0x0)
    CHECK_ACTIVE
    SVAL(EVT_SLOT_7, 0x1)
    BEQ(0x1, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x17)
    BEQ(0x2, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x15)
    BEQ(0x3, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_2, 0x1)
    SVAL(EVT_SLOT_3, 0xa67)
    CALL(Event_TextWithBG)
    GOTO(0x9)
LABEL(0x1)
    SVAL(EVT_SLOT_2, 0x1)
    SVAL(EVT_SLOT_3, 0xa64)
    CALL(Event_TextWithBG)
    GOTO(0x9)
LABEL(0x2)
    SVAL(EVT_SLOT_2, 0x1)
    SVAL(EVT_SLOT_3, 0xa65)
    CALL(Event_TextWithBG)
    GOTO(0x9)
LABEL(0x3)
    SVAL(EVT_SLOT_2, 0x1)
    SVAL(EVT_SLOT_3, 0xa66)
    CALL(Event_TextWithBG)
LABEL(0x9)
    LOAD1(0x1, UnitDef_088BA5D0)
    ENUN
    TILECHANGE(0x3)
    MURE(0x2)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F5484[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(7)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F54A0[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BA51C)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088BA7C4)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F54C8[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(8)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F54E4[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BA738)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088BA7EC)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_088BA788)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088BA580)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch13a_BeginingScene[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_9EEA58)
    SVAL(EVT_SLOT_2, 0xc)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xa68)
    TEXTEND
    REMA
    FADI(16)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x3f)
    FADU(16)
    LOAD1(0x1, UnitDef_088BB970)
    ENUN
    CLEE
    CUMO_AT(10, 4)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0xc)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xa69)
    TEXTEND
    REMA
    FADI(16)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x49)
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_088BB9C4)
    ENUN
    DISA(CHARACTER_MESSENGER)
    FADU(16)
    LOAD2(0x1, UnitDef_088BB9C4)
    ENUN
    CUMO_CHAR(CHARACTER_MESSENGER)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x1d)
    CALL(EventScr_SetBackground)
    MUSC(0x25)
    TEXTSHOW(0xa6a)
    TEXTEND
    REMA
    FADI(4)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_2, 0x1d)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xa6b)
    TEXTEND
    REMA
    FADI(16)
    SVAL(EVT_SLOT_B, 0x90012)
    LOMA(0xd)
    LOAD1(0x1, UnitDef_088BAA74)
    ENUN
    SVAL(EVT_SLOT_2, UnitDef_088BAC18)
    SVAL(EVT_SLOT_3, 0x1)
    CALL(EventScr_LoadUnitForTutorial)
    CHECK_EVENTID(134)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_EXISTS(CHARACTER_AMELIA)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    LOAD1(0x1, UnitDef_088BAF10)
    ENUN
    GOTO(0x1)
LABEL(0x0)
    ENUT(7)
LABEL(0x1)
    FADU(16)
    CUMO_AT(23, 11)
    STAL(60)
    CURE
    MUSS(0x2e)
    STAL(33)
    SVAL(EVT_SLOT_2, 0x26)
    SVAL(EVT_SLOT_3, 0xa6c)
    CALL(Event_TextWithBG)
    LOAD1(0x1, UnitDef_088BAF38)
    ENUN
    LOAD1(0x1, UnitDef_088BAA4C)
    ENUN
    DISA(CHARACTER_CAELLACH)
    CAMERA2(13, 9)
    LOAD2(0x1, UnitDef_088BAF60)
    ENUN
    SVAL(EVT_SLOT_1, 0x0)
    SET_STATE(CHARACTER_EIRIKA)
    SVAL(EVT_SLOT_1, 0x0)
    SET_STATE(CHARACTER_LARACHEL)
    SVAL(EVT_SLOT_1, 0x0)
    SET_STATE(CHARACTER_INNES)
    SVAL(EVT_SLOT_1, 0x0)
    SET_STATE(CHARACTER_SETH)
    LOAD3(0x0, UnitDef_088BAFC4)
    ENUN
    SVAL(EVT_SLOT_1, 0xffffffff)
    SET_STATE(CHARACTER_EIRIKA)
    SVAL(EVT_SLOT_1, 0xffffffff)
    SET_STATE(CHARACTER_LARACHEL)
    SVAL(EVT_SLOT_1, 0xffffffff)
    SET_STATE(CHARACTER_INNES)
    SVAL(EVT_SLOT_1, 0xffffffff)
    SET_STATE(CHARACTER_SETH)
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x1b)
    CALL(EventScr_SetBackground)
    MURE(0x2)
    TEXTSHOW(0xa6d)
    TEXTEND
    REMA
    CALL(EventScr_08591FD8)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch13a_EndingScene[] = {
    CHECK_EVENTID(2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CAMERA_CAHR(CHARACTER_AIAS)
    CUMO_CHAR(CHARACTER_AIAS)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x1b)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xa75)
    TEXTEND
    GOTO(0x1)
LABEL(0x0)
    SVAL(EVT_SLOT_2, 0x1b)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xa76)
    TEXTEND
LABEL(0x1)
    REMA
    FADI(16)
    CLEE
    CLEAN
    CAMERA(23, 0)
    FADU(16)
    LOAD1(0x1, UnitDef_088BB078)
    ENUN
    CUMO_CHAR(CHARACTER_MANSEL)
    STAL(60)
    CURE
    MUSC(0xf)
    TEXTSTART
    TEXTSHOW(0xa77)
    TEXTEND
    REMA
    CAMERA_CAHR(CHARACTER_EIRIKA)
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x1b)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xa78)
    TEXTEND
    REMA
    FADI(16)
    SVAL(EVT_SLOT_2, 0x1b)
    CALL(EventScr_SetBackground)
    MUSS(0x31)
    STAL(33)
    CHECK_ALIVE(CHARACTER_DOZLA)
    BEQ(0xa, EVT_SLOT_C, EVT_SLOT_0)
    TEXTSHOW(0xa79)
    TEXTEND
    REMA
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x1388)
    GIVEITEMTOMAIN(CHAR_EVT_PLAYER_LEADER)
    TEXTSHOW(0xa7a)
    TEXTEND
    MUSCMID(0x7fff)
    TEXTCONT
    TEXTEND
    MUSC(0x26)
    TEXTCONT
    TEXTEND
    GOTO(0xb)
LABEL(0xa)
    TEXTSHOW(0xa7b)
    TEXTEND
    REMA
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x1388)
    GIVEITEMTOMAIN(CHAR_EVT_PLAYER_LEADER)
    TEXTSHOW(0xa7c)
    TEXTEND
    MUSCMID(0x7fff)
    TEXTCONT
    TEXTEND
    MUSC(0x26)
    TEXTCONT
    TEXTEND
LABEL(0xb)
    REMA
    FADI(4)
    CLEA
    CLEE
    CLEN
    CHECK_EVENTID(2)
    BNE(0x63, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0xf)
    LOAD1(0x1, UnitDef_088BBA58)
    ENUN
    FADU(4)
    LOAD1(0x1, UnitDef_088BBA80)
    ENUN
    SVAL(EVT_SLOT_1, 0x5)
    SET_HP(CHARACTER_AIAS)
    CUMO_CHAR(CHARACTER_CAELLACH)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x30)
    CALL(EventScr_SetBackground)
    MUSC(0x2e)
    TEXTSHOW(0xa7d)
    TEXTEND
    REMA
    CALL(EventScr_TextShowWithFadeIn)

    StartBattle
    CriticalHit(DEFENDER, 0)
    FIGHT_MAP(CHARACTER_CAELLACH, CHARACTER_AIAS, 0, 0)

    FADI(4)
LABEL(0x63)
    ENUT(117)
    MNCH(0xe)
    ENDA
};

CONST_DATA EventListScr EventScr_089F59CC[] = {
    MUSS(0x30)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0xa28)
    TEXTEND
    REMA
    MURE(0x2)
    CUSA(CHARACTER_AMELIA)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F59F8[] = {
    MUSS(0x30)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0xa27)
    TEXTEND
    REMA
    MURE(0x2)
    CUSA(CHARACTER_AMELIA)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F5A20[] = {
    MUSS(0x30)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0xa80)
    TEXTEND
    REMA
    MURE(0x2)
    CUSA(CHARACTER_CORMAG)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F5A48[] = {
    MUSC(0x14)
    SVAL(EVT_SLOT_2, UnitDef_088BACA4)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088BAD80)
    CALL(EventScr_LoadReinforceHardMode)
    CUMO_CHAR(CHARACTER_PABLO)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xa6e)
    TEXTEND
    REMA
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F5A90[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_088BADBC)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088BADF8)
    CALL(EventScr_LoadReinforce)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F5AD4[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BAE48)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F5AEC[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BAE84)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F5B04[] = {
    MUSC(0x14)
    SVAL(EVT_SLOT_2, UnitDef_088BAEC0)
    CALL(EventScr_LoadReinforce)
    CUMO_CHAR(CHARACTER_CORMAG)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xa6f)
    TEXTEND
    REMA
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch14a_BeginingScene[] = {
    REMOVEPORTRAITS
    BACG(0x35)
    FADU(128)
    FAWI(2)
    BACG(0x14)
    EvtBgmFadeIn(0x2c, 8) // ENOSUPP in EAstdlib
    FAWU(2)
    BROWNBOXTEXT(0x210, 8, 8)
    TEXTSHOW(0xa81)
    TEXTEND
    EvtBgmFadeIn(0x7fff, 8) // ENOSUPP in EAstdlib
    FAWI(2)
    REMA
    SVAL(EVT_SLOT_B, 0x4000e)
    LOMA(0xf)
    MUSC(0x4e)
    FAWU(2)
    LOAD2(0x1, UnitDef_088BC350)
    ENUN
    CUMO_CHAR(CHARACTER_SETH)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x30)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xa82)
    TEXTEND
    MUSC(0x25)
    TEXTCONT
    TEXTEND
    REMA
    CALL(EventScr_TextShowWithFadeIn)
    MOVE(0x10, CHARACTER_EIRIKA, 9, 4)
    MOVE(0x10, CHARACTER_SETH, 9, 4)
    MOVE(0x10, CHARACTER_INNES, 9, 4)
    MOVE(0x10, CHARACTER_LARACHEL, 9, 4)
    STAL2(20)
    FADI(16)
    ENUN
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x7000a)
    LOMA(0xe)
    LOAD1(0x1, UnitDef_088BBCAC)
    ENUN
    MOVE(0xffff, CHARACTER_CARLYLE, 9, 7)
    LOAD1(0x1, UnitDef_088BC10C)
    ENUN
    FADU(16)
    MOVE_1STEP(0x10, CHARACTER_CARLYLE, FACING_UP)
    ENUN
    CUMO_CHAR(CHARACTER_CARLYLE)
    STAL(60)
    CURE
    MUSC(0x26)
    TEXTSTART
    TEXTSHOW(0xa83)
    TEXTEND
    REMA
    FADI(16)
    MOVE(0xffff, CHARACTER_CARLYLE, 8, 7)
    CALL(EventScr_08591FD8)
    MUSC(0x14)
    CAMERA_CAHR(CHARACTER_RENNAC)
    FADU(16)
    CUMO_CHAR(CHARACTER_RENNAC)
    STAL(60)
    CURE
    MUSI
    SVAL(EVT_SLOT_2, 0x2a)
    SVAL(EVT_SLOT_3, 0xa84)
    CALL(Event_TextWithBG)
    ENUT(12)
    ENUT(14)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F5CC4[] = {
    CAMERA2(9, 7)
    LOAD1(0x1, UnitDef_088BC134)
    ENUN
    CUMO_CHAR(CHARACTER_CAELLACH)
    STAL(60)
    CURE
    MUSC(0x26)
    TEXTSTART
    TEXTSHOW(0xa85)
    TEXTEND
    REMA
    MOVEONTO(0x0, CHARACTER_CAELLACH, CHARACTER_ISMAIRE)
    ENUN
    MOVE_1STEP(0x8, CHARACTER_ISMAIRE, FACING_DOWN)
    MOVE_1STEP(0x0, CHARACTER_CARLYLE, FACING_RIGHT)
    ENUN
    CUMO_CHAR(CHARACTER_CAELLACH)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xa86)
    TEXTEND
    REMA
    MOVE_1STEP(0x0, CHARACTER_CARLYLE, FACING_LEFT)
    ENUN
    MOVEONTO(0x0, CHARACTER_CAELLACH, CHARACTER_ISMAIRE)
    ENUN
    DISA(CHARACTER_ISMAIRE)
    STAL(16)
    MOVE(0x0, CHARACTER_CAELLACH, 9, 8)
    ENUN
    CUMO_CHAR(CHARACTER_CAELLACH)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xa87)
    TEXTEND
    REMA
    MOVEONTO(0x0, CHARACTER_CAELLACH, CHARACTER_LYON)
    ENUN
    DISA(CHARACTER_LYON)
    MOVE(0x0, CHARACTER_CAELLACH, 17, 11)
    ENUN
    DISA(CHARACTER_CAELLACH)
    CAMERA2(9, 6)
    MOVE(0x0, CHARACTER_CARLYLE, 9, 5)
    LOAD1(0x1, UnitDef_088BC170)
    ENUN
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch14a_EndingScene[] = {
    FADI(16)
    SVAL(EVT_SLOT_2, 0x1c)
    CALL(EventScr_9EE5BC)
    MUSC(0x26)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x4a)
    FADU(16)
    LOAD1(0x1, UnitDef_088BC45C)
    ENUN
    CUMO_CHAR(CHARACTER_CAELLACH)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0xe)
    SVAL(EVT_SLOT_3, 0xa8b)
    CALL(Event_TextWithBG)
    MOVE_1STEP(0x10, CHARACTER_CAELLACH, FACING_UP)
    ENUN

    StartBattle
    NormalDamage(DEFENDER, 0)
    FIGHT_MAP(CHARACTER_CAELLACH, CHARACTER_ISMAIRE, 0, 0)

    DISA(CHARACHER_FRELIAN)
    CUMO_CHAR(CHARACTER_CAELLACH)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xa8c)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x53)
    CALL(EventScr_CallBreakStone)
    MOVE(0x30, CHARACTER_LYON, 6, 3)
    ENUN
    CUMO_CHAR(CHARACTER_CAELLACH)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0xe)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xa8d)
    TEXTEND
    REMA
    MUSCMID(0x7fff)
    FADI(16)
    SVAL(EVT_SLOT_B, 0x7000a)
    LOMA(0xe)
    CLEA
    CLEE
    CLEN
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_088BC1FC)
    ENUN
    FADU(16)
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xa8e)
    TEXTEND
    REMA
    LOAD2(0x1, UnitDef_088BC1FC)
    ENUN
    SPAWN_ENEMY(CHARACTER_LYON, 0, 0)
    SVAL(EVT_SLOT_2, 0x40)
    MOVE_CLOSEST(0xffff, CHAR_EVT_SLOT2, 9, 8)
    CALL(EventScr_UnitWarpIN)
    STAL(15)
    MOVE_1STEP(0x0, CHARACTER_LYON, FACING_DOWN)
    ENUN
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    MUSC(0x2c)
    TEXTSTART
    TEXTSHOW(0xa8f)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    DISA(CHARACTER_LYON)
    MUSCMID(0x7fff)
    LOAD2(0x1, UnitDef_088BC24C)
    ENUN
    CUMO_CHAR(CHARACTER_LARACHEL)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xa90)
    TEXTEND
    REMA
    LOAD2(0x1, UnitDef_088BC274)
    STAL2(30)
    FADI(16)
    ENUN
    SVAL(EVT_SLOT_2, 0xe)
    CALL(EventScr_SetBackground)
    CHECK_ALIVE(CHARACTER_JOSHUA)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    TEXTSHOW(0xa91)
    TEXTEND
    MUSCSLOW(0x29)
    TEXTCONT
    TEXTEND
    REMA
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x91)
    GIVEITEMTO(CHARACTER_JOSHUA)
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x3e)
    GIVEITEMTO(CHARACTER_JOSHUA)
    GOTO(0x1)
LABEL(0x0)
    TEXTSHOW(0xa94)
    TEXTEND
    MUSCSLOW(0x29)
    TEXTCONT
    TEXTEND
    REMA
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x91)
    GIVEITEMTO(CHARACTER_EIRIKA)
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x3e)
    GIVEITEMTO(CHARACTER_EIRIKA)
LABEL(0x1)
    MUSCSLOW(0x7fff)
    FADI(16)
    TILECHANGE(0x2)
    CLEAN
    CAMERA(24, 0)
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_088BC2B0)
    ENUN
    DISA(0xcd)
    CHECK_ALIVE(CHARACTER_JOSHUA)
    BEQ(0x2, EVT_SLOT_C, EVT_SLOT_0)
    FADU(16)
    CUMO_CHAR(CHARACTER_JOSHUA)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x2a)
    CALL(EventScr_SetBackground)
    MUSC(0x32)
    TEXTSHOW(0xa92)
    TEXTEND
    REMA
    FADI(16)
    CLEAN
LABEL(0x2)
    FADU(16)
    STAL(15)
    LOAD2(0x1, UnitDef_088BC2B0)
    ENUN
    CUMO_CHAR(0xcd)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x2a)
    CALL(EventScr_SetBackground)
    CHECK_ALIVE(CHARACTER_JOSHUA)
    BEQ(0xa, EVT_SLOT_C, EVT_SLOT_0)
    MUSC(0x26)
    TEXTSHOW(0xa93)
    TEXTEND
    GOTO(0xb)
LABEL(0xa)
    MUSC(0x26)
    TEXTSHOW(0xa95)
    TEXTEND
LABEL(0xb)
    EvtBgTransion(0x2b, 1, 4) // ENOSUPP in EAstdlib
    REMOVEPORTRAITS
    TEXTCONT
    TEXTEND
    REMA
    FADI(16)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x4000e)
    LOMA(0xf)
    FADU(16)
    LOAD2(0x1, UnitDef_088BC4D4)
    ENUN
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x30)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xa96)
    TEXTEND
    FADI(16)
    REMA
    ENUT(118)
    MNCH(0xf)
    ENDA
};

CONST_DATA EventListScr EventScr_089F619C[] = {
    MUSS(0x30)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0xa97)
    TEXTEND
    REMA
    MURE(0x2)
    CUSA(CHARACTER_RENNAC)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F61C4[] = {
    SVAL(EVT_SLOT_2, 0x9)
    SVAL(EVT_SLOT_3, 0x1c)
    SVAL(EVT_SLOT_4, 0x26fc)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0xa98)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xa99)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xa9b)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xa9c)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xa9d)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xa9a)
    SENQUEUE1
    CALL(EventScr_9EEAAC)
    ENDA
};

CONST_DATA EventListScr EventScr_089F6238[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BC008)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F6250[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BC0BC)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F6268[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(12)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F6284[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BC030)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F629C[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    COUNTER_SET(0x0, 2)
    ENUF(14)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F62BC[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BC080)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0x0)
    ENUF(14)
    COUNTER_CHECK(0x0)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(14)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F62F0[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x70008)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x70009)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x7000a)
    SENQUEUE1
    SVAL(EVT_SLOT_2, 0x10000)
    CALL(EventScr_ChangeAIinQueue)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch15a_BeginingScene[] = {
    MUSC(0x26)
    LOAD2(0x1, UnitDef_088BC4D4)
    ENUN
    FADU(16)
    CUMO_CHAR(CHARACTER_SETH)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x30)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb17)
    TEXTEND
    FADI(4)
    REMA
    CAMERA(23, 21)
    CLEAN
    LOAD1(0x1, UnitDef_088BC714)
    ENUN
    FADU(16)
    SPAWN_ENEMY(CHARACTER_RIEV, 0, 0)
    SVAL(EVT_SLOT_2, 0x57)
    MOVE_CLOSEST(0xffff, CHAR_EVT_SLOT2, 21, 18)
    CALL(EventScr_UnitWarpIN)
    CUMO_CHAR(CHARACTER_RIEV)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x30)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb18)
    TEXTEND
    FADI(16)
    REMA
    DISA(CHARACTER_RIEV)
    LOAD1(0x1, UnitDef_088BCA48)
    ENUN
    CALL(EventScr_08591FD8)
    ENDA
};

CONST_DATA EventListScr EventScr_089F6404[] = {
    MUSC(0x25)
    EVBIT_T(9)
    LOAD1(0x1, UnitDef_088BCAD4)
    ENUN
    EVBIT_F(9)
    REVEAL(CHARACTER_EPHRAIM)
    SVAL(EVT_SLOT_1, 0x1)
    SET_STATE(CHARACTER_EPHRAIM)
    SVAL(EVT_SLOT_1, 0x1)
    SET_STATE(CHARACTER_DUESSEL)
    SVAL(EVT_SLOT_1, 0x1)
    SET_STATE(CHARACTER_KNOLL)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x30)
    SVAL(EVT_SLOT_3, 0xb1b)
    CALL(Event_TextWithBG)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F6470[] = {
    CALL(EventScr_089F6484)
    ENUT(119)
    MNCH(0x10)
    ENDA
};

CONST_DATA EventListScr EventScr_089F6484[] = {
    MUSC(0x31)
    SVAL(EVT_SLOT_2, 0x30)
    CALL(EventScr_SetBackground)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSHOW(0xb27)
    TEXTEND
    REMA
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x4a)
    GIVEITEMTO(CHARACTER_EIRIKA)
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x93)
    GIVEITEMTO(CHARACTER_EIRIKA)
    GOTO(0x1)
LABEL(0x0)
    TEXTSHOW(0xb28)
    TEXTEND
    REMA
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x91)
    GIVEITEMTO(CHARACTER_EPHRAIM)
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x3e)
    GIVEITEMTO(CHARACTER_EPHRAIM)
LABEL(0x1)
    FADI(16)
    CLEA
    CLEE
    CLEN
    CAMERA2(12, 5)
    CLEAN
    FADU(16)
    CUMO_AT(8, 8)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x27)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb29)
    TEXTEND
    MUSS(0x2d)
    STAL(33)
    TEXTCONT
    TEXTEND
    EvtTextShow2(0xb2a) // ENOSUPP in EAstdlib
    TEXTEND
    MURE(0x4)
    TEXTCONT
    TEXTEND
    REMA
    MUSCMID(0x7fff)
    FADI(16)
    CHECK_ALIVE(CHARACTER_SALEH)
    BEQ(0x63, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, 0x27)
    CALL(EventScr_SetBackground)
    MUSC(0x2b)
    TEXTSHOW(0xb2b)
    TEXTEND
    REMA
    FADI(16)
LABEL(0x63)
    ENDA
};

CONST_DATA EventListScr EventScr_089F65C8[] = {
    MUSI
    SVAL(EVT_SLOT_2, 0x0)
    SVAL(EVT_SLOT_3, 0xb36)
    CALL(Event_TextWithBG)
    MUNO
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x88)
    GIVEITEMTO(CHAR_EVT_ACTIVE_UNIT)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F6604[] = {
    MUSI
    SVAL(EVT_SLOT_2, 0x0)
    SVAL(EVT_SLOT_3, 0xb37)
    CALL(Event_TextWithBG)
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F662C[] = {
    MUSI
    SVAL(EVT_SLOT_2, 0x0)
    SVAL(EVT_SLOT_3, 0xb38)
    CALL(Event_TextWithBG)
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F6654[] = {
    MUSS(0x27)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0xb2c)
    TEXTEND
    REMA
    MURE(0x2)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F6678[] = {
    MUSI
    TEXTSTART
    TEXTSHOW(0xb2d)
    TEXTEND
    REMA
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F6698[] = {
    MUSI
    TEXTSTART
    TEXTSHOW(0xb2e)
    TEXTEND
    REMA
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F66B8[] = {
    MUSI
    TEXTSTART
    TEXTSHOW(0xb2f)
    TEXTEND
    REMA
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F66D8[] = {
    MUSI
    TEXTSTART
    TEXTSHOW(0xb30)
    TEXTEND
    REMA
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F66F8[] = {
    MUSI
    TEXTSTART
    TEXTSHOW(0xb31)
    TEXTEND
    REMA
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F6718[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BCB24)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F6730[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BCB60)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F6748[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BCB9C)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088BCBD8)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F6770[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BCC00)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F6788[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BCD04)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F67A0[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0x81)
    SVAL(EVT_SLOT_1, 0x11200)
    CHAI(0x82)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F67D0[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    CHECK_LUCK(CHAR_EVT_ACTIVE_UNIT)
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_3, 0xf)
    CALL(EventScr_GiveTreasureToLuckyDog)
    BNE(0x81b5, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x81b5)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F6814[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    CHECK_LUCK(CHAR_EVT_ACTIVE_UNIT)
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_3, 0x62)
    CALL(EventScr_GiveTreasureToLuckyDog)
    BNE(0x81c5, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x81c5)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F6858[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    CHECK_LUCK(CHAR_EVT_ACTIVE_UNIT)
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_3, 0x89)
    CALL(EventScr_GiveTreasureToLuckyDog)
    BNE(0x81d5, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x81d5)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F689C[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    CHECK_LUCK(CHAR_EVT_ACTIVE_UNIT)
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_3, 0x54)
    CALL(EventScr_GiveTreasureToLuckyDog)
    BNE(0x81e5, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x81e5)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F68E0[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    CHECK_LUCK(CHAR_EVT_ACTIVE_UNIT)
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_3, 0x48)
    CALL(EventScr_GiveTreasureToLuckyDog)
    BNE(0x81f5, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x81f5)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F6924[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    CHECK_LUCK(CHAR_EVT_ACTIVE_UNIT)
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_3, 0x63)
    CALL(EventScr_GiveTreasureToLuckyDog)
    BNE(0x8205, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x8205)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F6968[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    CHECK_LUCK(CHAR_EVT_ACTIVE_UNIT)
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_3, 0x73)
    CALL(EventScr_GiveTreasureToLuckyDog)
    BNE(0x8215, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x8215)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F69AC[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    CHECK_LUCK(CHAR_EVT_ACTIVE_UNIT)
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_3, 0x31)
    CALL(EventScr_GiveTreasureToLuckyDog)
    BNE(0x8225, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x8225)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F69F0[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    CHECK_LUCK(CHAR_EVT_ACTIVE_UNIT)
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_3, 0x51)
    CALL(EventScr_GiveTreasureToLuckyDog)
    BNE(0x8235, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x8235)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch16a_BeginingScene[] = {
    CALL(EventScr_089F6A8C)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x10)
    LOAD1(0x0, UnitDef_088BCE58)
    ENUN
    LOAD1(0x1, UnitDef_088BCF5C)
    ENUN
    SVAL(EVT_SLOT_2, UnitDef_088BD1B4)
    SVAL(EVT_SLOT_3, 0x1)
    CALL(EventScr_LoadUnitForTutorial)
    CLEA
    CALL(EventScr_08591FD8)
    ENUT(12)
    ENDA
};

CONST_DATA EventListScr EventScr_089F6A8C[] = {
    MUSC(0x47)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x40)
    FADU(16)
    LOAD2(0x1, UnitDef_088BD648)
    ENUN
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x1d)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb39)
    TEXTEND
    MUSC(0x25)
    TEXTCONT
    TEXTEND
    REMA
    FADI(16)
    CLEAN
    FADU(16)
    MOVE_1STEP(0x10, CHARACTER_MYRRH, FACING_UP)
    ENUN
    SVAL(EVT_SLOT_2, 0x1d)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb3a)
    TEXTEND
    REMA
    MUSCMID(0x7fff)
    FADI(16)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0xc0000)
    LOMA(0x42)
    UNIT_COLORS(0x2)
    LOAD2(0x1, UnitDef_088BD810)
    ENUN
    FADU(16)
    LOAD2(0x1, UnitDef_088BD84C)
    ENUN
    SOUN(0xb1)
    TILECHANGE(0x0)
    MOVE(0x0, CHARACTER_ORSON, 7, 6)
    ENUN
    TILEREVERT(0x0)
    LOAD2(0x1, UnitDef_088BD874)
    ENUN
    FADI(16)
    CLEA
    CLEE
    CLEN
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x1, EVT_SLOT_C, EVT_SLOT_1)
    SVAL(EVT_SLOT_2, 0xe)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb3b)
    TEXTEND
    REMA
    FADI(16)
    CLEAN
LABEL(0x1)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BEQ(0x2, EVT_SLOT_C, EVT_SLOT_1)
    MUSC(0x2e)
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_088BD8B0)
    ENUN
    REMU(CHARACTER_LYON)
    REMU(CHARACTER_RIEV)
    FADU(16)
    SVAL(EVT_SLOT_2, 0x40)
    MOVE_CLOSEST(0xffff, CHAR_EVT_SLOT2, 7, 11)
    CALL(EventScr_UnitWarpIN)
    SVAL(EVT_SLOT_2, 0x57)
    MOVE_CLOSEST(0xffff, CHAR_EVT_SLOT2, 8, 11)
    CALL(EventScr_UnitWarpIN)
    LOAD2(0x1, UnitDef_088BD8B0)
    ENUN
    CUMO_CHAR(0x80)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x10)
    SVAL(EVT_SLOT_3, 0xb3c)
    CALL(Event_TextWithBG)
    MOVE_1STEP(0x10, 0x80, FACING_LEFT)
    MOVE_1STEP(0x10, 0x81, FACING_RIGHT)
    ENUN
LABEL(0x2)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x3, EVT_SLOT_C, EVT_SLOT_1)
    LOAD2(0x1, UnitDef_088BD8B0)
    ENUN
    MOVE_1STEP(0xffff, 0x80, FACING_LEFT)
    MOVE_1STEP(0xffff, 0x81, FACING_RIGHT)
    FADU(16)
LABEL(0x3)
    LOAD2(0x1, UnitDef_088BD914)
    ENUN
    SOUN(0xb1)
    TILECHANGE(0x0)
    MOVE(0x10, CHARACTER_LYON, 7, 5)
    ENUN
    MOVE(0x10, CHARACTER_RIEV, 8, 6)
    ENUN
    TILEREVERT(0x0)
    LOAD2(0x1, UnitDef_088BD950)
    ENUN
    MOVE_1STEP(0x10, 0x80, FACING_RIGHT)
    ENUN
    MOVE_1STEP(0x10, 0x81, FACING_LEFT)
    ENUN
    MUSC(0x2e)
    CUMO_CHAR(0x80)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x10)
    CALL(EventScr_SetBackground)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x4, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSHOW(0xb3d)
    TEXTEND
    GOTO(0x5)
LABEL(0x4)
    TEXTSHOW(0xb3e)
    TEXTEND
    MUSCMID(0x7fff)
LABEL(0x5)
    REMA
    FADI(16)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_2, 0xe)
    CALL(EventScr_SetBackground)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x6, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSHOW(0xb3f)
    TEXTEND
    GOTO(0x7)
LABEL(0x6)
    MUSC(0x2d)
    TEXTSHOW(0xb40)
    TEXTEND
LABEL(0x7)
    REMA
    FADI(16)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x8, EVT_SLOT_C, EVT_SLOT_1)
    CLEAN
    CAMERA(0, 0)
    MUSC(0x2d)
    FADU(16)
    LOAD2(0x1, UnitDef_088BD98C)
    ENUN
    CUMO_CHAR(CHARACTER_RIEV)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0xe)
    SVAL(EVT_SLOT_3, 0xb41)
    CALL(Event_TextWithBG)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    SVAL(EVT_SLOT_2, 0x57)
    CALL(EventScr_UnitWarpOUT)
    FADI(16)
    CLEA
    CLEE
    CLEN
LABEL(0x8)
    UNIT_COLORS(0x0)
    ENDA
};

CONST_DATA EventListScr EventScr_089F6E40[] = {
    CALL(EventScr_089F6E50)
    MNCH(0x11)
    ENDA
};

CONST_DATA EventListScr EventScr_089F6E50[] = {
    FADI(16)
    CLEA
    CLEE
    CLEN
    MUSC(0x32)
    SVAL(EVT_SLOT_2, 0xa)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb49)
    TEXTEND
    REMA
    FADI(16)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x42)
    FADU(16)
    LOAD2(0x1, UnitDef_088BDA08)
    ENUN
    SOUN(0xb1)
    TILECHANGE(0x0)
    LOAD2(0x1, UnitDef_088BDA44)
    ENUN
    CUMO_CHAR(0xfb)
    STAL(60)
    CURE
    MUSCMID(0x7fff)
    SVAL(EVT_SLOT_2, 0xe)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb4a)
    TEXTEND
    FADI(4)
    REMA
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x4000e)
    LOMA(0x10)
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_088BD3D0)
    ENUN
    FADU(4)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    MUSC(0x31)
    TEXTSTART
    TEXTSHOW(0xb4b)
    TEXTEND
    REMA
    LOAD2(0x1, UnitDef_088BD3D0)
    ENUN
    CUMO_CHAR(CHARACTER_SETH)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb4c)
    TEXTEND
    REMA
    MOVE(0x0, CHARACTER_EIRIKA, 12, 11)
    MOVE(0x0, CHARACTER_EPHRAIM, 14, 11)
    MOVE(0x0, CHARACTER_SETH, 13, 11)
    STAL2(20)
    MUSCMID(0x7fff)
    FADI(16)
    ENUN
    CLEA
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x43)
    LOAD2(0x1, UnitDef_088BDB5C)
    ENUN
    MUSC(0x95)
    FADU(16)
    LOAD2(0x1, UnitDef_088BDAF8)
    SOLOTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0x400008)
    TEXTSHOW(0xb4d)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_B, 0x580030)
    TEXTSHOW(0xb4e)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_B, 0x480060)
    TEXTSHOW(0xb4f)
    TEXTEND
    REMA
    ENUN
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0xa)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb50)
    TEXTEND
    REMA
    MUSCMID(0x7fff)
    FADI(16)
    CLEA
    CLEE
    CLEN
    STAL(60)
    SVAL(EVT_SLOT_B, 0x4000e)
    LOMA(0x10)
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_088BD420)
    ENUN
    FADU(16)
    CUMO_CHAR(CHARACTER_SETH)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb51)
    TEXTEND
    REMA
    STARTFADE
    EvtColorFadeSetup(0x6, 0xa, 4, 128, 128, 128) // ENOSUPP in EAstdlib
    ASMC2(sub_8080014)
    SVAL(EVT_SLOT_B, 0x3000d)
    TILECHANGE(0xffff)
    SVAL(EVT_SLOT_B, 0x3000e)
    TILECHANGE(0xffff)
    EvtColorFadeSetup(0x6, 0xa, 4, 256, 256, 256) // ENOSUPP in EAstdlib
    EVBIT_T(6)
    LOAD2(0x1, UnitDef_088BD420)
    STAL(20)
    FADI(4)
    ENUN
    EVBIT_F(6)
    CLEA
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x47)
    FADU(16)
    LOAD2(0x1, UnitDef_088BDC24)
    ENUN
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x2e)
    CALL(EventScr_SetBackground)
    MUSCSLOW(0x2b)
    TEXTSHOW(0xb52)
    TEXTEND
    MUSCSLOW(0x7fff)
    FADI(4)
    REMA
    CLEAN
    FADU(4)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x2e)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb53)
    TEXTEND
    SOUN(0x2eb)
    FAWI(4)
    REMA
    SVAL(EVT_SLOT_2, 0x2e)
    CALL(EventScr_089F731C)
    MUSCSLOW(0x2b)
    REMOVEPORTRAITS
    TEXTSHOW(0xb54)
    TEXTEND
    REMA
    FADI(16)
    CLEAN
    FADU(4)
    LOAD2(0x1, UnitDef_088BDC88)
    ENUN
    SOUN(0xb1)
    TILECHANGE(0x0)
    LOAD2(0x1, UnitDef_088BDCB0)
    ENUN
    SOUN(0xb1)
    TILECHANGE(0x1)
    LOAD2(0x1, UnitDef_088BDCD8)
    ENUN
    CUMO_CHAR(CHARACTER_SETH)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x2e)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb55)
    TEXTEND
    REMA
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x92)
    GIVEITEMTO(CHARACTER_EPHRAIM)
    TEXTSHOW(0xb56)
    TEXTEND
    REMA
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x85)
    GIVEITEMTO(CHARACTER_EIRIKA)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSHOW(0xb57)
    TEXTEND
    GOTO(0x1)
LABEL(0x0)
    TEXTSHOW(0xb58)
    TEXTEND
LABEL(0x1)
    FADI(16)
    REMA
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x4000e)
    LOMA(0x10)
    SVAL(EVT_SLOT_B, 0x3000d)
    TILECHANGE(0xffff)
    SVAL(EVT_SLOT_B, 0x3000e)
    TILECHANGE(0xffff)
    LOAD2(0x1, UnitDef_088BD4AC)
    ENUN
    FADU(16)
    LOAD2(0x1, UnitDef_088BD4FC)
    ENUN
    SVAL(EVT_SLOT_B, 0x3000d)
    TILEREVERT(0xffff)
    SVAL(EVT_SLOT_B, 0x3000e)
    TILEREVERT(0xffff)
    CUMO_CHAR(CHARACTER_LARACHEL)
    STAL(60)
    CURE
    MUSC(0x31)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0xa, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSTART
    TEXTSHOW(0xb59)
    TEXTEND
    REMA
    GOTO(0xb)
LABEL(0xa)
    TEXTSTART
    TEXTSHOW(0xb5a)
    TEXTEND
    REMA
LABEL(0xb)
    LOAD2(0x1, UnitDef_088BD54C)
    ENUN
    FADI(16)
    ENUN
    ENDA
};

CONST_DATA EventListScr EventScr_089F731C[] = {
    SADD(EVT_SLOT_A, EVT_SLOT_2, EVT_SLOT_0)
    BACG(0x35)
    STARTFADE
    EvtColorFadeSetup(0x6, 0xa, 0, 512, 512, 512) // ENOSUPP in EAstdlib
    FAWU(128)
    CALL(EventScr_RemoveBGIfNeeded)
    EVBIT_MODIFY(0x4)
    CALL(EventScr_089F7378)
    MUSCMID(0x7fff)
    REMOVEPORTRAITS
    SADD(EVT_SLOT_2, EVT_SLOT_A, EVT_SLOT_0)
    BACG(0xffff)
    FAWU(4)
    EVBIT_MODIFY(0x0)
    ENDA
};

CONST_DATA EventListScr EventScr_089F7378[] = {
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_1)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0xb5b)
    TEXTEND
    REMA
    CALL(EventScr_089F73F0)
    CALL(EventScr_089F7470)
    GOTO(0x1)
LABEL(0x0)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0xb5c)
    TEXTEND
    REMA
    CALL(EventScr_089F7470)
    CALL(EventScr_089F73F0)
LABEL(0x1)
    FAWI(16)
    ENDA
};

CONST_DATA EventListScr EventScr_089F73F0[] = {
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0xb5d)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_7, 0x1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_7)
    FADI(16)
    CALL(EventScr_08591F64)
    PROM(CHARACTER_EIRIKA, 0x4, 0x98)
    EVBIT_MODIFY(0x4)
    REMOVEPORTRAITS
    BACG(0x35)
    STARTFADE
    EvtColorFadeSetup(0x6, 0xa, 0, 512, 512, 512) // ENOSUPP in EAstdlib
    FADU(16)
    GOTO(0x1)
LABEL(0x0)
    CALL(EventScr_089F74F0)
LABEL(0x1)
    ENDA
};

CONST_DATA EventListScr EventScr_089F7470[] = {
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0xb5e)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_7, 0x1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_7)
    FADI(16)
    CALL(EventScr_08591F64)
    PROM(CHARACTER_EPHRAIM, 0x3, 0x99)
    EVBIT_MODIFY(0x4)
    REMOVEPORTRAITS
    BACG(0x35)
    STARTFADE
    EvtColorFadeSetup(0x6, 0xa, 0, 512, 512, 512) // ENOSUPP in EAstdlib
    FADU(16)
    GOTO(0x1)
LABEL(0x0)
    CALL(EventScr_089F7524)
LABEL(0x1)
    ENDA
};

CONST_DATA EventListScr EventScr_089F74F0[] = {
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x98)
    GIVEITEMTO(CHARACTER_EIRIKA)
    EVBIT_MODIFY(0x4)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0xb5f)
    TEXTEND
    REMA
    ENDA
};

CONST_DATA EventListScr EventScr_089F7524[] = {
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x99)
    GIVEITEMTO(CHARACTER_EPHRAIM)
    EVBIT_MODIFY(0x4)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xffffffff)
    TEXTSHOW(0xb60)
    TEXTEND
    REMA
    ENDA
};

CONST_DATA EventListScr EventScr_089F7558[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BD380)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F7570[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0x8f)
    SVAL(EVT_SLOT_1, 0x10303)
    CHAI(0x90)
    ENUF(12)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F75A4[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BD240)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088BD2B8)
    CALL(EventScr_LoadReinforce)
    CAMERA(19, 27)
    SVAL(EVT_SLOT_2, UnitDef_088BD308)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088BD358)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F75F0[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BD3A8)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch17a_BeginingScene[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BDF5C)
    CALL(EventScr_089F7620)
    ENUT(14)
    ENDA
};

CONST_DATA EventListScr EventScr_089F7620[] = {
    MUSCSLOW(0x2c)
    SADD(EVT_SLOT_A, EVT_SLOT_2, EVT_SLOT_0)
    REMOVEPORTRAITS
    BACG(0x35)
    FAWI(2)
    BACG(0xf)
    FAWU(2)
    BROWNBOXTEXT(0x210, 8, 8)
    TEXTSHOW(0xb61)
    TEXTEND
    EvtBgmFadeIn(0x7fff, 8) // ENOSUPP in EAstdlib
    FAWI(2)
    REMA
    BACG(0x21)
    MUSC(0x52)
    FAWU(2)
    TEXTSHOW(0xb62)
    TEXTEND
    REMA
    FADI(16)
    CALL(EventScr_089F782C)
    CAMERA2(13, 11)
    SADD(EVT_SLOT_2, EVT_SLOT_A, EVT_SLOT_0)
    LOAD1(0x1, 0xffffffff)
    ENUN
    MOVE(0xffff, CHARACTER_LYON, 0, 0)
    FADU(16)
    LOAD1(0x1, UnitDef_088BE164)
    ENUN
    CUMO_CHAR(0xf7)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x19)
    SVAL(EVT_SLOT_3, 0xb64)
    CALL(Event_TextWithBG)
    CAMERA2(11, 15)
    LOAD2(0x1, UnitDef_088BE4C0)
    ENUN
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x19)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb65)
    TEXTEND
    EvtBgmFadeIn(0x7fff, 1) // ENOSUPP in EAstdlib
    TEXTCONT
    TEXTEND
    REMA
    FADI(16)
    CLEAN
    FADU(16)
    SVAL(EVT_SLOT_2, 0x40)
    MOVE_CLOSEST(0xffff, CHAR_EVT_SLOT2, 8, 14)
    CALL(EventScr_UnitWarpIN)
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_1)
    SVAL(EVT_SLOT_2, 0x19)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb66)
    TEXTEND
    MUSC(0x2d)
    TEXTCONT
    TEXTEND
    EvtBgmFadeIn(0x7fff, 1) // ENOSUPP in EAstdlib
    TEXTCONT
    TEXTEND
    MUSC(0x26)
    TEXTCONT
    TEXTEND
    CALL(EventScr_TextShowWithFadeIn)
    GOTO(0x1)
LABEL(0x0)
    SVAL(EVT_SLOT_2, 0x19)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb67)
    TEXTEND
    MUSC(0x2d)
    TEXTCONT
    TEXTEND
    EvtBgmFadeIn(0x7fff, 1) // ENOSUPP in EAstdlib
    TEXTCONT
    TEXTEND
    MUSC(0x26)
    TEXTCONT
    TEXTEND
    CALL(EventScr_TextShowWithFadeIn)
LABEL(0x1)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    CAMERA2(15, 6)
    SVAL(EVT_SLOT_2, 0x40)
    MOVE_CLOSEST(0xffff, CHAR_EVT_SLOT2, 20, 6)
    CALL(EventScr_UnitWarpIN)
    CALL(EventScr_08591FD8)
    ENDA
};

CONST_DATA EventListScr EventScr_089F782C[] = {
    CLEA
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_1)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x11)
    GOTO(0x1)
LABEL(0x0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x1e)
LABEL(0x1)
    MUSC(0x26)
    CAMERA2(7, 8)
    FADU(16)
    TEXTSTART
    TEXTSHOW(0xb63)
    TEXTEND
    REMA
    LOAD1(0x1, UnitDef_088BE31C)
    ENUN

    StartBattle
    NormalDamage(ATTACKER, 23)
    CriticalHit(DEFENDER, 15)
    NormalDamage(ATTACKER, 100)
    EndAttack
    FIGHT_MAP(CHARACHER_FRELIAN, 0x8d, 0, 0)

    DISA(CHARACHER_FRELIAN)
    KILL(0xc1)
    DISA_IF(0xc1)
    KILL(0xc1)
    DISA_IF(0xc1)
    KILL(0xc1)
    DISA_IF(0xc1)
    FADI(16)
    CLEA
    CLEE
    CLEN
    CAMERA2(13, 11)
    FADU(16)
    LOAD1(0x1, UnitDef_088BE3D0)
    ENUN

    StartBattle
    NormalDamage(DEFENDER, 5)
    CriticalHit(ATTACKER, 100)
    EndAttack
    FIGHT_MAP(CHARACHER_FRELIAN, 0x8d, 0, 0)

    DISA(CHARACHER_FRELIAN)
    KILL(0xc1)
    DISA_IF(0xc1)
    FADI(16)
    CLEA
    CLEE
    CLEN
    CAMERA2(15, 6)
    FADU(16)
    LOAD1(0x1, UnitDef_088BE434)
    ENUN

    StartBattle
    CriticalHit(ATTACKER, 100)
    EndAttack
    FIGHT_MAP(CHARACHER_FRELIAN, 0x8d, 0, 0)

    DISA(CHARACHER_FRELIAN)
    KILL(0xc1)
    DISA_IF(0xc1)
    KILL(0xc1)
    DISA_IF(0xc1)
    FADI(16)
    CLEA
    CLEE
    CLEN
    ENDA
};

CONST_DATA EventListScr EventScr_089F79C4[] = {
    CALL(EventScr_089F79D4)
    MNCH(0x12)
    ENDA
};

CONST_DATA EventListScr EventScr_089F79D4[] = {
    SVAL(EVT_SLOT_7, 0x0)
    CHECK_ALIVE(CHARACTER_SYRENE)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(0xf6)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(0xf7)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(0xf4)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(0xf5)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_7, 0x1)
LABEL(0x0)
    MUSCMID(0x7fff)
    FADI(16)
    SVAL(EVT_SLOT_2, 0x21)
    CALL(EventScr_LoadUniqueAlly)
    CLEA
    CLEE
    CLEN
    CAMERA2(11, 8)
    FADU(16)
    SPAWN_ENEMY(CHARACTER_LYON, 0, 0)
    SVAL(EVT_SLOT_2, 0x40)
    MOVE_CLOSEST(0xffff, CHAR_EVT_SLOT2, 12, 7)
    CALL(EventScr_UnitWarpIN)
    STAL(16)
    MOVE_1STEP(0x4, CHARACTER_LYON, FACING_DOWN)
    ENUN
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    MUSC(0x2d)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0xa, EVT_SLOT_C, EVT_SLOT_1)
    SVAL(EVT_SLOT_2, 0xb6e)
    GOTO(0xb)
LABEL(0xa)
    SVAL(EVT_SLOT_2, 0xb70)
LABEL(0xb)
    TEXTSTART
    TEXTSHOW(0xffff)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x424c)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x428c)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x100000)
    SENQUEUE1
    MOVE_DEFINED(CHARACTER_LYON)
    STAL2(30)
    LOAD2(0x1, UnitDef_088BE538)
    ENUN
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x19)
    CALL(EventScr_SetBackground)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x14, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSHOW(0xb6f)
    TEXTEND
    GOTO(0x15)
LABEL(0x14)
    TEXTSHOW(0xb71)
    TEXTEND
LABEL(0x15)
    REMA
    CALL(EventScr_TextShowWithFadeIn)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    DISA(CHARACTER_LYON)
    MOVE_1STEP(0x0, CHARACTER_EPHRAIM, FACING_DOWN)
    ENUN
    MUSCMID(0x7fff)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    MUSC(0x26)
    TEXTSTART
    TEXTSHOW(0xb72)
    TEXTEND
    REMA
    FADI(4)
    SVAL(EVT_SLOT_2, 0x1f)
    CALL(EventScr_SetBackground)
    MUSI
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x1e, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSHOW(0xb73)
    TEXTEND
    GOTO(0x1f)
LABEL(0x1e)
    TEXTSHOW(0xb74)
    TEXTEND
LABEL(0x1f)
    REMA
    MUNO
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x94)
    GIVEITEMTO(CHAR_EVT_PLAYER_LEADER)
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x8e)
    GIVEITEMTO(CHAR_EVT_PLAYER_LEADER)
    BEQ(0x34, EVT_SLOT_7, EVT_SLOT_0)
    MUSC(0x26)
    STAL(50)
    MUSI
    SVAL(EVT_SLOT_2, 0x1f)
    CALL(EventScr_SetBackground)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x32, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSHOW(0xb75)
    TEXTEND
    GOTO(0x33)
LABEL(0x32)
    TEXTSHOW(0xb76)
    TEXTEND
LABEL(0x33)
    REMA
    MUNO
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x55)
    GIVEITEMTO(CHAR_EVT_PLAYER_LEADER)
LABEL(0x34)
    ENDA
};

CONST_DATA EventListScr EventScr_089F7CAC[] = {
    MUSS(0x30)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0xb77)
    TEXTEND
    REMA
    MURE(0x2)
    CUSA(CHARACTER_SYRENE)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F7CD4[] = {
    MUSS(0x30)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0xb78)
    TEXTEND
    REMA
    MURE(0x2)
    CUSA(CHARACTER_SYRENE)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F7CFC[] = {
    MUSS(0x30)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0xb79)
    TEXTEND
    REMA
    MURE(0x2)
    CUSA(CHARACTER_SYRENE)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F7D24[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BE1DC)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F7D3C[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BE268)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F7D54[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BE2A4)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F7D6C[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BE2E0)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F7D84[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    COUNTER_SET(0x0, 5)
    ENUF(14)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F7DA4[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BE22C)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0x0)
    ENUF(14)
    COUNTER_CHECK(0x0)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(14)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F7DD8[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0xc0013)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xe0011)
    SENQUEUE1
    SVAL(EVT_SLOT_2, 0x11200)
    CALL(EventScr_ChangeAIinQueue)
    SVAL(EVT_SLOT_1, 0xd0012)
    SENQUEUE1
    SVAL(EVT_SLOT_2, 0x10e00)
    CALL(EventScr_ChangeAIinQueue)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch18a_BeginingScene[] = {
    LOAD1(0x1, UnitDef_088BF0EC)
    ENUN
    SVAL(EVT_SLOT_2, UnitDef_088BF4D4)
    SVAL(EVT_SLOT_3, 0x1)
    CALL(EventScr_LoadUnitForTutorial)
    CALL(EventScr_089F7E6C)
    ENDA
};

CONST_DATA EventListScr EventScr_089F7E6C[] = {
    MUSC(0x49)
    SVAL(EVT_SLOT_2, 0x32)
    CALL(EventScr_SetBackground)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSHOW(0xb7a)
    TEXTEND
    MUSCMID(0x7fff)
    TEXTCONT
    TEXTEND
    MUSC(0x2c)
    TEXTCONT
    TEXTEND
    GOTO(0x1)
LABEL(0x0)
    TEXTSHOW(0xb7b)
    TEXTEND
    MUSCMID(0x7fff)
    TEXTCONT
    TEXTEND
    MUSC(0x2c)
    TEXTCONT
    TEXTEND
LABEL(0x1)
    REMA
    MUSCMID(0x7fff)
    FADI(16)
    CLEAN
    FADU(16)
    LOAD2(0x1, UnitDef_088BF330)
    ENUN
    MUSC(0x49)
    CUMO_CHAR(CHARACHER_FRELIAN)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x32)
    SVAL(EVT_SLOT_3, 0xb7c)
    CALL(Event_TextWithBG)
    CAMERA2(12, 15)
    STAL(60)
    CAMERA(0, 27)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    MUSC(0x25)
    SVAL(EVT_SLOT_2, 0x32)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb7d)
    TEXTEND
    REMA
    FADI(16)
    CLEN
    CALL(EventScr_08591FD8)
    ENUT(8)
    ENUT(10)
    ENUT(12)
    ENUT(14)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F7F88[] = {
    MUSC(0x49)
    FADI(16)
    CAMERA2(14, 14)
    CLEA
    CLEE
    CLEN
    LOAD2(0x1, UnitDef_088BF3D0)
    ENUN
    FADU(16)
    SPAWN_ENEMY(CHARACTER_LYON, 0, 0)
    SVAL(EVT_SLOT_2, 0x40)
    MOVE_CLOSEST(0xffff, CHAR_EVT_SLOT2, 18, 11)
    CALL(EventScr_UnitWarpIN)
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb7e)
    TEXTEND
    REMA
    MOVE_1STEP(0x0, CHARACTER_EIRIKA, FACING_RIGHT)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    MOVE(0x0, CHARACTER_EIRIKA, 16, 13)
    STAL2(16)
    MOVE(0x0, CHARACTER_EPHRAIM, 14, 13)
    ENUN
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb7f)
    TEXTEND
    REMA
    MOVE(0x0, CHARACTER_EIRIKA, 18, 9)
    STAL2(20)
    FADI(16)
    ENUN
    CAMERA(22, 0)
    MOVE(0x0, CHARACTER_EIRIKA, 16, 4)
    FADU(16)
    ENUN
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    MUSCMID(0x2c)
    TEXTSTART
    TEXTSHOW(0xb80)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x40)
    MOVE_CLOSEST(0xffff, CHAR_EVT_SLOT2, 19, 4)
    CALL(EventScr_UnitWarpIN)
    MOVE_1STEP(0x0, CHARACTER_EIRIKA, FACING_RIGHT)
    ENUN
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb81)
    TEXTEND
    REMA
    MOVE_1STEP(0x10, CHARACTER_EIRIKA, FACING_RIGHT)
    ENUN
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb82)
    TEXTEND
    MUSCFAST(0x7fff)
    TEXTCONT
    TEXTEND
    MUSC(0x2d)
    TEXTCONT
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    SVAL(EVT_SLOT_2, 0x40)
    MOVE_CLOSEST(0xffff, CHAR_EVT_SLOT2, 19, 1)
    CALL(EventScr_UnitWarpIN)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_CallBreakStone)
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb83)
    TEXTEND
    REMA
    MUSCSLOW(0x7fff)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    LOAD2(0x1, UnitDef_088BF45C)
    ENUN
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    MUSC(0x32)
    TEXTSTART
    TEXTSHOW(0xb84)
    TEXTEND
    REMA
    FADI(4)
    SVAL(EVT_SLOT_2, 0x32)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb8a)
    TEXTEND
    REMA
    MNCH(0x13)
    ENDA
};

CONST_DATA EventListScr EventScr_089F81BC[] = {
    CHECK_EVENTID(6)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(3)
    CALL(EventScr_089F7F88)
    ENDB
};

CONST_DATA EventListScr EventScr_089F81D8[] = {
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F81E4[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(8)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8200[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BF560)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8218[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(10)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8234[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BF59C)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F824C[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(12)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8268[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BF5D8)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_088BF628)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8290[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(14)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F82AC[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BF650)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_088BF68C)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch19a_BeginingScene[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C0600)
    SVAL(EVT_SLOT_3, UnitDef_088C063C)
    SVAL(EVT_SLOT_4, UnitDef_088C03F8)
    CALL(EventScr_089F82FC)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F82FC[] = {
    SADD(EVT_SLOT_9, EVT_SLOT_3, EVT_SLOT_0)
    SADD(EVT_SLOT_A, EVT_SLOT_4, EVT_SLOT_0)
    MUSC(0x24)
    LOAD1(0x1, 0xffffffff)
    ENUN
    VCWF(0)
    FADU(16)
    LOAD2(0x1, UnitDef_088C08E4)
    ENUN
    CUMO_CHAR(CHARACTER_LARACHEL)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb8b)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x10311)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x10291)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    MOVE_DEFINED(CHARACTER_LARACHEL)
    ENUN
    MOVE_1STEP(0x10, CHARACTER_EIRIKA, FACING_UP)
    MOVE_1STEP(0x10, CHARACTER_EPHRAIM, FACING_UP)
    ENUN
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb8c)
    TEXTEND
    FADI(4)
    REMA
    FADU(4)
    CUMO_CHAR(CHARACTER_MANSEL)
    STAL(60)
    CURE
    TEXTSHOW(0xb8d)
    TEXTEND
    MUSCSLOW(0x7fff)
    FADI(4)
    REMA
    CLEA
    VCWF(65535)
    REMOVEPORTRAITS
    BACG(0xe)
    FADU(4)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSHOW(0xb8e)
    TEXTEND
    MUSC(0x29)
    TEXTCONT
    TEXTEND
    GOTO(0x2)
LABEL(0x0)
    CHECK_ALIVE(CHARACTER_TANA)
    BEQ(0x1, EVT_SLOT_C, EVT_SLOT_0)
    TEXTSHOW(0xb8f)
    TEXTEND
    MUSC(0x29)
    TEXTCONT
    TEXTEND
    GOTO(0x2)
LABEL(0x1)
    TEXTSHOW(0xb90)
    TEXTEND
    MUSC(0x29)
    TEXTCONT
    TEXTEND
LABEL(0x2)
    REMA
    MUSCMID(0x7fff)
    FADI(16)
    CLEAN
    CAMERA(0, 24)
    UNIT_COLORS(0x3)
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_088C095C)
    ENUN
    LOAD1(0x1, UnitDef_088C0984)
    ENUN
    FADU(16)
    LOAD2(0x1, UnitDef_088C095C)
    ENUN
    CUMO_CHAR(0xce)
    STAL(60)
    CURE
    MUSC(0x2e)
    TEXTSTART
    TEXTSHOW(0xb91)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x57)
    MOVE_CLOSEST(0xffff, CHAR_EVT_SLOT2, 8, 21)
    CALL(EventScr_UnitWarpIN)
    SVAL(EVT_SLOT_2, 0x8d)
    MOVE_CLOSEST(0xffff, CHAR_EVT_SLOT2, 6, 21)
    CALL(EventScr_UnitWarpIN)

    StartBattle
    CriticalHit(DEFENDER, 100)
    EndAttack
    FIGHT_MAP(0x8d, 0xce, 0, 0)

    DISA(0xce)
    TEXTSTART
    TEXTSHOW(0xb92)
    TEXTEND
    REMA
    MUSCMID(0x7fff)
    FADI(16)
    UNIT_COLORS(0x0)
    CLEE
    CAMERA2(16, 11)
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_088C09C0)
    ENUN
    FADU(16)
    LOAD2(0x1, UnitDef_088C0A24)
    ENUN
    CUMO_CHAR(CHARACHER_FRELIAN)
    STAL(60)
    CURE
    MUSC(0x26)
    TEXTSTART
    TEXTSHOW(0xb93)
    TEXTEND
    REMA
    MOVE(0x0, CHARACHER_FRELIAN, 16, 17)
    ENUN
    DISA(CHARACHER_FRELIAN)
    LOAD2(0x1, UnitDef_088C09C0)
    ENUN
    CUMO_CHAR(CHARACTER_SETH)
    STAL(60)
    CURE
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0xa, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSTART
    TEXTSHOW(0xb94)
    TEXTEND
    REMA
    GOTO(0xb)
LABEL(0xa)
    TEXTSTART
    TEXTSHOW(0xb95)
    TEXTEND
    REMA
LABEL(0xb)
    FADI(16)
    CLEA
    SADD(EVT_SLOT_2, EVT_SLOT_9, EVT_SLOT_0)
    LOAD1(0x1, 0xffffffff)
    ENUN
    SADD(EVT_SLOT_2, EVT_SLOT_A, EVT_SLOT_0)
    LOAD1(0x1, 0xffffffff)
    ENUN
    CALL(EventScr_08591FD8)
    CAMERA(0, 24)
    MUSC(0x18)
    FADU(16)
    TEXTSTART
    TEXTSHOW(0xb96)
    TEXTEND
    REMA
    ENDA
};

CONST_DATA EventListScr EventScr_089F8644[] = {
    CAMERA_CAHR(CHARACTER_EIRIKA)
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    MUSC(0x11)
    SVAL(EVT_SLOT_2, 0xb)
    SVAL(EVT_SLOT_3, 0xb97)
    CALL(Event_TextWithBG)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8678[] = {
    CALL(EventScr_089F8688)
    MNCH(0x14)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8688[] = {
    CHECK_OTHERS
    SADD(EVT_SLOT_7, EVT_SLOT_C, EVT_SLOT_0)
    MUSC(0x31)
    SVAL(EVT_SLOT_2, 0xa)
    CALL(EventScr_SetBackground)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSHOW(0xb9c)
    TEXTEND
    GOTO(0x3)
LABEL(0x0)
    CHECK_EVENTID(7)
    BNE(0x2, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_TANA)
    BEQ(0x1, EVT_SLOT_C, EVT_SLOT_0)
    TEXTSHOW(0xb9d)
    TEXTEND
    GOTO(0x3)
LABEL(0x1)
    TEXTSHOW(0xb9e)
    TEXTEND
    GOTO(0x3)
LABEL(0x2)
    TEXTSHOW(0xb9f)
    TEXTEND
LABEL(0x3)
    REMA
    MUSCMID(0x7fff)
    FADI(16)
    CLEA
    CLEE
    CLEN
    VCWF(0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x48)
    FADU(4)
    LOAD2(0x1, UnitDef_088C0B90)
    ENUN
    SOUN(0xb1)
    TILECHANGE(0x0)
    LOAD2(0x1, UnitDef_088C0BCC)
    ENUN
    LOAD2(0x1, UnitDef_088C0C44)
    ENUN
    CUMO_CHAR(CHARACTER_LARACHEL)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x2f)
    CALL(EventScr_SetBackground)
    MUSC(0x2b)
    TEXTSHOW(0xba0)
    TEXTEND
    REMA
    MUSCMID(0x7fff)
    FADI(16)
    CLEA
    CLEE
    CLEN
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0xa, EVT_SLOT_C, EVT_SLOT_1)
    SVAL(EVT_SLOT_B, 0x180000)
    LOMA(0x13)
    GOTO(0xb)
LABEL(0xa)
    SVAL(EVT_SLOT_B, 0x180000)
    LOMA(0x20)
LABEL(0xb)
    LOAD2(0x1, UnitDef_088C0A4C)
    ENUN
    FADU(16)
    LOAD2(0x1, UnitDef_088C0AEC)
    ENUN
    CUMO_CHAR(CHARACTER_MANSEL)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x12)
    CALL(EventScr_SetBackground)
    MUSC(0x31)
    TEXTSHOW(0xba1)
    TEXTEND
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x14, EVT_SLOT_C, EVT_SLOT_1)
    EvtTextShow2(0xba2) // ENOSUPP in EAstdlib
    TEXTEND
    GOTO(0x15)
LABEL(0x14)
    EvtTextShow2(0xba3) // ENOSUPP in EAstdlib
    TEXTEND
LABEL(0x15)
    EvtTextShow2(0xba4) // ENOSUPP in EAstdlib
    TEXTEND
    REMA
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x87)
    GIVEITEMTO(CHAR_EVT_PLAYER_LEADER)
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x8c)
    GIVEITEMTO(CHAR_EVT_PLAYER_LEADER)
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x2710)
    GIVEITEMTOMAIN(CHAR_EVT_PLAYER_LEADER)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x1e, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSHOW(0xba5)
    TEXTEND
    GOTO(0x1f)
LABEL(0x1e)
    TEXTSHOW(0xba6)
    TEXTEND
LABEL(0x1f)
    REMA
    SVAL(EVT_SLOT_8, 0x6)
    BLT(0x2a, EVT_SLOT_7, EVT_SLOT_8)
    SVAL(EVT_SLOT_2, 0x12)
    CALL(EventScr_SetBackground)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x28, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSHOW(0xba7)
    TEXTEND
    GOTO(0x29)
LABEL(0x28)
    TEXTSHOW(0xba8)
    TEXTEND
LABEL(0x29)
    REMA
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x10)
    GIVEITEMTO(CHAR_EVT_PLAYER_LEADER)
LABEL(0x2a)
    ENDA
};

CONST_DATA EventListScr EventScr_089F893C[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C06F0)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8954[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C0718)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F896C[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_088C0740)
    CALL(EventScr_LoadReinforce)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F89A0[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_088C077C)
    CALL(EventScr_LoadReinforce)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F89D4[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_088C07B8)
    CALL(EventScr_LoadReinforce)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8A08[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_088C07F4)
    CALL(EventScr_LoadReinforce)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8A3C[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C0830)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8A54[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C0894)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch20a_BeginingScene[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C0EF0)
    CALL(EventScr_089F8AC8)
    LOAD1(0x1, UnitDef_088C0EF0)
    ENUN
    LOAD1(0x1, UnitDef_088C129C)
    ENUN
    SVAL(EVT_SLOT_2, UnitDef_088C12C4)
    SVAL(EVT_SLOT_3, 0x1)
    CALL(EventScr_LoadUnitForTutorial)
    CALL(EventScr_08591FD8)
    ENUT(10)
    ENUT(12)
    ENUT(14)
    ENUT(16)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8AC8[] = {
    SADD(EVT_SLOT_A, EVT_SLOT_2, EVT_SLOT_0)
    LOAD1(0x1, UnitDef_088C1634)
    ENUN
    FADU(16)
    MUSC(0x2d)
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x31)
    CALL(EventScr_SetBackground)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSHOW(0xba9)
    TEXTEND
    GOTO(0x1)
LABEL(0x0)
    TEXTSHOW(0xbaa)
    TEXTEND
LABEL(0x1)
    REMA
    MUSCSLOW(0x7fff)
    FADI(4)
    CLEAN
    CAMERA(29, 20)
    MUSC(0x4d)
    FADU(4)
    LOAD2(0x1, UnitDef_088C165C)
    ENUN
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x31)
    CALL(EventScr_SetBackground)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x2, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSHOW(0xbab)
    TEXTEND
    MUSC(0x26)
    TEXTCONT
    TEXTEND
    GOTO(0x3)
LABEL(0x2)
    TEXTSHOW(0xbac)
    TEXTEND
    MUSC(0x26)
    TEXTCONT
    TEXTEND
LABEL(0x3)
    REMA
    FADI(16)
    CLEAN
    CAMERA2(11, 12)
    SADD(EVT_SLOT_2, EVT_SLOT_A, EVT_SLOT_0)
    LOAD1(0x1, 0xffffffff)
    ENUN
    LOAD1(0x1, UnitDef_088C129C)
    ENUN
    REMU(CHARACTER_MORVA)
    FADU(16)
    STAL(15)
    STARTFADE
    EvtColorFadeSetup(0x6, 0xa, 8, 128, 128, 128) // ENOSUPP in EAstdlib
    SUMMONUNIT(CHARACTER_MORVA)
    EvtColorFadeSetup(0x6, 0xa, 8, 256, 256, 256) // ENOSUPP in EAstdlib
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x31)
    SVAL(EVT_SLOT_3, 0xbad)
    CALL(Event_TextWithBG)
    MOVE(0x10, CHARACTER_LYON, 11, 11)
    ENUN
    DISA(CHARACTER_LYON)
    FADI(16)
    CLEA
    CLEE
    CLEN
    ENDA
};

CONST_DATA EventListScr EventScr_089F8C60[] = {
    CAMERA2_CAHR(CHARACTER_RIEV)
    MUSC(0x15)
    CUMO_CHAR(CHARACTER_RIEV)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbae)
    TEXTEND
    REMA
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8C8C[] = {
    CALL(EventScr_089F8CCC)
    MUSC(0x2d)
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x34)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xbb6)
    TEXTEND
    FADI(16)
    REMA
    MNC2(0x15)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8CCC[] = {
    MUSCFAST(0x7fff)
    SVAL(EVT_SLOT_2, 0x33)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xbb3)
    TEXTEND
    REMA
    FADI(16)
    CLEA
    CLEE
    CLEN
    CLEAN
    LOAD2(0x1, UnitDef_088C16E8)
    ENUN
    CAMERA2_CAHR(CHARACTER_MYRRH)
    EvtBgmFadeIn(0x29, 8) // ENOSUPP in EAstdlib
    FADU(4)
    CUMO_CHAR(CHARACTER_MYRRH)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x31)
    CALL(EventScr_SetBackground)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSHOW(0xbb4)
    TEXTEND
    GOTO(0x1)
LABEL(0x0)
    TEXTSHOW(0xbb5)
    TEXTEND
LABEL(0x1)
    REMA
    MUSCMID(0x7fff)
    FADI(16)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x12000c)
    LOMA(0x15)
    FADU(16)
    LOAD1(0x1, UnitDef_088C172C)
    ENUN
    ENDA
};

CONST_DATA EventListScr EventScr_089F8D9C[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_088C1314)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088C1350)
    CALL(EventScr_LoadReinforceHardMode)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8DE0[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_088C1378)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088C13B4)
    CALL(EventScr_LoadReinforceHardMode)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8E24[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    COUNTER_SET(0x0, 3)
    ENUF(10)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8E44[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C13DC)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0x0)
    ENUF(10)
    COUNTER_CHECK(0x0)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(10)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8E78[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(12)
    COUNTER_SET(0x1, 6)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8E98[] = {
    ENUF(12)
    COUNTER_CHECK(0x1)
    SVAL(EVT_SLOT_7, 0x5)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x3)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_2, UnitDef_088C1418)
    CALL(EventScr_LoadReinforce)
    COUNTER_CHECK(0x1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(12)
LABEL(0x0)
    COUNTER_DEC(0x1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8F00[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(14)
    COUNTER_SET(0x2, 6)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8F20[] = {
    ENUF(14)
    COUNTER_CHECK(0x2)
    SVAL(EVT_SLOT_7, 0x5)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x3)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_2, UnitDef_088C1468)
    CALL(EventScr_LoadReinforce)
    COUNTER_CHECK(0x2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(14)
LABEL(0x0)
    COUNTER_DEC(0x2)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8F88[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(16)
    COUNTER_SET(0x3, 13)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8FA8[] = {
    ENUF(16)
    COUNTER_CHECK(0x3)
    SVAL(EVT_SLOT_7, 0xb)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0xa)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x8)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x7)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x5)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x4)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x2)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    CAMERA2(11, 11)
    SVAL(EVT_SLOT_2, UnitDef_088C14B8)
    CALL(EventScr_LoadReinforce)
    COUNTER_CHECK(0x3)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(16)
LABEL(0x0)
    COUNTER_DEC(0x3)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F9064[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_088C1508)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088C1558)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_088C1594)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_088C15BC)
    CALL(EventScr_LoadReinforceHardMode)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F90C8[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C15E4)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch21a_BeginingScene[] = {
    CALL(EventScr_089F9144)
    CUMO_CHAR(CHARACTER_LYON_FINAL)
    STAL(60)
    CURE
    MUSC(0x2d)
    TEXTSTART
    TEXTSHOW(0xbbd)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x6c)
    CALL(EventScr_UnitWarpOUT)
    DISA(CHARACTER_LYON_FINAL)
    FADI(16)
    LOAD1(0x1, UnitDef_088C1920)
    ENUN
    CALL(EventScr_08591FD8)
    ENUT(11)
    ENUT(12)
    ENUT(13)
    ENDA
};

CONST_DATA EventListScr EventScr_089F9144[] = {
    REMOVEPORTRAITS
    BACG(0x35)
    FAWI(2)
    BACG(0x14)
    FAWU(2)
    MUSCSLOW(0x2c)
    BROWNBOXTEXT(0x20f, 8, 8)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSHOW(0xbba)
    TEXTEND
    GOTO(0x1)
LABEL(0x0)
    TEXTSHOW(0xbbb)
    TEXTEND
LABEL(0x1)
    REMA
    EvtBgmFadeIn(0x7fff, 8) // ENOSUPP in EAstdlib
    FAWI(2)
    CLEAN
    LOAD1(0x1, UnitDef_088C172C)
    ENUN
    FAWU(2)
    LOAD2(0x1, UnitDef_088C1DD0)
    ENUN
    MOVE(0x10, CHAR_EVT_PLAYER_LEADER, 11, 20)
    ENUN
    CUMO_CHAR(CHAR_EVT_PLAYER_LEADER)
    STAL(60)
    CURE
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0xa, EVT_SLOT_C, EVT_SLOT_1)
    MUSC(0x44)
    TEXTSTART
    TEXTSHOW(0xbbc)
    TEXTEND
    REMA
    GOTO(0xb)
LABEL(0xa)
    TEXTSTART
    TEXTSHOW(0xbbe)
    TEXTEND
    REMA
LABEL(0xb)
    STARTFADE
    MUSCSLOW(0x7fff)
    EvtColorFadeSetup(0x6, 0xa, 8, 128, 128, 128) // ENOSUPP in EAstdlib
    EvtColorFadeSetup(0x1d, 0x1, 4, 0, 0, 0) // ENOSUPP in EAstdlib
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitFlushingOUT)
    DISA(CHARACTER_LYON)
    STAL(30)
    SPAWN_ENEMY(CHARACTER_LYON_FINAL, 0, 0)
    EvtColorFadeSetup(0x1d, 0x1, 0, 256, 256, 256) // ENOSUPP in EAstdlib
    SVAL(EVT_SLOT_2, 0x6c)
    MOVE_CLOSEST(0xffff, CHAR_EVT_SLOT2, 11, 18)
    CALL(EventScr_UnitFlushingIN)
    EvtColorFadeSetup(0x6, 0xa, 8, 256, 256, 256) // ENOSUPP in EAstdlib
    ENDA
};

CONST_DATA EventListScr EventScr_089F92A0[] = {
    MUSCSLOW(0x7fff)
    FADI(4)
    CLEA
    CLEE
    CLEN
    CAMERA2(11, 4)
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_088C1E48)
    ENUN
    FADU(4)
    LOAD2(0x1, UnitDef_088C1E48)
    ENUN
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbc5)
    TEXTEND
    MUSCSLOW(0x44)
    TEXTCONT
    TEXTEND
    REMA
    MUSCMID(0x7fff)
    CALL(EventScr_089F9314)
    MNC3(0x16)
    ENDA
};

CONST_DATA EventListScr EventScr_089F9314[] = {
    STARTFADE
    EvtColorFadeSetup(0x6, 0xa, 4, 0, 0, 0) // ENOSUPP in EAstdlib
    STAL(30)
    MOVE_1STEP(0x2, CHARACTER_LYON, FACING_UP)
    ENUN
    STAL2(30)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    DISA(CHARACTER_LYON)
    TEXTSTART
    TEXTSHOW(0xbc7)
    TEXTEND
    REMA
    SOLOTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0x80ffff)
    TEXTSHOW(0xbc8)
    TEXTEND
    REMA
    ENDA
};

CONST_DATA EventListScr EventScr_089F9380[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(11)
    COUNTER_SET(0x0, 1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F93A0[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C1C04)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0x0)
    ENUF(11)
    COUNTER_CHECK(0x0)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(11)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F93D4[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(12)
    COUNTER_SET(0x1, 1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F93F4[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C1C7C)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0x1)
    ENUF(12)
    COUNTER_CHECK(0x1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(12)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F9428[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(13)
    COUNTER_SET(0x2, 10)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F9448[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C1CE0)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0x2)
    ENUF(13)
    COUNTER_CHECK(0x2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(13)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F947C[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xb1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch21xa_BeginingScene[] = {
    CALL(EventScr_089F94AC)
    ENDA
};

CONST_DATA EventListScr EventScr_089F94AC[] = {
    STARTFADE
    EvtColorFadeSetup(0x6, 0xa, 0, 0, 0, 0) // ENOSUPP in EAstdlib
    FADU(128)
    SOLOTEXTBOXSTART
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_1)
    SVAL(EVT_SLOT_B, 0x68ffff)
    TEXTSHOW(0xbc9)
    TEXTEND
    GOTO(0x1)
LABEL(0x0)
    SVAL(EVT_SLOT_B, 0x68ffff)
    TEXTSHOW(0xbca)
    TEXTEND
LABEL(0x1)
    REMA
    CHECK_EVBIT(2)
    BNE(0x2, EVT_SLOT_C, EVT_SLOT_0)
    EVBIT_MODIFY(0x1)
    ASMC(sub_807F878)
    LOAD1(0x1, UnitDef_088C2098)
    ENUN
    EvtColorFadeSetup(0x6, 0xa, 8, 256, 256, 256) // ENOSUPP in EAstdlib
    MUSC(0x2f)
    ASMC(sub_807FCC0)
    EVBIT_MODIFY(0x0)
    GOTO(0x3)
LABEL(0x2)
    MUSC(0x2f)
    LOAD1(0x1, UnitDef_088C2098)
    ENUN
LABEL(0x3)
    CAMERA2(11, 10)
    LOAD1(0x0, UnitDef_088C1F44)
    ENUN
    CUMO_CHAR(CHAR_EVT_PLAYER_LEADER)
    STAL(60)
    CURE
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0xa, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSTART
    TEXTSHOW(0xbcb)
    TEXTEND
    REMA
    GOTO(0xb)
LABEL(0xa)
    TEXTSTART
    TEXTSHOW(0xbcc)
    TEXTEND
    REMA
LABEL(0xb)
    CAMERA2(11, 15)
    LOAD2(0x1, UnitDef_088C1F80)
    SVAL(EVT_SLOT_1, 0x0)
    SET_STATE(CHARACTER_EIRIKA)
    SVAL(EVT_SLOT_1, 0x0)
    SET_STATE(CHARACTER_EPHRAIM)
    SVAL(EVT_SLOT_1, 0x0)
    SET_STATE(CHARACTER_LARACHEL)
    SVAL(EVT_SLOT_1, 0x0)
    SET_STATE(CHARACTER_SETH)
    LOAD3(0x0, UnitDef_088C1FBC)
    ENUN
    SVAL(EVT_SLOT_1, 0xffffffff)
    SET_STATE(CHARACTER_EIRIKA)
    SVAL(EVT_SLOT_1, 0xffffffff)
    SET_STATE(CHARACTER_EPHRAIM)
    SVAL(EVT_SLOT_1, 0xffffffff)
    SET_STATE(CHARACTER_LARACHEL)
    SVAL(EVT_SLOT_1, 0xffffffff)
    SET_STATE(CHARACTER_SETH)
    CUMO_CHAR(CHAR_EVT_PLAYER_LEADER)
    STAL(60)
    CURE
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0xc, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSTART
    TEXTSHOW(0xbcd)
    TEXTEND
    REMA
    GOTO(0xd)
LABEL(0xc)
    TEXTSTART
    TEXTSHOW(0xbce)
    TEXTEND
    REMA
LABEL(0xd)
    MUSC(0x45)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0xe, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_ALIVE(CHARACTER_EPHRAIM)
    BEQ(0x809d, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_EPHRAIM)
    BEQ(0x809d, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbd0)
    TEXTEND
    REMA
LABEL(0x809d)
    GOTO(0xf)
LABEL(0xe)
    CHECK_ALIVE(CHARACTER_EIRIKA)
    BEQ(0x80a1, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_EIRIKA)
    BEQ(0x80a1, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbcf)
    TEXTEND
    REMA
LABEL(0x80a1)
LABEL(0xf)
    CHECK_ALIVE(CHARACTER_SETH)
    BEQ(0x80a4, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_SETH)
    BEQ(0x80a4, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_SETH)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbd1)
    TEXTEND
    REMA
LABEL(0x80a4)
    CHECK_ALIVE(CHARACTER_KYLE)
    BEQ(0x80a5, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_KYLE)
    BEQ(0x80a5, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_KYLE)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbde)
    TEXTEND
    REMA
LABEL(0x80a5)
    CHECK_ALIVE(CHARACTER_FORDE)
    BEQ(0x80a6, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_FORDE)
    BEQ(0x80a6, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_FORDE)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbdf)
    TEXTEND
    REMA
LABEL(0x80a6)
    CHECK_ALIVE(CHARACTER_FRANZ)
    BEQ(0x80a7, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_FRANZ)
    BEQ(0x80a7, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_FRANZ)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbd2)
    TEXTEND
    REMA
LABEL(0x80a7)
    CHECK_ALIVE(CHARACTER_INNES)
    BEQ(0x80a9, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_INNES)
    BEQ(0x80a9, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_INNES)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbe1)
    TEXTEND
    REMA
LABEL(0x80a9)
    CHECK_ALIVE(CHARACTER_TANA)
    BEQ(0x80aa, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_TANA)
    BEQ(0x80aa, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_TANA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbe0)
    TEXTEND
    REMA
LABEL(0x80aa)
    CHECK_ALIVE(CHARACTER_VANESSA)
    BEQ(0x80ab, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_VANESSA)
    BEQ(0x80ab, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_VANESSA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbd5)
    TEXTEND
    REMA
LABEL(0x80ab)
    CHECK_ALIVE(CHARACTER_SYRENE)
    BEQ(0x80ac, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_SYRENE)
    BEQ(0x80ac, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_SYRENE)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbef)
    TEXTEND
    REMA
LABEL(0x80ac)
    CHECK_ALIVE(CHARACTER_GILLIAM)
    BEQ(0x80ad, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_GILLIAM)
    BEQ(0x80ad, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_GILLIAM)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbd3)
    TEXTEND
    REMA
LABEL(0x80ad)
    CHECK_ALIVE(CHARACTER_MOULDER)
    BEQ(0x80ae, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_MOULDER)
    BEQ(0x80ae, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_MOULDER)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbd4)
    TEXTEND
    REMA
LABEL(0x80ae)
    CHECK_ALIVE(CHARACTER_DUESSEL)
    BEQ(0x80b0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_DUESSEL)
    BEQ(0x80b0, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_DUESSEL)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbec)
    TEXTEND
    REMA
LABEL(0x80b0)
    CHECK_ALIVE(CHARACTER_KNOLL)
    BEQ(0x80b1, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_KNOLL)
    BEQ(0x80b1, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_KNOLL)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbee)
    TEXTEND
    REMA
LABEL(0x80b1)
    CHECK_ALIVE(CHARACTER_NATASHA)
    BEQ(0x80b2, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_NATASHA)
    BEQ(0x80b2, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_NATASHA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbdc)
    TEXTEND
    REMA
LABEL(0x80b2)
    CHECK_ALIVE(CHARACTER_CORMAG)
    BEQ(0x80b3, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_CORMAG)
    BEQ(0x80b3, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_CORMAG)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbe9)
    TEXTEND
    REMA
LABEL(0x80b3)
    CHECK_ALIVE(CHARACTER_AMELIA)
    BEQ(0x80b4, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_AMELIA)
    BEQ(0x80b4, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_AMELIA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbea)
    TEXTEND
    REMA
LABEL(0x80b4)
    CHECK_ALIVE(CHARACTER_GERIK)
    BEQ(0x80b6, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_GERIK)
    BEQ(0x80b6, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_GERIK)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbe2)
    TEXTEND
    REMA
LABEL(0x80b6)
    CHECK_ALIVE(CHARACTER_TETHYS)
    BEQ(0x80b7, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_TETHYS)
    BEQ(0x80b7, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_TETHYS)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbe3)
    TEXTEND
    REMA
LABEL(0x80b7)
    CHECK_ALIVE(CHARACTER_MARISA)
    BEQ(0x80b8, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_MARISA)
    BEQ(0x80b8, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_MARISA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbe4)
    TEXTEND
    REMA
LABEL(0x80b8)
    CHECK_ALIVE(CHARACTER_JOSHUA)
    BEQ(0x80b9, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_JOSHUA)
    BEQ(0x80b9, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_JOSHUA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbdd)
    TEXTEND
    REMA
LABEL(0x80b9)
    CHECK_ALIVE(CHARACTER_SALEH)
    BEQ(0x80bb, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_SALEH)
    BEQ(0x80bb, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_SALEH)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbe5)
    TEXTEND
    REMA
LABEL(0x80bb)
    CHECK_ALIVE(CHARACTER_EWAN)
    BEQ(0x80bc, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_EWAN)
    BEQ(0x80bc, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_EWAN)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbe6)
    TEXTEND
    REMA
LABEL(0x80bc)
    CHECK_ALIVE(CHARACTER_MYRRH)
    BEQ(0x80bd, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_MYRRH)
    BEQ(0x80bd, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_MYRRH)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbed)
    TEXTEND
    REMA
LABEL(0x80bd)
    CHECK_ALIVE(CHARACTER_GARCIA)
    BEQ(0x80bf, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_GARCIA)
    BEQ(0x80bf, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_GARCIA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbd6)
    TEXTEND
    REMA
LABEL(0x80bf)
    CHECK_ALIVE(CHARACTER_ROSS)
    BEQ(0x80c0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_ROSS)
    BEQ(0x80c0, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_ROSS)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbd7)
    TEXTEND
    REMA
LABEL(0x80c0)
    CHECK_ALIVE(CHARACTER_COLM)
    BEQ(0x80c1, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_COLM)
    BEQ(0x80c1, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_COLM)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbd8)
    TEXTEND
    REMA
LABEL(0x80c1)
    CHECK_ALIVE(CHARACTER_NEIMI)
    BEQ(0x80c2, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_NEIMI)
    BEQ(0x80c2, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_NEIMI)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbd9)
    TEXTEND
    REMA
LABEL(0x80c2)
    CHECK_ALIVE(CHARACTER_ARTUR)
    BEQ(0x80c3, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_ARTUR)
    BEQ(0x80c3, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_ARTUR)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbda)
    TEXTEND
    REMA
LABEL(0x80c3)
    CHECK_ALIVE(CHARACTER_LUTE)
    BEQ(0x80c4, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_LUTE)
    BEQ(0x80c4, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_LUTE)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbdb)
    TEXTEND
    REMA
LABEL(0x80c4)
    CHECK_ALIVE(CHARACTER_LARACHEL)
    BEQ(0x80c6, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_LARACHEL)
    BEQ(0x80c6, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_LARACHEL)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbe7)
    TEXTEND
    REMA
LABEL(0x80c6)
    CHECK_ALIVE(CHARACTER_DOZLA)
    BEQ(0x80c7, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_DOZLA)
    BEQ(0x80c7, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_DOZLA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbe8)
    TEXTEND
    REMA
LABEL(0x80c7)
    CHECK_ALIVE(CHARACTER_RENNAC)
    BEQ(0x80c8, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_RENNAC)
    BEQ(0x80c8, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_RENNAC)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbeb)
    TEXTEND
    REMA
LABEL(0x80c8)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x10, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_ALIVE(CHARACTER_EIRIKA)
    BEQ(0x80cc, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_EIRIKA)
    BEQ(0x80cc, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbcf)
    TEXTEND
    REMA
LABEL(0x80cc)
    GOTO(0x11)
LABEL(0x10)
    CHECK_ALIVE(CHARACTER_EPHRAIM)
    BEQ(0x80d0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_DEPLOYED(CHARACTER_EPHRAIM)
    BEQ(0x80d0, EVT_SLOT_C, EVT_SLOT_0)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbd0)
    TEXTEND
    REMA
LABEL(0x80d0)
LABEL(0x11)
    CAMERA2(11, 6)
    SOLOTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0x68001c)
    TEXTSHOW(0xbf0)
    TEXTEND
    CAMERA2(11, 10)
    ASMC2(sub_8080474)
    CUMO_CHAR(CHAR_EVT_PLAYER_LEADER)
    STAL(60)
    CURE
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x12, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSTART
    TEXTSHOW(0xbf1)
    TEXTEND
    REMA
    GOTO(0x13)
LABEL(0x12)
    TEXTSTART
    TEXTSHOW(0xbf2)
    TEXTEND
    REMA
LABEL(0x13)
    SVAL(EVT_SLOT_2, 0x19)
    CALL(EventScr_MoveUnitS2ToLeader)
    SVAL(EVT_SLOT_2, 0x2)
    CALL(EventScr_MoveUnitS2ToLeader)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch21xa_EndingScene[] = {
    CALL(EventScr_089F9F20)
    MNC4
    ENDA
};

CONST_DATA EventListScr EventScr_089F9F20[] = {
    MUSC(0x41)
    SVAL(EVT_SLOT_2, 0x34)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xbf5)
    TEXTEND
    REMA
    CHECK_ALIVE(CHARACTER_TANA)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_SYRENE)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_VANESSA)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_MOULDER)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_GILLIAM)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    TEXTSHOW(0xbf6)
    TEXTEND
    REMA
LABEL(0x0)
    CHECK_ALIVE(CHARACTER_JOSHUA)
    BEQ(0x1, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_GERIK)
    BEQ(0x1, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_MARISA)
    BEQ(0x1, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_TETHYS)
    BEQ(0x1, EVT_SLOT_C, EVT_SLOT_0)
    TEXTSHOW(0xbf7)
    TEXTEND
    REMA
LABEL(0x1)
    CHECK_ALIVE(CHARACTER_NATASHA)
    BEQ(0x2, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_AMELIA)
    BEQ(0x2, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_DUESSEL)
    BEQ(0x2, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_CORMAG)
    BEQ(0x2, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_KNOLL)
    BEQ(0x2, EVT_SLOT_C, EVT_SLOT_0)
    TEXTSHOW(0xbf8)
    TEXTEND
    REMA
LABEL(0x2)
    CHECK_ALIVE(CHARACTER_DOZLA)
    BEQ(0x3, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_RENNAC)
    BEQ(0x3, EVT_SLOT_C, EVT_SLOT_0)
    TEXTSHOW(0xbf9)
    TEXTEND
    REMA
LABEL(0x3)
    CHECK_ALIVE(CHARACTER_SALEH)
    BEQ(0x4, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_EWAN)
    BEQ(0x4, EVT_SLOT_C, EVT_SLOT_0)
    TEXTSHOW(0xbfa)
    TEXTEND
    REMA
LABEL(0x4)
    CHECK_ALIVE(CHARACTER_GARCIA)
    BEQ(0x5, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_ROSS)
    BEQ(0x5, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_COLM)
    BEQ(0x5, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_NEIMI)
    BEQ(0x5, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_ARTUR)
    BEQ(0x5, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_LUTE)
    BEQ(0x5, EVT_SLOT_C, EVT_SLOT_0)
    TEXTSHOW(0xbfb)
    TEXTEND
    REMA
LABEL(0x5)
    CHECK_ALIVE(CHARACTER_FRANZ)
    BEQ(0x6, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_KYLE)
    BEQ(0x6, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_FORDE)
    BEQ(0x6, EVT_SLOT_C, EVT_SLOT_0)
    TEXTSHOW(0xbfc)
    TEXTEND
    REMA
LABEL(0x6)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x7, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSHOW(0xbfd)
    TEXTEND
    GOTO(0x8)
LABEL(0x7)
    TEXTSHOW(0xbfe)
    TEXTEND
LABEL(0x8)
    FADI(4)
    REMA
    REVEAL(CHARACTER_LARACHEL)
    REVEAL(CHARACTER_SETH)
    ENDA
};

CONST_DATA EventListScr EventScr_089FA138[] = {
    MUSC(0x2e)
    SVAL(EVT_SLOT_2, 0xa9e)
    SVAL(EVT_SLOT_3, 0xa9f)
    SVAL(EVT_SLOT_4, 0xaa0)
    CALL(EventScr_089F3C34)
    CAMERA2(19, 9)
    FADU(16)
    LOAD1(0x1, UnitDef_088C2980)
    ENUN
    CUMO_CHAR(CHARACTER_DUESSEL)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0xc)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xaa1)
    TEXTEND
    REMA
    FADI(16)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0xa0012)
    LOMA(0x17)
    LOAD1(0x1, UnitDef_088C23B8)
    ENUN
    LOAD1(0x1, UnitDef_088C2890)
    ENUN
    SVAL(EVT_SLOT_B, 0x3000c)
    TILECHANGE(0xffff)
    MUSCMID(0x7fff)
    FADU(16)
    LOAD2(0x1, UnitDef_088C282C)
    ENUN
    CUMO_CHAR(CHARACTER_GHEB)
    STAL(60)
    CURE
    MUSC(0x25)
    SVAL(EVT_SLOT_2, 0x27)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xaa2)
    TEXTEND
    REMA
    FADI(16)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_2, 0x25)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xaa3)
    TEXTEND
    REMA
    FADI(16)
    CLEAN
    CAMERA(0, 0)
    LOAD1(0x1, UnitDef_088C23B8)
    ENUN
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD1(0x1, UnitDef_088C2868)
    ENUN
    FADU(16)
    SVAL(EVT_SLOT_1, 0x1)
    SET_STATE(CHARACTER_EPHRAIM)
    LOAD3(0x0, UnitDef_088C22C8)
    ENUN
    DISA(CHARACTER_SOLDIER_83)
    LOAD1(0x1, UnitDef_088C2868)
    ENUN
    FADI(16)
    CLEA
    CLEE
    CLEN
    LOAD1(0x1, UnitDef_088C23B8)
    ENUN
    LOAD1(0x1, UnitDef_088C2890)
    ENUN
    CAMERA2(17, 10)
    FADU(16)
    CUMO_CHAR(CHARACTER_SOLDIER_83)
    STAL(60)
    CURE
    MUSC(0x2e)
    SVAL(EVT_SLOT_2, 0x27)
    SVAL(EVT_SLOT_3, 0xaa4)
    CALL(Event_TextWithBG)
    MOVE_1STEP(0x10, CHARACTER_GHEB, FACING_DOWN)
    ENUN
    CUMO_CHAR(CHARACTER_GHEB)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x27)
    SVAL(EVT_SLOT_3, 0xaa5)
    CALL(Event_TextWithBG)
    MOVE_1STEP(0x10, CHARACTER_GHEB, FACING_UP)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x256)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x216)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    MOVE_DEFINED(CHARACTER_AMELIA)
    ENUN
    CUMO_CHAR(CHARACTER_AMELIA)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x27)
    SVAL(EVT_SLOT_3, 0xaa6)
    CALL(Event_TextWithBG)
    MOVE_1STEP(0x8, CHARACTER_AMELIA, FACING_DOWN)
    ENUN
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x10215)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x10295)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x10296)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    MOVE_DEFINED(CHARACTER_SOLDIER_83)
    ENUN
    CUMO_CHAR(CHARACTER_AMELIA)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x27)
    SVAL(EVT_SLOT_3, 0xaa7)
    CALL(Event_TextWithBG)
    MOVE(0x10, CHARACTER_SOLDIER_83, 23, 15)
    MOVE(0x10, CHARACTER_AMELIA, 23, 15)
    LOAD1(0x1, UnitDef_088C2610)
    STAL2(30)
    FADI(16)
    ENUN
    CLEA
    CLEE
    CLEN
    LOAD1(0x1, UnitDef_088C23B8)
    ENUN
    LOAD1(0x1, UnitDef_088C2610)
    ENUN
    LOAD1(0x1, UnitDef_088C269C)
    ENUN
    CALL(EventScr_08591FD8)
    MUSC(0xc)
    CAMERA2(8, 4)
    FADU(16)
    LOAD1(0x1, UnitDef_088C26D8)
    ENUN
    SVAL(EVT_SLOT_B, 0x3000c)
    TILEREVERT(0xffff)
    CUMO_CHAR(CHARACTER_TANA)
    STAL(60)
    CURE
    MUSI
    SVAL(EVT_SLOT_2, 0x17)
    SVAL(EVT_SLOT_3, 0xaa8)
    CALL(Event_TextWithBG)
    MUNO
    ENUT(18)
    ENUT(12)
    ENUT(16)
    ENUT(14)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FA4E0[] = {
    MUSC(0x31)
    SVAL(EVT_SLOT_2, 0x27)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xaac)
    TEXTEND
    REMA
    FADI(16)
    SVAL(EVT_SLOT_2, 0x12)
    CALL(EventScr_9EE5BC)
    CLEAN
    CAMERA2(17, 9)
    CLEA
    CLEE
    CLEN
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_088C28CC)
    ENUN
    FADU(16)
    LOAD2(0x1, UnitDef_088C28CC)
    ENUN
    MOVE_1STEP(0x10, CHARACTER_EPHRAIM, FACING_DOWN)
    ENUN
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x27)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xaad)
    TEXTEND
    MUSCFAST(0x7fff)
    TEXTCONT
    TEXTEND
    MUSC(0x32)
    TEXTCONT
    TEXTEND
    REMA
    FADI(4)
    SVAL(EVT_SLOT_2, 0x25)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xaae)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x18)
    CALL(EventScr_SetBackground)
    MUSI
    TEXTSHOW(0xaaf)
    TEXTEND
    REMA
    MUSCMID(0x7fff)
    SVAL(EVT_SLOT_2, 0x2000f)
    CALL(EventScr_9EEA58)
    LOAD1(0x1, UnitDef_088C2A00)
    ENUN
    MUSC(0x2e)
    FADU(16)
    TILECHANGE(0x0)
    LOAD1(0x1, UnitDef_088C2A3C)
    ENUN
    CUMO_CHAR(CHARACTER_VIGARDE)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xab0)
    TEXTEND
    REMA
    ENUT(113)
    MNCH(0x18)
    ENDA
};

CONST_DATA EventListScr EventScr_089FA634[] = {
    MUSS(0x30)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0xab2)
    TEXTEND
    REMA
    MURE(0x2)
    CUSA(CHARACTER_AMELIA)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FA65C[] = {
    MUSS(0x30)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0xab1)
    TEXTEND
    SOUN(0x2d9)
    TEXTCONT
    TEXTEND
    REMA
    MURE(0x2)
    CUSA(CHARACTER_AMELIA)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FA690[] = {
    MUSS(0x30)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0xab3)
    TEXTEND
    REMA
    MURE(0x2)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FA6B4[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0x81)
    COUNTER_SET(0x0, 1)
    ENUF(18)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FA6E0[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C2714)
    CALL(EventScr_LoadReinforceHardMode)
    COUNTER_DEC(0x0)
    ENUF(18)
    COUNTER_CHECK(0x0)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(18)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FA714[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    COUNTER_SET(0x1, 2)
    ENUF(12)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FA734[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C2764)
    CALL(EventScr_LoadReinforceHardMode)
    COUNTER_DEC(0x1)
    ENUF(12)
    COUNTER_CHECK(0x1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(12)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FA768[] = {
    COUNTER_SET(0x2, 2)
    ENUF(16)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FA778[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C278C)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0x2)
    ENUF(16)
    COUNTER_CHECK(0x2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(16)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FA7AC[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    COUNTER_SET(0x3, 1)
    CHECK_TUTORIAL
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_HARD
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    COUNTER_SET(0x3, 3)
LABEL(0x0)
    ENUF(14)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FA7EC[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C27C8)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0x3)
    ENUF(14)
    COUNTER_CHECK(0x3)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(14)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FA820[] = {
    MUSC(0x25)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x4c)
    FADU(16)
    LOAD2(0x1, UnitDef_088C3D68)
    SVAL(EVT_SLOT_1, 0x0)
    SET_STATE(CHARACTER_EPHRAIM)
    SVAL(EVT_SLOT_1, 0x0)
    SET_STATE(CHARACTER_SETH)
    LOAD3(0x0, UnitDef_088C3CB4)
    ENUN
    SVAL(EVT_SLOT_1, 0xffffffff)
    SET_STATE(CHARACTER_EPHRAIM)
    SVAL(EVT_SLOT_1, 0xffffffff)
    SET_STATE(CHARACTER_SETH)
    CUMO_CHAR(CHARACTER_MESSENGER)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x1c)
    SVAL(EVT_SLOT_3, 0xab4)
    CALL(Event_TextWithBG)
    MUSI
    EARTHQUAKE_START(0, 1)
    STAL(120)
    EARTHQUAKE_END
    MOVE_1STEP(0x0, CHARACTER_SETH, FACING_DOWN)
    ENUN
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x1c)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xab5)
    TEXTEND
    REMA
    MUSCMID(0x7fff)
    FADI(16)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0xe000c)
    LOMA(0x18)
    UNIT_COLORS(0x222)
    LOAD1(0x1, UnitDef_088C2E20)
    ENUN
    LOAD1(0x1, UnitDef_088C3168)
    ENUN
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_088C31CC)
    ENUN
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_088C31F4)
    ENUN
    FADU(16)
    CUMO_CHAR(CHARACTER_DUESSEL)
    STAL(60)
    CURE
    MUSC(0x2e)
    SVAL(EVT_SLOT_2, 0x7)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xab6)
    TEXTEND
    MUSCFAST(0x7fff)
    TEXTCONT
    TEXTEND
    MUSC(0x26)
    TEXTCONT
    TEXTEND
    CALL(EventScr_TextShowWithFadeIn)
    CLEN
    UNIT_COLORS(0x22)
    LOAD1(0x1, UnitDef_088C2FB0)
    ENUN
    CUMO_CHAR(CHARACTER_SELENA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xab7)
    TEXTEND
    REMA
    LOAD2(0x1, UnitDef_088C31CC)
    LOAD2(0x1, UnitDef_088C31F4)
    ENUN
    LOAD1(0x1, UnitDef_088C2D6C)
    ENUN
    FADI(16)
    UNIT_COLORS(0x0)
    CLEA
    CLEE
    CLEN
    LOAD1(0x1, UnitDef_088C2E20)
    ENUN
    LOAD1(0x1, UnitDef_088C2D44)
    ENUN
    LOAD1(0x1, UnitDef_088C2D6C)
    ENUN
    LOAD1(0x1, UnitDef_088C3050)
    ENUN
    LOAD1(0x1, UnitDef_088C2FB0)
    ENUN
    SVAL(EVT_SLOT_2, UnitDef_088C2F4C)
    SVAL(EVT_SLOT_3, 0x1)
    CALL(EventScr_LoadUnitForTutorial)
    CAMERA(22, 0)
    FADU(16)
    LOAD2(0x1, UnitDef_088C3244)
    STAL2(32)
    SVAL(EVT_SLOT_1, 0x0)
    SET_STATE(CHARACTER_EPHRAIM)
    SVAL(EVT_SLOT_1, 0x0)
    SET_STATE(CHARACTER_SETH)
    LOAD3(0x0, UnitDef_088C3280)
    ENUN
    SVAL(EVT_SLOT_1, 0xffffffff)
    SET_STATE(CHARACTER_EPHRAIM)
    SVAL(EVT_SLOT_1, 0xffffffff)
    SET_STATE(CHARACTER_SETH)
    CUMO_CHAR(CHARACTER_SETH)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x1c)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xab8)
    TEXTEND
    REMA
    CALL(EventScr_08591FD8)
    ENDA
};

CONST_DATA EventListScr EventScr_089FAAC4[] = {
    MUSC(0x14)
    CAMERA2(15, 11)
    STAL(15)
    LOAD1(0x1, UnitDef_088C3334)
    ENUN
    DISA(CHARACTER_VALTER)
    CUMO_AT(19, 11)
    STAL(60)
    CURE
    MUSI
    SVAL(EVT_SLOT_2, 0x12)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xab9)
    TEXTEND
    REMA
    FADI(16)
    CLEAN
    DISA(CHARACTER_SELENA)
    FADU(16)
    LOAD1(0x1, UnitDef_088C335C)
    ENUN
    DISA(CHARACTER_SELENA)
    LOAD1(0x1, UnitDef_088C3384)
    ENUN
    LOAD1(0x1, UnitDef_088C2DF8)
    ENUN
    CUMO_CHAR(CHARACTER_VALTER)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xaba)
    TEXTEND
    REMA
    MUNO
    MOVE(0x10, CHARACTER_VALTER, 23, 14)
    ENUN
    DISA(CHARACTER_VALTER)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FAB7C[] = {
    CHECK_EXISTS(CHARACTER_CORMAG)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALLEGIANCE(CHARACTER_CORMAG)
    SVAL(EVT_SLOT_1, 0x0)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    MUSC(0x14)
    CAMERA_CAHR(CHARACTER_CORMAG)
    STAL(15)
    CUMO_CHAR(CHARACTER_CORMAG)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xabb)
    TEXTEND
    REMA
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FABD0[] = {
    CHECK_EXISTS(CHARACTER_CORMAG)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALLEGIANCE(CHARACTER_CORMAG)
    SVAL(EVT_SLOT_1, 0x0)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    MUSC(0x14)
    CAMERA_CAHR(CHARACTER_CORMAG)
    STAL(15)
    CUMO_CHAR(CHARACTER_CORMAG)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xabc)
    TEXTEND
    REMA
LABEL(0x0)
    ENDA
};

CONST_DATA EventListScr EventScr_089FAC20[] = {
    SVAL(EVT_SLOT_7, 0x0)
    CHECK_ALIVE(0x89)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(0x8a)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(0x8b)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_7, 0x1)
LABEL(0x0)
    CHECK_EVENTID(2)
    BNE(0x1, EVT_SLOT_C, EVT_SLOT_0)
    MUSC(0x2e)
    CAMERA_CAHR(CHARACTER_BERAN)
    CUMO_CHAR(CHARACTER_BERAN)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x12)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xac0)
    TEXTEND
    REMA
    MUSCMID(0x7fff)
    FADI(16)
    CLEAN
    SVAL(EVT_SLOT_2, 0xe)
    CALL(EventScr_9EE5BC)
    CLEE
    FADU(16)
    CAMERA_CAHR(CHARACTER_EPHRAIM)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    MUSC(0x31)
    SVAL(EVT_SLOT_2, 0x1c)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xac1)
    TEXTEND
    REMA
    FADI(16)
    GOTO(0x2)
LABEL(0x1)
    MUSC(0x31)
    FADI(16)
LABEL(0x2)
    MUSC(0x31)
    SVAL(EVT_SLOT_2, 0x1d)
    CALL(EventScr_LoadUniqueAlly)
    CLEA
    CLEE
    CLEN
    CLEAN
    CAMERA2(15, 12)
    FADU(16)
    CUMO_AT(18, 13)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x12)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xac2)
    TEXTEND
    MUSCMID(0x7fff)
    TEXTCONT
    TEXTEND
    MUSC(0x28)
    TEXTCONT
    TEXTEND
    BEQ(0x3, EVT_SLOT_7, EVT_SLOT_0)
    EvtTextShow2(0xac3) // ENOSUPP in EAstdlib
    TEXTEND
    REMA
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x65)
    GIVEITEMTO(CHARACTER_DUESSEL)
LABEL(0x3)
    REMA
    MUSCMID(0x7fff)
    FADI(16)
    CLEAN
    CAMERA(0, 19)
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_088C33AC)
    ENUN
    FADU(16)
    CUMO_CHAR(CHARACTER_SETH)
    STAL(60)
    CURE
    MUSC(0x24)
    SVAL(EVT_SLOT_2, 0x7)
    SVAL(EVT_SLOT_3, 0xac4)
    CALL(Event_TextWithBG)
    CLEN
    LOAD2(0x1, UnitDef_088C33AC)
    ENUN
    CUMO_CHAR(CHARACTER_LARACHEL)
    STAL(60)
    CURE
    MUSS(0x2a)
    STAL(33)
    SVAL(EVT_SLOT_2, 0x7)
    SVAL(EVT_SLOT_3, 0xac5)
    CALL(Event_TextWithBG)
    MURE(0x4)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x10387)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x10347)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1034f)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    MOVE_DEFINED(CHARACTER_LARACHEL)
    STAL2(50)
    SVAL(EVT_SLOT_D, 0x0)
    MOVE(0x10, CHARACTER_DOZLA, 15, 13)
    MOVE(0x10, CHARACTER_RENNAC, 15, 13)
    ENUN
    LOAD2(0x1, UnitDef_088C3424)
    ENUN
    CUMO_CHAR(CHARACTER_SETH)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x7)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xac6)
    TEXTEND
    REMA
    ENUT(114)
    MNCH(0x19)
    ENDA
};

CONST_DATA EventListScr EventScr_089FAEDC[] = {
    MUSS(0x30)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0xac7)
    TEXTEND
    REMA
    MURE(0x2)
    CUSA(CHARACTER_DUESSEL)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FAF04[] = {
    MUSS(0x30)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0xac8)
    TEXTEND
    REMA
    MURE(0x2)
    CUSA(CHARACTER_CORMAG)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FAF2C[] = {
    MUSS(0x30)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0xac9)
    TEXTEND
    REMA
    MURE(0x2)
    CUSA(CHARACTER_CORMAG)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FAF54[] = {
    MUSI
    SVAL(EVT_SLOT_2, 0x2)
    SVAL(EVT_SLOT_3, 0xaca)
    CALL(Event_TextWithBG)
    MUNO
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x56)
    GIVEITEMTO(CHAR_EVT_ACTIVE_UNIT)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FAF90[] = {
    MUSI
    SVAL(EVT_SLOT_2, 0x2)
    SVAL(EVT_SLOT_3, 0xacb)
    CALL(Event_TextWithBG)
    MUNO
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x64)
    GIVEITEMTO(CHAR_EVT_ACTIVE_UNIT)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FAFCC[] = {
    MUSI
    SVAL(EVT_SLOT_2, 0x0)
    SVAL(EVT_SLOT_3, 0xacc)
    CALL(Event_TextWithBG)
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FAFF4[] = {
    MUSI
    SVAL(EVT_SLOT_2, 0x0)
    SVAL(EVT_SLOT_3, 0xacd)
    CALL(Event_TextWithBG)
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB01C[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C3014)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB034[] = {
    CALL(EventScr_089FABD0)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(CHARACTER_CORMAG)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(CHARACTER_SOLDIER_83)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB05C[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C30A0)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088C312C)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch11b_BeginingScene[] = {
    MUSC(0x2e)
    VCWF(0)
    SVAL(EVT_SLOT_2, 0x2000f)
    CALL(EventScr_9EEA58)
    LOAD1(0x1, UnitDef_088C451C)
    ENUN
    FADU(16)
    SPAWN_ENEMY(CHARACTER_SELENA, 14, 9)
    ENUN
    TILECHANGE(0x0)
    MOVE(0x10, CHARACTER_SELENA, 14, 5)
    ENUN
    CUMO_CHAR(CHARACTER_SELENA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xace)
    TEXTEND
    REMA
    MUSCMID(0x7fff)
    FADI(16)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x3e)
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_088C42B0)
    ENUN
    MUSC(0x4b)
    FADU(4)
    STAL(15)
    CUMO_CHAR(CHARACTER_MYRRH)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x8)
    SVAL(EVT_SLOT_3, 0xacf)
    CALL(Event_TextWithBG)
    LOAD2(0x1, UnitDef_088C42EC)
    ENUN
    CUMO_CHAR(CHARACTER_SETH)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x8)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xad0)
    TEXTEND
    REMA
    FADI(16)
    CLEAN
    VCWF(65535)
    TILECHANGE(0x0)
    LOAD1(0x1, UnitDef_088C3F40)
    ENUN
    SPAWN_ENEMY(CHARACTER_RIEV, 16, 13)
    FADU(16)
    CAMERA(20, 18)
    CUMO_CHAR(CHARACTER_RIEV)
    STAL(60)
    CURE
    MUSC(0x26)
    TEXTSTART
    TEXTSHOW(0xad1)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x57)
    CALL(EventScr_UnitWarpOUT)
    DISA(CHARACTER_RIEV)
    CALL(EventScr_08591FD8)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB1E4[] = {
    MUSC(0x11)
    CAMERA_CAHR(CHARACTER_EPHRAIM)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x8)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xad2)
    TEXTEND
    REMA
    FADI(16)
    TILEREVERT(0x0)
    TILECHANGE(0x1)
    CLEAN
    CAMERA2(9, 9)
    TEXTSTART
    LOAD1(0x1, UnitDef_088C4058)
    ENUN
    LOAD1(0x1, UnitDef_088C415C)
    ENUN
    FADU(16)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB250[] = {
    MUSC(0x11)
    CAMERA2(9, 9)
    EARTHQUAKE_START(0, 1)
    STAL(30)
    TILECHANGE(0x2)
    STAL(30)
    EARTHQUAKE_END
    CAMERA_CAHR(CHARACTER_EPHRAIM)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xad3)
    TEXTEND
    REMA
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB294[] = {
    MUSC(0x11)
    CAMERA_CAHR(CHARACTER_EPHRAIM)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x8)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xad4)
    TEXTEND
    REMA
    FADI(16)
    TILECHANGE(0x3)
    CLEAN
    CAMERA2(12, 10)
    TEXTSTART
    EARTHQUAKE_START(0, 1)
    FADU(16)
    STAL(32)
    EARTHQUAKE_END
    LOAD1(0x1, UnitDef_088C401C)
    ENUN
    CUMO_CHAR(CHARACTER_LARACHEL)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xad5)
    TEXTEND
    REMA
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB318[] = {
    MUSC(0x31)
    SVAL(EVT_SLOT_2, 0x8)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xad6)
    TEXTEND
    FADI(4)
    REMA
    FADU(16)
    TEXTSHOW(0xad7)
    TEXTEND
    CHECK_ALIVE(CHARACTER_DOZLA)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    EvtTextShow2(0xad8) // ENOSUPP in EAstdlib
    TEXTEND
LABEL(0x0)
    REMA
    FADI(16)
    SVAL(EVT_SLOT_2, 0x19)
    CALL(EventScr_LoadUniqueAlly)
    SVAL(EVT_SLOT_2, 0x1a)
    CALL(EventScr_LoadUniqueAlly)
    ENUT(115)
    MNC2(0x19)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB394[] = {
    MUSS(0x30)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0xad9)
    TEXTEND
    REMA
    MURE(0x2)
    CUSA(CHARACTER_LARACHEL)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB3BC[] = {
    MUSS(0x30)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0xada)
    TEXTEND
    REMA
    MURE(0x2)
    CUSA(CHARACTER_DOZLA)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB3E4[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C4224)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB3FC[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C4260)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088C4328)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_088C4364)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_088C43A0)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB444[] = {
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xb0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB458[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C43F0)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088C442C)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB480[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C4490)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088C44CC)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB4A8[] = {
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xb9)
    SVAL(EVT_SLOT_1, 0x11200)
    CHAI(CHARACTER_MONSTER_BA)
    SVAL(EVT_SLOT_1, 0x10b00)
    CHAI(0xb1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch12b_BeginingScene[] = {
    MUSC(0x24)
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_088C4D0C)
    ENUN
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_088C4D5C)
    ENUN
    FADU(16)
    CUMO_CHAR(CHARACTER_SETH)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x8)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xadb)
    TEXTEND
    FADI(4)
    REMA
    CLEAN
    CAMERA2(7, 7)
    FADU(16)
    LOAD1(0x1, UnitDef_088C4D84)
    ENUN
    CUMO_CHAR(CHARACTER_SALEH)
    STAL(60)
    CURE
    MUSI
    SVAL(EVT_SLOT_2, 0x7)
    SVAL(EVT_SLOT_3, 0xadc)
    CALL(Event_TextWithBG)
    MOVE(0x10, CHARACTER_SALEH, 8, 12)
    ENUN
    DISA(CHARACTER_SALEH)
    CUMO_CHAR(CHARACTER_EWAN)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xadd)
    TEXTEND
    REMA
    MOVE(0x10, CHARACTER_EWAN, 5, 5)
    ENUN
    DISA(CHARACTER_EWAN)
    FADI(16)
    MUNO
    CAMERA2(7, 17)
    FADU(16)
    MOVE_1STEP(0x8, CHARACTER_MYRRH, FACING_UP)
    ENUN
    CUMO_CHAR(CHARACTER_MYRRH)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x8)
    SVAL(EVT_SLOT_3, 0xade)
    CALL(Event_TextWithBG)
    MUSCMID(0x7fff)
    LOAD2(0x1, UnitDef_088C4D0C)
    ENUN
    DISA(CHARACTER_MYRRH)
    LOAD1(0x1, UnitDef_088C47BC)
    LOAD2(0x1, UnitDef_088C4D5C)
    ENUN
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    MUSC(0x25)
    SVAL(EVT_SLOT_2, 0x8)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xadf)
    TEXTEND
    REMA
    FADI(16)
    DISA(CHARACTER_LYON)
    CALL(EventScr_08591FD8)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB64C[] = {
    MUSC(0x14)
    CAMERA(20, 0)
    CUMO_CHAR(CHARACTER_CAELLACH)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xae0)
    TEXTEND
    REMA
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB678[] = {
    CAMERA_CAHR(CHARACTER_CAELLACH)
    SPAWN_ENEMY(CHARACTER_RIEV, 0, 0)
    SVAL(EVT_SLOT_2, 0x57)
    MOVE_CLOSEST(0xffff, CHAR_EVT_SLOT2, 17, 1)
    CALL(EventScr_UnitWarpIN)
    CUMO_CHAR(CHARACTER_CAELLACH)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xae1)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x57)
    CALL(EventScr_UnitWarpOUT)
    DISA(CHARACTER_RIEV)
    MOVE(0x18, CHARACTER_CAELLACH, 17, 0)
    ENUN
    DISA(CHARACTER_CAELLACH)
    MOVE(0x18, 0x81, 16, 0)
    MOVE(0x18, 0x82, 18, 0)
    ENUN
    DISA(0x81)
    DISA(0x82)
    SVAL(EVT_SLOT_2, UnitDef_088C4ADC)
    CALL(EventScr_LoadReinforce)
    STAL2(30)
    SVAL(EVT_SLOT_2, UnitDef_088C4B68)
    CALL(EventScr_LoadReinforce)
    STAL2(30)
    SVAL(EVT_SLOT_2, UnitDef_088C4BB8)
    CALL(EventScr_LoadReinforce)
    STAL2(30)
    SVAL(EVT_SLOT_2, UnitDef_088C4BF4)
    CALL(EventScr_LoadReinforce)
    STAL2(30)
    CAMERA_CAHR(CHARACTER_EPHRAIM)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xae2)
    TEXTEND
    REMA
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB770[] = {
    MUSC(0x31)
    FADI(16)
    SVAL(EVT_SLOT_A, 0x0)
    CHECK_EXISTS(CHARACTER_MARISA)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALLEGIANCE(CHARACTER_MARISA)
    SVAL(EVT_SLOT_1, 0x0)
    BEQ(0x1, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_ALIVE(CHARACTER_EWAN)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_A, 0x1)
    SVAL(EVT_SLOT_2, 0x16)
    CALL(EventScr_LoadUniqueAlly)
    GOTO(0x1)
LABEL(0x0)
    SVAL(EVT_SLOT_2, 0x16)
    CALL(EventScr_9EE5BC)
LABEL(0x1)
    CLEA
    CLEE
    CLEN
    CAMERA(20, 0)
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_088C4DC0)
    ENUN
    FADU(16)
    LOAD2(0x1, UnitDef_088C4DC0)
    ENUN
    CUMO_CHAR(CHARACTER_SETH)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xae3)
    TEXTEND
    MUSCMID(0x7fff)
    FADI(4)
    REMA
    CAMERA2(13, 13)
    MUSC(0x4b)
    FADU(16)
    LOAD2(0x1, UnitDef_088C4DFC)
    ENUN
    CUMO_CHAR(CHARACTER_MYRRH)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x7)
    SVAL(EVT_SLOT_3, 0xae4)
    CALL(Event_TextWithBG)
    IGNORE_KEYS(0x1)
    MOVE(0x10, CHARACTER_MYRRH, 20, 12)
    FADI(4)
    IGNORE_KEYS(0x0)
    ENUN
    DISA(CHARACTER_MYRRH)
    CAMERA(20, 0)
    FADU(4)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x7)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xae5)
    TEXTEND
    MUSC(0x32)
    TEXTCONT
    TEXTEND
    MUSCMID(0x7fff)
    FADI(4)
    REMA
    BEQ(0xa, EVT_SLOT_A, EVT_SLOT_0)
    MUSC(0x31)
    SVAL(EVT_SLOT_2, 0x7)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xae6)
    TEXTEND
    REMA
    FADI(16)
LABEL(0xa)
    ENUT(116)
    MNCH(0x1a)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB90C[] = {
    MUSS(0x30)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0xae7)
    TEXTEND
    REMA
    MURE(0x2)
    CUSA(CHARACTER_MARISA)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB934[] = {
    MUSS(0x30)
    STAL(33)
    SVAL(EVT_SLOT_2, 0x0)
    SVAL(EVT_SLOT_3, 0xae8)
    CALL(Event_TextWithBG)
    MURE(0x2)
    SVAL(EVT_SLOT_2, UnitDef_088C4AB4)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB970[] = {
    MUSI
    SVAL(EVT_SLOT_2, 0x9)
    SVAL(EVT_SLOT_3, 0xae9)
    CALL(Event_TextWithBG)
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB998[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C4C44)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB9B0[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C4C80)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB9C8[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C4CA8)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB9E0[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C4CD0)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch13b_BeginingScene[] = {
    MUSC(0x53)
    LOAD2(0x1, UnitDef_088C5378)
    ENUN
    DISA(CHARACTER_MYRRH)
    CUMO_AT(17, 13)
    STAL(60)
    CURE
    MUSI
    SVAL(EVT_SLOT_2, 0x2)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xaea)
    TEXTEND
    MUSC(0x2b)
    TEXTCONT
    TEXTEND
    FADI(4)
    REMA
    SVAL(EVT_SLOT_2, 0x2)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xaeb)
    TEXTEND
    MUSC(0x29)
    TEXTCONT
    TEXTEND
    MUSC(0x25)
    TEXTCONT
    TEXTEND
    REMA
    FADI(16)
    CLEAN
    CAMERA2(12, 12)
    LOAD1(0x1, UnitDef_088C4FCC)
    ENUN
    FADU(16)
    LOAD1(0x1, UnitDef_088C4FA4)
    ENUN
    CUMO_CHAR(CHARACTER_SELENA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xaec)
    TEXTEND
    REMA
    FADI(16)
    CAMERA(0, 0)
    FADU(16)
    LOAD2(0x1, UnitDef_088C53A0)
    SVAL(EVT_SLOT_1, 0x0)
    SET_STATE(CHARACTER_EPHRAIM)
    SVAL(EVT_SLOT_1, 0x0)
    SET_STATE(CHARACTER_SETH)
    SVAL(EVT_SLOT_1, 0x0)
    SET_STATE(CHARACTER_LARACHEL)
    LOAD3(0x0, UnitDef_088C53F0)
    ENUN
    SVAL(EVT_SLOT_1, 0xffffffff)
    SET_STATE(CHARACTER_EPHRAIM)
    SVAL(EVT_SLOT_1, 0xffffffff)
    SET_STATE(CHARACTER_SETH)
    SVAL(EVT_SLOT_1, 0xffffffff)
    SET_STATE(CHARACTER_LARACHEL)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x21)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xaed)
    TEXTEND
    REMA
    FADI(16)
    LOAD1(0x1, UnitDef_088C5508)
    ENUN
    CALL(EventScr_08591FD8)
    CAMERA(21, 0)
    MUSC(0x25)
    FADU(16)
    LOAD1(0x1, UnitDef_088C5288)
    ENUN
    CUMO_CHAR(CHARACTER_GERIK)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x1d)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xaee)
    TEXTEND
    REMA
    FADI(16)
    CLEAN
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_088C54A4)
    ENUN
    FADU(16)
    EVBIT_T(9)
    LOAD2(0x1, UnitDef_088C54A4)
    ENUN
    EVBIT_F(9)
    CUMO_CHAR(CHARACTER_MYRRH)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x21)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xaef)
    TEXTEND
    REMA
    FADI(16)
    DISA(CHARACTER_MYRRH)
    ENDA
};

CONST_DATA EventListScr EventScr_089FBC0C[] = {
    MUSCMID(0x7fff)
    FADI(16)
    CLEA
    CLEE
    CLEN
    CAMERA2(14, 13)
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_088C54CC)
    ENUN
    FADU(16)
    LOAD2(0x1, UnitDef_088C54CC)
    ENUN
    CUMO_CHAR(CHARACTER_MYRRH)
    STAL(60)
    CURE
    MUSC(0x32)
    SVAL(EVT_SLOT_2, 0x21)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xaf2)
    TEXTEND
    REMA
    FADI(16)
    CLEA
    CLEE
    CLEN
    ENUT(117)
    MNCH(0x1b)
    ENDA
};

CONST_DATA EventListScr EventScr_089FBC8C[] = {
    CHECK_EVENTID(2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_2, 0xf)
    CALL(EventScr_UnTriggerIfNotUnit)
    MUSI
    TEXTSTART
    TEXTSHOW(0xaf3)
    TEXTEND
    REMA
    MUNO
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FBCDC[] = {
    CHECK_EVENTID(2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_2, 0x1d)
    CALL(EventScr_UnTriggerIfNotUnit)
    MUSI
    TEXTSTART
    TEXTSHOW(0xaf4)
    TEXTEND
    REMA
    MUNO
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FBD2C[] = {
    MUSS(0x30)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0xaf5)
    TEXTEND
    REMA
    MURE(0x2)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FBD50[] = {
    MUSI
    TEXTSTART
    TEXTSHOW(0xaf6)
    TEXTEND
    REMA
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FBD70[] = {
    MUSI
    TEXTSTART
    TEXTSHOW(0xaf7)
    TEXTEND
    REMA
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FBD90[] = {
    MUSI
    SVAL(EVT_SLOT_2, 0x2)
    SVAL(EVT_SLOT_3, 0xaf8)
    CALL(Event_TextWithBG)
    MUNO
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x59)
    GIVEITEMTO(CHAR_EVT_ACTIVE_UNIT)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FBDCC[] = {
    MUSI
    SVAL(EVT_SLOT_2, 0x2)
    SVAL(EVT_SLOT_3, 0xaf9)
    CALL(Event_TextWithBG)
    MUNO
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x61)
    GIVEITEMTO(CHAR_EVT_ACTIVE_UNIT)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FBE08[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C52C4)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FBE20[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C52EC)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FBE38[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C5314)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FBE50[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C5350)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FBE68[] = {
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0x80)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch14b_BeginingScene[] = {
    MUSC(0x4d)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x3f)
    FADU(16)
    LOAD2(0x1, UnitDef_088C68B8)
    ENUN
    MOVE_1STEP(0x8, CHARACTER_EPHRAIM, FACING_UP)
    ENUN
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xafa)
    TEXTEND
    FAWI(2)
    REMA
    REMOVEPORTRAITS
    BACG(0xf)
    EvtBgmFadeIn(0x2c, 8) // ENOSUPP in EAstdlib
    FAWU(2)
    BROWNBOXTEXT(0x210, 8, 8)
    TEXTSHOW(0xafb)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7fff, 8) // ENOSUPP in EAstdlib
    FAWI(2)
    CLEAN
    MUSCSLOW(0x4d)
    FAWU(2)
    MOVE_1STEP(0x8, CHARACTER_MYRRH, FACING_UP)
    ENUN
    TEXTSTART
    TEXTSHOW(0xafc)
    TEXTEND
    CHECK_EVBIT(3)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    EARTHQUAKE_START(0, 1)
    STAL(120)
    EARTHQUAKE_END
    TEXTCONT
    TEXTEND
LABEL(0x0)
    REMA
    MOVE(0x8, CHARACTER_EPHRAIM, 10, 4)
    STAL2(16)
    MOVE(0x8, CHARACTER_SETH, 10, 4)
    MOVE(0x8, CHARACTER_MYRRH, 10, 4)
    MUSCMID(0x7fff)
    FADI(16)
    ENUN
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x2000f)
    LOMA(0x1b)
    LOAD1(0x1, UnitDef_088C60C0)
    ENUN
    FADU(4)
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xafd)
    TEXTEND
    REMA
    SOUN(0xb1)
    TILECHANGE(0x0)
    LOAD1(0x1, UnitDef_088C6660)
    ENUN
    CUMO_CHAR(CHARACTER_SOLDIER_83)
    STAL(60)
    CURE
    MUSC(0x2e)
    TEXTSTART
    TEXTSHOW(0xafe)
    TEXTEND
    REMA
    MOVE(0x0, CHARACTER_SOLDIER_83, 14, 9)
    ENUN
    TILEREVERT(0x0)
    DISA(CHARACTER_SOLDIER_83)
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xaff)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    DISA(CHARACTER_LYON)
    FADI(16)
    LOAD1(0x1, UnitDef_088C60FC)
    ENUN
    CALL(EventScr_08591FD8)
    ENUT(13)
    ENUT(16)
    ENDA
};

CONST_DATA EventListScr EventScr_089FC04C[] = {
    CUMO_CHAR(CHARACTER_RENNAC)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb00)
    TEXTEND
    REMA
    ENDA
};

CONST_DATA EventListScr EventScr_089FC06C[] = {
    MUSCMID(0x7fff)
    FADI(16)
    SVAL(EVT_SLOT_2, 0x1c)
    CALL(EventScr_9EE5BC)
    CLEA
    CLEE
    CLEN
    TILECHANGE(0x0)
    CAMERA2(14, 4)
    LOAD2(0x1, UnitDef_088C6688)
    ENUN
    FADU(16)
    STARTFADE
    EvtColorFadeSetup(0x6, 0xa, 4, 128, 128, 128) // ENOSUPP in EAstdlib
    EvtColorFadeSetup(0x1d, 0x1, 2, 0, 0, 0) // ENOSUPP in EAstdlib
    SOUN(0xd6)
    SVAL(EVT_SLOT_2, 0x6b)
    CALL(EventScr_UnitFlushingOUT)
    DISA(CHARACTER_VIGARDE)
    EvtColorFadeSetup(0x6, 0xa, 8, 256, 256, 256) // ENOSUPP in EAstdlib
    ENDFADE
    MOVE_1STEP(0x10, CHARACTER_EPHRAIM, FACING_UP)
    ENUN
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb05)
    TEXTEND
    REMA
    MOVE(0x10, CHARACTER_EPHRAIM, 14, 10)
    STAL2(32)
    MOVE(0x10, CHARACTER_SETH, 15, 10)
    STAL2(16)
    FADI(16)
    ENUN
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x46)
    LOAD1(0x1, UnitDef_088C6A24)
    ENUN
    FADU(16)
    LOAD2(0x1, UnitDef_088C69E8)
    ENUN
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x11)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb06)
    TEXTEND
    MUSC(0x2d)
    TEXTCONT
    TEXTEND
    REMA
    CALL(EventScr_TextShowWithFadeIn)
    MUSCFAST(0x7fff)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    DISA(CHARACTER_LYON)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb07)
    TEXTEND
    REMA
    LOAD2(0x1, UnitDef_088C6A4C)
    ENUN
    CUMO_CHAR(CHARACHER_FRELIAN)
    STAL(60)
    CURE
    MUSC(0x32)
    TEXTSTART
    TEXTSHOW(0xb08)
    TEXTEND
    REMA
    LOAD2(0x1, UnitDef_088C6A74)
    STAL2(15)
    FADI(16)
    ENUN
    CLEA
    CLEE
    CLEN
    CAMERA(26, 13)
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_088C6AC4)
    ENUN
    FADU(16)
    LOAD2(0x1, UnitDef_088C6AC4)
    ENUN
    SOUN(0xb1)
    TILECHANGE(0x0)
    LOAD2(0x1, UnitDef_088C6B28)
    ENUN
    STAL(15)
    CAMERA(26, 0)
    MOVE_1STEP(0x8, CHARACTER_KNOLL, FACING_DOWN)
    ENUN
    CUMO_CHAR(CHARACTER_KNOLL)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x17)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb09)
    TEXTEND
    EvtBgmFadeIn(0x7fff, 8) // ENOSUPP in EAstdlib
    FAWI(2)
    REMA
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x4b)
    UNIT_COLORS(0x4)
    LOAD2(0x1, UnitDef_088C6C04)
    ENUN
    FAWU(2)
    BROWNBOXTEXT(0x20e, 8, 8)
    LOAD2(0x1, UnitDef_088C6BDC)
    ENUN
    CUMO_CHAR(CHARACTER_KNOLL)
    STAL(60)
    CURE
    MUSCSLOW(0x2d)
    SVAL(EVT_SLOT_2, 0x2d)
    SVAL(EVT_SLOT_3, 0xb0a)
    CALL(Event_TextWithBG)
    LOAD2(0x1, UnitDef_088C6C40)
    ENUN
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x2d)
    SVAL(EVT_SLOT_3, 0xb0b)
    CALL(Event_TextWithBG)
    LOAD2(0x1, UnitDef_088C6C7C)
    ENUN
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_CallBreakStone)
    CUMO_CHAR(CHARACTER_KNOLL)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x2d)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb0c)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7fff, 8) // ENOSUPP in EAstdlib
    FAWI(2)
    CLEA
    CLEE
    CLEN
    UNIT_COLORS(0x0)
    SVAL(EVT_SLOT_B, 0x1a)
    LOMA(0x46)
    TILECHANGE(0x0)
    LOAD2(0x1, UnitDef_088C6AC4)
    ENUN
    LOAD2(0x1, UnitDef_088C6B28)
    ENUN
    MOVE_1STEP(0xffff, CHARACTER_KNOLL, FACING_DOWN)
    MUSCSLOW(0x32)
    FAWU(2)
    CUMO_CHAR(CHARACTER_KNOLL)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x17)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb0d)
    TEXTEND
    FADI(16)
    REMA
    CLEA
    CLEE
    CLEN
    LOAD1(0x1, UnitDef_088C6444)
    ENUN
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x4d)
    FADU(16)
    LOAD2(0x1, UnitDef_088C6CA4)
    ENUN
    CUMO_CHAR(CHARACTER_KNOLL)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x2c)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb0e)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x2c)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb0f)
    TEXTEND
    REMA
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x4a)
    GIVEITEMTO(CHARACTER_EPHRAIM)
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x93)
    GIVEITEMTO(CHARACTER_EPHRAIM)
    FADI(16)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x4000e)
    LOMA(0x1b)
    TILECHANGE(0x0)
    LOAD2(0x1, UnitDef_088C66D8)
    ENUN
    MUSC(0x26)
    FADU(16)
    LOAD2(0x1, UnitDef_088C6778)
    ENUN
    CUMO_CHAR(CHARACTER_MESSENGER)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb10)
    TEXTEND
    REMA
    FADI(16)
    ENUT(118)
    MNCH(0x1c)
    ENDA
};

CONST_DATA EventListScr EventScr_089FC520[] = {
    CALL(EventScr_089F619C)
    ENDA
};

CONST_DATA EventListScr EventScr_089FC52C[] = {
    SVAL(EVT_SLOT_2, 0xa)
    SVAL(EVT_SLOT_3, 0x1c)
    SVAL(EVT_SLOT_4, 0x26fc)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0xb11)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xb12)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xb14)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xb15)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xb16)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xb13)
    SENQUEUE1
    CALL(EventScr_9EEAAC)
    ENDA
};

CONST_DATA EventListScr EventScr_089FC5A0[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C646C)
    CALL(EventScr_LoadReinforce)
    CALL(EventScr_089FC04C)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FC5C0[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C6494)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088C67A0)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FC5E8[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C64D0)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088C67DC)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FC610[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C650C)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088C6818)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FC638[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C6548)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088C6854)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FC660[] = {
    COUNTER_SET(0x0, 2)
    CHECK_TUTORIAL
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_HARD
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    COUNTER_SET(0x0, 4)
LABEL(0x0)
    ENUF(13)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FC690[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C6584)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0x0)
    ENUF(13)
    COUNTER_CHECK(0x0)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(13)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FC6C4[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C65C0)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_088C6610)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FC6EC[] = {
    COUNTER_SET(0x1, 1)
    ENUF(16)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FC6FC[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C65C0)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_088C6610)
    CALL(EventScr_LoadReinforceHardMode)
    COUNTER_DEC(0x1)
    ENUF(16)
    COUNTER_CHECK(0x1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(16)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch15b_BeginingScene[] = {
    LOAD1(0x1, UnitDef_088C6F18)
    ENUN
    REMU(CHARACTER_CAELLACH)
    LOAD1(0x1, UnitDef_088C75D0)
    ENUN
    CAMERA(0, 21)
    CLEAN
    MUSC(0x25)
    FADU(16)
    LOAD2(0x1, UnitDef_088C74E0)
    SVAL(EVT_SLOT_1, 0x0)
    SET_STATE(CHARACTER_EPHRAIM)
    SVAL(EVT_SLOT_1, 0x0)
    SET_STATE(CHARACTER_SETH)
    LOAD3(0x0, UnitDef_088C751C)
    ENUN
    SVAL(EVT_SLOT_1, 0xffffffff)
    SET_STATE(CHARACTER_EPHRAIM)
    SVAL(EVT_SLOT_1, 0xffffffff)
    SET_STATE(CHARACTER_SETH)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x30)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb19)
    TEXTEND
    REMA
    MUSCMID(0x7fff)
    FADI(16)
    CLEAN
    CAMERA(0, 0)
    FADU(16)
    SPAWN_ENEMY(CHARACTER_LYON, 23, 0)
    SVAL(EVT_SLOT_2, 0x40)
    MOVE_CLOSEST(0xffff, CHAR_EVT_SLOT2, 5, 2)
    CALL(EventScr_UnitWarpIN)
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    MUSC(0x2e)
    SVAL(EVT_SLOT_2, 0x30)
    SVAL(EVT_SLOT_3, 0xb1a)
    CALL(Event_TextWithBG)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    DISA(CHARACTER_LYON)
    MOVE_1STEP(0x0, CHARACTER_BANDIT_CH5, FACING_UP)
    ENUN
    MOVEONTO(0x0, CHARACTER_BANDIT_CH5, CHARACTER_CAELLACH)
    ENUN
    LOAD1(0x1, UnitDef_088C7274)
    ENUN
    ENUN
    REVEAL(CHARACTER_CAELLACH)
    DISA(CHARACTER_BANDIT_CH5)
    FADI(16)
    CALL(EventScr_08591FD8)
    CAMERA2(12, 7)
    FADU(16)
    MUSC(0x26)
    LOAD1(0x1, UnitDef_088C72C4)
    ENUN
    REVEAL(CHARACTER_EIRIKA)
    SVAL(EVT_SLOT_1, 0x1)
    SET_STATE(CHARACTER_EIRIKA)
    SVAL(EVT_SLOT_1, 0x1)
    SET_STATE(CHARACTER_INNES)
    SVAL(EVT_SLOT_1, 0x1)
    SET_STATE(CHARACTER_SALEH)
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x30)
    SVAL(EVT_SLOT_3, 0xb1c)
    CALL(Event_TextWithBG)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FC8F0[] = {
    CALL(EventScr_089F6484)
    ENUT(119)
    MNCH(0x1d)
    ENDA
};

CONST_DATA EventListScr EventScr_089FC904[] = {
    MUSI
    SVAL(EVT_SLOT_2, 0x0)
    SVAL(EVT_SLOT_3, 0xb36)
    CALL(Event_TextWithBG)
    MUNO
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x88)
    GIVEITEMTO(CHAR_EVT_ACTIVE_UNIT)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FC940[] = {
    MUSI
    SVAL(EVT_SLOT_2, 0x0)
    SVAL(EVT_SLOT_3, 0xb37)
    CALL(Event_TextWithBG)
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FC968[] = {
    MUSI
    SVAL(EVT_SLOT_2, 0x0)
    SVAL(EVT_SLOT_3, 0xb38)
    CALL(Event_TextWithBG)
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FC990[] = {
    MUSS(0x27)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0xb2c)
    TEXTEND
    REMA
    MURE(0x2)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FC9B4[] = {
    MUSI
    TEXTSTART
    TEXTSHOW(0xb32)
    TEXTEND
    REMA
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FC9D4[] = {
    MUSI
    TEXTSTART
    TEXTSHOW(0xb33)
    TEXTEND
    REMA
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FC9F4[] = {
    MUSI
    TEXTSTART
    TEXTSHOW(0xb34)
    TEXTEND
    REMA
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCA14[] = {
    MUSI
    TEXTSTART
    TEXTSHOW(0xb35)
    TEXTEND
    REMA
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCA34[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C7314)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCA4C[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C7350)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCA64[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C738C)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCA7C[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C73DC)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCA94[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C74A4)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCAAC[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0x81)
    SVAL(EVT_SLOT_1, 0x11200)
    CHAI(0x82)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCADC[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    CHECK_LUCK(CHAR_EVT_ACTIVE_UNIT)
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_3, 0xf)
    CALL(EventScr_GiveTreasureToLuckyDog)
    BNE(0x8161, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x8161)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCB20[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    CHECK_LUCK(CHAR_EVT_ACTIVE_UNIT)
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_3, 0x62)
    CALL(EventScr_GiveTreasureToLuckyDog)
    BNE(0x8171, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x8171)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCB64[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    CHECK_LUCK(CHAR_EVT_ACTIVE_UNIT)
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_3, 0x89)
    CALL(EventScr_GiveTreasureToLuckyDog)
    BNE(0x8181, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x8181)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCBA8[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    CHECK_LUCK(CHAR_EVT_ACTIVE_UNIT)
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_3, 0x54)
    CALL(EventScr_GiveTreasureToLuckyDog)
    BNE(0x8191, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x8191)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCBEC[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    CHECK_LUCK(CHAR_EVT_ACTIVE_UNIT)
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_3, 0x48)
    CALL(EventScr_GiveTreasureToLuckyDog)
    BNE(0x81a1, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x81a1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCC30[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    CHECK_LUCK(CHAR_EVT_ACTIVE_UNIT)
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_3, 0x63)
    CALL(EventScr_GiveTreasureToLuckyDog)
    BNE(0x81b1, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x81b1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCC74[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    CHECK_LUCK(CHAR_EVT_ACTIVE_UNIT)
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_3, 0x73)
    CALL(EventScr_GiveTreasureToLuckyDog)
    BNE(0x81c1, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x81c1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCCB8[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    CHECK_LUCK(CHAR_EVT_ACTIVE_UNIT)
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_3, 0x31)
    CALL(EventScr_GiveTreasureToLuckyDog)
    BNE(0x81d1, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x81d1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCCFC[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    CHECK_LUCK(CHAR_EVT_ACTIVE_UNIT)
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_3, 0x51)
    CALL(EventScr_GiveTreasureToLuckyDog)
    BNE(0x81e1, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x81e1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch16b_BeginingScene[] = {
    CALL(EventScr_089F6A8C)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x1d)
    LOAD1(0x0, UnitDef_088BCE58)
    ENUN
    LOAD1(0x1, UnitDef_088C774C)
    ENUN
    SVAL(EVT_SLOT_2, UnitDef_088C7BFC)
    SVAL(EVT_SLOT_3, 0x1)
    CALL(EventScr_LoadUnitForTutorial)
    CALL(EventScr_08591FD8)
    ENUT(14)
    ENUT(13)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCD98[] = {
    CALL(EventScr_089F6E50)
    MNCH(0x1e)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCDA8[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C7BAC)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCDC0[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C7BD4)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCDD8[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0x90)
    COUNTER_SET(0x0, 1)
    ENUF(14)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCE04[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C7A94)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088C7A44)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0x0)
    ENUF(14)
    COUNTER_CHECK(0x0)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(14)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCE48[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0x8f)
    SVAL(EVT_SLOT_1, 0x10303)
    CHAI(0x91)
    COUNTER_SET(0x1, 1)
    ENUF(13)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCE80[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C7B0C)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088C7B48)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0x1)
    ENUF(13)
    COUNTER_CHECK(0x1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(13)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch17b_BeginingScene[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C7DA0)
    CALL(EventScr_089F7620)
    ENUT(14)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCEDC[] = {
    CALL(EventScr_089F79D4)
    MNCH(0x1f)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCEEC[] = {
    CALL(EventScr_089F7CAC)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCEF8[] = {
    CALL(EventScr_089F7CD4)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCF04[] = {
    CALL(EventScr_089F7CFC)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCF10[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C7FA8)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCF28[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C8034)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCF40[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C8070)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCF58[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C80AC)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCF70[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    COUNTER_SET(0x0, 5)
    ENUF(14)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCF90[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C7FF8)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0x0)
    ENUF(14)
    COUNTER_CHECK(0x0)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(14)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCFC4[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0xc0013)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xe0011)
    SENQUEUE1
    SVAL(EVT_SLOT_2, 0x11200)
    CALL(EventScr_ChangeAIinQueue)
    SVAL(EVT_SLOT_1, 0xd0012)
    SENQUEUE1
    SVAL(EVT_SLOT_2, 0x10e00)
    CALL(EventScr_ChangeAIinQueue)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch18b_BeginingScene[] = {
    LOAD1(0x1, UnitDef_088C8BDC)
    ENUN
    SVAL(EVT_SLOT_2, UnitDef_088C8F24)
    SVAL(EVT_SLOT_3, 0x1)
    CALL(EventScr_LoadUnitForTutorial)
    CALL(EventScr_089F7E6C)
    ENUT(8)
    ENUT(10)
    ENUT(12)
    ENUT(14)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD068[] = {
    MUSC(0x49)
    FADI(16)
    CLEA
    CLEE
    CLEN
    CAMERA2(14, 14)
    LOAD2(0x1, UnitDef_088C8E20)
    ENUN
    FADU(16)
    SPAWN_ENEMY(CHARACTER_LYON, 0, 0)
    SVAL(EVT_SLOT_2, 0x40)
    MOVE_CLOSEST(0xffff, CHAR_EVT_SLOT2, 18, 11)
    CALL(EventScr_UnitWarpIN)
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb7e)
    TEXTEND
    REMA
    MOVE_1STEP(0x0, CHARACTER_EPHRAIM, FACING_RIGHT)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    DISA(CHARACTER_LYON)
    MOVE_1STEP(0x0, CHARACTER_EIRIKA, FACING_RIGHT)
    MOVE(0x0, CHARACTER_EPHRAIM, 18, 9)
    STAL2(20)
    FADI(16)
    ENUN
    CAMERA(22, 0)
    SPAWN_ENEMY(CHARACTER_LYON, 19, 1)
    MOVE(0x0, CHARACTER_EPHRAIM, 19, 4)
    FADU(16)
    ENUN
    MUSC(0x2d)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb85)
    TEXTEND
    REMA
    MOVE_1STEP(0x0, CHARACTER_EPHRAIM, FACING_UP)
    ENUN
    GLOWINGCROSS(CHARACTER_EPHRAIM)
    STAL(30)
    GLOWINGCROSS_END
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb86)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    SVAL(EVT_SLOT_2, 0x40)
    MOVE_CLOSEST(0xffff, CHAR_EVT_SLOT2, 19, 2)
    CALL(EventScr_UnitWarpIN)
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb87)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_CallBreakStone)
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb88)
    TEXTEND
    MUSCFAST(0x7fff)
    TEXTCONT
    TEXTEND
    MUSC(0x2c)
    TEXTCONT
    TEXTEND
    REMA
    MUSCSLOW(0x7fff)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    LOAD2(0x1, UnitDef_088C8EAC)
    ENUN
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb89)
    TEXTEND
    MUSC(0x32)
    TEXTCONT
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x32)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb8a)
    TEXTEND
    REMA
    MNCH(0x20)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD268[] = {
    CHECK_EVENTID(6)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(3)
    CALL(EventScr_089FD068)
    ENDB
};

CONST_DATA EventListScr EventScr_089FD284[] = {
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD290[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(8)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD2AC[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C8FB0)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD2C4[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(10)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD2E0[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C8FEC)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD2F8[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(12)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD314[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C9028)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_088C9078)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD33C[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(14)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD358[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C90A0)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_088C90DC)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch19b_BeginingScene[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CA214)
    SVAL(EVT_SLOT_3, UnitDef_088CA480)
    SVAL(EVT_SLOT_4, UnitDef_088C9E18)
    CALL(EventScr_089F82FC)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD3A8[] = {
    CAMERA_CAHR(CHARACTER_EPHRAIM)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    MUSC(0x11)
    SVAL(EVT_SLOT_2, 0xb)
    SVAL(EVT_SLOT_3, 0xb98)
    CALL(Event_TextWithBG)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD3DC[] = {
    CALL(EventScr_089F8688)
    MNCH(0x21)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD3EC[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CA020)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD404[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CA048)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD41C[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_088CA070)
    CALL(EventScr_LoadReinforce)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD450[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_088CA0AC)
    CALL(EventScr_LoadReinforce)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD484[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_088CA0E8)
    CALL(EventScr_LoadReinforce)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD4B8[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_088CA124)
    CALL(EventScr_LoadReinforce)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD4EC[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CA160)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD504[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CA1C4)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch20b_BeginingScene[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CA7B8)
    CALL(EventScr_089F8AC8)
    LOAD1(0x1, UnitDef_088CA7B8)
    ENUN
    LOAD1(0x1, UnitDef_088CAB64)
    ENUN
    SVAL(EVT_SLOT_2, UnitDef_088CAF88)
    SVAL(EVT_SLOT_3, 0x1)
    CALL(EventScr_LoadUnitForTutorial)
    CALL(EventScr_08591FD8)
    ENUT(10)
    ENUT(12)
    ENUT(14)
    ENUT(16)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD578[] = {
    CALL(EventScr_089F8C60)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD584[] = {
    CALL(EventScr_089F8CCC)
    STAL(30)
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    FAWI(2)
    EvtBgmFadeIn(0x2c, 8) // ENOSUPP in EAstdlib
    REMOVEPORTRAITS
    BACG(0xf)
    FAWU(2)
    BROWNBOXTEXT(0x20e, 8, 8)
    TEXTSHOW(0xbb7)
    TEXTEND
    REMA
    FAWI(16)
    REMOVEPORTRAITS
    BACG(0xd)
    FAWU(16)
    TEXTSHOW(0xbb8)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7fff, 8) // ENOSUPP in EAstdlib
    FAWI(2)
    CLEAN
    FAWU(2)
    MUSC(0x2d)
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x34)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xbb9)
    TEXTEND
    FADI(16)
    REMA
    MNC2(0x22)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD630[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_088CAB8C)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088CABC8)
    CALL(EventScr_LoadReinforceHardMode)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD674[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_088CABF0)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088CAC2C)
    CALL(EventScr_LoadReinforceHardMode)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD6B8[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    COUNTER_SET(0x0, 3)
    ENUF(10)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD6D8[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CAC54)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0x0)
    ENUF(10)
    COUNTER_CHECK(0x0)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(10)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD70C[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(12)
    COUNTER_SET(0x1, 6)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD72C[] = {
    ENUF(12)
    COUNTER_CHECK(0x1)
    SVAL(EVT_SLOT_7, 0x5)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x3)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_2, UnitDef_088CAC90)
    CALL(EventScr_LoadReinforce)
    COUNTER_CHECK(0x1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(12)
LABEL(0x0)
    COUNTER_DEC(0x1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD794[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(14)
    COUNTER_SET(0x2, 6)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD7B4[] = {
    ENUF(14)
    COUNTER_CHECK(0x2)
    SVAL(EVT_SLOT_7, 0x5)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x3)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_2, UnitDef_088CACE0)
    CALL(EventScr_LoadReinforce)
    COUNTER_CHECK(0x2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(14)
LABEL(0x0)
    COUNTER_DEC(0x2)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD81C[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(16)
    COUNTER_SET(0x3, 13)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD83C[] = {
    ENUF(16)
    COUNTER_CHECK(0x3)
    SVAL(EVT_SLOT_7, 0xb)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0xa)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x8)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x7)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x5)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x4)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x2)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    CAMERA2(11, 11)
    SVAL(EVT_SLOT_2, UnitDef_088CAD30)
    CALL(EventScr_LoadReinforce)
    COUNTER_CHECK(0x3)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(16)
LABEL(0x0)
    COUNTER_DEC(0x3)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD8F8[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_088CAD80)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088CADD0)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_088CAE0C)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_088CAE34)
    CALL(EventScr_LoadReinforceHardMode)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD95C[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CAE5C)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch21b_BeginingScene[] = {
    CALL(EventScr_089F9144)
    SVAL(EVT_SLOT_2, 0x6c)
    CALL(EventScr_UnitWarpOUT)
    DISA(CHARACTER_LYON_FINAL)
    FADI(16)
    LOAD1(0x1, UnitDef_088CB164)
    ENUN
    CALL(EventScr_08591FD8)
    ENUT(11)
    ENUT(12)
    ENUT(13)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD9B8[] = {
    MUSCSLOW(0x7fff)
    FADI(4)
    CLEA
    CLEE
    CLEN
    CAMERA2(11, 4)
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_088CB614)
    ENUN
    FADU(4)
    LOAD2(0x1, UnitDef_088CB614)
    ENUN
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbc6)
    TEXTEND
    MUSCSLOW(0x44)
    TEXTCONT
    TEXTEND
    REMA
    MUSCMID(0x7fff)
    CALL(EventScr_089F9314)
    MNC3(0x23)
    ENDA
};

CONST_DATA EventListScr EventScr_089FDA2C[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(11)
    COUNTER_SET(0x0, 1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FDA4C[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CB448)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0x0)
    ENUF(11)
    COUNTER_CHECK(0x0)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(11)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FDA80[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(12)
    COUNTER_SET(0x1, 1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FDAA0[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CB4C0)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0x1)
    ENUF(12)
    COUNTER_CHECK(0x1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(12)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FDAD4[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(13)
    COUNTER_SET(0x2, 10)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FDAF4[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CB524)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0x2)
    ENUF(13)
    COUNTER_CHECK(0x2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(13)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FDB28[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xb1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch21x_BeginingScene[] = {
    CALL(EventScr_089F94AC)
    ENDA
};

CONST_DATA EventListScr EventScr_089FDB58[] = {
    CALL(EventScr_089F9F20)
    MNC4
    ENDA
};

CONST_DATA EventListScr EventScr_Tower1_BeginingScene[] = {
    ASMC(sub_8085C4C)
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    LOAD1(0x1, UnitDef_088CB77C)
    ENUN
    CALL(EventScr_08591FD8)
    ENDA
};

CONST_DATA EventListScr EventScr_089FDBE4[] = {
    SVAL(EVT_SLOT_2, 0x71)
    SVAL(EVT_SLOT_3, 0x24)
    CALL(EventScr_9EE8F0)
    SVAL(EVT_SLOT_2, 0x24)
    SVAL(EVT_SLOT_3, 0x25)
    CALL(EventScr_FloorClearInTower)
    ENDA
};

CONST_DATA EventListScr EventScr_Tower2_BeginingScene[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    LOAD1(0x1, UnitDef_088CB9CC)
    ENUN
    CALL(EventScr_08591FD8)
    ENUT(8)
    ENDA
};

CONST_DATA EventListScr EventScr_089FDC90[] = {
    SVAL(EVT_SLOT_2, 0x72)
    SVAL(EVT_SLOT_3, 0x24)
    CALL(EventScr_9EE8F0)
    SVAL(EVT_SLOT_2, 0x24)
    SVAL(EVT_SLOT_3, 0x26)
    CALL(EventScr_FloorClearInTower)
    ENDA
};

CONST_DATA EventListScr EventScr_089FDCC4[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xb9)
    SVAL(EVT_SLOT_1, 0x11200)
    CHAI(CHARACTER_MONSTER_BA)
    ENUF(8)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FDCF8[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CBBD4)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Tower3_BeginingScene[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    LOAD1(0x1, UnitDef_088CBCEC)
    ENUN
    CALL(EventScr_08591FD8)
    ENDA
};

CONST_DATA EventListScr EventScr_089FDD84[] = {
    SVAL(EVT_SLOT_2, 0x67)
    CALL(EventScr_SetFlagIfPlayedThrough)
    SVAL(EVT_SLOT_2, 0x73)
    SVAL(EVT_SLOT_3, 0x24)
    CALL(EventScr_9EE8F0)
    SVAL(EVT_SLOT_2, 0x24)
    SVAL(EVT_SLOT_3, 0x27)
    CALL(EventScr_FloorClearInTower)
    ENDA
};

CONST_DATA EventListScr EventScr_Tower4_BeginingScene[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    LOAD1(0x1, UnitDef_088CBFD8)
    ENUN
    CALL(EventScr_08591FD8)
    ENDA
};

CONST_DATA EventListScr EventScr_089FDE3C[] = {
    SVAL(EVT_SLOT_2, 0x74)
    SVAL(EVT_SLOT_3, 0x24)
    CALL(EventScr_9EE8F0)
    SVAL(EVT_SLOT_2, 0x24)
    SVAL(EVT_SLOT_3, 0x28)
    CALL(EventScr_FloorClearInTower)
    ENDA
};

CONST_DATA EventListScr EventScr_Tower5_BeginingScene[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    LOAD1(0x1, UnitDef_088CC244)
    ENUN
    CALL(EventScr_08591FD8)
    ENDA
};

CONST_DATA EventListScr EventScr_089FDEE4[] = {
    SVAL(EVT_SLOT_2, 0x75)
    SVAL(EVT_SLOT_3, 0x24)
    CALL(EventScr_9EE8F0)
    SVAL(EVT_SLOT_2, 0x24)
    SVAL(EVT_SLOT_3, 0x29)
    CALL(EventScr_FloorClearInTower)
    ENDA
};

CONST_DATA EventListScr EventScr_089FDF18[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CC58C)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Tower6_BeginingScene[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    LOAD1(0x1, UnitDef_088CC67C)
    ENUN
    CALL(EventScr_08591FD8)
    ENDA
};

CONST_DATA EventListScr EventScr_089FDFA4[] = {
    SVAL(EVT_SLOT_2, 0x69)
    CALL(EventScr_SetFlagIfPlayedThrough)
    SVAL(EVT_SLOT_2, 0x76)
    SVAL(EVT_SLOT_3, 0x24)
    CALL(EventScr_9EE8F0)
    SVAL(EVT_SLOT_2, 0x24)
    SVAL(EVT_SLOT_3, 0x2a)
    CALL(EventScr_FloorClearInTower)
    ENDA
};

CONST_DATA EventListScr EventScr_Tower7_BeginingScene[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    LOAD1(0x1, UnitDef_088CCA6C)
    ENUN
    CALL(EventScr_08591FD8)
    ENUT(12)
    ENUT(13)
    ENUT(14)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE068[] = {
    SVAL(EVT_SLOT_2, 0x77)
    SVAL(EVT_SLOT_3, 0x24)
    CALL(EventScr_9EE8F0)
    SVAL(EVT_SLOT_2, 0x24)
    SVAL(EVT_SLOT_3, 0x2b)
    CALL(EventScr_FloorClearInTower)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE09C[] = {
    CHECK_EXISTS(0xaa)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x0)
    CAMERA(9, 16)
    TILECHANGE(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE0C4[] = {
    CHECK_EXISTS(0xac)
    BEQ(0x1, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x1)
    CAMERA(17, 13)
    TILECHANGE(0x1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE0EC[] = {
    CHECK_EXISTS(0xb0)
    BEQ(0x2, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x2)
    CAMERA(23, 4)
    TILECHANGE(0x2)
    ENUF(12)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE118[] = {
    CHECK_EXISTS(0xb3)
    BEQ(0x3, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x3)
    CAMERA(12, 0)
    TILECHANGE(0x3)
    ENUF(13)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE144[] = {
    CHECK_EXISTS(0xb7)
    BEQ(0x4, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x4)
    CAMERA(5, 0)
    TILECHANGE(0x4)
    ENUF(14)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE170[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CCD00)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE188[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CCD3C)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE1A0[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CCD78)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Tower8_BeginingScene[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    LOAD1(0x1, UnitDef_088CCE68)
    ENUN
    CALL(EventScr_08591FD8)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE22C[] = {
    SVAL(EVT_SLOT_2, 0x6e)
    CALL(EventScr_SetFlagIfPlayedThrough)
    SVAL(EVT_SLOT_2, 0x24)
    CALL(EventScr_WholeTowerClear)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruins1_BeginingScene[] = {
    ASMC(sub_8085C58)
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    LOAD1(0x1, UnitDef_088CD174)
    ENUN
    CALL(EventScr_08591FD8)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE2CC[] = {
    SVAL(EVT_SLOT_2, 0x2e)
    SVAL(EVT_SLOT_3, 0x2f)
    CALL(EventScr_FloorClearInTower)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE2E8[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CD4BC)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE300[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CD4F8)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE318[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xb9)
    SVAL(EVT_SLOT_1, 0x11200)
    CHAI(CHARACTER_MONSTER_BA)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruins2_BeginingScene[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    LOAD1(0x1, UnitDef_088CD5E8)
    ENUN
    CALL(EventScr_08591FD8)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE3BC[] = {
    SVAL(EVT_SLOT_2, 0x2e)
    SVAL(EVT_SLOT_3, 0x30)
    CALL(EventScr_FloorClearInTower)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE3D8[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xb9)
    SVAL(EVT_SLOT_1, 0x11200)
    CHAI(CHARACTER_MONSTER_BA)
    SVAL(EVT_SLOT_1, 0x10e06)
    CHAI(0xbd)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruins3_BeginingScene[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    LOAD1(0x1, UnitDef_088CDAAC)
    ENUN
    CALL(EventScr_08591FD8)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE488[] = {
    SVAL(EVT_SLOT_2, 0x2e)
    SVAL(EVT_SLOT_3, 0x31)
    CALL(EventScr_FloorClearInTower)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE4A4[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CDE58)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE4BC[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CDE80)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE4D4[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CDEBC)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE4EC[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CDEE4)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE504[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CDF0C)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruins4_BeginingScene[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    LOAD1(0x1, UnitDef_088CE024)
    ENUN
    CALL(EventScr_08591FD8)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE590[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CE31C)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE5A8[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CE344)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE5C0[] = {
    SVAL(EVT_SLOT_2, 0x2e)
    SVAL(EVT_SLOT_3, 0x32)
    CALL(EventScr_FloorClearInTower)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruins5_BeginingScene[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    LOAD1(0x1, UnitDef_088CE434)
    ENUN
    CALL(EventScr_08591FD8)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE650[] = {
    SVAL(EVT_SLOT_2, 0x68)
    CALL(EventScr_SetFlagIfPlayedThrough)
    SVAL(EVT_SLOT_2, 0x2e)
    SVAL(EVT_SLOT_3, 0x33)
    CALL(EventScr_FloorClearInTower)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE67C[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CE6C8)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE694[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CE6F0)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE6AC[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CE718)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruins6_BeginingScene[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    LOAD1(0x1, UnitDef_088CE81C)
    ENUN
    CALL(EventScr_08591FD8)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE738[] = {
    SVAL(EVT_SLOT_2, 0x2e)
    SVAL(EVT_SLOT_3, 0x34)
    CALL(EventScr_FloorClearInTower)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE754[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CEB8C)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE76C[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CEBC8)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE784[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CEC04)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE79C[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CEC40)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruins7_BeginingScene[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    LOAD1(0x1, UnitDef_088CED74)
    ENUN
    CALL(EventScr_08591FD8)
    ENUT(8)
    ENUT(10)
    ENUT(12)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE834[] = {
    SVAL(EVT_SLOT_2, 0x6a)
    CALL(EventScr_SetFlagIfPlayedThrough)
    SVAL(EVT_SLOT_2, 0x2e)
    SVAL(EVT_SLOT_3, 0x35)
    CALL(EventScr_FloorClearInTower)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE860[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CEFB8)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE878[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CEFE0)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE890[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CF01C)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE8A8[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CF044)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE8C0[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    COUNTER_SET(0x0, 3)
    ENUF(8)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE8E0[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CF06C)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0x0)
    ENUF(8)
    COUNTER_CHECK(0x0)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(8)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE914[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    COUNTER_SET(0x1, 3)
    ENUF(10)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE934[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CF094)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0x1)
    ENUF(10)
    COUNTER_CHECK(0x1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(10)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE968[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    COUNTER_SET(0x2, 5)
    ENUF(12)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE988[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CF0BC)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0x2)
    ENUF(12)
    COUNTER_CHECK(0x2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(12)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FE9BC[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CF0E4)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruins8_BeginingScene[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    LOAD1(0x1, UnitDef_088CF1D4)
    ENUN
    CALL(EventScr_08591FD8)
    ENUT(8)
    ENUT(10)
    ENUT(12)
    ENUT(14)
    ENDA
};

CONST_DATA EventListScr EventScr_089FEA58[] = {
    SVAL(EVT_SLOT_2, 0x2e)
    SVAL(EVT_SLOT_3, 0x36)
    CALL(EventScr_FloorClearInTower)
    ENDA
};

CONST_DATA EventListScr EventScr_089FEA74[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    COUNTER_SET(0x3, 2)
    ENUF(8)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FEA94[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CF51C)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0x3)
    ENUF(8)
    COUNTER_CHECK(0x3)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(8)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FEAC8[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    COUNTER_SET(0x4, 2)
    ENUF(10)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FEAE8[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CF544)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0x4)
    ENUF(10)
    COUNTER_CHECK(0x4)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(10)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FEB1C[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    COUNTER_SET(0x5, 2)
    ENUF(12)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FEB3C[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CF56C)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0x5)
    ENUF(12)
    COUNTER_CHECK(0x5)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(12)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FEB70[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_1, 0x10300)
    CHAI(0xbd)
    COUNTER_SET(0x6, 4)
    ENUF(14)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FEB9C[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CF5A8)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0x6)
    ENUF(14)
    COUNTER_CHECK(0x6)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(14)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FEBD0[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0xa)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x14)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    GOTO(0x1)
LABEL(0x0)
    CAMERA(0, 20)
    STAL(15)
    SOUN(0xbe)
    TILECHANGE(0x0)
    CAMERA2(12, 12)
    STAL(15)
    SOUN(0xbe)
    TILECHANGE(0x7)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FEC40[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x6)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0xf)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    GOTO(0x1)
LABEL(0x0)
    CAMERA(0, 20)
    STAL(15)
    SOUN(0xbd)
    TILEREVERT(0x0)
    CAMERA2(12, 12)
    STAL(15)
    SOUN(0xbd)
    TILEREVERT(0x7)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FEC9C[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x2)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x8)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0xe)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x14)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    GOTO(0x1)
LABEL(0x0)
    CAMERA2(7, 10)
    STAL(15)
    SOUN(0xbe)
    TILECHANGE(0x1)
    CAMERA2(10, 10)
    STAL(15)
    SOUN(0xbe)
    TILECHANGE(0x5)
    CAMERA(19, 20)
    STAL(15)
    SOUN(0xbe)
    TILECHANGE(0x8)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FED30[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x5)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0xb)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x11)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    GOTO(0x1)
LABEL(0x0)
    CAMERA2(7, 10)
    STAL(15)
    SOUN(0xbd)
    TILEREVERT(0x1)
    CAMERA2(10, 10)
    STAL(15)
    SOUN(0xbd)
    TILEREVERT(0x5)
    CAMERA(19, 20)
    STAL(15)
    SOUN(0xbd)
    TILEREVERT(0x8)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FEDB0[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x5)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0xd)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x14)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    GOTO(0x1)
LABEL(0x0)
    CAMERA(0, 0)
    STAL(15)
    SOUN(0xbe)
    TILECHANGE(0x2)
    CAMERA(19, 20)
    STAL(15)
    SOUN(0xbe)
    TILECHANGE(0x9)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FEE20[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x9)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x11)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    GOTO(0x1)
LABEL(0x0)
    CAMERA(0, 0)
    STAL(15)
    SOUN(0xbd)
    TILEREVERT(0x2)
    CAMERA(19, 20)
    STAL(15)
    SOUN(0xbd)
    TILEREVERT(0x9)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FEE7C[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x3)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x7)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0xb)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0xf)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x13)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    GOTO(0x1)
LABEL(0x0)
    CAMERA(0, 20)
    STAL(15)
    SOUN(0xbe)
    TILECHANGE(0x3)
    CAMERA2(10, 5)
    STAL(15)
    SOUN(0xbe)
    TILECHANGE(0x6)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FEF14[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x5)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x9)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0xd)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x11)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    GOTO(0x1)
LABEL(0x0)
    CAMERA(0, 20)
    STAL(15)
    SOUN(0xbd)
    TILEREVERT(0x3)
    CAMERA2(10, 5)
    STAL(15)
    SOUN(0xbd)
    TILEREVERT(0x6)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FEF98[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x5)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x9)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0xd)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x11)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x14)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    GOTO(0x1)
LABEL(0x0)
    CAMERA2(10, 15)
    STAL(15)
    SOUN(0xbe)
    TILECHANGE(0x4)
    CAMERA2(12, 6)
    STAL(15)
    SOUN(0xbe)
    TILECHANGE(0xa)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FF044[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x3)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x7)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0xb)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0xf)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x13)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    GOTO(0x1)
LABEL(0x0)
    CAMERA2(10, 15)
    STAL(15)
    SOUN(0xbd)
    TILEREVERT(0x4)
    CAMERA2(12, 6)
    STAL(15)
    SOUN(0xbd)
    TILEREVERT(0xa)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FF0DC[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x6)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0xc)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x12)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x14)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    GOTO(0x1)
LABEL(0x0)
    CAMERA(0, 20)
    STAL(15)
    SOUN(0xbe)
    TILECHANGE(0xb)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FF150[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x7)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0xd)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x13)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_1)
    GOTO(0x1)
LABEL(0x0)
    CAMERA(0, 20)
    STAL(15)
    SOUN(0xbd)
    TILEREVERT(0xb)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruins9_BeginingScene[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    LOAD1(0x1, UnitDef_088CF684)
    ENUN
    CALL(EventScr_08591FD8)
    ENUT(8)
    ENDA
};

CONST_DATA EventListScr EventScr_089FF228[] = {
    SVAL(EVT_SLOT_2, 0x2e)
    SVAL(EVT_SLOT_3, 0x37)
    CALL(EventScr_FloorClearInTower)
    ENDA
};

CONST_DATA EventListScr EventScr_089FF244[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xbd)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FF268[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    COUNTER_SET(0x7, 3)
    ENUF(8)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FF288[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CFA08)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0x7)
    ENUF(8)
    COUNTER_CHECK(0x7)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(8)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruins10_BeginingScene[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    LOAD1(0x1, UnitDef_088CFAE4)
    ENUN
    CALL(EventScr_08591FD8)
    ENDA
};

CONST_DATA EventListScr EventScr_089FF330[] = {
    SVAL(EVT_SLOT_2, 0x6d)
    CALL(EventScr_SetFlagIfPlayedThrough)
    SVAL(EVT_SLOT_2, 0x2e)
    CALL(EventScr_WholeTowerClear)
    ENDA
};

CONST_DATA EventListScr EventScr_CastleFelia_BeginingScene[] = {
    CHECK_EVENTID(136)
    BEQ(0x801c, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_SplitMenu)
LABEL(0x801c)
    MUSC(0x31)
    SVAL(EVT_SLOT_2, 0xe)
    CALL(EventScr_SetBackground)
    CHECK_ALIVE(CHARACTER_GILLIAM)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    TEXTSHOW(0xbff)
    TEXTEND
    MUSCMID(0x7fff)
    TEXTCONT
    TEXTEND
    MUSC(0x32)
    TEXTCONT
    TEXTEND
    GOTO(0x1)
LABEL(0x0)
    TEXTSHOW(0xc00)
    TEXTEND
    MUSCMID(0x7fff)
    TEXTCONT
    TEXTEND
    MUSC(0x32)
    TEXTCONT
    TEXTEND
LABEL(0x1)
    REMA
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x1388)
    GIVEITEMTOMAIN(CHAR_EVT_PLAYER_LEADER)
    FADI(4)
    REMOVEPORTRAITS
    BACG(0x10)
    MUSC(0x32)
    FADU(4)
    TEXTSHOW(0xc01)
    TEXTEND
    REMA
    FADI(16)
    LOAD1(0x1, UnitDef_088B43D0)
    ENUN
    ENUT(138)
    MNCH(0x2)
    ENDA
};

CONST_DATA EventListScr EventScr_089FF430[] = {
    ENDA
};

CONST_DATA EventListScr EventScr_MelkaenCoast_BeginingScene[] = {
    LOAD1(0x1, UnitDef_088CFCC4)
    ENUN
    CALL(EventScr_08591FD8)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FF450[] = {
    MNCH(0x0)
    ENDA
};

CONST_DATA EventListScr EventScr_UnkCh3B_BeginingScene[] = {
    LOAD1(0x1, UnitDef_088D0F5C)
    ENUN
    LOAD1(0x1, UnitDef_088D1038)
    ENUN
    ENDA
};

CONST_DATA EventListScr EventScr_089FF474[] = {
    ENDA
};

CONST_DATA EventListScr EventScr_089FF478[] = {
    MNCH(0x3b)
    ENDA
};

CONST_DATA u8 gAutoUdefJids[8] = {
    0x58, 0x5B, 0x5F, 0x61, 0, 0, 0, 0
};

CONST_DATA EventListScr EventScr_9FF488[] = {
LABEL(0x0)
    STAL1(65535)
    CLEA
    CLEE
    CLEN
    ASMC(sub_808679C)
    LOAD2(0x1, gUdefs)
    ENUN
    GOTO(0x0)
    ENDA
};

CONST_DATA EventListScr EventScr_089FF4B8[] = {
    LOAD1(0x0, UnitDef_088D118C)
    ENUN
    LOAD1(0x1, UnitDef_088D1650)
    ENUN
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FF4D8[] = {
    MNCH(0x3c)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FF4E4[] = {
    BROWNBOXTEXT(0x2b, 16, 16)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FF4F4[] = {
    FADI(64)
    CHECK_EVBIT(2)
    BNE(0x8129, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x0)
    FADU(64)
    BROWNBOXTEXT(0x160, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8129)
    CHECK_EVBIT(2)
    BNE(0x812a, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x1)
    FADU(64)
    BROWNBOXTEXT(0x161, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x812a)
    CHECK_EVBIT(2)
    BNE(0x812b, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x2)
    FADU(64)
    BROWNBOXTEXT(0x162, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x812b)
    CHECK_EVBIT(2)
    BNE(0x812c, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x3)
    FADU(64)
    BROWNBOXTEXT(0x163, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x812c)
    CHECK_EVBIT(2)
    BNE(0x812d, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x4)
    FADU(64)
    BROWNBOXTEXT(0x164, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x812d)
    CHECK_EVBIT(2)
    BNE(0x812e, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x6)
    FADU(64)
    BROWNBOXTEXT(0x166, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x812e)
    CHECK_EVBIT(2)
    BNE(0x812f, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x7)
    FADU(64)
    BROWNBOXTEXT(0x167, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x812f)
    CHECK_EVBIT(2)
    BNE(0x8130, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x8)
    FADU(64)
    BROWNBOXTEXT(0x168, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8130)
    CHECK_EVBIT(2)
    BNE(0x8131, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x9)
    FADU(64)
    BROWNBOXTEXT(0x169, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8131)
    CHECK_EVBIT(2)
    BNE(0x8132, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0xa)
    FADU(64)
    BROWNBOXTEXT(0x16a, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8132)
    CHECK_EVBIT(2)
    BNE(0x8133, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0xb)
    FADU(64)
    BROWNBOXTEXT(0x16b, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8133)
    CHECK_EVBIT(2)
    BNE(0x8134, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0xc)
    FADU(64)
    BROWNBOXTEXT(0x16c, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8134)
    CHECK_EVBIT(2)
    BNE(0x8135, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0xd)
    FADU(64)
    BROWNBOXTEXT(0x16d, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8135)
    CHECK_EVBIT(2)
    BNE(0x8136, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0xe)
    FADU(64)
    BROWNBOXTEXT(0x16e, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8136)
    CHECK_EVBIT(2)
    BNE(0x8137, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0xf)
    FADU(64)
    BROWNBOXTEXT(0x16f, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8137)
    CHECK_EVBIT(2)
    BNE(0x8138, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x10)
    FADU(64)
    BROWNBOXTEXT(0x170, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8138)
    CHECK_EVBIT(2)
    BNE(0x8139, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x11)
    FADU(64)
    BROWNBOXTEXT(0x171, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8139)
    CHECK_EVBIT(2)
    BNE(0x813a, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x12)
    FADU(64)
    BROWNBOXTEXT(0x172, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x813a)
    CHECK_EVBIT(2)
    BNE(0x813b, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x13)
    FADU(64)
    BROWNBOXTEXT(0x173, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x813b)
    CHECK_EVBIT(2)
    BNE(0x813c, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x14)
    FADU(64)
    BROWNBOXTEXT(0x174, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x813c)
    CHECK_EVBIT(2)
    BNE(0x813d, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x15)
    FADU(64)
    BROWNBOXTEXT(0x175, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x813d)
    CHECK_EVBIT(2)
    BNE(0x813e, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x17)
    FADU(64)
    BROWNBOXTEXT(0x177, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x813e)
    CHECK_EVBIT(2)
    BNE(0x813f, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x18)
    FADU(64)
    BROWNBOXTEXT(0x178, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x813f)
    CHECK_EVBIT(2)
    BNE(0x8140, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x19)
    FADU(64)
    BROWNBOXTEXT(0x179, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8140)
    CHECK_EVBIT(2)
    BNE(0x8141, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x1a)
    FADU(64)
    BROWNBOXTEXT(0x17a, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8141)
    CHECK_EVBIT(2)
    BNE(0x8142, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x1b)
    FADU(64)
    BROWNBOXTEXT(0x17b, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8142)
    CHECK_EVBIT(2)
    BNE(0x8143, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x1c)
    FADU(64)
    BROWNBOXTEXT(0x17c, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8143)
    CHECK_EVBIT(2)
    BNE(0x8144, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x1d)
    FADU(64)
    BROWNBOXTEXT(0x17d, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8144)
    CHECK_EVBIT(2)
    BNE(0x8145, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x1e)
    FADU(64)
    BROWNBOXTEXT(0x17e, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8145)
    CHECK_EVBIT(2)
    BNE(0x8146, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x1f)
    FADU(64)
    BROWNBOXTEXT(0x17f, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8146)
    CHECK_EVBIT(2)
    BNE(0x8147, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x20)
    FADU(64)
    BROWNBOXTEXT(0x180, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8147)
    CHECK_EVBIT(2)
    BNE(0x8148, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x21)
    FADU(64)
    BROWNBOXTEXT(0x181, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8148)
    CHECK_EVBIT(2)
    BNE(0x8149, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x22)
    FADU(64)
    BROWNBOXTEXT(0x182, 8, 8)
    STAL1(65535)
    FADI(64)
LABEL(0x8149)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x3c)
    ENDA
};

CONST_DATA EventListScr EventScr_089FFB38[] = {
    BROWNBOXTEXT(0x2c, 16, 16)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FFB48[] = {
    FADI(16)
    SVAL(EVT_SLOT_2, 0x1)
    SVAL(EVT_SLOT_3, 0x72)
    REMOVEPORTRAITS
LABEL(0x0)
    BACG(0x37)
    FADU(16)
    FACE_SHOW(EVT_SLOT_1, 0xffff)
    TEXTEND
    STAL1(65535)
    REMA
    FADI(16)
    SVAL(EVT_SLOT_1, 0x1)
    SADD(EVT_SLOT_2, EVT_SLOT_2, EVT_SLOT_1)
    BLT(0x0, EVT_SLOT_2, EVT_SLOT_3)
    CLEAN
    FADU(16)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FFBA8[] = {
    BROWNBOXTEXT(0x2d, 16, 16)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FFBB8[] = {
    FADI(16)
    SVAL(EVT_SLOT_2, 0x0)
    SVAL(EVT_SLOT_3, 0x35)
    REMOVEPORTRAITS
LABEL(0x0)
    BACG(0xffff)
    FADU(16)
    STAL1(65535)
    FADI(16)
    SVAL(EVT_SLOT_1, 0x1)
    SADD(EVT_SLOT_2, EVT_SLOT_2, EVT_SLOT_1)
    BLT(0x0, EVT_SLOT_2, EVT_SLOT_3)
    CLEAN
    FADU(16)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FFC0C[] = {
    CHECK_CHAPTER_NUMBER
LABEL(0x0)
    SDEQUEUE(EVT_SLOT_7)
    SDEQUEUE(EVT_SLOT_2)
    BNE(0x0, EVT_SLOT_7, EVT_SLOT_C)
    CALL(0xffffffff)
    ENDA
};

CONST_DATA EventListScr EventScr_SkirmishCommonBeginning[] = {
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x4)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_089FFE84)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x7)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_089FFF14)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xb)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_089FFF8C)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xd)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_08A00034)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x11)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_08A000A0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x12)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_08A0013C)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x18)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_08A001AC)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1a)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_08A00260)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1e)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_08A000A0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1f)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_08A0013C)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x39)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_08A002F0)
    SENQUEUE1
    CALL(EventScr_089FFC0C)
    TILECHANGE(0xfffd)
    LOAD4(0x1, 0x0)
    ENUN
    CALL(EventScr_08591FD8)
    ENDA
};

CONST_DATA EventListScr EventScr_SkirmishCommonEnd[] = {
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x4)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_089FFF08)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x7)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_089FFF80)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xb)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_08A00028)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xd)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_08A00094)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x11)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_08A00130)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x12)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_08A001A0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x18)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_08A00254)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1a)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_08A002E4)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1e)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_08A00130)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1f)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_08A001A0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x39)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_08A00350)
    SENQUEUE1
    CALL(EventScr_089FFC0C)
    MNCH(0xffff)
    ENDA
};

CONST_DATA EventListScr EventScr_089FFE84[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x2)
    SENQUEUE1
    ENDA
};

CONST_DATA EventListScr EventScr_089FFF08[] = {
    SVAL(EVT_SLOT_2, 0x7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FFF14[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    ENDA
};

CONST_DATA EventListScr EventScr_089FFF80[] = {
    SVAL(EVT_SLOT_2, 0xb)
    ENDA
};

CONST_DATA EventListScr EventScr_089FFF8C[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x2)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x3)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x4)
    SENQUEUE1
    ENDA
};

CONST_DATA EventListScr EventScr_08A00028[] = {
    SVAL(EVT_SLOT_2, 0xd)
    ENDA
};

CONST_DATA EventListScr EventScr_08A00034[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    ENDA
};

CONST_DATA EventListScr EventScr_08A00094[] = {
    SVAL(EVT_SLOT_2, 0x11)
    ENDA
};

CONST_DATA EventListScr EventScr_08A000A0[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x2)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x3)
    SENQUEUE1
    ENDA
};

CONST_DATA EventListScr EventScr_08A00130[] = {
    SVAL(EVT_SLOT_2, 0x12)
    ENDA
};

CONST_DATA EventListScr EventScr_08A0013C[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    VCWF(0)
    ENDA
};

CONST_DATA EventListScr EventScr_08A001A0[] = {
    SVAL(EVT_SLOT_2, 0x14)
    ENDA
};

CONST_DATA EventListScr EventScr_08A001AC[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x2)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x3)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x6)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x7)
    SENQUEUE1
    ENDA
};

CONST_DATA EventListScr EventScr_08A00254[] = {
    SVAL(EVT_SLOT_2, 0x1a)
    ENDA
};

CONST_DATA EventListScr EventScr_08A00260[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x4)
    SENQUEUE1
    ENDA
};

CONST_DATA EventListScr EventScr_08A002E4[] = {
    SVAL(EVT_SLOT_2, 0x39)
    ENDA
};

CONST_DATA EventListScr EventScr_08A002F0[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    ENDA
};

CONST_DATA EventListScr EventScr_08A00350[] = {
    SVAL(EVT_SLOT_2, 0x4)
    ENDA
};

CONST_DATA EventListScr EventScr_8A0035C[] = {
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_8A00364[] = {
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_08A0036C[] = {
    ASMC(StartCharacterEndings)
    STAL(1)
    ENDA
};

CONST_DATA EventListScr EventScr_EirikaModeGameEnd[] = {
    EVBIT_MODIFY(0x2)
    MUSC(0x33)
    SVAL(EVT_SLOT_2, UnitDef_088D17B8)
    SVAL(EVT_SLOT_3, 0xc19)
    CALL(EventScr_08A00544)
    CHECK_ALIVE(CHARACTER_JOSHUA)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    LOAD2(0x1, UnitDef_088D1894)
    ENUN
    SVAL(EVT_SLOT_B, 0x17)
    LOMA(0xf)
    FADU(16)
    BROWNBOXTEXT(0x65d, 8, 8)
    MOVE_1STEP(0x8, CHARACTER_JOSHUA, FACING_DOWN)
    ENUN
    CUMO_CHAR(CHARACTER_JOSHUA)
    STAL(60)
    CURE
    TEXTSHOW(0xc1a)
    TEXTEND
    GOTO(0x1)
LABEL(0x0)
    LOAD2(0x1, UnitDef_088D1984)
    ENUN
    SVAL(EVT_SLOT_B, 0x17)
    LOMA(0xf)
    FADU(16)
    BROWNBOXTEXT(0x65d, 8, 8)
    MOVE_1STEP(0x8, CHARACTER_MYRRH, FACING_DOWN)
    ENUN
    CUMO_CHAR(CHARACTER_MYRRH)
    STAL(60)
    CURE
    TEXTSHOW(0xc1b)
    TEXTEND
LABEL(0x1)
    FADI(4)
    REMA
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_2, REDA_088D1C40)
    SVAL(EVT_SLOT_3, 0xc1c)
    CALL(EventScr_08A005B4)
    SVAL(EVT_SLOT_2, UnitDef_088D1D38)
    SVAL(EVT_SLOT_3, 0xc1d)
    CALL(EventScr_08A0062C)
    CALL(EventScr_08A00680)
    ENDA
};

CONST_DATA EventListScr EventScr_EphraimModeGameEnd[] = {
    EVBIT_MODIFY(0x2)
    MUSC(0x33)
    SVAL(EVT_SLOT_2, UnitDef_088D181C)
    SVAL(EVT_SLOT_3, 0xc1e)
    CALL(EventScr_08A00544)
    LOAD2(0x1, UnitDef_088D1A60)
    ENUN
    SVAL(EVT_SLOT_B, 0x8000c)
    LOMA(0xc)
    FADU(16)
    BROWNBOXTEXT(0x65b, 8, 8)
    TEXTSTART
    MOVE_1STEP(0x8, CHARACTER_MYRRH, FACING_DOWN)
    ENUN
    CUMO_CHAR(CHARACTER_MYRRH)
    STAL(60)
    CURE
    TEXTSHOW(0xc1f)
    TEXTEND
    FADI(4)
    REMA
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_2, REDA_088D1C90)
    SVAL(EVT_SLOT_3, 0xc20)
    CALL(EventScr_08A005B4)
    SVAL(EVT_SLOT_2, UnitDef_088D1D74)
    SVAL(EVT_SLOT_3, 0xc21)
    CALL(EventScr_08A0062C)
    CALL(EventScr_08A00680)
    ENDA
};

CONST_DATA EventListScr EventScr_08A00544[] = {
    LOAD2(0x1, UnitDef_088D1740)
    ENUN
    LOAD2(0x1, 0xffffffff)
    ENUN
    SVAL(EVT_SLOT_B, 0xc0011)
    LOMA(0x13)
    FADU(16)
    BROWNBOXTEXT(0x667, 8, 8)
    MOVE_1STEP(0x8, CHARACTER_LARACHEL, FACING_DOWN)
    ENUN
    CUMO_CHAR(CHARACTER_LARACHEL)
    STAL(60)
    CURE
    TEXTSTART
    SADD(EVT_SLOT_2, EVT_SLOT_3, EVT_SLOT_0)
    TEXTSHOW(0xffff)
    TEXTEND
    FADI(4)
    REMA
    CLEA
    CLEE
    CLEN
    ENDA
};

CONST_DATA EventListScr EventScr_08A005B4[] = {
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, REDA_088D1BA0)
    ENUN
    LOAD2(0x1, 0xffffffff)
    ENUN
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x40)
    FADU(16)
    BROWNBOXTEXT(0x664, 8, 8)
    CUMO_CHAR(CHARACTER_INNES)
    STAL(60)
    CURE
    SADD(EVT_SLOT_2, EVT_SLOT_3, EVT_SLOT_0)
    TEXTSTART
    TEXTSHOW(0xffff)
    TEXTEND
    REMA
    LOAD2(0x1, REDA_088D1BA0)
    STAL2(32)
    FADI(4)
    ENUN
    CLEA
    CLEE
    CLEN
    ENDA
};

CONST_DATA EventListScr EventScr_08A0062C[] = {
    SVAL(EVT_SLOT_B, 0x5000e)
    LOMA(0x10)
    FADU(4)
    LOAD2(0x1, 0xffffffff)
    ENUN
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    TEXTSTART
    SADD(EVT_SLOT_2, EVT_SLOT_3, EVT_SLOT_0)
    TEXTSHOW(0xffff)
    TEXTEND
    EvtBgmFadeIn(0x7fff, 8) // ENOSUPP in EAstdlib
    FADI(2)
    REMA
    CLEA
    CLEE
    CLEN
    ENDA
};

CONST_DATA EventListScr EventScr_08A00680[] = {
    EVBIT_F(2)
    ASMC(BMapDispSuspend)
    MUSC(0x42)
    ASMC(StartEndingCredits)
    STAL(90)
    EvtTextStartType2 // ENOSUPP in EAstdlib
    EvtBgFadeIn(0x0, 0, 2) // ENOSUPP in EAstdlib
    TEXTSHOW(0xc22)
    TEXTEND
    EvtBgmFadeIn(0x7fff, 8) // ENOSUPP in EAstdlib
    FADI(2)
    REMA
    EVBIT_F(2)
    STAL(120)
    ASMC(StartEndingTurnRecordScreen)
    STAL(1)
    CALL(EventScr_08A0036C)
    STAL(90)
    MNTS(0x0)
    ENDA
};
