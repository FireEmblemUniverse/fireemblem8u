#include "gbafe.h"

CONST_DATA EventListScr EventScr_Ch17b_BeginingScene[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C7DA0)
    CALL(EventScr_089F7620)
    ENUT(14)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch17b_EndingScene[] = {
    CALL(EventScr_089F79D4)
    MNCH(0x1f)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCEEC[] = {
    CALL(EventScr_089F7CAC)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCEF8[] = {
    CALL(EventScr_089F7CD4)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCF04[] = {
    CALL(EventScr_089F7CFC)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCF10[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C7FA8)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCF28[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C8034)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCF40[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C8070)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCF58[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C80AC)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCF70[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    COUNTER_SET(0x0, 5)
    ENUF(14)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FCF90[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C7FF8)
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

CONST_DATA EventListScr EventScr_089FCFC4[] = {
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
