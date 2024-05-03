#include "gbafe.h"

CONST_DATA EventListScr EventScr_Ch17a_BeginingScene[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BDF5C)
    CALL(EventScr_089F7620)
    ENUT(14)
    ENDA
};

CONST_DATA EventListScr EventScr_089F7620[] = {
    MUSCSLOW(0x2c)
    SADD(EVT_SLOT_A, EVT_SLOT_2, EVT_SLOT_0)
    REMOVEPORTRAITS
    BACG(0x35)
    FAWI(2)
    BACG(0xf)
    FAWU(2)
    BROWNBOXTEXT(0x210, 8, 8)
    TEXTSHOW(0xb61)
    TEXTEND
    EvtBgmFadeIn(0x7fff, 8) // ENOSUPP in EAstdlib
    FAWI(2)
    REMA
    BACG(0x21)
    MUSC(0x52)
    FAWU(2)
    TEXTSHOW(0xb62)
    TEXTEND
    REMA
    FADI(16)
    CALL(EventScr_089F782C)
    CAMERA2(13, 11)
    SADD(EVT_SLOT_2, EVT_SLOT_A, EVT_SLOT_0)
    LOAD1(0x1, 0xffffffff)
    ENUN
    MOVE(0xffff, CHARACTER_LYON, 0, 0)
    FADU(16)
    LOAD1(0x1, UnitDef_088BE164)
    ENUN
    CUMO_CHAR(0xf7)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x19)
    SVAL(EVT_SLOT_3, 0xb64)
    CALL(Event_TextWithBG)
    CAMERA2(11, 15)
    LOAD2(0x1, UnitDef_088BE4C0)
    ENUN
    CUMO_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x19)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb65)
    TEXTEND
    EvtBgmFadeIn(0x7fff, 1) // ENOSUPP in EAstdlib
    TEXTCONT
    TEXTEND
    REMA
    FADI(16)
    CLEAN
    FADU(16)
    SVAL(EVT_SLOT_2, 0x40)
    MOVE_CLOSEST(0xffff, CHAR_EVT_SLOT2, 8, 14)
    CALL(EventScr_UnitWarpIN)
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_1)
    SVAL(EVT_SLOT_2, 0x19)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb66)
    TEXTEND
    MUSC(0x2d)
    TEXTCONT
    TEXTEND
    EvtBgmFadeIn(0x7fff, 1) // ENOSUPP in EAstdlib
    TEXTCONT
    TEXTEND
    MUSC(0x26)
    TEXTCONT
    TEXTEND
    CALL(EventScr_TextShowWithFadeIn)
    GOTO(0x1)
LABEL(0x0)
    SVAL(EVT_SLOT_2, 0x19)
    CALL(EventScr_SetBackground)
    TEXTSHOW(0xb67)
    TEXTEND
    MUSC(0x2d)
    TEXTCONT
    TEXTEND
    EvtBgmFadeIn(0x7fff, 1) // ENOSUPP in EAstdlib
    TEXTCONT
    TEXTEND
    MUSC(0x26)
    TEXTCONT
    TEXTEND
    CALL(EventScr_TextShowWithFadeIn)
LABEL(0x1)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    CAMERA2(15, 6)
    SVAL(EVT_SLOT_2, 0x40)
    MOVE_CLOSEST(0xffff, CHAR_EVT_SLOT2, 20, 6)
    CALL(EventScr_UnitWarpIN)
    CALL(EventScr_08591FD8)
    ENDA
};

CONST_DATA EventListScr EventScr_089F782C[] = {
    CLEA
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_1)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x11)
    GOTO(0x1)
LABEL(0x0)
    SVAL(EVT_SLOT_B, 0x0)
    LOMA(0x1e)
LABEL(0x1)
    MUSC(0x26)
    CAMERA2(7, 8)
    FADU(16)
    TEXTSTART
    TEXTSHOW(0xb63)
    TEXTEND
    REMA
    LOAD1(0x1, UnitDef_088BE31C)
    ENUN

    StartBattle
    NormalDamage(ATTACKER, 23)
    CriticalHit(DEFENDER, 15)
    NormalDamage(ATTACKER, 100)
    EndAttack
    FIGHT_MAP(CHARACHER_FRELIAN, 0x8d, 0, 0)

    DISA(CHARACHER_FRELIAN)
    KILL(0xc1)
    DISA_IF(0xc1)
    KILL(0xc1)
    DISA_IF(0xc1)
    KILL(0xc1)
    DISA_IF(0xc1)
    FADI(16)
    CLEA
    CLEE
    CLEN
    CAMERA2(13, 11)
    FADU(16)
    LOAD1(0x1, UnitDef_088BE3D0)
    ENUN

    StartBattle
    NormalDamage(DEFENDER, 5)
    CriticalHit(ATTACKER, 100)
    EndAttack
    FIGHT_MAP(CHARACHER_FRELIAN, 0x8d, 0, 0)

    DISA(CHARACHER_FRELIAN)
    KILL(0xc1)
    DISA_IF(0xc1)
    FADI(16)
    CLEA
    CLEE
    CLEN
    CAMERA2(15, 6)
    FADU(16)
    LOAD1(0x1, UnitDef_088BE434)
    ENUN

    StartBattle
    CriticalHit(ATTACKER, 100)
    EndAttack
    FIGHT_MAP(CHARACHER_FRELIAN, 0x8d, 0, 0)

    DISA(CHARACHER_FRELIAN)
    KILL(0xc1)
    DISA_IF(0xc1)
    KILL(0xc1)
    DISA_IF(0xc1)
    FADI(16)
    CLEA
    CLEE
    CLEN
    ENDA
};

CONST_DATA EventListScr EventScr_089F79C4[] = {
    CALL(EventScr_089F79D4)
    MNCH(0x12)
    ENDA
};

