#include "global.h"
#include "variables.h"
#include "functions.h"
#include "uiutils.h"
#include "hardware.h"
#include "proc.h"
#include "bmlib.h"

struct Struct8012F98 {
    u8* dst;
    int unk_04;
};

int Interpolate(int method, int lo, int hi, int x, int x_max)
{
    int deno, dx, base, ret;
    register int _deno asm("r0");

    if (0 == x_max)
        return hi;

    switch (method) {
    case INTERPOLATE_LINEAR:
        deno =(hi - lo) * x;
        ret = lo + Div(deno, x_max);
        break;

    case INTERPOLATE_SQUARE:
        _deno = x * x;
        deno = _deno * (hi - lo);
        ret = lo + Div(deno, x_max * x_max);
        break;

    case INTERPOLATE_CUBIC:
        deno = x * x * x * (hi - lo);
        ret = lo + Div(deno,  x_max * x_max * x_max);
        break;

    case INTERPOLATE_POW4:
        deno = x * x * x * x * (hi - lo);
        ret = lo + Div(deno, x_max * x_max * x_max * x_max);
        break;

    case INTERPOLATE_RSQUARE:
        dx = x_max - x;
        deno = dx * dx * (hi - lo);
        ret = lo + (hi - lo) - Div(deno, x_max * x_max);
        break;
    case INTERPOLATE_RCUBIC:
        dx = x_max - x;
        deno = dx * dx * dx * (hi - lo);
        ret = lo + (hi - lo) - Div(deno, x_max * x_max * x_max);
        break;

    default:
        ret = 0;
    }

    return ret;
}

void sub_8012E94() {}

bool StringCompare(const char *str1, const char *str2)
{
    while (!!(*str1 | *str2))
        if (*str1++ != *str2++)
            return false;

    return true;
}

void CopyString(char *dst, const char *src)
{
    while ('\0' != *src)
        *dst++ = *src++;

    *dst = *src;
}

void UnpackRaw(const void *src, void *dst)
{
    int size = GetDataSize(src) - 4;

    if (0 != size % 32)
        CpuCopy16(src + 4, dst, size);
    else
        CpuFastCopy(src + 4, dst, size);

}

/**
 * This is unused since generic buffer holds only 0x1000 size,
 * which may cause overflow
 */
void DecompressViaGenericBuf(const void *src, void *dst)
{
    LZ77UnCompWram(src, gGenericBuffer);
    CpuFastCopy(gGenericBuffer, dst, GetDataSize(src));
}

void Decompress(const void* src, void* dst)
{
    typedef void (* DecompressFunc)(const void *src, void *dst);

    static CONST_DATA DecompressFunc func_lut[] = {
        UnpackRaw,      // 00, vram
        UnpackRaw,      // 00, wram
        LZ77UnCompVram, // 10, vram
        LZ77UnCompWram, // 10, wram
        HuffUnComp,     // 20, vram
        HuffUnComp,     // 20, wram
        RLUnCompVram,   // 30, vram
        RLUnCompWram,   // 30, wram
    };

    int is_wram;

    if ((((u32) dst) - VRAM) < VRAM_SIZE)
        is_wram = FALSE; // is vram
    else
        is_wram = TRUE;

    func_lut[is_wram + ((((u8 const *) src)[0] & 0xF0) >> 3)](src, dst);
}

int GetDataSize(const void* data)
{
    return *((u32 const *) data) >> 8;
}

void sub_8012F98(struct Struct8012F98 *buf, int arg_1, int arg_2)
{
    buf->dst = (u8 *) arg_2;

    arg_1 = (arg_1 & 0xFFE0) >> 5;
    arg_2 = (arg_2 & 0xFFE0) >> 5;

    buf->unk_04 = arg_2 - arg_1;
}

int sub_8012FB0(struct Struct8012F98 *unk, u8 *src)
{
    int size, old;

    Decompress(src, unk->dst);

    size = GetDataSize(src);

    unk->dst += size;

    old = unk->unk_04;
    unk->unk_04 += size / 0x20;

    return old;
}

int sub_8012FE0(struct Struct8012F98 *buf, int arg_1)
{
    int old;

    buf->dst += arg_1 << 5;

    old = buf->unk_04;
    buf->unk_04 += arg_1;

    return old;
}

void Register2dChrMove(const void* src, void* dst, int width, int height)
{
    int i, line_size = width * CHR_SIZE;

    if (height <= 0)
        return;

    for (i = height; i != 0; --i) {
        RegisterDataMove(src, dst, line_size);

        src += line_size;
        dst += CHR_SIZE * 0x20;
    }
}

