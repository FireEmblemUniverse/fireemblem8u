#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Unk3B_Turn[] = {
    TurnEventPlayer(0, EventScr_089FF474, 0)
    OpeningTurnEvent(EventScr_089FF474)
    TurnEventPlayer(0, EventScr_089FF474, 2)
    TurnEventPlayer(0, EventScr_089FF474, 3)
    TurnEventPlayer(0, EventScr_089FF474, 4)
    TurnEventPlayer(0, EventScr_089FF474, 5)
    TurnEventPlayer(0, EventScr_089FF474, 6)
    TurnEventPlayer(0, EventScr_089FF474, 7)
    TurnEventPlayer(0, EventScr_089FF474, 8)
    TurnEventPlayer(0, EventScr_089FF474, 9)
    TurnEventPlayer(0, EventScr_089FF474, 10)
    TurnEventPlayer(0, EventScr_089FF474, 11)
    TurnEventPlayer(0, EventScr_089FF474, 12)
    TurnEventPlayer(0, EventScr_089FF474, 13)
    TurnEventPlayer(0, EventScr_089FF474, 14)
    TurnEventPlayer(0, EventScr_089FF474, 15)
    TurnEventPlayer(0, EventScr_089FF474, 16)
    TurnEventPlayer(0, EventScr_089FF474, 17)
    TurnEventPlayer(0, EventScr_089FF474, 18)
    TurnEventPlayer(0, EventScr_089FF474, 19)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Unk3B_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Unk3B_Location[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Unk3B_Misc[] = {
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Unk3B_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Unk3B_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Unk3B_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Unk3B_Tutorial[] = {
    END_MAIN
};

// 0x89EC5A8
CONST_DATA struct ChapterEventGroup AnInterestingMapEvents = {
    .turnBasedEvents               = EventListScr_Unk3B_Turn,
    .characterBasedEvents          = EventListScr_Unk3B_Character,
    .locationBasedEvents           = EventListScr_Unk3B_Location,
    .miscBasedEvents               = EventListScr_Unk3B_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Unk3B_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Unk3B_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Unk3B_UnitMove,
    .tutorialEvents                = EventListScr_Unk3B_Tutorial,

    .traps            = TrapData_Event_089EDE78,
    .extraTrapsInHard = TrapData_Event_089EDF6D,

    .playerUnitsInNormal = UnitDef_088D0F5C,
    .playerUnitsInHard   = UnitDef_088D0F5C,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_UnkCh3B_BeginingScene,
    .endingSceneEvents    = EventScr_UnkCh3B_EndingScene,
};
