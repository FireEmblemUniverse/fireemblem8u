#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ruin5_Turn[] = {
    TurnEventPlayer(0, EventScr_Ruin_11, 8)
    TurnEventPlayer(0, EventScr_Ruin_12, 2)
    TurnEventPlayer(0, EventScr_Ruin_13, 4)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin5_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin5_Location[] = {
    LOCA(0, ShopList_Ruin5_0, 13, 10, TILE_COMMAND_CHEST)
    LOCA(0, ShopList_Ruin5_1, 17, 21, TILE_COMMAND_CHEST)
    LOCA(0, ShopList_Ruin5_2, 4, 4, TILE_COMMAND_CHEST)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin5_Misc[] = {
    AFEV(0, EventScr_Ruin5_EndingScene, EVFLAG_DEFEAT_ALL)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin5_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin5_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin5_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin5_Tutorial[] = {
    END_MAIN
};

// 0x89EBE2C
CONST_DATA struct ChapterEventGroup LagdouRuins5Event = {
    .turnBasedEvents               = EventListScr_Ruin5_Turn,
    .characterBasedEvents          = EventListScr_Ruin5_Character,
    .locationBasedEvents           = EventListScr_Ruin5_Location,
    .miscBasedEvents               = EventListScr_Ruin5_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ruin5_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ruin5_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ruin5_UnitMove,
    .tutorialEvents                = EventListScr_Ruin5_Tutorial,

    .traps            = TrapData_Event_Ruin5_0,
    .extraTrapsInHard = TrapData_Event_Ruin5_1,

    .playerUnitsInNormal = UnitDef_Ruin5Ally,
    .playerUnitsInHard   = UnitDef_Ruin5Ally,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ruins5_BeginningScene,
    .endingSceneEvents    = EventScr_Ruin5_EndingScene,
};
