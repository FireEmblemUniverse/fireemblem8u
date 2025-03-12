#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Tower8_Turn[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower8_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower8_Location[] = {
    Chest(ITEM_BLUEGEM, 11, 8)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower8_Misc[] = {
    AFEV(0, EventScr_Tower8_EndingScene, EVFLAG_DEFEAT_ALL)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower8_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower8_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower8_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower8_Tutorial[] = {
    END_MAIN
};

// 0x89EBA10
CONST_DATA struct ChapterEventGroup TowerOfValni8Events = {
    .turnBasedEvents               = EventListScr_Tower8_Turn,
    .characterBasedEvents          = EventListScr_Tower8_Character,
    .locationBasedEvents           = EventListScr_Tower8_Location,
    .miscBasedEvents               = EventListScr_Tower8_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Tower8_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Tower8_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Tower8_UnitMove,
    .tutorialEvents                = EventListScr_Tower8_Tutorial,

    .traps            = TrapData_Event_089EDCEB,
    .extraTrapsInHard = TrapData_Event_089EDEE8,

    .playerUnitsInNormal = UnitDef_088CCDB4,
    .playerUnitsInHard   = UnitDef_088CCDB4,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Tower8_BeginingScene,
    .endingSceneEvents    = EventScr_Tower8_EndingScene,
};
