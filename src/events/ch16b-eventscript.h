#include "gbafe.h"

CONST_DATA EventListScr EventScr_Ch16b_BeginningScene[] = {
    CALL(EventScr_Ch16A_11)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(CHAPTER_I_16)
    LOAD1(0x0, UnitDef_Ch15AAlly_2)
    ENUN
    LOAD1(0x1, UnitDef_Ch16BEnemy_0)
    ENUN
    SVAL(EVT_SLOT_2, UnitDef_Ch16BEnemy_7)
    SVAL(EVT_SLOT_3, 0x1)
    CALL(EventScr_LoadUnitForTutorial)
    CALL(EventScr_CommonPrep)
    ENUT(14)
    ENUT(13)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch16b_EndingScene[] = {
    CALL(EventScr_Ch16A_12)
    MNCH(0x1e)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch16B_0[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch16BEnemy_5)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch16B_1[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch16BEnemy_6)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch16B_2[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0x90)
    COUNTER_SET(0x0, 1)
    ENUF(14)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch16B_3[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch16BEnemy_2)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_Ch16BEnemy_1)
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

CONST_DATA EventListScr EventScr_Ch16B_4[] = {
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

CONST_DATA EventListScr EventScr_Ch16B_5[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch16BEnemy_3)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_Ch16BEnemy_4)
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
