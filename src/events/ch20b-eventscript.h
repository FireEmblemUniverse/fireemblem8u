#include "gbafe.h"

CONST_DATA EventListScr EventScr_Ch20b_BeginingScene[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CA7B8)
    CALL(EventScr_089F8AC8)
    LOAD1(0x1, UnitDef_088CA7B8)
    ENUN
    LOAD1(0x1, UnitDef_088CAB64)
    ENUN
    SVAL(EVT_SLOT_2, UnitDef_088CAF88)
    SVAL(EVT_SLOT_3, 0x1)
    CALL(EventScr_LoadUnitForTutorial)
    CALL(EventScr_08591FD8)
    ENUT(10)
    ENUT(12)
    ENUT(14)
    ENUT(16)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD578[] = {
    CALL(EventScr_089F8C60)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch20b_EndingScene[] = {
    CALL(EventScr_089F8CCC)
    STAL(30)
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    FAWI(2)
    EvtBgmFadeIn(0x2c, 8) // ENOSUPP in EAstdlib
    REMOVEPORTRAITS
    BACG(0xf)
    FAWU(2)
    BROWNBOXTEXT(0x20e, 8, 8)
    TEXTSHOW(0xbb7)
    TEXTEND
    REMA
    FAWI(16)
    REMOVEPORTRAITS
    BACG(0xd)
    FAWU(16)
    TEXTSHOW(0xbb8)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7fff, 8) // ENOSUPP in EAstdlib
    FAWI(2)
    CLEAN
    FAWU(2)
    MUSC(0x2d)
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x34)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xbb9)
    TEXTEND
    FADI(16)
    REMA
    MNC2(0x22)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD630[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_088CAB8C)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088CABC8)
    CALL(EventScr_LoadReinforceHardMode)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD674[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_088CABF0)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088CAC2C)
    CALL(EventScr_LoadReinforceHardMode)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD6B8[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    COUNTER_SET(0x0, 3)
    ENUF(10)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD6D8[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CAC54)
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

CONST_DATA EventListScr EventScr_089FD70C[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(12)
    COUNTER_SET(0x1, 6)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD72C[] = {
    ENUF(12)
    COUNTER_CHECK(0x1)
    SVAL(EVT_SLOT_7, 0x5)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x3)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_2, UnitDef_088CAC90)
    CALL(EventScr_LoadReinforce)
    COUNTER_CHECK(0x1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(12)
LABEL(0x0)
    COUNTER_DEC(0x1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD794[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(14)
    COUNTER_SET(0x2, 6)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD7B4[] = {
    ENUF(14)
    COUNTER_CHECK(0x2)
    SVAL(EVT_SLOT_7, 0x5)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x3)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_2, UnitDef_088CACE0)
    CALL(EventScr_LoadReinforce)
    COUNTER_CHECK(0x2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(14)
LABEL(0x0)
    COUNTER_DEC(0x2)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD81C[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(16)
    COUNTER_SET(0x3, 13)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD83C[] = {
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
    SVAL(EVT_SLOT_2, UnitDef_088CAD30)
    CALL(EventScr_LoadReinforce)
    COUNTER_CHECK(0x3)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(16)
LABEL(0x0)
    COUNTER_DEC(0x3)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD8F8[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_088CAD80)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088CADD0)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_088CAE0C)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_088CAE34)
    CALL(EventScr_LoadReinforceHardMode)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD95C[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CAE5C)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};
