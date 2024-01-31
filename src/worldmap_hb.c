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
        s8 val = gUnknown_0201C5D1;
        if (val)
        {
            int page = gUnknown_0201C5D0 * 480;
            u16 * src = gUnknown_0201BE32 + page;
            u16 * _src = src + vcount;

            for (i = 0; i < 3; i++)
            {
                if (gUnknown_0201C5C0[i] != NULL)
                    *gUnknown_0201C5C0[i] = _src[i * 160];
            }
        }
    }
    else if (vcount == 0xA0)
    {
        if (gWmHblankStatus & 4)
        {
            gUnknown_0201C5D1 = true;
            gUnknown_0201C5D0 = gUnknown_0201C5CF;

            for (i = 0; i < 3; i++)
                gUnknown_0201C5C0[i] = gUnknown_0201C5B4[i];
        }
        else
        {
            gUnknown_0201C5D1 = false;
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
        gUnknown_0201C5CC[i] = 0;
        gUnknown_0201C5C0[i] = gUnknown_0201C5B4[i] = NULL;
    }
    gUnknown_0201C5D0 = gUnknown_0201C5CF = 0;
    gUnknown_0201C5D1 = 0;
    gWmHblankStatus = 0;

    SetPrimaryHBlankHandler(NULL);
    SetPrimaryHBlankHandler(WorldMapHblank);
}


void ClearWmHblank(void)
{
    SetPrimaryHBlankHandler(NULL);
    CpuFill16(0, gUnknown_0201BE32, sizeof(gUnknown_0201BE32));
    gWmHblankStatus = 0;
}

u16 * sub_80C1DA0(int line, int page)
{
    int _page = ((gUnknown_0201C5CF + page) & 1);
    int __page = _page * 480;

    return gUnknown_0201BE32 + __page + line * 160;
}

void sub_80C1DC8(void)
{
    gUnknown_0201C5CF ^= 1;
}

void sub_80C1DD8(int idx, uintptr_t reg)
{
    gUnknown_0201C5B4[idx] = (void *)reg;
}

void sub_80C1DE8(int idx)
{
    gUnknown_0201C5CC[idx] &= 3;
}

void sub_80C1DFC(int idx)
{
    gUnknown_0201C5CC[idx] &= 3;
    gUnknown_0201C5CC[idx] |= 1;
}

void sub_80C1E14(int idx)
{
    gUnknown_0201C5CC[idx] &= 3;
    gUnknown_0201C5CC[idx] |= 2;
}
