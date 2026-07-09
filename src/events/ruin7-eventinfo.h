#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ruin7_Turn[] = {
    TurnEventPlayer_(0, EventScr_Ruin_18, 3, 2)
    TurnEventPlayer_(0, EventScr_Ruin_19, 4, 2)
    TurnEventPlayer_(0, EventScr_Ruin_20, 5, 2)
    TurnEventPlayer_(0, EventScr_Ruin_21, 4, 3)
    TurnEventPlayer_(EVFLAG_TMP(8), EventScr_Ruin_23, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(10), EventScr_Ruin_25, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(12), EventScr_Ruin_27, 1, 255)
    TurnEventPlayer_(0, EventScr_Ruin_28, 9, 2)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin7_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin7_Location[] = {
    LOCA(0, ShopList_Ruin7_0, 5, 11, TILE_COMMAND_CHEST)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin7_Misc[] = {
    AFEV(0, EventScr_Ruin7_EndingScene, EVFLAG_DEFEAT_ALL)
    AREA(EVFLAG_TMP(7), EventScr_Ruin_22, 2, 10, 6, 12)
    AREA(EVFLAG_TMP(9), EventScr_Ruin_24, 14, 17, 24, 21)
    AREA(EVFLAG_TMP(9), EventScr_Ruin_24, 21, 22, 24, 25)
    AREA(EVFLAG_TMP(11), EventScr_Ruin_26, 13, 22, 20, 25)
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

    .traps            = TrapData_Event_Ruin7_0,
    .extraTrapsInHard = TrapData_Event_Ruin7_1,

    .playerUnitsInNormal = UnitDef_Ruin7Ally,
    .playerUnitsInHard   = UnitDef_Ruin7Ally,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ruins7_BeginningScene,
    .endingSceneEvents    = EventScr_Ruin7_EndingScene,
};
