#include "gbafe.h"

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

CONST_DATA EventListScr EventScr_Tower1_EndingScene[] = {
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

CONST_DATA EventListScr EventScr_Tower2_EndingScene[] = {
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

CONST_DATA EventListScr EventScr_Tower4_EndingScene[] = {
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

CONST_DATA EventListScr EventScr_Tower5_EndingScene[] = {
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

CONST_DATA EventListScr EventScr_Tower7_EndingScene[] = {
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

CONST_DATA EventListScr EventScr_Tower8_EndingScene[] = {
    SVAL(EVT_SLOT_2, 0x6e)
    CALL(EventScr_SetFlagIfPlayedThrough)
    SVAL(EVT_SLOT_2, 0x24)
    CALL(EventScr_WholeTowerClear)
    ENDA
};
