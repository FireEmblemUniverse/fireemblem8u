#include "gbafe.h"

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

CONST_DATA EventListScr EventScr_Ch15b_EndingScene[] = {
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
    SVAL(EVT_SLOT_2, FACTION_BLUE)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0x81)
    SVAL(EVT_SLOT_1, 0x11200)
    CHAI(0x82)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCADC[] = {
    SVAL(EVT_SLOT_2, FACTION_BLUE)
    CALL(EventScr_UnTriggerIfNotFaction)
    CHECK_LUCK(CHAR_EVT_ACTIVE_UNIT)
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_3, ITEM_SWORD_WYRMSLAYER)
    CALL(EventScr_GiveTreasureToLuckyDog)
    BNE(0x8161, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x8161)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCB20[] = {
    SVAL(EVT_SLOT_2, FACTION_BLUE)
    CALL(EventScr_UnTriggerIfNotFaction)
    CHECK_LUCK(CHAR_EVT_ACTIVE_UNIT)
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_3, ITEM_BOOSTER_MOV)
    CALL(EventScr_GiveTreasureToLuckyDog)
    BNE(0x8171, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x8171)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCB64[] = {
    SVAL(EVT_SLOT_2, FACTION_BLUE)
    CALL(EventScr_UnTriggerIfNotFaction)
    CHECK_LUCK(CHAR_EVT_ACTIVE_UNIT)
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_3, ITEM_METISSTOME)
    CALL(EventScr_GiveTreasureToLuckyDog)
    BNE(0x8181, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x8181)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCBA8[] = {
    SVAL(EVT_SLOT_2, FACTION_BLUE)
    CALL(EventScr_UnTriggerIfNotFaction)
    CHECK_LUCK(CHAR_EVT_ACTIVE_UNIT)
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_3, ITEM_STAFF_WARP)
    CALL(EventScr_GiveTreasureToLuckyDog)
    BNE(0x8191, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x8191)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCBEC[] = {
    SVAL(EVT_SLOT_2, FACTION_BLUE)
    CALL(EventScr_UnTriggerIfNotFaction)

    CHECK_LUCK(CHAR_EVT_ACTIVE_UNIT)
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_3, ITEM_DARK_ECLIPSE)
    CALL(EventScr_GiveTreasureToLuckyDog)

    BNE(0x81a1, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x81a1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCC30[] = {
    SVAL(EVT_SLOT_2, FACTION_BLUE)
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
    SVAL(EVT_SLOT_2, FACTION_BLUE)
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
    SVAL(EVT_SLOT_2, FACTION_BLUE)
    CALL(EventScr_UnTriggerIfNotFaction)
    CHECK_LUCK(CHAR_EVT_ACTIVE_UNIT)
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_3, ITEM_BOW_KILLER)
    CALL(EventScr_GiveTreasureToLuckyDog)
    BNE(0x81d1, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x81d1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCCFC[] = {
    SVAL(EVT_SLOT_2, FACTION_BLUE)
    CALL(EventScr_UnTriggerIfNotFaction)
    CHECK_LUCK(CHAR_EVT_ACTIVE_UNIT)
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_3, ITEM_STAFF_SILENCE)
    CALL(EventScr_GiveTreasureToLuckyDog)
    BNE(0x81e1, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x81e1)
    EVBIT_T(7)
    ENDA
};
