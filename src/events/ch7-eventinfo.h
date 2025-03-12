#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch7_Turn[] = {
    TURN(0, EventScr_089F2CFC, 1, 0, FACTION_RED)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch7_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch7_Location[] = {
    Seize(9, 4)
    House(0, EventScr_089F2E6C, 1, 15)
    House(0, EventScr_089F2E94, 17, 21)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch7_Misc[] = {
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch7_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch7_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch7_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch7_Tutorial[] = {
    END_MAIN
};

CONST_DATA struct ChapterEventGroup Ch7EventData = {
    .turnBasedEvents               = EventListScr_Ch7_Turn,
    .characterBasedEvents          = EventListScr_Ch7_Character,
    .locationBasedEvents           = EventListScr_Ch7_Location,
    .miscBasedEvents               = EventListScr_Ch7_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch7_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch7_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch7_UnitMove,
    .tutorialEvents                = EventListScr_Ch7_Tutorial,

    .traps            = TrapData_Event_Ch7,
    .extraTrapsInHard = TrapData_Event_Ch7Hard,

    .playerUnitsInNormal = UnitDef_Event_Ch7Ally,
    .playerUnitsInHard   = UnitDef_Event_Ch7Ally,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch7_BeginingScene,
    .endingSceneEvents    = EventScr_Ch7_EndingScene,
};
