#include "gbafe.h"

CONST_DATA EventListScr EventListScr_Ch17b_Turn[] = {
    TurnEventPlayer_(EVFLAG_TMP(14), EventScr_089FCF90, 1, 255)
    TurnEventPlayer(0, EventScr_089FCF10, 4)
    TurnEventPlayer(0, EventScr_089FCF10, 6)
    TurnEventPlayer(0, EventScr_089FCF10, 8)
    TurnEventPlayer(0, EventScr_089FCF40, 4)
    TurnEventPlayer(0, EventScr_089FCF40, 6)
    TurnEventPlayer(0, EventScr_089FCF40, 8)
    TurnEventPlayer(0, EventScr_089FCF58, 10)
    TurnEventPlayer(0, EventScr_089FCF58, 12)
    TurnEventPlayer(0, EventScr_089FCF28, 3)
    TurnEventPlayer(0, EventScr_089FCF28, 5)
    TurnEventPlayer(0, EventScr_089FCF28, 7)
    TurnEventPlayer(0, EventScr_089FCF28, 9)
    TurnEventPlayer(0, EventScr_089FCF28, 11)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch17b_Character[] = {
    CHAR(EVFLAG_TMP(9), EventScr_089FCEF8, CHARACTER_TANA, CHARACTER_SYRENE)
    CHAR(EVFLAG_TMP(9), EventScr_089FCEEC, CHARACTER_INNES, CHARACTER_SYRENE)
    CHAR(EVFLAG_TMP(9), EventScr_089FCF04, CHARACTER_VANESSA, CHARACTER_SYRENE)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch17b_Location[] = {
    Vendor(ShopList_Event_089ED94E, 1, 20)
    Armory(ShopList_Event_089ED968, 12, 2)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch17b_Misc[] = {
    DefeatBoss(EventScr_Ch17b_EndingScene)
    AREA(EVFLAG_TMP(13), EventScr_089FCF70, 17, 0, 22, 9)
    AREA(EVFLAG_TMP(15), EventScr_089FCFC4, 9, 0, 16, 8)
    AREA(EVFLAG_TMP(15), EventScr_089FCFC4, 15, 10, 19, 16)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch17b_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch17b_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch17b_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch17b_Tutorial[] = {
    END_MAIN
};

// 0x89EAFC8
CONST_DATA struct ChapterEventGroup Ch17EphraimEventData = {
    .turnBasedEvents               = EventListScr_Ch17b_Turn,
    .characterBasedEvents          = EventListScr_Ch17b_Character,
    .locationBasedEvents           = EventListScr_Ch17b_Location,
    .miscBasedEvents               = EventListScr_Ch17b_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch17b_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch17b_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch17b_UnitMove,
    .tutorialEvents                = EventListScr_Ch17b_Tutorial,

    .traps            = TrapData_Event_089EDB7C,
    .extraTrapsInHard = TrapData_Event_089EDEDB,

    .playerUnitsInNormal = UnitDef_088C7C9C,
    .playerUnitsInHard   = UnitDef_088C7C9C,

    .playerUnitsChoice1InEncounter = UnitDef_088C80E8,
    .playerUnitsChoice2InEncounter = UnitDef_088C8408,
    .playerUnitsChoice3InEncounter = UnitDef_088C8728,

    .enemyUnitsChoice1InEncounter = UnitDef_088C81B0,
    .enemyUnitsChoice2InEncounter = UnitDef_088C84D0,
    .enemyUnitsChoice3InEncounter = UnitDef_088C87F0,

    .beginningSceneEvents = EventScr_Ch17b_BeginingScene,
    .endingSceneEvents    = EventScr_Ch17b_EndingScene,
};
