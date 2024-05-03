#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch12b_Turn[] = {
    TurnEventEnemy(0, EventScr_089FB64C, 1)
    TurnEventPlayer(EVFLAG_TMP(8), EventScr_089FB678, 2)
    TurnEventPlayer_(0, EventScr_089FB998, 3, 2)
    TurnEventPlayer_(0, EventScr_089FB9B0, 4, 3)
    TurnEventPlayer_(0, EventScr_089FB9C8, 5, 3)
    TurnEventPlayer_(0, EventScr_089FB9E0, 8, 3)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch12b_Character[] = {
    CHAR(EVFLAG_TMP(7), EventScr_089FB90C, CHARACTER_EWAN, CHARACTER_MARISA)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch12b_Location[] = {
    House(0, EventScr_089FB970, 6, 9)
    Vendor(ShopList_Event_089ED8FA, 4, 1)
    Village(0, EventScr_089FB934, 5, 5)
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

    .traps            = TrapData_Event_089EDB74,
    .extraTrapsInHard = TrapData_Event_089EDED3,

    .playerUnitsInNormal = UnitDef_088C46B8,
    .playerUnitsInHard   = UnitDef_088C46B8,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch12b_BeginingScene,
    .endingSceneEvents    = EventScr_Ch12b_EndingScene,
};
