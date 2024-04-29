#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch11a_Turn[] = {
    Survive(EventScr_089F4EA4, 9)
    TurnEventPlayer_(0, EventScr_089F4F40, 4, 2)
    Survive(EventScr_089F4F58, 8)
    Survive(EventScr_089F4F70, 12)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch11a_Character[] = {
    CHAR(EVFLAG_TMP(10), EventScr_089F4E54, CHARACTER_EIRIKA, CHARACTER_LARACHEL)
    CHAR(EVFLAG_TMP(11), EventScr_089F4E7C, CHARACTER_LARACHEL, CHARACTER_DOZLA)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch11a_Location[] = {
    Chest(0x50, 3, 8)
    Chest(0x96, 12, 11)
    Chest(0x5D, 17, 5)
    Door(4, 11)
    Door(17, 13)
    Door(18, 13)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch11a_Misc[] = {
    DefeatAll(EventScr_Ch11a_EndingScene)
    AREA(EVFLAG_TMP(7), EventScr_089F4EBC, 14, 2, 21, 10)
    AREA(EVFLAG_TMP(8), EventScr_089F4EE0, 12, 11, 21, 17)
    AREA(EVFLAG_TMP(9), EventScr_089F4F1C, 1, 6, 5, 10)
    AREA(EVFLAG_TMP(9), EventScr_089F4F1C, 6, 8, 8, 12)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch11a_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch11a_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch11a_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch11a_Tutorial[] = {
    END_MAIN
};

CONST_DATA struct ChapterEventGroup Ch11EirikaEvents = {
    .turnBasedEvents               = EventListScr_Ch11a_Turn,
    .characterBasedEvents          = EventListScr_Ch11a_Character,
    .locationBasedEvents           = EventListScr_Ch11a_Location,
    .miscBasedEvents               = EventListScr_Ch11a_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch11a_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch11a_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch11a_UnitMove,
    .tutorialEvents                = EventListScr_Ch11a_Tutorial,

    .traps            = TrapData_Event_Ch11a,
    .extraTrapsInHard = TrapData_Event_Ch11aHard,

    .playerUnitsInNormal = UnitDef_Event_Ch11aAlly,
    .playerUnitsInHard   = UnitDef_Event_Ch11aAlly,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch11a_BeginingScene,
    .endingSceneEvents    = EventScr_Ch11a_EndingScene,
};
