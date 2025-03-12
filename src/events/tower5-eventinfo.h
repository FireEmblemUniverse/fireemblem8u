#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Tower5_Turn[] = {
    TurnEventPlayer_(0, EventScr_089FDF18, 2, 5)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower5_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower5_Location[] = {
    LOCA(0, ChestItemList_Event_089ED70C, 6, 9, TILE_COMMAND_CHEST)
    LOCA(0, ChestItemList_Event_089ED71A, 14, 14, TILE_COMMAND_CHEST)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower5_Misc[] = {
    AFEV(0, EventScr_Tower5_EndingScene, EVFLAG_DEFEAT_ALL)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower5_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower5_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower5_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower5_Tutorial[] = {
    END_MAIN
};

// 0x89EB7DC
CONST_DATA struct ChapterEventGroup TowerOfValni5Events = {
    .turnBasedEvents               = EventListScr_Tower5_Turn,
    .characterBasedEvents          = EventListScr_Tower5_Character,
    .locationBasedEvents           = EventListScr_Tower5_Location,
    .miscBasedEvents               = EventListScr_Tower5_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Tower5_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Tower5_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Tower5_UnitMove,
    .tutorialEvents                = EventListScr_Tower5_Tutorial,

    .traps            = TrapData_Event_089EDCE8,
    .extraTrapsInHard = TrapData_Event_089EDEE5,

    .playerUnitsInNormal = UnitDef_088CC190,
    .playerUnitsInHard   = UnitDef_088CC190,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Tower5_BeginingScene,
    .endingSceneEvents    = EventScr_Tower5_EndingScene,
};
