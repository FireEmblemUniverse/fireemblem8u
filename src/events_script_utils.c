#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "eventscript.h"
#include "EAstdlib.h"
#include "eventcall.h"
#include "bmdifficulty.h"
#include "chapterdata.h"
#include "playerphase.h"
#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "gba_sprites.h"
#include "bmsave.h"
#include "ekrbattle.h"
#include "soundwrapper.h"
#include "constants/event-flags.h"
#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/video-global.h"

CONST_DATA EventListScr EventScr_CallOnTutorialMode[] = {
    CHECK_TUTORIAL
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)

    CALL(-1)

LABEL(0x0)
    ENDA
};

CONST_DATA EventListScr EventScr_CallOnHardMode[] = {
    CHECK_TUTORIAL
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)

    CHECK_HARD
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)

    CALL(-1)

LABEL(0x0)
    ENDA
};

CONST_DATA EventListScr EventScr_CallOnChapterNumber[] = {
    CHECK_CHAPTER_NUMBER
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_3)

    CALL(-1)

LABEL(0x0)
    ENDA
};

CONST_DATA EventListScr EventScr_CallIfCommonMode[] = {
    CHECK_MODE
    BNE(CHAPTER_MODE_COMMON, EVT_SLOT_C, EVT_SLOT_2)

    SADD(EVT_SLOT_2, EVT_SLOT_3, EVT_SLOT_0)
    CALL(-1)

LABEL(0x1)
    ENDA
};

CONST_DATA EventListScr EventScr_CallWithModeCheck[] = {
    CHECK_MODE
    SVAL(EVT_SLOT_7, CHAPTER_MODE_COMMON)
    BEQ(0x2, EVT_SLOT_C, EVT_SLOT_7)

    SVAL(EVT_SLOT_7, CHAPTER_MODE_EIRIKA)
    BNE(0x1, EVT_SLOT_C, EVT_SLOT_7)

    /* for Eirika mode, use slot 3 */
    SADD(EVT_SLOT_2, EVT_SLOT_3, EVT_SLOT_0)
    GOTO(0x2)

LABEL(0x1)
    /* For Ephraim mode, use slot 4 */
    SADD(EVT_SLOT_2, EVT_SLOT_4, EVT_SLOT_0)

LABEL(0x2)
    /* For common mode, use slot 2 */
    CALL(-1)
    ENDA
};

CONST_DATA EventListScr EventScr_SetFlagIfPlayedThrough[] = {
    CHECK_POSTGAME
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)

    ENUT(-1)

LABEL(0x0)
    ENDA
};

CONST_DATA EventListScr EventScr_UnTriggerIfNotUnit[] = {
    CHECK_ACTIVE
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_2)

    CALL(EventScr_EndAndResetTriggEvent)

LABEL(0x0)
    ENDA
};

CONST_DATA EventListScr EventScr_UnTriggerIfNotFaction[] = {
    CHECK_ALLEGIANCE(-1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_2)

    CALL(EventScr_EndAndResetTriggEvent)

LABEL(0x0)
    ENDA
};

CONST_DATA EventListScr EventScr_EndAndResetTriggEvent[] = {
    CHECK_EVENTID_
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    ENUF(-1)

    NoFade
    ENDB
};

CONST_DATA EventListScr EventScr_LoadUnitWithRestrictionCtrl[] = {
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)

    /* Load unit in slot2 */
    LOAD1(1, -1)
    ENUN
    GOTO(0x1)

LABEL(0x0)
    LOAD1(0, -1) /* not load dead unit */
    ENUN

LABEL(0x1)
    ENDA
};

/**
 * slot2: unit definitions for normal or hard mode
 * slot3: unit definitions for tutorial mode
 * slot4: restriction
 */
CONST_DATA EventListScr EventScr_LoadUnitForDifferentMode[] = {
    CHECK_TUTORIAL
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)

    CHECK_HARD
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)

    /* load unit definition in slot3 */
    SADD(EVT_SLOT_2, EVT_SLOT_3, EVT_SLOT_0)

LABEL(0x0)
    /* set restriction is slot4 */
    SADD(EVT_SLOT_C, EVT_SLOT_4, EVT_SLOT_0)
    CALL(EventScr_LoadUnitWithRestrictionCtrl)
    ENDA
};

/**
 * slot2: unit definitions
 * slot3: restriction
 */
