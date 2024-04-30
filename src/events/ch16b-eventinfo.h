#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch16b_Turn[] = {
    TurnEventPlayer_(EVFLAG_TMP(13), EventScr_089FCE80, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(14), EventScr_089FCE04, 1, 255)
    TurnEventPlayer(0, EventScr_089FCDC0, 16)
    TurnEventPlayer(0, EventScr_089FCDA8, 6)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch16b_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch16b_Location[] = {
    Seize(13, 3)
    Chest(ITEM_AXE_TOMAHAWK, 3, 12)
    Chest(ITEM_BOOSTER_RES, 20, 1)
    Chest(ITEM_KNIGHTCREST, 20, 3)
    Door_(1, 4)
    Door_(3, 10)
    Door_(4, 3)
    ChestMoney(5000, 20, 5)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch16b_Misc[] = {
    AREA(EVFLAG_TMP(11), EventScr_089FCDD8, 0, 0, 8, 3)
    AREA(EVFLAG_TMP(12), EventScr_089FCE48, 5, 4, 21, 11)
    AREA(EVFLAG_TMP(12), EventScr_089FCE48, 1, 18, 13, 22)
    AREA(EVFLAG_TMP(11), EventScr_089FCDD8, 14, 14, 21, 21)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch16b_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch16b_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch16b_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch16b_Tutorial[] = {
    END_MAIN
};

// 0x89EAE2C
CONST_DATA struct ChapterEventGroup Ch16EphraimEventData = {
    .turnBasedEvents               = EventListScr_Ch16b_Turn,
    .characterBasedEvents          = EventListScr_Ch16b_Character,
    .locationBasedEvents           = EventListScr_Ch16b_Location,
    .miscBasedEvents               = EventListScr_Ch16b_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch16b_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch16b_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch16b_UnitMove,
    .tutorialEvents                = EventListScr_Ch16b_Tutorial,

    .traps            = TrapData_Event_089EDB7B,
    .extraTrapsInHard = TrapData_Event_089EDEDA,

    .playerUnitsInNormal = UnitDef_088C7648,
    .playerUnitsInHard   = UnitDef_088C7648,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch16b_BeginingScene,
    .endingSceneEvents    = EventScr_Ch16b_EndingScene,
};
