#pragma once

#include "global.h"

struct PalFadeSt
{
    /* 00 */ u16 from_colors[0x10];
    /* 20 */ u16 const * to_colors;
    /* 24 */ u16 * pal;
    /* 28 */ u16 clock;
    /* 2A */ u16 clock_end;
    /* 2C */ u16 clock_stop;
};

extern struct PalFadeSt EWRAM_DATA sPalFadeSt[0x20];

struct PalFadeSt *GetPalFadeSt();
struct PalFadeSt *StartPalFade(u16 const *colors, int pal, int duration, ProcPtr parent);
