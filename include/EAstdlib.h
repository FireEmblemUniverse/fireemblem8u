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
#define CHECK_EVBIT EventCheckEvbit
#define CHECK_EVENTID EventCheckFlag
#define RANDOMNUMBER EvtGetRandom
#define SVAL EvtSetSlot
#define SADD EvtSlotADD
#define SSUB EvtSlotSUB
#define SMUL EvtSlotMUL
#define SDIV EvtSlotDIV
#define SMOD EvtSlotMOD
#define SAND EvtSlotAND
#define SORR EvtSlotORR
#define SXOR EvtSlotXOR
#define SLSL EvtSlotLSL
#define SLSR EvtSlotLSR
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
#define ASMC2 EvtAsmCallEnableSkip
#define STAL EvtSleep
#define STAL1 EvtSleepWithCancel
#define STAL2 EvtSleepWithGameCtrl
#define STAL3 EvtSleepWithCancelGameCtrl
#define EVBIT_MODIFY EvtModifyEvBit
#define IGNORE_KEYS EvtSetKeyIgnore
#define COUNTER_CHECK EvtGetCounter
#define COUNTER_SET EvtSetCounter
#define COUNTER_INC EvtIncCounter
#define COUNTER_DEC EvtDecCounter
#define MUSC EvtStartBgm
#define MUSCFAST(bgm) EvtBgmFadeIn(bgm, 2)
#define MUSCMID(bgm) EvtBgmFadeIn(bgm, 4)
#define MUSCSLOW(bgm) EvtBgmFadeIn(bgm, 6)
#define MUSCSSLOW(bgm) EvtBgmFadeIn(bgm, 8)
#define MUSS EvtOverrideBgm
#define MURE EvtRestoreBgm
#define MUSI EvtSetVolumeDown
#define MUNO EvtUnsetVolumeDown
#define SOUN EvtPlaySong
#define FADU EvtFadeOutBlack
#define FADI EvtFadeInBlack
#define FAWU EvtFadeOutWhite
#define FAWI EvtFadeInWhite
#define STARTFADE EvtColorFadeStart
#define ENDFADE EvtColorFadeEnd
// #define FADECOLORS EvtColorFadeSetup
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
#define TEXTCONT EvtContinueText
#define TEXTEND EvtTextEnd
#define BACG EvtDisplayTextBg
#define FACE_SHOW EvtDisplayFace
#define CLEAN EvtClearScreen
#define LOMA EvtLoadMap
#define CAMERA EvtMoveCameraTo
#define CAMERA_CAHR EvtMoveCameraToChar
#define CAMERA2 EvtMoveCameraToCenter
#define CAMERA2_CAHR EvtMoveCameraToCharCenter
#define TILECHANGE EvtTriggerMapChange
#define TILEREVERT EvtRevertMapChange
#define VCWF(vision) EvtChangeFogVision(false, (vision))
#define MNTS EvtBackToTitle
#define MNCH EvtChangeChapterWM
#define MNC2 EvtChangeChapterBM
#define MNC3 EvtChangeChapterNoSave
#define MNC4 EvtMoveToGameEnding
#define LOAD1 EvtLoadUnit1
#define LOAD2 EvtLoadUnit2
#define LOAD3 EvtLoadUnit3
#define LOAD4 EvtLoadUnit4
#define UNIT_COLORS EvtChangePalSMS
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
#define SHOW_ATTACK_RANGE EvtShowAttackRange
#define HIDE_ATTACK_RANGE EvtHideAttackRange
#define REMU EvtSetUnitHidden
#define REVEAL EvtSetUnitUnhidden
#define CUSA(pid) EvtChangeFaction(pid, FACTION_ID_BLUE)
#define CUSN(pid) EvtChangeFaction(pid, FACTION_ID_GREEN)
#define CUSE(pid) EvtChangeFaction(pid, FACTION_ID_RED)
#define SET_HP EvtSetUnitHpFormSlot1
#define SET_ENDTURN EvtSetUnitUnselectable
#define _3427 EvtSetUnitHasMoved
#define SET_STATE EvtSetUnitStateFormSlot1
#define CLEA EvtHideAllAlliess
#define CLEN EvtRemoveAllNpcs
#define CLEE EvtRemoveAllEimies
#define KILL EvtKillUnit
#define DISA_IF EvtWaitUnitDeathFade
#define SPAWN_ALLY(pid, x, y) EvtLoadSingleUnit(FACTION_ID_BLUE, pid, x, y)
#define SPAWN_NPC(pid, x, y) EvtLoadSingleUnit(FACTION_ID_GREEN, pid, x, y)
#define SPAWN_ENEMY(pid, x, y) EvtLoadSingleUnit(FACTION_ID_RED, pid, x, y)
#define SPAWN_CUTSCENE_ALLY(pid, x, y) EvtLoadSingleUnit(EVSUBCMD_SPAWN_CUTSCENE_ALLY, pid, x, y)
#define DISA EvtRemoveUnit
#define CHECK_INAREA EvtCheckInArea
#define GIVEITEMTO EvtGiveItemAtSlot3
#define GIVEITEMTOMAIN EvtGiveMoneymAtSlot3         /* what */
#define GIVETOSLOT3 EvtGiveMoneymAtSlot3NoPopup     /* tf */
#define SET_ACTIVE EvtSetActiveUnit
#define CHAI EvtChangeAI
#define CHAI_AT EvtChangeAIat
#define NOTIFY EvtDisplayPopup
#define BROWNBOXTEXT EvtDisplayPopupSilently
#define CURSOR_AT EvtDisplayCursorAt
#define CURSOR_CHAR EvtDisplayCursorAtUnit
#define CURSOR_FLASHING EvtDisplayFlashingCursorAt
#define CURSOR_FLASHING_CHAR EvtDisplayFlashingCursorAtUnit
#define CURE EvtEndCursor
#define DISABLEOPTIONS EvtOverrideUnitMenu
#define DISABLEWEAPONS EvtOverrideWeaponMenu
#define CHECK_CURSOR EvtGetCursorPosition
#define SET_CURSOR EvtSetCursorPosition
#define PREP EvtCallPrepScreen
#define FIGHT EvtStartEventBattle
#define FIGHT_MAP EvtStartEventMapBattle
#define FIGHT_SCRIPT EvtSetScriptedBattle
#define PROM EvtPromoteUnit
#define WARP_OUT EvtWarpOUT
#define WARP_IN EvtWarpIN
#define ENDWARP EvtWarpSTAL /* This command name is also not true */
#define EARTHQUAKE_START EvtStartEarthQuake
#define EARTHQUAKE_END EvtEndEarthQuake
#define SUMMONUNIT EvtSummonUnit
#define BREAKSTONE EvtBreakStone
#define GLOWINGCROSS EvtShowGlowingCross
#define GLOWINGCROSS_END EvtRemoveGlowingCross

