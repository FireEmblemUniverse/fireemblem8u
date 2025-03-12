#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Tower4_Turn[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower4_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower4_Location[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower4_Misc[] = {
    AFEV(0, EventScr_Tower4_EndingScene, EVFLAG_DEFEAT_ALL)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower4_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower4_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower4_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower4_Tutorial[] = {
    END_MAIN
};

// 0x89EB730
CONST_DATA struct ChapterEventGroup TowerOfValni4Events = {
    .turnBasedEvents               = EventListScr_Tower4_Turn,
    .characterBasedEvents          = EventListScr_Tower4_Character,
    .locationBasedEvents           = EventListScr_Tower4_Location,
    .miscBasedEvents               = EventListScr_Tower4_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Tower4_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Tower4_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Tower4_UnitMove,
    .tutorialEvents                = EventListScr_Tower4_Tutorial,

    .traps            = TrapData_Event_089EDCE7,
    .extraTrapsInHard = TrapData_Event_089EDEE4,

    .playerUnitsInNormal = UnitDef_088CBF24,
    .playerUnitsInHard   = UnitDef_088CBF24,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Tower4_BeginingScene,
    .endingSceneEvents    = EventScr_Tower4_EndingScene,
};
