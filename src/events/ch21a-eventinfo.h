#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch21a_Turn[] = {
    TurnEventPlayer_(EVFLAG_TMP(13), EventScr_089F9448, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(11), EventScr_089F93A0, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(12), EventScr_089F93F4, 1, 255)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch21a_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch21a_Location[] = {
    Door(4, 19)
    Door(18, 19)
    Chest(ITEM_BOOSTER_HP, 21, 18)
    Chest(ITEM_MASTERSEAL, 2, 18)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch21a_Misc[] = {
    DefeatBoss(EventScr_089F92A0)
    AREA(EVFLAG_TMP(10), EventScr_089F9428, 10, 5, 12, 6)
    AREA(EVFLAG_TMP(8), EventScr_089F9380, 0, 7, 11, 12)
    AREA(EVFLAG_TMP(9), EventScr_089F93D4, 12, 7, 22, 12)
    AREA(EVFLAG_TMP(14), EventScr_089F947C, 1, 0, 21, 4)
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

    .traps            = TrapData_Event_089EDB6B,
    .extraTrapsInHard = TrapData_Event_089EDECA,

    .playerUnitsInNormal = UnitDef_088C181C,
    .playerUnitsInHard   = UnitDef_088C181C,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch21a_BeginingScene,
    .endingSceneEvents    = EventScr_089F92A0,
};
