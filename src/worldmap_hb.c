#include "global.h"
#include "hardware.h"
#include "worldmap.h"
#include "mapanim.h"

void WorldMapHblank(void)
{
    int i;
    u16 vcount = REG_VCOUNT + 1;
    u16 _vcount = vcount;

    if (vcount == 0xE4)
        vcount = 0;

    if (vcount < 0xA0)
    {
        s8 val = gUnk_32;
        if (val)
        {
            int page = gUnk_31 * 480;
            u16 * src = gUnk_26 + page;
            u16 * _src = src + vcount;

            for (i = 0; i < 3; i++)
            {
                if (gUnk_28[i] != NULL)
                    *gUnk_28[i] = _src[i * 160];
            }
        }
    }
    else if (vcount == 0xA0)
    {
        if (gWmHblankStatus & 4)
        {
            gUnk_32 = true;
            gUnk_31 = gUnk_30;

            for (i = 0; i < 3; i++)
                gUnk_28[i] = gUnk_27[i];
        }
        else
        {
            gUnk_32 = false;
        }
    }

    vcount = 0;
    if (_vcount < 0xA0)
        vcount = _vcount;

    if (!(vcount & 1) && gWmHblankStatus & 2)
    {
        if (vcount == 0)
            gManimActiveScanlineBuf = gManimScanlineBufs[0];

        REG_WIN0H = gManimActiveScanlineBuf[vcount];
    }
}

void SetWorldMapHblank(void)
{
    int i;
    for (i = 0; i < 3; i++)
    {
        gUnk_29[i] = 0;
        gUnk_28[i] = gUnk_27[i] = NULL;
    }
    gUnk_31 = gUnk_30 = 0;
    gUnk_32 = 0;
    gWmHblankStatus = 0;

    SetPrimaryHBlankHandler(NULL);
    SetPrimaryHBlankHandler(WorldMapHblank);
}


void ClearWmHblank(void)
{
    SetPrimaryHBlankHandler(NULL);
    CpuFill16(0, gUnk_26, sizeof(gUnk_26));
    gWmHblankStatus = 0;
}

u16 * GetWorldMapHblankBuffer(int line, int page)
{
    int _page = ((gUnk_30 + page) & 1);
    int __page = _page * 480;

    return gUnk_26 + __page + line * 160;
}

void FlipWorldMapHblankBuffer(void)
{
    gUnk_30 ^= 1;
}

void SetWorldMapHblankDest(int idx, uintptr_t reg)
{
    gUnk_27[idx] = (void *)reg;
}

void ClearWorldMapHblankChannelFlags(int idx)
{
    gUnk_29[idx] &= 3;
}

void SetWorldMapHblankChannelFlag0(int idx)
{
    gUnk_29[idx] &= 3;
    gUnk_29[idx] |= 1;
}

void SetWorldMapHblankChannelFlag1(int idx)
{
    gUnk_29[idx] &= 3;
    gUnk_29[idx] |= 2;
}
