#include "gbafe.h"

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

CONST_DATA EventListScr EventScr_Ruin1_EndingScene[] = {
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

CONST_DATA EventListScr EventScr_Ruin2_EndingScene[] = {
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

CONST_DATA EventListScr EventScr_Ruin3_EndingScene[] = {
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

CONST_DATA EventListScr EventScr_Ruin4_EndingScene[] = {
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

CONST_DATA EventListScr EventScr_Ruin5_EndingScene[] = {
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

CONST_DATA EventListScr EventScr_Ruin6_EndingScene[] = {
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

CONST_DATA EventListScr EventScr_Ruin7_EndingScene[] = {
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

CONST_DATA EventListScr EventScr_Ruin8_EndingScene[] = {
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

CONST_DATA EventListScr EventScr_Ruin9_EndingScene[] = {
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

CONST_DATA EventListScr EventScr_Ruin10_EndingScene[] = {
    SVAL(EVT_SLOT_2, 0x6d)
    CALL(EventScr_SetFlagIfPlayedThrough)
    SVAL(EVT_SLOT_2, 0x2e)
    CALL(EventScr_WholeTowerClear)
    ENDA
};
