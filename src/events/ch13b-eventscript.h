#include "gbafe.h"

CONST_DATA EventListScr EventScr_Ch13b_BeginningScene[] = {
    MUSC(SONG_53)
    LOAD2(0x1, UnitDef_088C5378)
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
    LOAD1(0x1, UnitDef_088C4FCC)
    ENUN
    FADU(16)
    LOAD1(0x1, UnitDef_088C4FA4)
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
    LOAD2(0x1, UnitDef_088C53A0)
    SVAL(EVT_SLOT_1, 0x0)
    SET_STATE(CHARACTER_EPHRAIM)
    SVAL(EVT_SLOT_1, 0x0)
    SET_STATE(CHARACTER_SETH)
    SVAL(EVT_SLOT_1, 0x0)
    SET_STATE(CHARACTER_LARACHEL)
    LOAD3(0x0, UnitDef_088C53F0)
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
    LOAD1(0x1, UnitDef_088C5508)
    ENUN
    CALL(EventScr_08591FD8)
    CAMERA(21, 0)
    MUSC(SONG_TENSION)
    FADU(16)
    LOAD1(0x1, UnitDef_088C5288)
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
    LOAD2(0x1, UnitDef_088C54A4)
    ENUN
    FADU(16)
    EVBIT_T(9)
    LOAD2(0x1, UnitDef_088C54A4)
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
    LOAD2(0x1, UnitDef_088C54CC)
    ENUN
    FADU(16)
    LOAD2(0x1, UnitDef_088C54CC)
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

CONST_DATA EventListScr EventScr_089FBC8C[] = {
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

CONST_DATA EventListScr EventScr_089FBCDC[] = {
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

CONST_DATA EventListScr EventScr_089FBD2C[] = {
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

CONST_DATA EventListScr EventScr_089FBD50[] = {
    MUSI
    TEXTSTART
    TEXTSHOW(0xaf6)
    TEXTEND
    REMA
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FBD70[] = {
    MUSI
    TEXTSTART
    TEXTSHOW(0xaf7)
    TEXTEND
    REMA
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FBD90[] = {
    MUSI
    Text_BG(BG_NORMAL_VILLAGE, 0xaf8)
    MUNO
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, ITEM_STAFF_BARRIER)
    GIVEITEMTO(CHAR_EVT_ACTIVE_UNIT)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FBDCC[] = {
    MUSI
    Text_BG(BG_NORMAL_VILLAGE, 0xaf9)
    MUNO
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, ITEM_BOOSTER_RES)
    GIVEITEMTO(CHAR_EVT_ACTIVE_UNIT)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FBE08[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C52C4)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FBE20[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C52EC)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FBE38[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C5314)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FBE50[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C5350)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FBE68[] = {
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0x80)
    EVBIT_T(7)
    ENDA
};
