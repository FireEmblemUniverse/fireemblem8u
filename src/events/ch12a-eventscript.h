#include "gbafe.h"

CONST_DATA EventListScr EventScr_Ch12a_BeginingScene[] = {
    MUSC(0x47)
    LOAD2(0x1, UnitDef_088BA5F8)
    ENUN
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xa56)
    TEXTEND
    MUSCSLOW(0x7fff)
    TEXTCONT
    TEXTEND
    REMA
    CAMERA2(10, 20)
    LOAD1(0x1, UnitDef_088BA274)
    ENUN
    SVAL(EVT_SLOT_2, UnitDef_088BA6AC)
    SVAL(EVT_SLOT_3, 0x1)
    CALL(EventScr_LoadUnitForTutorial)
    CUMO_CHAR(CHARACTER_SETH)
    STAL(60)
    CURE
    MUSC(0x25)
    TEXTSTART
    TEXTSHOW(0xa57)
    TEXTEND
    REMA
    FADI(16)
    LOAD1(0x0, UnitDef_Event_Ch12aAlly)
    ENUN
    CALL(EventScr_08591FD8)
    MUSCMID(0x7fff)
    CAMERA2(7, 21)
    FADU(16)
    CUMO_CHAR(CHARACTER_SALEH)
    STAL(60)
    CURE
    MUSC(0xa)
    TEXTSTART
    TEXTSHOW(0xa58)
    TEXTEND
    REMA
    CAMERA2(9, 11)
    LOAD2(0x1, UnitDef_088BA670)
    ENUN
    CUMO_CHAR(CHARACTER_EWAN)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xa59)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x2c9)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x309)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x305)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    MOVE_DEFINED(CHARACTER_EWAN)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x2cb)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x2c9)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x309)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x306)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    MOVE_DEFINED(CHARACTER_FADO)
    ENUN
    DISA(CHARACTER_EWAN)
    STAL(30)
    MOVE(0x8, CHARACTER_FADO, 7, 12)
    ENUN
    CUMO_AT(5, 12)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x1)
    CALL(EventScr_SetBackground)
    MUSI
    TEXTSHOW(0xa5a)
    TEXTEND
    REMA
    MUNO
    FADI(16)
    CLEAN
    DISA(CHARACTER_FADO)
    LOAD1(0x1, UnitDef_088BA4F4)
    ENUN
    ENUT(7)
    ENUT(8)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch12a_EndingScene[] = {
    MUSC(0x31)
    FADI(16)
    CLEA
    CLEE
    CLEN
    CHECK_EXISTS(CHARACTER_EWAN)
    BNE(0x2, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(CHARACTER_SALEH)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, 0x1)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xa5b)
    TEXTEND
    GOTO(0x1)
LABEL(0x0)
    CHECK_ALIVE(CHARACTER_TETHYS)
    BEQ(0x2, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, 0x1)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xa5c)
    TEXTEND
LABEL(0x1)
    FADI(16)
    LOAD1(0x1, UnitDef_088BA5D0)
    ENUN
LABEL(0x2)
    CLEAN
    CAMERA2(12, 4)
    FADU(16)
    STAL(15)
    CUMO_AT(12, 1)
    STAL(60)
    CURE
    CHECK_ALIVE(CHARACTER_SALEH)
    BEQ(0xa, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_2, 0x4)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xa5d)
    TEXTEND
    REMA
    MUSCMID(0x7fff)
    FADI(16)
    SVAL(EVT_SLOT_2, 0x1)
    CALL(EventScr_SetBackground)
    MUSC(0x2b)
    TEXTSHOW(0xa5e)
    TEXTEND
    MUSCMID(0x7fff)
    STAL3(32)
    MUSC(0x32)
    TEXTCONT
    TEXTEND
    REMA
    FADI(4)
    SVAL(EVT_SLOT_2, 0x3)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xa5f)
    TEXTEND
    REMA
    GOTO(0xb)
LABEL(0xa)
    MUSC(0x32)
    SVAL(EVT_SLOT_2, 0x3)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xa60)
    TEXTEND
    REMA
    MUSCMID(0x7fff)
    FADI(16)
    SVAL(EVT_SLOT_2, 0x1)
    CALL(EventScr_SetBackground)
    MUSC(0x2b)
    TEXTSHOW(0xa61)
    TEXTEND
    MUSCMID(0x7fff)
    STAL3(32)
    MUSC(0x32)
    TEXTCONT
    TEXTEND
    REMA
    FADI(4)
    SVAL(EVT_SLOT_2, 0x3)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xa62)
    TEXTEND
    REMA
LABEL(0xb)
    ENUT(116)
    MNCH(0xd)
    ENDA
};

CONST_DATA EventListScr EventScr_089F536C[] = {
    MUSI
    SVAL(EVT_SLOT_2, 0x1)
    SVAL(EVT_SLOT_3, 0xa63)
    CALL(Event_TextWithBG)
    MUNO
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x59)
    GIVEITEMTO(CHAR_EVT_ACTIVE_UNIT)
    TILECHANGE(0x2)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F53AC[] = {
    MUSS(0x30)
    STAL(33)
LABEL(0x0)
    CHECK_ACTIVE
    SVAL(EVT_SLOT_7, 0x1)
    BEQ(0x1, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x17)
    BEQ(0x2, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_7, 0x15)
    BEQ(0x3, EVT_SLOT_C, EVT_SLOT_7)
    SVAL(EVT_SLOT_2, 0x1)
    SVAL(EVT_SLOT_3, 0xa67)
    CALL(Event_TextWithBG)
    GOTO(0x9)
LABEL(0x1)
    SVAL(EVT_SLOT_2, 0x1)
    SVAL(EVT_SLOT_3, 0xa64)
    CALL(Event_TextWithBG)
    GOTO(0x9)
LABEL(0x2)
    SVAL(EVT_SLOT_2, 0x1)
    SVAL(EVT_SLOT_3, 0xa65)
    CALL(Event_TextWithBG)
    GOTO(0x9)
LABEL(0x3)
    SVAL(EVT_SLOT_2, 0x1)
    SVAL(EVT_SLOT_3, 0xa66)
    CALL(Event_TextWithBG)
LABEL(0x9)
    LOAD1(0x1, UnitDef_088BA5D0)
    ENUN
    TILECHANGE(0x3)
    MURE(0x2)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F5484[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(7)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F54A0[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BA51C)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088BA7C4)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F54C8[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    ENUF(8)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F54E4[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BA738)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088BA7EC)
    CALL(EventScr_LoadReinforceHardMode)
    SVAL(EVT_SLOT_2, UnitDef_088BA788)
    CALL(EventScr_LoadReinforce)
    SVAL(EVT_SLOT_2, UnitDef_088BA580)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};
