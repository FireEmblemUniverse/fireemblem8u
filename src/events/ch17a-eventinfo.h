#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch17a_Turn[] = {
    TurnEventPlayer_(EVFLAG_TMP(14), EventScr_089F7DA4, 1, 255)
    TurnEventPlayer(0, EventScr_089F7D24, 4)
    TurnEventPlayer(0, EventScr_089F7D24, 6)
    TurnEventPlayer(0, EventScr_089F7D24, 8)
    TurnEventPlayer(0, EventScr_089F7D54, 4)
    TurnEventPlayer(0, EventScr_089F7D54, 6)
    TurnEventPlayer(0, EventScr_089F7D54, 8)
    TurnEventPlayer(0, EventScr_089F7D6C, 10)
    TurnEventPlayer(0, EventScr_089F7D6C, 12)
    TurnEventPlayer(0, EventScr_089F7D3C, 3)
    TurnEventPlayer(0, EventScr_089F7D3C, 5)
    TurnEventPlayer(0, EventScr_089F7D3C, 7)
    TurnEventPlayer(0, EventScr_089F7D3C, 9)
    TurnEventPlayer(0, EventScr_089F7D3C, 11)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch17a_Character[] = {
    CHAR(EVFLAG_TMP(9), EventScr_089F7CD4, CHARACTER_TANA, CHARACTER_SYRENE)
    CHAR(EVFLAG_TMP(9), EventScr_089F7CAC, CHARACTER_INNES, CHARACTER_SYRENE)
    CHAR(EVFLAG_TMP(9), EventScr_089F7CFC, CHARACTER_VANESSA, CHARACTER_SYRENE)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch17a_Location[] = {
    Vendor(ShopList_Event_089ED87A, 1, 20)
    Armory(ShopList_Event_089ED894, 12, 2)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch17a_Misc[] = {
    DefeatBoss(EventScr_089F79C4)
    AREA(EVFLAG_TMP(13), EventScr_089F7D84, 17, 0, 22, 9)
    AREA(EVFLAG_TMP(15), EventScr_089F7DD8, 9, 0, 16, 8)
    AREA(EVFLAG_TMP(15), EventScr_089F7DD8, 15, 10, 19, 16)
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

    .traps            = TrapData_Event_089EDA03,
    .extraTrapsInHard = TrapData_Event_089EDEC4,

    .playerUnitsInNormal = UnitDef_088BDE58,
    .playerUnitsInHard   = UnitDef_088BDE58,

    .playerUnitsChoice1InEncounter = UnitDef_088BE5B0,
    .playerUnitsChoice2InEncounter = UnitDef_088BE8D0,
    .playerUnitsChoice3InEncounter = UnitDef_088BEBF0,

    .enemyUnitsChoice1InEncounter = UnitDef_088BE678,
    .enemyUnitsChoice2InEncounter = UnitDef_088BE998,
    .enemyUnitsChoice3InEncounter = UnitDef_088BECB8,

    .beginningSceneEvents = EventScr_Ch17a_BeginingScene,
    .endingSceneEvents    = EventScr_089F79C4,
};
