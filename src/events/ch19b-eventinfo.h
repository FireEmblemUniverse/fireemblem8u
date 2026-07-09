#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch19b_Turn[] = {
    TurnEventPlayer(EVFLAG_WIN, EventScr_Ch19b_EndingScene, 14)
    TurnEventPlayer(0, EventScr_Ch19B_1, 6)
    TurnEventPlayer_(0, EventScr_Ch19B_2, 6, 2)
    TurnEventPlayer_(0, EventScr_Ch19B_3, 3, 5)
    TurnEventPlayer_(0, EventScr_Ch19B_4, 4, 5)
    TurnEventPlayer_(0, EventScr_Ch19B_5, 8, 5)
    TurnEventPlayer_(0, EventScr_Ch19B_6, 9, 5)
    TurnEventPlayer_(0, EventScr_Ch19B_7, 3, 7)
    TurnEventPlayer_(0, EventScr_Ch19B_8, 2, 7)
    OpeningTurnEvent(EventScr_Ch19B_0)
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
    SecretShop(ShopList_Ch19B_0, 26, 7)
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

    .traps            = TrapData_Event_Ch19B_0,
    .extraTrapsInHard = TrapData_Event_Ch19B_1,

    .playerUnitsInNormal = UnitDef_Ch19BAlly,
    .playerUnitsInHard   = UnitDef_Ch19BAlly,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch19b_BeginningScene,
    .endingSceneEvents    = EventScr_Ch19b_EndingScene,
};
