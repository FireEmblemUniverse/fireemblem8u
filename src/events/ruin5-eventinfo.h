#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ruin5_Turn[] = {
    TurnEventPlayer(0, EventScr_089FE67C, 8)
    TurnEventPlayer(0, EventScr_089FE694, 2)
    TurnEventPlayer(0, EventScr_089FE6AC, 4)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin5_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin5_Location[] = {
    LOCA(0, ChestItemList_Event_089ED792, 13, 10, TILE_COMMAND_CHEST)
    LOCA(0, ChestItemList_Event_089ED79C, 17, 21, TILE_COMMAND_CHEST)
    LOCA(0, ChestItemList_Event_089ED7A8, 4, 4, TILE_COMMAND_CHEST)
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

    .traps            = TrapData_Event_089EDCFC,
    .extraTrapsInHard = TrapData_Event_089EDEED,

    .playerUnitsInNormal = UnitDef_088CE36C,
    .playerUnitsInHard   = UnitDef_088CE36C,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ruins5_BeginingScene,
    .endingSceneEvents    = EventScr_Ruin5_EndingScene,
};