CONST_DATA EventListScr EventScr_LoadUnitForTutorial[] = {
    CHECK_TUTORIAL
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)

    CHECK_HARD
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)

    /* set restriction in slot3, only tutorial mode is valid */
    SADD(EVT_SLOT_C, EVT_SLOT_3, EVT_SLOT_0)
    CALL(EventScr_LoadUnitWithRestrictionCtrl)

LABEL(0x0)
    ENDA
};

CONST_DATA EventListScr EventScr_LoadReinforce[] = {
    EVBIT_MODIFY(4)
    CALL(EventScr_RemoveBGIfNeeded)
    EVBIT_T(EV_STATE_0008 | EV_STATE_ABORT)
    LOAD1(1, -1)
    ENUN

    EVBIT_F(EV_STATE_0008 | EV_STATE_ABORT)
    EVBIT_MODIFY(0)
    ENDA
};

CONST_DATA EventListScr EventScr_LoadReinforceHardMode[] = {
    CHECK_TUTORIAL
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)

    CHECK_HARD
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)

    CALL(EventScr_LoadReinforce)

LABEL(0x0)
    ENDA
};

CONST_DATA EventListScr EventScr_TextShowWithFadeIn[] = {
    CHECK_EVBIT(EV_STATE_0008)
    BNE(0x80BD, EVT_SLOT_C, EVT_SLOT_0)

    FADI(16)

LABEL(0x80BD)
    TEXTSTART
    CLEAN
    FADU(16)
    ENDA
};

CONST_DATA EventListScr EventScr_SetBackground[] = {
    CHECK_EVBIT(8)
    BNE(0x80D2, EVT_SLOT_C, EVT_SLOT_0)

    FADI(16)

LABEL(0x80D2)
    REMOVEPORTRAITS
    BACG(-1)
    FADU(16)
    ENDA
};

CONST_DATA EventListScr Event_TextWithBG[] = {
    CALL(EventScr_SetBackground)
    SADD(EVT_SLOT_2, EVT_SLOT_3, EVT_SLOT_0)
    TEXTSHOW(-1)
    TEXTEND
    CALL(EventScr_TextShowWithFadeIn)
    ENDA
};

CONST_DATA EventListScr EventScr_ApplyActiveUnitTileChange[] = {
    EVBIT_MODIFY(1)
    TILECHANGE(-2)
    NoFade
    ENDA
};

CONST_DATA EventListScr EventScr_ApplyTileChangeForFactionIfAlly[] = {
    SVAL(EVT_SLOT_2, FACTION_ID_BLUE)
    CALL(EventScr_ApplyTileChangeForFaction)
    ENDA
};

CONST_DATA EventListScr EventScr_ApplyTileChangeForFactionIfEnemy[] = {
    SVAL(EVT_SLOT_2, FACTION_ID_RED)
    CALL(EventScr_ApplyTileChangeForFaction)
    ENDA
};

CONST_DATA EventListScr EventScr_ApplyTileChangeForFactionIfNPC[] = {
    SVAL(EVT_SLOT_2, FACTION_ID_GREEN)
    CALL(EventScr_ApplyTileChangeForFaction)
    ENDA
};

CONST_DATA EventListScr EventScr_ApplyTileChangeForFaction[] = {
    EVBIT_MODIFY(1)
    CHECK_ALLEGIANCE(-1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_2)

    TILECHANGE(-2)

LABEL(0x0)
    NoFade
    ENDA
};

CONST_DATA EventListScr EventScr_FormatFlashingCursor[] = {
LABEL(0x0)
    BLE(0x1, EVT_SLOT_D, EVT_SLOT_0)
    SDEQUEUE(EVT_SLOT_B)
    CURSOR_FLASHING(-1, -1)
    GOTO(0x0)

LABEL(0x1)
    ENDA
};

CONST_DATA EventListScr EventScr_MoveUnitS2ToLeader[] = {
    CHECK_ALIVE(-3)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)

    CHECK_DEPLOYED(-3)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)

    GOTO(0x63)

LABEL(0x0)
    MOVEONTO(0, -3, 0)
    ENUN
    REMU(-3)

LABEL(0x63)
    ENDA
};

