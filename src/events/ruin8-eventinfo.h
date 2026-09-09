#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ruin8_Turn[] = {
    TurnEventPlayer_(0, EventScr_Ruin_37, 1, 255)
    TurnEventPlayer_(0, EventScr_Ruin_38, 1, 255)
    TurnEventPlayer_(0, EventScr_Ruin_39, 1, 255)
    TurnEventPlayer_(0, EventScr_Ruin_40, 1, 255)
    TurnEventPlayer_(0, EventScr_Ruin_41, 1, 255)
    TurnEventPlayer_(0, EventScr_Ruin_42, 1, 255)
    TurnEventPlayer_(0, EventScr_Ruin_43, 1, 255)
    TurnEventPlayer_(0, EventScr_Ruin_44, 1, 255)
    TurnEventPlayer_(0, EventScr_Ruin_45, 1, 255)
    TurnEventPlayer_(0, EventScr_Ruin_46, 1, 255)
    TurnEventPlayer_(0, EventScr_Ruin_47, 1, 255)
    TurnEventPlayer_(0, EventScr_Ruin_48, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(8), EventScr_Ruin_30, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(10), EventScr_Ruin_32, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(12), EventScr_Ruin_34, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(14), EventScr_Ruin_36, 1, 255)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin8_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin8_Location[] = {
    Door_(16, 5)
    Door_(17, 5)
    LOCA(0, ShopList_Ruin8_0, 4, 12, TILE_COMMAND_CHEST)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin8_Misc[] = {
    AFEV(0, EventScr_Ruin8_EndingScene, EVFLAG_DEFEAT_ALL)
    AREA(EVFLAG_TMP(11), EventScr_Ruin_33, 15, 8, 18, 13)
    AREA(EVFLAG_TMP(13), EventScr_Ruin_35, 13, 0, 19, 7)
    AREA(EVFLAG_TMP(13), EventScr_Ruin_35, 7, 0, 12, 6)
    AREA(EVFLAG_TMP(7), EventScr_Ruin_29, 8, 11, 11, 14)
    AREA(EVFLAG_TMP(9), EventScr_Ruin_31, 13, 15, 19, 20)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin8_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin8_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin8_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin8_Tutorial[] = {
    END_MAIN
};

// 0x89EC1E0
CONST_DATA struct ChapterEventGroup LagdouRuins8Event = {
    .turnBasedEvents               = EventListScr_Ruin8_Turn,
    .characterBasedEvents          = EventListScr_Ruin8_Character,
    .locationBasedEvents           = EventListScr_Ruin8_Location,
    .miscBasedEvents               = EventListScr_Ruin8_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ruin8_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ruin8_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ruin8_UnitMove,
    .tutorialEvents                = EventListScr_Ruin8_Tutorial,

    .traps            = TrapData_Event_Ruin8_0,
    .extraTrapsInHard = TrapData_Event_Ruin8_1,

    .playerUnitsInNormal = UnitDef_Ruin8Ally,
    .playerUnitsInHard   = UnitDef_Ruin8Ally,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ruins8_BeginningScene,
    .endingSceneEvents    = EventScr_Ruin8_EndingScene,
};
