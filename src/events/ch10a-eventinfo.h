#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch10a_Turn[] = {
    TurnEventEnemy(0, EventScr_089F43A0, 1)
    TurnEventPlayer_(0, EventScr_089F4820, 2, 4)
    TurnEventPlayer_(EVFLAG_TMP(13), EventScr_089F4750, 1, 255)
    TurnEventEnemy_(EVFLAG_TMP(14), EventScr_089F48CC, 1, 255)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch10a_Character[] = {
    CHAR(EVFLAG_TMP(8), EventScr_089F4634, CHARACTER_EIRIKA, CHARACTER_INNES)
    CHAR(EVFLAG_TMP(8), EventScr_089F465C, CHARACTER_TANA, CHARACTER_INNES)
    CHAR(EVFLAG_TMP(9), EventScr_089F4684, CHARACTER_INNES, CHARACTER_GERIK)
    CHAR(EVFLAG_TMP(9), EventScr_089F46AC, CHARACTER_TETHYS, CHARACTER_GERIK)
    CHAR(EVFLAG_TMP(10), EventScr_089F46D4, CHARACTER_INNES, CHARACTER_TETHYS)
    CHAR(EVFLAG_TMP(10), EventScr_089F46FC, CHARACTER_GERIK, CHARACTER_TETHYS)
    CHAR(EVFLAG_TMP(11), EventScr_089F4724, CHARACTER_GERIK, CHARACTER_MARISA)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch10a_Location[] = {
    Door_(10, 9)
    Door_(11, 9)
    Seize(15, 1)
    House(0, EventScr_089F47A8, 11, 6)
    House(0, EventScr_089F47D0, 10, 7)
    House(0, EventScr_089F47F8, 13, 8)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch10a_Misc[] = {
    AREA(EVFLAG_TMP(7), EventScr_089F4838, 0, 19, 19, 30)
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

    .playerUnitsChoice1InEncounter = UnitDef_088B8CAC,
    .playerUnitsChoice2InEncounter = UnitDef_088B8FCC,
    .playerUnitsChoice3InEncounter = UnitDef_088B92EC,

    .enemyUnitsChoice1InEncounter = UnitDef_088B8D74,
    .enemyUnitsChoice2InEncounter = UnitDef_088B9094,
    .enemyUnitsChoice3InEncounter = UnitDef_088B93B4,

    .beginningSceneEvents = EventScr_Ch10a_BeginingScene,
    .endingSceneEvents    = EventScr_Ch10a_EndingScene,
};
