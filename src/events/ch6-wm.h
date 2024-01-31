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

CONST_DATA EventScr EventScrWM_Ch6_Beginning[] = {
    EVBIT_MODIFY(0x1)
    WM_SPAWNLORD(WM_MU_0, CHARACTER_EIRIKA, WM_NODE_Serafew)
    WM_CENTERCAMONLORD(WM_MU_0)
    WM_FADEOUT(0)
    WM_TEXTDECORATE // WaitFade
    EVBIT_MODIFY(0x0)
    STAL(20)
    WM_CREATENEXTDESTINATION
    WM_WAITFORFX
    STAL(40)
    WM_DRAWPATH(WM_PATH_05)
    STAL(70)
    WM_MAKELORDVISIBLE(WM_MU_0)
    EVBIT_MODIFY(0x1)
    CALL(EventScr_RemoveBGIfNeeded)
    ENDA
};

CONST_DATA EventScr EventScrWM_Ch6_ChapterIntro[] = {
    STAL(6)
    WM_MOVECAM(-1, -1, 48, 132, 60, 0)
    WM_WAITFORCAM
    CALL(EventScr_WM_FadeCommon)
    WM_TEXTSTART
    WM_SHOWPORTRAIT(0, 0x0002, 0x0534, 0)
    STAL(6)
    STAL(46)
    WM_TEXT(0x08E3, 0)
    TEXTEND
    TEXTCONT
    TEXTEND
    WM_MOVESPRITETO(WM_MU_0, 0x0002, WM_NODE_Serafew, WM_NODE_AdlasPlains, -4, 0)
    TEXTCONT
    TEXTEND
    TEXTCONT
    TEXTEND
    WM_WAITFORSPRITES(WM_MU_ANY)
    TEXTCONT
    TEXTEND
    WM_REMOVETEXT
    STAL(2)
    STAL(20)
    FADI(16)
    ENDA
};
