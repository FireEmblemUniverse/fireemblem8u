#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Tower3_Turn[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower3_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower3_Location[] = {
    ChestMoney(3000, 10, 3)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower3_Misc[] = {
    AFEV(0, EventScr_Tower3_EndingScene, EVFLAG_DEFEAT_ALL)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower3_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower3_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower3_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower3_Tutorial[] = {
    END_MAIN
};

// 0x89EB6A8
CONST_DATA struct ChapterEventGroup TowerOfValni3Events = {
    .turnBasedEvents               = EventListScr_Tower3_Turn,
    .characterBasedEvents          = EventListScr_Tower3_Character,
    .locationBasedEvents           = EventListScr_Tower3_Location,
    .miscBasedEvents               = EventListScr_Tower3_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Tower3_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Tower3_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Tower3_UnitMove,
    .tutorialEvents                = EventListScr_Tower3_Tutorial,

    .traps            = TrapData_Event_089EDCE6,
    .extraTrapsInHard = TrapData_Event_089EDEE3,

    .playerUnitsInNormal = UnitDef_088CBC38,
    .playerUnitsInHard   = UnitDef_088CBC38,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Tower3_BeginingScene,
    .endingSceneEvents    = EventScr_Tower3_EndingScene,
};
