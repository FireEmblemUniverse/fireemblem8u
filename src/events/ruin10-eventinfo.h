#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ruin10_Turn[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin10_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin10_Location[] = {
    LOCA(0, ChestItemList_Event_089ED7C6, 9, 2, TILE_COMMAND_CHEST)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin10_Misc[] = {
    AFEV(0, EventScr_Ruin10_EndingScene, EVFLAG_DEFEAT_ALL)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin10_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin10_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin10_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin10_Tutorial[] = {
    END_MAIN
};

// 0x89EC32C
CONST_DATA struct ChapterEventGroup LagdouRuins10Event = {
    .turnBasedEvents               = EventListScr_Ruin10_Turn,
    .characterBasedEvents          = EventListScr_Ruin10_Character,
    .locationBasedEvents           = EventListScr_Ruin10_Location,
    .miscBasedEvents               = EventListScr_Ruin10_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ruin10_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ruin10_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ruin10_UnitMove,
    .tutorialEvents                = EventListScr_Ruin10_Tutorial,

    .traps            = TrapData_Event_089EDE75,
    .extraTrapsInHard = TrapData_Event_089EDF6A,

    .playerUnitsInNormal = UnitDef_088CFA30,
    .playerUnitsInHard   = UnitDef_088CFA30,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ruins10_BeginingScene,
    .endingSceneEvents    = EventScr_Ruin10_EndingScene,
};
