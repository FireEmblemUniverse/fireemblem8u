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

CONST_DATA EventScr EventScrWM_Ch1_Ending[] = {
    EVBIT_MODIFY(0x1)
    ENUT(137)
    ENDA
};

CONST_DATA EventScr EventScrWM_08A39D24[] = {
    EvtTextStartType5 // ENOSUPP in EA-stdlib
    SVAL(EVT_SLOT_B, 0xc000c)
    TEXTSHOW(0x8dd)
    TEXTEND
    REMA
    ENUT(226)
    ENDA
};
