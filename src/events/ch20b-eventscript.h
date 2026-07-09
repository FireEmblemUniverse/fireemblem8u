#include "gbafe.h"

CONST_DATA EventListScr EventScr_Ch20b_BeginningScene[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch20BEnemy_0)
    CALL(EventScr_Ch19A_12)
    LOAD1(0x1, UnitDef_Ch20BEnemy_0)
    ENUN
    LOAD1(0x1, UnitDef_Ch20BEnemy_1)
    ENUN
    SVAL(EVT_SLOT_2, UnitDef_Ch20BEnemy_15)
    SVAL(EVT_SLOT_3, 0x1)
    CALL(EventScr_LoadUnitForTutorial)
    CALL(EventScr_CommonPrep)
    ENUT(10)
    ENUT(12)
    ENUT(14)
    ENUT(16)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch20B_0[] = {
    CALL(EventScr_Ch20A_13)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch20b_EndingScene[] = {
    CALL(EventScr_Ch20A_14)
    STAL(30)
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    FAWI(2)
    EvtBgmFadeIn(SONG_LYON, 8) // ENOSUPP in EAstdlib
    REMOVEPORTRAITS
    BACG(BG_THRONE_FLASHBACK)
    FAWU(2)
    BROWNBOXTEXT(0x20e, 8, 8)
    TEXTSHOW(0xbb7)
    TEXTEND
    REMA
    FAWI(16)
    REMOVEPORTRAITS
    BACG(BG_GRADO_CHAMBER_FLASHBACK)
    FAWU(16)
    TEXTSHOW(0xbb8)
    TEXTEND
    REMA
    EvtBgmFadeIn(SONG_SILENT, 8) // ENOSUPP in EAstdlib
    FAWI(2)
    CLEAN
    FAWU(2)
    MUSC(SONG_LOST_HEART)
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    SetBackground(BG_BLACK_TEMPLE_INSIDE)
    TEXTSHOW(0xbb9)
    TEXTEND
    FADI(16)
    REMA
    MNC2(0x22)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch20B_1[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_Ch20BEnemy_2)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_Ch20BEnemy_3)
    CALL(EventScr_LoadReinforceHardMode)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch20B_2[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_Ch20BEnemy_4)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_Ch20BEnemy_5)
    CALL(EventScr_LoadReinforceHardMode)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch20B_3[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    COUNTER_SET(0x0, 3)
    ENUF(10)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch20B_4[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch20BEnemy_6)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0x0)
    ENUF(10)
    COUNTER_CHECK(0x0)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(10)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch20B_5[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(12)
    COUNTER_SET(0x1, 6)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch20B_6[] = {
    ENUF(12)
    COUNTER_CHECK(0x1)
    SVAL(EVT_SLOT_7, 0x5)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x3)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_2, UnitDef_Ch20BEnemy_7)
    CALL(EventScr_LoadReinforce)
    COUNTER_CHECK(0x1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(12)
LABEL(0x0)
    COUNTER_DEC(0x1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch20B_7[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(14)
    COUNTER_SET(0x2, 6)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch20B_8[] = {
    ENUF(14)
    COUNTER_CHECK(0x2)
    SVAL(EVT_SLOT_7, 0x5)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x3)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_2, UnitDef_Ch20BEnemy_8)
    CALL(EventScr_LoadReinforce)
    COUNTER_CHECK(0x2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(14)
LABEL(0x0)
    COUNTER_DEC(0x2)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch20B_9[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(16)
    COUNTER_SET(0x3, 13)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch20B_10[] = {
    ENUF(16)
    COUNTER_CHECK(0x3)
    SVAL(EVT_SLOT_7, 0xb)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0xa)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x8)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x7)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x5)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x4)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x2)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    CAMERA2(11, 11)
    SVAL(EVT_SLOT_2, UnitDef_Ch20BEnemy_9)
    CALL(EventScr_LoadReinforce)
    COUNTER_CHECK(0x3)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(16)
LABEL(0x0)
    COUNTER_DEC(0x3)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch20B_11[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_Ch20BEnemy_10)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_Ch20BEnemy_11)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_Ch20BEnemy_12)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_Ch20BEnemy_13)
    CALL(EventScr_LoadReinforceHardMode)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch20B_12[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch20BEnemy_14)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};