void Copy2dChr(const void* src, void* dst, int width, int height)
{
    int i, line_size = width * CHR_SIZE;

    if (height <= 0)
        return;

    for (i = height; i != 0; --i) {
        CpuFastCopy(src, dst, line_size);

        src += line_size;
        dst += CHR_SIZE * 0x20;
    }
}

void ApplyBitmap(const void* src, void* dst, int width, int height)
{
    int i, line_size;

    if (height <= 0)
        return;

    line_size = 8 * 8 * width;

    for (i = height; i != 0; --i) {
        ApplyBitmapLine(src, dst, width);

        src += line_size;
        dst += CHR_SIZE * width;
    }
}

void ApplyBitmapLine(const void *src, void *dst, int width)
{
    int i;

    if (width <= 0)
        return;

    for (i = width; i != 0; i--) {
        ApplyBitmapTile(src, dst, width);

        src += 8;
        dst += CHR_SIZE;
    }
}

void ApplyBitmapTile(const u8 *src, u32 *dst, int width)
{
    int i;

    for (i = 0; i < 8; ++i) {
        u32 value = 0;

        value |= src[7];

        value <<= 4;
        value |= src[6];

        value <<= 4;
        value |= src[5];

        value <<= 4;
        value |= src[4];

        value <<= 4;
        value |= src[3];

        value <<= 4;
        value |= src[2];

        value <<= 4;
        value |= src[1];

        value <<= 4;
        value |= src[0];

        *dst++ = value;
        src += width * 8;
    }
}

void PutAppliedBitmap(u16 * tm, int tileref, int width, int height)
{
    int ix, iy;

    for (iy = 0; iy < height; ++iy)
        for (ix = 0; ix < width; ++ix)
            tm[TILEMAP_INDEX(ix, iy)] = tileref++;
}

void PutDigits(u16 *tm, const u8 *src, int tileref, int len)
{
    int i;

    for (i = 0; i < len; ++i)
        tm[-i] = 0;

    while (*src != ' ')
    {
        *tm-- = tileref + *src - '0';
        src--;
    }
}

void sub_8013168(u16 *dst, u8* src, int a3, int a4, int a5)
{
    register u16 *_dst asm("r4") = dst;

    if (a4 > 0) {
        do {
            *dst-- = 0;
        } while (--a4);
    }

    if (a5) {
        *_dst-- = a3 + 10;
        *_dst = a3 + 10;
    } else {
        while (*src != 32) {
            *_dst = *src + a3 - 48;
            --_dst;
            --src;
        }
    }
}

struct Unk_80131A8
{
    /* 00 */ STRUCT_PAD(0x0, 0x4C);
    /* 4C */ u16 unk_4C;
};

void sub_80131A8(struct Unk_80131A8 *unk, int value)
{
    unk->unk_4C = value;
}

void sub_80131B0(struct Unk_80131A8 *unk)
{
    unk->unk_4C++;
    unk->unk_4C &= 0x7FFF;
}

void sub_80131C4(struct Unk_80131A8 *unk)
{
    unk->unk_4C--;
}

void sub_80131D0(s16 *array)
{
    int i;

    for (i = DISPLAY_HEIGHT-1; i >= 0; --i) {
        *array++ = DISPLAY_WIDTH;
        *array++ = -1;
    }
}

#define _SWAP(a, b) \
do {                \
    tmp = a;        \
    a = b;          \
    b = tmp;        \
} while (0)

void sub_80131F0(s16 *buf, int x1, int y1, int x2, int y2)
{
    int val1, val2;
    int tmp;

    if (y1 > y2) {
        _SWAP(x2, x1);
        _SWAP(y2, y1);
    }

    val1 = ((x2 - x1) << 0x10) / (y2 - y1);
    val2 = x1 << 0x10;

    if (y2 > DISPLAY_HEIGHT)
        y2 = DISPLAY_HEIGHT;

    if (y1 < 0) {
        val2 += val1 * -y1;
        y1 = 0;
    }

    for (; y1 < y2; y1++) {
        register int val asm("r3") = val2 >> 0x10;
        LIMIT_AREA(val, 0, 240);

        if (buf[2 * y1 + 0] > val)
            buf[2 * y1 + 0] = val;

        if (buf[2 * y1 + 1] < val)
            buf[2 * y1 + 1] = val;
        asm(""::"r"(buf + 2 * y1));
        val2 += val1;
    }
}

