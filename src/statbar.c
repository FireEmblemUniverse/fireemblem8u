#include "global.h"
#include "bmlib.h"
#include "functions.h"
#include "variables.h"

/* These should related to status-bar gfx for stat-screen */

void sub_8086934(u8 *buf, int a2, int a3)
{
    buf[0 * a2 + a3] = 4;
    buf[1 * a2 + a3] = 4;
    buf[2 * a2 + a3] = 4;
    buf[3 * a2 + a3] = 4;
    buf[4 * a2 + a3] = 4;
}

void sub_8086960(u8 *buf, int a2, int a3)
{
    buf[0 * a2 + a3] = 4;
    buf[1 * a2 + a3] = 4;
    buf[2 * a2 + a3] = 4;
    buf[3 * a2 + a3] = 4;
}

void sub_8086984(u8 *buf, int a2, int a3)
{
    buf[1 * a2 + a3] = 4;
    buf[2 * a2 + a3] = 4;
    buf[3 * a2 + a3] = 4;
    buf[4 * a2 + a3] = 4;
}

void sub_80869AC(u8 *buf, int a2, int a3)
{
    buf[0 * a2 + a3] = 4;
    buf[1 * a2 + a3] = 4;
    buf[2 * a2 + a3] = 4;
    buf[3 * a2 + a3] = 4;
    buf[4 * a2 + a3] = 4;
}

void sub_80869D8(u8 *buf, int a2, int a3)
{
    buf[0 * a2 + a3] = 4;
    buf[1 * a2 + a3] = 14;
    buf[2 * a2 + a3] = 3;
    buf[3 * a2 + a3] = 4;
    buf[4 * a2 + a3] = 4;
}

void sub_8086A08(u8 *buf, int a2, int a3)
{
    buf[1 * a2 + a3] = 1;
    buf[2 * a2 + a3] = 5;
}

void sub_8086A24(u8 *buf, int a2, int a3)
{
    buf[1 * a2 + a3] = 13;
    buf[2 * a2 + a3] = 12;
}

void sub_8086A40(int a1, int a2, int a3, int a4, int a5, int a6)
{
    int i, j, val, val1;
    u8 *buf = gGenericBuffer;
    CpuFastFill(0, buf, 0x40 * a3);

    for (i = 1; i < a4 + 1; i++)
        sub_80869D8(buf, 8 * a3, i + ({a2 + 1;}));

    sub_8086960(buf, 8 * a3, a2 + 1);
    sub_80869AC(buf, 8 * a3, a2 + a4 + 2);
    sub_8086984(buf, 8 * a3, a2 + a4 + 3);

    for (i = 0; i < a5; i++)
        sub_8086A08(buf, 8 * a3, i + ({a2 + 2;}));

    for (i = 0; i < a6; i++)
        sub_8086A24(buf, 8 * a3, i + a5 + a2 + 2);

    ApplyBitmap(buf, (void*)(32 * a1 + 0x6000000), a3, 1);
}

void DrawStatBarGfx(int a1, int a2, u16* buf, int a4, int a5, int a6, int a7)
{
    sub_8086A40(a1, 2, a2, a5, a6, a7);
    PutAppliedBitmap(buf, a4 + (a1 & 0x3FF), a2, 1);
}