/**
 * SLOT2: pid
 * SLOT3: facing
 *
 * Example:
 *
 * SVAL(EVT_SLOT_2, CHARACTER_EIRIKA)
 * SVAL(EVT_SLOT_3, FACING_DOWN)
 * CALL(EventScr_FormatMoveUnit)
 */
CONST_DATA EventListScr EventScr_FormatMoveUnit[] = {
    CHECK_ALIVE(-3)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)

    CHECK_DEPLOYED(-3)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)

    MOVE_NEXTTO(0, -3, 0)
    GOTO(0x63)

LABEL(0x0)
    CHECK_COORDS(0)
    SADD(EVT_SLOT_B, EVT_SLOT_C, EVT_SLOT_0)
    SPAWN_CUTSCENE_ALLY(-3, -1, -1)

    SVAL(EVT_SLOT_7, FACING_UP)
    BNE(0x1, EVT_SLOT_7, EVT_SLOT_3)

    MOVE_1STEP(0, -3, FACING_UP)
    GOTO(0x63)

LABEL(0x1)
    SVAL(EVT_SLOT_7, FACING_DOWN)
    BNE(0x2, EVT_SLOT_7, EVT_SLOT_3)

    MOVE_1STEP(0, -3, FACING_DOWN)
    GOTO(0x63)

LABEL(0x2)
    SVAL(EVT_SLOT_7, FACING_LEFT)
    BNE(0x3, EVT_SLOT_7, EVT_SLOT_3)

    MOVE_1STEP(0, -3, FACING_LEFT)
    GOTO(0x63)

LABEL(0x3)
    MOVE_1STEP(0, -3, FACING_RIGHT)

LABEL(0x63)
    ENUN
    ENDA
};

CONST_DATA EventListScr EventScr_LoadUniqueAlly[] = {
    CHECK_EXISTS(CHAR_EVT_SLOT2)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)

    CHECK_ALLEGIANCE(CHAR_EVT_SLOT2)
    SVAL(EVT_SLOT_1, FACTION_ID_BLUE)
    BEQ(0x1, EVT_SLOT_C, EVT_SLOT_1)
    CUSA(CHAR_EVT_SLOT2)
    GOTO(0x1)

LABEL(0x0)
    SPAWN_ALLY(CHAR_EVT_SLOT2, 0, 0)

    SVAL(EVT_SLOT_1, 0)
    SET_HP(CHAR_EVT_SLOT2)

    REMU(CHAR_EVT_SLOT2)

    SVAL(EVT_SLOT_1, 0)
    SET_STATE(CHAR_EVT_SLOT2)

LABEL(0x1)
    ENDA
};

CONST_DATA EventListScr EventScr_UnitWarpIN[] = {
    REMU(CHAR_EVT_SLOT2)
    CAMERA_CAHR(CHAR_EVT_SLOT2)

    CHECK_COORDS(CHAR_EVT_SLOT2)
    SADD(EVT_SLOT_B, EVT_SLOT_C, EVT_SLOT_0)
    WARP_IN(-1, -1)

    STAL2(10)
    REVEAL(CHAR_EVT_SLOT2)
    ENDWARP
    ENDA
};

CONST_DATA EventListScr EventScr_UnitWarpOUT[] = {
    CAMERA_CAHR(CHAR_EVT_SLOT2)

    CHECK_COORDS(CHAR_EVT_SLOT2)
    SADD(EVT_SLOT_B, EVT_SLOT_C, EVT_SLOT_0)
    WARP_OUT(-1, -1)

    STAL2(20)
    REMU(CHAR_EVT_SLOT2)
    ENDWARP
    ENDA
};

CONST_DATA EventListScr EventScr_UnitFlushingIN[] = {
    CAMERA_CAHR(CHAR_EVT_SLOT2)

    REVEAL(CHAR_EVT_SLOT2)
    STAL2(2)
    REMU(CHAR_EVT_SLOT2)

    STAL2(4)

    REVEAL(CHAR_EVT_SLOT2)
    STAL2(2)
    REMU(CHAR_EVT_SLOT2)

    STAL2(4)

    REVEAL(CHAR_EVT_SLOT2)
    STAL2(2)
    REMU(CHAR_EVT_SLOT2)
    STAL2(2)

    REVEAL(CHAR_EVT_SLOT2)
    ENDA
};

