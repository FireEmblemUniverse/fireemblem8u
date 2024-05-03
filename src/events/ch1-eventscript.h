#pragma once

#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "eventcall.h"
#include "EAstdlib.h"
#include "constants/characters.h"

CONST_DATA EventListScr EventScr_Ch1_BeginingScene[] = {
    MUSC(0x25)

    LOAD1(1, UnitDef_Event_Ch1Enemy)
    ENUN

    STAL2(60)
    CUMO_AT(2, 2)
    STAL(60)
    CURE

    Text_BG(0x26, 0x929)

    LOAD1(1, UnitDef_Event_Ch1NPC)
    ENUN

    SVAL(EVT_SLOT_B, 0)
    DISA(CHAR_EVT_POSITION_AT_SLOTB)

    FlashCursor(CHARACTER_BREGUET, 60)
    Text_BG(0x1C, 0x92A)

    MOVE(0, CHARACTER_BREGUET, 2, 3)
    ENUN

    /* Force set battle-quotes flag to make the following script-battle not to show battle quote */
    ENUT(EVFLAG_BATTLE_QUOTES)

    StartBattle
    CriticalHit(0, 20)
    NormalDamage(1, 0)
    EndAttack
    FIGHT(CHARACTER_BREGUET, CHARACHER_FRELIAN, 0, 0)

    /* Clear battle Quotes flag */
    ENUF(EVFLAG_BATTLE_QUOTES)

    SVAL(EVT_SLOT_B, 0x00020002)
    KILL(CHAR_EVT_POSITION_AT_SLOTB)
    DISA_IF(CHAR_EVT_POSITION_AT_SLOTB)

    FlashCursor(CHARACTER_BREGUET, 60)

    TEXTSHOW(0x92B)
    TEXTEND
    REMA

    SVAL(EVT_SLOT_2, EventScr_Ch1Tut_GuideWTA)
    CALL(EventScr_CallOnTutorialMode)

    MOVE(0, CHARACTER_BREGUET, 2, 2)

    SVAL(EVT_SLOT_B, _EvtParams2(1, 6))
    MOVE(24, CHAR_EVT_POSITION_AT_SLOTB, 1, 3)

    SVAL(EVT_SLOT_B, _EvtParams2(3, 6))
    MOVE(24, CHAR_EVT_POSITION_AT_SLOTB, 3, 3)

    SVAL(EVT_SLOT_B, _EvtParams2(1, 8))
    MOVE(24, CHAR_EVT_POSITION_AT_SLOTB, 9, 5)

    SVAL(EVT_SLOT_B, _EvtParams2(2, 7))
    MOVE(24, CHAR_EVT_POSITION_AT_SLOTB, 8, 3)

    SVAL(EVT_SLOT_B, _EvtParams2(3, 8))
    MOVE(24, CHAR_EVT_POSITION_AT_SLOTB, 4, 7)

    SVAL(EVT_SLOT_B, _EvtParams2(2, 9))
    MOVE(24, CHAR_EVT_POSITION_AT_SLOTB, 2, 8)
    ENUN

    STAL2(60)
    CUMO_AT(2, 2)
    STAL(60)
    CURE

    Text_BG(0x26, 0x92C)
    REMA

    LOAD2(1, UnitDef_Event_Ch1Ally)
    ENUN

    FlashCursor(CHARACTER_EIRIKA, 60)

    Text(0x92D)

    SVAL(EVT_SLOT_2, CHARACTER_SETH)
    CALL(EventScr_MoveUnitS2ToLeader)

    SVAL(EVT_SLOT_2, EventScr_Ch1Tut_OnBeginning)
    CALL(EventScr_CallOnTutorialMode)

    /**
     * Temporary flag(11) is used for triggering event: EventScr_Ch1_Turn_EnemyReinforceArrive,
     * this flag will be unset by event: EventScr_Ch1_Misc_Area
     */
    ENUT(EVFLAG_TMP(11))

    NoFade
    ENDA
};

CONST_DATA EventListScr EventScr_Ch1_Turn1Player[] = {
    SVAL(EVT_SLOT_2, EventScr_Ch1Tut_ChooseSethTurn1)
    CALL(EventScr_CallOnTutorialMode)

    NoFade
    ENDA
};

CONST_DATA EventListScr EventScr_Ch1_Turn1Enemy[] = {
    MUSC(0x13)
    FlashCursor(CHARACTER_BREGUET, 60)
    Text(0x930)

    NoFade
    ENDA
};

CONST_DATA EventListScr EventScr_Ch1_Turn_AllyReinforceArrive[] = {
    MUSC(0x54)
    LOAD1(1, UnitDef_Event_Ch1AllyReinforce)
    ENUN
    FlashCursor(CHARACTER_FRANZ, 60)
    Text(0x931)

    SVAL(EVT_SLOT_2, EventScr_Ch1Tut_GilliamBattle)
    CALL(EventScr_CallOnTutorialMode)

    NoFade
    ENDA
};

CONST_DATA EventListScr EventScr_Ch1_Misc_DefeatBoss[] = {
    SVAL(EVT_SLOT_2, EventScr_Ch1Tut_GuideMsgSeize)
    CALL(EventScr_CallOnTutorialMode)

    NoFade
    ENDA
};

CONST_DATA EventListScr EventScr_Ch1_EndingScene[] = {
    MUSC(0x31)
    SetBackground(0x26)

    CHECK_ALIVE(CHARACTER_GILLIAM)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)

    TEXTSHOW(0x937)
    TEXTEND
    GOTO(0x1)

LABEL(0x0)
    TEXTSHOW(0x938)
    TEXTEND

LABEL(0x1)
    REMA

    FADI(16)
    ENUT(0xBA)
    ENUT(0xCF)
    ENUT(0xCE)
    ENUT(0xB6)
    ENUT(0xD7)
    ENUT(0xD6)
    ENUT(0xC7)
    ENUT(0xC8)
    ENUT(0xDD)

    REVEAL(CHARACTER_SETH)
    MoveToChapter(0x38)
    ENDA
};

CONST_DATA EventListScr EventScr_Ch1_Talk_SethFranz[] = {
    ConvoEvent(0x93A)
};

CONST_DATA EventListScr EventScr_Ch1_Talk_EirikaFranz[] = {
    ConvoEvent(0x939)
};

CONST_DATA EventListScr EventScr_Ch1_Loca_Visit1[] = {
    IGNORE_KEYS(0)
    HouseEvent(0x93B, 0x0)
};

CONST_DATA EventListScr EventScr_Ch1_Loca_Visit2[] = {
    HouseEvent(0x93C, 0x0)
};

CONST_DATA EventListScr EventScr_Ch1_Misc_Area[] = {
    SVAL(EVT_SLOT_2, CHARACTER_EIRIKA)
    CALL(EventScr_UnTriggerIfNotUnit)   /* This event may directly ENDB if the condition is not matched */

    ENUF(EVFLAG_TMP(11))
    NoFade
    ENDA
};

CONST_DATA EventListScr EventScr_Ch1_Turn_EnemyReinforceArrive[] = {
    MUSI
    SVAL(EVT_SLOT_2, UnitDef_Event_Ch1EnemyReinforce)
    CALL(EventScr_LoadReinforce)

    FlashCursor(CHARACTER_SOLDIER_83, 60)
    Text(0x934)

    MUNO
    NoFade
    ENDA
};
