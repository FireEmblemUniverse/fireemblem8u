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

CONST_DATA EventListScr EventListScr_Ch2_Turn[] = {
    TURN(0, EventScr_Ch2_Turn1Player, 1, 0, FACTION_ID_BLUE)
    TURN(0, EventScr_Ch2_Turn2Player, 2, 0, FACTION_ID_BLUE)
    TURN(0, EventScr_Ch2_Turn3Player, 3, 0, FACTION_ID_BLUE)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch2_Character[] = {
    CHAR(EVFLAG_TMP(7), EventScr_Ch2_Talk_EirikaRoss, CHARACTER_EIRIKA, CHARACTER_ROSS)
    CHAR(EVFLAG_TMP(8), EventScr_Ch2_Talk_RossGarcia, CHARACTER_ROSS, CHARACTER_GARCIA)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch2_Location[] = {
    Village(EVFLAG_TMP(9),  EventScr_Ch2_Village1, 4, 2)
    Village(EVFLAG_TMP(10), EventScr_Ch2_Village2, 7, 2)
    Village(EVFLAG_TMP(11), EventScr_Ch2_Village3, 1, 12)
    Armory(ShopList_Event_Ch2Armory, 5, 7)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch2_Misc[] = {
    DefeatAll(EventScr_Ch2_EndingScene)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch2_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch2_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch2_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr * EventListScr_Ch2_Tutorial[] = {
    EventScr_Ch2Tutorial1,
    EventScr_Ch2Tutorial2,
    EventScr_Ch2Tutorial3,
    EventScr_Ch2Tutorial4,
    EventScr_Ch2Tutorial5,
    EventScr_Ch2Tutorial6,
    EventScr_Ch2Tutorial7,
    EventScr_Ch2Tutorial8,
    EventScr_Ch2Tutorial9,
    EventScr_Ch2Tutorial10,
    EventScr_Ch2Tutorial11,
    EventScr_Ch2Tutorial12,
    EventScr_Ch2Tutorial13,
    EventScr_Ch2Tutorial14,
    EventScr_Ch2Tutorial15,
    EventScr_Ch2Tutorial16,
    EventScr_Ch2Tutorial17,
    EventScr_Ch2Tutorial18,
    EventScr_Ch2Tutorial19,
    EventScr_Ch2Tutorial20,
    EventScr_Ch2Tutorial21,
    EventScr_Ch2Tutorial22,
    EventScr_Ch2Tutorial23,
    EventScr_Ch2Tutorial24,
    EventScr_Ch2Tutorial25,
    EventScr_Ch2Tutorial26,
    EventScr_Ch2Tutorial27,
    EventScr_Ch2Tutorial28,
    EventScr_Ch2Tutorial29,
    EventScr_Ch2Tutorial30,
    NULL
};

CONST_DATA struct ChapterEventGroup Ch2Events = {
    .turnBasedEvents               = EventListScr_Ch2_Turn,
    .characterBasedEvents          = EventListScr_Ch2_Character,
    .locationBasedEvents           = EventListScr_Ch2_Location,
    .miscBasedEvents               = EventListScr_Ch2_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch2_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch2_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch2_UnitMove,
    .tutorialEvents                = EventListScr_Ch2_Tutorial,

    .traps            = TrapData_Event_Ch2,
    .extraTrapsInHard = TrapData_Event_Ch2Hard,

    .playerUnitsInNormal = UnitDef_Event_Ch2Ally,
    .playerUnitsInHard   = UnitDef_Event_Ch2Ally,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch2_BeginingScene,
    .endingSceneEvents    = EventScr_Ch2_EndingScene,
};