CONST_DATA EventListScr EventScr_UnitFlushingOUT[] = {
    CAMERA_CAHR(CHAR_EVT_SLOT2)

    REVEAL(CHAR_EVT_SLOT2)
    STAL2(2)
    REMU(CHAR_EVT_SLOT2)
    STAL2(2)

    REVEAL(CHAR_EVT_SLOT2)
    STAL2(2)
    REMU(CHAR_EVT_SLOT2)
    STAL2(4)

    REVEAL(CHAR_EVT_SLOT2)
    STAL2(2)
    REMU(CHAR_EVT_SLOT2)
    STAL2(6)

    REVEAL(CHAR_EVT_SLOT2)
    STAL2(2)
    REMU(CHAR_EVT_SLOT2)
    ENDA
};

CONST_DATA EventListScr EventScr_9EE5BC[] = {
    CHECK_EXISTS(CHAR_EVT_SLOT2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)

    SPAWN_ALLY(CHAR_EVT_SLOT2, 0, 0)
    REMU(CHAR_EVT_SLOT2)
    GOTO(0x1)

LABEL(0x0)
    /* If unit exists */
    CHECK_ALLEGIANCE(CHAR_EVT_SLOT2)
    SVAL(EVT_SLOT_1, FACTION_ID_BLUE)
    BEQ(0x2, EVT_SLOT_C, EVT_SLOT_1)

    /* If not ally */
    CUSA(CHAR_EVT_SLOT2)

LABEL(0x1)
    /* After unit loaded */
    SVAL(EVT_SLOT_1, 0)
    SET_HP(CHAR_EVT_SLOT2)

    REMU(CHAR_EVT_SLOT2)

    SVAL(EVT_SLOT_1, 0x0)
    SET_STATE(CHAR_EVT_SLOT2)

LABEL(0x2)
    ENDA
};

/* I think used in dessert */
CONST_DATA EventListScr EventScr_GiveTreasureToLuckyDog[] = {
    CHECK_CLASS(CHAR_EVT_ACTIVE_UNIT)

    SVAL(EVT_SLOT_7, CLASS_THIEF)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)

    SVAL(EVT_SLOT_7, CLASS_ROGUE)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)

    RANDOMNUMBER(100)
    BLT(0x1, EVT_SLOT_2, EVT_SLOT_C)

LABEL(0x0)
    CALL(EventScr_RemoveBGIfNeeded)

    GIVEITEMTO(CHAR_EVT_ACTIVE_UNIT)
    SVAL(EVT_SLOT_C, true)
    GOTO(0x2)

LABEL(0x1)
    SVAL(EVT_SLOT_C, false)

LABEL(0x2)
    ENDA
};

CONST_DATA EventListScr EventScr_ChangeAIinQueue[] = {
LABEL(0x0)
    BLE(0x1, EVT_SLOT_D, EVT_SLOT_0)

    SADD(EVT_SLOT_1, EVT_SLOT_2, EVT_SLOT_0) /* ai1/2 */
    SDEQUEUE(EVT_SLOT_B)    /* x/y */
    CHAI_AT(-1, -1)
    GOTO(0x0)

LABEL(0x1)
    ENDA
};

CONST_DATA EventListScr EventScr_9EE6A0[] = {
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_3)
    CALL(EventScr_ChangeAIinQueue)
    GOTO(0x1)

LABEL(0x0)
    SADD(EVT_SLOT_2, EVT_SLOT_4, EVT_SLOT_0)
    ENUF(-1)

LABEL(0x1)
    ENDA
};

CONST_DATA EventListScr EventScr_9EE6C8[] = {
    CHECK_ACTIVE
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_3)
    CALL(EventScr_ChangeAIinQueue)
    GOTO(0x1)

LABEL(0x0)
    SADD(EVT_SLOT_2, EVT_SLOT_4, EVT_SLOT_0)
    ENUF(-1)

LABEL(0x1)
    ENDA
};

