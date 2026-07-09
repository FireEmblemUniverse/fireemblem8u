#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ruin6_Turn[] = {
    TurnEventPlayer(0, EventScr_Ruin_14, 4)
    TurnEventPlayer(0, EventScr_Ruin_15, 5)
    TurnEventPlayer(0, EventScr_Ruin_14, 6)
    TurnEventPlayer(0, EventScr_Ruin_16, 7)
    TurnEventPlayer(0, EventScr_Ruin_14, 8)
    TurnEventPlayer(0, EventScr_Ruin_17, 9)
    TurnEventPlayer(0, EventScr_Ruin_14, 10)
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

    .traps            = TrapData_Event_Ruin6_0,
    .extraTrapsInHard = TrapData_Event_Ruin6_1,

    .playerUnitsInNormal = UnitDef_Ruin6Ally,
    .playerUnitsInHard   = UnitDef_Ruin6Ally,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ruins6_BeginningScene,
    .endingSceneEvents    = EventScr_Ruin6_EndingScene,
};
