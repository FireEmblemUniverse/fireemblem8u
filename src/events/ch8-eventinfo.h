#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch8_Turn[] = {
    TURN(0, EventScr_089F3124, 2, 2, FACTION_BLUE)
    TURN(EVFLAG_TMP(12), EventScr_089F3250, 1, 255, FACTION_BLUE)
    TURN(0, EventScr_089F3268, 5, 0, FACTION_BLUE)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch8_Character[] = {
    CharacterEventBothWays(EVFLAG_TMP(7),  EventScr_089F31B8, CHARACTER_EIRIKA, CHARACTER_EPHRAIM)
    CharacterEventBothWays(EVFLAG_TMP(8),  EventScr_089F31D4, CHARACTER_EPHRAIM, CHARACTER_SETH)
    CharacterEventBothWays(EVFLAG_TMP(9),  EventScr_089F31F4, CHARACTER_SETH, CHARACTER_KYLE)
    CharacterEventBothWays(EVFLAG_TMP(10), EventScr_089F3214, CHARACTER_FRANZ, CHARACTER_FORDE)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch8_Location[] = {
    Door_(20, 7)
    Door_(1, 5)
    Chest(ITEM_SWORD_SILVER, 1, 3)
    Chest(ITEM_ELYSIANWHIP, 2, 3)
    Seize(10, 2)
    Chest(ITEM_BOOSTER_HP, 19, 4)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch8_Misc[] = {
    AREA(EVFLAG_TMP(11), EventScr_Ch8_MiscThiefRainforce, 5, 0, 15, 10)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch8_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch8_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch8_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch8_Tutorial[] = {
    END_MAIN
};

CONST_DATA struct ChapterEventGroup Ch8EventData = {
    .turnBasedEvents               = EventListScr_Ch8_Turn,
    .characterBasedEvents          = EventListScr_Ch8_Character,
    .locationBasedEvents           = EventListScr_Ch8_Location,
    .miscBasedEvents               = EventListScr_Ch8_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch8_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch8_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch8_UnitMove,
    .tutorialEvents                = EventListScr_Ch8_Tutorial,

    .traps            = TrapData_Event_Ch8,
    .extraTrapsInHard = TrapData_Event_Ch8Hard,

    .playerUnitsInNormal = UnitDef_Event_Ch8Ally,
    .playerUnitsInHard   = UnitDef_Event_Ch8Ally,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch8_BeginingScene,
    .endingSceneEvents    = EventScr_Ch8_EndingScene,
};
