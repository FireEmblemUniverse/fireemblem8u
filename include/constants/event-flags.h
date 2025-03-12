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
    #define EVFLAG_TMP(flag) (flag)

    EVFLAG_GAMEOVER = 101,
    EVFLAG_OBJWINDOW_DISABLE = 102,

    EVFLAG_EXTRA_UNIT_BASE = 103, /* 10 extra unit is avalable */
    #define EVFLAG_EXTRA_UNIT(i) (EVFLAG_EXTRA_UNIT_BASE + (i))

    EVFLAG_HIDE_BLINKING_ICON = 132,
    EVFLAG_136 = 136,
};
