#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Unk3B_Turn[] = {
    TurnEventPlayer(0, EventScr_Ruin_52, 0)
    OpeningTurnEvent(EventScr_Ruin_52)
    TurnEventPlayer(0, EventScr_Ruin_52, 2)
    TurnEventPlayer(0, EventScr_Ruin_52, 3)
    TurnEventPlayer(0, EventScr_Ruin_52, 4)
    TurnEventPlayer(0, EventScr_Ruin_52, 5)
    TurnEventPlayer(0, EventScr_Ruin_52, 6)
    TurnEventPlayer(0, EventScr_Ruin_52, 7)
    TurnEventPlayer(0, EventScr_Ruin_52, 8)
    TurnEventPlayer(0, EventScr_Ruin_52, 9)
    TurnEventPlayer(0, EventScr_Ruin_52, 10)
    TurnEventPlayer(0, EventScr_Ruin_52, 11)
    TurnEventPlayer(0, EventScr_Ruin_52, 12)
    TurnEventPlayer(0, EventScr_Ruin_52, 13)
    TurnEventPlayer(0, EventScr_Ruin_52, 14)
    TurnEventPlayer(0, EventScr_Ruin_52, 15)
    TurnEventPlayer(0, EventScr_Ruin_52, 16)
    TurnEventPlayer(0, EventScr_Ruin_52, 17)
    TurnEventPlayer(0, EventScr_Ruin_52, 18)
    TurnEventPlayer(0, EventScr_Ruin_52, 19)
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

    .traps            = TrapData_Event_Chunk3B_0,
    .extraTrapsInHard = TrapData_Event_Chunk3B_1,

    .playerUnitsInNormal = UnitDef_MelkaenCoastMixed,
    .playerUnitsInHard   = UnitDef_MelkaenCoastMixed,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_UnkCh3B_BeginningScene,
    .endingSceneEvents    = EventScr_UnkCh3B_EndingScene,
};
