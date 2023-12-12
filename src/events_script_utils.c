#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "eventscript.h"
#include "ea-stdlib.h"
#include "chapterdata.h"
#include "constants/event-flags.h"
#include "constants/characters.h"

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

CONST_DATA EventListScr EventScr_9EE19C[] = {
    CHECK_ACTIVE
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_2)

    CALL(EventScr_ExitWithTriggerEidUnset)

LABEL(0x0)
    ENDA
};

CONST_DATA EventListScr EventScr_9EE1B8[] = {
    CHECK_ALLEGIANCE(-1)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_2)

    CALL(EventScr_ExitWithTriggerEidUnset)

LABEL(0x0)
    ENDA
};

CONST_DATA EventListScr EventScr_ExitWithTriggerEidUnset[] = {
    CHECK_EVENTID_
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    ENUF(-1)

    NoFade
    ENDB
};

CONST_DATA EventListScr EventScr_9EE1E8[] = {
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)

    LOAD1(1, -1)
    ENUN
    GOTO(0x1)

LABEL(0x0)
    LOAD1(0, -1)
    ENUN

LABEL(0x1)
    ENDA
};

CONST_DATA EventListScr EventScr_9EE218[] = {
    CHECK_TUTORIAL
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)

    CHECK_HARD
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)

    SADD(EVT_SLOT_2, EVT_SLOT_3, EVT_SLOT_0)

LABEL(0x0)
    SADD(EVT_SLOT_C, EVT_SLOT_4, EVT_SLOT_0)
    CALL(EventScr_9EE1E8)
    ENDA
};

CONST_DATA EventListScr EventScr_9EE248[] = {
    CHECK_TUTORIAL
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)

    CHECK_HARD
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)

    SADD(EVT_SLOT_C, EVT_SLOT_3, EVT_SLOT_0)
    CALL(EventScr_9EE1E8)

LABEL(0x0)
    ENDA
};

CONST_DATA EventListScr EventScr_9EE274[] = {
    EVBIT_MODIFY(4)
    CALL(EventScr_RemoveBGIfNeeded)
    EVBIT_T(EV_STATE_0008 | EV_STATE_ABORT)
    LOAD1(1, -1)
    ENUN

    EVBIT_F(EV_STATE_0008 | EV_STATE_ABORT)
    EVBIT_MODIFY(0)
    ENDA
};

CONST_DATA EventListScr EventScr_9EE29C[] = {
    CHECK_TUTORIAL
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)

    CHECK_HARD
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)

    CALL(EventScr_9EE274)

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

CONST_DATA EventListScr EventScr_9EE39C[] = {
LABEL(0x0)
    BLE(0x1, EVT_SLOT_D, EVT_SLOT_0)
    SDEQUEUE(EVT_SLOT_B)
    CURSOR_FLASHING(-1, -1)
    GOTO(0x0)

LABEL(0x1)
    ENDA
};

CONST_DATA EventListScr EventScr_MoveUnitSbToLeader[] = {
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
