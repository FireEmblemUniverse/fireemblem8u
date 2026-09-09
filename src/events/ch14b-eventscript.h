#include "gbafe.h"

CONST_DATA EventListScr EventScr_Ch14b_BeginningScene[] = {
    MUSC(SONG_4D)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(CHAPTER_3F)
    FADU(16)
    LOAD2(0x1, UnitDef_Ch14BAlly_3)
    ENUN
    MOVE_1STEP(0x8, CHARACTER_EPHRAIM, FACING_UP)
    ENUN
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xafa)
    TEXTEND
    FAWI(2)
    REMA
    REMOVEPORTRAITS
    BACG(BG_THRONE_FLASHBACK)
    EvtBgmFadeIn(SONG_LYON, 8) // ENOSUPP in EAstdlib
    FAWU(2)
    BROWNBOXTEXT(0x210, 8, 8)
    TEXTSHOW(0xafb)
    TEXTEND
    REMA
    EvtBgmFadeIn(SONG_SILENT, 8) // ENOSUPP in EAstdlib
    FAWI(2)
    CLEAN
    MUSCSLOW(SONG_4D)
    FAWU(2)
    MOVE_1STEP(0x8, CHARACTER_MYRRH, FACING_UP)
    ENUN
    TEXTSTART
    TEXTSHOW(0xafc)
    TEXTEND
    CHECK_EVBIT(3)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    EARTHQUAKE_START(0, 1)
    STAL(120)
    EARTHQUAKE_END
    TEXTCONT
    TEXTEND
LABEL(0x0)
    REMA
    MOVE(0x8, CHARACTER_EPHRAIM, 10, 4)
    STAL2(16)
    MOVE(0x8, CHARACTER_SETH, 10, 4)
    MOVE(0x8, CHARACTER_MYRRH, 10, 4)
    MUSCMID(SONG_SILENT)
    FADI(16)
    ENUN
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x2000f)
    LOMA(CHAPTER_I_14)
    LOAD1(0x1, UnitDef_Ch14BEnemy_0)
    ENUN
    FADU(4)
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xafd)
    TEXTEND
    REMA
    SOUN(SONG_B1)
    TILECHANGE(0x0)
    LOAD1(0x1, UnitDef_Ch14BEnemy_10)
    ENUN
    CUMO_CHAR(CHARACTER_SOLDIER_83)
    STAL(60)
    CURE
    MUSC(SONG_SOLVE_THE_RIDDLE)
    TEXTSTART
    TEXTSHOW(0xafe)
    TEXTEND
    REMA
    MOVE(0x0, CHARACTER_SOLDIER_83, 14, 9)
    ENUN
    TILEREVERT(0x0)
    DISA(CHARACTER_SOLDIER_83)
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xaff)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    DISA(CHARACTER_LYON)
    FADI(16)
    LOAD1(0x1, UnitDef_Ch14BEnemy_1)
    ENUN
    CALL(EventScr_CommonPrep)
    ENUT(13)
    ENUT(16)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch14B_0[] = {
    CUMO_CHAR(CHARACTER_RENNAC)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb00)
    TEXTEND
    REMA
    ENDA
};

