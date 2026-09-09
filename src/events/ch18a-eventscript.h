#include "gbafe.h"

CONST_DATA EventListScr EventScr_Ch18a_BeginningScene[] = {
    LOAD1(0x1, UnitDef_Ch18AEnemy_0)
    ENUN
    SVAL(EVT_SLOT_2, UnitDef_Ch18AEnemy_1)
    SVAL(EVT_SLOT_3, 0x1)
    CALL(EventScr_LoadUnitForTutorial)
    CALL(EventScr_Ch18A_11)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch18A_11[] = {
    MUSC(SONG_49)
    SetBackground(BG_VOLCANO)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSHOW(0xb7a)
    TEXTEND
    MUSCMID(SONG_SILENT)
    TEXTCONT
    TEXTEND
    MUSC(SONG_LYON)
    TEXTCONT
    TEXTEND
    GOTO(0x1)
LABEL(0x0)
    TEXTSHOW(0xb7b)
    TEXTEND
    MUSCMID(SONG_SILENT)
    TEXTCONT
    TEXTEND
    MUSC(SONG_LYON)
    TEXTCONT
    TEXTEND
LABEL(0x1)
    REMA
    MUSCMID(SONG_SILENT)
    FADI(16)
    CLEAN
    FADU(16)
    LOAD2(0x1, UnitDef_Ch18AMixed)
    ENUN
    MUSC(SONG_49)
    CUMO_CHAR(CHARACTER_FRELIAN)
    STAL(60)
    CURE
    Text_BG(BG_VOLCANO, 0xb7c)
    CAMERA2(12, 15)
    STAL(60)
    CAMERA(0, 27)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    MUSC(SONG_TENSION)
    SetBackground(BG_VOLCANO)
    TEXTSHOW(0xb7d)
    TEXTEND
    REMA
    FADI(16)
    CLEN
    CALL(EventScr_CommonPrep)
    ENUT(8)
    ENUT(10)
    ENUT(12)
    ENUT(14)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch18A_0[] = {
    MUSC(SONG_49)
    FADI(16)
    CAMERA2(14, 14)
    CLEA
    CLEE
    CLEN
    LOAD2(0x1, UnitDef_Ch18AAlly_1)
    ENUN
    FADU(16)
    SPAWN_ENEMY(CHARACTER_LYON, 0, 0)
    SVAL(EVT_SLOT_2, 0x40)
    MOVE_CLOSEST(0xffff, CHAR_EVT_SLOT2, 18, 11)
    CALL(EventScr_UnitWarpIN)
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb7e)
    TEXTEND
    REMA
    MOVE_1STEP(0x0, CHARACTER_EIRIKA, FACING_RIGHT)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    MOVE(0x0, CHARACTER_EIRIKA, 16, 13)
    STAL2(16)
    MOVE(0x0, CHARACTER_EPHRAIM, 14, 13)
    ENUN
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb7f)
    TEXTEND
    REMA
    MOVE(0x0, CHARACTER_EIRIKA, 18, 9)
    STAL2(20)
    FADI(16)
    ENUN
    CAMERA(22, 0)
    MOVE(0x0, CHARACTER_EIRIKA, 16, 4)
    FADU(16)
    ENUN
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    MUSCMID(SONG_LYON)
    TEXTSTART
    TEXTSHOW(0xb80)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x40)
    MOVE_CLOSEST(0xffff, CHAR_EVT_SLOT2, 19, 4)
    CALL(EventScr_UnitWarpIN)
    MOVE_1STEP(0x0, CHARACTER_EIRIKA, FACING_RIGHT)
    ENUN
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb81)
    TEXTEND
    REMA
    MOVE_1STEP(0x10, CHARACTER_EIRIKA, FACING_RIGHT)
    ENUN
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb82)
    TEXTEND
    MUSCFAST(SONG_SILENT)
    TEXTCONT
    TEXTEND
    MUSC(SONG_LOST_HEART)
    TEXTCONT
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    SVAL(EVT_SLOT_2, 0x40)
    MOVE_CLOSEST(0xffff, CHAR_EVT_SLOT2, 19, 1)
    CALL(EventScr_UnitWarpIN)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_CallBreakStone)
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb83)
    TEXTEND
    REMA
    MUSCSLOW(SONG_SILENT)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    LOAD2(0x1, UnitDef_Ch18AAlly_2)
    ENUN
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    MUSC(SONG_INTO_THE_SHADOW_OF_VICTORY)
    TEXTSTART
    TEXTSHOW(0xb84)
    TEXTEND
    REMA
    FADI(4)
    SetBackground(BG_VOLCANO)
    TEXTSHOW(0xb8a)
    TEXTEND
    REMA
    MNCH(0x13)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch18A_1[] = {
    CHECK_EVENTID(6)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(3)
    CALL(EventScr_Ch18A_0)
    ENDB
};

CONST_DATA EventListScr EventScr_Ch18A_2[] = {
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch18A_3[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(8)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch18A_4[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch18AEnemy_2)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch18A_5[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(10)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch18A_6[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch18AEnemy_3)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch18A_7[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(12)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch18A_8[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch18AEnemy_4)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_Ch18AEnemy_5)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch18A_9[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(14)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch18A_10[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch18AEnemy_6)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_Ch18AEnemy_7)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};
