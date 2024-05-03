#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch15b_Turn[] = {
    TurnEventPlayer_(0, EventScr_089FCA34, 3, 3)
    TurnEventPlayer_(0, EventScr_089FCA4C, 4, 2)
    TurnEventPlayer_(0, EventScr_089FCA64, 8, 2)
    TurnEventPlayer(0, EventScr_089FCA7C, 8)
    TurnEventPlayer_(0, EventScr_089FCA94, 4, 3)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch15b_Character[] = {
    CHAR(EVFLAG_TMP(13), EventScr_089FC990, CHARACTER_EPHRAIM, CHARACTER_EIRIKA)
    CHAR(EVFLAG_TMP(13), EventScr_089FC990, CHARACTER_EIRIKA, CHARACTER_EPHRAIM)
    CHAR(EVFLAG_TMP(14), EventScr_089FC9B4, CHARACTER_EIRIKA, CHARACTER_SETH)
    CHAR(EVFLAG_TMP(14), EventScr_089FC9B4, CHARACTER_SETH, CHARACTER_EIRIKA)
    CHAR(EVFLAG_TMP(15), EventScr_089FC9D4, CHARACTER_EIRIKA, CHARACTER_TANA)
    CHAR(EVFLAG_TMP(15), EventScr_089FC9D4, CHARACTER_TANA, CHARACTER_EIRIKA)
    CHAR(EVFLAG_TMP(16), EventScr_089FC9F4, CHARACTER_INNES, CHARACTER_TANA)
    CHAR(EVFLAG_TMP(16), EventScr_089FC9F4, CHARACTER_TANA, CHARACTER_INNES)
    CHAR(EVFLAG_TMP(17), EventScr_089FCA14, CHARACTER_SALEH, CHARACTER_EWAN)
    CHAR(EVFLAG_TMP(17), EventScr_089FCA14, CHARACTER_EWAN, CHARACTER_SALEH)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch15b_Location[] = {
    Village(0, EventScr_089FC904, 1, 14)
    Vendor(ShopList_Event_089ED934, 8, 4)
    House(0, EventScr_089FC940, 17, 6)
    House(0, EventScr_089FC968, 5, 13)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch15b_Misc[] = {
    DefeatAll(EventScr_Ch15b_EndingScene)
    AREA(EVFLAG_TMP(20), EventScr_089FCB64, 20, 7, 23, 10)
    AREA(EVFLAG_TMP(21), EventScr_089FCBA8, 0, 0, 2, 2)
    AREA(EVFLAG_TMP(24), EventScr_089FCC74, 18, 0, 22, 2)
    AREA(EVFLAG_TMP(23), EventScr_089FCC30, 0, 9, 1, 11)
    AREA(EVFLAG_TMP(18), EventScr_089FCADC, 5, 9, 9, 12)
    AREA(EVFLAG_TMP(26), EventScr_089FCCB8, 8, 14, 10, 15)
    AREA(EVFLAG_TMP(19), EventScr_089FCB20, 14, 11, 18, 13)
    AREA(EVFLAG_TMP(22), EventScr_089FCBEC, 22, 15, 23, 21)
    AREA(EVFLAG_TMP(25), EventScr_089FCAAC, 11, 17, 14, 21)
    AREA(EVFLAG_TMP(25), EventScr_089FCAAC, 15, 14, 21, 21)
    AREA(EVFLAG_TMP(27), EventScr_089FCCFC, 0, 4, 0, 7)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch15b_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch15b_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch15b_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch15b_Tutorial[] = {
    END_MAIN
};

// 0x89EACF0
CONST_DATA struct ChapterEventGroup Ch15EphraimEventData = {
    .turnBasedEvents               = EventListScr_Ch15b_Turn,
    .characterBasedEvents          = EventListScr_Ch15b_Character,
    .locationBasedEvents           = EventListScr_Ch15b_Location,
    .miscBasedEvents               = EventListScr_Ch15b_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch15b_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch15b_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch15b_UnitMove,
    .tutorialEvents                = EventListScr_Ch15b_Tutorial,

    .traps            = TrapData_Event_089EDB7A,
    .extraTrapsInHard = TrapData_Event_089EDED9,

    .playerUnitsInNormal = UnitDef_088C6E14,
    .playerUnitsInHard   = UnitDef_088C6E14,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch15b_BeginingScene,
    .endingSceneEvents    = EventScr_Ch15b_EndingScene,
};
