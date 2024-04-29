#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch15a_Turn[] = {
    TurnEventPlayer_(0, EventScr_089F6718, 3, 3)
    TurnEventPlayer_(0, EventScr_089F6730, 4, 2)
    TurnEventPlayer_(0, EventScr_089F6748, 8, 2)
    TurnEventEnemy(0, EventScr_089F6404, 2)
    TurnEventPlayer(0, EventScr_089F6770, 8)
    TurnEventPlayer_(0, EventScr_089F6788, 4, 3)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch15a_Character[] = {
    CharacterEventBothWays(EVFLAG_TMP(13), EventScr_089F6654, CHARACTER_EIRIKA, CHARACTER_EPHRAIM)
    CharacterEventBothWays(EVFLAG_TMP(14), EventScr_089F6678, CHARACTER_EPHRAIM, CHARACTER_SETH)
    CharacterEventBothWays(EVFLAG_TMP(15), EventScr_089F6698, CHARACTER_EPHRAIM, CHARACTER_FORDE)
    CharacterEventBothWays(EVFLAG_TMP(16), EventScr_089F66B8, CHARACTER_EPHRAIM, CHARACTER_KYLE)
    CharacterEventBothWays(EVFLAG_TMP(17), EventScr_089F66D8, CHARACTER_EPHRAIM, CHARACTER_INNES)
    CharacterEventBothWays(EVFLAG_TMP(18), EventScr_089F66F8, CHARACTER_DUESSEL, CHARACTER_CORMAG)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch15a_Location[] = {
    Village(0, EventScr_089F65C8, 1, 14)
    Vendor(ShopList_Event_089ED860, 8, 4)
    House(0, EventScr_089F6604, 17, 6)
    House(0, EventScr_089F662C, 5, 13)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch15a_Misc[] = {
    DefeatAll(EventScr_089F6470)
    AREA(EVFLAG_TMP(21), EventScr_089F6858, 20, 7, 23, 10)
    AREA(EVFLAG_TMP(22), EventScr_089F689C, 0, 0, 2, 2)
    AREA(EVFLAG_TMP(25), EventScr_089F6968, 18, 0, 22, 2)
    AREA(EVFLAG_TMP(24), EventScr_089F6924, 0, 9, 1, 11)
    AREA(EVFLAG_TMP(19), EventScr_089F67D0, 5, 9, 9, 12)
    AREA(EVFLAG_TMP(27), EventScr_089F69AC, 8, 14, 10, 15)
    AREA(EVFLAG_TMP(20), EventScr_089F6814, 14, 11, 18, 13)
    AREA(EVFLAG_TMP(23), EventScr_089F68E0, 22, 15, 23, 21)
    AREA(EVFLAG_TMP(26), EventScr_089F67A0, 11, 17, 14, 21)
    AREA(EVFLAG_TMP(26), EventScr_089F67A0, 15, 14, 21, 21)
    AREA(EVFLAG_TMP(28), EventScr_089F69F0, 0, 4, 0, 7)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch15a_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch15a_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch15a_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch15a_Tutorial[] = {
    END_MAIN
};

CONST_DATA struct ChapterEventGroup Ch15EirikaEvents = {
    .turnBasedEvents               = EventListScr_Ch15a_Turn,
    .characterBasedEvents          = EventListScr_Ch15a_Character,
    .locationBasedEvents           = EventListScr_Ch15a_Location,
    .miscBasedEvents               = EventListScr_Ch15a_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch15a_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch15a_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch15a_UnitMove,
    .tutorialEvents                = EventListScr_Ch15a_Tutorial,

    .traps            = TrapData_Event_089ED9FC,
    .extraTrapsInHard = TrapData_Event_089EDEBD,

    .playerUnitsInNormal = UnitDef_088BC610,
    .playerUnitsInHard   = UnitDef_088BC610,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch15a_BeginingScene,
    .endingSceneEvents    = EventScr_089F6470,
};
