#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch11b_Turn[] = {
    TurnEventPlayer(0, EventScr_Ch11B_1, 3)
    TurnEventPlayer(0, EventScr_Ch11B_2, 5)
    TurnEventPlayer_(0, EventScr_Ch11B_5, 4, 3)
    TurnEventPlayer(0, EventScr_Ch11B_6, 5)
    TurnEventPlayer(0, EventScr_Ch11B_7, 4)
    TurnEventPlayer(0, EventScr_Ch11B_0, 2)
    TurnEventPlayer(0, EventScr_Ch11B_8, 4)
    TurnEventPlayer(0, EventScr_Ch11B_10, 5)
    TurnEventPlayer(0, EventScr_Ch11B_9, 3)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch11b_Character[] = {
    CHAR(EVFLAG_TMP(7), EventScr_Ch11B_3, CHARACTER_EPHRAIM, CHARACTER_LARACHEL)
    CHAR(EVFLAG_TMP(8), EventScr_Ch11B_4, CHARACTER_LARACHEL, CHARACTER_DOZLA)
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

    .traps            = TrapData_Event_Ch11B_0,
    .extraTrapsInHard = TrapData_Event_Ch11B_1,

    .playerUnitsInNormal = UnitDef_Ch11BAlly_0,
    .playerUnitsInHard   = UnitDef_Ch11BAlly_0,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch11b_BeginningScene,
    .endingSceneEvents    = EventScr_Ch11b_EndingScene,
};
