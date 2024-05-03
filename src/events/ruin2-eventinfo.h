#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ruin2_Turn[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin2_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin2_Location[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin2_Misc[] = {
    AFEV(0, EventScr_Ruin2_EndingScene, EVFLAG_DEFEAT_ALL)
    AREA(EVFLAG_TMP(7), EventScr_089FE3D8, 10, 0, 22, 17)
    AREA(EVFLAG_TMP(7), EventScr_089FE3D8, 0, 10, 9, 17)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin2_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin2_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin2_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ruin2_Tutorial[] = {
    END_MAIN
};

// 0x89EBB80
CONST_DATA struct ChapterEventGroup LagdouRuins2Event = {
    .turnBasedEvents               = EventListScr_Ruin2_Turn,
    .characterBasedEvents          = EventListScr_Ruin2_Character,
    .locationBasedEvents           = EventListScr_Ruin2_Location,
    .miscBasedEvents               = EventListScr_Ruin2_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ruin2_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ruin2_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ruin2_UnitMove,
    .tutorialEvents                = EventListScr_Ruin2_Tutorial,

    .traps            = TrapData_Event_089EDCF9,
    .extraTrapsInHard = TrapData_Event_089EDEEA,

    .playerUnitsInNormal = UnitDef_088CD534,
    .playerUnitsInHard   = UnitDef_088CD534,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ruins2_BeginingScene,
    .endingSceneEvents    = EventScr_Ruin2_EndingScene,
};
