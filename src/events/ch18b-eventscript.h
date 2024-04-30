#include "gbafe.h"

CONST_DATA EventListScr EventScr_Ch18b_BeginingScene[] = {
    LOAD1(0x1, UnitDef_088C8BDC)
    ENUN
    SVAL(EVT_SLOT_2, UnitDef_088C8F24)
    SVAL(EVT_SLOT_3, 0x1)
    CALL(EventScr_LoadUnitForTutorial)
    CALL(EventScr_089F7E6C)
    ENUT(8)
    ENUT(10)
    ENUT(12)
    ENUT(14)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch18b_EndingScene[] = {
    MUSC(0x49)
    FADI(16)
    CLEA
    CLEE
    CLEN
    CAMERA2(14, 14)
    LOAD2(0x1, UnitDef_088C8E20)
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
    MOVE_1STEP(0x0, CHARACTER_EPHRAIM, FACING_RIGHT)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    DISA(CHARACTER_LYON)
    MOVE_1STEP(0x0, CHARACTER_EIRIKA, FACING_RIGHT)
    MOVE(0x0, CHARACTER_EPHRAIM, 18, 9)
    STAL2(20)
    FADI(16)
    ENUN
    CAMERA(22, 0)
    SPAWN_ENEMY(CHARACTER_LYON, 19, 1)
    MOVE(0x0, CHARACTER_EPHRAIM, 19, 4)
    FADU(16)
    ENUN
    MUSC(0x2d)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb85)
    TEXTEND
    REMA
    MOVE_1STEP(0x0, CHARACTER_EPHRAIM, FACING_UP)
    ENUN
    GLOWINGCROSS(CHARACTER_EPHRAIM)
    STAL(30)
    GLOWINGCROSS_END
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb86)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    SVAL(EVT_SLOT_2, 0x40)
    MOVE_CLOSEST(0xffff, CHAR_EVT_SLOT2, 19, 2)
    CALL(EventScr_UnitWarpIN)
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb87)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_CallBreakStone)
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb88)
    TEXTEND
    MUSCFAST(0x7fff)
    TEXTCONT
    TEXTEND
    MUSC(0x2c)
    TEXTCONT
    TEXTEND
    REMA
    MUSCSLOW(0x7fff)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    LOAD2(0x1, UnitDef_088C8EAC)
    ENUN
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xb89)
    TEXTEND
    MUSC(0x32)
    TEXTCONT
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x32)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb8a)
    TEXTEND
    REMA
    MNCH(0x20)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD268[] = {
    CHECK_EVENTID(6)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(3)
    CALL(EventScr_Ch18b_EndingScene)
    ENDB
};

CONST_DATA EventListScr EventScr_089FD284[] = {
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD290[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(8)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD2AC[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C8FB0)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD2C4[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(10)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD2E0[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C8FEC)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD2F8[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(12)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD314[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C9028)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_088C9078)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD33C[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(14)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FD358[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C90A0)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_088C90DC)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};
