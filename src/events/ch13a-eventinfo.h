#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch13a_Turn[] = {
    TurnEventPlayer(EVFLAG_WIN, EventScr_Ch13a_EndingScene, 12) /* I think this can also set as "Survive" */
    TurnEventPlayer(0, EventScr_089F5A48, 9)
    TurnEventPlayer_(0, EventScr_089F5A90, 5, 5)
    TurnEventPlayer(0, EventScr_089F5AD4, 2)
    TurnEventPlayer_(0, EventScr_089F5AEC, 3, 3)
    TurnEventPlayer(0, EventScr_089F5B04, 5)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch13a_Character[] = {
    CHAR(EVFLAG_TMP(7), EventScr_089F59CC, CHARACTER_EIRIKA, CHARACTER_AMELIA)
    CHAR(EVFLAG_TMP(7), EventScr_089F59F8, CHARACTER_FRANZ, CHARACTER_AMELIA)
    CHAR(EVFLAG_TMP(8), EventScr_089F5A20, CHARACTER_EIRIKA, CHARACTER_CORMAG)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch13a_Location[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch13a_Misc[] = {
    DefeatBoss(EventScr_Ch13a_EndingScene)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch13a_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch13a_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch13a_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch13a_Tutorial[] = {
    END_MAIN
};

CONST_DATA struct ChapterEventGroup Ch13EirikaEvents = {
    .turnBasedEvents               = EventListScr_Ch13a_Turn,
    .characterBasedEvents          = EventListScr_Ch13a_Character,
    .locationBasedEvents           = EventListScr_Ch13a_Location,
    .miscBasedEvents               = EventListScr_Ch13a_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch13a_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch13a_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch13a_UnitMove,
    .tutorialEvents                = EventListScr_Ch13a_Tutorial,

    .traps            = TrapData_Event_Ch13a,
    .extraTrapsInHard = TrapData_Event_Ch13aHard,

    .playerUnitsInNormal = UnitDef_Event_Ch13aAlly,
    .playerUnitsInHard   = UnitDef_Event_Ch13aAlly,

    .playerUnitsChoice1InEncounter = UnitDef_088BB118,
    .playerUnitsChoice2InEncounter = UnitDef_088BB3D4,
    .playerUnitsChoice3InEncounter = UnitDef_088BB690,

    .enemyUnitsChoice1InEncounter = UnitDef_088BB1E0,
    .enemyUnitsChoice2InEncounter = UnitDef_088BB49C,
    .enemyUnitsChoice3InEncounter = UnitDef_088BB758,

    .beginningSceneEvents = EventScr_Ch13a_BeginingScene,
    .endingSceneEvents    = EventScr_Ch13a_EndingScene,
};
