#include "gbafe.h"

CONST_DATA EventListScr EventScr_Ch13b_BeginningScene[] = {
    MUSC(SONG_53)
    LOAD2(0x1, UnitDef_Ch13BAlly_2)
    ENUN
    DISA(CHARACTER_MYRRH)
    CUMO_AT(17, 13)
    STAL(60)
    CURE
    MUSI
    SetBackground(BG_NORMAL_VILLAGE)
    TEXTSHOW(0xaea)
    TEXTEND
    MUSC(SONG_LEGACY)
    TEXTCONT
    TEXTEND
    FADI(4)
    REMA
    SetBackground(BG_NORMAL_VILLAGE)
    TEXTSHOW(0xaeb)
    TEXTEND
    MUSC(SONG_SORROW)
    TEXTCONT
    TEXTEND
    MUSC(SONG_TENSION)
    TEXTCONT
    TEXTEND
    REMA
    FADI(16)
    CLEAN
    CAMERA2(12, 12)
    LOAD1(0x1, UnitDef_Ch13BEnemy_1)
    ENUN
    FADU(16)
    LOAD1(0x1, UnitDef_Ch13BEnemy_0)
    ENUN
    CUMO_CHAR(CHARACTER_SELENA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xaec)
    TEXTEND
    REMA
    FADI(16)
    CAMERA(0, 0)
    FADU(16)
    LOAD2(0x1, UnitDef_Ch13BAlly_3)
    SVAL(EVT_SLOT_1, 0x0)
    SET_STATE(CHARACTER_EPHRAIM)
    SVAL(EVT_SLOT_1, 0x0)
    SET_STATE(CHARACTER_SETH)
    SVAL(EVT_SLOT_1, 0x0)
    SET_STATE(CHARACTER_LARACHEL)
    LOAD3(0x0, UnitDef_Ch13BAlly_4)
    ENUN
    SVAL(EVT_SLOT_1, 0xffffffff)
    SET_STATE(CHARACTER_EPHRAIM)
    SVAL(EVT_SLOT_1, 0xffffffff)
    SET_STATE(CHARACTER_SETH)
    SVAL(EVT_SLOT_1, 0xffffffff)
    SET_STATE(CHARACTER_LARACHEL)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    SetBackground(BG_STREAM)
    TEXTSHOW(0xaed)
    TEXTEND
    REMA
    FADI(16)
    LOAD1(0x1, UnitDef_Ch13BEnemy_6)
    ENUN
    CALL(EventScr_CommonPrep)
    CAMERA(21, 0)
    MUSC(SONG_TENSION)
    FADU(16)
    LOAD1(0x1, UnitDef_Ch13BAlly_1)
    ENUN
    CUMO_CHAR(CHARACTER_GERIK)
    STAL(60)
    CURE
    SetBackground(BG_PLAIN_2)
    TEXTSHOW(0xaee)
    TEXTEND
    REMA
    FADI(16)
    CLEAN
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_Ch13BAlly_5)
    ENUN
    FADU(16)
    EVBIT_T(9)
    LOAD2(0x1, UnitDef_Ch13BAlly_5)
    ENUN
    EVBIT_F(9)
    CUMO_CHAR(CHARACTER_MYRRH)
    STAL(60)
    CURE
    SetBackground(BG_STREAM)
    TEXTSHOW(0xaef)
    TEXTEND
    REMA
    FADI(16)
    DISA(CHARACTER_MYRRH)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch13b_EndingScene[] = {
    MUSCMID(SONG_SILENT)
    FADI(16)
    CLEA
    CLEE
    CLEN
    CAMERA2(14, 13)
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_Ch13BAlly_6)
    ENUN
    FADU(16)
    LOAD2(0x1, UnitDef_Ch13BAlly_6)
    ENUN
    CUMO_CHAR(CHARACTER_MYRRH)
    STAL(60)
    CURE
    MUSC(SONG_INTO_THE_SHADOW_OF_VICTORY)
    SetBackground(BG_STREAM)
    TEXTSHOW(0xaf2)
    TEXTEND
    REMA
    FADI(16)
    CLEA
    CLEE
    CLEN
    ENUT(117)
    MNCH(0x1b)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch13B_0[] = {
    CHECK_EVENTID(2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_2, 0xf)
    CALL(EventScr_UnTriggerIfNotUnit)
    MUSI
    TEXTSTART
    TEXTSHOW(0xaf3)
    TEXTEND
    REMA
    MUNO
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch13B_1[] = {
    CHECK_EVENTID(2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_2, 0x1d)
    CALL(EventScr_UnTriggerIfNotUnit)
    MUSI
    TEXTSTART
    TEXTSHOW(0xaf4)
    TEXTEND
    REMA
    MUNO
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch13B_2[] = {
    MUSS(0x30)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0xaf5)
    TEXTEND
    REMA
    MURE(0x2)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch13B_3[] = {
    MUSI
    TEXTSTART
    TEXTSHOW(0xaf6)
    TEXTEND
    REMA
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch13B_4[] = {
    MUSI
    TEXTSTART
    TEXTSHOW(0xaf7)
    TEXTEND
    REMA
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch13B_5[] = {
    MUSI
    Text_BG(BG_NORMAL_VILLAGE, 0xaf8)
    MUNO
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x59)
    GIVEITEMTO(CHAR_EVT_ACTIVE_UNIT)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch13B_6[] = {
    MUSI
    Text_BG(BG_NORMAL_VILLAGE, 0xaf9)
    MUNO
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x61)
    GIVEITEMTO(CHAR_EVT_ACTIVE_UNIT)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch13B_7[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch13BEnemy_2)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch13B_8[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch13BEnemy_3)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch13B_9[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch13BEnemy_4)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch13B_10[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch13BEnemy_5)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch13B_11[] = {
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0x80)
    EVBIT_T(7)
    ENDA
};
