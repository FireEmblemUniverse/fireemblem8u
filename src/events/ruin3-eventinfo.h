#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ruin3_Turn[] = {
    TurnEventPlayer_(0, EventScr_089FE4A4, 4, 4)
    TurnEventPlayer_(0, EventScr_089FE4BC, 6, 5)
    TurnEventPlayer(0, EventScr_089FE4D4, 3)
    TurnEventPlayer(0, EventScr_089FE4EC, 2)
    TurnEventPlayer(0, EventScr_089FE504, 2)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin3_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin3_Location[] = {
    LOCA(0, ChestItemList_Event_089ED754, 1, 2, TILE_COMMAND_CHEST)
    LOCA(0, ChestItemList_Event_089ED762, 15, 15, TILE_COMMAND_CHEST)
    Door_(9, 6)
    Door_(17, 8)
    Door_(1, 22)
    Door_(1, 7)
    Door_(8, 6)
    ChestMoney(3000, 17, 3)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin3_Misc[] = {
    AFEV(0, EventScr_Ruin3_EndingScene, EVFLAG_DEFEAT_ALL)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin3_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin3_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin3_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin3_Tutorial[] = {
    END_MAIN
};

// 0x89EBCA4
CONST_DATA struct ChapterEventGroup LagdouRuins3Event = {
    .turnBasedEvents               = EventListScr_Ruin3_Turn,
    .characterBasedEvents          = EventListScr_Ruin3_Character,
    .locationBasedEvents           = EventListScr_Ruin3_Location,
    .miscBasedEvents               = EventListScr_Ruin3_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ruin3_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ruin3_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ruin3_UnitMove,
    .tutorialEvents                = EventListScr_Ruin3_Tutorial,

    .traps            = TrapData_Event_089EDCFA,
    .extraTrapsInHard = TrapData_Event_089EDEEB,

    .playerUnitsInNormal = UnitDef_088CD9F8,
    .playerUnitsInHard   = UnitDef_088CD9F8,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ruins3_BeginingScene,
    .endingSceneEvents    = EventScr_Ruin3_EndingScene,
};
