#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ruin8_Turn[] = {
    TurnEventPlayer_(0, EventScr_089FEBD0, 1, 255)
    TurnEventPlayer_(0, EventScr_089FEC40, 1, 255)
    TurnEventPlayer_(0, EventScr_089FEC9C, 1, 255)
    TurnEventPlayer_(0, EventScr_089FED30, 1, 255)
    TurnEventPlayer_(0, EventScr_089FEDB0, 1, 255)
    TurnEventPlayer_(0, EventScr_089FEE20, 1, 255)
    TurnEventPlayer_(0, EventScr_089FEE7C, 1, 255)
    TurnEventPlayer_(0, EventScr_089FEF14, 1, 255)
    TurnEventPlayer_(0, EventScr_089FEF98, 1, 255)
    TurnEventPlayer_(0, EventScr_089FF044, 1, 255)
    TurnEventPlayer_(0, EventScr_089FF0DC, 1, 255)
    TurnEventPlayer_(0, EventScr_089FF150, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(8), EventScr_089FEA94, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(10), EventScr_089FEAE8, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(12), EventScr_089FEB3C, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(14), EventScr_089FEB9C, 1, 255)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin8_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin8_Location[] = {
    Door_(16, 5)
    Door_(17, 5)
    LOCA(0, ChestItemList_Event_089ED7BE, 4, 12, TILE_COMMAND_CHEST)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin8_Misc[] = {
    AFEV(0, EventScr_Ruin8_EndingScene, EVFLAG_DEFEAT_ALL)
    AREA(EVFLAG_TMP(11), EventScr_089FEB1C, 15, 8, 18, 13)
    AREA(EVFLAG_TMP(13), EventScr_089FEB70, 13, 0, 19, 7)
    AREA(EVFLAG_TMP(13), EventScr_089FEB70, 7, 0, 12, 6)
    AREA(EVFLAG_TMP(7), EventScr_089FEA74, 8, 11, 11, 14)
    AREA(EVFLAG_TMP(9), EventScr_089FEAC8, 13, 15, 19, 20)
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

    .traps            = TrapData_Event_089EDD7D,
    .extraTrapsInHard = TrapData_Event_089EDEF0,

    .playerUnitsInNormal = UnitDef_088CF10C,
    .playerUnitsInHard   = UnitDef_088CF10C,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ruins8_BeginingScene,
    .endingSceneEvents    = EventScr_Ruin8_EndingScene,
};