#define CUMO_AT CURSOR_AT
#define CUMO_CHAR CURSOR_CHAR

#define END_MAIN EvtListEnd
#define TURN EvtListTurn
#define CHAR EvtListTalk
#define CHAR_ EvtListConditionalTalk
#define LOCA EvtListTile
#define AFEV EvtListFlag
#define AREA EvtListArea

/* World map events */
#define WM_CENTERCAMONLORD WmEvtSetCameraOnto
#define WM_SHOWDRAWNMAP WmEvtShowBigMap
#define WM_SPAWNLORD WmEvtLoadUnit
#define WM_FADEOUT WmEvtFadeOut
#define WM_TEXTDECORATE WmEvtWaitFade
#define WM_SHOWTEXTWINDOW WmEvtDisplayTextWindow
#define WM_WAITFORTEXT WmEvtTextBoxWait
#define WM_TEXTSTART WmEvtTextStart
#define WM_REMOVETEXT WmEvtRemoveText
#define WM_TEXT WmEvtShowText
#define WM_MOVECAM WmEvtGmScroll
#define WM_WAITFORCAM WmEvtWaitGmScroll
#define WM_MOVECAM2 WmEvtCamMov2
#define WM_SHOWPORTRAIT WmEvtShowPortrait
#define WM_CLEARPORTRAIT WmEvtClearPortrait
#define WM_HIGHLIGHT WmEvtHighlightNation
#define WM_HIGHLIGHTCLEAR1 WmEvtHighlightNationClear1
#define WM_HIGHLIGHTCLEAR2 WmEvtHighlightNationClear2
#define WM_PLACEDOT WmEvtMarkPoint
#define WM_FXCLEAR1 WmEvtRemoveMarkPoint1
#define WM_FXCLEAR2 WmEvtRemoveMarkPoint2
#define PUTSPRITE WmEvtShowMU
#define WM_PUTMOVINGSPRITE WmEvtMoveUnit
#define WM_WAITFORSPRITES WmEvtWaitMU
#define WM_REMSPRITE WmEvtRemoveMU
#define WM_PUTSPRITE WmEvtSetUnitPosition
#define WM_FADEINSPRITE WmEvtFadeMU
#define WM_WAITFORSPRITELOAD WmEvtWaitMuFade
#define SKIPWN WmEvtSkipWmEvents
#define WM_CREATENEXTDESTINATION WmEvtDrawNodeNextChapter
#define WM_WAITFORFX WmEvtWaitNodeDisplay
#define WM_MAKELORDVISIBLE WmEvtShowUnit
#define WM_DRAWPATH WmEvtDrawPath
#define WM_WAITFORFXCLEAR1 WmEvtRemoveBigMap
#define WM_WAITFORFXCLEAR2 WmEvtWaitBigMapRemove
#define WM_MOVESPRITETO WmEvtMoveUnitInPath
#define WM_MAKELORDDISAPPEAR WmEvtHideUnit
#define WM_FADEOUTSPRITE WmEvtUnitFadeOut
#define WM_REMOVELOCATION WmEvtRemoveNode
#define WM_REMOVEPATH WmEvtRemovePath
#define WM_LOADLOCATION2 WmEvtEnableNode
#define WM_SETDESTINATION WmEvtSetNextStoryNodeSilent
#define WM_LOADLOCATION3 WmEvtDisplayNode
#define WM_DRAWPATH2 WmEvtAddPath
#define WM_SETCAM WmEvtSetCameraAt
#define DRAWPATH3 WmEvtDisplayPath
#define WM_MOVECAMTO WmEvtMoveCamToNode
#define WM_SATURATE_COLORS WmEvtFadeInDark

