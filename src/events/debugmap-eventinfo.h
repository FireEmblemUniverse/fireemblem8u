#include "gbafe.h"

CONST_DATA EventListScr EventListScr_DebugMap_Turn[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_DebugMap_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_DebugMap_Location[] = {
    House(0, EventScr_089FF4F4, 1, 1)
    House(0, EventScr_089FFB48, 3, 1)
    House(0, EventScr_089FFBB8, 5, 1)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_DebugMap_Misc[] = {
    AREA(0, EventScr_089FF4E4, 1, 1, 1, 1)
    AREA(0, EventScr_089FFB38, 3, 1, 3, 1)
    AREA(0, EventScr_089FFBA8, 5, 1, 5, 1)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_DebugMap_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_DebugMap_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_DebugMap_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_DebugMap_Tutorial[] = {
    END_MAIN
};

// 0x89EC66C
CONST_DATA struct ChapterEventGroup DebugMapEvents = {
    .turnBasedEvents               = EventListScr_DebugMap_Turn,
    .characterBasedEvents          = EventListScr_DebugMap_Character,
    .locationBasedEvents           = EventListScr_DebugMap_Location,
    .miscBasedEvents               = EventListScr_DebugMap_Misc,
    .specialEventsWhenUnitSelected = EventListScr_DebugMap_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_DebugMap_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_DebugMap_UnitMove,
    .tutorialEvents                = EventListScr_DebugMap_Tutorial,

    .traps            = TrapData_Event_089EDE79,
    .extraTrapsInHard = TrapData_Event_089EDF6E,

    .playerUnitsInNormal = UnitDef_088D118C,
    .playerUnitsInHard   = UnitDef_088D118C,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_DebugMap_BeginningScene,
    .endingSceneEvents    = EventScr_DebugMap_EndingScene,
};
