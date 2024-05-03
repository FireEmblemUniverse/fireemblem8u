#include "gbafe.h"

CONST_DATA EventListScr EventScr_Ch14b_BeginingScene[] = {
    MUSC(0x4d)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x3f)
    FADU(16)
    LOAD2(0x1, UnitDef_088C68B8)
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
    BACG(0xf)
    EvtBgmFadeIn(0x2c, 8) // ENOSUPP in EAstdlib
    FAWU(2)
    BROWNBOXTEXT(0x210, 8, 8)
    TEXTSHOW(0xafb)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7fff, 8) // ENOSUPP in EAstdlib
    FAWI(2)
    CLEAN
    MUSCSLOW(0x4d)
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
    MUSCMID(0x7fff)
    FADI(16)
    ENUN
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x2000f)
    LOMA(0x1b)
    LOAD1(0x1, UnitDef_088C60C0)
    ENUN
    FADU(4)
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xafd)
    TEXTEND
    REMA
    SOUN(0xb1)
    TILECHANGE(0x0)
    LOAD1(0x1, UnitDef_088C6660)
    ENUN
    CUMO_CHAR(CHARACTER_SOLDIER_83)
    STAL(60)
    CURE
    MUSC(0x2e)
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
    LOAD1(0x1, UnitDef_088C60FC)
    ENUN
    CALL(EventScr_08591FD8)
    ENUT(13)
    ENUT(16)
    ENDA
};

CONST_DATA EventListScr EventScr_089FC04C[] = {
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
    MUSCMID(0x7fff)
    FADI(16)
    SVAL(EVT_SLOT_2, 0x1c)
    CALL(EventScr_9EE5BC)
    CLEA
    CLEE
    CLEN
    TILECHANGE(0x0)
    CAMERA2(14, 4)
    LOAD2(0x1, UnitDef_088C6688)
    ENUN
    FADU(16)
    STARTFADE
    EvtColorFadeSetup(0x6, 0xa, 4, 128, 128, 128) // ENOSUPP in EAstdlib
    EvtColorFadeSetup(0x1d, 0x1, 2, 0, 0, 0) // ENOSUPP in EAstdlib
    SOUN(0xd6)
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
    LOMA(0x46)
    LOAD1(0x1, UnitDef_088C6A24)
    ENUN
    FADU(16)
    LOAD2(0x1, UnitDef_088C69E8)
    ENUN
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x11)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb06)
    TEXTEND
    MUSC(0x2d)
    TEXTCONT
    TEXTEND
    REMA
    CALL(EventScr_TextShowWithFadeIn)
    MUSCFAST(0x7fff)
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
    LOAD2(0x1, UnitDef_088C6A4C)
    ENUN
    CUMO_CHAR(CHARACHER_FRELIAN)
    STAL(60)
    CURE
    MUSC(0x32)
    TEXTSTART
    TEXTSHOW(0xb08)
    TEXTEND
    REMA
    LOAD2(0x1, UnitDef_088C6A74)
    STAL2(15)
    FADI(16)
    ENUN
    CLEA
    CLEE
    CLEN
    CAMERA(26, 13)
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_088C6AC4)
    ENUN
    FADU(16)
    LOAD2(0x1, UnitDef_088C6AC4)
    ENUN
    SOUN(0xb1)
    TILECHANGE(0x0)
    LOAD2(0x1, UnitDef_088C6B28)
    ENUN
    STAL(15)
    CAMERA(26, 0)
    MOVE_1STEP(0x8, CHARACTER_KNOLL, FACING_DOWN)
    ENUN
    CUMO_CHAR(CHARACTER_KNOLL)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x17)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb09)
    TEXTEND
    EvtBgmFadeIn(0x7fff, 8) // ENOSUPP in EAstdlib
    FAWI(2)
    REMA
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x4b)
    UNIT_COLORS(0x4)
    LOAD2(0x1, UnitDef_088C6C04)
    ENUN
    FAWU(2)
    BROWNBOXTEXT(0x20e, 8, 8)
    LOAD2(0x1, UnitDef_088C6BDC)
    ENUN
    CUMO_CHAR(CHARACTER_KNOLL)
    STAL(60)
    CURE
    MUSCSLOW(0x2d)
    SVAL(EVT_SLOT_2, 0x2d)
    SVAL(EVT_SLOT_3, 0xb0a)
    CALL(Event_TextWithBG)
    LOAD2(0x1, UnitDef_088C6C40)
    ENUN
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x2d)
    SVAL(EVT_SLOT_3, 0xb0b)
    CALL(Event_TextWithBG)
    LOAD2(0x1, UnitDef_088C6C7C)
    ENUN
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_CallBreakStone)
    CUMO_CHAR(CHARACTER_KNOLL)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x2d)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb0c)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7fff, 8) // ENOSUPP in EAstdlib
    FAWI(2)
    CLEA
    CLEE
    CLEN
    UNIT_COLORS(0x0)
    SVAL(EVT_SLOT_B, 0x1a)
    LOMA(0x46)
    TILECHANGE(0x0)
    LOAD2(0x1, UnitDef_088C6AC4)
    ENUN
    LOAD2(0x1, UnitDef_088C6B28)
    ENUN
    MOVE_1STEP(0xffff, CHARACTER_KNOLL, FACING_DOWN)
    MUSCSLOW(0x32)
    FAWU(2)
    CUMO_CHAR(CHARACTER_KNOLL)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x17)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb0d)
    TEXTEND
    FADI(16)
    REMA
    CLEA
    CLEE
    CLEN
    LOAD1(0x1, UnitDef_088C6444)
    ENUN
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x4d)
    FADU(16)
    LOAD2(0x1, UnitDef_088C6CA4)
    ENUN
    CUMO_CHAR(CHARACTER_KNOLL)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x2c)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb0e)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x2c)
    CALL(EventScr_SetBackground)
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
    LOMA(0x1b)
    TILECHANGE(0x0)
    LOAD2(0x1, UnitDef_088C66D8)
    ENUN
    MUSC(0x26)
    FADU(16)
    LOAD2(0x1, UnitDef_088C6778)
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

CONST_DATA EventListScr EventScr_089FC520[] = {
    CALL(EventScr_089F619C)
    ENDA
};

CONST_DATA EventListScr EventScr_089FC52C[] = {
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

CONST_DATA EventListScr EventScr_089FC5A0[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C646C)
    CALL(EventScr_LoadReinforce)
    CALL(EventScr_089FC04C)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FC5C0[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C6494)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088C67A0)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FC5E8[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C64D0)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088C67DC)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FC610[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C650C)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088C6818)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FC638[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C6548)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088C6854)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FC660[] = {
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

CONST_DATA EventListScr EventScr_089FC690[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C6584)
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

CONST_DATA EventListScr EventScr_089FC6C4[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C65C0)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_088C6610)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FC6EC[] = {
    COUNTER_SET(0x1, 1)
    ENUF(16)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FC6FC[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C65C0)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_088C6610)
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