CONST_DATA EventListScr EventScr_Tutorial_Exec0[] = {
    TUTORIALTEXTBOXSTART
    CHECK_ACTIVE
    SDEQUEUE(EVT_SLOT_2)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_2)

    SHOW_ATTACK_RANGE(CHAR_EVT_ACTIVE_UNIT)

    SDEQUEUE(EVT_SLOT_B)
    CURSOR_FLASHING(-1, -1)

    STAL(18)

    SDEQUEUE(EVT_SLOT_2)
    SDEQUEUE(EVT_SLOT_B)
    TEXTSHOW(-1)
    TEXTEND
    CURE

    IGNORE_KEYS(R_BUTTON | START_BUTTON | B_BUTTON)
    SDEQUEUE(EVT_SLOT_C)
    SDEQUEUE(EVT_SLOT_C)

    SDEQUEUE(EVT_SLOT_2)
    EvtEnqueueConditionalTutCall(
        -1,
        TUTORIAL_EVT_TYPE_DESTSELECTED)

    GOTO(0x1)

LABEL(0x0)
    /* Fail to choose the specific unit */
    SDEQUEUE(0xC)
    SDEQUEUE(0xC)
    SDEQUEUE(0xC)

    CURSOR_FLASHING_CHAR(CHAR_EVT_SLOT2)
    STAL(8)

    SET_ACTIVE(CHAR_EVT_SLOT2)

    SDEQUEUE(EVT_SLOT_2)
    SDEQUEUE(EVT_SLOT_B)
    TEXTSHOW(-1)
    TEXTEND
    CURE

    SDEQUEUE(0xC)
    SDEQUEUE(0x2)
    EvtEnqueueConditionalTutCall(
        -1,
        TUTORIAL_EVT_TYPE_ONSELECT)

LABEL(0x1)
    REMA
    ENDA
};

CONST_DATA EventListScr EventScr_Tutorial_Exec1[] = {
    CHECK_CURSOR
    SDEQUEUE(EVT_SLOT_B)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_B)

    ASMC(PlayPhaseForcePressAButtonInRangeDisp)
    SDEQUEUE(0xC)
    SDEQUEUE(0xC)
    SDEQUEUE(0x2)
    EvtEnqueueConditionalTutCall(
        -1,
        TUTORIAL_EVT_TYPE_AFTERMOVE)

    SVAL(EVT_SLOT_C, true)
    GOTO(0x2)

LABEL(0x0)
    SET_CURSOR(-1, -1)
    CAMERA(-1, -1)
    CURSOR_FLASHING(-1, -1)
    STAL3(8)

    TUTORIALTEXTBOXSTART
    SDEQUEUE(EVT_SLOT_2)
    SDEQUEUE(EVT_SLOT_B)
    BEQ(0x1, EVT_SLOT_2, EVT_SLOT_0)
    TEXTSHOW(-1)
    TEXTEND
    REMA

LABEL(0x1)
    CURE
    SDEQUEUE(EVT_SLOT_C)
    SDEQUEUE(EVT_SLOT_2)
    EvtEnqueueConditionalTutCall(
        -1,
        TUTORIAL_EVT_TYPE_DESTSELECTED)

    SVAL(EVT_SLOT_C, false)

LABEL(0x2)
    ENDA
};

CONST_DATA EventListScr EventScr_ConfigHardModeLoadUnitHard[] = {
    CHECK_HARD
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)

    EvtSetLoadUnitCount(-1)
    GOTO(0x1)

LABEL(0x0)
    EvtSetLoadUnitCount(0) /* Don't load any unit for next LOAD */

LABEL(0x1)
    ENDA
};

CONST_DATA EventListScr EventScr_9EE84C[] = {
    RANDOMNUMBER(99)
    SVAL(EVT_SLOT_7, -1)
    SVAL(EVT_SLOT_8, 0)

LABEL(0x0)
    SDEQUEUE(EVT_SLOT_9)
    SVAL(EVT_SLOT_1, 0x1)
    SADD(EVT_SLOT_7, EVT_SLOT_7, EVT_SLOT_1)
    SADD(EVT_SLOT_8, EVT_SLOT_8, EVT_SLOT_9)
    BLE(0x0, EVT_SLOT_8, EVT_SLOT_C)

    SVAL(EVT_SLOT_D, 0x0)
    SVAL(EVT_SLOT_1, 0x0)
    SAVETOQUEUE
    SVAL(EVT_SLOT_1, 0x28)
    SAVETOQUEUE
    SVAL(EVT_SLOT_1, 0x3C)
    SAVETOQUEUE
    SVAL(EVT_SLOT_1, 0x50)
    SAVETOQUEUE
    SVAL(EVT_SLOT_1, 0x64)
    SAVETOQUEUE

LABEL(0x1)
    SVAL(EVT_SLOT_1, 0x1)
    SSUB(EVT_SLOT_7, EVT_SLOT_7, EVT_SLOT_1)
    SDEQUEUE(EVT_SLOT_2)
    BLE(0x1, EVT_SLOT_0, EVT_SLOT_7)

    EvtSetLoadUnitChance(-1)
    SVAL(EVT_SLOT_D, 0x0)
    ENDA
};

