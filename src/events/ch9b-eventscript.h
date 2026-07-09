#include "gbafe.h"

CONST_DATA EventListScr EventScr_Ch9b_BeginningScene[] = {
    MUSC(SONG_SOLVE_THE_RIDDLE)
    SVAL(EVT_SLOT_2, 0xa9e)
    SVAL(EVT_SLOT_3, 0xa9f)
    SVAL(EVT_SLOT_4, 0xaa0)
    CALL(EventScr_Ch8_11)
    CAMERA2(19, 9)
    FADU(16)
    LOAD1(0x1, UnitDef_Ch9BEnemy_9)
    ENUN
    CUMO_CHAR(CHARACTER_DUESSEL)
    STAL(60)
    CURE
    SetBackground(BG_GRADO_CHAMBER)
    TEXTSHOW(0xaa1)
    TEXTEND
    REMA
    FADI(16)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0xa0012)
    LOMA(CHAPTER_I_9)
    LOAD1(0x1, UnitDef_Ch9BEnemy_0)
    ENUN
    LOAD1(0x1, UnitDef_Ch9BEnemy_8)
    ENUN
    SVAL(EVT_SLOT_B, 0x3000c)
    TILECHANGE(0xffff)
    MUSCMID(SONG_SILENT)
    FADU(16)
    LOAD2(0x1, UnitDef_Ch9BMixed_1)
    ENUN
    CUMO_CHAR(CHARACTER_GHEB)
    STAL(60)
    CURE
    MUSC(SONG_TENSION)
    SetBackground(BG_INTERIOR_BROWN)
    TEXTSHOW(0xaa2)
    TEXTEND
    REMA
    FADI(16)
    CLEA
    CLEE
    CLEN
    SetBackground(BG_CASTLE_BACK)
    TEXTSHOW(0xaa3)
    TEXTEND
    REMA
    FADI(16)
    CLEAN
    CAMERA(0, 0)
    LOAD1(0x1, UnitDef_Ch9BEnemy_0)
    ENUN
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD1(0x1, UnitDef_Ch9BEnemy_7)
    ENUN
    FADU(16)
    SVAL(EVT_SLOT_1, 0x1)
    SET_STATE(CHARACTER_EPHRAIM)
    LOAD3(0x0, UnitDef_Ch9BAlly)
    ENUN
    DISA(CHARACTER_SOLDIER_83)
    LOAD1(0x1, UnitDef_Ch9BEnemy_7)
    ENUN
    FADI(16)
    CLEA
    CLEE
    CLEN
    LOAD1(0x1, UnitDef_Ch9BEnemy_0)
    ENUN
    LOAD1(0x1, UnitDef_Ch9BEnemy_8)
    ENUN
    CAMERA2(17, 10)
    FADU(16)
    CUMO_CHAR(CHARACTER_SOLDIER_83)
    STAL(60)
    CURE
    MUSC(SONG_SOLVE_THE_RIDDLE)
    Text_BG(BG_INTERIOR_BROWN, 0xaa4)
    MOVE_1STEP(0x10, CHARACTER_GHEB, FACING_DOWN)
    ENUN
    CUMO_CHAR(CHARACTER_GHEB)
    STAL(60)
    CURE
    Text_BG(BG_INTERIOR_BROWN, 0xaa5)
    MOVE_1STEP(0x10, CHARACTER_GHEB, FACING_UP)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x256)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x216)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    MOVE_DEFINED(CHARACTER_AMELIA)
    ENUN
    CUMO_CHAR(CHARACTER_AMELIA)
    STAL(60)
    CURE
    Text_BG(BG_INTERIOR_BROWN, 0xaa6)
    MOVE_1STEP(0x8, CHARACTER_AMELIA, FACING_DOWN)
    ENUN
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x10215)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x10295)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x10296)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    MOVE_DEFINED(CHARACTER_SOLDIER_83)
    ENUN
    CUMO_CHAR(CHARACTER_AMELIA)
    STAL(60)
    CURE
    Text_BG(BG_INTERIOR_BROWN, 0xaa7)
    MOVE(0x10, CHARACTER_SOLDIER_83, 23, 15)
    MOVE(0x10, CHARACTER_AMELIA, 23, 15)
    LOAD1(0x1, UnitDef_Ch9BEnemy_1)
    STAL2(30)
    FADI(16)
    ENUN
    CLEA
    CLEE
    CLEN
    LOAD1(0x1, UnitDef_Ch9BEnemy_0)
    ENUN
    LOAD1(0x1, UnitDef_Ch9BEnemy_1)
    ENUN
    LOAD1(0x1, UnitDef_Ch9BEnemy_2)
    ENUN
    CALL(EventScr_CommonPrep)
    MUSC(SONG_DETERMINATION)
    CAMERA2(8, 4)
    FADU(16)
    LOAD1(0x1, UnitDef_Ch9BMixed_0)
    ENUN
    SVAL(EVT_SLOT_B, 0x3000c)
    TILEREVERT(0xffff)
    CUMO_CHAR(CHARACTER_TANA)
    STAL(60)
    CURE
    MUSI
    Text_BG(BG_CELL, 0xaa8)
    MUNO
    ENUT(18)
    ENUT(12)
    ENUT(16)
    ENUT(14)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch9b_EndingScene[] = {
    MUSC(SONG_VICTORY)
    SetBackground(BG_INTERIOR_BROWN)
    TEXTSHOW(0xaac)
    TEXTEND
    REMA
    FADI(16)
    SVAL(EVT_SLOT_2, CHARACTER_AMELIA)
    CALL(EventScr_StrictLoadUniqueAlly)
    CLEAN
    CAMERA2(17, 9)
    CLEA
    CLEE
    CLEN
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_Ch9BMixed_2)
    ENUN
    FADU(16)
    LOAD2(0x1, UnitDef_Ch9BMixed_2)
    ENUN
    MOVE_1STEP(0x10, CHARACTER_EPHRAIM, FACING_DOWN)
    ENUN
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    SetBackground(BG_INTERIOR_BROWN)
    TEXTSHOW(0xaad)
    TEXTEND
    MUSCFAST(SONG_SILENT)
    TEXTCONT
    TEXTEND
    MUSC(SONG_INTO_THE_SHADOW_OF_VICTORY)
    TEXTCONT
    TEXTEND
    REMA
    FADI(4)
    SetBackground(BG_CASTLE_BACK)
    TEXTSHOW(0xaae)
    TEXTEND
    REMA
    SetBackground(BG_PLAIN_1)
    MUSI
    TEXTSHOW(0xaaf)
    TEXTEND
    REMA
    MUSCMID(SONG_SILENT)
    SVAL(EVT_SLOT_2, 0x2000f)
    CALL(EventScr_9EEA58)
    LOAD1(0x1, UnitDef_Ch9BEnemy_10)
    ENUN
    MUSC(SONG_SOLVE_THE_RIDDLE)
    FADU(16)
    TILECHANGE(0x0)
    LOAD1(0x1, UnitDef_Ch9BEnemy_11)
    ENUN
    CUMO_CHAR(CHARACTER_VIGARDE)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xab0)
    TEXTEND
    REMA
    ENUT(113)
    MNCH(0x18)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch9B_0[] = {
    MUSS(0x30)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0xab2)
    TEXTEND
    REMA
    MURE(0x2)
    CUSA(CHARACTER_AMELIA)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch9B_1[] = {
    MUSS(0x30)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0xab1)
    TEXTEND
    SOUN(SONG_2D9)
    TEXTCONT
    TEXTEND
    REMA
    MURE(0x2)
    CUSA(CHARACTER_AMELIA)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch9B_2[] = {
    MUSS(0x30)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0xab3)
    TEXTEND
    REMA
    MURE(0x2)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch9B_3[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0x81)
    COUNTER_SET(0x0, 1)
    ENUF(18)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch9B_4[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch9BEnemy_3)
    CALL(EventScr_LoadReinforceHardMode)
    COUNTER_DEC(0x0)
    ENUF(18)
    COUNTER_CHECK(0x0)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(18)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch9B_5[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    COUNTER_SET(0x1, 2)
    ENUF(12)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch9B_6[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch9BEnemy_4)
    CALL(EventScr_LoadReinforceHardMode)
    COUNTER_DEC(0x1)
    ENUF(12)
    COUNTER_CHECK(0x1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(12)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch9B_7[] = {
    COUNTER_SET(0x2, 2)
    ENUF(16)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch9B_8[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch9BEnemy_5)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0x2)
    ENUF(16)
    COUNTER_CHECK(0x2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(16)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch9B_9[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    COUNTER_SET(0x3, 1)
    CHECK_TUTORIAL
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_HARD
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    COUNTER_SET(0x3, 3)
LABEL(0x0)
    ENUF(14)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch9B_10[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch9BEnemy_6)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0x3)
    ENUF(14)
    COUNTER_CHECK(0x3)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(14)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};
