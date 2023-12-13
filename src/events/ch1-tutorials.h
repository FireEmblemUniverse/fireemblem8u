#pragma once

#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "ea-stdlib.h"
#include "constants/characters.h"

CONST_DATA EventListScr EventScr_Ch1Tut_GuideWTA[] = {
    /**
     * The relationship between swords, lances,
     * and axes is called the weapon triangle...
     */
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, -1)
    TEXTSHOW(0x93D)
    TEXTEND
    REMA

    ENUT(0xBA) /* Guide:Weapon Triangle */
    ENDA
};

CONST_DATA EventListScr EventScr_Ch1Tut_9EFC44[] = {
    MUSC(0x9)

    /**
     * Seth.
     * I need to know what's happening here.
     * I'm going to visit that home.
     */
    Text(0x92E)

    CURSOR_FLASHING(13, 6)
    STAL(60)
    CURE

    /**
     * It's time to visit a home. First,
     * place the cursor on Eirika
     * and press the A Button.
     */
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, -1)
    TEXTSHOW(0x93E)
    TEXTEND
    REMA

    CURSOR_FLASHING_CHAR(CHARACTER_EIRIKA)
    STAL(60)
    CURE

    EvtEnqueueConditionalTutCall(
        EventScr_Ch1Tut_9EFC9C,
        TUTORIAL_EVT_TYPE_ONSELECT)

    DISABLEOPTIONS(EVENT_MENUOVERRIDE_END)
    NoFade
    ENDA
};
