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
#define ENUF_SLOT2 EvtClearFlagAtSlot2
#define ENUT EvtSetFlag
#define SVAL EvtSetSlot
#define CHECK_EVBIT EventCheckEvbit
#define CHECK_EVENTID EventCheckFlag
#define SADD EvtSlotAdd
#define SENQUEUE EvtEnqueueFormSlot
#define SENQUEUE1 EvtEnqueueFormSlot1
#define SDEQUEUE EvtDequeueToSlot
#define LABEL EvtLabel
#define GOTO EvtGoto
#define CALL EvtCall
#define BEQ EvtBEQ
#define BNE EvtBNE
#define BGE EvtBGE
#define BGT EvtBGT
#define BLE EvtBLE
#define BLT EvtBLT
#define ASMC EvtAsmCall
#define STAL EvtSleep
#define STAL1 EvtSleepWithCancel
#define STAL2 EvtSleepWithGameCtrl
#define STAL3 EvtSleepWithCancelGameCtrl
#define EVBIT_MODIFY EvtModifyEvBit
#define IGNORE_KEYS EvtSetKeyIgnore
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
#define CHECK_MODE EvtGetMode
#define CHECK_CHAPTER_NUMBER EvtGetChapterIndex
#define CHECK_HARD EvtGetIsHard
#define CHECK_TURNS EvtGetCurrentTurn
#define CHECK_ENEMIES EvtGetEnemyAmount
#define CHECK_OTHERS EvtGetNpcAmount
#define CHECK_SKIRMISH EvtGetSkirmishType
#define CHECK_TUTORIAL EvtGetIsTutorial
#define CHECK_MONEY EvtGetMoney
#define CHECK_TRIG_EVENTID EvtGetTriggeredEid
#define CHECK_EVENTID_ CHECK_TRIG_EVENTID
#define CHECK_POSTGAME EvtGetIsGameCompleted
#define TEXTSTART EvtTextStart
#define REMOVEPORTRAITS EvtTextStartType1
#define _1A22 EvtTextStartType2
#define TUTORIALTEXTBOXSTART EvtTextTuorialStart
#define SOLOTEXTBOXSTART EvtTextStartType4
#define _1A25 EvtTextStartType5
#define TEXTSHOW EvtTextShow
#define REMA EvtTextRemoveAll
#define TEXTEND EvtTextEnd
#define BACG EvtDisplayTextBg
#define CLEAN EvtClearScreen
#define LOMA EvtLoadMap
#define CAMERA EvtMoveCameraTo
#define TILECHANGE EvtTriggerMapChange
#define TILEREVERT EvtRevertMapChange
#define MNTS EvtBackToTitle
#define MNCH EvtChangeChapterWM
#define MNC2 EvtChangeChapterBM
#define MNC3 EvtChangeChapterNoSave
#define MNC4 EvtMoveToGameEnding
#define LOAD1 EvtLoadUnit1
#define LOAD2 EvtLoadUnit2
#define CHECK_AT EvtGetPidAt
#define CHECK_ACTIVE EvrGetActiveUnitPid
#define MOVE(speed, pid, x, y) EvtMoveUnit(false, speed, pid, x, y)
#define MOVEONTO(speed, pid, pid_target) EvtMoveUnitToTarget(false, speed, pid, pid_target)
#define MOVE_1STEP(speed, pid, direction) EvtMoveUnitOneStep(false, speed, pid, direction)
#define MOVE_DEFINED(pid) EvtMoveUnitByQueue(false, pid)
#define MOVE_CLOSEST(speed, pid, x, y) EvtMoveUnit(true, speed, pid, x, y)
#define MOVE_NEXTTO(speed, pid, pid_target) EvtMoveUnitToTarget(true, speed, pid, pid_target)
#define MOVE_1STEP_CLOSEST(speed, pid, direction) EvtMoveUnitOneStep(true, speed, pid, direction)
#define MOVE_DEFINED_CLOSEST(pid) EvtMoveUnitByQueue(true, pid)
#define CHECK_EXISTS EvtCheckUnitExists
#define CHECK_STATUS EvtGetUnitVisitGroup
#define CHECK_ALIVE EvtCheckUnitNotDead
#define CHECK_DEPLOYED EvtCheckUnitDeployed
#define CHECK_ACTIVEID EvtCheckUnitActive
#define CHECK_ALLEGIANCE EvtGetUnitFaction
#define CHECK_COORDS EvtGetUnitPosition
#define CHECK_CLASS EvtGetUnitJid
#define CHECK_LUCK EvtGetUnitLuck
#define ENUN EvtWaitUnitMoving
#define REMU EvtSetUnitHidden
#define REVEAL EvtSetUnitUnhidden
#define SET_HP EvtSetUnitHpFormSlot1
#define SET_ENDTURN EvtSetUnitUnselectable
#define _3427 EvtSetUnitHasMoved
#define CLEA EvtHideAllAlliess
#define CLEN EvtRemoveAllNpcs
#define CLEE EvtRemoveAllEimies
#define KILL EvtKillUnit
#define DISA_IF EvtWaitUnitDeathFade
#define SPAWN_ALLY(pid, x, y) EvtLoadSingleUnit(EVSUBCMD_SPAWN_ALLY, pid, x, y)
#define SPAWN_NPC(pid, x, y) EvtLoadSingleUnit(EVSUBCMD_SPAWN_NPC, pid, x, y)
#define SPAWN_ENEMY(pid, x, y) EvtLoadSingleUnit(EVSUBCMD_SPAWN_ENEMY, pid, x, y)
#define SPAWN_CUTSCENE_ALLY(pid, x, y) EvtLoadSingleUnit(EVSUBCMD_SPAWN_CUTSCENE_ALLY, pid, x, y)
#define DISA EvtRemoveUnit
#define GIVEITEMTO EvtGiveItemAtSlot3
#define GIVEITEMTOMAIN EvtGiveMoneymAtSlot3         /* what */
#define GIVETOSLOT3 EvtGiveMoneymAtSlot3NoPopup     /* tf */
#define CHAI EvtChangeAI
#define CHAI_AT EvtChangeAIat
#define BROWNBOXTEXT EvtDisplayPopupSilently
#define CURSOR_CHAR EvtDisplayCursorAtUnit
#define CURSOR_FLASHING EvtDisplayFlashingCursorAt
#define CURSOR_FLASHING_CHAR EvtDisplayFlashingCursorAtUnit
#define CURE EvtEndCursor
#define DISABLEOPTIONS EvtOverrideUnitMenu
#define DISABLEWEAPONS EvtOverrideWeaponMenu
#define FIGHT EvtStartEventBattle
#define FIGHT_MAP EvtStartEventMapBattle
#define FIGHT_SCRIPT EvtSetScriptedBattle