/*************************************************************
 * None EA stdlib but Mokha macros
 * Note that this part of macros is not usable in EventAssembler
 *************************************************************/

/**
 * pid: character you need to select
 * x, y: cursor need move to
 * text1: if you don't move cursor to [x, y]
 * text2: if you don't select the character
 */
#define TutEventExecType0(pid, curx, cury, text1, pos1, text2, pos2, scr_next, scr_this) \
    SVAL(EVT_SLOT_D, 0) \
    SVAL(EVT_SLOT_1, (pid)) \
    SAVETOQUEUE \
    SVAL(EVT_SLOT_1, (_EvtParams2(curx, cury))) \
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
    CALL(EventScr_Tutorial_Exec0)

#define TutEventExecType1(curx, cury, text, pos, scr_next, scr_this) \
    SVAL(EVT_SLOT_D, 0) \
    SVAL(EVT_SLOT_1, (_EvtParams2(curx, cury))) \
    SAVETOQUEUE \
    SVAL(EVT_SLOT_1, (text)) \
    SAVETOQUEUE \
    SVAL(EVT_SLOT_1, (pos)) \
    SAVETOQUEUE \
    SVAL(EVT_SLOT_1, (scr_next)) \
    SAVETOQUEUE \
    SVAL(EVT_SLOT_1, (scr_this)) \
    SAVETOQUEUE \
    CALL(EventScr_Tutorial_Exec1)

#include "EA_Standard_Library/Main_Code_Helpers.h"
#include "EA_Standard_Library/Unit_Helpers.h"
#include "EA_Standard_Library/Convo_Helpers.h"
#include "EA_Standard_Library/Code_Ailases.h"
#include "EA_Standard_Library/End_Of_Chapter_Helpers.h"
#include "EA_Standard_Library/Conditional_Helpers.h"
#include "EA_Standard_Library/AI_Helpers.h"
