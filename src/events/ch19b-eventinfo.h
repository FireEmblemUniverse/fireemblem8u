#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch19b_Turn[] = {
    TurnEventPlayer(EVFLAG_WIN, EventScr_Ch19b_EndingScene, 14)
    TurnEventPlayer(0, EventScr_089FD3EC, 6)
    TurnEventPlayer_(0, EventScr_089FD404, 6, 2)
    TurnEventPlayer_(0, EventScr_089FD41C, 3, 5)
    TurnEventPlayer_(0, EventScr_089FD450, 4, 5)
    TurnEventPlayer_(0, EventScr_089FD484, 8, 5)
    TurnEventPlayer_(0, EventScr_089FD4B8, 9, 5)
    TurnEventPlayer_(0, EventScr_089FD4EC, 3, 7)
    TurnEventPlayer_(0, EventScr_089FD504, 2, 7)
    OpeningTurnEvent(EventScr_089FD3A8)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch19b_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch19b_Location[] = {
    Chest(ITEM_SWORD_RUNESWORD, 2, 11)
    Chest(ITEM_DARK_FENRIR, 4, 11)
    Chest(ITEM_STAFF_FORTIFY, 27, 10)
    ChestMoney(5000, 27, 12)
    Door_(3, 15)
    SecretShop(ShopList_Event_089ED98C, 26, 7)
    Chest(ITEM_BOOSTER_SPD, 3, 12)
    Chest(ITEM_ANIMA_BOLTING, 27, 14)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch19b_Misc[] = {
    DefeatBoss(EventScr_Ch19b_EndingScene)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch19b_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch19b_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch19b_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch19b_Tutorial[] = {
    END_MAIN
};

// 0x89EB21C
CONST_DATA struct ChapterEventGroup Ch19EphraimEventData = {
    .turnBasedEvents               = EventListScr_Ch19b_Turn,
    .characterBasedEvents          = EventListScr_Ch19b_Character,
    .locationBasedEvents           = EventListScr_Ch19b_Location,
    .miscBasedEvents               = EventListScr_Ch19b_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch19b_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch19b_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch19b_UnitMove,
    .tutorialEvents                = EventListScr_Ch19b_Tutorial,

    .traps            = TrapData_Event_089EDCE0,
    .extraTrapsInHard = TrapData_Event_089EDEDD,

    .playerUnitsInNormal = UnitDef_088C9CB0,
    .playerUnitsInHard   = UnitDef_088C9CB0,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch19b_BeginingScene,
    .endingSceneEvents    = EventScr_Ch19b_EndingScene,
};
