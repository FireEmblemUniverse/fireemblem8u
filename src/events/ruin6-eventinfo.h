#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ruin6_Turn[] = {
    TurnEventPlayer(0, EventScr_089FE754, 4)
    TurnEventPlayer(0, EventScr_089FE76C, 5)
    TurnEventPlayer(0, EventScr_089FE754, 6)
    TurnEventPlayer(0, EventScr_089FE784, 7)
    TurnEventPlayer(0, EventScr_089FE754, 8)
    TurnEventPlayer(0, EventScr_089FE79C, 9)
    TurnEventPlayer(0, EventScr_089FE754, 10)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin6_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin6_Location[] = {
    Door_(16, 7)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin6_Misc[] = {
    AFEV(0, EventScr_Ruin6_EndingScene, EVFLAG_DEFEAT_ALL)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin6_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin6_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin6_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin6_Tutorial[] = {
    END_MAIN
};

// 0x89EBF14
CONST_DATA struct ChapterEventGroup LagdouRuins6Event = {
    .turnBasedEvents               = EventListScr_Ruin6_Turn,
    .characterBasedEvents          = EventListScr_Ruin6_Character,
    .locationBasedEvents           = EventListScr_Ruin6_Location,
    .miscBasedEvents               = EventListScr_Ruin6_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ruin6_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ruin6_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ruin6_UnitMove,
    .tutorialEvents                = EventListScr_Ruin6_Tutorial,

    .traps            = TrapData_Event_089EDD7B,
    .extraTrapsInHard = TrapData_Event_089EDEEE,

    .playerUnitsInNormal = UnitDef_088CE740,
    .playerUnitsInHard   = UnitDef_088CE740,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ruins6_BeginingScene,
    .endingSceneEvents    = EventScr_Ruin6_EndingScene,
};
