#pragma once

#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "ea-stdlib.h"
#include "bmtrap.h"
#include "constants/event-flags.h"
#include "constants/characters.h"

CONST_DATA EventListScr EventListScr_Ch1_Turn[] = {
    TURN(0x0, EventScr_Ch1_Turn1Player, 1, 1, FACTION_BLUE)
    TURN(0x0, EventScr_Ch1_Turn1Enemy, 1, 1, FACTION_RED)
    TURN(0x0, EventScr_Ch1_Turn_AllyReinforceArrive, 2, 2, FACTION_BLUE)
    TURN(0xB, EventScr_Ch1_Turn_EnemyReinforceArrive, 1, 255, FACTION_BLUE)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch1_Character[] = {
    CharacterEventBothWays(0x8, EventScr_Ch1_Talk_SethFranz, CHARACTER_SETH, CHARACTER_FRANZ)
    CharacterEventBothWays(0x9, EventScr_Ch1_Talk_EirikaFranz, CHARACTER_EIRIKA, CHARACTER_FRANZ)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch1_Location[] = {
    House(0x0, EventScr_Ch1_Loca_Visit1, 13, 6)
    House(0x0, EventScr_Ch1_Loca_Visit2, 10, 4)
    Seize(2, 2)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch1_Misc[] = {
    AFEV(0x7, EventScr_Ch1_Misc_DefeatBoss, EVFLAG_DEFEAT_BOSS)
    AREA(0xA, EventScr_Ch1_Misc_Area, 0, 0, 7, 9)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch1_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch1_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch1_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr * EventListScr_Ch1_Tutorial[] = {
    EventScr_Ch1Tut_9EFC9C,
    EventScr_Ch1Tut_9EFD14,
    EventScr_Ch1Tut_9EFD74,
    EventScr_Ch1Tut_9EFDA8,
    EventScr_Ch1Tut_9EFF20,
    EventScr_Ch1Tut_9EFF9C,
    EventScr_Ch1Tut_9EFFFC,
    EventScr_Ch1Tut_9F0030,
    EventScr_Ch1Tut_9F0060,
    EventScr_Ch1Tut_9F0130,
    EventScr_Ch1Tut_9F01A8,
    EventScr_Ch1Tut_9F0208,
    EventScr_Ch1Tut_9F023C,
    EventScr_Ch1Tut_9F0270,
    NULL
};

CONST_DATA struct ChapterEventGroup Ch1Events = {
    .turnBasedEvents               = EventListScr_Ch1_Turn,
    .characterBasedEvents          = EventListScr_Ch1_Character,
    .locationBasedEvents           = EventListScr_Ch1_Location,
    .miscBasedEvents               = EventListScr_Ch1_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch1_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch1_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch1_UnitMove,
    .tutorialEvents                = EventListScr_Ch1_Tutorial,

    .traps            = TrapData_Event_Ch1,
    .extraTrapsInHard = TrapData_Event_Ch1Hard,

    .playerUnitsInNormal = UnitDef_Event_Ch1Ally,
    .playerUnitsInHard   = UnitDef_Event_Ch1Ally,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch1_BeginingScene,
    .endingSceneEvents    = EventScr_Ch1_EndingScene,
};
