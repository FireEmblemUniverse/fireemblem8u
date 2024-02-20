#include "global.h"

#include "worldmap.h"

//! FE8U = 0x080C0834
int sub_80C0834(int arg0, int arg1, int arg2, int arg3, int arg4)
{
    int a = (arg2 - arg0);
    int b = (arg3 - arg1);

    return Sqrt((a * a + b * b) << (arg4));
}

//! FE8U = 0x080C0858
void GetWMCenteredCameraPosition(s16 xIn, s16 yIn, s16 * xOut, s16 * yOut)
{
    *xOut = (xIn - DISPLAY_WIDTH / 2);

    if (*xOut < 0)
    {
        *xOut = 0;
    }
    else if (*xOut > DISPLAY_WIDTH)
    {
        *xOut = DISPLAY_WIDTH;
    }

    *yOut = (yIn - DISPLAY_HEIGHT / 2);

    if (*yOut < 0)
    {
        *yOut = 0;
    }
    else if (*yOut > DISPLAY_HEIGHT)
    {
        *yOut = DISPLAY_HEIGHT;
    }

    return;
}

//! FE8U = 0x080C089C
int sub_80C089C(int a, int b, int c, int d)
{
    s16 x1;
    s16 y1;
    s16 x2;
    s16 y2;

    *&x1 = (gGMData.ix >> 8);
    *&y1 = (gGMData.iy >> 8);

    *&x2 = gGMData.xCamera;
    *&y2 = gGMData.yCamera;

    x1 = (x1 + 8) - x2;
    y1 = (y1 + 8) - y2;

    if ((a != 0) || (b != 0))
    {
        if (x1 >= DISPLAY_WIDTH / 2 - d)
        {
            if ((x1 < c + DISPLAY_WIDTH / 2))
            {
                return 4;
            }
        }
    }

    if ((c != 0) || (d != 0))
    {
        if (y1 >= DISPLAY_HEIGHT / 2 - a)
        {
            if (y1 < b + DISPLAY_HEIGHT / 2)
            {
                return 4;
            }
        }
    }

    if ((x1 <= DISPLAY_WIDTH / 2) && (y1 <= DISPLAY_HEIGHT / 2))
    {
        return 0;
    }

    if ((x1 > DISPLAY_WIDTH / 2) && (y1 <= DISPLAY_HEIGHT / 2))
    {
        return 1;
    }

    if ((x1 <= DISPLAY_WIDTH / 2) && (y1 > DISPLAY_HEIGHT / 2))
    {
        return 2;
    }

    if ((x1 > DISPLAY_WIDTH / 2) && (y1 > DISPLAY_HEIGHT / 2))
    {
        return 3;
    }
}

//! FE8U = 0x080C0960
int sub_80C0960(int chIndex)
{
    int nodeId = sub_80BCFDC(chIndex);

    if ((gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME) || (GetNextUnclearedNode(&gGMData) != nodeId))
    {
        int i;

        for (i = 0; i < gWMMonsterSpawnsSize; i++)
        {
            if (nodeId == gWMMonsterSpawnLocations[i])
            {
                return 1;
            }
        }
    }

    return 0;
}

extern u8 gUnknown_0201B430[];
extern u8 gUnknown_0201B930[];

//! FE8U = 0x080C09B8
void sub_80C09B8(void)
{
    CpuFastFill(0, gUnknown_0201B430, 0x500);
    CpuFastFill(0, gUnknown_0201B930, 0x500);
    return;
}
