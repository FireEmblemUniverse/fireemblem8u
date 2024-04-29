#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch14a_Turn[] = {
    TurnEventPlayer_(0, EventScr_089F6238, 5, 4)
    TurnEventPlayer_(0, EventScr_089F6250, 6, 3)
    TurnEventPlayer_(EVFLAG_TMP(14), EventScr_089F62BC, 1, 255)
    TurnEventEnemy(0, EventScr_089F5CC4, 1)
    TurnEventPlayer_(EVFLAG_TMP(12), EventScr_089F6284, 1, 255)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch14a_Character[] = {
    CHAR(EVFLAG_TMP(8), EventScr_089F619C, CHARACTER_LARACHEL, CHARACTER_RENNAC)
    CHAR(EVFLAG_TMP(8), EventScr_089F61C4, CHARACTER_EIRIKA, CHARACTER_RENNAC)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch14a_Location[] = {
    Seize(9, 5)
    Door(17, 19)
    Door(10, 14)
    Door(2, 19)
    Door(22, 17)
    Door(22, 8)
    Door(18, 2)
    Door(17, 2)
    Door(9, 24)
    Chest(ITEM_STAFF_REPAIR, 22, 3)
    Chest(ITEM_LANCE_DRAGON, 8, 20)
    Chest(ITEM_LANCE_SPEAR, 22, 5)
    SecretShop(ShopList_Event_089ED83E, 4, 4)
    Chest(ITEM_BOOSTER_POW, 10, 20)
    Chest(ITEM_GUIDINGRING, 18, 16)
    ChestMoney(10000, 2, 16)
    Door(20, 1)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch14a_Misc[] = {
    AREA(EVFLAG_TMP(10), EventScr_089F62F0, 3, 9, 19, 11)
    AREA(EVFLAG_TMP(13), EventScr_089F629C, 0, 0, 5, 7)
    AREA(EVFLAG_TMP(11), EventScr_089F6268, 0, 19, 13, 24)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch14a_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch14a_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch14a_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch14a_Tutorial[] = {
    END_MAIN
};

CONST_DATA struct ChapterEventGroup Ch14EirikaEvents = {
    .turnBasedEvents               = EventListScr_Ch14a_Turn,
    .characterBasedEvents          = EventListScr_Ch14a_Character,
    .locationBasedEvents           = EventListScr_Ch14a_Location,
    .miscBasedEvents               = EventListScr_Ch14a_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch14a_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch14a_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch14a_UnitMove,
    .tutorialEvents                = EventListScr_Ch14a_Tutorial,

    .traps            = TrapData_Event_Ch14a,
    .extraTrapsInHard = TrapData_Event_Ch14aHard,

    .playerUnitsInNormal = UnitDef_Event_Ch14aAlly,
    .playerUnitsInHard   = UnitDef_Event_Ch14aAlly,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch14a_BeginingScene,
    .endingSceneEvents    = EventScr_Ch14a_EndingScene,
};
