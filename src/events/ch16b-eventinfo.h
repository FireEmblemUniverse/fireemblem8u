#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch16b_Turn[] = {
    TurnEventPlayer_(EVFLAG_TMP(13), EventScr_Ch16B_5, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(14), EventScr_Ch16B_3, 1, 255)
    TurnEventPlayer(0, EventScr_Ch16B_1, 16)
    TurnEventPlayer(0, EventScr_Ch16B_0, 6)
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
    AREA(EVFLAG_TMP(11), EventScr_Ch16B_2, 0, 0, 8, 3)
    AREA(EVFLAG_TMP(12), EventScr_Ch16B_4, 5, 4, 21, 11)
    AREA(EVFLAG_TMP(12), EventScr_Ch16B_4, 1, 18, 13, 22)
    AREA(EVFLAG_TMP(11), EventScr_Ch16B_2, 14, 14, 21, 21)
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

    .traps            = TrapData_Event_Ch16B_0,
    .extraTrapsInHard = TrapData_Event_Ch16B_1,

    .playerUnitsInNormal = UnitDef_Ch16BAlly,
    .playerUnitsInHard   = UnitDef_Ch16BAlly,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch16b_BeginningScene,
    .endingSceneEvents    = EventScr_Ch16b_EndingScene,
};
