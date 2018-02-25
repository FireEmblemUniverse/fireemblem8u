#include "global.h"

void CopyToPaletteBuffer(void *src, int b, int size)
{
    if (size & 0x1F)  // size is not a multiple of 32
        CpuCopy16(src, gUnknown_020228A8 + (b >> 1), size);
    else
        CpuFastCopy(src, gUnknown_020228A8 + (b >> 1), size);
    gUnknown_0300000E = 1;
}

void sub_8000E14(u16 *a, int b, int size, int d)
{
    u16 *dest = gUnknown_020228A8 + (b >> 1);
    u16 *src = a;
    int i;

    for (i = 0; i < size; i++)
    {
        *dest++ = ((((*src & 0x1F) * d) >> 6) & 0x1F)
                + ((((*src & 0x3E0) * d) >> 6) & 0x3E0)
                + ((((*src & 0x7C00) * d) >> 6) & 0x7C00);
        src++;
    }
    gUnknown_0300000E = 1;
}

/*
void FlushLCDControl(void)
{
    *(vDispCnt *)&REG_DISPCNT = gLCDControlBuffer.dispcnt;
    *(vDispStat *)&REG_DISPSTAT = gLCDControlBuffer.dispstat;
    REG_BG0CNT = *(u16 *)&gLCDControlBuffer.bgcnt[0];
    REG_BG1CNT = *(u16 *)&gLCDControlBuffer.bgcnt[1];
    REG_BG2CNT = *(u16 *)&gLCDControlBuffer.bgcnt[2];
    REG_BG3CNT = *(u16 *)&gLCDControlBuffer.bgcnt[3];
}
*/
