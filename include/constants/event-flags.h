#pragma once

enum event_flag_idx {
    EVFLAG_ALWAYS_FALSE = 0,
    EVFLAG_BATTLE_QUOTES = 1,
    EVFLAG_DEFEAT_BOSS = 2,
    EVFLAG_WIN = 3,
    EVFLAG_BGM_CHANGE = 4,
    EVFLAG_5 = 5,
    EVFLAG_DEFEAT_ALL = 6,

    /* Flag 7 - 40 is free */
    EVFLAG_TMP_7 = 7,
    EVFLAG_TMP_8 = 8,

    EVFLAG_GAMEOVER = 101,
    EVFLAG_OBJWINDOW_DISABLE = 102,

    EVFLAG_EXTRA_UNIT_BASE = 103, /* 10 extra unit is avalable */

    EVFLAG_HIDE_BLINKING_ICON = 132,
};