#undef _SWAP

struct Unk
{
    short a, b;
};

struct Unk *sub_8013278(int arg_0)
{
    #define BUF ((struct Unk *) gGenericBuffer)

    int r2;
    int sb;
    int sp_00;

    sp_00 = arg_0;

    if (sp_00 > 80)
        sp_00 = 80;

    r2 = arg_0;

    for (sb = 0; r2 >= sb; ++sb)
    {
        u16 sp_18, r4, r3, r1;

        sp_18 = sp_00 + sb;

        if (sp_18 < DISPLAY_HEIGHT)
            BUF[sp_00 + sb].b = r2;

        r4 = sp_00 - sb;

        if (r4 < DISPLAY_HEIGHT)
            BUF[sp_00 - sb].b = r2;

        r3 = sp_00 + r2;

        if (r3 < DISPLAY_HEIGHT)
            BUF[sp_00 + r2].b = sb;

        r1 = sp_00 - r2;

        if (r1 < DISPLAY_HEIGHT)
            BUF[sp_00 - r2].b = sb;

        if (sp_18 < DISPLAY_HEIGHT)
            BUF[sp_00 + sb].a = -r2;

        if (r4 < DISPLAY_HEIGHT)
            BUF[sp_00 - sb].a = -r2;

        if (r3 < DISPLAY_HEIGHT)
            BUF[sp_00 + r2].a = -sb;

        if (r1 < DISPLAY_HEIGHT)
            BUF[sp_00 - r2].a = -sb;

        arg_0 = arg_0 - (sb*2 - 1);

        if (arg_0 < 0)
        {
            arg_0 = arg_0 + (r2 - 1)*2;
            r2--;
        }
    }

    return BUF;

    #undef BUF
}

void DarkenPals(int reduction)
{
    u16 * buf = (u16 *) gGenericBuffer;

    int i;

    for (i = 0; i < 0x200; ++i)
    {
        int color = gPaletteBuffer[i];

        if ((color & 0x001F) >= RGB(reduction, 0, 0))
            color -= RGB(reduction, 0, 0);
        else
            color = color & 0xFFE0;

        if ((color & 0x03E0) >= RGB(0, reduction, 0))
            color -= RGB(0, reduction, 0);
        else
            color = color & 0xFC1F;

        if ((color & 0x7C00) >= RGB(0, 0, reduction))
            color -= RGB(0, 0, reduction);
        else
            color = color & 0x03FF;

        buf[i] = color;
    }

    DisablePaletteSync();
    RegisterDataMove(buf, (void*)PLTT, 0x400);
}

void sub_8013428()
{
    return;
}

void sub_801342C(const char *_str)
{
    char str[] = "@@LWFOVDBK@@";
    sub_801342C(str);
}

struct PalFadeSt *GetPalFadeSt()
{
    return (void *)sPalFadeSt;
}

void SetPalFadeStClkEnd(int end1, int end2, int end3)
{
    SetPalFadeStClkEnd1(end1);
    SetPalFadeStClkEnd2(end2);
    SetPalFadeStClkEnd3(end3);
}

void SetPalFadeStClkEnd1(int end)
{
    GetPalFadeSt()[0].clock_end = end;
}

void SetPalFadeStClkEnd2(int end)
{
    GetPalFadeSt()[1].clock_end = end;
}

void SetPalFadeStClkEnd3(int end)
{
    GetPalFadeSt()[2].clock_end = end;
}

int GetPalFadeStClkEnd1()
{
    return GetPalFadeSt()[0].clock_end;
}

int GetPalFadeStClkEnd2()
{
    return GetPalFadeSt()[1].clock_end;
}

int GetPalFadeStClkEnd3()
{
    return GetPalFadeSt()[2].clock_end;
}

void ArchiveCurrentPalettes()
{
    int i, j;
    u16 *dst = (void *)GetPalFadeSt();
    u16 *src = gPaletteBuffer;

    for (i = 0; i < 32; i++) {
        for (j = 0; j < 16; j++)
            dst[j] = *src++;

        dst += 24;
    }

    SetPalFadeStClkEnd1(0x100);
    SetPalFadeStClkEnd2(0x100);
    SetPalFadeStClkEnd3(0x100);
}

void ArchivePalette(int index)
{
    int i;
    struct PalFadeSt *dst = GetPalFadeSt();
    u16 *src = &gPaletteBuffer[0x10 * index];

    for (i = 0; i < 16; i++)
        dst[index].from_colors[i] = *src++;
}
