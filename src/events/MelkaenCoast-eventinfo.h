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

    .traps            = TrapData_Event_089EDE77,
    .extraTrapsInHard = TrapData_Event_089EDF6C,

    .playerUnitsInNormal = UnitDef_088CFBFC,
    .playerUnitsInHard   = UnitDef_088CFBFC,

    .playerUnitsChoice1InEncounter = UnitDef_088D00D4,
    .playerUnitsChoice2InEncounter = UnitDef_088D05AC,
    .playerUnitsChoice3InEncounter = UnitDef_088D0A84,

    .enemyUnitsChoice1InEncounter = UnitDef_088D019C,
    .enemyUnitsChoice2InEncounter = UnitDef_088D0674,
    .enemyUnitsChoice3InEncounter = UnitDef_088D0B4C,

    .beginningSceneEvents = EventScr_MelkaenCoast_BeginingScene,
    .endingSceneEvents    = EventScr_MelkaenCoast_EndingScene,
};
