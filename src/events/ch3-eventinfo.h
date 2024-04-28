#pragma once

#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "eventcall.h"
#include "EAstdlib.h"
#include "bmtrap.h"
#include "chapterdata.h"
#include "constants/event-flags.h"
#include "constants/characters.h"
#include "constants/items.h"

CONST_DATA EventListScr EventListScr_Ch3_Turn[] = {
    TURN(EVFLAG_TMP(7), EventScr_Ch3_Turn1Npc, 1, 1, FACTION_GREEN)
    TURN(EVFLAG_TMP(8), EventScr_Ch3_Turn2Player, 2, 2, FACTION_BLUE)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch3_Character[] = {
    CHAR(EVFLAG_TMP(9), EventScr_Ch3_Talk_NeimiColm, CHARACTER_NEIMI, CHARACTER_COLM)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch3_Location[] = {
    Chest(ITEM_LANCE_IRON,    6, 3)
    Chest(ITEM_AXE_HANDAXE,   8, 3)
    Chest(ITEM_SWORD_IRON,    10, 3)
    Chest(ITEM_LANCE_JAVELIN, 6, 12)
    Seize(14, 1)
    Door(6, 10)
    Door(10, 5)
    Door(2, 3)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch3_Misc[] = {
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch3_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch3_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch3_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr * EventListScr_Ch3_Tutorials[] = {
    NULL
};

CONST_DATA struct ChapterEventGroup Ch3Events = {
    .turnBasedEvents               = EventListScr_Ch3_Turn,
    .characterBasedEvents          = EventListScr_Ch3_Character,
    .locationBasedEvents           = EventListScr_Ch3_Location,
    .miscBasedEvents               = EventListScr_Ch3_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch3_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch3_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch3_UnitMove,
    .tutorialEvents                = EventListScr_Ch3_Tutorials,

    .traps            = TrapData_Event_Ch3,
    .extraTrapsInHard = TrapData_Event_Ch3Hard,

    .playerUnitsInNormal = UnitDef_Event_Ch3Ally,
    .playerUnitsInHard   = UnitDef_Event_Ch3Ally,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch3_BeginingScene,
    .endingSceneEvents    = EventScr_Ch3_EndingScene,
};
