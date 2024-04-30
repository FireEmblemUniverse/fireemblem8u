#include "gbafe.h"

CONST_DATA EventListScr EventScr_Ch18a_BeginingScene[] = {
    LOAD1(0x1, UnitDef_088BF0EC)
    ENUN
    SVAL(EVT_SLOT_2, UnitDef_088BF4D4)
    SVAL(EVT_SLOT_3, 0x1)
    CALL(EventScr_LoadUnitForTutorial)
    CALL(EventScr_089F7E6C)
    ENDA
};

CONST_DATA EventListScr EventScr_089F7E6C[] = {
    MUSC(0x49)
    SVAL(EVT_SLOT_2, 0x32)
    CALL(EventScr_SetBackground)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSHOW(0xb7a)
    TEXTEND
    MUSCMID(0x7fff)
    TEXTCONT
    TEXTEND
    MUSC(0x2c)
    TEXTCONT
    TEXTEND
    GOTO(0x1)
LABEL(0x0)
    TEXTSHOW(0xb7b)
    TEXTEND
    MUSCMID(0x7fff)
    TEXTCONT
    TEXTEND
    MUSC(0x2c)
    TEXTCONT
    TEXTEND
LABEL(0x1)
    REMA
    MUSCMID(0x7fff)
    FADI(16)
    CLEAN
    FADU(16)
    LOAD2(0x1, UnitDef_088BF330)
    ENUN
    MUSC(0x49)
    CUMO_CHAR(CHARACHER_FRELIAN)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x32)
    SVAL(EVT_SLOT_3, 0xb7c)
    CALL(Event_TextWithBG)
    CAMERA2(12, 15)
    STAL(60)
    CAMERA(0, 27)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    MUSC(0x25)
    SVAL(EVT_SLOT_2, 0x32)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb7d)
    TEXTEND
    REMA
    FADI(16)
    CLEN
    CALL(EventScr_08591FD8)
    ENUT(8)
    ENUT(10)
    ENUT(12)
    ENUT(14)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F7F88[] = {
    MUSC(0x49)
    FADI(16)
    CAMERA2(14, 14)
    CLEA
    CLEE
    CLEN
    LOAD2(0x1, UnitDef_088BF3D0)
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
    MUSCMID(0x2c)
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
    MUSCFAST(0x7fff)
    TEXTCONT
    TEXTEND
    MUSC(0x2d)
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
    MUSCSLOW(0x7fff)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    LOAD2(0x1, UnitDef_088BF45C)
    ENUN
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    MUSC(0x32)
    TEXTSTART
    TEXTSHOW(0xb84)
    TEXTEND
    REMA
    FADI(4)
    SVAL(EVT_SLOT_2, 0x32)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb8a)
    TEXTEND
    REMA
    MNCH(0x13)
    ENDA
};

CONST_DATA EventListScr EventScr_089F81BC[] = {
    CHECK_EVENTID(6)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(3)
    CALL(EventScr_089F7F88)
    ENDB
};

CONST_DATA EventListScr EventScr_089F81D8[] = {
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F81E4[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(8)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8200[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BF560)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8218[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(10)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8234[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BF59C)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F824C[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(12)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8268[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BF5D8)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_088BF628)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F8290[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(14)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F82AC[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BF650)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_088BF68C)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};