CONST_DATA EventListScr EventScr_9EE8F0[] = {
    CHECK_EVENTID(-1)
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)

    ASMC(DisplayMapClearMapAnim)
    SADD(EVT_SLOT_2, EVT_SLOT_3, EVT_SLOT_0)
    MNCH(-1)
    ASMC(StartRetreatProcessing)
    ENDB /* <!> */

LABEL(0x0)
    ENDA
};

CONST_DATA EventListScr EventScr_FloorClearInTower[] = {
    EVBIT_MODIFY(4)
    ASMC(DisplayMapClearMapAnim)

    /**
     * Proceed to next floor?
     */
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, -1)
    TEXTSHOW(0x8FD)
    TEXTEND

    SVAL(EVT_SLOT_7, POS_R)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_7)
    MNCH(-1)
    ASMC(StartRetreatProcessing)
    GOTO(0x1)

LABEL(0x0)
    SADD(EVT_SLOT_2, EVT_SLOT_3, EVT_SLOT_0)
    MNC3(-1)
    ASMC(UnlockPostgameAllyByEnemyCount)

LABEL(0x1)
    ENDA
};

CONST_DATA EventListScr EventScr_WholeTowerClear[] = {
    ASMC(DisplayCongratulationsMapAnim)
    ASMC(RecordDisplayAfterTowerCleared)
    ASMC(UnlockPostgameAllyByClearCount)
    MNCH(-1)
    ENDA
};

CONST_DATA u16 Obj_089EE99C[] = {
    3,
    0x4100, 0xC000, 0x2200,
    0x4100, 0xC040, 0x2208,
    0x4100, 0xC080, 0x2210
};

CONST_DATA u16 * ImgLut_EventMapAnimMaskfx[] = {
    Img_0899D6DC,
    Img_99E1A4,
    Img_99ED44,
    Img_99F7D4,
    Img_9A0154,
    Img_9A0864,
};

u16 CONST_DATA * TsaLut_EventMapAnimMaskfx[] = {
    TileSet_9A0E84,
    TileSet_9A1050,
    TileSet_9A1228,
    TileSet_9A13EC,
    TileSet_9A15B4,
    TileSet_9A174C,
};

void sub_8085C10()
{
    UpdateBestGlobalSupportValue(0x100, 0x100, 1);
}

void sub_8085C24()
{
    UpdateBestGlobalSupportValue(0x100, 0x100, 2);
}

void sub_8085C38()
{
    UpdateBestGlobalSupportValue(0x100, 0x100, 3);
}

void sub_8085C4C()
{
    InitDungeon(0);
}

void sub_8085C58()
{
    InitDungeon(1);
}

/* Display the "Map Clear!"" Effect (From the Tower of Valni and Lagdou Ruins) */
void DisplayMapClearMapAnim(ProcPtr proc)
{
    DisplayEventMapAnim(proc, 1);
}

void DisplayCongratulationsMapAnim(ProcPtr proc)
{
    DisplayEventMapAnim(proc, 0);
}

void DisplayEventMapAnim(ProcPtr parent, int val)
{
    struct ProcEventMapAnim * proc = Proc_StartBlocking(ProcScr_EventMapAnim, parent);

#ifndef NONMATCHING
    asm("add r2, r0, #0");
#endif
    proc->mode = val;

    SetDispEnable(0, 0, 1, 1, 1);
    FlushLCDControl();
    
    BG_SetPosition(0, 0, 0xFFD4);
    BG_SetPosition(1, 0, 0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);

    SetWinEnable(0, 0, 0);
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;
    SetBlendConfig(1, 4, 0xC, 0);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 1);

    Decompress(Img_PhaseChangeSquares, BG_CHR_ADDR(BGCHR_PHASE_CHANGE_SQUARES));
    ApplyPalette(Pal_PhaseChangePlayer, BGPAL_PHASE_CHANGE);

    DrawEventMapAnimMaskfx(0, 0);
    ApplyPalette(Pal_EventMapAnimMaskfx, 0);

    if (0 == val) {
        Decompress(Img_Congratulations, BG_CHR_ADDR(0xA00));
        ApplyPalette(Pal_Congratulations, 0x12);
    } else {
        Decompress(Img_MapClear, BG_CHR_ADDR(0xA00));
        ApplyPalette(Pal_MapClear, 0x12);
    }

    BG_EnableSyncByMask(3);
    gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0;
    EnablePaletteSync();
}

