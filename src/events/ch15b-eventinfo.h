#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch15b_Turn[] = {
    TurnEventPlayer_(0, EventScr_Ch15B_8, 3, 3)
    TurnEventPlayer_(0, EventScr_Ch15B_9, 4, 2)
    TurnEventPlayer_(0, EventScr_Ch15B_10, 8, 2)
    TurnEventPlayer(0, EventScr_Ch15B_11, 8)
    TurnEventPlayer_(0, EventScr_Ch15B_12, 4, 3)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch15b_Character[] = {
    CHAR(EVFLAG_TMP(13), EventScr_Ch15B_3, CHARACTER_EPHRAIM, CHARACTER_EIRIKA)
    CHAR(EVFLAG_TMP(13), EventScr_Ch15B_3, CHARACTER_EIRIKA, CHARACTER_EPHRAIM)
    CHAR(EVFLAG_TMP(14), EventScr_Ch15B_4, CHARACTER_EIRIKA, CHARACTER_SETH)
    CHAR(EVFLAG_TMP(14), EventScr_Ch15B_4, CHARACTER_SETH, CHARACTER_EIRIKA)
    CHAR(EVFLAG_TMP(15), EventScr_Ch15B_5, CHARACTER_EIRIKA, CHARACTER_TANA)
    CHAR(EVFLAG_TMP(15), EventScr_Ch15B_5, CHARACTER_TANA, CHARACTER_EIRIKA)
    CHAR(EVFLAG_TMP(16), EventScr_Ch15B_6, CHARACTER_INNES, CHARACTER_TANA)
    CHAR(EVFLAG_TMP(16), EventScr_Ch15B_6, CHARACTER_TANA, CHARACTER_INNES)
    CHAR(EVFLAG_TMP(17), EventScr_Ch15B_7, CHARACTER_SALEH, CHARACTER_EWAN)
    CHAR(EVFLAG_TMP(17), EventScr_Ch15B_7, CHARACTER_EWAN, CHARACTER_SALEH)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch15b_Location[] = {
    Village(0, EventScr_Ch15B_0, 1, 14)
    Vendor(ShopList_Ch15B_0, 8, 4)
    House(0, EventScr_Ch15B_1, 17, 6)
    House(0, EventScr_Ch15B_2, 5, 13)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch15b_Misc[] = {
    DefeatAll(EventScr_Ch15b_EndingScene)
    AREA(EVFLAG_TMP(20), EventScr_Ch15B_16, 20, 7, 23, 10)
    AREA(EVFLAG_TMP(21), EventScr_Ch15B_17, 0, 0, 2, 2)
    AREA(EVFLAG_TMP(24), EventScr_Ch15B_20, 18, 0, 22, 2)
    AREA(EVFLAG_TMP(23), EventScr_Ch15B_19, 0, 9, 1, 11)
    AREA(EVFLAG_TMP(18), EventScr_Ch15B_14, 5, 9, 9, 12)
    AREA(EVFLAG_TMP(26), EventScr_Ch15B_21, 8, 14, 10, 15)
    AREA(EVFLAG_TMP(19), EventScr_Ch15B_15, 14, 11, 18, 13)
    AREA(EVFLAG_TMP(22), EventScr_Ch15B_18, 22, 15, 23, 21)
    AREA(EVFLAG_TMP(25), EventScr_Ch15B_13, 11, 17, 14, 21)
    AREA(EVFLAG_TMP(25), EventScr_Ch15B_13, 15, 14, 21, 21)
    AREA(EVFLAG_TMP(27), EventScr_Ch15B_22, 0, 4, 0, 7)
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

    .traps            = TrapData_Event_Ch15B_0,
    .extraTrapsInHard = TrapData_Event_Ch15B_1,

    .playerUnitsInNormal = UnitDef_Ch15BAlly_0,
    .playerUnitsInHard   = UnitDef_Ch15BAlly_0,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch15b_BeginningScene,
    .endingSceneEvents    = EventScr_Ch15b_EndingScene,
};
