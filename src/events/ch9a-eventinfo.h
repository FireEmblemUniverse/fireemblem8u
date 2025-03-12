#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch9a_Turn[] = {
    TURN(0, EventScr_089F4184, 5, 0, FACTION_BLUE)
    TURN(0, EventScr_089F40D0, 3, 0, FACTION_BLUE)
    TURN(0, EventScr_089F40E8, 4, 0, FACTION_BLUE)
    TURN(0, EventScr_089F40B8, 2, 0, FACTION_BLUE)
    TURN(0, EventScr_089F4118, 3, 0, FACTION_BLUE)
    TURN(0, EventScr_089F4100, 4, 0, FACTION_BLUE)
    TURN(0, EventScr_089F4130, 5, 0, FACTION_BLUE)
    TURN(0, EventScr_089F4148, 5, 0, FACTION_BLUE)
    TURN(0, EventScr_089F4018, 12, 0, FACTION_BLUE)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch9a_Character[] = {
    CHAR(EVFLAG_TMP(7), EventScr_089F3F4C, CHARACTER_EIRIKA, CHARACTER_AMELIA)
    CHAR(EVFLAG_TMP(7), EventScr_089F3F74, CHARACTER_FRANZ, CHARACTER_AMELIA)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch9a_Location[] = {
    Vendor(ShopList_Event_Ch9aVendor, 1, 2)
    Village(EVFLAG_TMP(8), EventScr_089F3F9C, 1, 11)
    Village(EVFLAG_TMP(9), EventScr_089F3FDC, 11, 15)
    Armory(ShopList_Event_Ch9aArmory, 1, 5)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch9a_Misc[] = {
    DefeatAll(EventScr_Ch9a_EndingScene)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch9a_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch9a_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch9a_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch9a_Tutorial[] = {
    END_MAIN
};

CONST_DATA struct ChapterEventGroup Ch9EirikaEvents = {
    .turnBasedEvents               = EventListScr_Ch9a_Turn,
    .characterBasedEvents          = EventListScr_Ch9a_Character,
    .locationBasedEvents           = EventListScr_Ch9a_Location,
    .miscBasedEvents               = EventListScr_Ch9a_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch9a_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch9a_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch9a_UnitMove,
    .tutorialEvents                = EventListScr_Ch9a_Tutorial,

    .traps            = TrapData_Event_Ch9a,
    .extraTrapsInHard = TrapData_Event_Ch9aHard,

    .playerUnitsInNormal = UnitDef_Event_Ch9aAlly,
    .playerUnitsInHard   = UnitDef_Event_Ch9aAlly,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch9a_BeginingScene,
    .endingSceneEvents    = EventScr_Ch9a_EndingScene,
};
