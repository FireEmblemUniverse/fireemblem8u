#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch14b_Turn[] = {
    TurnEventPlayer(0, EventScr_089FC5A0, 2)
    TurnEventPlayer(0, EventScr_089FC5C0, 2)
    TurnEventPlayer(0, EventScr_089FC5E8, 3)
    TurnEventPlayer(0, EventScr_089FC610, 4)
    TurnEventPlayer_(0, EventScr_089FC638, 7, 3)
    TurnEventPlayer_(EVFLAG_TMP(13), EventScr_089FC690, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(16), EventScr_089FC6FC, 1, 255)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch14b_Character[] = {
    CHAR(EVFLAG_TMP(9), EventScr_089FC520, CHARACTER_LARACHEL, CHARACTER_RENNAC)
    CHAR(EVFLAG_TMP(9), EventScr_089FC52C, CHARACTER_EPHRAIM, CHARACTER_RENNAC)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch14b_Location[] = {
    Seize(14, 2)
    Door(13, 7, EVFLAG_TMP(14))
    Door(13, 20, EVFLAG_TMP(11))
    Chest(ITEM_GUIDINGRING, 13, 18)
    Door_(6, 12)
    Door_(7, 12)
    Door_(8, 12)
    Door_(6, 13)
    Door_(7, 13)
    Door_(8, 13)
    Door_(20, 12)
    Door_(21, 12)
    Door_(22, 12)
    Door_(22, 13)
    Door_(21, 13)
    Door_(20, 13)
    Chest(ITEM_STAFF_REPAIR, 15, 18)
    SecretShop(ShopList_Event_089ED912, 4, 15)
    Chest(ITEM_LANCE_SPEAR, 27, 1)
    Chest(ITEM_BOOSTER_HP, 3, 1)
    ChestMoney(10000, 14, 18)
    Door(14, 20, EVFLAG_TMP(11))
    Door(15, 20, EVFLAG_TMP(11))
    Door(15, 21, EVFLAG_TMP(11))
    Door(14, 21, EVFLAG_TMP(11))
    Door(13, 21, EVFLAG_TMP(11))
    Door(14, 7, EVFLAG_TMP(14))
    Door(15, 7, EVFLAG_TMP(14))
    Door(13, 8, EVFLAG_TMP(14))
    Door(14, 8, EVFLAG_TMP(14))
    Door(15, 8, EVFLAG_TMP(14))
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch14b_Misc[] = {
    AFEV(EVFLAG_TMP(12), EventScr_089FC660, 11)
    AFEV(EVFLAG_TMP(15), EventScr_089FC6EC, 14)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch14b_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch14b_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch14b_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch14b_Tutorial[] = {
    END_MAIN
};

// 0x89EAACC
CONST_DATA struct ChapterEventGroup Ch14EphraimEventData = {
    .turnBasedEvents               = EventListScr_Ch14b_Turn,
    .characterBasedEvents          = EventListScr_Ch14b_Character,
    .locationBasedEvents           = EventListScr_Ch14b_Location,
    .miscBasedEvents               = EventListScr_Ch14b_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch14b_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch14b_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch14b_UnitMove,
    .tutorialEvents                = EventListScr_Ch14b_Tutorial,

    .traps            = TrapData_Event_089EDB76,
    .extraTrapsInHard = TrapData_Event_089EDED5,

    .playerUnitsInNormal = UnitDef_088C5FBC,
    .playerUnitsInHard   = UnitDef_088C5FBC,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch14b_BeginingScene,
    .endingSceneEvents    = EventScr_Ch14b_EndingScene,
};
