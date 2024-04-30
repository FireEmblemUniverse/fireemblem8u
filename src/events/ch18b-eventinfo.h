#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch18b_Turn[] = {
    TurnEventPlayer_(0, EventScr_089FD268, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(8), EventScr_089FD2AC, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(10), EventScr_089FD2E0, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(12), EventScr_089FD314, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(14), EventScr_089FD358, 1, 255)
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
    AREA(EVFLAG_TMP(7), EventScr_089FD290, 14, 20, 22, 27)
    AREA(EVFLAG_TMP(11), EventScr_089FD2F8, 16, 0, 22, 10)
    AREA(EVFLAG_TMP(9), EventScr_089FD2C4, 19, 14, 22, 19)
    AREA(EVFLAG_TMP(13), EventScr_089FD33C, 4, 0, 13, 8)
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

    .traps            = TrapData_Event_089EDB7D,
    .extraTrapsInHard = TrapData_Event_089EDEDC,

    .playerUnitsInNormal = UnitDef_088C8AD8,
    .playerUnitsInHard   = UnitDef_088C8AD8,

    .playerUnitsChoice1InEncounter = UnitDef_088C9104,
    .playerUnitsChoice2InEncounter = UnitDef_088C94B0,
    .playerUnitsChoice3InEncounter = UnitDef_088C985C,

    .enemyUnitsChoice1InEncounter = UnitDef_088C91B8,
    .enemyUnitsChoice2InEncounter = UnitDef_088C9564,
    .enemyUnitsChoice3InEncounter = UnitDef_088C9910,

    .beginningSceneEvents = EventScr_Ch18b_BeginingScene,
    .endingSceneEvents    = EventScr_Ch18b_EndingScene,
};
