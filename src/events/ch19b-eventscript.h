#include "gbafe.h"

CONST_DATA EventListScr EventScr_Ch19b_BeginingScene[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CA214)
    SVAL(EVT_SLOT_3, UnitDef_088CA480)
    SVAL(EVT_SLOT_4, UnitDef_088C9E18)
    CALL(EventScr_089F82FC)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD3A8[] = {
    CAMERA_CAHR(CHARACTER_EPHRAIM)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    MUSC(0x11)
    SVAL(EVT_SLOT_2, 0xb)
    SVAL(EVT_SLOT_3, 0xb98)
    CALL(Event_TextWithBG)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch19b_EndingScene[] = {
    CALL(EventScr_089F8688)
    MNCH(0x21)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD3EC[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CA020)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD404[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CA048)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD41C[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_088CA070)
    CALL(EventScr_LoadReinforce)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD450[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_088CA0AC)
    CALL(EventScr_LoadReinforce)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD484[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_088CA0E8)
    CALL(EventScr_LoadReinforce)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD4B8[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_088CA124)
    CALL(EventScr_LoadReinforce)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD4EC[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CA160)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD504[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CA1C4)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};
