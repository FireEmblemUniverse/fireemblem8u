#pragma once

#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "eventscript.h"
#include "eventcall.h"
#include "EAstdlib.h"
#include "mapanim.h"
#include "bmio.h"
#include "ending_details.h"
#include "constants/characters.h"
#include "constants/chapters.h"
#include "constants/songs.h"

CONST_DATA EventListScr EventScr_Ruin_59[] = {
    CHECK_CHAPTER_NUMBER
LABEL(0x0)
    SDEQUEUE(EVT_SLOT_7)
    SDEQUEUE(EVT_SLOT_2)
    BNE(0x0, EVT_SLOT_7, EVT_SLOT_C)
    CALL(0xffffffff)
    ENDA
};

CONST_DATA EventListScr EventScr_SkirmishCommonBeginning[] = {
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x4)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_60)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x7)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_62)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xb)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_64)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xd)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_66)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x11)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_68)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x12)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_70)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x18)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_72)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1a)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_74)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1e)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_68)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1f)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_70)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x39)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_76)
    SENQUEUE1
    CALL(EventScr_Ruin_59)
    TILECHANGE(0xfffd)
    LOAD4(0x1, 0x0)
    ENUN
    CALL(EventScr_CommonPrep)
    ENDA
};

CONST_DATA EventListScr EventScr_SkirmishCommonEnd[] = {
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x4)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_61)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x7)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_63)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xb)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_65)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xd)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_67)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x11)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_69)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x12)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_71)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x18)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_73)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1a)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_75)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1e)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_69)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1f)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_71)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x39)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_77)
    SENQUEUE1
    CALL(EventScr_Ruin_59)
    MNCH(0xffff)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_60[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x2)
    SENQUEUE1
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_61[] = {
    SVAL(EVT_SLOT_2, 0x7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_62[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_63[] = {
    SVAL(EVT_SLOT_2, 0xb)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_64[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x2)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x3)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x4)
    SENQUEUE1
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_65[] = {
    SVAL(EVT_SLOT_2, 0xd)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_66[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_67[] = {
    SVAL(EVT_SLOT_2, 0x11)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_68[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x2)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x3)
    SENQUEUE1
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_69[] = {
    SVAL(EVT_SLOT_2, 0x12)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_70[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    VCWF(0)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_71[] = {
    SVAL(EVT_SLOT_2, 0x14)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_72[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x2)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x3)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x6)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x7)
    SENQUEUE1
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_73[] = {
    SVAL(EVT_SLOT_2, 0x1a)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_74[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x4)
    SENQUEUE1
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_75[] = {
    SVAL(EVT_SLOT_2, 0x39)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_76[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xf)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_77[] = {
    SVAL(EVT_SLOT_2, 0x4)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_83[] = {
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_84[] = {
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_78[] = {
    ASMC(StartCharacterEndings)
    STAL(1)
    ENDA
};

CONST_DATA EventListScr EventScr_EirikaModeGameEnd[] = {
    EVBIT_MODIFY(0x2)
    MUSC(SONG_MAIN_THEME_REPRISE)
    SVAL(EVT_SLOT_2, UnitDef_UnusedAlly_1)
    SVAL(EVT_SLOT_3, 0xc19)
    CALL(EventScr_Ruin_79)
    CHECK_ALIVE(CHARACTER_JOSHUA)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    LOAD2(0x1, UnitDef_UnusedAlly_3)
    ENUN
    SVAL(EVT_SLOT_B, 0x17)
    LOMA(CHAPTER_E_15)
    FADU(16)
    BROWNBOXTEXT(0x65d, 8, 8)
    MOVE_1STEP(0x8, CHARACTER_JOSHUA, FACING_DOWN)
    ENUN
    CUMO_CHAR(CHARACTER_JOSHUA)
    STAL(60)
    CURE
    TEXTSHOW(0xc1a)
    TEXTEND
    GOTO(0x1)
LABEL(0x0)
    LOAD2(0x1, UnitDef_UnusedAlly_4)
    ENUN
    SVAL(EVT_SLOT_B, 0x17)
    LOMA(CHAPTER_E_15)
    FADU(16)
    BROWNBOXTEXT(0x65d, 8, 8)
    MOVE_1STEP(0x8, CHARACTER_MYRRH, FACING_DOWN)
    ENUN
    CUMO_CHAR(CHARACTER_MYRRH)
    STAL(60)
    CURE
    TEXTSHOW(0xc1b)
    TEXTEND
LABEL(0x1)
    FADI(4)
    REMA
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_2, UnitDef_UnusedAlly_19)
    SVAL(EVT_SLOT_3, 0xc1c)
    CALL(EventScr_Ruin_80)
    SVAL(EVT_SLOT_2, UnitDef_UnusedAlly_6)
    SVAL(EVT_SLOT_3, 0xc1d)
    CALL(EventScr_Ruin_81)
    CALL(EventScr_Ruin_82)
    ENDA
};

CONST_DATA EventListScr EventScr_EphraimModeGameEnd[] = {
    EVBIT_MODIFY(0x2)
    MUSC(SONG_MAIN_THEME_REPRISE)
    SVAL(EVT_SLOT_2, UnitDef_UnusedAlly_2)
    SVAL(EVT_SLOT_3, 0xc1e)
    CALL(EventScr_Ruin_79)
    LOAD2(0x1, UnitDef_UnusedAlly_5)
    ENUN
    SVAL(EVT_SLOT_B, 0x8000c)
    LOMA(CHAPTER_E_12)
    FADU(16)
    BROWNBOXTEXT(0x65b, 8, 8)
    TEXTSTART
    MOVE_1STEP(0x8, CHARACTER_MYRRH, FACING_DOWN)
    ENUN
    CUMO_CHAR(CHARACTER_MYRRH)
    STAL(60)
    CURE
    TEXTSHOW(0xc1f)
    TEXTEND
    FADI(4)
    REMA
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_2, UnitDef_UnusedAlly_20)
    SVAL(EVT_SLOT_3, 0xc20)
    CALL(EventScr_Ruin_80)
    SVAL(EVT_SLOT_2, UnitDef_UnusedAlly_7)
    SVAL(EVT_SLOT_3, 0xc21)
    CALL(EventScr_Ruin_81)
    CALL(EventScr_Ruin_82)
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_79[] = {
    LOAD2(0x1, UnitDef_UnusedMixed)
    ENUN
    LOAD2(0x1, 0xffffffff)
    ENUN
    SVAL(EVT_SLOT_B, 0xc0011)
    LOMA(CHAPTER_E_19)
    FADU(16)
    BROWNBOXTEXT(0x667, 8, 8)
    MOVE_1STEP(0x8, CHARACTER_LARACHEL, FACING_DOWN)
    ENUN
    CUMO_CHAR(CHARACTER_LARACHEL)
    STAL(60)
    CURE
    TEXTSTART
    SADD(EVT_SLOT_2, EVT_SLOT_3, EVT_SLOT_0)
    TEXTSHOW(0xffff)
    TEXTEND
    FADI(4)
    REMA
    CLEA
    CLEE
    CLEN
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_80[] = {
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_UnusedAlly_18)
    ENUN
    LOAD2(0x1, 0xffffffff)
    ENUN
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(CHAPTER_40)
    FADU(16)
    BROWNBOXTEXT(0x664, 8, 8)
    CUMO_CHAR(CHARACTER_INNES)
    STAL(60)
    CURE
    SADD(EVT_SLOT_2, EVT_SLOT_3, EVT_SLOT_0)
    TEXTSTART
    TEXTSHOW(0xffff)
    TEXTEND
    REMA
    LOAD2(0x1, UnitDef_UnusedAlly_18)
    STAL2(32)
    FADI(4)
    ENUN
    CLEA
    CLEE
    CLEN
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_81[] = {
    SVAL(EVT_SLOT_B, 0x5000e)
    LOMA(CHAPTER_E_16)
    FADU(4)
    LOAD2(0x1, 0xffffffff)
    ENUN
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    TEXTSTART
    SADD(EVT_SLOT_2, EVT_SLOT_3, EVT_SLOT_0)
    TEXTSHOW(0xffff)
    TEXTEND
    EvtBgmFadeIn(SONG_SILENT, 8) // ENOSUPP in EAstdlib
    FADI(2)
    REMA
    CLEA
    CLEE
    CLEN
    ENDA
};

CONST_DATA EventListScr EventScr_Ruin_82[] = {
    EVBIT_F(2)
    ASMC(BMapDispSuspend)
    MUSC(SONG_FLY_WITH_THE_BREEZE)
    ASMC(StartEndingCredits)
    STAL(90)
    EvtTextStartType2 // ENOSUPP in EAstdlib
    EvtBgFadeIn(0x0, 0, 2) // ENOSUPP in EAstdlib
    TEXTSHOW(0xc22)
    TEXTEND
    EvtBgmFadeIn(SONG_SILENT, 8) // ENOSUPP in EAstdlib
    FADI(2)
    REMA
    EVBIT_F(2)
    STAL(120)
    ASMC(StartEndingTurnRecordScreen)
    STAL(1)
    CALL(EventScr_Ruin_78)
    STAL(90)
    MNTS(0x0)
    ENDA
};
