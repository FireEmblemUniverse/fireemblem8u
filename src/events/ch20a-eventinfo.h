#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch20a_Turn[] = {
    TurnEventEnemy(0, EventScr_089F8C60, 1)
    TurnEventPlayer_(0, EventScr_089F8D9C, 15, 7)
    TurnEventPlayer_(0, EventScr_089F8DE0, 16, 7)
    TurnEventPlayer_(EVFLAG_TMP(10), EventScr_089F8E44, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(12), EventScr_089F8E98, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(14), EventScr_089F8F20, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(16), EventScr_089F8FA8, 1, 255)
    TurnEventPlayer_(0, EventScr_089F9064, 19, 11)
    TurnEventPlayer_(0, EventScr_089F90C8, 5, 2)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch20a_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch20a_Location[] = {
    Seize(11, 11)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch20a_Misc[] = {
    AREA(EVFLAG_TMP(9), EventScr_089F8E24, 17, 0, 25, 13)
    AREA(EVFLAG_TMP(11), EventScr_089F8E78, 7, 0, 16, 6)
    AREA(EVFLAG_TMP(13), EventScr_089F8F00, 7, 15, 16, 20)
    AREA(EVFLAG_TMP(15), EventScr_089F8F88, 7, 7, 16, 14)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch20a_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch20a_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch20a_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch20a_Tutorial[] = {
    END_MAIN
};

// 0x89EA02C
CONST_DATA struct ChapterEventGroup Ch20EirikaEvents = {
    .turnBasedEvents               = EventListScr_Ch20a_Turn,
    .characterBasedEvents          = EventListScr_Ch20a_Character,
    .locationBasedEvents           = EventListScr_Ch20a_Location,
    .miscBasedEvents               = EventListScr_Ch20a_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch20a_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch20a_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch20a_UnitMove,
    .tutorialEvents                = EventListScr_Ch20a_Tutorial,

    .traps            = TrapData_Event_089EDB69,
    .extraTrapsInHard = TrapData_Event_089EDEC8,

    .playerUnitsInNormal = UnitDef_088C0D74,
    .playerUnitsInHard   = UnitDef_088C0D74,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch20a_BeginingScene,
    .endingSceneEvents    = EventScr_089F8C8C,
};
