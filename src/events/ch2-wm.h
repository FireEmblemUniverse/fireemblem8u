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

CONST_DATA EventScr EventScrWM_Ch2_BeginningTutorial[] = {
    EvtTextStartType5 // ENOSUPP in EAstdlib
    SVAL(EVT_SLOT_B, 0xc000c)
    TEXTSHOW(0x8dd)
    TEXTEND
    REMA
    ENUT(226)
    ENDA
};

CONST_DATA EventScr EventScrWM_Ch2_Beginning[] = {
    EVBIT_MODIFY(0x1)
    WM_SPAWNLORD(WM_MU_0, CHARACTER_EIRIKA, WM_NODE_CastleFrelia)
    WM_CENTERCAMONLORD(WM_MU_0)
    WM_FADEOUT(0)
    WM_TEXTDECORATE // WaitFade
    EVBIT_MODIFY(0x0)
    STAL(20)
    WM_CREATENEXTDESTINATION
    WM_WAITFORFX
    STAL(40)
    WM_DRAWPATH(WM_PATH_01)
    STAL(70)
    MUSC(0x4)
    SVAL(EVT_SLOT_2, EventScrWM_Ch2_BeginningTutorial)
    CALL(EventScr_CallOnTutorialMode)
    WM_MAKELORDVISIBLE(WM_MU_0)
    EVBIT_MODIFY(0x1)
    CALL(EventScr_RemoveBGIfNeeded)
    ENDA
};

CONST_DATA EventScr EventScrWM_Ch2_ChapterIntro[] = {
    STAL(6)
    WM_MOVECAM(-1, -1, 0, 32, 45, 0)
    WM_WAITFORCAM
    CALL(EventScr_WM_FadeCommon)
    WM_TEXTSTART
    WM_SHOWPORTRAIT(0, 0x0052, 0x0534, 0)
    STAL(6)
    WM_TEXT(0x08DE, 0)
    TEXTEND
    WM_CLEARPORTRAIT(0, 0x0634, 0)
    STAL(60)
    WM_SHOWPORTRAIT(0, 0x0008, 0x0534, 0)
    STAL(6)
    STAL(46)
    WM_SHOWPORTRAIT(1, 0x0007, 0x02BC, 0)
    STAL(6)
    TEXTCONT
    TEXTEND
    WM_CLEARPORTRAIT(0, 0x0634, 0)
    STAL(46)
    WM_CLEARPORTRAIT(1, 0x01BC, 0)
    STAL(60)
    WM_SHOWPORTRAIT(0, 0x0002, 0x02BC, 0)
    STAL(6)
    TEXTCONT
    TEXTEND
    STAL(46)
    WM_CLEARPORTRAIT(0, 0x01BC, 0)
    STAL(46)
    WM_SHOWDRAWNMAP(0, -8, 0x3)
    STAL(120)
    WM_MOVECAM2(0, -8, 0, 48, 70, 0)
    STAL(85)
    WM_PLACEDOT(0, 0, WM_NODE_Renvall2, 1)
    TEXTCONT
    TEXTEND
    STAL(30)
    WM_FXCLEAR1(-0x1)
    WM_FXCLEAR2(-0x1)
    WmEvtRemoveBigMap // WM_WAITFORFXCLEAR1
    WmEvtWaitBigMapRemove // WM_WAITFORFXCLEAR2
    TEXTCONT
    TEXTEND
    WM_MOVESPRITETO(WM_MU_0, 0x0002, WM_NODE_CastleFrelia, WM_NODE_Ide, 200, 30)
    TEXTCONT
    TEXTEND
    WM_WAITFORSPRITES(WM_MU_ANY)
    WM_REMOVETEXT
    STAL(2)
    STAL(20)
    FADI(16)
    ENDA
};
