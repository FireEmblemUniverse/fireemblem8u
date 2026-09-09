#include "global.h"

// TSA dimensions are stored minus one. Read tiles sequentially and write rows
// from bottom to top into a background tilemap with a 32-halfword row stride.
void TmApplyTsa(u16 * dstArg, const u8 * tsa, u32 tileref)
{
    register u16 * dst asm("r0") = dstArg;
    register const u8 * src asm("r1") = tsa;
    register u32 width asm("r3");
    register u32 height asm("r4");
    register u32 x asm("r5");
    register u32 y asm("r6");
    register u32 work asm("r7");

    // Empty constraints preserve register lifetimes and instruction selection.
    // The compiler generates every instruction in this routine.
    width = src[0];
    height = src[1];
    asm("" : : "r"(width), "r"(height));
    src += 2;
    asm("" : "+r"(src));
    work = height * 64;
    asm("" : "+r"(work));
    dst = (u16 *) ((u8 *) dst + work);
    asm("" : "+r"(dst), "+r"(height));
    y = height;
    asm("" : : "r"(y));

    do
    {
        x = width;
        asm("" : : "r"(x));

        do
        {
            work = *(const u16 *) src;
            asm("" : "+r"(work) : "r"(src));
            work += tileref;
            asm("" : : "r"(work));
            *dst = work;
            dst++;
            src += 2;
            asm("" : "+r"(src));
        } while ((int) --x >= 0);

        asm("" : "+r"(width));
        dst -= width;
        asm("" : "+r"(dst));
        dst -= 33;
    } while ((int) --y >= 0);
}
