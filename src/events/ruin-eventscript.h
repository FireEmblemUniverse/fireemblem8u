#include "gbafe.h"

CONST_DATA EventListScr EventScr_Ruins1_BeginningScene[] = {
    ASMC(InitRuinsDungeonState)
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
    LOAD1(0x1, UnitDef_RuinEnemy_0)
    ENUN
    CALL(EventScr_CommonPrep)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin1_EndingScene[] = {
    SVAL(EVT_SLOT_2, 0x2e)
    SVAL(EVT_SLOT_3, 0x2f)
    CALL(EventScr_FloorClearInTower)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_0[] = {
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_1)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_1[] = {
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_2)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_2[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xb9)
    SVAL(EVT_SLOT_1, 0x11200)
    CHAI(CHARACTER_MONSTER_BA)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruins2_BeginningScene[] = {
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
    LOAD1(0x1, UnitDef_RuinEnemy_3)
    ENUN
    CALL(EventScr_CommonPrep)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin2_EndingScene[] = {
    SVAL(EVT_SLOT_2, 0x2e)
    SVAL(EVT_SLOT_3, 0x30)
    CALL(EventScr_FloorClearInTower)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_3[] = {
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

CONST_DATA EventListScr EventScr_Ruins3_BeginningScene[] = {
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
    LOAD1(0x1, UnitDef_RuinEnemy_4)
    ENUN
    CALL(EventScr_CommonPrep)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin3_EndingScene[] = {
    SVAL(EVT_SLOT_2, 0x2e)
    SVAL(EVT_SLOT_3, 0x31)
    CALL(EventScr_FloorClearInTower)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_4[] = {
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_5)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_5[] = {
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_6)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_6[] = {
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_7)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_7[] = {
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_8)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_8[] = {
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_9)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruins4_BeginningScene[] = {
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
    LOAD1(0x1, UnitDef_RuinEnemy_10)
    ENUN
    CALL(EventScr_CommonPrep)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_9[] = {
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_11)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_10[] = {
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_12)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin4_EndingScene[] = {
    SVAL(EVT_SLOT_2, 0x2e)
    SVAL(EVT_SLOT_3, 0x32)
    CALL(EventScr_FloorClearInTower)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruins5_BeginningScene[] = {
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
    LOAD1(0x1, UnitDef_RuinEnemy_13)
    ENUN
    CALL(EventScr_CommonPrep)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin5_EndingScene[] = {
    SVAL(EVT_SLOT_2, 0x68)
    CALL(EventScr_SetFlagIfPlayedThrough)
    SVAL(EVT_SLOT_2, 0x2e)
    SVAL(EVT_SLOT_3, 0x33)
    CALL(EventScr_FloorClearInTower)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_11[] = {
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_14)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_12[] = {
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_15)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_13[] = {
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_16)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruins6_BeginningScene[] = {
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
    LOAD1(0x1, UnitDef_RuinEnemy_17)
    ENUN
    CALL(EventScr_CommonPrep)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin6_EndingScene[] = {
    SVAL(EVT_SLOT_2, 0x2e)
    SVAL(EVT_SLOT_3, 0x34)
    CALL(EventScr_FloorClearInTower)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_14[] = {
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_18)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_15[] = {
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_19)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_16[] = {
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_20)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_17[] = {
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_21)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruins7_BeginningScene[] = {
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
    LOAD1(0x1, UnitDef_RuinEnemy_22)
    ENUN
    CALL(EventScr_CommonPrep)
    ENUT(8)
    ENUT(10)
    ENUT(12)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin7_EndingScene[] = {
    SVAL(EVT_SLOT_2, 0x6a)
    CALL(EventScr_SetFlagIfPlayedThrough)
    SVAL(EVT_SLOT_2, 0x2e)
    SVAL(EVT_SLOT_3, 0x35)
    CALL(EventScr_FloorClearInTower)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_18[] = {
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_23)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_19[] = {
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_24)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_20[] = {
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_25)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_21[] = {
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_26)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_22[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    COUNTER_SET(0x0, 3)
    ENUF(8)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_23[] = {
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_27)
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

CONST_DATA EventListScr EventScr_Ruin_24[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    COUNTER_SET(0x1, 3)
    ENUF(10)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_25[] = {
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_28)
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

CONST_DATA EventListScr EventScr_Ruin_26[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    COUNTER_SET(0x2, 5)
    ENUF(12)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_27[] = {
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_29)
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

CONST_DATA EventListScr EventScr_Ruin_28[] = {
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_30)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruins8_BeginningScene[] = {
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
    LOAD1(0x1, UnitDef_RuinEnemy_31)
    ENUN
    CALL(EventScr_CommonPrep)
    ENUT(8)
    ENUT(10)
    ENUT(12)
    ENUT(14)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin8_EndingScene[] = {
    SVAL(EVT_SLOT_2, 0x2e)
    SVAL(EVT_SLOT_3, 0x36)
    CALL(EventScr_FloorClearInTower)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_29[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    COUNTER_SET(0x3, 2)
    ENUF(8)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_30[] = {
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_32)
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

CONST_DATA EventListScr EventScr_Ruin_31[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    COUNTER_SET(0x4, 2)
    ENUF(10)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_32[] = {
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_33)
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

CONST_DATA EventListScr EventScr_Ruin_33[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    COUNTER_SET(0x5, 2)
    ENUF(12)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_34[] = {
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_34)
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

CONST_DATA EventListScr EventScr_Ruin_35[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_1, 0x10300)
    CHAI(0xbd)
    COUNTER_SET(0x6, 4)
    ENUF(14)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_36[] = {
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_35)
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

CONST_DATA EventListScr EventScr_Ruin_37[] = {
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
    SOUN(SONG_BE)
    TILECHANGE(0x0)
    CAMERA2(12, 12)
    STAL(15)
    SOUN(SONG_BE)
    TILECHANGE(0x7)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_38[] = {
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
    SOUN(SONG_BD)
    TILEREVERT(0x0)
    CAMERA2(12, 12)
    STAL(15)
    SOUN(SONG_BD)
    TILEREVERT(0x7)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_39[] = {
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
    SOUN(SONG_BE)
    TILECHANGE(0x1)
    CAMERA2(10, 10)
    STAL(15)
    SOUN(SONG_BE)
    TILECHANGE(0x5)
    CAMERA(19, 20)
    STAL(15)
    SOUN(SONG_BE)
    TILECHANGE(0x8)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_40[] = {
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
    SOUN(SONG_BD)
    TILEREVERT(0x1)
    CAMERA2(10, 10)
    STAL(15)
    SOUN(SONG_BD)
    TILEREVERT(0x5)
    CAMERA(19, 20)
    STAL(15)
    SOUN(SONG_BD)
    TILEREVERT(0x8)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_41[] = {
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
    SOUN(SONG_BE)
    TILECHANGE(0x2)
    CAMERA(19, 20)
    STAL(15)
    SOUN(SONG_BE)
    TILECHANGE(0x9)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_42[] = {
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
    SOUN(SONG_BD)
    TILEREVERT(0x2)
    CAMERA(19, 20)
    STAL(15)
    SOUN(SONG_BD)
    TILEREVERT(0x9)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_43[] = {
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
    SOUN(SONG_BE)
    TILECHANGE(0x3)
    CAMERA2(10, 5)
    STAL(15)
    SOUN(SONG_BE)
    TILECHANGE(0x6)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_44[] = {
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
    SOUN(SONG_BD)
    TILEREVERT(0x3)
    CAMERA2(10, 5)
    STAL(15)
    SOUN(SONG_BD)
    TILEREVERT(0x6)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_45[] = {
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
    SOUN(SONG_BE)
    TILECHANGE(0x4)
    CAMERA2(12, 6)
    STAL(15)
    SOUN(SONG_BE)
    TILECHANGE(0xa)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_46[] = {
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
    SOUN(SONG_BD)
    TILEREVERT(0x4)
    CAMERA2(12, 6)
    STAL(15)
    SOUN(SONG_BD)
    TILEREVERT(0xa)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_47[] = {
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
    SOUN(SONG_BE)
    TILECHANGE(0xb)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_48[] = {
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
    SOUN(SONG_BD)
    TILEREVERT(0xb)
LABEL(0x1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruins9_BeginningScene[] = {
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
    LOAD1(0x1, UnitDef_RuinEnemy_36)
    ENUN
    CALL(EventScr_CommonPrep)
    ENUT(8)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin9_EndingScene[] = {
    SVAL(EVT_SLOT_2, 0x2e)
    SVAL(EVT_SLOT_3, 0x37)
    CALL(EventScr_FloorClearInTower)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_49[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xbd)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_50[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    COUNTER_SET(0x7, 3)
    ENUF(8)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_51[] = {
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_37)
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

CONST_DATA EventListScr EventScr_Ruins10_BeginningScene[] = {
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
    LOAD1(0x1, UnitDef_RuinEnemy_38)
    ENUN
    CALL(EventScr_CommonPrep)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin10_EndingScene[] = {
    SVAL(EVT_SLOT_2, 0x6d)
    CALL(EventScr_SetFlagIfPlayedThrough)
    SVAL(EVT_SLOT_2, 0x2e)
    CALL(EventScr_WholeTowerClear)
    ENDA
};