#define CUMO_CHAR CURSOR_CHAR

#define END_MAIN EvtListEnd
#define TURN EvtListTurn
#define AFEV EvtListFlag

/* Main Code Helpers */
#define DefeatBoss(event_scr) AFEV(EVFLAG_WIN, (event_scr), EVFLAG_DEFEAT_BOSS)
#define CauseGameOverIfLordDies AFEV(0, gEvent_GameOver, EVFLAG_GAMEOVER)
#define NoFade EVBIT_T(EV_STATE_SKIPPING | EV_STATE_0002 | EV_STATE_ABORT)

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

#define SetBackground(bg) \
    SVAL(EVT_SLOT_2, bg) \
    CALL(EventScr_SetBackground)

/* Code Ailases */
#define SLOTS_SETFROMQUEUE SDEQUEUE
#define SAVETOQUEUE SENQUEUE1
#define STQFROMSLOT SENQUEUE1


/*************************************************************
 * None EA stdlib but Mokha macros
 * Note that this part of macros is not usable in EventAssembler
 *************************************************************/

#define TutEventExecType0(pid, rect, text1, pos1, text2, pos2, scr_next, scr_this) \
    SVAL(EVT_SLOT_D, 0) \
    SVAL(EVT_SLOT_1, (pid)) \
    SAVETOQUEUE \
    SVAL(EVT_SLOT_1, (rect)) \
    SAVETOQUEUE \
    SVAL(EVT_SLOT_1, (text1)) \
    SAVETOQUEUE \
    SVAL(EVT_SLOT_1, (pos1)) \
    SAVETOQUEUE \
    SVAL(EVT_SLOT_1, (text2)) \
    SAVETOQUEUE \
    SVAL(EVT_SLOT_1, (pos2)) \
    SAVETOQUEUE \
    SVAL(EVT_SLOT_1, (scr_next)) \
    SAVETOQUEUE \
    SVAL(EVT_SLOT_1, (scr_this)) \
    SAVETOQUEUE \
    CALL(EventScr_Prologue_Tutorial0_Exec)

#define TutEventExecType1(rect, text, pos, scr_next, scr_this) \
    SVAL(EVT_SLOT_D, 0) \
    SVAL(EVT_SLOT_1, (rect)) \
    SAVETOQUEUE \
    SVAL(EVT_SLOT_1, (text)) \
    SAVETOQUEUE \
    SVAL(EVT_SLOT_1, (pos)) \
    SAVETOQUEUE \
    SVAL(EVT_SLOT_1, (scr_next)) \
    SAVETOQUEUE \
    SVAL(EVT_SLOT_1, (scr_this)) \
    SAVETOQUEUE \
    CALL(EventScr_Prologue_Tutorial1_Exec)
