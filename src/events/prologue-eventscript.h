#pragma once

#include "global.h"
#include "bmguide.h"
#include "bmunit.h"
#include "event.h"
#include "eventinfo.h"
#include "ea-stdlib.h"
#include "constants/characters.h"

CONST_DATA EventListScr EventScr_Prologue_BeginingScene[] = {
    CALL(EventScr_Prologue_RenaisThroneCutscene)
    SVAL(EVT_SLOT_2, EventScr_Prologue_9EF1BC)
    CALL(EventScr_RunTutIfEasyMode)
    CHECK_TUTORIAL
    BNE(0x0, EVT_SLOT_C, EVT_SLOT_0)
    ASMC(BmGuideTextSetAllGreen)

LABEL(0x0)
    ENUT(0x8)
    LOAD1(1, UnitDef_Event_PrologueAlly)
    ENUN
    SVAL(EVT_SLOT_1, 13)
    SET_HP(CHARACTER_SETH)
    FlashCursor(CHARACTER_EIRIKA, 60)
    MUSI
    Text_BG(0x1D, 0x90D)
    MUNO
    MOVE(0x18, CHARACTER_SETH, 4, 4)
    ENUN
    FlashCursor(CHARACTER_SETH, 60)
    Text(0x90E)
    SVAL(EVT_SLOT_2, EventScr_Prologue_9EF27C)
    CALL(EventScr_RunTutIfEasyMode)
    _WARP(0x0, CHARACTER_EIRIKA, 4, 5)
    ENUN
    CALL(EventScr_Prologue_GiveRapier)
    CALL(EventScr_Prologue_ONeillSpawn)
    NoFade
    ENDA
};

CONST_DATA EventListScr EventScr_Prologue_RenaisThroneCutscene[] = {
    SVAL(EVT_SLOT_B, 0x000A000E)
    LOMA(0x10) /* todo: chapter index */
    LOAD2(1, UnitDef_Event_PrologueThroneRoomUnits)
    ENUN
    FADU(16)
    MUSC(0x26) /* todo: BGM index */
    BROWNBOXTEXT(0x664, 8, 8)

    /* WTF we load Ephraim as the messager... */
    LOAD1(1, UnitDef_Event_PrologueMessager)
    ENUN
    CAMERA(0xE, 0x0)
    FlashCursor(CHARACTER_EPHRAIM, 60)
    Text(0x903)
    MOVE(0, CHARACTER_EPHRAIM, 0xD, 0xB)
    ENUN
    DISA(CHARACTER_EPHRAIM)

    MOVE_1STEP(0, CHARACTER_EIRIKA, FACING_LEFT)
    ENUN
    FlashCursor(CHARACTER_EIRIKA, 60)
    Text(0x904)

    /* Seth pick Eirika and run */
    MOVEONTO(0, CHARACTER_SETH, CHARACTER_EIRIKA)
    ENUN
    DISA(CHARACTER_EIRIKA)
    FlashCursor(CHARACTER_SETH, 60)
    Text(0x905)
    MOVE(0, CHARACTER_SETH, 0xD, 0xB)

    /* sD is used as queue length */
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x010C)
    SAVETOQUEUE
    SVAL(EVT_SLOT_1, 0x0)
    SAVETOQUEUE
    SVAL(EVT_SLOT_1, 0x2CC)
    SAVETOQUEUE
    SVAL(EVT_SLOT_1, 0x0)
    SAVETOQUEUE
    MOVEFORCED(CHARACTER_FRANZ)
    ENUN

    DISA(CHARACTER_SETH)
    DISA(CHARACTER_FRANZ)

    /* generals move in to protect the king */
    MOVE(0, CHARACTER_MOULDER, 11, 4)
    MOVE(0, CHARACTER_VANESSA, 15, 4)
    ENUN
    MOVE_1STEP(0, CHARACTER_MOULDER, FACING_RIGHT)
    MOVE_1STEP(0, CHARACTER_VANESSA, FACING_LEFT)
    ENUN

    LOAD1(1, UnitDef_Event_PrologueGradoShamans)
    ENUN
    LOAD1(1, UnitDef_Event_PrologueGradoCavalry)
    ENUN
    LOAD1(1, UnitDef_Event_PrologueGradoRoyals)
    ENUN

    FlashCursor(CHARACTER_FADO, 60)
    TEXTSTART
    TEXTSHOW(0x906) /* Ephraim, Eirika...You must survive. */
    TEXTEND
    FADI(2)
    REMA

    /* Load to new map */
    EVBIT_F(0x2)
    CLEA CLEE CLEN
    SVAL(EVT_SLOT_B, 0x00000000)
    LOMA(0x40)
    FADU(16)

    LOAD2(1, UnitDef_Event_PrologueEscapees)
    ENUN
    FlashCursor(CHARACTER_SETH, 60)
    Text_BG(0x1D, 0x907)

    /* Franz run */
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x104)
    SAVETOQUEUE
    SVAL(EVT_SLOT_1, 0x0)
    SAVETOQUEUE
    SVAL(EVT_SLOT_1, 0x84)
    SAVETOQUEUE
    SVAL(EVT_SLOT_1, 0x0)
    SAVETOQUEUE
    SVAL(EVT_SLOT_1, 0x80)
    SAVETOQUEUE
    SVAL(EVT_SLOT_1, 0x0)
    SAVETOQUEUE
    MOVEFORCED(CHARACTER_FRANZ)
    ENUN
    DISA(CHARACTER_FRANZ)

    FlashCursor(CHARACTER_SETH, 60)
    Text_BG(0x1D, 0x908) /* behind me */

    LOAD1(1, UnitDef_Event_PrologueValterGroup)
    ENUN
    MOVE_1STEP(0, CHARACTER_SETH, FACING_RIGHT)
    ENUN
    MOVE_1STEP(0, CHARACTER_EIRIKA, FACING_LEFT)
    ENUN

    FlashCursor(CHARACTER_VALTER_PROLOGUE, 60)
    Text_BG(0x1D, 0x909)
    MOVE_1STEP(0, CHARACTER_VALTER_PROLOGUE, FACING_LEFT)
    ENUN

    StartBattle
    MissedAttack(0, 0)
    NormalDamage(1, 0)
    EndAttack
    FIGHT(CHARACTER_SETH, CHARACTER_VALTER_PROLOGUE, 0, false)

    FlashCursor(CHARACTER_SETH, 60)
    Text(0x90B)

    /* Seth 'rescues' Eirika */
    MOVE_1STEP(8, CHARACTER_SETH, FACING_LEFT)
    ENUN
    DISA(CHARACTER_EIRIKA)

    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x18104)
    SAVETOQUEUE
    SVAL(EVT_SLOT_1, 0x0)
    SAVETOQUEUE
    SVAL(EVT_SLOT_1, 0x18084)
    SAVETOQUEUE
    SVAL(EVT_SLOT_1, 0x0)
    SAVETOQUEUE
    SVAL(EVT_SLOT_1, 0x18080)
    SAVETOQUEUE
    SVAL(EVT_SLOT_1, 0x0)
    SAVETOQUEUE
    MOVEFORCED(CHARACTER_SETH)
    ENUN
    DISA(CHARACTER_SETH)

    FlashCursor(CHARACTER_VALTER_PROLOGUE, 60)
    Text(0x90C)

    /* Load to new map */
    FADI(16)
    EVBIT_F(0x2)
    CLEA CLEE CLEN
    SVAL(EVT_SLOT_B, 0x00000000)
    LOMA(0x0)
    FADU(16)

    ENDA
};
