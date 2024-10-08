#include "global.h"
#include "bmguide.h"

CONST_DATA struct GuideEnt gGuideTable[] = {
    {
        .title = 0x1,
        .itemName = 0x5D5,
        .details = 0x60D,
        .displayFlag = 0xB4,
        .readFlag = 0xF0,
    },
    {
        .title = 0x1,
        .itemName = 0x5D6,
        .details = 0x60E,
        .displayFlag = 0xB5,
        .readFlag = 0xF1,
    },
    {
        .title = 0x1,
        .chapterTitle = 0x1,
        .itemName = 0x5D7,
        .details = 0x60F,
        .displayFlag = 0xB6,
        .readFlag = 0xF2,
    },
    {
        .title = 0x2,
        .itemName = 0x5D8,
        .details = 0x610,
        .displayFlag = 0xB7,
        .readFlag = 0xF3,
    },
    {
        .title = 0x2,
        .chapterTitle = 0x2,
        .itemName = 0x5D9,
        .details = 0x611,
        .displayFlag = 0xB8,
        .readFlag = 0xF4,
    },
    {
        .title = 0x3,
        .itemName = 0x5DA,
        .details = 0x612,
        .displayFlag = 0xB9,
        .readFlag = 0xF5,
    },
    {
        .title = 0x3,
        .chapterTitle = 0x1,
        .itemName = 0x5DB,
        .details = 0x613,
        .displayFlag = 0xBA,
        .readFlag = 0xF6,
    },
    {
        .title = 0x3,
        .chapterTitle = 0x4,
        .itemName = 0x5DC,
        .details = 0x614,
        .displayFlag = 0xBB,
        .readFlag = 0xF7,
    },
    {
        .title = 0x3,
        .chapterTitle = 0x2,
        .itemName = 0x5DD,
        .details = 0x615,
        .displayFlag = 0xBC,
        .readFlag = 0xF8,
    },
    {
        .title = 0x3,
        .chapterTitle = 0x5,
        .itemName = 0x5DE,
        .details = 0x616,
        .displayFlag = 0xBD,
        .readFlag = 0xF9,
    },
    {
        .title = 0x3,
        .chapterTitle = 0x4,
        .itemName = 0x5DF,
        .details = 0x617,
        .displayFlag = 0xBE,
        .readFlag = 0xFA,
    },
    {
        .title = 0x3,
        .chapterTitle = 0x4,
        .itemName = 0x5E0,
        .details = 0x618,
        .displayFlag = 0xBF,
        .readFlag = 0xFB,
    },
    {
        .title = 0x3,
        .chapterTitle = 0x2,
        .itemName = 0x5E1,
        .details = 0x619,
        .displayFlag = 0xC0,
        .readFlag = 0xFC,
    },
    {
        .title = 0x3,
        .chapterTitle = 0x6,
        .itemName = 0x5E2,
        .details = 0x61A,
        .displayFlag = 0xC1,
        .readFlag = 0xFD,
    },
    {
        .title = 0x3,
        .itemName = 0x5E3,
        .details = 0x61B,
        .displayFlag = 0xC2,
        .readFlag = 0xFE,
    },
    {
        .title = 0x3,
        .itemName = 0x5E4,
        .details = 0x61C,
        .displayFlag = 0xC3,
        .readFlag = 0xFF,
    },
    {
        .title = 0x4,
        .chapterTitle = 0x2,
        .itemName = 0x5E5,
        .details = 0x61D,
        .displayFlag = 0xC4,
        .readFlag = 0x100,
    },
    {
        .title = 0x4,
        .chapterTitle = 0x2,
        .itemName = 0x5E6,
        .details = 0x61E,
        .displayFlag = 0xC5,
        .readFlag = 0x101,
    },
    {
        .title = 0x5,
        .chapterTitle = 0x3,
        .itemName = 0x5E7,
        .details = 0x61F,
        .displayFlag = 0xC6,
        .readFlag = 0x102,
    },
    {
        .title = 0x5,
        .chapterTitle = 0x1,
        .itemName = 0x5E8,
        .details = 0x620,
        .displayFlag = 0xC7,
        .readFlag = 0x103,
    },
    {
        .title = 0x5,
        .chapterTitle = 0x1,
        .itemName = 0x5E9,
        .details = 0x621,
        .displayFlag = 0xC8,
        .readFlag = 0x104,
    },
    {
        .title = 0x5,
        .itemName = 0x5EA,
        .details = 0x622,
        .displayFlag = 0xC9,
        .readFlag = 0x105,
    },
    {
        .title = 0x5,
        .chapterTitle = 0x2,
        .itemName = 0x5EB,
        .details = 0x623,
        .displayFlag = 0xCA,
        .readFlag = 0x106,
    },
    {
        .title = 0x5,
        .chapterTitle = 0x2,
        .itemName = 0x5EC,
        .details = 0x624,
        .displayFlag = 0xCB,
        .readFlag = 0x107,
    },
    {
        .title = 0x5,
        .chapterTitle = 0x5,
        .itemName = 0x5ED,
        .details = 0x625,
        .displayFlag = 0xCC,
        .readFlag = 0x108,
    },
    {
        .title = 0x6,
        .chapterTitle = 0x4,
        .itemName = 0x5EE,
        .details = 0x626,
        .displayFlag = 0xCD,
        .readFlag = 0x109,
    },
    {
        .title = 0x6,
        .chapterTitle = 0x1,
        .itemName = 0x5EF,
        .details = 0x627,
        .displayFlag = 0xCE,
        .readFlag = 0x10A,
    },
    {
        .title = 0x6,
        .chapterTitle = 0x1,
        .itemName = 0x5F0,
        .details = 0x628,
        .displayFlag = 0xCF,
        .readFlag = 0x10B,
    },
    {
        .title = 0x6,
        .chapterTitle = 0x2,
        .itemName = 0x5F1,
        .details = 0x629,
        .displayFlag = 0xD0,
        .readFlag = 0x10C,
    },
    {
        .title = 0x6,
        .chapterTitle = 0x3,
        .itemName = 0x5F2,
        .details = 0x62A,
        .displayFlag = 0xD1,
        .readFlag = 0x10D,
    },
    {
        .title = 0x6,
        .chapterTitle = 0x4,
        .itemName = 0x5F3,
        .details = 0x62B,
        .displayFlag = 0xD2,
        .readFlag = 0x10E,
    },
    {
        .title = 0x6,
        .chapterTitle = 0x3,
        .itemName = 0x5F4,
        .details = 0x62C,
        .displayFlag = 0xD3,
        .readFlag = 0x10F,
    },
    {
        .title = 0x6,
        .chapterTitle = 0x6,
        .itemName = 0x5F5,
        .details = 0x62D,
        .displayFlag = 0xD4,
        .readFlag = 0x110,
    },
    {
        .title = 0x6,
        .chapterTitle = 0x7,
        .itemName = 0x5F6,
        .details = 0x62E,
        .displayFlag = 0xD5,
        .readFlag = 0x111,
    },
    {
        .title = 0x7,
        .chapterTitle = 0x1,
        .itemName = 0x5F7,
        .details = 0x62F,
        .displayFlag = 0xD6,
        .readFlag = 0x112,
    },
    {
        .title = 0x7,
        .chapterTitle = 0x1,
        .itemName = 0x5F8,
        .details = 0x630,
        .displayFlag = 0xD7,
        .readFlag = 0x113,
    },
    {
        .title = 0x7,
        .chapterTitle = 0x3,
        .itemName = 0x5F9,
        .details = 0x631,
        .displayFlag = 0xD8,
        .readFlag = 0x114,
    },
    {
        .title = 0x7,
        .chapterTitle = 0x3,
        .itemName = 0x5FA,
        .details = 0x632,
        .displayFlag = 0xD9,
        .readFlag = 0x115,
    },
    {
        .title = 0x7,
        .chapterTitle = 0x2,
        .itemName = 0x5FB,
        .details = 0x633,
        .displayFlag = 0xDA,
        .readFlag = 0x116,
    },
    {
        .title = 0x7,
        .chapterTitle = 0x5,
        .itemName = 0x5FC,
        .details = 0x634,
        .displayFlag = 0xDB,
        .readFlag = 0x117,
    },
    {
        .title = 0x8,
        .itemName = 0x5FD,
        .details = 0x635,
        .displayFlag = 0xDC,
        .readFlag = 0x118,
    },
    {
        .title = 0x8,
        .chapterTitle = 0x1,
        .itemName = 0x5FE,
        .details = 0x636,
        .displayFlag = 0xDD,
        .readFlag = 0x119,
    },
    {
        .title = 0x8,
        .chapterTitle = 0x2,
        .itemName = 0x5FF,
        .details = 0x637,
        .displayFlag = 0xDE,
        .readFlag = 0x11A,
    },
    {
        .title = 0x8,
        .chapterTitle = 0x8,
        .itemName = 0x600,
        .details = 0x638,
        .displayFlag = 0xDF,
        .readFlag = 0x11B,
    },
    {
        .title = 0x9,
        .itemName = 0x601,
        .details = 0x639,
        .displayFlag = 0xE0,
        .readFlag = 0x11C,
    },
    {
        .title = 0x9,
        .itemName = 0x602,
        .details = 0x63A,
        .displayFlag = 0xE1,
        .readFlag = 0x11D,
    },
    {
        .title = 0xA,
        .chapterTitle = 0x1,
        .itemName = 0x603,
        .details = 0x63B,
        .displayFlag = 0xE2,
        .readFlag = 0x11E,
    },
    {
        .title = 0xA,
        .chapterTitle = 0x2,
        .itemName = 0x604,
        .details = 0x63C,
        .displayFlag = 0xE3,
        .readFlag = 0x11F,
    },
    {
        .title = 0xA,
        .chapterTitle = 0x2,
        .itemName = 0x605,
        .details = 0x63D,
        .displayFlag = 0xE4,
        .readFlag = 0x120,
    },
    {
        .title = 0xA,
        .chapterTitle = 0x8,
        .itemName = 0x606,
        .details = 0x63E,
        .displayFlag = 0xE5,
        .readFlag = 0x121,
    },
    {
        .title = 0xB,
        .chapterTitle = 0x4,
        .itemName = 0x607,
        .details = 0x63F,
        .displayFlag = 0xE6,
        .readFlag = 0x122,
    },
    {
        .title = 0xB,
        .itemName = 0x608,
        .details = 0x640,
        .displayFlag = 0xE7,
        .readFlag = 0x123,
    },
    {
        .title = 0xB,
        .chapterTitle = 0x2,
        .itemName = 0x609,
        .details = 0x641,
        .displayFlag = 0xE8,
        .readFlag = 0x124,
    },
    {
        .title = 0xB,
        .chapterTitle = 0x3,
        .itemName = 0x60A,
        .details = 0x642,
        .displayFlag = 0xE9,
        .readFlag = 0x125,
    },
    {
        .title = 0xB,
        .chapterTitle = 0x5,
        .itemName = 0x60B,
        .details = 0x643,
        .displayFlag = 0xEA,
        .readFlag = 0x126,
    },
    {
        .title = 0xB,
        .chapterTitle = 0x8,
        .itemName = 0x60C,
        .details = 0x644,
        .displayFlag = 0xEB,
        .readFlag = 0x127,
    },
    {
        .title = 0xC,
    },
};
