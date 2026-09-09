#include "gbafe.h"

CONST_DATA EventListScr EventScr_Ch12b_BeginningScene[] = {
    MUSC(SONG_ADVANCE)
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_Ch12BAlly_2)
    ENUN
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_Ch12BAlly_3)
    ENUN
    FADU(16)
    CUMO_CHAR(CHARACTER_SETH)
    STAL(60)
    CURE
    SetBackground(BG_SHIP)
    TEXTSHOW(0xadb)
    TEXTEND
    FADI(4)
    REMA
    CLEAN
    CAMERA2(7, 7)
    FADU(16)
    LOAD1(0x1, UnitDef_Ch12BNPC)
    ENUN
    CUMO_CHAR(CHARACTER_SALEH)
    STAL(60)
    CURE
    MUSI
    Text_BG(BG_PORT, 0xadc)
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
    Text_BG(BG_SHIP, 0xade)
    MUSCMID(SONG_SILENT)
    LOAD2(0x1, UnitDef_Ch12BAlly_2)
    ENUN
    DISA(CHARACTER_MYRRH)
    LOAD1(0x1, UnitDef_Ch12BEnemy_0)
    LOAD2(0x1, UnitDef_Ch12BAlly_3)
    ENUN
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    MUSC(SONG_TENSION)
    SetBackground(BG_SHIP)
    TEXTSHOW(0xadf)
    TEXTEND
    REMA
    FADI(16)
    DISA(CHARACTER_LYON)
    CALL(EventScr_CommonPrep)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch12B_0[] = {
    MUSC(SONG_ASSAULT)
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

CONST_DATA EventListScr EventScr_Ch12B_1[] = {
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
    SVAL(EVT_SLOT_2, UnitDef_Ch12BEnemy_1)
    CALL(EventScr_LoadReinforce)
    STAL2(30)
    SVAL(EVT_SLOT_2, UnitDef_Ch12BEnemy_2)
    CALL(EventScr_LoadReinforce)
    STAL2(30)
    SVAL(EVT_SLOT_2, UnitDef_Ch12BEnemy_3)
    CALL(EventScr_LoadReinforce)
    STAL2(30)
    SVAL(EVT_SLOT_2, UnitDef_Ch12BEnemy_4)
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
    MUSC(SONG_VICTORY)
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
    SVAL(EVT_SLOT_2, CHARACTER_MARISA)
    CALL(EventScr_LoadUniqueAlly)
    GOTO(0x1)
LABEL(0x0)
    SVAL(EVT_SLOT_2, CHARACTER_MARISA)
    CALL(EventScr_StrictLoadUniqueAlly)
LABEL(0x1)
    CLEA
    CLEE
    CLEN
    CAMERA(20, 0)
    EvtSetLoadUnitNoREDA // ENOSUPP in EAstdlib
    LOAD2(0x1, UnitDef_Ch12BAlly_4)
    ENUN
    FADU(16)
    LOAD2(0x1, UnitDef_Ch12BAlly_4)
    ENUN
    CUMO_CHAR(CHARACTER_SETH)
    STAL(60)
    CURE
    TEXTSTART
    TEXTSHOW(0xae3)
    TEXTEND
    MUSCMID(SONG_SILENT)
    FADI(4)
    REMA
    CAMERA2(13, 13)
    MUSC(SONG_4B)
    FADU(16)
    LOAD2(0x1, UnitDef_Ch12BAlly_5)
    ENUN
    CUMO_CHAR(CHARACTER_MYRRH)
    STAL(60)
    CURE
    Text_BG(BG_PORT, 0xae4)
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
    SetBackground(BG_PORT)
    TEXTSHOW(0xae5)
    TEXTEND
    MUSC(SONG_INTO_THE_SHADOW_OF_VICTORY)
    TEXTCONT
    TEXTEND
    MUSCMID(SONG_SILENT)
    FADI(4)
    REMA
    BEQ(0xa, EVT_SLOT_A, EVT_SLOT_0)
    MUSC(SONG_VICTORY)
    SetBackground(BG_PORT)
    TEXTSHOW(0xae6)
    TEXTEND
    REMA
    FADI(16)
LABEL(0xa)
    ENUT(116)
    MNCH(0x1a)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch12B_2[] = {
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

CONST_DATA EventListScr EventScr_Ch12B_3[] = {
    MUSS(0x30)
    STAL(33)
    Text_BG(BG_HOUSE, 0xae8)
    MURE(0x2)
    SVAL(EVT_SLOT_2, UnitDef_Ch12BAlly_1)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch12B_4[] = {
    MUSI
    Text_BG(BG_FIREPLACE, 0xae9)
    MUNO
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch12B_5[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch12BEnemy_5)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch12B_6[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch12BEnemy_6)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch12B_7[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch12BEnemy_7)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch12B_8[] = {
    SVAL(EVT_SLOT_2, UnitDef_Ch12BEnemy_8)
    CALL(EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
};
