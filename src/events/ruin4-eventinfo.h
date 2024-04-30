#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ruin4_Turn[] = {
    TurnEventPlayer(0, EventScr_089FE590, 4)
    TurnEventPlayer_(0, EventScr_089FE5A8, 8, 2)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin4_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin4_Location[] = {
    LOCA(0, ChestItemList_Event_089ED772, 18, 2, TILE_COMMAND_CHEST)
    LOCA(0, ChestItemList_Event_089ED77C, 1, 26, TILE_COMMAND_CHEST)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin4_Misc[] = {
    AFEV(0, EventScr_Ruin4_EndingScene, EVFLAG_DEFEAT_ALL)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin4_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin4_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin4_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin4_Tutorial[] = {
    END_MAIN
};

// 0x89EBD5C
CONST_DATA struct ChapterEventGroup LagdouRuins4Event = {
    .turnBasedEvents               = EventListScr_Ruin4_Turn,
    .characterBasedEvents          = EventListScr_Ruin4_Character,
    .locationBasedEvents           = EventListScr_Ruin4_Location,
    .miscBasedEvents               = EventListScr_Ruin4_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ruin4_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ruin4_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ruin4_UnitMove,
    .tutorialEvents                = EventListScr_Ruin4_Tutorial,

    .traps            = TrapData_Event_089EDCFB,
    .extraTrapsInHard = TrapData_Event_089EDEEC,

    .playerUnitsInNormal = UnitDef_088CDF48,
    .playerUnitsInHard   = UnitDef_088CDF48,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ruins4_BeginingScene,
    .endingSceneEvents    = EventScr_Ruin4_EndingScene,
};
