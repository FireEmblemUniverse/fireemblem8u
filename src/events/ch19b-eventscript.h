#include "gbafe.h"

CONST_DATA EventListScr EventScr_Ch19b_BeginningScene[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch19BNPC_0)
    SVAL(EVT_SLOT_3, UnitDef_Ch19BNPC_1)
    SVAL(EVT_SLOT_4, UnitDef_Ch19BEnemy_0)
    CALL(EventScr_Ch19A_10)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch19B_0[] = {
    CAMERA_CAHR(CHARACTER_EPHRAIM)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    MUSC(SONG_SHADOWS_APPROACH)
    Text_BG(BG_CASTLE_NIGHT, 0xb98)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch19b_EndingScene[] = {
    CALL(EventScr_Ch19A_11)
    MNCH(0x21)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch19B_1[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch19BEnemy_1)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch19B_2[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch19BEnemy_2)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch19B_3[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_Ch19BEnemy_3)
    CALL(EventScr_LoadReinforce)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch19B_4[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_Ch19BEnemy_4)
    CALL(EventScr_LoadReinforce)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch19B_5[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_Ch19BEnemy_5)
    CALL(EventScr_LoadReinforce)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch19B_6[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_Ch19BEnemy_6)
    CALL(EventScr_LoadReinforce)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch19B_7[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch19BEnemy_7)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch19B_8[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch19BEnemy_8)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};
