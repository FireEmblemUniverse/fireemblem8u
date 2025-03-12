#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch4_Turn[] = {
    TURN(0, EventScr_089F199C, 2, 0, FACTION_GREEN)
    TURN(0, EventScr_089F1C14, 2, 0, FACTION_BLUE)
    TURN(EVFLAG_TMP(8), EventScr_089F1C48, 1, 255, FACTION_BLUE)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch4_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch4_Location[] = {
    Village(0, EventScr_089F1B38, 1, 11)
    Village(0, EventScr_089F1BD8, 8, 2)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch4_Misc[] = {
    DefeatAll(EventScr_089F19F8)
    AREA(EVFLAG_TMP(7), EventScr_089F1C2C, 0, 9, 14, 14)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch4_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch4_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch4_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch4_Tutorial[] = {
    END_MAIN
};

CONST_DATA struct ChapterEventGroup Ch4Events = {
    .turnBasedEvents               = EventListScr_Ch4_Turn,
    .characterBasedEvents          = EventListScr_Ch4_Character,
    .locationBasedEvents           = EventListScr_Ch4_Location,
    .miscBasedEvents               = EventListScr_Ch4_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch4_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch4_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch4_UnitMove,
    .tutorialEvents                = EventListScr_Ch4_Tutorial,

    .traps            = TrapData_Event_Ch4,
    .extraTrapsInHard = TrapData_Event_Ch4Hard,

    .playerUnitsInNormal = UnitDef_Event_Ch4Ally,
    .playerUnitsInHard   = UnitDef_Event_Ch4Ally,

    .playerUnitsChoice1InEncounter = UnitDef_088B4DB4,
    .playerUnitsChoice2InEncounter = UnitDef_Ch4SkirmishAlly2,
    .playerUnitsChoice3InEncounter = UnitDef_088B528C,

    .enemyUnitsChoice1InEncounter = UnitDef_088B4E68,
    .enemyUnitsChoice2InEncounter = UnitDef_088B50D4,
    .enemyUnitsChoice3InEncounter = UnitDef_088B5340,

    .beginningSceneEvents = EventScr_Ch4_BeginingScene,
    .endingSceneEvents    = EventScr_089F19F8,
};
