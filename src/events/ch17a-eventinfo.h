#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch17a_Turn[] = {
    TurnEventPlayer_(EVFLAG_TMP(14), EventScr_Ch17A_7, 1, 255)
    TurnEventPlayer(0, EventScr_Ch17A_2, 4)
    TurnEventPlayer(0, EventScr_Ch17A_2, 6)
    TurnEventPlayer(0, EventScr_Ch17A_2, 8)
    TurnEventPlayer(0, EventScr_Ch17A_4, 4)
    TurnEventPlayer(0, EventScr_Ch17A_4, 6)
    TurnEventPlayer(0, EventScr_Ch17A_4, 8)
    TurnEventPlayer(0, EventScr_Ch17A_5, 10)
    TurnEventPlayer(0, EventScr_Ch17A_5, 12)
    TurnEventPlayer(0, EventScr_Ch17A_3, 3)
    TurnEventPlayer(0, EventScr_Ch17A_3, 5)
    TurnEventPlayer(0, EventScr_Ch17A_3, 7)
    TurnEventPlayer(0, EventScr_Ch17A_3, 9)
    TurnEventPlayer(0, EventScr_Ch17A_3, 11)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch17a_Character[] = {
    CHAR(EVFLAG_TMP(9), EventScr_Ch17A_12, CHARACTER_TANA, CHARACTER_SYRENE)
    CHAR(EVFLAG_TMP(9), EventScr_Ch17A_11, CHARACTER_INNES, CHARACTER_SYRENE)
    CHAR(EVFLAG_TMP(9), EventScr_Ch17A_13, CHARACTER_VANESSA, CHARACTER_SYRENE)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch17a_Location[] = {
    Vendor(ShopList_Ch17A_0, 1, 20)
    Armory(ShopList_Ch17A_1, 12, 2)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch17a_Misc[] = {
    DefeatBoss(EventScr_Ch17A_1)
    AREA(EVFLAG_TMP(13), EventScr_Ch17A_6, 17, 0, 22, 9)
    AREA(EVFLAG_TMP(15), EventScr_Ch17A_8, 9, 0, 16, 8)
    AREA(EVFLAG_TMP(15), EventScr_Ch17A_8, 15, 10, 19, 16)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch17a_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch17a_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch17a_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch17a_Tutorial[] = {
    END_MAIN
};

CONST_DATA struct ChapterEventGroup Ch17EirikaEvents = {
    .turnBasedEvents               = EventListScr_Ch17a_Turn,
    .characterBasedEvents          = EventListScr_Ch17a_Character,
    .locationBasedEvents           = EventListScr_Ch17a_Location,
    .miscBasedEvents               = EventListScr_Ch17a_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch17a_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch17a_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch17a_UnitMove,
    .tutorialEvents                = EventListScr_Ch17a_Tutorial,

    .traps            = TrapData_Event_Ch17A_0,
    .extraTrapsInHard = TrapData_Event_Ch17A_1,

    .playerUnitsInNormal = UnitDef_Ch17AAlly_0,
    .playerUnitsInHard   = UnitDef_Ch17AAlly_0,

    .playerUnitsChoice1InEncounter = UnitDef_Ch17AAlly_3,
    .playerUnitsChoice2InEncounter = UnitDef_Ch17AAlly_4,
    .playerUnitsChoice3InEncounter = UnitDef_Ch17AAlly_5,

    .enemyUnitsChoice1InEncounter = UnitDef_Ch17AEnemy_6,
    .enemyUnitsChoice2InEncounter = UnitDef_Ch17AEnemy_7,
    .enemyUnitsChoice3InEncounter = UnitDef_Ch17AEnemy_8,

    .beginningSceneEvents = EventScr_Ch17a_BeginningScene,
    .endingSceneEvents    = EventScr_Ch17A_1,
};
