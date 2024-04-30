#include "gbafe.h"

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
