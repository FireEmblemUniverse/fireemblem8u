#include "gbafe.h"

CONST_DATA EventListScr EventScr_Ch21b_BeginingScene[] = {
    CALL(EventScr_089F9144)
    SVAL(EVT_SLOT_2, 0x6c)
    CALL(EventScr_UnitWarpOUT)
    DISA(CHARACTER_LYON_FINAL)
    FADI(16)
    LOAD1(0x1, UnitDef_088CB164)
    ENUN
    CALL(EventScr_08591FD8)
    ENUT(11)
    ENUT(12)
    ENUT(13)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch21b_EndingScene[] = {
    MUSCSLOW(0x7fff)
    FADI(4)
    CLEA
    CLEE
    CLEN
    CAMERA2(11, 4)
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_088CB614)
    ENUN
    FADU(4)
    LOAD2(0x1, UnitDef_088CB614)
    ENUN
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbc6)
    TEXTEND
    MUSCSLOW(0x44)
    TEXTCONT
    TEXTEND
    REMA
    MUSCMID(0x7fff)
    CALL(EventScr_089F9314)
    MNC3(0x23)
    ENDA
};

CONST_DATA EventListScr EventScr_089FDA2C[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(11)
    COUNTER_SET(0x0, 1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FDA4C[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CB448)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0x0)
    ENUF(11)
    COUNTER_CHECK(0x0)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(11)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FDA80[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(12)
    COUNTER_SET(0x1, 1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FDAA0[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CB4C0)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0x1)
    ENUF(12)
    COUNTER_CHECK(0x1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(12)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FDAD4[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(13)
    COUNTER_SET(0x2, 10)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FDAF4[] = {
    SVAL(EVT_SLOT_2, UnitDef_088CB524)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0x2)
    ENUF(13)
    COUNTER_CHECK(0x2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(13)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FDB28[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xb1)
    EVBIT_T(7)
    ENDA
};
