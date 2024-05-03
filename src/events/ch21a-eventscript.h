#include "gbafe.h"

CONST_DATA EventListScr EventScr_Ch21a_BeginingScene[] = {
    CALL(EventScr_089F9144)
    CUMO_CHAR(CHARACTER_LYON_FINAL)
    STAL(60)
    CURE
    MUSC(0x2d)
    TEXTSTART
    TEXTSHOW(0xbbd)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x6c)
    CALL(EventScr_UnitWarpOUT)
    DISA(CHARACTER_LYON_FINAL)
    FADI(16)
    LOAD1(0x1, UnitDef_088C1920)
    ENUN
    CALL(EventScr_08591FD8)
    ENUT(11)
    ENUT(12)
    ENUT(13)
    ENDA
};

CONST_DATA EventListScr EventScr_089F9144[] = {
    REMOVEPORTRAITS
    BACG(0x35)
    FAWI(2)
    BACG(0x14)
    FAWU(2)
    MUSCSLOW(0x2c)
    BROWNBOXTEXT(0x20f, 8, 8)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSHOW(0xbba)
    TEXTEND
    GOTO(0x1)
LABEL(0x0)
    TEXTSHOW(0xbbb)
    TEXTEND
LABEL(0x1)
    REMA
    EvtBgmFadeIn(0x7fff, 8) // ENOSUPP in EAstdlib
    FAWI(2)
    CLEAN
    LOAD1(0x1, UnitDef_088C172C)
    ENUN
    FAWU(2)
    LOAD2(0x1, UnitDef_088C1DD0)
    ENUN
    MOVE(0x10, CHAR_EVT_PLAYER_LEADER, 11, 20)
    ENUN
    CUMO_CHAR(CHAR_EVT_PLAYER_LEADER)
    STAL(60)
    CURE
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0xa, EVT_SLOT_C, EVT_SLOT_1)
    MUSC(0x44)
    TEXTSTART
    TEXTSHOW(0xbbc)
    TEXTEND
    REMA
    GOTO(0xb)
LABEL(0xa)
    TEXTSTART
    TEXTSHOW(0xbbe)
    TEXTEND
    REMA
LABEL(0xb)
    STARTFADE
    MUSCSLOW(0x7fff)
    EvtColorFadeSetup(0x6, 0xa, 8, 128, 128, 128) // ENOSUPP in EAstdlib
    EvtColorFadeSetup(0x1d, 0x1, 4, 0, 0, 0) // ENOSUPP in EAstdlib
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitFlushingOUT)
    DISA(CHARACTER_LYON)
    STAL(30)
    SPAWN_ENEMY(CHARACTER_LYON_FINAL, 0, 0)
    EvtColorFadeSetup(0x1d, 0x1, 0, 256, 256, 256) // ENOSUPP in EAstdlib
    SVAL(EVT_SLOT_2, 0x6c)
    MOVE_CLOSEST(0xffff, CHAR_EVT_SLOT2, 11, 18)
    CALL(EventScr_UnitFlushingIN)
    EvtColorFadeSetup(0x6, 0xa, 8, 256, 256, 256) // ENOSUPP in EAstdlib
    ENDA
};

CONST_DATA EventListScr EventScr_089F92A0[] = {
    MUSCSLOW(0x7fff)
    FADI(4)
    CLEA
    CLEE
    CLEN
    CAMERA2(11, 4)
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_088C1E48)
    ENUN
    FADU(4)
    LOAD2(0x1, UnitDef_088C1E48)
    ENUN
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xbc5)
    TEXTEND
    MUSCSLOW(0x44)
    TEXTCONT
    TEXTEND
    REMA
    MUSCMID(0x7fff)
    CALL(EventScr_089F9314)
    MNC3(0x16)
    ENDA
};

CONST_DATA EventListScr EventScr_089F9314[] = {
    STARTFADE
    EvtColorFadeSetup(0x6, 0xa, 4, 0, 0, 0) // ENOSUPP in EAstdlib
    STAL(30)
    MOVE_1STEP(0x2, CHARACTER_LYON, FACING_UP)
    ENUN
    STAL2(30)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    DISA(CHARACTER_LYON)
    TEXTSTART
    TEXTSHOW(0xbc7)
    TEXTEND
    REMA
    SOLOTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0x80ffff)
    TEXTSHOW(0xbc8)
    TEXTEND
    REMA
    ENDA
};

CONST_DATA EventListScr EventScr_089F9380[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(11)
    COUNTER_SET(0x0, 1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F93A0[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C1C04)
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

CONST_DATA EventListScr EventScr_089F93D4[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(12)
    COUNTER_SET(0x1, 1)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F93F4[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C1C7C)
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

CONST_DATA EventListScr EventScr_089F9428[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(13)
    COUNTER_SET(0x2, 10)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F9448[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C1CE0)
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

CONST_DATA EventListScr EventScr_089F947C[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xb1)
    EVBIT_T(7)
    ENDA
};
