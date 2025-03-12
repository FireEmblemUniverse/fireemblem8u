#include "gbafe.h"

CONST_DATA EventListScr EventListScr_LordSplit_Turn[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_LordSplit_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_LordSplit_Location[] = {
    Seize(7, 4)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_LordSplit_Misc[] = {
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_LordSplit_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_LordSplit_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_LordSplit_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_LordSplit_Tutorial[] = {
    END_MAIN
};

// 0x89EC3B4
CONST_DATA struct ChapterEventGroup LordsSplitEvents = {
    .turnBasedEvents               = EventListScr_LordSplit_Turn,
    .characterBasedEvents          = EventListScr_LordSplit_Character,
    .locationBasedEvents           = EventListScr_LordSplit_Location,
    .miscBasedEvents               = EventListScr_LordSplit_Misc,
    .specialEventsWhenUnitSelected = EventListScr_LordSplit_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_LordSplit_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_LordSplit_UnitMove,
    .tutorialEvents                = EventListScr_LordSplit_Tutorial,

    .traps            = TrapData_Event_089EDE76,
    .extraTrapsInHard = TrapData_Event_089EDF6B,

    .playerUnitsInNormal = UnitDef_088CFBD4,
    .playerUnitsInHard   = UnitDef_088CFBD4,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_CastleFelia_BeginingScene,
    .endingSceneEvents    = EventScr_CastleFelia_EndingScene,
};
