#include "global.h"
#include "bmlib.h"
#include "functions.h"
#include "variables.h"

/* These should related to status-bar gfx for stat-screen */

void UnusedDrawOutline(u8 *buf, int bufWidth, int col)
{
    buf[0 * bufWidth + col] = 4;
    buf[1 * bufWidth + col] = 4;
    buf[2 * bufWidth + col] = 4;
    buf[3 * bufWidth + col] = 4;
    buf[4 * bufWidth + col] = 4;
}

void DrawStatBarLeftBorder(u8 *buf, int bufWidth, int col)
{
    buf[0 * bufWidth + col] = 4;
    buf[1 * bufWidth + col] = 4;
    buf[2 * bufWidth + col] = 4;
    buf[3 * bufWidth + col] = 4;
}

void DrawStatBarShadow(u8 *buf, int bufWidth, int col)
{
    buf[1 * bufWidth + col] = 4;
    buf[2 * bufWidth + col] = 4;
    buf[3 * bufWidth + col] = 4;
    buf[4 * bufWidth + col] = 4;
}

void DrawStatBarRightBorder(u8 *buf, int bufWidth, int col)
{
    buf[0 * bufWidth + col] = 4;
    buf[1 * bufWidth + col] = 4;
    buf[2 * bufWidth + col] = 4;
    buf[3 * bufWidth + col] = 4;
    buf[4 * bufWidth + col] = 4;
}

void DrawStatBarUnfilledCol(u8 *buf, int bufWidth, int col)
{
    buf[0 * bufWidth + col] = 4;
    buf[1 * bufWidth + col] = 14;
    buf[2 * bufWidth + col] = 3;
    buf[3 * bufWidth + col] = 4;
    buf[4 * bufWidth + col] = 4;
}

void DrawStatBarFilledCol(u8 *buf, int bufWidth, int col)
{
    buf[1 * bufWidth + col] = 1;
    buf[2 * bufWidth + col] = 5;
}

void DrawStatBarCappedCol(u8 *buf, int bufWidth, int col)
{
    buf[1 * bufWidth + col] = 13;
    buf[2 * bufWidth + col] = 12;
}

void DrawStatBar(
    int tile, int padding, int bufWidth, int barWidth, int progressLength, int cappedLength)
{
    int i, j, val, val1;
    u8 *buf = gGenericBuffer;
    CpuFastFill(0, buf, 0x40 * bufWidth);

    for (i = 1; i < barWidth + 1; i++)
        DrawStatBarUnfilledCol(buf, 8 * bufWidth, i + ({padding + 1;}));

    DrawStatBarLeftBorder(buf, 8 * bufWidth, padding + 1);
    DrawStatBarRightBorder(buf, 8 * bufWidth, padding + barWidth + 2);
    DrawStatBarShadow(buf, 8 * bufWidth, padding + barWidth + 3);

    for (i = 0; i < progressLength; i++)
        DrawStatBarFilledCol(buf, 8 * bufWidth, i + ({padding + 2;}));

    for (i = 0; i < cappedLength; i++)
        DrawStatBarCappedCol(buf, 8 * bufWidth, i + progressLength + padding + 2);

    ApplyBitmap(buf, (void*)(32 * tile + 0x6000000), bufWidth, 1);
}

// bufWidth: The width of the allocated buffer canvas
// barWidth: The width of the bar itself (in tiles)
// progressLength: The length of the "progress" of the bar (the yellow part)
// cappedLength: Same as above, controls the part that flashes green when stat capped
void DrawStatBarGfx(
    int tile, int bufWidth, u16* buf, int tileBase,
    int barWidth, int progressLength, int cappedLength)
{
    DrawStatBar(tile, 2, bufWidth, barWidth, progressLength, cappedLength);
    PutAppliedBitmap(buf, tileBase + (tile & 0x3FF), bufWidth, 1);
}
