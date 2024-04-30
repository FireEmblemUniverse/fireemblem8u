#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch11b_Turn[] = {
    TurnEventPlayer(0, EventScr_089FB250, 3)
    TurnEventPlayer(0, EventScr_089FB294, 5)
    TurnEventPlayer_(0, EventScr_089FB3E4, 4, 3)
    TurnEventPlayer(0, EventScr_089FB3FC, 5)
    TurnEventPlayer(0, EventScr_089FB444, 4)
    TurnEventPlayer(0, EventScr_089FB1E4, 2)
    TurnEventPlayer(0, EventScr_089FB458, 4)
    TurnEventPlayer(0, EventScr_089FB4A8, 5)
    TurnEventPlayer(0, EventScr_089FB480, 3)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch11b_Character[] = {
    CHAR(EVFLAG_TMP(7), EventScr_089FB394, CHARACTER_EPHRAIM, CHARACTER_LARACHEL)
    CHAR(EVFLAG_TMP(8), EventScr_089FB3BC, CHARACTER_LARACHEL, CHARACTER_DOZLA)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch11b_Location[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch11b_Misc[] = {
    DefeatAll(EventScr_Ch11b_EndingScene)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch11b_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch11b_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch11b_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch11b_Tutorial[] = {
    END_MAIN
};

// 0x89EA5BC
CONST_DATA struct ChapterEventGroup Ch11EphraimEvents = {
    .turnBasedEvents               = EventListScr_Ch11b_Turn,
    .characterBasedEvents          = EventListScr_Ch11b_Character,
    .locationBasedEvents           = EventListScr_Ch11b_Location,
    .miscBasedEvents               = EventListScr_Ch11b_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch11b_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch11b_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch11b_UnitMove,
    .tutorialEvents                = EventListScr_Ch11b_Tutorial,

    .traps            = TrapData_Event_089EDB72,
    .extraTrapsInHard = TrapData_Event_089EDED1,

    .playerUnitsInNormal = UnitDef_088C3E50,
    .playerUnitsInHard   = UnitDef_088C3E50,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch11b_BeginingScene,
    .endingSceneEvents    = EventScr_Ch11b_EndingScene,
};
