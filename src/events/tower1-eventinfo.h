#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Tower1_Turn[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower1_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower1_Location[] = {
    Armory(ShopList_Event_089ED99E, 0, 17) // ?
    Vendor(ShopList_Event_089ED9A2, 1, 17) // ?
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower1_Misc[] = {
    AFEV(0, EventScr_Tower1_EndingScene, EVFLAG_DEFEAT_ALL)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower1_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower1_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower1_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Tower1_Tutorial[] = {
    END_MAIN
};

// 0x89EB574
CONST_DATA struct ChapterEventGroup TowerOfValni1Events = {
    .turnBasedEvents               = EventListScr_Tower1_Turn,
    .characterBasedEvents          = EventListScr_Tower1_Character,
    .locationBasedEvents           = EventListScr_Tower1_Location,
    .miscBasedEvents               = EventListScr_Tower1_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Tower1_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Tower1_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Tower1_UnitMove,
    .tutorialEvents                = EventListScr_Tower1_Tutorial,

    .traps            = TrapData_Event_089EDCE4,
    .extraTrapsInHard = TrapData_Event_089EDEE1,

    .playerUnitsInNormal = UnitDef_088CB6C8,
    .playerUnitsInHard   = UnitDef_088CB6C8,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Tower1_BeginingScene,
    .endingSceneEvents    = EventScr_Tower1_EndingScene,
};
