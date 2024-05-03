#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ruin7_Turn[] = {
    TurnEventPlayer_(0, EventScr_089FE860, 3, 2)
    TurnEventPlayer_(0, EventScr_089FE878, 4, 2)
    TurnEventPlayer_(0, EventScr_089FE890, 5, 2)
    TurnEventPlayer_(0, EventScr_089FE8A8, 4, 3)
    TurnEventPlayer_(EVFLAG_TMP(8), EventScr_089FE8E0, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(10), EventScr_089FE934, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(12), EventScr_089FE988, 1, 255)
    TurnEventPlayer_(0, EventScr_089FE9BC, 9, 2)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin7_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin7_Location[] = {
    LOCA(0, ChestItemList_Event_089ED7B6, 5, 11, TILE_COMMAND_CHEST)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin7_Misc[] = {
    AFEV(0, EventScr_Ruin7_EndingScene, EVFLAG_DEFEAT_ALL)
    AREA(EVFLAG_TMP(7), EventScr_089FE8C0, 2, 10, 6, 12)
    AREA(EVFLAG_TMP(9), EventScr_089FE914, 14, 17, 24, 21)
    AREA(EVFLAG_TMP(9), EventScr_089FE914, 21, 22, 24, 25)
    AREA(EVFLAG_TMP(11), EventScr_089FE968, 13, 22, 20, 25)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin7_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin7_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin7_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin7_Tutorial[] = {
    END_MAIN
};

// 0x89EC038
CONST_DATA struct ChapterEventGroup LagdouRuins7Event = {
    .turnBasedEvents               = EventListScr_Ruin7_Turn,
    .characterBasedEvents          = EventListScr_Ruin7_Character,
    .locationBasedEvents           = EventListScr_Ruin7_Location,
    .miscBasedEvents               = EventListScr_Ruin7_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ruin7_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ruin7_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ruin7_UnitMove,
    .tutorialEvents                = EventListScr_Ruin7_Tutorial,

    .traps            = TrapData_Event_089EDD7C,
    .extraTrapsInHard = TrapData_Event_089EDEEF,

    .playerUnitsInNormal = UnitDef_088CEC84,
    .playerUnitsInHard   = UnitDef_088CEC84,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ruins7_BeginingScene,
    .endingSceneEvents    = EventScr_Ruin7_EndingScene,
};
