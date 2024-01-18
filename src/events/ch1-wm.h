#pragma once

#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "eventcall.h"
#include "eventscript.h"
#include "ea-stdlib.h"
#include "constants/characters.h"
#include "constants/classes.h"

CONST_DATA EventScr EventScrWM_Ch1_Beginning[] = {
    EVBIT_MODIFY(0x1)
    SKIPWN
    ENDA
};

CONST_DATA EventScr EventScrWM_Ch1_ChapterIntro[] = {
    EVBIT_MODIFY(0x1)
    ENUT(137)
    ENDA
};
