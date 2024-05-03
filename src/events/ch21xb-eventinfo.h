#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch21xb_Turn[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch21xb_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch21xb_Location[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch21xb_Misc[] = {
    DefeatBoss(EventScr_Ch21xb_EndingScene)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch21xb_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch21xb_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch21xb_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch21xb_Tutorial[] = {
    END_MAIN
};

// 0x89EB4D4
CONST_DATA struct ChapterEventGroup FinalEphraimEvents2 = {
    .turnBasedEvents               = EventListScr_Ch21xb_Turn,
    .characterBasedEvents          = EventListScr_Ch21xb_Character,
    .locationBasedEvents           = EventListScr_Ch21xb_Location,
    .miscBasedEvents               = EventListScr_Ch21xb_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch21xb_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch21xb_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch21xb_UnitMove,
    .tutorialEvents                = EventListScr_Ch21xb_Tutorial,

    .traps            = TrapData_Event_089EDCE3,
    .extraTrapsInHard = TrapData_Event_089EDEE0,

    .playerUnitsInNormal = UnitDef_088CB6A0,
    .playerUnitsInHard   = UnitDef_088CB6A0,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch21x_BeginingScene,
    .endingSceneEvents    = EventScr_Ch21xb_EndingScene,
};