void DrawEventMapAnimMaskfx(int index, int mode)
{
    if (0 == mode)
        Decompress(ImgLut_EventMapAnimMaskfx[index], BG_CHR_ADDR(0x140));
    else
        Decompress(ImgLut_EventMapAnimMaskfx[index], BG_CHR_ADDR(0x200));
}

void sub_8085E08(int index, int mode)
{
    int i;
    u16 *buf = gBG0TilemapBuffer;
    int val = 0x200;
    if (0 == mode)
        val = 0x140;

    Decompress(TsaLut_EventMapAnimMaskfx[index], buf);

    for (i = 0; i < 0x160; i++, buf++)
        *buf += val;
}

void sub_8085E48(struct ProcEventMapAnim * proc)
{
    if (0 == proc->mode)
        StartBgm(0x3D, 0);
    else
        StartBgm(0x3C, 0);

    SetDispEnable(1, 1, 1, 1, 1);
    proc->timer = 0;
}

void sub_8085E94(struct ProcEventMapAnim * proc)
{
    int iy, ix;
    struct Proc89EEA28 *child;

    for (iy = 2; iy >= 0; --iy) {
        for (ix = 14; ix >= 0; --ix) {
            int val = (ix - proc->timer) + (0xE - iy);
            int newX, newY;

            if (val > 0x10)
                val = 0x10;
            if (val < 0)
                val = 0;

            val = (0x10 - val) & 0xFE;

            newX = ix * 2;
            newY = iy * 2 + 0x07;

            gBG1TilemapBuffer[TILEMAP_INDEX(newX + 0, newY + 0)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x00, BGPAL_PHASE_CHANGE);
            gBG1TilemapBuffer[TILEMAP_INDEX(newX + 1, newY + 0)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x01, BGPAL_PHASE_CHANGE);
            gBG1TilemapBuffer[TILEMAP_INDEX(newX + 0, newY + 1)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x20, BGPAL_PHASE_CHANGE);
            gBG1TilemapBuffer[TILEMAP_INDEX(newX + 1, newY + 1)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x21, BGPAL_PHASE_CHANGE);
        }
    }

    proc->timer++;
    BG_EnableSyncByMask(2);

    if (0x1C == proc->timer) {
        proc->timer = 0;
        child = Proc_Start(gUnknown_089EEA28, proc);
        child->mode = proc->mode;
        Proc_Break(proc);
    }
}

void nullsub_30()
{
    return;
}

void sub_8085F88(struct ProcEventMapAnim * proc)
{
    int iy, ix;

    for (iy = 2; iy >= 0; --iy) {
        for (ix = 14; ix >= 0; --ix) {
            int val = (ix - proc->timer) + (0xE - iy);
            int newX, newY;

            if (val > 0x10)
                val = 0x10;
            if (val < 0)
                val = 0;

            val = val & 0xFE;

            newX = ix * 2;
            newY = iy * 2 + 0x07;

            gBG1TilemapBuffer[TILEMAP_INDEX(newX + 0, newY + 0)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x01, BGPAL_PHASE_CHANGE) + TILE_HFLIP;
            gBG1TilemapBuffer[TILEMAP_INDEX(newX + 1, newY + 0)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x00, BGPAL_PHASE_CHANGE) + TILE_HFLIP;
            gBG1TilemapBuffer[TILEMAP_INDEX(newX + 0, newY + 1)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x21, BGPAL_PHASE_CHANGE) + TILE_HFLIP;
            gBG1TilemapBuffer[TILEMAP_INDEX(newX + 1, newY + 1)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x20, BGPAL_PHASE_CHANGE) + TILE_HFLIP;
        }
    }
    
    proc->timer++;
    BG_EnableSyncByMask(2);

    if (0x1C == proc->timer) {
        Proc_EndEach(gUnknown_089EEA28);
        proc->timer = 0;
        proc->count = 0;
        SetBlendConfig(1, 0x10, 0x10, 0);
        SetBlendTargetA(1, 0, 0, 0, 0);
        SetBlendTargetB(0, 1, 1, 1, 1);
        Proc_Break(proc);
    }
}

