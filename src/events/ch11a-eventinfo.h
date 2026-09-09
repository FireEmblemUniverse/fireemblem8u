#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch11a_Turn[] = {
    TurnEventPlayer(0, EventScr_Ch11A_2, 9)
    TurnEventPlayer_(0, EventScr_Ch11A_6, 4, 2)
    TurnEventPlayer(0, EventScr_Ch11A_7, 8)
    TurnEventPlayer(0, EventScr_Ch11A_8, 12)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch11a_Character[] = {
    CHAR(EVFLAG_TMP(10), EventScr_Ch11A_0, CHARACTER_EIRIKA, CHARACTER_LARACHEL)
    CHAR(EVFLAG_TMP(11), EventScr_Ch11A_1, CHARACTER_LARACHEL, CHARACTER_DOZLA)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch11a_Location[] = {
    Chest(ITEM_STAFF_RESTORE, 3, 8)
    Chest(ITEM_LANCE_SHORTSPEAR, 12, 11)
    Chest(ITEM_BOOSTER_SKL, 17, 5)
    Door_(4, 11)
    Door_(17, 13)
    Door_(18, 13)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch11a_Misc[] = {
    DefeatAll(EventScr_Ch11a_EndingScene)
    AREA(EVFLAG_TMP(7), EventScr_Ch11A_3, 14, 2, 21, 10)
    AREA(EVFLAG_TMP(8), EventScr_Ch11A_4, 12, 11, 21, 17)
    AREA(EVFLAG_TMP(9), EventScr_Ch11A_5, 1, 6, 5, 10)
    AREA(EVFLAG_TMP(9), EventScr_Ch11A_5, 6, 8, 8, 12)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch11a_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch11a_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch11a_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch11a_Tutorial[] = {
    END_MAIN
};

CONST_DATA struct ChapterEventGroup Ch11EirikaEvents = {
    .turnBasedEvents               = EventListScr_Ch11a_Turn,
    .characterBasedEvents          = EventListScr_Ch11a_Character,
    .locationBasedEvents           = EventListScr_Ch11a_Location,
    .miscBasedEvents               = EventListScr_Ch11a_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch11a_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch11a_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch11a_UnitMove,
    .tutorialEvents                = EventListScr_Ch11a_Tutorial,

    .traps            = TrapData_Event_Ch11a,
    .extraTrapsInHard = TrapData_Event_Ch11aHard,

    .playerUnitsInNormal = UnitDef_Event_Ch11aAlly,
    .playerUnitsInHard   = UnitDef_Event_Ch11aAlly,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch11a_BeginningScene,
    .endingSceneEvents    = EventScr_Ch11a_EndingScene,
};
