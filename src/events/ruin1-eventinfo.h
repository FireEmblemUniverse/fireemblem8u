#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ruin1_Turn[] = {
    TurnEventPlayer_(0, EventScr_089FE2E8, 6, 2)
    TurnEventPlayer(0, EventScr_089FE300, 8)
    TurnEventPlayer(0, EventScr_089FE2E8, 9)
    TurnEventPlayer(0, EventScr_089FE300, 10)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin1_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin1_Location[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin1_Misc[] = {
    AFEV(0, EventScr_Ruin1_EndingScene, EVFLAG_DEFEAT_ALL)
    AREA(EVFLAG_TMP(7), EventScr_089FE318, 2, 3, 14, 17)
    AREA(EVFLAG_TMP(7), EventScr_089FE318, 0, 5, 1, 17)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin1_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin1_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin1_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin1_Tutorial[] = {
    END_MAIN
};

// 0x89EBAE0
CONST_DATA struct ChapterEventGroup LagdouRuins1Event = {
    .turnBasedEvents               = EventListScr_Ruin1_Turn,
    .characterBasedEvents          = EventListScr_Ruin1_Character,
    .locationBasedEvents           = EventListScr_Ruin1_Location,
    .miscBasedEvents               = EventListScr_Ruin1_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ruin1_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ruin1_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ruin1_UnitMove,
    .tutorialEvents                = EventListScr_Ruin1_Tutorial,

    .traps            = TrapData_Event_089EDCF8,
    .extraTrapsInHard = TrapData_Event_089EDEE9,

    .playerUnitsInNormal = UnitDef_088CD0C0,
    .playerUnitsInHard   = UnitDef_088CD0C0,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ruins1_BeginingScene,
    .endingSceneEvents    = EventScr_Ruin1_EndingScene,
};
