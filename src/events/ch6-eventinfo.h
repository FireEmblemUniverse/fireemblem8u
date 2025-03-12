#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch6_Turn[] = {
    TURN(0, EventScr_089F2B74, 4, 0, FACTION_BLUE)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch6_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch6_Location[] = {
    Village(0, EventScr_089F2A98, 11, 18)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch6_Misc[] = {
    DefeatBoss(EventScr_Ch6_EndingScene)
    AREA(EVFLAG_TMP(7), EventScr_089F2940, 24, 9, 27, 14)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch6_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch6_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch6_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch6_Tutorial[] = {
    END_MAIN
};

CONST_DATA struct ChapterEventGroup Ch6Events = {
    .turnBasedEvents               = EventListScr_Ch6_Turn,
    .characterBasedEvents          = EventListScr_Ch6_Character,
    .locationBasedEvents           = EventListScr_Ch6_Location,
    .miscBasedEvents               = EventListScr_Ch6_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch6_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch6_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch6_UnitMove,
    .tutorialEvents                = EventListScr_Ch6_Tutorial,

    .traps            = TrapData_Event_Ch6,
    .extraTrapsInHard = TrapData_Event_Ch6Hard,

    .playerUnitsInNormal = UnitDef_Event_Ch6Ally,
    .playerUnitsInHard   = UnitDef_Event_Ch6Ally,

    .playerUnitsChoice1InEncounter = UnitDef_088B6540,
    .playerUnitsChoice2InEncounter = UnitDef_088B6838,
    .playerUnitsChoice3InEncounter = UnitDef_088B6B30,

    .enemyUnitsChoice1InEncounter = UnitDef_088B6608,
    .enemyUnitsChoice2InEncounter = UnitDef_088B6900,
    .enemyUnitsChoice3InEncounter = UnitDef_088B6BF8,

    .beginningSceneEvents = EventScr_Ch6_BeginingScene,
    .endingSceneEvents    = EventScr_Ch6_EndingScene,
};
