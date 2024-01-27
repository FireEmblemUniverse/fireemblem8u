#pragma once

#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "eventcall.h"
#include "EAstdlib.h"
#include "bmtrap.h"
#include "chapterdata.h"
#include "constants/event-flags.h"
#include "constants/characters.h"

CONST_DATA EventListScr EventListScr_Ch1_Turn[] = {
    TURN(0x0, EventScr_Ch1_Turn1Player, 1, 1, FACTION_BLUE)
    TURN(0x0, EventScr_Ch1_Turn1Enemy, 1, 1, FACTION_RED)
    TURN(0x0, EventScr_Ch1_Turn_AllyReinforceArrive, 2, 2, FACTION_BLUE)
    TURN(0xB, EventScr_Ch1_Turn_EnemyReinforceArrive, 1, 255, FACTION_BLUE)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch1_Character[] = {
    CharacterEventBothWays(0x8, EventScr_Ch1_Talk_SethFranz, CHARACTER_SETH, CHARACTER_FRANZ)
    CharacterEventBothWays(0x9, EventScr_Ch1_Talk_EirikaFranz, CHARACTER_EIRIKA, CHARACTER_FRANZ)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch1_Location[] = {
    House(0x0, EventScr_Ch1_Loca_Visit1, 13, 6)
    House(0x0, EventScr_Ch1_Loca_Visit2, 10, 4)
    Seize(2, 2)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch1_Misc[] = {
    AFEV(0x7, EventScr_Ch1_Misc_DefeatBoss, EVFLAG_DEFEAT_BOSS)
    AREA(0xA, EventScr_Ch1_Misc_Area, 0, 0, 7, 9)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch1_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch1_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch1_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr * EventListScr_Ch1_Tutorial[] = {
    EventScr_Ch1Tut_EirikaVisitHouseIdle1,
    EventScr_Ch1Tut_EirikaVisitHouseIdle2,
    EventScr_Ch1Tut_EirikaVisitHouseEnd,
    EventScr_Ch1Tut_GuideTerrainHeal,
    EventScr_Ch1Tut_TradeSelectGalliamIdle1,
    EventScr_Ch1Tut_TradeSelectGalliamIdle2,
    EventScr_Ch1Tut_TradeSelectGalliamEnd,
    EventScr_Ch1Tut_AfterTrade,
    EventScr_Ch1Tut_PostTradeAndItemUseAction,
    EventScr_Ch1Tut_SethMoveToEnemy,
    EventScr_Ch1Tut_BeforeSethMoveToEnemy,
    EventScr_Ch1Tut_AfterSethMoveToEnemy,
    EventScr_Ch1Tut_GuideOnBKSEL,
    EventScr_Ch1Tut_AfterSethBattleEirikaVisit,
    NULL
};

CONST_DATA struct ChapterEventGroup Ch1Events = {
    .turnBasedEvents               = EventListScr_Ch1_Turn,
    .characterBasedEvents          = EventListScr_Ch1_Character,
    .locationBasedEvents           = EventListScr_Ch1_Location,
    .miscBasedEvents               = EventListScr_Ch1_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Ch1_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Ch1_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Ch1_UnitMove,
    .tutorialEvents                = EventListScr_Ch1_Tutorial,

    .traps            = TrapData_Event_Ch1,
    .extraTrapsInHard = TrapData_Event_Ch1Hard,

    .playerUnitsInNormal = UnitDef_Event_Ch1Ally,
    .playerUnitsInHard   = UnitDef_Event_Ch1Ally,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Ch1_BeginingScene,
    .endingSceneEvents    = EventScr_Ch1_EndingScene,
};
