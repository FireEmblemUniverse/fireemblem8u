/* Standalone reconstruction, not yet integrated. PutOamLo enters the same
 * machine-code body after selecting its output cursor; this fixture initially
 * investigates the high entry. Counts are unsigned 16-bit, including 0x8000.
 * Caller supplies readable triples and room for count eight-byte OAM entries.
 */
typedef unsigned int u32;
typedef unsigned short u16;
extern u16 *gOamHiPutIt;
void PutOamHi(u32 xArg, u32 yArg, const u16 *listArg, u32 oam2)
{
    register u32 xy asm("r0") = xArg;
    register u32 value asm("r1") = yArg;
    register const u16 *src asm("r2") = listArg;
    register u32 count asm("r4");
    register u16 *dst asm("r5");
    register u32 attr asm("r6");
    register u16 **cursor asm("r7") = &gOamHiPutIt;
    register u32 low asm("r7");
    asm("" : "+r"(cursor));
    dst = *cursor;
    asm("" : "+r"(dst));
    count = *src;
    asm("" : "+r"(count));
    if (count == 0) goto end;
    asm("" : : "r"(count));
    if ((int)count < 0) goto end;
    src++;
    asm("" : "+r"(src));
    attr = (u32)dst + count * 8;
    asm("" : "+r"(attr));
    *cursor = (u16 *)attr;
    low = 0x10000;
    asm("" : "+r"(low));
    low--;
    asm("" : "+r"(low));
    xy &= low;
    asm("" : "+r"(xy));
    value &= low;
    asm("" : "+r"(value));
    xy |= value << 16;
    asm("" : "+r"(xy));
    do {
        value = src[0];
        asm("" : "+r"(value));
        attr = (value | (xy >> 16)) & 0xff00;
        asm("" : "+r"(attr));
        low = value + (xy >> 16);
        asm("" : "+r"(low));
        low &= 255;
        asm("" : "+r"(low));
        attr |= low;
        asm("" : "+r"(attr));
        dst[0] = attr;
        value = src[1];
        asm("" : "+r"(value));
        attr = (value | xy) & 0xfe00;
        asm("" : "+r"(attr));
        low = value + xy;
        asm("" : "+r"(low));
        low &= 511;
        asm("" : "+r"(low));
        attr |= low;
        asm("" : "+r"(attr));
        dst[1] = attr;
        value = src[2];
        asm("" : "+r"(value));
        attr = value + oam2;
        asm("" : "+r"(attr));
        dst[2] = attr;
        src += 3;
        dst += 4;
        asm("" : "+r"(src), "+r"(dst));
    } while (--count != 0);
end:
    asm("" : : "r"(xy), "r"(value), "r"(src), "r"(count));
}
