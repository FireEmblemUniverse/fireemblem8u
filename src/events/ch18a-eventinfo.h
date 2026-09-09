#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch18a_Turn[] = {
    TurnEventPlayer_(0, EventScr_Ch18A_1, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(8), EventScr_Ch18A_4, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(10), EventScr_Ch18A_6, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(12), EventScr_Ch18A_8, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(14), EventScr_Ch18A_10, 1, 255)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch18a_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch18a_Location[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch18a_Misc[] = {
    DefeatAll(EventScr_Ch18A_0)
    AREA(EVFLAG_TMP(7), EventScr_Ch18A_3, 14, 20, 22, 27)
    AREA(EVFLAG_TMP(11), EventScr_Ch18A_7, 16, 0, 22, 10)
    AREA(EVFLAG_TMP(9), EventScr_Ch18A_5, 19, 14, 22, 19)
    AREA(EVFLAG_TMP(13), EventScr_Ch18A_9, 4, 0, 13, 8)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch18a_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch18a_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch18a_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch18a_Tutorial[] = {
    END_MAIN
};

// 0x89E9DA8
CONST_DATA struct ChapterEventGroup Ch18EirikaEvents = {
    .turnBasedEvents               = EventListScr_Ch18a_Turn,
    .characterBasedEvents          = EventListScr_Ch18a_Character,
    .locationBasedEvents           = EventListScr_Ch18a_Location,
    .miscBasedEvents               = EventListScr_Ch18a_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch18a_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch18a_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch18a_UnitMove,
    .tutorialEvents                = EventListScr_Ch18a_Tutorial,

    .traps            = TrapData_Event_Ch18A_0,
    .extraTrapsInHard = TrapData_Event_Ch18A_1,

    .playerUnitsInNormal = UnitDef_Ch18AAlly_0,
    .playerUnitsInHard   = UnitDef_Ch18AAlly_0,

    .playerUnitsChoice1InEncounter = UnitDef_Ch18AAlly_3,
    .playerUnitsChoice2InEncounter = UnitDef_Ch18AAlly_4,
    .playerUnitsChoice3InEncounter = UnitDef_Ch18AAlly_5,

    .enemyUnitsChoice1InEncounter = UnitDef_Ch18AEnemy_8,
    .enemyUnitsChoice2InEncounter = UnitDef_Ch18AEnemy_9,
    .enemyUnitsChoice3InEncounter = UnitDef_Ch18AEnemy_10,

    .beginningSceneEvents = EventScr_Ch18a_BeginningScene,
    .endingSceneEvents    = EventScr_Ch18A_0,
};
