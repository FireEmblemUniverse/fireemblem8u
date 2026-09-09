#include "global.h"

const u32 bitTable[8] = { 1, 4, 16, 64, 256, 1024, 4096, 16384 };

// Expand sixteen two-bit glyph rows into three four-bit tile columns and OR
// them into the destination. subx must be in 0..7. Lookup accesses deliberately
// match ARM word loads at halfword strides; only the low halfword is retained.
// This target-specific routine is compiled with strict aliasing disabled.
void DrawGlyph(const u16 * paletteArg, u32 * dstArg, const u32 * srcArg, unsigned subxArg)
{
    register const u16 * palette asm("r0") = paletteArg;
    register u32 * dst asm("r1") = dstArg;
    register const u32 * src asm("r2") = srcArg;
    register unsigned subx asm("r3") = subxArg;
    register u32 work asm("r4");
    register u64 product asm("r5");
    register u32 left asm("r7");
    register u32 right asm("r8");
    register u32 count asm("r9") = 15;
    register u32 mask asm("r10") = 0x10000;
    asm("" : "+r"(mask), "+r"(count));
    mask--;
    asm("" : "+r"(mask));
    do
    {
        {
            register const u32 * table asm("r4") = bitTable;
            register u32 factor asm("r5");
            asm("" : "+r"(table));
            factor = table[subx];
            asm("" : "+r"(factor));
            work = *src;
            asm("" : "+r"(work));
            product = (u64)work * factor;
            asm("" : "+r"(product));
        }
        left = (u32)product;
        asm("" : "+r"(left));
        left &= 255;
        asm("" : "+r"(left));
        left = *(const u32 *)(palette + left);
        asm("" : "+r"(left));
        right = ((u32)product >> 8);
        asm("" : "+r"(right));
        right &= 255;
        asm("" : "+r"(right));
        right = *(const u32 *)(palette + right);
        asm("" : "+r"(right));
        left &= mask;
        asm("" : "+r"(left));
        left |= right << 16;
        asm("" : "+r"(left));
        work = dst[0];
        asm("" : "+r"(work));
        work |= left;
        asm("" : "+r"(work));
        dst[0] = work;
        left = ((u32)product >> 16);
        asm("" : "+r"(left));
        left &= 255;
        asm("" : "+r"(left));
        left = *(const u32 *)(palette + left);
        asm("" : "+r"(left));
        right = ((u32)product >> 24);
        asm("" : "+r"(right));
        right &= 255;
        asm("" : "+r"(right));
        right = *(const u32 *)(palette + right);
        asm("" : "+r"(right));
        left &= mask;
        asm("" : "+r"(left));
        left |= right << 16;
        asm("" : "+r"(left));
        work = dst[16];
        asm("" : "+r"(work));
        work |= left;
        asm("" : "+r"(work));
        dst[16] = work;
        left = (u32)(product >> 32);
        asm("" : "+r"(left));
        left &= 255;
        asm("" : "+r"(left));
        left = *(const u32 *)(palette + left);
        asm("" : "+r"(left));
        right = ((u32)(product >> 32) >> 8);
        asm("" : "+r"(right));
        right &= 255;
        asm("" : "+r"(right));
        right = *(const u32 *)(palette + right);
        asm("" : "+r"(right));
        left &= mask;
        asm("" : "+r"(left));
        left |= right << 16;
        asm("" : "+r"(left));
        work = dst[32];
        asm("" : "+r"(work));
        work |= left;
        asm("" : "+r"(work));
        dst[32] = work;
        dst++;
        src++;
        asm("" : "+r"(dst), "+r"(src));
    } while ((int)--count >= 0);
}

// Eight rows: retain reads at 0/64/128 bytes and writes at 0/32/64 bytes.
void DrawGlyphHalfStride(const u16 * paletteArg, u32 * dstArg, const u32 * srcArg, unsigned subxArg)
{
    register const u16 * palette asm("r0") = paletteArg;
    register u32 * dst asm("r1") = dstArg;
    register const u32 * src asm("r2") = srcArg;
    register unsigned subx asm("r3") = subxArg;
    register u32 work asm("r4");
    register u64 product asm("r5");
    register u32 left asm("r7");
    register u32 right asm("r8");
    register u32 count asm("r9") = 7;
    register u32 mask asm("r10") = 0x10000;
    asm("" : "+r"(mask), "+r"(count));
    mask--;
    asm("" : "+r"(mask));
    do
    {
        {
            register const u32 * table asm("r4") = bitTable;
            register u32 factor asm("r5");
            asm("" : "+r"(table));
            factor = table[subx];
            asm("" : "+r"(factor));
            work = *src;
            asm("" : "+r"(work));
            product = (u64)work * factor;
            asm("" : "+r"(product));
        }
        left = (u32)product;
        asm("" : "+r"(left));
        left &= 255;
        asm("" : "+r"(left));
        left = *(const u32 *)(palette + left);
        asm("" : "+r"(left));
        right = ((u32)product >> 8);
        asm("" : "+r"(right));
        right &= 255;
        asm("" : "+r"(right));
        right = *(const u32 *)(palette + right);
        asm("" : "+r"(right));
        left &= mask;
        asm("" : "+r"(left));
        left |= right << 16;
        asm("" : "+r"(left));
        work = dst[0];
        asm("" : "+r"(work));
        work |= left;
        asm("" : "+r"(work));
        dst[0] = work;
        left = ((u32)product >> 16);
        asm("" : "+r"(left));
        left &= 255;
        asm("" : "+r"(left));
        left = *(const u32 *)(palette + left);
        asm("" : "+r"(left));
        right = ((u32)product >> 24);
        asm("" : "+r"(right));
        right &= 255;
        asm("" : "+r"(right));
        right = *(const u32 *)(palette + right);
        asm("" : "+r"(right));
        left &= mask;
        asm("" : "+r"(left));
        left |= right << 16;
        asm("" : "+r"(left));
        work = dst[16];
        asm("" : "+r"(work));
        work |= left;
        asm("" : "+r"(work));
        dst[8] = work;
        left = (u32)(product >> 32);
        asm("" : "+r"(left));
        left &= 255;
        asm("" : "+r"(left));
        left = *(const u32 *)(palette + left);
        asm("" : "+r"(left));
        right = ((u32)(product >> 32) >> 8);
        asm("" : "+r"(right));
        right &= 255;
        asm("" : "+r"(right));
        right = *(const u32 *)(palette + right);
        asm("" : "+r"(right));
        left &= mask;
        asm("" : "+r"(left));
        left |= right << 16;
        asm("" : "+r"(left));
        work = dst[32];
        asm("" : "+r"(work));
        work |= left;
        asm("" : "+r"(work));
        dst[16] = work;
        dst++;
        src++;
        asm("" : "+r"(dst), "+r"(src));
    } while ((int)--count >= 0);
}
