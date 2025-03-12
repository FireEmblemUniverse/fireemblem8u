#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch21b_Turn[] = {
    TurnEventPlayer_(EVFLAG_TMP(13), EventScr_089FDAF4, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(11), EventScr_089FDA4C, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(12), EventScr_089FDAA0, 1, 255)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch21b_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch21b_Location[] = {
    Door_(4, 19)
    Door_(18, 19)
    Chest(ITEM_BOOSTER_HP, 21, 18)
    Chest(ITEM_MASTERSEAL, 2, 18)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch21b_Misc[] = {
    DefeatBoss(EventScr_Ch21b_EndingScene)
    AREA(EVFLAG_TMP(10), EventScr_089FDAD4, 10, 5, 12, 6)
    AREA(EVFLAG_TMP(9), EventScr_089FDA80, 0, 7, 11, 12)
    AREA(EVFLAG_TMP(8), EventScr_089FDA2C, 12, 7, 22, 12)
    AREA(EVFLAG_TMP(14), EventScr_089FDB28, 1, 0, 21, 4)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch21b_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch21b_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch21b_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch21b_Tutorial[] = {
    END_MAIN
};

// 0x89EB44C
CONST_DATA struct ChapterEventGroup FinalEphraimEvents1 = {
    .turnBasedEvents               = EventListScr_Ch21b_Turn,
    .characterBasedEvents          = EventListScr_Ch21b_Character,
    .locationBasedEvents           = EventListScr_Ch21b_Location,
    .miscBasedEvents               = EventListScr_Ch21b_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch21b_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch21b_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch21b_UnitMove,
    .tutorialEvents                = EventListScr_Ch21b_Tutorial,

    .traps            = TrapData_Event_089EDCE2,
    .extraTrapsInHard = TrapData_Event_089EDEDF,

    .playerUnitsInNormal = UnitDef_088CB060,
    .playerUnitsInHard   = UnitDef_088CB060,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch21b_BeginingScene,
    .endingSceneEvents    = EventScr_Ch21b_EndingScene,
};
