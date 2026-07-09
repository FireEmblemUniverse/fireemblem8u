#include "gbafe.h"

CONST_DATA EventListScr EventListScr_DebugMap_Turn[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_DebugMap_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_DebugMap_Location[] = {
    House(0, EventScr_Ruin_54, 1, 1)
    House(0, EventScr_Ruin_56, 3, 1)
    House(0, EventScr_Ruin_58, 5, 1)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_DebugMap_Misc[] = {
    AREA(0, EventScr_Ruin_53, 1, 1, 1, 1)
    AREA(0, EventScr_Ruin_55, 3, 1, 3, 1)
    AREA(0, EventScr_Ruin_57, 5, 1, 5, 1)
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

    .traps            = TrapData_Event_DebugMap_0,
    .extraTrapsInHard = TrapData_Event_DebugMap_1,

    .playerUnitsInNormal = UnitDef_UnusedAlly,
    .playerUnitsInHard   = UnitDef_UnusedAlly,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_DebugMap_BeginningScene,
    .endingSceneEvents    = EventScr_DebugMap_EndingScene,
};
