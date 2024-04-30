#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Tower2_Turn[] = {
    TurnEventPlayer_(EVFLAG_TMP(8), EventScr_089FDCF8, 1, 255)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower2_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower2_Location[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower2_Misc[] = {
    AFEV(0, EventScr_Tower2_EndingScene, EVFLAG_DEFEAT_ALL)
    AREA(EVFLAG_TMP(7), EventScr_089FDCC4, 17, 1, 19, 17)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower2_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower2_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower2_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower2_Tutorial[] = {
    END_MAIN
};

// 0x89EB614
CONST_DATA struct ChapterEventGroup TowerOfValni2Events = {
    .turnBasedEvents               = EventListScr_Tower2_Turn,
    .characterBasedEvents          = EventListScr_Tower2_Character,
    .locationBasedEvents           = EventListScr_Tower2_Location,
    .miscBasedEvents               = EventListScr_Tower2_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Tower2_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Tower2_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Tower2_UnitMove,
    .tutorialEvents                = EventListScr_Tower2_Tutorial,

    .traps            = TrapData_Event_089EDCE5,
    .extraTrapsInHard = TrapData_Event_089EDEE2,

    .playerUnitsInNormal = UnitDef_088CB918,
    .playerUnitsInHard   = UnitDef_088CB918,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Tower2_BeginingScene,
    .endingSceneEvents    = EventScr_Tower2_EndingScene,
};

