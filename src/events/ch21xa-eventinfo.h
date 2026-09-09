#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch21xa_Turn[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch21xa_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch21xa_Location[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch21xa_Misc[] = {
    DefeatBoss(EventScr_Ch21xa_EndingScene)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch21xa_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch21xa_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch21xa_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch21xa_Tutorial[] = {
    END_MAIN
};

// 0x89EA1C0
CONST_DATA struct ChapterEventGroup FinalEirikaEvents2 = {
    .turnBasedEvents               = EventListScr_Ch21xa_Turn,
    .characterBasedEvents          = EventListScr_Ch21xa_Character,
    .locationBasedEvents           = EventListScr_Ch21xa_Location,
    .miscBasedEvents               = EventListScr_Ch21xa_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch21xa_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch21xa_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch21xa_UnitMove,
    .tutorialEvents                = EventListScr_Ch21xa_Tutorial,

    .traps            = TrapData_Event_Ch21XA_0,
    .extraTrapsInHard = TrapData_Event_Ch21XA_1,

    .playerUnitsInNormal = UnitDef_Ch21XAAlly_0,
    .playerUnitsInHard   = UnitDef_Ch21XAAlly_0,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch21xa_BeginningScene,
    .endingSceneEvents    = EventScr_Ch21xa_EndingScene,
};
