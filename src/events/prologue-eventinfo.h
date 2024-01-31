#pragma once

#include "global.h"
#include "bmtrap.h"
#include "bmunit.h"
#include "chapterdata.h"
#include "eventinfo.h"
#include "eventcall.h"
#include "EAstdlib.h"
#include "constants/event-flags.h"

CONST_DATA EventListScr EventListScr_Prologue_Turn[] = {
    TURN(0x0, EventScr_Prologue_Turn1, 1, 0, FACTION_RED)
    TURN(0x0, EventScr_Prologue_Turn2, 2, 0, FACTION_BLUE)
    TURN(0x0, EventScr_Prologue_Turn3, 3, 0, FACTION_BLUE)
    TURN(EVFLAG_TMP_8, EventScr_Prologue_ONeillAttack, 1, 255, FACTION_RED)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Prologue_Character[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Prologue_Location[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Prologue_Misc[] = {
    DefeatBoss(EventScr_Prologue_EndingScene)
    AFEV(EVFLAG_TMP_7, EventScr_Prologue_OneEmimyLeft, 0)
    CauseGameOverIfLordDies
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Prologue_SelectUnit[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Prologue_SelectDestination[] = {
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Prologue_UnitMove[] = {
    END_MAIN
};

CONST_DATA EventListScr * EventListScr_Prologue_Tutorial[] = {
    EventScr_Prologue_Tutorial0,
    EventScr_Prologue_Tutorial1,
    EventScr_Prologue_Tutorial2,
    EventScr_Prologue_Tutorial3,
    EventScr_Prologue_Tutorial4,
    EventScr_Prologue_Tutorial5,
    EventScr_Prologue_Tutorial6,
    EventScr_Prologue_Tutorial7,
    EventScr_Prologue_Tutorial8,
    EventScr_Prologue_Tutorial9,
    EventScr_Prologue_TutorialA,
    EventScr_Prologue_TutorialB,
    EventScr_Prologue_TutorialC,
    EventScr_Prologue_TutorialD,
    EventScr_Prologue_TutorialE,
    NULL
};

CONST_DATA struct ChapterEventGroup PrologueEvents = {
    .turnBasedEvents               = EventListScr_Prologue_Turn,
    .characterBasedEvents          = EventListScr_Prologue_Character,
    .locationBasedEvents           = EventListScr_Prologue_Location,
    .miscBasedEvents               = EventListScr_Prologue_Misc,
    .specialEventsWhenUnitSelected = EventListScr_Prologue_SelectUnit,
    .specialEventsWhenDestSelected = EventListScr_Prologue_SelectDestination,
    .specialEventsAfterUnitMoved   = EventListScr_Prologue_UnitMove,
    .tutorialEvents                = EventListScr_Prologue_Tutorial,

    .traps            = TrapData_Event_Prologue,
    .extraTrapsInHard = TrapData_Event_PrologueHard,

    .playerUnitsInNormal = UnitDef_Event_PrologueAlly,
    .playerUnitsInHard   = UnitDef_Event_PrologueAlly,

    .playerUnitsChoice1InEncounter = NULL,
    .playerUnitsChoice2InEncounter = NULL,
    .playerUnitsChoice3InEncounter = NULL,

    .enemyUnitsChoice1InEncounter = NULL,
    .enemyUnitsChoice2InEncounter = NULL,
    .enemyUnitsChoice3InEncounter = NULL,

    .beginningSceneEvents = EventScr_Prologue_BeginingScene,
    .endingSceneEvents    = EventScr_Prologue_EndingScene,
};
