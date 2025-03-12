#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Tower7_Turn[] = {
    TurnEventPlayer_(EVFLAG_TMP(12), EventScr_089FE170, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(13), EventScr_089FE188, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(14), EventScr_089FE1A0, 1, 255)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower7_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower7_Location[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower7_Misc[] = {
    AFEV(0, EventScr_Tower7_EndingScene, EVFLAG_DEFEAT_ALL)
    AFEV(EVFLAG_TMP(7), EventScr_089FE09C, 0)
    AFEV(EVFLAG_TMP(8), EventScr_089FE0C4, 0)
    AFEV(EVFLAG_TMP(9), EventScr_089FE0EC, 0)
    AFEV(EVFLAG_TMP(10), EventScr_089FE118, 0)
    AFEV(EVFLAG_TMP(11), EventScr_089FE144, 0)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower7_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower7_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower7_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower7_Tutorial[] = {
    END_MAIN
};

// 0x89EB97C
CONST_DATA struct ChapterEventGroup TowerOfValni7Events = {
    .turnBasedEvents               = EventListScr_Tower7_Turn,
    .characterBasedEvents          = EventListScr_Tower7_Character,
    .locationBasedEvents           = EventListScr_Tower7_Location,
    .miscBasedEvents               = EventListScr_Tower7_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Tower7_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Tower7_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Tower7_UnitMove,
    .tutorialEvents                = EventListScr_Tower7_Tutorial,

    .traps            = TrapData_Event_089EDCEA,
    .extraTrapsInHard = TrapData_Event_089EDEE7,

    .playerUnitsInNormal = UnitDef_088CC9B8,
    .playerUnitsInHard   = UnitDef_088CC9B8,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Tower7_BeginingScene,
    .endingSceneEvents    = EventScr_Tower7_EndingScene,
};
