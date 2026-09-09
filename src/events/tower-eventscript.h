#include "gbafe.h"

CONST_DATA EventListScr EventScr_Tower1_BeginningScene[] = {
    ASMC(InitTowerDungeonState)
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
    LOAD1(0x1, UnitDef_TowerEnemy_0)
    ENUN
    CALL(EventScr_CommonPrep)
    ENDA
};

CONST_DATA EventListScr EventScr_Tower1_EndingScene[] = {
    SVAL(EVT_SLOT_2, 0x71)
    SVAL(EVT_SLOT_3, 0x24)
    CALL(EventScr_9EE8F0)
    SVAL(EVT_SLOT_2, 0x24)
    SVAL(EVT_SLOT_3, 0x25)
    CALL(EventScr_FloorClearInTower)
    ENDA
};

CONST_DATA EventListScr EventScr_Tower2_BeginningScene[] = {
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
    LOAD1(0x1, UnitDef_TowerEnemy_1)
    ENUN
    CALL(EventScr_CommonPrep)
    ENUT(8)
    ENDA
};

CONST_DATA EventListScr EventScr_Tower2_EndingScene[] = {
    SVAL(EVT_SLOT_2, 0x72)
    SVAL(EVT_SLOT_3, 0x24)
    CALL(EventScr_9EE8F0)
    SVAL(EVT_SLOT_2, 0x24)
    SVAL(EVT_SLOT_3, 0x26)
    CALL(EventScr_FloorClearInTower)
    ENDA
};

CONST_DATA EventListScr EventScr_Tower_0[] = {
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

CONST_DATA EventListScr EventScr_Tower_1[] = {
    SVAL(EVT_SLOT_2, UnitDef_TowerEnemy_2)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Tower3_BeginningScene[] = {
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
    LOAD1(0x1, UnitDef_TowerEnemy_3)
    ENUN
    CALL(EventScr_CommonPrep)
    ENDA
};

CONST_DATA EventListScr EventScr_Tower3_EndingScene[] = {
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

CONST_DATA EventListScr EventScr_Tower4_BeginningScene[] = {
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
    LOAD1(0x1, UnitDef_TowerEnemy_4)
    ENUN
    CALL(EventScr_CommonPrep)
    ENDA
};

CONST_DATA EventListScr EventScr_Tower4_EndingScene[] = {
    SVAL(EVT_SLOT_2, 0x74)
    SVAL(EVT_SLOT_3, 0x24)
    CALL(EventScr_9EE8F0)
    SVAL(EVT_SLOT_2, 0x24)
    SVAL(EVT_SLOT_3, 0x28)
    CALL(EventScr_FloorClearInTower)
    ENDA
};

CONST_DATA EventListScr EventScr_Tower5_BeginningScene[] = {
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
    LOAD1(0x1, UnitDef_TowerEnemy_5)
    ENUN
    CALL(EventScr_CommonPrep)
    ENDA
};

CONST_DATA EventListScr EventScr_Tower5_EndingScene[] = {
    SVAL(EVT_SLOT_2, 0x75)
    SVAL(EVT_SLOT_3, 0x24)
    CALL(EventScr_9EE8F0)
    SVAL(EVT_SLOT_2, 0x24)
    SVAL(EVT_SLOT_3, 0x29)
    CALL(EventScr_FloorClearInTower)
    ENDA
};

CONST_DATA EventListScr EventScr_Tower_2[] = {
    SVAL(EVT_SLOT_2, UnitDef_TowerEnemy_6)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Tower6_BeginningScene[] = {
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
    LOAD1(0x1, UnitDef_TowerEnemy_7)
    ENUN
    CALL(EventScr_CommonPrep)
    ENDA
};

CONST_DATA EventListScr EventScr_Tower6_EndingScene[] = {
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

CONST_DATA EventListScr EventScr_Tower7_BeginningScene[] = {
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
    LOAD1(0x1, UnitDef_TowerEnemy_8)
    ENUN
    CALL(EventScr_CommonPrep)
    ENUT(12)
    ENUT(13)
    ENUT(14)
    ENDA
};

CONST_DATA EventListScr EventScr_Tower7_EndingScene[] = {
    SVAL(EVT_SLOT_2, 0x77)
    SVAL(EVT_SLOT_3, 0x24)
    CALL(EventScr_9EE8F0)
    SVAL(EVT_SLOT_2, 0x24)
    SVAL(EVT_SLOT_3, 0x2b)
    CALL(EventScr_FloorClearInTower)
    ENDA
};

CONST_DATA EventListScr EventScr_Tower_3[] = {
    CHECK_EXISTS(0xaa)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x0)
    CAMERA(9, 16)
    TILECHANGE(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Tower_4[] = {
    CHECK_EXISTS(0xac)
    BEQ(0x1, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_EndAndResetTriggEvent)
LABEL(0x1)
    CAMERA(17, 13)
    TILECHANGE(0x1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Tower_5[] = {
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

CONST_DATA EventListScr EventScr_Tower_6[] = {
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

CONST_DATA EventListScr EventScr_Tower_7[] = {
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

CONST_DATA EventListScr EventScr_Tower_8[] = {
    SVAL(EVT_SLOT_2, UnitDef_TowerEnemy_9)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Tower_9[] = {
    SVAL(EVT_SLOT_2, UnitDef_TowerEnemy_10)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Tower_10[] = {
    SVAL(EVT_SLOT_2, UnitDef_TowerEnemy_11)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Tower8_BeginningScene[] = {
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
    LOAD1(0x1, UnitDef_TowerEnemy_12)
    ENUN
    CALL(EventScr_CommonPrep)
    ENDA
};

CONST_DATA EventListScr EventScr_Tower8_EndingScene[] = {
    SVAL(EVT_SLOT_2, 0x6e)
    CALL(EventScr_SetFlagIfPlayedThrough)
    SVAL(EVT_SLOT_2, 0x24)
    CALL(EventScr_WholeTowerClear)
    ENDA
};
