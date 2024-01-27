#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "eventcall.h"
#include "eventscript.h"
#include "EAstdlib.h"
#include "constants/characters.h"
#include "constants/classes.h"

CONST_DATA EventScr EventScr_WM_FadeCommon[] = {
    WmEvtFadeInDark(60) // WM_SATURATE_COLORS
    WM_SHOWTEXTWINDOW(40, 0x0001)
    WM_WAITFORTEXT
    WmEvtWaitFadeInDark // ENOSUPP in EAstdlib
    ENDA
};

#include "events/prologue-wm.h"
#include "events/ch1-wm.h"
#include "events/ch2-wm.h"
#include "events/ch3-wm.h"
#include "events/ch4-wm.h"
#include "events/ch5-wm.h"
#include "events/ch6-wm.h"
#include "events/ch7-wm.h"
#include "events/ch8-wm.h"
#include "events/messed-eventscr-wm.h"
