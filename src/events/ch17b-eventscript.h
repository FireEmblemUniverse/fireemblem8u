#include "gbafe.h"

CONST_DATA EventListScr EventScr_Ch17b_BeginningScene[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch17BEnemy_0)
    CALL(EventScr_Ch17A_9)
    ENUT(14)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch17b_EndingScene[] = {
    CALL(EventScr_Ch17A_10)
    MNCH(0x1f)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch17B_0[] = {
    CALL(EventScr_Ch17A_11)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch17B_1[] = {
    CALL(EventScr_Ch17A_12)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch17B_2[] = {
    CALL(EventScr_Ch17A_13)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch17B_3[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch17BEnemy_1)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch17B_4[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch17BEnemy_3)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch17B_5[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch17BEnemy_4)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch17B_6[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch17BEnemy_5)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch17B_7[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    COUNTER_SET(0x0, 5)
    ENUF(14)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch17B_8[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch17BEnemy_2)
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

CONST_DATA EventListScr EventScr_Ch17B_9[] = {
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
