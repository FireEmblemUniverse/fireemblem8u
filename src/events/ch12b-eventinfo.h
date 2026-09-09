#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch12b_Turn[] = {
    TurnEventEnemy(0, EventScr_Ch12B_0, 1)
    TurnEventPlayer(EVFLAG_TMP(8), EventScr_Ch12B_1, 2)
    TurnEventPlayer_(0, EventScr_Ch12B_5, 3, 2)
    TurnEventPlayer_(0, EventScr_Ch12B_6, 4, 3)
    TurnEventPlayer_(0, EventScr_Ch12B_7, 5, 3)
    TurnEventPlayer_(0, EventScr_Ch12B_8, 8, 3)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch12b_Character[] = {
    CHAR(EVFLAG_TMP(7), EventScr_Ch12B_2, CHARACTER_EWAN, CHARACTER_MARISA)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch12b_Location[] = {
    House(0, EventScr_Ch12B_4, 6, 9)
    Vendor(ShopList_Ch12B_0, 4, 1)
    Village(0, EventScr_Ch12B_3, 5, 5)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch12b_Misc[] = {
    DefeatBoss(EventScr_Ch12b_EndingScene)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch12b_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch12b_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch12b_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch12b_Tutorial[] = {
    END_MAIN
};

// 0x89EA6CC
CONST_DATA struct ChapterEventGroup Ch12EphraimEvents = {
    .turnBasedEvents               = EventListScr_Ch12b_Turn,
    .characterBasedEvents          = EventListScr_Ch12b_Character,
    .locationBasedEvents           = EventListScr_Ch12b_Location,
    .miscBasedEvents               = EventListScr_Ch12b_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch12b_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch12b_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch12b_UnitMove,
    .tutorialEvents                = EventListScr_Ch12b_Tutorial,

    .traps            = TrapData_Event_Ch12B_0,
    .extraTrapsInHard = TrapData_Event_Ch12B_1,

    .playerUnitsInNormal = UnitDef_Ch12BAlly_0,
    .playerUnitsInHard   = UnitDef_Ch12BAlly_0,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch12b_BeginningScene,
    .endingSceneEvents    = EventScr_Ch12b_EndingScene,
};
