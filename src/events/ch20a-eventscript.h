#include "gbafe.h"

CONST_DATA EventListScr EventScr_Ch20a_BeginingScene[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C0EF0)
    CALL(EventScr_089F8AC8)
    LOAD1(0x1, UnitDef_088C0EF0)
    ENUN
    LOAD1(0x1, UnitDef_088C129C)
    ENUN
    SVAL(EVT_SLOT_2, UnitDef_088C12C4)
    SVAL(EVT_SLOT_3, 0x1)
    CALL(EventScr_LoadUnitForTutorial)
    CALL(EventScr_08591FD8)
    ENUT(10)
    ENUT(12)
    ENUT(14)
    ENUT(16)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8AC8[] = {
    SADD(EVT_SLOT_A, EVT_SLOT_2, EVT_SLOT_0)
    LOAD1(0x1, UnitDef_088C1634)
    ENUN
    FADU(16)
    MUSC(0x2d)
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x31)
    CALL(EventScr_SetBackground)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSHOW(0xba9)
    TEXTEND
    GOTO(0x1)
LABEL(0x0)
    TEXTSHOW(0xbaa)
    TEXTEND
LABEL(0x1)
    REMA
    MUSCSLOW(0x7fff)
    FADI(4)
    CLEAN
    CAMERA(29, 20)
    MUSC(0x4d)
    FADU(4)
    LOAD2(0x1, UnitDef_088C165C)
    ENUN
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x31)
    CALL(EventScr_SetBackground)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x2, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSHOW(0xbab)
    TEXTEND
    MUSC(0x26)
    TEXTCONT
    TEXTEND
    GOTO(0x3)
LABEL(0x2)
    TEXTSHOW(0xbac)
    TEXTEND
    MUSC(0x26)
    TEXTCONT
    TEXTEND
LABEL(0x3)
    REMA
    FADI(16)
    CLEAN
    CAMERA2(11, 12)
    SADD(EVT_SLOT_2, EVT_SLOT_A, EVT_SLOT_0)
    LOAD1(0x1, 0xffffffff)
    ENUN
    LOAD1(0x1, UnitDef_088C129C)
    ENUN
    REMU(CHARACTER_MORVA)
    FADU(16)
    STAL(15)
    STARTFADE
    EvtColorFadeSetup(0x6, 0xa, 8, 128, 128, 128) // ENOSUPP in EAstdlib
    SUMMONUNIT(CHARACTER_MORVA)
    EvtColorFadeSetup(0x6, 0xa, 8, 256, 256, 256) // ENOSUPP in EAstdlib
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x31)
    SVAL(EVT_SLOT_3, 0xbad)
    CALL(Event_TextWithBG)
    MOVE(0x10, CHARACTER_LYON, 11, 11)
    ENUN
    DISA(CHARACTER_LYON)
    FADI(16)
    CLEA
    CLEE
    CLEN
    ENDA
};

CONST_DATA EventListScr EventScr_089F8C60[] = {
    CAMERA2_CAHR(CHARACTER_RIEV)
    MUSC(0x15)
    CUMO_CHAR(CHARACTER_RIEV)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbae)
    TEXTEND
    REMA
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8C8C[] = {
    CALL(EventScr_089F8CCC)
    MUSC(0x2d)
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x34)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xbb6)
    TEXTEND
    FADI(16)
    REMA
    MNC2(0x15)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8CCC[] = {
    MUSCFAST(0x7fff)
    SVAL(EVT_SLOT_2, 0x33)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xbb3)
    TEXTEND
    REMA
    FADI(16)
    CLEA
    CLEE
    CLEN
    CLEAN
    LOAD2(0x1, UnitDef_088C16E8)
    ENUN
    CAMERA2_CAHR(CHARACTER_MYRRH)
    EvtBgmFadeIn(0x29, 8) // ENOSUPP in EAstdlib
    FADU(4)
    CUMO_CHAR(CHARACTER_MYRRH)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x31)
    CALL(EventScr_SetBackground)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSHOW(0xbb4)
    TEXTEND
    GOTO(0x1)
LABEL(0x0)
    TEXTSHOW(0xbb5)
    TEXTEND
LABEL(0x1)
    REMA
    MUSCMID(0x7fff)
    FADI(16)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x12000c)
    LOMA(0x15)
    FADU(16)
    LOAD1(0x1, UnitDef_088C172C)
    ENUN
    ENDA
};

CONST_DATA EventListScr EventScr_089F8D9C[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_088C1314)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088C1350)
    CALL(EventScr_LoadReinforceHardMode)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8DE0[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_088C1378)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088C13B4)
    CALL(EventScr_LoadReinforceHardMode)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8E24[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    COUNTER_SET(0x0, 3)
    ENUF(10)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8E44[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C13DC)
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

CONST_DATA EventListScr EventScr_089F8E78[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(12)
    COUNTER_SET(0x1, 6)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8E98[] = {
    ENUF(12)
    COUNTER_CHECK(0x1)
    SVAL(EVT_SLOT_7, 0x5)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x3)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_2, UnitDef_088C1418)
    CALL(EventScr_LoadReinforce)
    COUNTER_CHECK(0x1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(12)
LABEL(0x0)
    COUNTER_DEC(0x1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8F00[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(14)
    COUNTER_SET(0x2, 6)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8F20[] = {
    ENUF(14)
    COUNTER_CHECK(0x2)
    SVAL(EVT_SLOT_7, 0x5)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x3)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_2, UnitDef_088C1468)
    CALL(EventScr_LoadReinforce)
    COUNTER_CHECK(0x2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(14)
LABEL(0x0)
    COUNTER_DEC(0x2)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8F88[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(16)
    COUNTER_SET(0x3, 13)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8FA8[] = {
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
    SVAL(EVT_SLOT_2, UnitDef_088C14B8)
    CALL(EventScr_LoadReinforce)
    COUNTER_CHECK(0x3)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(16)
LABEL(0x0)
    COUNTER_DEC(0x3)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F9064[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_088C1508)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088C1558)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_088C1594)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_088C15BC)
    CALL(EventScr_LoadReinforceHardMode)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F90C8[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C15E4)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};
