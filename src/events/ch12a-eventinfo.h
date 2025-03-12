#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch12a_Turn[] = {
    TurnEventPlayer_(EVFLAG_TMP(7), EventScr_089F54A0, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(8), EventScr_089F54E4, 1, 255)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch12a_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch12a_Location[] = {
    House(0, EventScr_089F536C, 6, 10)
    House(0, EventScr_089F53AC, 5, 12)
    Vendor(ShopList_Event_089ED826, 17, 6)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch12a_Misc[] = {
    DefeatAll(EventScr_Ch12a_EndingScene)
    AREA(EVFLAG_TMP(9), EventScr_089F5484, 8, 0, 19, 9)
    AREA(EVFLAG_TMP(10), EventScr_089F54C8, 0, 10, 19, 15)
    AREA(EVFLAG_TMP(10), EventScr_089F54C8, 0, 0, 7, 9)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch12a_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch12a_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch12a_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch12a_Tutorial[] = {
    END_MAIN
};

CONST_DATA struct ChapterEventGroup Ch12EirikaEventData = {
    .turnBasedEvents               = EventListScr_Ch12a_Turn,
    .characterBasedEvents          = EventListScr_Ch12a_Character,
    .locationBasedEvents           = EventListScr_Ch12a_Location,
    .miscBasedEvents               = EventListScr_Ch12a_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch12a_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch12a_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch12a_UnitMove,
    .tutorialEvents                = EventListScr_Ch12a_Tutorial,

    .traps            = TrapData_Event_Ch12a,
    .extraTrapsInHard = TrapData_Event_Ch12aHard,

    .playerUnitsInNormal = UnitDef_Event_Ch12aAlly,
    .playerUnitsInHard   = UnitDef_Event_Ch12aAlly,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch12a_BeginingScene,
    .endingSceneEvents    = EventScr_Ch12a_EndingScene,
};
