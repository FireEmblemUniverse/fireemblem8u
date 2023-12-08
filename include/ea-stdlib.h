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
#define SENQUEUE EvtEnqueueFormSlot
#define SENQUEUE1 EvtEnqueueFormSlot1
#define SDEQUEUE EvtDequeueToSlot
#define LABEL EvtLabel
#define CALL EvtCall
#define BNE EvtBNE
#define ASMC EvtAsmCall
#define STAL EvtSleep
#define STAL1 EvtSleepWithCancel
#define STAL2 EvtSleepWithGameCtrl
#define STAL3 EvtSleepWithCancelGameCtrl
#define MUSC EvtStartBgm
#define MUSCFAST EvtBgmFadeInFast
#define MUSCMID EvtBgmFadeInMiddleSpeed
#define MUSCSLOW EvtBgmFadeInSlowly
#define MUSI EvtSetVolumeDown
#define MUNO EvtUnsetVolumeDown
#define FADU EvtFadeOutBlack
#define FADI EvtFadeInBlack
#define FAWU EvtFadeOutWhite
#define FAWI EvtFadeInWhite
#define CHECK_TUTORIAL EvtCheckTutorial
#define TEXTSTART EvtTextStart
#define TEXTSHOW EvtTextShow
#define REMA EvtTextRemoveAll
#define TEXTEND EvtTextEnd
#define LOMA EvtLoadMap
#define CAMERA EvtMoveCameraTo
#define LOAD1 EvtLoadUnit1
#define LOAD2 EvtLoadUnit2
#define MOVE EvtMoveUnit
#define MOVEONTO EvtMoveUnitToTarget
#define MOVE_1STEP EvtMoveUnitOneStpe
#define MOVEFORCED EvtMoveUnitByQueue
#define _WARP EvtMoveUnitToValidTerrain /* This is an error on EA stdlib */
#define ENUN EvtWaitUnitMoving
#define SET_HP EvtSetHpFormSlot1
#define CLEA EvtHideAllAlliess
#define CLEN EvtRemoveAllNpcs
#define CLEE EvtRemoveAllEimies
#define DISA EvtRemoveUnit
#define BROWNBOXTEXT EvtDisplayPopupSilently
#define CURSOR_CHAR EvtDisplayCursorAtUnit
#define CURSOR_FLASHING_CHAR EvtDisplayFlashingCursorAtUnit
#define CURE EvtEndCursor
#define FIGHT EvtStartEventBattle
#define FIGHT_MAP EvtStartEventMapBattle
#define FIGHT_SCRIPT EvtStartScriptedBattle

#define CUMO_CHAR CURSOR_CHAR

#define END_MAIN EvtListEnd
#define TURN EvtListTurn
#define AFEV EvtListFlag

/* Main Code Helpers */
#define DefeatBoss(event_scr) AFEV(EVFLAG_WIN, (event_scr), EVFLAG_DEFEAT_BOSS)
#define CauseGameOverIfLordDies AFEV(0, gEvent_GameOver, EVFLAG_GAMEOVER)
#define NoFade EVBIT_T(0x7)

/* Unit Helpers */
#define FlashCursor(pid, time) \
    CUMO_CHAR(pid) \
    STAL(time) \
    CURE

#define StartBattle                           SVAL(EVT_SLOT_D, 0)
#define NormalDamage(combatantNumber,damage)  SVAL(EVT_SLOT_1, combatantNumber + damage * 0x100) SAVETOQUEUE
#define CriticalHit(combatantNumber,damage)   SVAL(EVT_SLOT_1, combatantNumber + damage * 0x100 + 0x00010000) SAVETOQUEUE
#define MissedAttack(combatantNumber,damage)  SVAL(EVT_SLOT_1, combatantNumber + damage * 0x100 + 0x00020000) SAVETOQUEUE
#define Silencer(combatantNumber,damage)      SVAL(EVT_SLOT_1, combatantNumber + damage * 0x100 + 0x00080000) SAVETOQUEUE
#define SureShot(combatantNumber,damage)      SVAL(EVT_SLOT_1, combatantNumber + damage * 0x100 + 0x00400000) SAVETOQUEUE
#define Poison(combatantNumber,damage)        SVAL(EVT_SLOT_1, combatantNumber + damage * 0x100 + 0x00400000) SAVETOQUEUE
#define DevilReversal(combatantNumber,damage) SVAL(EVT_SLOT_1, combatantNumber + damage * 0x100 + 0x00800000) SAVETOQUEUE
#define Pierce(combatantNumber,damage)        SVAL(EVT_SLOT_1, combatantNumber + damage * 0x100 + 0xC0000000) SAVETOQUEUE
#define EndAttack                             SVAL(EVT_SLOT_1, 0xFFFFFFFF) SAVETOQUEUE

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

/* Code Ailases */
#define SLOTS_SETFROMQUEUE SDEQUEUE
#define SAVETOQUEUE SENQUEUE1
#define STQFROMSLOT SENQUEUE1
