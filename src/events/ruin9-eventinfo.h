#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ruin9_Turn[] = {
    TurnEventPlayer_(EVFLAG_TMP(8), EventScr_Ruin_51, 1, 255)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin9_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin9_Location[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin9_Misc[] = {
    AFEV(0, EventScr_Ruin9_EndingScene, EVFLAG_DEFEAT_ALL)
    AREA(EVFLAG_TMP(9), EventScr_Ruin_49, 8, 0, 17, 11)
    AREA(EVFLAG_TMP(7), EventScr_Ruin_50, 0, 0, 7, 5)
    AREA(EVFLAG_TMP(9), EventScr_Ruin_49, 0, 6, 7, 11)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin9_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin9_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin9_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin9_Tutorial[] = {
    END_MAIN
};

// 0x89EC298
CONST_DATA struct ChapterEventGroup LagdouRuins9Event = {
    .turnBasedEvents               = EventListScr_Ruin9_Turn,
    .characterBasedEvents          = EventListScr_Ruin9_Character,
    .locationBasedEvents           = EventListScr_Ruin9_Location,
    .miscBasedEvents               = EventListScr_Ruin9_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ruin9_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ruin9_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ruin9_UnitMove,
    .tutorialEvents                = EventListScr_Ruin9_Tutorial,

    .traps            = TrapData_Event_Ruin9_0,
    .extraTrapsInHard = TrapData_Event_Ruin9_1,

    .playerUnitsInNormal = UnitDef_Ruin9Ally,
    .playerUnitsInHard   = UnitDef_Ruin9Ally,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ruins9_BeginningScene,
    .endingSceneEvents    = EventScr_Ruin9_EndingScene,
};
