#include "global.h"

// Ordinary counts: nonpositive dimensions return without copying.
// Source and destination both advance with the original 32-tile row stride.
void TmCopyRect(const u16 * srcArg, u16 * dstArg, int width, int height)
{
    register const u16 * src asm("r0") = srcArg;
    register u16 * dst asm("r1") = dstArg;
    register u32 stride asm("r4");
    register u32 x asm("r5");
    register u32 y asm("r6");
    register u32 tile asm("r7");

    asm("" ::: "r4", "r5", "r6", "r7");
    if (width == 0)
        goto end;
    asm("" : : "r"(width));
    if (width < 0)
        goto end;
    asm("" : : "r"(width), "r"(height));
    if (height == 0)
        goto end;
    asm("" : : "r"(height));
    if (height < 0)
        goto end;

    stride = 64;
    asm("" : "+r"(stride));
    stride -= (u32) width * 2;
    asm("" : : "r"(stride));
    y = height - 1;
    asm("" : : "r"(y));
    do
    {
        asm("" : "+r"(width));
        x = width - 1;
        asm("" : : "r"(x));
        do
        {
            tile = *src;
            asm("" : "+r"(tile));
            *dst = tile;
            src++;
            dst++;
            asm("" : "+r"(src), "+r"(dst));
        } while ((int) --x >= 0);
        src = (const u16 *) ((const char *) src + stride);
        dst = (u16 *) ((char *) dst + stride);
        asm("" : "+r"(src), "+r"(dst));
    } while ((int) --y >= 0);
end:
    asm("" : : "r"(src), "r"(dst));
}
