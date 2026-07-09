#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Tower6_Turn[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower6_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower6_Location[] = {
    LOCA(0, ShopList_Tower6_0, 2, 18, TILE_COMMAND_CHEST)
    LOCA(0, ShopList_Tower6_1, 12, 1, TILE_COMMAND_CHEST)
    LOCA(0, ShopList_Tower6_2, 10, 1, TILE_COMMAND_CHEST)
    ChestMoney(5000, 19, 1)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower6_Misc[] = {
    AFEV(0, EventScr_Tower6_EndingScene, EVFLAG_DEFEAT_ALL)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower6_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower6_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower6_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower6_Tutorial[] = {
    END_MAIN
};

// 0x89EB894
CONST_DATA struct ChapterEventGroup TowerOfValni6Events = {
    .turnBasedEvents               = EventListScr_Tower6_Turn,
    .characterBasedEvents          = EventListScr_Tower6_Character,
    .locationBasedEvents           = EventListScr_Tower6_Location,
    .miscBasedEvents               = EventListScr_Tower6_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Tower6_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Tower6_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Tower6_UnitMove,
    .tutorialEvents                = EventListScr_Tower6_Tutorial,

    .traps            = TrapData_Event_Tower6_0,
    .extraTrapsInHard = TrapData_Event_Tower6_1,

    .playerUnitsInNormal = UnitDef_Tower6Ally,
    .playerUnitsInHard   = UnitDef_Tower6Ally,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Tower6_BeginningScene,
    .endingSceneEvents    = EventScr_Tower6_EndingScene,
};
