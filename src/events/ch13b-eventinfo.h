#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch13b_Turn[] = {
    TurnEventPlayer_(0, EventScr_Ch13B_7, 7, 2)
    TurnEventPlayer_(0, EventScr_Ch13B_8, 3, 2)
    TurnEventPlayer_(0, EventScr_Ch13B_9, 3, 3)
    TurnEventPlayer_(0, EventScr_Ch13B_10, 3, 4)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch13b_Character[] = {
    CHAR(EVFLAG_TMP(9), EventScr_Ch13B_2, CHARACTER_EPHRAIM, CHARACTER_GERIK)
    CHAR(EVFLAG_TMP(9), EventScr_Ch13B_2, CHARACTER_GERIK, CHARACTER_EPHRAIM)
    CHAR(EVFLAG_TMP(10), EventScr_Ch13B_3, CHARACTER_GERIK, CHARACTER_MARISA)
    CHAR(EVFLAG_TMP(10), EventScr_Ch13B_3, CHARACTER_MARISA, CHARACTER_GERIK)
    CHAR(EVFLAG_TMP(11), EventScr_Ch13B_4, CHARACTER_TETHYS, CHARACTER_EWAN)
    CHAR(EVFLAG_TMP(11), EventScr_Ch13B_4, CHARACTER_EWAN, CHARACTER_TETHYS)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch13b_Location[] = {
    Village(0, EventScr_Ch13B_5, 4, 18)
    Village(0, EventScr_Ch13B_6, 17, 13)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch13b_Misc[] = {
    DefeatAll(EventScr_Ch13b_EndingScene)
    AFEV(EVFLAG_TMP(12), EventScr_Ch13B_11, 2)
    AREA(EVFLAG_TMP(7), EventScr_Ch13B_0, 9, 13, 11, 14)
    AREA(EVFLAG_TMP(7), EventScr_Ch13B_0, 8, 10, 12, 12)
    AREA(EVFLAG_TMP(8), EventScr_Ch13B_1, 9, 13, 11, 14)
    AREA(EVFLAG_TMP(8), EventScr_Ch13B_1, 8, 10, 12, 12)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch13b_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch13b_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch13b_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch13b_Tutorial[] = {
    END_MAIN
};

// 0x89EA850
CONST_DATA struct ChapterEventGroup Ch13EphraimEventData = {
    .turnBasedEvents               = EventListScr_Ch13b_Turn,
    .characterBasedEvents          = EventListScr_Ch13b_Character,
    .locationBasedEvents           = EventListScr_Ch13b_Location,
    .miscBasedEvents               = EventListScr_Ch13b_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch13b_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch13b_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch13b_UnitMove,
    .tutorialEvents                = EventListScr_Ch13b_Tutorial,

    .traps            = TrapData_Event_Ch13B_0,
    .extraTrapsInHard = TrapData_Event_Ch13B_1,

    .playerUnitsInNormal = UnitDef_Ch13BAlly_0,
    .playerUnitsInHard   = UnitDef_Ch13BAlly_0,

    .playerUnitsChoice1InEncounter = UnitDef_Ch13BAlly_7,
    .playerUnitsChoice2InEncounter = UnitDef_Ch13BAlly_8,
    .playerUnitsChoice3InEncounter = UnitDef_Ch13BAlly_9,

    .enemyUnitsChoice1InEncounter = UnitDef_Ch13BEnemy_7,
    .enemyUnitsChoice2InEncounter = UnitDef_Ch13BEnemy_8,
    .enemyUnitsChoice3InEncounter = UnitDef_Ch13BEnemy_9,

    .beginningSceneEvents = EventScr_Ch13b_BeginningScene,
    .endingSceneEvents    = EventScr_Ch13b_EndingScene,
};
