#pragma once

#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "eventcall.h"
#include "EAstdlib.h"
#include "playerphase.h"
#include "constants/characters.h"

CONST_DATA EventListScr EventScr_Prologue_ExecTut[] = {
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, -1)
    TEXTSHOW(0x919)
    TEXTEND
    REMA

    CURSOR_FLASHING_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE

    /* Not in stdlib */
    EvtEnqueueConditionalTutCall(
        EventScr_Prologue_Tutorial0,
        TUTORIAL_EVT_TYPE_ONSELECT)

    /* This may end all events! Directly end the parent event! */
    NoFade
    ENDB
};

CONST_DATA EventListScr EventScr_Prologue_Tutorial0[] = {
    NoFade

    TutEventExecType0(
        CHARACTER_EIRIKA,
        4, 5,
        0x91B,
        0x00080058,
        0x91A,
        0x00080058,
        EventScr_Prologue_Tutorial1,
        EventScr_Prologue_Tutorial0
    )
    ENDA
};

CONST_DATA EventListScr EventScr_Prologue_Tutorial1[] = {
    NoFade
    IGNORE_KEYS(0)

    TutEventExecType1(
        4, 5,
        0x91C,
        0x00080058,
        EventScr_Prologue_Tutorial2,
        EventScr_Prologue_Tutorial1
    )
    DISABLEOPTIONS(~EVENT_MENUOVERRIDE_WAIT)
    IGNORE_KEYS(R_BUTTON | START_BUTTON | B_BUTTON)
    ENDA
};

CONST_DATA EventListScr EventScr_Prologue_Tutorial2[] = {
    NoFade

    EvtEnqueueConditionalTutCall(
        EventScr_Prologue_Tutorial3,
        TUTORIAL_EVT_TYPE_POSTACTION)

    ENDA
};

CONST_DATA EventListScr EventScr_Prologue_Tutorial3[] = {
    NoFade
    IGNORE_KEYS(0)
    CALL(EventScr_Prologue_GiveRapier)
    SET_ENDTURN(CHARACTER_SETH)
    ENUT(0xB7) /* Guide:Movement Range */
    ENDA
};

CONST_DATA EventListScr EventScr_Prologue_TutMessageTurn1[] = {
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, -1)
    TEXTSHOW(0x91D)
    TEXTEND
    REMA

    ENUT(0xB4) /* Guide:Viewing Units */
    ENUT(0xB5) /* Guide:Game Flow */

    ENDA
};

CONST_DATA EventListScr EventScr_Prologue_TutMessageTurn2[] = {
    FlashCursor(CHARACTER_SETH, 60)
    Text(0x911)

    StartBattle
    NormalDamage(0, 0)
    MissedAttack(1, 0)
    NormalDamage(0, 0)
    EndAttack
    FIGHT_SCRIPT

    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, -1)
    TEXTSHOW(0x922)
    TEXTEND
    REMA

    ENUF(0x66) /* Disable objective window */
    ENUT(0xDC) /* Guide:Defeat a Boss */

    CURSOR_FLASHING_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE

    EvtEnqueueConditionalTutCall(
        EventScr_Prologue_Tutorial4,
        TUTORIAL_EVT_TYPE_ONSELECT)

    ENDA
};

CONST_DATA EventListScr EventScr_Prologue_Tutorial4[] = {
    NoFade
    IGNORE_KEYS(0)

    TutEventExecType0(
        CHARACTER_EIRIKA,
        4, 5,
        0x91E,      /* It's time to attack the enemy. Place the cursor on Eirika and press the A Button. */
        0x00080058,
        0x91F,      /* The cursor is now on Eirika. Press the A Button. */
        0x00080058,
        EventScr_Prologue_Tutorial5,
        EventScr_Prologue_Tutorial4
    )

    IGNORE_KEYS(
        L_BUTTON | R_BUTTON
        | DPAD_DOWN | DPAD_UP | DPAD_LEFT | DPAD_RIGHT
        | START_BUTTON | SELECT_BUTTON | B_BUTTON)

    ENDA
};

CONST_DATA EventListScr EventScr_Prologue_Tutorial5[] = {
    NoFade
    ASMC(PlayPhaseForcePressAButtonInRangeDisp)
    DISABLEOPTIONS(~EVENT_MENUOVERRIDE_ATTACK)
    IGNORE_KEYS(R_BUTTON | START_BUTTON | B_BUTTON)

    EvtEnqueueConditionalTutCall(
        EventScr_Prologue_Tutorial6,
        TUTORIAL_EVT_TYPE_AFTERMOVE)

    ENDA
};

CONST_DATA EventListScr EventScr_Prologue_Tutorial6[] = {
    NoFade
    IGNORE_KEYS(0)

    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0x00380018)
    TEXTSHOW(0x920)
    TEXTEND
    REMA

    IGNORE_KEYS(R_BUTTON | START_BUTTON | B_BUTTON)

    EvtEnqueueConditionalTutCall(
        EventScr_Prologue_Tutorial7,
        TUTORIAL_EVT_TYPE_FORECAST)

    ENDA
};

