#include "gbafe.h"

CONST_DATA EventListScr EventScr_Ch11b_BeginingScene[] = {
    MUSC(0x2e)
    VCWF(0)
    SVAL(EVT_SLOT_2, 0x2000f)
    CALL(EventScr_9EEA58)
    LOAD1(0x1, UnitDef_088C451C)
    ENUN
    FADU(16)
    SPAWN_ENEMY(CHARACTER_SELENA, 14, 9)
    ENUN
    TILECHANGE(0x0)
    MOVE(0x10, CHARACTER_SELENA, 14, 5)
    ENUN
    CUMO_CHAR(CHARACTER_SELENA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xace)
    TEXTEND
    REMA
    MUSCMID(0x7fff)
    FADI(16)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x3e)
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_088C42B0)
    ENUN
    MUSC(0x4b)
    FADU(4)
    STAL(15)
    CUMO_CHAR(CHARACTER_MYRRH)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x8)
    SVAL(EVT_SLOT_3, 0xacf)
    CALL(Event_TextWithBG)
    LOAD2(0x1, UnitDef_088C42EC)
    ENUN
    CUMO_CHAR(CHARACTER_SETH)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x8)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xad0)
    TEXTEND
    REMA
    FADI(16)
    CLEAN
    VCWF(65535)
    TILECHANGE(0x0)
    LOAD1(0x1, UnitDef_088C3F40)
    ENUN
    SPAWN_ENEMY(CHARACTER_RIEV, 16, 13)
    FADU(16)
    CAMERA(20, 18)
    CUMO_CHAR(CHARACTER_RIEV)
    STAL(60)
    CURE
    MUSC(0x26)
    TEXTSTART
    TEXTSHOW(0xad1)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x57)
    CALL(EventScr_UnitWarpOUT)
    DISA(CHARACTER_RIEV)
    CALL(EventScr_08591FD8)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB1E4[] = {
    MUSC(0x11)
    CAMERA_CAHR(CHARACTER_EPHRAIM)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x8)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xad2)
    TEXTEND
    REMA
    FADI(16)
    TILEREVERT(0x0)
    TILECHANGE(0x1)
    CLEAN
    CAMERA2(9, 9)
    TEXTSTART
    LOAD1(0x1, UnitDef_088C4058)
    ENUN
    LOAD1(0x1, UnitDef_088C415C)
    ENUN
    FADU(16)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB250[] = {
    MUSC(0x11)
    CAMERA2(9, 9)
    EARTHQUAKE_START(0, 1)
    STAL(30)
    TILECHANGE(0x2)
    STAL(30)
    EARTHQUAKE_END
    CAMERA_CAHR(CHARACTER_EPHRAIM)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xad3)
    TEXTEND
    REMA
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB294[] = {
    MUSC(0x11)
    CAMERA_CAHR(CHARACTER_EPHRAIM)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x8)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xad4)
    TEXTEND
    REMA
    FADI(16)
    TILECHANGE(0x3)
    CLEAN
    CAMERA2(12, 10)
    TEXTSTART
    EARTHQUAKE_START(0, 1)
    FADU(16)
    STAL(32)
    EARTHQUAKE_END
    LOAD1(0x1, UnitDef_088C401C)
    ENUN
    CUMO_CHAR(CHARACTER_LARACHEL)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xad5)
    TEXTEND
    REMA
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch11b_EndingScene[] = {
    MUSC(0x31)
    SVAL(EVT_SLOT_2, 0x8)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xad6)
    TEXTEND
    FADI(4)
    REMA
    FADU(16)
    TEXTSHOW(0xad7)
    TEXTEND
    CHECK_ALIVE(CHARACTER_DOZLA)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    EvtTextShow2(0xad8) // ENOSUPP in EAstdlib
    TEXTEND
LABEL(0x0)
    REMA
    FADI(16)
    SVAL(EVT_SLOT_2, 0x19)
    CALL(EventScr_LoadUniqueAlly)
    SVAL(EVT_SLOT_2, 0x1a)
    CALL(EventScr_LoadUniqueAlly)
    ENUT(115)
    MNC2(0x19)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB394[] = {
    MUSS(0x30)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0xad9)
    TEXTEND
    REMA
    MURE(0x2)
    CUSA(CHARACTER_LARACHEL)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB3BC[] = {
    MUSS(0x30)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0xada)
    TEXTEND
    REMA
    MURE(0x2)
    CUSA(CHARACTER_DOZLA)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB3E4[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C4224)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB3FC[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C4260)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088C4328)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_088C4364)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_088C43A0)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB444[] = {
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xb0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB458[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C43F0)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088C442C)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB480[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C4490)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088C44CC)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB4A8[] = {
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xb9)
    SVAL(EVT_SLOT_1, 0x11200)
    CHAI(CHARACTER_MONSTER_BA)
    SVAL(EVT_SLOT_1, 0x10b00)
    CHAI(0xb1)
    EVBIT_T(7)
    ENDA
};
