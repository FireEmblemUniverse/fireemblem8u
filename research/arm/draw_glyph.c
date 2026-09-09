/* Standalone oracle fixture; production implementation: src/arm/draw_glyph.c.
 * O2 and the ordered pointer pool reproduce all 188 instruction bytes.
 * Only low halfwords of target-specific ARM lookup word loads are retained.
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned long long u64;
extern const u32 bitTable[8];

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
