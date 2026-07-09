#include "gbafe.h"

CONST_DATA EventListScr EventScr_Ch15b_BeginningScene[] = {
    LOAD1(0x1, UnitDef_Ch15BEnemy_0)
    ENUN
    REMU(CHARACTER_CAELLACH)
    LOAD1(0x1, UnitDef_Ch15BEnemy_7)
    ENUN
    CAMERA(0, 21)
    CLEAN
    MUSC(SONG_TENSION)
    FADU(16)
    LOAD2(0x1, UnitDef_Ch15BAlly_2)
    SVAL(EVT_SLOT_1, 0x0)
    SET_STATE(CHARACTER_EPHRAIM)
    SVAL(EVT_SLOT_1, 0x0)
    SET_STATE(CHARACTER_SETH)
    LOAD3(0x0, UnitDef_Ch15BAlly_3)
    ENUN
    SVAL(EVT_SLOT_1, 0xffffffff)
    SET_STATE(CHARACTER_EPHRAIM)
    SVAL(EVT_SLOT_1, 0xffffffff)
    SET_STATE(CHARACTER_SETH)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    SetBackground(BG_DESERT)
    TEXTSHOW(0xb19)
    TEXTEND
    REMA
    MUSCMID(SONG_SILENT)
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
    MUSC(SONG_SOLVE_THE_RIDDLE)
    Text_BG(BG_DESERT, 0xb1a)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    DISA(CHARACTER_LYON)
    MOVE_1STEP(0x0, CHARACTER_BANDIT_CH5, FACING_UP)
    ENUN
    MOVEONTO(0x0, CHARACTER_BANDIT_CH5, CHARACTER_CAELLACH)
    ENUN
    LOAD1(0x1, UnitDef_Ch15BEnemy_1)
    ENUN
    ENUN
    REVEAL(CHARACTER_CAELLACH)
    DISA(CHARACTER_BANDIT_CH5)
    FADI(16)
    CALL(EventScr_CommonPrep)
    CAMERA2(12, 7)
    FADU(16)
    MUSC(SONG_RAID)
    LOAD1(0x1, UnitDef_Ch15BAlly_1)
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
    Text_BG(BG_DESERT, 0xb1c)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch15b_EndingScene[] = {
    CALL(EventScr_Ch15A_26)
    ENUT(119)
    MNCH(0x1d)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch15B_0[] = {
    MUSI
    Text_BG(BG_HOUSE, 0xb36)
    MUNO
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x88)
    GIVEITEMTO(CHAR_EVT_ACTIVE_UNIT)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch15B_1[] = {
    MUSI
    Text_BG(BG_HOUSE, 0xb37)
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch15B_2[] = {
    MUSI
    Text_BG(BG_HOUSE, 0xb38)
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch15B_3[] = {
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

CONST_DATA EventListScr EventScr_Ch15B_4[] = {
    MUSI
    TEXTSTART
    TEXTSHOW(0xb32)
    TEXTEND
    REMA
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch15B_5[] = {
    MUSI
    TEXTSTART
    TEXTSHOW(0xb33)
    TEXTEND
    REMA
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch15B_6[] = {
    MUSI
    TEXTSTART
    TEXTSHOW(0xb34)
    TEXTEND
    REMA
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch15B_7[] = {
    MUSI
    TEXTSTART
    TEXTSHOW(0xb35)
    TEXTEND
    REMA
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch15B_8[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch15BEnemy_2)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch15B_9[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch15BEnemy_3)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch15B_10[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch15BEnemy_4)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch15B_11[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch15BEnemy_5)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch15B_12[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch15BEnemy_6)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch15B_13[] = {
    SVAL(EVT_SLOT_2, FACTION_BLUE)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0x81)
    SVAL(EVT_SLOT_1, 0x11200)
    CHAI(0x82)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch15B_14[] = {
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

CONST_DATA EventListScr EventScr_Ch15B_15[] = {
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

CONST_DATA EventListScr EventScr_Ch15B_16[] = {
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

CONST_DATA EventListScr EventScr_Ch15B_17[] = {
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

CONST_DATA EventListScr EventScr_Ch15B_18[] = {
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

CONST_DATA EventListScr EventScr_Ch15B_19[] = {
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

CONST_DATA EventListScr EventScr_Ch15B_20[] = {
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

CONST_DATA EventListScr EventScr_Ch15B_21[] = {
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

CONST_DATA EventListScr EventScr_Ch15B_22[] = {
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
