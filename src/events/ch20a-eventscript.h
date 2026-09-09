#include "gbafe.h"

CONST_DATA EventListScr EventScr_Ch20a_BeginningScene[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch20AEnemy_0)
    CALL(EventScr_Ch19A_12)
    LOAD1(0x1, UnitDef_Ch20AEnemy_0)
    ENUN
    LOAD1(0x1, UnitDef_Ch20AEnemy_1)
    ENUN
    SVAL(EVT_SLOT_2, UnitDef_Ch20AEnemy_2)
    SVAL(EVT_SLOT_3, 0x1)
    CALL(EventScr_LoadUnitForTutorial)
    CALL(EventScr_CommonPrep)
    ENUT(10)
    ENUT(12)
    ENUT(14)
    ENUT(16)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch19A_12[] = {
    SADD(EVT_SLOT_A, EVT_SLOT_2, EVT_SLOT_0)
    LOAD1(0x1, UnitDef_Ch20AEnemy_16)
    ENUN
    FADU(16)
    MUSC(SONG_LOST_HEART)
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    SetBackground(BG_DARKLING_WOODS)
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
    MUSCSLOW(SONG_SILENT)
    FADI(4)
    CLEAN
    CAMERA(29, 20)
    MUSC(SONG_4D)
    FADU(4)
    LOAD2(0x1, UnitDef_Ch20AAlly_1)
    ENUN
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    SetBackground(BG_DARKLING_WOODS)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x2, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSHOW(0xbab)
    TEXTEND
    MUSC(SONG_RAID)
    TEXTCONT
    TEXTEND
    GOTO(0x3)
LABEL(0x2)
    TEXTSHOW(0xbac)
    TEXTEND
    MUSC(SONG_RAID)
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
    LOAD1(0x1, UnitDef_Ch20AEnemy_1)
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
    Text_BG(BG_DARKLING_WOODS, 0xbad)
    MOVE(0x10, CHARACTER_LYON, 11, 11)
    ENUN
    DISA(CHARACTER_LYON)
    FADI(16)
    CLEA
    CLEE
    CLEN
    ENDA
};

CONST_DATA EventListScr EventScr_Ch20A_13[] = {
    CAMERA2_CAHR(CHARACTER_RIEV)
    MUSC(SONG_FROM_THE_DARKNESS)
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

CONST_DATA EventListScr EventScr_Ch20A_0[] = {
    CALL(EventScr_Ch20A_14)
    MUSC(SONG_LOST_HEART)
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    SetBackground(BG_BLACK_TEMPLE_INSIDE)
    TEXTSHOW(0xbb6)
    TEXTEND
    FADI(16)
    REMA
    MNC2(0x15)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch20A_14[] = {
    MUSCFAST(SONG_SILENT)
    SetBackground(BG_BLACK_TEMPLE_OUTSIDE)
    TEXTSHOW(0xbb3)
    TEXTEND
    REMA
    FADI(16)
    CLEA
    CLEE
    CLEN
    CLEAN
    LOAD2(0x1, UnitDef_Ch20AAlly_2)
    ENUN
    CAMERA2_CAHR(CHARACTER_MYRRH)
    EvtBgmFadeIn(SONG_SORROW, 8) // ENOSUPP in EAstdlib
    FADU(4)
    CUMO_CHAR(CHARACTER_MYRRH)
    STAL(60)
    CURE
    SetBackground(BG_DARKLING_WOODS)
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
    MUSCMID(SONG_SILENT)
    FADI(16)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x12000c)
    LOMA(CHAPTER_E_21)
    FADU(16)
    LOAD1(0x1, UnitDef_Ch21AEnemy)
    ENUN
    ENDA
};

CONST_DATA EventListScr EventScr_Ch20A_1[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_Ch20AEnemy_3)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_Ch20AEnemy_4)
    CALL(EventScr_LoadReinforceHardMode)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch20A_2[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_Ch20AEnemy_5)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_Ch20AEnemy_6)
    CALL(EventScr_LoadReinforceHardMode)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch20A_3[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    COUNTER_SET(0x0, 3)
    ENUF(10)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch20A_4[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch20AEnemy_7)
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

CONST_DATA EventListScr EventScr_Ch20A_5[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(12)
    COUNTER_SET(0x1, 6)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch20A_6[] = {
    ENUF(12)
    COUNTER_CHECK(0x1)
    SVAL(EVT_SLOT_7, 0x5)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x3)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_2, UnitDef_Ch20AEnemy_8)
    CALL(EventScr_LoadReinforce)
    COUNTER_CHECK(0x1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(12)
LABEL(0x0)
    COUNTER_DEC(0x1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch20A_7[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(14)
    COUNTER_SET(0x2, 6)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch20A_8[] = {
    ENUF(14)
    COUNTER_CHECK(0x2)
    SVAL(EVT_SLOT_7, 0x5)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x3)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_2, UnitDef_Ch20AEnemy_9)
    CALL(EventScr_LoadReinforce)
    COUNTER_CHECK(0x2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(14)
LABEL(0x0)
    COUNTER_DEC(0x2)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch20A_9[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(16)
    COUNTER_SET(0x3, 13)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch20A_10[] = {
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
    SVAL(EVT_SLOT_2, UnitDef_Ch20AEnemy_10)
    CALL(EventScr_LoadReinforce)
    COUNTER_CHECK(0x3)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(16)
LABEL(0x0)
    COUNTER_DEC(0x3)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch20A_11[] = {
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 0x1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, UnitDef_Ch20AEnemy_11)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_Ch20AEnemy_12)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_Ch20AEnemy_13)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_Ch20AEnemy_14)
    CALL(EventScr_LoadReinforceHardMode)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch20A_12[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch20AEnemy_15)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};