void sub_808609C(struct ProcEventMapAnim * proc)
{
    switch (proc->timer) {
        case 0:
            sub_8085E08(proc->count, 1 & proc->count);
            BG_EnableSyncByMask(1);
            proc->count += 1;
            break;

        case 1:
            if (6 == proc->count) {
                Proc_Break(proc);
                return;
            }
            DrawEventMapAnimMaskfx(proc->count, 1 & proc->count);
            proc->timer = -1;
            break;

        default:
            break;
    }

    proc->timer++;
}

void sub_8086100(struct ProcEventMapAnim * proc)
{
    BG_SetPosition(0, 0, 0);
    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_EnableSyncByMask(3);
    SetDefaultColorEffects();
}

void sub_8086134(struct Proc89EEA28 * proc)
{
    proc->timer = 0;
}

void sub_808613C(struct Proc89EEA28 * proc)
{
    int val1 = Interpolate(0, -24, 0, proc->timer, 0x10);
    int val2 = Interpolate(0, 2, 0x100, proc->timer, 0x10);

    SetObjAffine(
        0,
        Div(+COS(0) * 0x10, 0x100),
        Div(-SIN(0) * 0x10, val2),
        Div(+SIN(0) * 0x10, 0x100),
        Div(+COS(0) * 0x10, val2)
    );
    
    PutSprite(
        0, 0x1FF & (val1 + 0x18), 0x40,
        Obj_089EE99C, 0
    );

    if (0x10 == proc->timer) {
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }

    proc->timer++;
}

void sub_808622C(struct Proc89EEA28 * proc)
{
    int val = Interpolate(0, 0, 0x10, proc->timer, 8);

    if (0 == proc->mode)
        ApplyPalette(Pal_Congratulations, 0x12);
    else
        ApplyPalette(Pal_MapClear, 0x12);

    EfxPalWhiteInOut(gPaletteBuffer, 0x12, 1, val);
    EnablePaletteSync();
    PutSprite(0, 0x18, 0x40, Obj_089EE99C, 0);

    if (8 == proc->timer) {
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }

    proc->timer++;
}

void sub_80862C4(struct Proc89EEA28 * proc)
{
    int val = Interpolate(0, 0x10, 0, proc->timer, 8);

    if (0 == proc->mode)
        ApplyPalette(Pal_Congratulations, 0x12);
    else
        ApplyPalette(Pal_MapClear, 0x12);

    EfxPalWhiteInOut(gPaletteBuffer, 0x12, 1, val);
    EnablePaletteSync();
    PutSprite(0, 0x18, 0x40, Obj_089EE99C, 0);

    if (8 == proc->timer) {
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }

    proc->timer++;
}

void sub_808635C(struct Proc89EEA28 * proc)
{
    SetObjAffine(
        0,
        Div(+COS(0) * 0x10, 0x100),
        Div(-SIN(0) * 0x10, 0x100),
        Div(+SIN(0) * 0x10, 0x100),
        Div(+COS(0) * 0x10, 0x100)
    );
    PutSprite(0, 0x18, 0x40, Obj_089EE99C, 0);

    if (0x20 == proc->timer)
        Proc_BreakEach(ProcScr_EventMapAnim);

    proc->timer++;
}

struct ProcCmd CONST_DATA ProcScr_EventMapAnim[] = {
    PROC_SLEEP(1),
    PROC_CALL(sub_8085E48),
    PROC_REPEAT(sub_8085E94),
    PROC_REPEAT(nullsub_30),
    PROC_REPEAT(sub_8085F88),
    PROC_REPEAT(sub_808609C),
    PROC_CALL(sub_8086100),
    PROC_SLEEP(8),
    PROC_END,
};

struct ProcCmd CONST_DATA gUnknown_089EEA28[] = {
    PROC_CALL(sub_8086134),
    PROC_REPEAT(sub_808613C),
    PROC_REPEAT(sub_808622C),
    PROC_REPEAT(sub_80862C4),
    PROC_REPEAT(sub_808635C),
    PROC_END,
};
