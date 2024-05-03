#include "gbafe.h"

CONST_DATA EventListScr EventScr_CastleFelia_BeginingScene[] = {
    CHECK_EVENTID(136)
    BEQ(0x801c, EVT_SLOT_C, EVT_SLOT_0)
    CALL(EventScr_SplitMenu)
LABEL(0x801c)
    MUSC(0x31)
    SVAL(EVT_SLOT_2, 0xe)
    CALL(EventScr_SetBackground)
    CHECK_ALIVE(CHARACTER_GILLIAM)
    BEQ(0x0, EVT_SLOT_C, EVT_SLOT_0)
    TEXTSHOW(0xbff)
    TEXTEND
    MUSCMID(0x7fff)
    TEXTCONT
    TEXTEND
    MUSC(0x32)
    TEXTCONT
    TEXTEND
    GOTO(0x1)
LABEL(0x0)
    TEXTSHOW(0xc00)
    TEXTEND
    MUSCMID(0x7fff)
    TEXTCONT
    TEXTEND
    MUSC(0x32)
    TEXTCONT
    TEXTEND
LABEL(0x1)
    REMA
    CALL(EventScr_RemoveBGIfNeeded)
    SVAL(EVT_SLOT_3, 0x1388)
    GIVEITEMTOMAIN(CHAR_EVT_PLAYER_LEADER)
    FADI(4)
    REMOVEPORTRAITS
    BACG(0x10)
    MUSC(0x32)
    FADU(4)
    TEXTSHOW(0xc01)
    TEXTEND
    REMA
    FADI(16)
    LOAD1(0x1, UnitDef_088B43D0)
    ENUN
    ENUT(138)
    MNCH(0x2)
    ENDA
};

CONST_DATA EventListScr EventScr_CastleFelia_EndingScene[] = {
    ENDA
};
