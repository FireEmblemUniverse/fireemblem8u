#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch21a_Turn[] = {
    TurnEventPlayer_(EVFLAG_TMP(13), EventScr_Ch21A_6, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(11), EventScr_Ch21A_2, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(12), EventScr_Ch21A_4, 1, 255)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch21a_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch21a_Location[] = {
    Door_(4, 19)
    Door_(18, 19)
    Chest(ITEM_BOOSTER_HP, 21, 18)
    Chest(ITEM_MASTERSEAL, 2, 18)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch21a_Misc[] = {
    DefeatBoss(EventScr_Ch21A_0)
    AREA(EVFLAG_TMP(10), EventScr_Ch21A_5, 10, 5, 12, 6)
    AREA(EVFLAG_TMP(8), EventScr_Ch21A_1, 0, 7, 11, 12)
    AREA(EVFLAG_TMP(9), EventScr_Ch21A_3, 12, 7, 22, 12)
    AREA(EVFLAG_TMP(14), EventScr_Ch21A_7, 1, 0, 21, 4)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch21a_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch21a_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch21a_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch21a_Tutorial[] = {
    END_MAIN
};

// 0x89EA138
CONST_DATA struct ChapterEventGroup FinalEirikaEvents1 = {
    .turnBasedEvents               = EventListScr_Ch21a_Turn,
    .characterBasedEvents          = EventListScr_Ch21a_Character,
    .locationBasedEvents           = EventListScr_Ch21a_Location,
    .miscBasedEvents               = EventListScr_Ch21a_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch21a_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch21a_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch21a_UnitMove,
    .tutorialEvents                = EventListScr_Ch21a_Tutorial,

    .traps            = TrapData_Event_Ch21A_0,
    .extraTrapsInHard = TrapData_Event_Ch21A_1,

    .playerUnitsInNormal = UnitDef_Ch21AAlly_0,
    .playerUnitsInHard   = UnitDef_Ch21AAlly_0,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch21a_BeginningScene,
    .endingSceneEvents    = EventScr_Ch21A_0,
};
