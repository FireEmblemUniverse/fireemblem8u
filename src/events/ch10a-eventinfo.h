#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch10a_Turn[] = {
    TurnEventEnemy(0, EventScr_Ch10A_0, 1)
    TurnEventPlayer_(0, EventScr_Ch10A_12, 2, 4)
    TurnEventPlayer_(EVFLAG_TMP(13), EventScr_Ch10A_8, 1, 255)
    TurnEventEnemy_(EVFLAG_TMP(14), EventScr_Ch10A_14, 1, 255)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch10a_Character[] = {
    CHAR(EVFLAG_TMP(8), EventScr_Ch10A_1, CHARACTER_EIRIKA, CHARACTER_INNES)
    CHAR(EVFLAG_TMP(8), EventScr_Ch10A_2, CHARACTER_TANA, CHARACTER_INNES)
    CHAR(EVFLAG_TMP(9), EventScr_Ch10A_3, CHARACTER_INNES, CHARACTER_GERIK)
    CHAR(EVFLAG_TMP(9), EventScr_Ch10A_4, CHARACTER_TETHYS, CHARACTER_GERIK)
    CHAR(EVFLAG_TMP(10), EventScr_Ch10A_5, CHARACTER_INNES, CHARACTER_TETHYS)
    CHAR(EVFLAG_TMP(10), EventScr_Ch10A_6, CHARACTER_GERIK, CHARACTER_TETHYS)
    CHAR(EVFLAG_TMP(11), EventScr_Ch10A_7, CHARACTER_GERIK, CHARACTER_MARISA)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch10a_Location[] = {
    Door_(10, 9)
    Door_(11, 9)
    Seize(15, 1)
    House(0, EventScr_Ch10A_9, 11, 6)
    House(0, EventScr_Ch10A_10, 10, 7)
    House(0, EventScr_Ch10A_11, 13, 8)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch10a_Misc[] = {
    AREA(EVFLAG_TMP(7), EventScr_Ch10A_13, 0, 19, 19, 30)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch10a_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch10a_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch10a_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch10a_Tutorial[] = {
    END_MAIN
};

CONST_DATA struct ChapterEventGroup Ch10EirikaEvents = {
    .turnBasedEvents               = EventListScr_Ch10a_Turn,
    .characterBasedEvents          = EventListScr_Ch10a_Character,
    .locationBasedEvents           = EventListScr_Ch10a_Location,
    .miscBasedEvents               = EventListScr_Ch10a_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch10a_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch10a_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch10a_UnitMove,
    .tutorialEvents                = EventListScr_Ch10a_Tutorial,

    .traps            = TrapData_Event_ch10a,
    .extraTrapsInHard = TrapData_Event_ch10aHard,

    .playerUnitsInNormal = UnitDef_Event_Ch10aAlly,
    .playerUnitsInHard   = UnitDef_Event_Ch10aAlly,

    .playerUnitsChoice1InEncounter = UnitDef_Ch10AAlly_2,
    .playerUnitsChoice2InEncounter = UnitDef_Ch10AAlly_3,
    .playerUnitsChoice3InEncounter = UnitDef_Ch10AAlly_4,

    .enemyUnitsChoice1InEncounter = UnitDef_Ch10AEnemy_7,
    .enemyUnitsChoice2InEncounter = UnitDef_Ch10AEnemy_8,
    .enemyUnitsChoice3InEncounter = UnitDef_Ch10AEnemy_9,

    .beginningSceneEvents = EventScr_Ch10a_BeginningScene,
    .endingSceneEvents    = EventScr_Ch10a_EndingScene,
};
