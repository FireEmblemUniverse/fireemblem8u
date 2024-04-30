#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch9b_Turn[] = {
    TurnEventPlayer_(EVFLAG_TMP(12), EventScr_089FA734, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(16), EventScr_089FA778, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(14), EventScr_089FA7EC, 1, 255)
    TurnEventPlayer_(EVFLAG_TMP(18), EventScr_089FA6E0, 1, 255)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch9b_Character[] = {
    CHAR(EVFLAG_TMP(7), EventScr_089FA634, CHARACTER_EPHRAIM, CHARACTER_AMELIA)
    CHAR(EVFLAG_TMP(7), EventScr_089FA65C, CHARACTER_FRANZ, CHARACTER_AMELIA)
    CharacterEventBothWays(EVFLAG_TMP(8), EventScr_089FA690, CHARACTER_EPHRAIM, CHARACTER_TANA)
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
    AFEV(EVFLAG_TMP(15), EventScr_089FA768, 17)
    AREA(EVFLAG_TMP(13), EventScr_089FA7AC, 6, 3, 24, 4)
    AREA(EVFLAG_TMP(11), EventScr_089FA714, 7, 17, 17, 20)
    AREA(EVFLAG_TMP(10), EventScr_089FA6B4, 3, 10, 7, 16)
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

    .traps            = TrapData_Event_089EDB6D,
    .extraTrapsInHard = TrapData_Event_089EDECC,

    .playerUnitsInNormal = UnitDef_088C22C8,
    .playerUnitsInHard   = UnitDef_088C22C8,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch9b_BeginingScene,
    .endingSceneEvents    = EventScr_Ch9b_EndingScene,
};
