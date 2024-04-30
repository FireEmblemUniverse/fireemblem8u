#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch13b_Turn[] = {
    TurnEventPlayer_(0, EventScr_089FBE08, 7, 2)
    TurnEventPlayer_(0, EventScr_089FBE20, 3, 2)
    TurnEventPlayer_(0, EventScr_089FBE38, 3, 3)
    TurnEventPlayer_(0, EventScr_089FBE50, 3, 4)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch13b_Character[] = {
    CHAR(EVFLAG_TMP(9), EventScr_089FBD2C, CHARACTER_EPHRAIM, CHARACTER_GERIK)
    CHAR(EVFLAG_TMP(9), EventScr_089FBD2C, CHARACTER_GERIK, CHARACTER_EPHRAIM)
    CHAR(EVFLAG_TMP(10), EventScr_089FBD50, CHARACTER_GERIK, CHARACTER_MARISA)
    CHAR(EVFLAG_TMP(10), EventScr_089FBD50, CHARACTER_MARISA, CHARACTER_GERIK)
    CHAR(EVFLAG_TMP(11), EventScr_089FBD70, CHARACTER_TETHYS, CHARACTER_EWAN)
    CHAR(EVFLAG_TMP(11), EventScr_089FBD70, CHARACTER_EWAN, CHARACTER_TETHYS)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch13b_Location[] = {
    Village(0, EventScr_089FBD90, 4, 18)
    Village(0, EventScr_089FBDCC, 17, 13)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch13b_Misc[] = {
    DefeatAll(EventScr_Ch13b_EndingScene)
    AFEV(EVFLAG_TMP(12), EventScr_089FBE68, 2)
    AREA(EVFLAG_TMP(7), EventScr_089FBC8C, 9, 13, 11, 14)
    AREA(EVFLAG_TMP(7), EventScr_089FBC8C, 8, 10, 12, 12)
    AREA(EVFLAG_TMP(8), EventScr_089FBCDC, 9, 13, 11, 14)
    AREA(EVFLAG_TMP(8), EventScr_089FBCDC, 8, 10, 12, 12)
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

    .traps            = TrapData_Event_089EDB75,
    .extraTrapsInHard = TrapData_Event_089EDED4,

    .playerUnitsInNormal = UnitDef_088C4EB4,
    .playerUnitsInHard   = UnitDef_088C4EB4,

    .playerUnitsChoice1InEncounter = UnitDef_088C55D0,
    .playerUnitsChoice2InEncounter = UnitDef_088C58DC,
    .playerUnitsChoice3InEncounter = UnitDef_088C5BE8,

    .enemyUnitsChoice1InEncounter = UnitDef_088C5698,
    .enemyUnitsChoice2InEncounter = UnitDef_088C59A4,
    .enemyUnitsChoice3InEncounter = UnitDef_088C5CB0,

    .beginningSceneEvents = EventScr_Ch13b_BeginingScene,
    .endingSceneEvents    = EventScr_Ch13b_EndingScene,
};
