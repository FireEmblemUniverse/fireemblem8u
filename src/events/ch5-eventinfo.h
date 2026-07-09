#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch5_Turn[] = {
    TurnEventPlayer(0, EventScr_Ch5_5, 2)
    TurnEventPlayer(0, EventScr_Ch5_6, 6)
    TurnEventPlayer(0, EventScr_Ch5_7, 8)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch5_Character[] = {
    CHAR(EVFLAG_TMP(7), EventScr_Ch5_4, CHARACTER_NATASHA, CHARACTER_JOSHUA)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch5_Location[] = {
    Armory(ShopList_Event_Ch5Armory, 2, 1)
    Vendor(ShopList_Event_Ch5Vendor, 6, 10)
    Village(EVFLAG_TMP(8),  EventScr_Ch5_0, 12, 10)
    Village(EVFLAG_TMP(9),  EventScr_Ch5_1, 12, 19)
    Village(EVFLAG_TMP(10), EventScr_Ch5_2, 5, 6)
    Village(EVFLAG_TMP(11), EventScr_Ch5_3, 5, 1)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch5_Misc[] = {
    DefeatBoss(EventScr_Ch5_EndingScene)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch5_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch5_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch5_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch5_Tutorial[] = {
    END_MAIN
};

CONST_DATA struct ChapterEventGroup Ch5EventData = {
    .turnBasedEvents               = EventListScr_Ch5_Turn,
    .characterBasedEvents          = EventListScr_Ch5_Character,
    .locationBasedEvents           = EventListScr_Ch5_Location,
    .miscBasedEvents               = EventListScr_Ch5_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch5_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch5_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch5_UnitMove,
    .tutorialEvents                = EventListScr_Ch5_Tutorial,

    .traps            = TrapData_Event_Ch5,
    .extraTrapsInHard = TrapData_Event_Ch5Hard,

    .playerUnitsInNormal = UnitDef_Event_Ch5Ally,
    .playerUnitsInHard   = UnitDef_Event_Ch5Ally,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch5_BeginningScene,
    .endingSceneEvents    = EventScr_Ch5_EndingScene,
};
