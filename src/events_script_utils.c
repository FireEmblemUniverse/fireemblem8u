#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "eventscript.h"
#include "EAstdlib.h"
#include "eventcall.h"
#include "bmdifficulty.h"
#include "chapterdata.h"
#include "playerphase.h"
#include "constants/event-flags.h"
#include "constants/characters.h"
#include "constants/classes.h"

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
