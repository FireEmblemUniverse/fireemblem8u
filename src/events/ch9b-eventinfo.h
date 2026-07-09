#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch9b_Turn[] = {
    TurnEventPlayer_(EVFLAG_TMP(12), EventScr_Ch9B_6, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(16), EventScr_Ch9B_8, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(14), EventScr_Ch9B_10, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(18), EventScr_Ch9B_4, 1, 255)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch9b_Character[] = {
    CHAR(EVFLAG_TMP(7), EventScr_Ch9B_0, CHARACTER_EPHRAIM, CHARACTER_AMELIA)
    CHAR(EVFLAG_TMP(7), EventScr_Ch9B_1, CHARACTER_FRANZ, CHARACTER_AMELIA)
    CharacterEventBothWays(EVFLAG_TMP(8), EventScr_Ch9B_2, CHARACTER_EPHRAIM, CHARACTER_TANA)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch9b_Location[] = {
    Door(12, 17, EVFLAG_TMP(17))
    Seize(22, 7)
    Chest(ITEM_STAFF_RESTORE, 7, 1)
    ChestMoney(2500, 18, 1)
    Door_(12, 3)
    Door(13, 17, EVFLAG_TMP(17))
    Door(12, 18, EVFLAG_TMP(17))
    Door(13, 18, EVFLAG_TMP(17))
    Chest(ITEM_OCEANSEAL, 23, 1)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch9b_Misc[] = {
    AFEV(EVFLAG_TMP(15), EventScr_Ch9B_7, 17)
    AREA(EVFLAG_TMP(13), EventScr_Ch9B_9, 6, 3, 24, 4)
    AREA(EVFLAG_TMP(11), EventScr_Ch9B_5, 7, 17, 17, 20)
    AREA(EVFLAG_TMP(10), EventScr_Ch9B_3, 3, 10, 7, 16)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch9b_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch9b_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch9b_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch9b_Tutorial[] = {
    END_MAIN
};

// 0x89EA348
CONST_DATA struct ChapterEventGroup Ch9Events = {
    .turnBasedEvents               = EventListScr_Ch9b_Turn,
    .characterBasedEvents          = EventListScr_Ch9b_Character,
    .locationBasedEvents           = EventListScr_Ch9b_Location,
    .miscBasedEvents               = EventListScr_Ch9b_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch9b_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch9b_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch9b_UnitMove,
    .tutorialEvents                = EventListScr_Ch9b_Tutorial,

    .traps            = TrapData_Event_Ch9B_0,
    .extraTrapsInHard = TrapData_Event_Ch9B_1,

    .playerUnitsInNormal = UnitDef_Ch9BAlly,
    .playerUnitsInHard   = UnitDef_Ch9BAlly,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch9b_BeginningScene,
    .endingSceneEvents    = EventScr_Ch9b_EndingScene,
};