CONST_DATA EventListScr EventScr_089F79D4[] = {
    SVAL(EVT_SLOT_7, 0x0)
    CHECK_ALIVE(CHARACTER_SYRENE)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(0xf6)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(0xf7)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(0xf4)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    CHECK_ALIVE(0xf5)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    SVAL(EVT_SLOT_7, 0x1)
LABEL(0x0)
    MUSCMID(0x7fff)
    FADI(16)
    SVAL(EVT_SLOT_2, 0x21)
    CALL(EventScr_LoadUniqueAlly)
    CLEA
    CLEE
    CLEN
    CAMERA2(11, 8)
    FADU(16)
    SPAWN_ENEMY(CHARACTER_LYON, 0, 0)
    SVAL(EVT_SLOT_2, 0x40)
    MOVE_CLOSEST(0xffff, CHAR_EVT_SLOT2, 12, 7)
    CALL(EventScr_UnitWarpIN)
    STAL(16)
    MOVE_1STEP(0x4, CHARACTER_LYON, FACING_DOWN)
    ENUN
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    MUSC(0x2d)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0xa, EVT_SLOT_C, EVT_SLOT_1)
    SVAL(EVT_SLOT_2, 0xb6e)
    GOTO(0xb)
LABEL(0xa)
    SVAL(EVT_SLOT_2, 0xb70)
LABEL(0xb)
    TEXTSTART
    TEXTSHOW(0xffff)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x424c)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x428c)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x100000)
    SENQUEUE1
    MOVE_DEFINED(CHARACTER_LYON)
    STAL2(30)
    LOAD2(0x1, UnitDef_088BE538)
    ENUN
    CUMO_CHAR(CHARACTER_LYON)
    STAL(60)
    CURE
    SVAL(EVT_SLOT_2, 0x19)
    CALL(EventScr_SetBackground)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x14, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSHOW(0xb6f)
    TEXTEND
    GOTO(0x15)
LABEL(0x14)
    TEXTSHOW(0xb71)
    TEXTEND
LABEL(0x15)
    REMA
    CALL(EventScr_TextShowWithFadeIn)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    DISA(CHARACTER_LYON)
    MOVE_1STEP(0x0, CHARACTER_EPHRAIM, FACING_DOWN)
    ENUN
    MUSCMID(0x7fff)
    CUMO_CHAR(CHARACTER_EPHRAIM)
    STAL(60)
    CURE
    MUSC(0x26)
    TEXTSTART
    TEXTSHOW(0xb72)
    TEXTEND
    REMA
    FADI(4)
    SVAL(EVT_SLOT_2, 0x1f)
    CALL(EventScr_SetBackground)
    MUSI
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x1e, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSHOW(0xb73)
    TEXTEND
    GOTO(0x1f)
LABEL(0x1e)
    TEXTSHOW(0xb74)
    TEXTEND
LABEL(0x1f)
    REMA
    MUNO
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x94)
    GIVEITEMTO(CHAR_EVT_PLAYER_LEADER)
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x8e)
    GIVEITEMTO(CHAR_EVT_PLAYER_LEADER)
    BEQ(0x34, EVT_SLOT_7, EVT_SLOT_0)
    MUSC(0x26)
    STAL(50)
    MUSI
    SVAL(EVT_SLOT_2, 0x1f)
    CALL(EventScr_SetBackground)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 0x2)
    BNE(0x32, EVT_SLOT_C, EVT_SLOT_1)
    TEXTSHOW(0xb75)
    TEXTEND
    GOTO(0x33)
LABEL(0x32)
    TEXTSHOW(0xb76)
    TEXTEND
LABEL(0x33)
    REMA
    MUNO
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x55)
    GIVEITEMTO(CHAR_EVT_PLAYER_LEADER)
LABEL(0x34)
    ENDA
};

CONST_DATA EventListScr EventScr_089F7CAC[] = {
    MUSS(0x30)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0xb77)
    TEXTEND
    REMA
    MURE(0x2)
    CUSA(CHARACTER_SYRENE)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F7CD4[] = {
    MUSS(0x30)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0xb78)
    TEXTEND
    REMA
    MURE(0x2)
    CUSA(CHARACTER_SYRENE)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F7CFC[] = {
    MUSS(0x30)
    STAL(33)
    TEXTSTART
    TEXTSHOW(0xb79)
    TEXTEND
    REMA
    MURE(0x2)
    CUSA(CHARACTER_SYRENE)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F7D24[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BE1DC)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F7D3C[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BE268)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F7D54[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BE2A4)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F7D6C[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BE2E0)
    CALL(EventScr_LoadReinforce)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F7D84[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    COUNTER_SET(0x0, 5)
    ENUF(14)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F7DA4[] = {
    SVAL(EVT_SLOT_2, UnitDef_088BE22C)
    CALL(EventScr_LoadReinforce)
    COUNTER_DEC(0x0)
    ENUF(14)
    COUNTER_CHECK(0x0)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ENUT(14)
LABEL(0x0)
    EVBIT_T(7)
    ENDA
};

CONST_DATA EventListScr EventScr_089F7DD8[] = {
    SVAL(EVT_SLOT_2, 0x0)
    CALL(EventScr_UnTriggerIfNotFaction)
    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0xc0013)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xe0011)
    SENQUEUE1
    SVAL(EVT_SLOT_2, 0x11200)
    CALL(EventScr_ChangeAIinQueue)
    SVAL(EVT_SLOT_1, 0xd0012)
    SENQUEUE1
    SVAL(EVT_SLOT_2, 0x10e00)
    CALL(EventScr_ChangeAIinQueue)
    EVBIT_T(7)
    ENDA
};