CONST_DATA EventListScr EventScr_Ch14b_EndingScene[] = {
    MUSCMID(SONG_SILENT)
    FADI(16)
    SVAL(EVT_SLOT_2, CHARACTER_RENNAC)
    CALL(EventScr_StrictLoadUniqueAlly)
    CLEA
    CLEE
    CLEN
    TILECHANGE(0x0)
    CAMERA2(14, 4)
    LOAD2(0x1, UnitDef_Ch14BMixed)
    ENUN
    FADU(16)
    STARTFADE
    EvtColorFadeSetup(0x6, 0xa, 4, 128, 128, 128) // ENOSUPP in EAstdlib
    EvtColorFadeSetup(0x1d, 0x1, 2, 0, 0, 0) // ENOSUPP in EAstdlib
    SOUN(SONG_D6)
    SVAL(EVT_SLOT_2, 0x6b)
    CALL(EventScr_UnitFlushingOUT)
    DISA(CHARACTER_VIGARDE)
    EvtColorFadeSetup(0x6, 0xa, 8, 256, 256, 256) // ENOSUPP in EAstdlib
    ENDFADE
    MOVE_1STEP(0x10, CHARACTER_EPHRAIM, FACING_UP)
    ENUN
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb05)
    TEXTEND
    REMA
    MOVE(0x10, CHARACTER_EPHRAIM, 14, 10)
    STAL2(32)
    MOVE(0x10, CHARACTER_SETH, 15, 10)
    STAL2(16)
    FADI(16)
    ENUN
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(CHAPTER_46)
    LOAD1(0x1, UnitDef_Ch14BEnemy_15)
    ENUN
    FADU(16)
    LOAD2(0x1, UnitDef_Ch14BAlly_4)
    ENUN
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    SetBackground(BG_CASTLE_DARK)
    TEXTSHOW(0xb06)
    TEXTEND
    MUSC(SONG_LOST_HEART)
    TEXTCONT
    TEXTEND
    REMA
    CALL(EventScr_TextShowWithFadeIn)
    MUSCFAST(SONG_SILENT)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    DISA(CHARACTER_LYON)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb07)
    TEXTEND
    REMA
    LOAD2(0x1, UnitDef_Ch14BAlly_5)
    ENUN
    CUMO_CHAR(CHARACTER_FRELIAN)
    STAL(60)
    CURE
    MUSC(SONG_INTO_THE_SHADOW_OF_VICTORY)
    TEXTSTART
    TEXTSHOW(0xb08)
    TEXTEND
    REMA
    LOAD2(0x1, UnitDef_Ch14BAlly_6)
    STAL2(15)
    FADI(16)
    ENUN
    CLEA
    CLEE
    CLEN
    CAMERA(26, 13)
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_Ch14BAlly_7)
    ENUN
    FADU(16)
    LOAD2(0x1, UnitDef_Ch14BAlly_7)
    ENUN
    SOUN(SONG_B1)
    TILECHANGE(0x0)
    LOAD2(0x1, UnitDef_Ch14BAlly_8)
    ENUN
    STAL(15)
    CAMERA(26, 0)
    MOVE_1STEP(0x8, CHARACTER_KNOLL, FACING_DOWN)
    ENUN
    CUMO_CHAR(CHARACTER_KNOLL)
    STAL(60)
    CURE
    SetBackground(BG_CELL)
    TEXTSHOW(0xb09)
    TEXTEND
    EvtBgmFadeIn(SONG_SILENT, 8) // ENOSUPP in EAstdlib
    FAWI(2)
    REMA
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(CHAPTER_4B)
    UNIT_COLORS(0x4)
    LOAD2(0x1, UnitDef_Ch14BAlly_10)
    ENUN
    FAWU(2)
    BROWNBOXTEXT(0x20e, 8, 8)
    LOAD2(0x1, UnitDef_Ch14BAlly_9)
    ENUN
    CUMO_CHAR(CHARACTER_KNOLL)
    STAL(60)
    CURE
    MUSCSLOW(SONG_LOST_HEART)
    Text_BG(BG_STONE_FLASHBACK, 0xb0a)
    LOAD2(0x1, UnitDef_Ch14BAlly_11)
    ENUN
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    Text_BG(BG_STONE_FLASHBACK, 0xb0b)
    LOAD2(0x1, UnitDef_Ch14BAlly_12)
    ENUN
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_CallBreakStone)
    CUMO_CHAR(CHARACTER_KNOLL)
    STAL(60)
    CURE
    SetBackground(BG_STONE_FLASHBACK)
    TEXTSHOW(0xb0c)
    TEXTEND
    REMA
    EvtBgmFadeIn(SONG_SILENT, 8) // ENOSUPP in EAstdlib
    FAWI(2)
    CLEA
    CLEE
    CLEN
    UNIT_COLORS(0x0)
    SVAL(EVT_SLOT_B, 0x1a)
    LOMA(CHAPTER_46)
    TILECHANGE(0x0)
    LOAD2(0x1, UnitDef_Ch14BAlly_7)
    ENUN
    LOAD2(0x1, UnitDef_Ch14BAlly_8)
    ENUN
    MOVE_1STEP(0xffff, CHARACTER_KNOLL, FACING_DOWN)
    MUSCSLOW(SONG_INTO_THE_SHADOW_OF_VICTORY)
    FAWU(2)
    CUMO_CHAR(CHARACTER_KNOLL)
    STAL(60)
    CURE
    SetBackground(BG_CELL)
    TEXTSHOW(0xb0d)
    TEXTEND
    FADI(16)
    REMA
    CLEA
    CLEE
    CLEN
    LOAD1(0x1, UnitDef_Ch14BAlly_1)
    ENUN
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(CHAPTER_4D)
    FADU(16)
    LOAD2(0x1, UnitDef_Ch14BAlly_13)
    ENUN
    CUMO_CHAR(CHARACTER_KNOLL)
    STAL(60)
    CURE
    SetBackground(BG_STONE_CHAMBER)
    TEXTSHOW(0xb0e)
    TEXTEND
    REMA
    SetBackground(BG_STONE_CHAMBER)
    TEXTSHOW(0xb0f)
    TEXTEND
    REMA
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x4a)
    GIVEITEMTO(CHARACTER_EPHRAIM)
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x93)
    GIVEITEMTO(CHARACTER_EPHRAIM)
    FADI(16)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x4000e)
    LOMA(CHAPTER_I_14)
    TILECHANGE(0x0)
    LOAD2(0x1, UnitDef_Ch14BAlly_2)
    ENUN
    MUSC(SONG_RAID)
    FADU(16)
    LOAD2(0x1, UnitDef_Ch14BNPC)
    ENUN
    CUMO_CHAR(CHARACTER_MESSENGER)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb10)
    TEXTEND
    REMA
    FADI(16)
    ENUT(118)
    MNCH(0x1c)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch14B_1[] = {
    CALL(EventScr_Ch14A_9)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch14B_2[] = {
    SVAL(EVT_SLOT_2, 0xa)
    SVAL(EVT_SLOT_3, 0x1c)
    SVAL(EVT_SLOT_4, 0x26fc)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0xb11)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xb12)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xb14)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xb15)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xb16)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xb13)
    SENQUEUE1
    CALL(EventScr_9EEAAC)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch14B_3[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch14BEnemy_2)
    CALL(EventScr_LoadReinforce)
    CALL(EventScr_Ch14B_0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch14B_4[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch14BEnemy_3)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_Ch14BEnemy_11)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch14B_5[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch14BEnemy_4)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_Ch14BEnemy_12)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch14B_6[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch14BEnemy_5)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_Ch14BEnemy_13)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch14B_7[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch14BEnemy_6)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_Ch14BEnemy_14)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch14B_8[] = {
    COUNTER_SET(0x0, 2)
    CHECK_TUTORIAL
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_HARD
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    COUNTER_SET(0x0, 4)
LABEL(0x0)
    ENUF(13)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch14B_9[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch14BEnemy_7)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0x0)
    ENUF(13)
    COUNTER_CHECK(0x0)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(13)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch14B_10[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch14BEnemy_8)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_Ch14BEnemy_9)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch14B_11[] = {
    COUNTER_SET(0x1, 1)
    ENUF(16)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch14B_12[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch14BEnemy_8)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_Ch14BEnemy_9)
    CALL(EventScr_LoadReinforceHardMode)
    COUNTER_DEC(0x1)
    ENUF(16)
    COUNTER_CHECK(0x1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(16)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};
