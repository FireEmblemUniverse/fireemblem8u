#pragma once

#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "eventcall.h"
#include "eventscript.h"
#include "EAstdlib.h"
#include "worldmap.h"
#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/worldmap.h"

CONST_DATA EventScr EventScrWM_Ch8_Beginning[] = {
    EVBIT_MODIFY(0x1)
    WM_SPAWNLORD(WM_MU_0, CHARACTER_EIRIKA, WM_NODE_Renvall2)
    WM_CENTERCAMONLORD(WM_MU_0)
    WM_REMOVELOCATION(WM_NODE_Renvall1)
    WM_REMOVEPATH(WM_PATH_06)
    WM_LOADLOCATION2(WM_NODE_Renvall2)
    WM_SETDESTINATION(WM_NODE_Renvall2)
    WM_DRAWPATH2(WM_PATH_07)
    WmEvtSetUnitOnNode(WM_MU_0, WM_NODE_Renvall2) // ENOSUPP in EAstdlib
    SKIPWN
    ENDA
};

CONST_DATA EventScr EventScrWM_Ch8_ChapterIntro[] = {
    EVBIT_MODIFY(0x1)
    ENUT(136)
    ENDA
};