CONST_DATA EventListScr EventScr_Prologue_Tutorial7[] = {
    NoFade
    IGNORE_KEYS(R_BUTTON)

    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0x0020000C)
    TEXTSHOW(0x921)
    TEXTEND
    REMA

    IGNORE_KEYS(R_BUTTON | START_BUTTON | B_BUTTON)

    EvtEnqueueConditionalTutCall(
        EventScr_Prologue_Tutorial8,
        TUTORIAL_EVT_TYPE_POSTACTION)

    ENDA
};

CONST_DATA EventListScr EventScr_Prologue_Tutorial8[] = {
    IGNORE_KEYS(0)
    FlashCursor(CHARACTER_EIRIKA, 60)
    Text(0x912)

    EvtEnqueueConditionalTutCall(
        EventScr_Prologue_Tutorial9,
        TUTORIAL_EVT_TYPE_PLAYERPHASE)

    ENUT(0xB9) /* Guide:Attack Range */
    ENUT(0xC2) /* Guide:Strategic Battle Info */
    ENUT(0xC3) /* Guide:Detailed Battle Info */

    NoFade
    ENDA
};

CONST_DATA EventListScr EventScr_Prologue_Tutorial9[] = {
    MOVE(0, CHARACTER_SETH, 9, 5)
    ENUN

    StartBattle
    NormalDamage(0, 20)
    EndAttack
    SVAL(EVT_SLOT_B, 0x60009)
    FIGHT(CHARACTER_SETH, -1, 0, 0)

    _3427(CHARACTER_SETH)

    SVAL(EVT_SLOT_B, 0x00060009)
    KILL(-2)
    DISA_IF(-2)

    ENUT(EVFLAG_TMP(7)) /* trigger event: EventScr_Prologue_OneEmimyLeft */
    CALL(EventScr_Prologue_OneEmimyLeft)
    SET_ENDTURN(CHARACTER_SETH)

    NoFade
    ENDA
};

CONST_DATA EventListScr EventScr_Prologue_OneillSethBattle[] = {
    MOVE(0, CHARACTER_ONEILL, 9, 6)
    ENUN

    StartBattle
    NormalDamage(0, 0)
    MissedAttack(1, 0)
    EndAttack
    FIGHT(CHARACTER_ONEILL, CHARACTER_SETH, 0, 0)

    FlashCursor(CHARACTER_SETH, 60)
    Text(0x915)
    ENDA
};

CONST_DATA EventListScr EventScr_Prologue_TutEirikaAttack[] = {
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, -1)
    TEXTSHOW(0x923) /* Place the cursor on Eirika and press the A Button. */
    TEXTEND
    REMA

    CURSOR_FLASHING_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE

    StartBattle
    NormalDamage(0, 0)
    NormalDamage(1, 0)
    CriticalHit(0, 0)
    EndAttack
    FIGHT_SCRIPT

    EvtEnqueueConditionalTutCall(
        EventScr_Prologue_TutorialA,
        TUTORIAL_EVT_TYPE_ONSELECT)

    ENDA
};

CONST_DATA EventListScr EventScr_Prologue_TutorialA[] = {
    NoFade

    TutEventExecType0(
        CHARACTER_EIRIKA,
        8, 6,
        0x925,      /* Move next to the enemy and press the A Button. */
        0x00080058,
        0x924,      /* The cursor is now on Eirika. Press the A Button. */
        0x00080058,
        EventScr_Prologue_TutorialB,
        EventScr_Prologue_TutorialA
    )
    ENDA
};

CONST_DATA EventListScr EventScr_Prologue_TutorialB[] = {
    NoFade
    IGNORE_KEYS(0)
    TutEventExecType1(
        8, 6,
        0x925,      /* Move next to the enemy and press the A Button. */
        0x00080058,
        EventScr_Prologue_TutorialC,
        EventScr_Prologue_TutorialB
    )
    DISABLEOPTIONS(~EVENT_MENUOVERRIDE_ATTACK)
    IGNORE_KEYS(R_BUTTON | START_BUTTON | B_BUTTON)
    ENDA
};

CONST_DATA EventListScr EventScr_Prologue_TutorialC[] = {
    NoFade

    EvtEnqueueConditionalTutCall(
        EventScr_Prologue_TutorialD,
        TUTORIAL_EVT_TYPE_FORECAST)

    ENDA
};

CONST_DATA EventListScr EventScr_Prologue_TutorialD[] = {
    NoFade
    IGNORE_KEYS(R_BUTTON)

    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0x00200050)
    TEXTSHOW(0x926)
    TEXTEND
    REMA

    IGNORE_KEYS(R_BUTTON | START_BUTTON | B_BUTTON)

    EvtEnqueueConditionalTutCall(
        EventScr_Prologue_TutorialE,
        TUTORIAL_EVT_TYPE_POSTACTION)

    NoFade
    ENDA
};

CONST_DATA EventListScr EventScr_Prologue_TutorialE[] = {
    NoFade
    IGNORE_KEYS(0)

    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, -1)
    TEXTSHOW(0x927) /* Eirika gained over 100 experience points and has leveled up. */
    TEXTEND
    REMA

    ENUT(0xE7) /* Guide:Leveling Up */
    DISABLEOPTIONS(0)
    ENDA
};

CONST_DATA EventListScr EventScr_Prologue_9EF828[] = {
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, -1)
    TEXTSHOW(0x928) /* You've received a rapier from Seth. All weapons have a durability rating... */
    TEXTEND
    REMA

    ENUT(0xC9) /* Guide:Weapon Durability */
    ENDA
};

