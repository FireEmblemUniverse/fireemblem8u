#include "gbafe.h"

CONST_DATA EventListScr EventListScr_MelkaenCoast_Turn[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_MelkaenCoast_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_MelkaenCoast_Location[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_MelkaenCoast_Misc[] = {
    AFEV(0, EventScr_MelkaenCoast_EndingScene, EVFLAG_DEFEAT_ALL)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_MelkaenCoast_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_MelkaenCoast_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_MelkaenCoast_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_MelkaenCoast_Tutorial[] = {
    END_MAIN
};

// 0x89EC43C
CONST_DATA struct ChapterEventGroup MelkaenCoastEvent = {
    .turnBasedEvents               = EventListScr_MelkaenCoast_Turn,
    .characterBasedEvents          = EventListScr_MelkaenCoast_Character,
    .locationBasedEvents           = EventListScr_MelkaenCoast_Location,
    .miscBasedEvents               = EventListScr_MelkaenCoast_Misc,
    .specialEventsWhenUnitSelected = EventListScr_MelkaenCoast_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_MelkaenCoast_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_MelkaenCoast_UnitMove,
    .tutorialEvents                = EventListScr_MelkaenCoast_Tutorial,

    .traps            = TrapData_Event_MelkaenCoast_0,
    .extraTrapsInHard = TrapData_Event_MelkaenCoast_1,

    .playerUnitsInNormal = UnitDef_MelkaenCoastAlly_0,
    .playerUnitsInHard   = UnitDef_MelkaenCoastAlly_0,

    .playerUnitsChoice1InEncounter = UnitDef_MelkaenCoastAlly_1,
    .playerUnitsChoice2InEncounter = UnitDef_MelkaenCoastAlly_2,
    .playerUnitsChoice3InEncounter = UnitDef_MelkaenCoastAlly_3,

    .enemyUnitsChoice1InEncounter = UnitDef_MelkaenCoastEnemy_1,
    .enemyUnitsChoice2InEncounter = UnitDef_MelkaenCoastEnemy_2,
    .enemyUnitsChoice3InEncounter = UnitDef_MelkaenCoastEnemy_3,

    .beginningSceneEvents = EventScr_MelkaenCoast_BeginningScene,
    .endingSceneEvents    = EventScr_MelkaenCoast_EndingScene,
};
