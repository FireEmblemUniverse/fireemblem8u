#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch5x_Turn[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch5x_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch5x_Location[] = {
    Door_(23, 12)
    Door_(4, 10)
    Chest(ITEM_ELIXIR, 4, 8)
    Chest(ITEM_LANCE_KILLER, 5, 8)
    Seize(13, 7)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch5x_Misc[] = {
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch5x_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch5x_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch5x_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch5x_Tutorial[] = {
    END_MAIN
};

CONST_DATA struct ChapterEventGroup Ch5XEvents = {
    .turnBasedEvents               = EventListScr_Ch5x_Turn,
    .characterBasedEvents          = EventListScr_Ch5x_Character,
    .locationBasedEvents           = EventListScr_Ch5x_Location,
    .miscBasedEvents               = EventListScr_Ch5x_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch5x_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch5x_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch5x_UnitMove,
    .tutorialEvents                = EventListScr_Ch5x_Tutorial,

    .traps            = TrapData_Event_Ch5x,
    .extraTrapsInHard = TrapData_Event_Ch5xHard,

    .playerUnitsInNormal = UnitDef_Event_Ch5xAlly,
    .playerUnitsInHard   = UnitDef_Event_Ch5xAlly,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch5x_BeginingScene,
    .endingSceneEvents    = EventScr_Ch5x_EndingScene,
};
