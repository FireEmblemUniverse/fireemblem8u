#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch10b_Turn[] = {
    TurnEventPlayer(EVFLAG_WIN, EventScr_Ch10b_EndingScene, 11)
    TurnEventPlayer_(0, EventScr_Ch10B_10, 3, 6)
    TurnEventPlayer(0, EventScr_Ch10B_11, 4)
    TurnEventPlayer(0, EventScr_Ch10B_12, 6)
    TurnEventEnemy(0, EventScr_Ch10B_0, 1)
    TurnEventEnemy(0, EventScr_Ch10B_1, 2)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch10b_Character[] = {
    CHAR(EVFLAG_TMP(7), EventScr_Ch10B_3, CHARACTER_EPHRAIM, CHARACTER_DUESSEL)
    CHAR(EVFLAG_TMP(8), EventScr_Ch10B_4, CHARACTER_DUESSEL, CHARACTER_CORMAG)
    CHAR(EVFLAG_TMP(8), EventScr_Ch10B_5, CHARACTER_TANA, CHARACTER_CORMAG)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch10b_Location[] = {
    Village(EVFLAG_TMP(10), EventScr_Ch10B_6, 9, 2)
    Armory(ShopList_Ch10B_0, 9, 14)
    Vendor(ShopList_Ch10B_1, 8, 14)
    House(0, EventScr_Ch10B_9, 5, 1)
    House(0, EventScr_Ch10B_8, 6, 0)
    Village(EVFLAG_TMP(11), EventScr_Ch10B_7, 4, 12)
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

    .traps            = TrapData_Event_Ch10B_0,
    .extraTrapsInHard = TrapData_Event_Ch10B_1,

    .playerUnitsInNormal = UnitDef_Ch10BAlly_0,
    .playerUnitsInHard   = UnitDef_Ch10BAlly_0,

    .playerUnitsChoice1InEncounter = UnitDef_Ch10BAlly_6,
    .playerUnitsChoice2InEncounter = UnitDef_Ch10BAlly_7,
    .playerUnitsChoice3InEncounter = UnitDef_Ch10BAlly_8,

    .enemyUnitsChoice1InEncounter = UnitDef_Ch10BEnemy_12,
    .enemyUnitsChoice2InEncounter = UnitDef_Ch10BEnemy_13,
    .enemyUnitsChoice3InEncounter = UnitDef_Ch10BEnemy_14,

    .beginningSceneEvents = EventScr_Ch10b_BeginningScene,
    .endingSceneEvents    = EventScr_Ch10b_EndingScene,
};
