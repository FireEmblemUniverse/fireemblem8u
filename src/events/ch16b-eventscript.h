#include "gbafe.h"

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

CONST_DATA EventListScr EventScr_Ch16b_EndingScene[] = {
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
