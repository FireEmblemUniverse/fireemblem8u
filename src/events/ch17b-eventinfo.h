#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch17b_Turn[] = {
    TurnEventPlayer_(EVFLAG_TMP(14), EventScr_Ch17B_8, 1, 255)
    TurnEventPlayer(0, EventScr_Ch17B_3, 4)
    TurnEventPlayer(0, EventScr_Ch17B_3, 6)
    TurnEventPlayer(0, EventScr_Ch17B_3, 8)
    TurnEventPlayer(0, EventScr_Ch17B_5, 4)
    TurnEventPlayer(0, EventScr_Ch17B_5, 6)
    TurnEventPlayer(0, EventScr_Ch17B_5, 8)
    TurnEventPlayer(0, EventScr_Ch17B_6, 10)
    TurnEventPlayer(0, EventScr_Ch17B_6, 12)
    TurnEventPlayer(0, EventScr_Ch17B_4, 3)
    TurnEventPlayer(0, EventScr_Ch17B_4, 5)
    TurnEventPlayer(0, EventScr_Ch17B_4, 7)
    TurnEventPlayer(0, EventScr_Ch17B_4, 9)
    TurnEventPlayer(0, EventScr_Ch17B_4, 11)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch17b_Character[] = {
    CHAR(EVFLAG_TMP(9), EventScr_Ch17B_1, CHARACTER_TANA, CHARACTER_SYRENE)
    CHAR(EVFLAG_TMP(9), EventScr_Ch17B_0, CHARACTER_INNES, CHARACTER_SYRENE)
    CHAR(EVFLAG_TMP(9), EventScr_Ch17B_2, CHARACTER_VANESSA, CHARACTER_SYRENE)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch17b_Location[] = {
    Vendor(ShopList_Ch17B_0, 1, 20)
    Armory(ShopList_Ch17B_1, 12, 2)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch17b_Misc[] = {
    DefeatBoss(EventScr_Ch17b_EndingScene)
    AREA(EVFLAG_TMP(13), EventScr_Ch17B_7, 17, 0, 22, 9)
    AREA(EVFLAG_TMP(15), EventScr_Ch17B_9, 9, 0, 16, 8)
    AREA(EVFLAG_TMP(15), EventScr_Ch17B_9, 15, 10, 19, 16)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch17b_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch17b_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch17b_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch17b_Tutorial[] = {
    END_MAIN
};

// 0x89EAFC8
CONST_DATA struct ChapterEventGroup Ch17EphraimEventData = {
    .turnBasedEvents               = EventListScr_Ch17b_Turn,
    .characterBasedEvents          = EventListScr_Ch17b_Character,
    .locationBasedEvents           = EventListScr_Ch17b_Location,
    .miscBasedEvents               = EventListScr_Ch17b_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch17b_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch17b_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch17b_UnitMove,
    .tutorialEvents                = EventListScr_Ch17b_Tutorial,

    .traps            = TrapData_Event_Ch17B_0,
    .extraTrapsInHard = TrapData_Event_Ch17B_1,

    .playerUnitsInNormal = UnitDef_Ch17BAlly_0,
    .playerUnitsInHard   = UnitDef_Ch17BAlly_0,

    .playerUnitsChoice1InEncounter = UnitDef_Ch17BAlly_1,
    .playerUnitsChoice2InEncounter = UnitDef_Ch17BAlly_2,
    .playerUnitsChoice3InEncounter = UnitDef_Ch17BAlly_3,

    .enemyUnitsChoice1InEncounter = UnitDef_Ch17BEnemy_6,
    .enemyUnitsChoice2InEncounter = UnitDef_Ch17BEnemy_7,
    .enemyUnitsChoice3InEncounter = UnitDef_Ch17BEnemy_8,

    .beginningSceneEvents = EventScr_Ch17b_BeginningScene,
    .endingSceneEvents    = EventScr_Ch17b_EndingScene,
};
