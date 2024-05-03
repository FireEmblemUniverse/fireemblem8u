#include "gbafe.h"

CONST_DATA EventListScr EventScr_Ch12b_BeginingScene[] = {
    MUSC(0x24)
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_088C4D0C)
    ENUN
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_088C4D5C)
    ENUN
    FADU(16)
    CUMO_CHAR(CHARACTER_SETH)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x8)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xadb)
    TEXTEND
    FADI(4)
    REMA
    CLEAN
    CAMERA2(7, 7)
    FADU(16)
    LOAD1(0x1, UnitDef_088C4D84)
    ENUN
    CUMO_CHAR(CHARACTER_SALEH)
    STAL(60)
    CURE
    MUSI
    SVAL(EVT_SLOT_2, 0x7)
    SVAL(EVT_SLOT_3, 0xadc)
    CALL(Event_TextWithBG)
    MOVE(0x10, CHARACTER_SALEH, 8, 12)
    ENUN
    DISA(CHARACTER_SALEH)
    CUMO_CHAR(CHARACTER_EWAN)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xadd)
    TEXTEND
    REMA
    MOVE(0x10, CHARACTER_EWAN, 5, 5)
    ENUN
    DISA(CHARACTER_EWAN)
    FADI(16)
    MUNO
    CAMERA2(7, 17)
    FADU(16)
    MOVE_1STEP(0x8, CHARACTER_MYRRH, FACING_UP)
    ENUN
    CUMO_CHAR(CHARACTER_MYRRH)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x8)
    SVAL(EVT_SLOT_3, 0xade)
    CALL(Event_TextWithBG)
    MUSCMID(0x7fff)
    LOAD2(0x1, UnitDef_088C4D0C)
    ENUN
    DISA(CHARACTER_MYRRH)
    LOAD1(0x1, UnitDef_088C47BC)
    LOAD2(0x1, UnitDef_088C4D5C)
    ENUN
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    MUSC(0x25)
    SVAL(EVT_SLOT_2, 0x8)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xadf)
    TEXTEND
    REMA
    FADI(16)
    DISA(CHARACTER_LYON)
    CALL(EventScr_08591FD8)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB64C[] = {
    MUSC(0x14)
    CAMERA(20, 0)
    CUMO_CHAR(CHARACTER_CAELLACH)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xae0)
    TEXTEND
    REMA
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB678[] = {
    CAMERA_CAHR(CHARACTER_CAELLACH)
    SPAWN_ENEMY(CHARACTER_RIEV, 0, 0)
    SVAL(EVT_SLOT_2, 0x57)
    MOVE_CLOSEST(0xffff, CHAR_EVT_SLOT2, 17, 1)
    CALL(EventScr_UnitWarpIN)
    CUMO_CHAR(CHARACTER_CAELLACH)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xae1)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x57)
    CALL(EventScr_UnitWarpOUT)
    DISA(CHARACTER_RIEV)
    MOVE(0x18, CHARACTER_CAELLACH, 17, 0)
    ENUN
    DISA(CHARACTER_CAELLACH)
    MOVE(0x18, 0x81, 16, 0)
    MOVE(0x18, 0x82, 18, 0)
    ENUN
    DISA(0x81)
    DISA(0x82)
    SVAL(EVT_SLOT_2, UnitDef_088C4ADC)
    CALL(EventScr_LoadReinforce)
    STAL2(30)
    SVAL(EVT_SLOT_2, UnitDef_088C4B68)
    CALL(EventScr_LoadReinforce)
    STAL2(30)
    SVAL(EVT_SLOT_2, UnitDef_088C4BB8)
    CALL(EventScr_LoadReinforce)
    STAL2(30)
    SVAL(EVT_SLOT_2, UnitDef_088C4BF4)
    CALL(EventScr_LoadReinforce)
    STAL2(30)
    CAMERA_CAHR(CHARACTER_EPHRAIM)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xae2)
    TEXTEND
    REMA
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch12b_EndingScene[] = {
    MUSC(0x31)
    FADI(16)
    SVAL(EVT_SLOT_A, 0x0)
    CHECK_EXISTS(CHARACTER_MARISA)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALLEGIANCE(CHARACTER_MARISA)
    SVAL(EVT_SLOT_1, 0x0)
    BEQ(0x1, EVT_SLOT_C, EVT_SLOT_1)
    CHECK_ALIVE(CHARACTER_EWAN)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_A, 0x1)
    SVAL(EVT_SLOT_2, 0x16)
    CALL(EventScr_LoadUniqueAlly)
    GOTO(0x1)
LABEL(0x0)
    SVAL(EVT_SLOT_2, 0x16)
    CALL(EventScr_9EE5BC)
LABEL(0x1)
    CLEA
    CLEE
    CLEN
    CAMERA(20, 0)
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_088C4DC0)
    ENUN
    FADU(16)
    LOAD2(0x1, UnitDef_088C4DC0)
    ENUN
    CUMO_CHAR(CHARACTER_SETH)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xae3)
    TEXTEND
    MUSCMID(0x7fff)
    FADI(4)
    REMA
    CAMERA2(13, 13)
    MUSC(0x4b)
    FADU(16)
    LOAD2(0x1, UnitDef_088C4DFC)
    ENUN
    CUMO_CHAR(CHARACTER_MYRRH)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x7)
    SVAL(EVT_SLOT_3, 0xae4)
    CALL(Event_TextWithBG)
    IGNORE_KEYS(0x1)
    MOVE(0x10, CHARACTER_MYRRH, 20, 12)
    FADI(4)
    IGNORE_KEYS(0x0)
    ENUN
    DISA(CHARACTER_MYRRH)
    CAMERA(20, 0)
    FADU(4)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x7)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xae5)
    TEXTEND
    MUSC(0x32)
    TEXTCONT
    TEXTEND
    MUSCMID(0x7fff)
    FADI(4)
    REMA
    BEQ(0xa, EVT_SLOT_A, EVT_SLOT_0)
    MUSC(0x31)
    SVAL(EVT_SLOT_2, 0x7)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xae6)
    TEXTEND
    REMA
    FADI(16)
LABEL(0xa)
    ENUT(116)
    MNCH(0x1a)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB90C[] = {
    MUSS(0x30)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0xae7)
    TEXTEND
    REMA
    MURE(0x2)
    CUSA(CHARACTER_MARISA)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB934[] = {
    MUSS(0x30)
    STAL(33)
    SVAL(EVT_SLOT_2, 0x0)
    SVAL(EVT_SLOT_3, 0xae8)
    CALL(Event_TextWithBG)
    MURE(0x2)
    SVAL(EVT_SLOT_2, UnitDef_088C4AB4)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB970[] = {
    MUSI
    SVAL(EVT_SLOT_2, 0x9)
    SVAL(EVT_SLOT_3, 0xae9)
    CALL(Event_TextWithBG)
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB998[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C4C44)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB9B0[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C4C80)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB9C8[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C4CA8)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089FB9E0[] = {
    SVAL(EVT_SLOT_2, UnitDef_088C4CD0)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};
