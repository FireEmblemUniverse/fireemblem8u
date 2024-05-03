#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch10b_Turn[] = {
    TurnEventPlayer(EVFLAG_WIN, EventScr_Ch10b_EndingScene, 11)
    TurnEventPlayer_(0, EventScr_089FB01C, 3, 6)
    TurnEventPlayer(0, EventScr_089FB034, 4)
    TurnEventPlayer(0, EventScr_089FB05C, 6)
    TurnEventEnemy(0, EventScr_089FAAC4, 1)
    TurnEventEnemy(0, EventScr_089FAB7C, 2)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch10b_Character[] = {
    CHAR(EVFLAG_TMP(7), EventScr_089FAEDC, CHARACTER_EPHRAIM, CHARACTER_DUESSEL)
    CHAR(EVFLAG_TMP(8), EventScr_089FAF04, CHARACTER_DUESSEL, CHARACTER_CORMAG)
    CHAR(EVFLAG_TMP(8), EventScr_089FAF2C, CHARACTER_TANA, CHARACTER_CORMAG)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch10b_Location[] = {
    Village(EVFLAG_TMP(10), EventScr_089FAF54, 9, 2)
    Armory(ShopList_Event_089ED8CA, 9, 14)
    Vendor(ShopList_Event_089ED8E2, 8, 14)
    House(0, EventScr_089FAFF4, 5, 1)
    House(0, EventScr_089FAFCC, 6, 0)
    Village(EVFLAG_TMP(11), EventScr_089FAF90, 4, 12)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch10b_Misc[] = {
    DefeatBoss(EventScr_Ch10b_EndingScene)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch10b_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch10b_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch10b_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch10b_Tutorial[] = {
    END_MAIN
};

// 0x89EA4A8
CONST_DATA struct ChapterEventGroup Ch10EphraimEvents = {
    .turnBasedEvents               = EventListScr_Ch10b_Turn,
    .characterBasedEvents          = EventListScr_Ch10b_Character,
    .locationBasedEvents           = EventListScr_Ch10b_Location,
    .miscBasedEvents               = EventListScr_Ch10b_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch10b_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch10b_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch10b_UnitMove,
    .tutorialEvents                = EventListScr_Ch10b_Tutorial,

    .traps            = TrapData_Event_089EDB70,
    .extraTrapsInHard = TrapData_Event_089EDECF,

    .playerUnitsInNormal = UnitDef_088C2C54,
    .playerUnitsInHard   = UnitDef_088C2C54,

    .playerUnitsChoice1InEncounter = UnitDef_088C344C,
    .playerUnitsChoice2InEncounter = UnitDef_088C36F4,
    .playerUnitsChoice3InEncounter = UnitDef_088C399C,

    .enemyUnitsChoice1InEncounter = UnitDef_088C3514,
    .enemyUnitsChoice2InEncounter = UnitDef_088C37BC,
    .enemyUnitsChoice3InEncounter = UnitDef_088C3A64,

    .beginningSceneEvents = EventScr_Ch10b_BeginingScene,
    .endingSceneEvents    = EventScr_Ch10b_EndingScene,
};
