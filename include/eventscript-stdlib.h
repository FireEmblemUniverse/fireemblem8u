#pragma once

/**
 * port for: EA Standard Library
 */

#include "eventscript.h"
#include "constants/event-flags.h"

#define ENDA EvtReturn
#define ENDB EvtEndAll
#define EVBIT_F EvtClearEvBits
#define EVBIT_T EvtSetEvBits
#define ENUF EvtClearFlag
#define ENUT EvtSetFlag
#define SVAL EvtSetSlot
#define LABEL EvtLabel
#define CALL EvtCall
#define BNE EvtBNE
#define ASMC EvtAsmCall
#define STAL EvtSleep
#define STAL1 EvtSleepWithCancel
#define STAL2 EvtSleepWithGameCtrl
#define STAL3 EvtSleepWithCancelGameCtrl
#define MUSI EvtSetVolumeDown
#define MUNO EvtUnsetVolumeDown
#define CHECK_TUTORIAL EvtCheckTutorial
#define TEXTSTART EvtTextStart
#define TEXTSHOW EvtTextShow
#define REMA EvtTextRemoveAll
#define TEXTEND EvtTextEnd
#define LOAD1 EvtLoadUnit1
#define MOVE EvtMoveUnit
#define _WARP EvtMoveUnitToValidTerrain /* This is an error on EA stdlib */
#define ENUN EvtWaitUnitMoving
#define SET_HP EvtSetHpFormSlot1
#define CURSOR_CHAR EvtDisplayCursorAtUnit
#define CURSOR_FLASHING_CHAR EvtDisplayFlashingCursorAtUnit
#define CURE EvtEndCursor
#define CUMO_CHAR CURSOR_CHAR

#define END_MAIN EvtListEnd
#define TURN EvtListTurn
#define AFEV EvtListFlag

/* Main Code Helpers */
#define DefeatBoss(event_scr) AFEV(EVFLAG_WIN, (event_scr), EVFLAG_DEFEAT_BOSS)
#define CauseGameOverIfLordDies AFEV(0, gEvent_GameOver, EVFLAG_GAMEOVER)
#define NoFade EVBIT_T(0x7)

/* Unit Helpers */
#define FlashCursorCHAR(pid, time) \
    CUMO_CHAR(pid) \
    STAL(time) \
    CURE

/* Convo Helpers */
#define Text(msg) \
    TEXTSTART \
    TEXTSHOW(msg) \
    TEXTEND \
    REMA

#define Text_BG(bg, msg) \
    EvtSetSlot(EVT_SLOT_2, (bg)) \
    EvtSetSlot(EVT_SLOT_3, (msg)) \
    EvtCall(Event_TextWithBG)
