#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch20b_Turn[] = {
    TurnEventEnemy(0, EventScr_089FD578, 1)
    TurnEventPlayer_(0, EventScr_089FD630, 15, 7)
    TurnEventPlayer_(0, EventScr_089FD674, 16, 7)
    TurnEventPlayer_(EVFLAG_TMP(10), EventScr_089FD6D8, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(12), EventScr_089FD72C, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(14), EventScr_089FD7B4, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(16), EventScr_089FD83C, 1, 255)
    TurnEventPlayer_(0, EventScr_089FD8F8, 19, 11)
    TurnEventPlayer_(0, EventScr_089FD95C, 5, 2)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch20b_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch20b_Location[] = {
    Seize(11, 11)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch20b_Misc[] = {
    AREA(EVFLAG_TMP(9), EventScr_089FD6B8, 17, 0, 25, 13)
    AREA(EVFLAG_TMP(11), EventScr_089FD70C, 7, 0, 16, 6)
    AREA(EVFLAG_TMP(13), EventScr_089FD794, 7, 15, 16, 20)
    AREA(EVFLAG_TMP(15), EventScr_089FD81C, 7, 7, 16, 14)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch20b_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch20b_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch20b_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch20b_Tutorial[] = {
    END_MAIN
};

// 0x89EB340
CONST_DATA struct ChapterEventGroup Ch20EphraimEventData = {
    .turnBasedEvents               = EventListScr_Ch20b_Turn,
    .characterBasedEvents          = EventListScr_Ch20b_Character,
    .locationBasedEvents           = EventListScr_Ch20b_Location,
    .miscBasedEvents               = EventListScr_Ch20b_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch20b_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch20b_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch20b_UnitMove,
    .tutorialEvents                = EventListScr_Ch20b_Tutorial,

    .traps            = TrapData_Event_089EDCE1,
    .extraTrapsInHard = TrapData_Event_089EDEDE,

    .playerUnitsInNormal = UnitDef_088CA63C,
    .playerUnitsInHard   = UnitDef_088CA63C,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch20b_BeginingScene,
    .endingSceneEvents    = EventScr_Ch20b_EndingScene,
};
