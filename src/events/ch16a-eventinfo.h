#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch16a_Turn[] = {
    TurnEventPlayer(0, EventScr_089F7558, 12)
    TurnEventPlayer_(EVFLAG_TMP(12), EventScr_089F75A4, 1, 255)
    TurnEventPlayer_(0, EventScr_089F75F0, 13, 3)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch16a_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch16a_Location[] = {
    Seize(13, 3)
    ChestMoney(5000, 20, 5)
    Chest(ITEM_KNIGHTCREST, 20, 3)
    Chest(ITEM_AXE_TOMAHAWK, 3, 12)
    Door_(1, 4)
    Door_(4, 3)
    Door_(3, 10)
    Chest(ITEM_BOOSTER_RES, 20, 1)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch16a_Misc[] = {
    AREA(EVFLAG_TMP(11), EventScr_089F7570, 2, 0, 21, 11)
    AREA(EVFLAG_TMP(11), EventScr_089F7570, 1, 18, 13, 22)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch16a_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch16a_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch16a_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch16a_Tutorial[] = {
    END_MAIN
};

CONST_DATA struct ChapterEventGroup Ch16EirEvents = {
    .turnBasedEvents               = EventListScr_Ch16a_Turn,
    .characterBasedEvents          = EventListScr_Ch16a_Character,
    .locationBasedEvents           = EventListScr_Ch16a_Location,
    .miscBasedEvents               = EventListScr_Ch16a_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch16a_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch16a_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch16a_UnitMove,
    .tutorialEvents                = EventListScr_Ch16a_Tutorial,

    .traps            = TrapData_Event_089ED9FD,
    .extraTrapsInHard = TrapData_Event_089EDEBE,

    .playerUnitsInNormal = UnitDef_088BCE58,
    .playerUnitsInHard   = UnitDef_088BCE58,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch16a_BeginingScene,
    .endingSceneEvents    = EventScr_089F6E40,
};
