#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch18a_Turn[] = {
    TurnEventPlayer_(0, EventScr_089F81BC, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(8), EventScr_089F8200, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(10), EventScr_089F8234, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(12), EventScr_089F8268, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(14), EventScr_089F82AC, 1, 255)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch18a_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch18a_Location[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch18a_Misc[] = {
    DefeatAll(EventScr_089F7F88)
    AREA(EVFLAG_TMP(7), EventScr_089F81E4, 14, 20, 22, 27)
    AREA(EVFLAG_TMP(11), EventScr_089F824C, 16, 0, 22, 10)
    AREA(EVFLAG_TMP(9), EventScr_089F8218, 19, 14, 22, 19)
    AREA(EVFLAG_TMP(13), EventScr_089F8290, 4, 0, 13, 8)
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

    .traps            = TrapData_Event_089EDA04,
    .extraTrapsInHard = TrapData_Event_089EDEC5,

    .playerUnitsInNormal = UnitDef_088BEFE8,
    .playerUnitsInHard   = UnitDef_088BEFE8,

    .playerUnitsChoice1InEncounter = UnitDef_088BF6B4,
    .playerUnitsChoice2InEncounter = UnitDef_088BFA60,
    .playerUnitsChoice3InEncounter = UnitDef_088BFE0C,

    .enemyUnitsChoice1InEncounter = UnitDef_088BF768,
    .enemyUnitsChoice2InEncounter = UnitDef_088BFB14,
    .enemyUnitsChoice3InEncounter = UnitDef_088BFEC0,

    .beginningSceneEvents = EventScr_Ch18a_BeginingScene,
    .endingSceneEvents    = EventScr_089F7F88,
};
