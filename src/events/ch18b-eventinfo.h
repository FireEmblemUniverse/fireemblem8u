#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch18b_Turn[] = {
    TurnEventPlayer_(0, EventScr_Ch18B_0, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(8), EventScr_Ch18B_3, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(10), EventScr_Ch18B_5, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(12), EventScr_Ch18B_7, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(14), EventScr_Ch18B_9, 1, 255)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch18b_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch18b_Location[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch18b_Misc[] = {
    DefeatAll(EventScr_Ch18b_EndingScene)
    AREA(EVFLAG_TMP(7), EventScr_Ch18B_2, 14, 20, 22, 27)
    AREA(EVFLAG_TMP(11), EventScr_Ch18B_6, 16, 0, 22, 10)
    AREA(EVFLAG_TMP(9), EventScr_Ch18B_4, 19, 14, 22, 19)
    AREA(EVFLAG_TMP(13), EventScr_Ch18B_8, 4, 0, 13, 8)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch18b_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch18b_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch18b_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch18b_Tutorial[] = {
    END_MAIN
};

// 0x89EB0BC
CONST_DATA struct ChapterEventGroup Ch18EphraimEventData = {
    .turnBasedEvents               = EventListScr_Ch18b_Turn,
    .characterBasedEvents          = EventListScr_Ch18b_Character,
    .locationBasedEvents           = EventListScr_Ch18b_Location,
    .miscBasedEvents               = EventListScr_Ch18b_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch18b_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch18b_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch18b_UnitMove,
    .tutorialEvents                = EventListScr_Ch18b_Tutorial,

    .traps            = TrapData_Event_Ch18B_0,
    .extraTrapsInHard = TrapData_Event_Ch18B_1,

    .playerUnitsInNormal = UnitDef_Ch18BAlly_0,
    .playerUnitsInHard   = UnitDef_Ch18BAlly_0,

    .playerUnitsChoice1InEncounter = UnitDef_Ch18BAlly_3,
    .playerUnitsChoice2InEncounter = UnitDef_Ch18BAlly_4,
    .playerUnitsChoice3InEncounter = UnitDef_Ch18BAlly_5,

    .enemyUnitsChoice1InEncounter = UnitDef_Ch18BEnemy_8,
    .enemyUnitsChoice2InEncounter = UnitDef_Ch18BEnemy_9,
    .enemyUnitsChoice3InEncounter = UnitDef_Ch18BEnemy_10,

    .beginningSceneEvents = EventScr_Ch18b_BeginningScene,
    .endingSceneEvents    = EventScr_Ch18b_EndingScene,
};
