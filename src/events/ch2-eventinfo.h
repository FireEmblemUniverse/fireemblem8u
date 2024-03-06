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

CONST_DATA EventListScr EventListScr_Ch2_Turn[] = {
    TURN(0, EventScr_089F0484, 1, 0, FACTION_ID_BLUE)
    TURN(0, EventScr_089F049C, 2, 0, FACTION_ID_BLUE)
    TURN(0, EventScr_089F0748, 3, 0, FACTION_ID_BLUE)
    END_MAIN
};

CONST_DATA EventListScr EventListScr_Ch2_Character[] = {
    CHAR(7, EventScr_089F05FC, CHARACTER_EIRIKA, CHARACTER_ROSS)
    CHAR(8, EventScr_089F0628, CHARACTER_ROSS, CHARACTER_GARCIA)
    END_MAIN
};
