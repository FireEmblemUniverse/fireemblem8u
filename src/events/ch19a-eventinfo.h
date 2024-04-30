#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch19a_Turn[] = {
    TurnEventPlayer(EVFLAG_WIN, EventScr_089F8678, 14)
    TurnEventPlayer(0, EventScr_089F893C, 6)
    TurnEventPlayer_(0, EventScr_089F8954, 6, 2)
    TurnEventPlayer_(0, EventScr_089F896C, 3, 5)
    TurnEventPlayer_(0, EventScr_089F89A0, 4, 5)
    TurnEventPlayer_(0, EventScr_089F89D4, 8, 5)
    TurnEventPlayer_(0, EventScr_089F8A08, 9, 5)
    TurnEventPlayer_(0, EventScr_089F8A3C, 3, 7)
    TurnEventPlayer_(0, EventScr_089F8A54, 2, 7)
    OpeningTurnEvent(EventScr_089F8644)
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
    Door(3, 15)
    SecretShop(ShopList_Event_089ED8B8, 26, 7)
    Chest(ITEM_BOOSTER_SPD, 3, 12)
    Chest(ITEM_ANIMA_BOLTING, 27, 14)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch19a_Misc[] = {
    DefeatBoss(EventScr_089F8678)
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

    .traps            = TrapData_Event_089EDB67,
    .extraTrapsInHard = TrapData_Event_089EDEC6,

    .playerUnitsInNormal = UnitDef_088C0290,
    .playerUnitsInHard   = UnitDef_088C0290,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch19a_BeginingScene,
    .endingSceneEvents    = EventScr_089F8678,
};
