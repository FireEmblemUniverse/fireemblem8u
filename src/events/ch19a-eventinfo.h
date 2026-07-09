#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch19a_Turn[] = {
    TurnEventPlayer(EVFLAG_WIN, EventScr_Ch19A_1, 14)
    TurnEventPlayer(0, EventScr_Ch19A_2, 6)
    TurnEventPlayer_(0, EventScr_Ch19A_3, 6, 2)
    TurnEventPlayer_(0, EventScr_Ch19A_4, 3, 5)
    TurnEventPlayer_(0, EventScr_Ch19A_5, 4, 5)
    TurnEventPlayer_(0, EventScr_Ch19A_6, 8, 5)
    TurnEventPlayer_(0, EventScr_Ch19A_7, 9, 5)
    TurnEventPlayer_(0, EventScr_Ch19A_8, 3, 7)
    TurnEventPlayer_(0, EventScr_Ch19A_9, 2, 7)
    OpeningTurnEvent(EventScr_Ch19A_0)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch19a_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch19a_Location[] = {
    Chest(ITEM_SWORD_RUNESWORD, 2, 11)
    Chest(ITEM_DARK_FENRIR, 4, 11)
    Chest(ITEM_STAFF_FORTIFY, 27, 10)
    ChestMoney(5000, 27, 12)
    Door_(3, 15)
    SecretShop(ShopList_Ch19A_0, 26, 7)
    Chest(ITEM_BOOSTER_SPD, 3, 12)
    Chest(ITEM_ANIMA_BOLTING, 27, 14)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch19a_Misc[] = {
    DefeatBoss(EventScr_Ch19A_1)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch19a_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch19a_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch19a_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch19a_Tutorial[] = {
    END_MAIN
};

// 0x89E9F08
CONST_DATA struct ChapterEventGroup Ch19EirikaEvents = {
    .turnBasedEvents               = EventListScr_Ch19a_Turn,
    .characterBasedEvents          = EventListScr_Ch19a_Character,
    .locationBasedEvents           = EventListScr_Ch19a_Location,
    .miscBasedEvents               = EventListScr_Ch19a_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch19a_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch19a_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch19a_UnitMove,
    .tutorialEvents                = EventListScr_Ch19a_Tutorial,

    .traps            = TrapData_Event_Ch19A_0,
    .extraTrapsInHard = TrapData_Event_Ch19A_1,

    .playerUnitsInNormal = UnitDef_Ch19AAlly_0,
    .playerUnitsInHard   = UnitDef_Ch19AAlly_0,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch19a_BeginningScene,
    .endingSceneEvents    = EventScr_Ch19A_1,
};
