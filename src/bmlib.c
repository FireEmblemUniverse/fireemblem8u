#include "global.h"
#include "variables.h"
#include "functions.h"
#include "uiutils.h"
#include "hardware.h"
#include "proc.h"
#include "bm.h"
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

#if NONMATCHING

void WriteFadedPaletteFromArchive(int a1, int a2, int a3, u32 mask)
{
    int i, j;
    u32 color_mask;
    u16 *buf;
    struct PalFadeSt *st;

    SetPalFadeStClkEnd1(a1);
    SetPalFadeStClkEnd2(a2);
    SetPalFadeStClkEnd1(a3);

    st = GetPalFadeSt();

    if (a1 > 0x100) {
        a1 = a1 - 0x100;

        for (i = 0; i < 0x20; i++) {
            if ((1 << i) & mask) {
                for (j = 0; j < 0x10; j++)
                    gPaletteBuffer[0x10 * i + j] = 0x1F & RGB(
                        (RED_VALUE(st[i].from_colors[j]) + ((0x1F - RED_VALUE(st[i].from_colors[j])) * a1 >> 8)), 0, 0);
            }
        }
    } else {
        for (i = 0; i < 0x20; i++) {
            if ((1 << i) & mask) {
                for (j = 0; j < 0x10; j++)
                    gPaletteBuffer[0x10 * i + j] = 0x1F & RGB(
                        (RED_VALUE(st[i].from_colors[j]) * a1 >> 8), 0, 0);
            }
        }
    }

    if (a2 > 0x100) {
        a2 = a2 - 0x100;

        for (i = 0; i < 0x20; i++) {
            if ((1 << i) & mask) {
                for (j = 0; j < 0x10; j++)
                    gPaletteBuffer[0x10 * i + j] |= 0x3E0 & RGB(
                        0, (RED_VALUE(st[i].from_colors[j]) + ((0x1F - RED_VALUE(st[i].from_colors[j])) * a2 >> 8)), 0);
            }
        }
    } else {
        for (i = 0; i < 0x20; i++) {
            if ((1 << i) & mask) {
                for (j = 0; j < 0x10; j++)
                    gPaletteBuffer[0x10 * i + j] |= 0x3E0 & RGB(
                        0, (RED_VALUE(st[i].from_colors[j]) * a2 >> 8), 0);
            }
        }
    }

    if (a3 > 0x100) {
        a3 = a3 - 0x100;

        for (i = 0; i < 0x20; i++) {
            if ((1 << i) & mask) {
                for (j = 0; j < 0x10; j++) {
                    gPaletteBuffer[0x10 * i + j] |= 0x7C00 & RGB(
                        0, 0, RED_VALUE(RED_VALUE(st[i].from_colors[j]) + ((0x1F - RED_VALUE(st[i].from_colors[j])) * a3 >> 8)));
            
                }
            }
        }
    } else {
        for (i = 0; i < 0x20; i++) {
            if ((1 << i) & mask) {
                for (j = 0; j < 0x10; j++)
                    gPaletteBuffer[0x10 * i + j] |= 0x7C00 & RGB(
                        0, 0, (RED_VALUE(st[i].from_colors[j]) * a3 >> 8));
            }
        }
    }

    EnablePaletteSync();
}

#else

__attribute__((naked))
void WriteFadedPaletteFromArchive(int red, int green, int blue, u32 mask)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #4\n\
        adds r7, r0, #0\n\
        mov r8, r1\n\
        str r2, [sp]\n\
        mov sl, r3\n\
        bl SetPalFadeStClkEnd1\n\
        mov r0, r8\n\
        bl SetPalFadeStClkEnd2\n\
        ldr r0, [sp]\n\
        bl SetPalFadeStClkEnd3\n\
        bl GetPalFadeSt\n\
        mov r9, r0\n\
        movs r0, #0x80\n\
        lsls r0, r0, #1\n\
        cmp r7, r0\n\
        ble _080135D4\n\
        ldr r0, _080135CC  @ 0xFFFFFF00\n\
        adds r7, r7, r0\n\
        movs r5, #0\n\
        mov ip, r5\n\
    _0801358A:\n\
        movs r0, #1\n\
        lsls r0, r5\n\
        mov r1, sl\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _080135C0\n\
        movs r4, #0\n\
        movs r6, #0x1f\n\
        mov r3, ip\n\
        add r3, r9\n\
        lsls r0, r5, #5\n\
        ldr r1, _080135D0  @ gPaletteBuffer\n\
        adds r2, r0, r1\n\
    _080135A4:\n\
        ldrh r0, [r3]\n\
        adds r1, r6, #0\n\
        ands r1, r0\n\
        subs r0, r6, r1\n\
        muls r0, r7, r0\n\
        asrs r0, r0, #8\n\
        adds r1, r1, r0\n\
        ands r1, r6\n\
        strh r1, [r2]\n\
        adds r3, #2\n\
        adds r2, #2\n\
        adds r4, #1\n\
        cmp r4, #0xf\n\
        ble _080135A4\n\
    _080135C0:\n\
        movs r0, #0x30\n\
        add ip, r0\n\
        adds r5, #1\n\
        cmp r5, #0x1f\n\
        ble _0801358A\n\
        b _08013614\n\
        .align 2, 0\n\
    _080135CC: .4byte 0xFFFFFF00\n\
    _080135D0: .4byte gPaletteBuffer\n\
    _080135D4:\n\
        movs r5, #0\n\
        mov ip, r5\n\
    _080135D8:\n\
        movs r0, #1\n\
        lsls r0, r5\n\
        mov r1, sl\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _0801360A\n\
        movs r4, #0\n\
        movs r6, #0x1f\n\
        mov r3, ip\n\
        add r3, r9\n\
        lsls r0, r5, #5\n\
        ldr r1, _08013670  @ gPaletteBuffer\n\
        adds r2, r0, r1\n\
    _080135F2:\n\
        ldrh r1, [r3]\n\
        adds r0, r6, #0\n\
        ands r0, r1\n\
        muls r0, r7, r0\n\
        asrs r0, r0, #8\n\
        ands r0, r6\n\
        strh r0, [r2]\n\
        adds r3, #2\n\
        adds r2, #2\n\
        adds r4, #1\n\
        cmp r4, #0xf\n\
        ble _080135F2\n\
    _0801360A:\n\
        movs r0, #0x30\n\
        add ip, r0\n\
        adds r5, #1\n\
        cmp r5, #0x1f\n\
        ble _080135D8\n\
    _08013614:\n\
        movs r0, #0x80\n\
        lsls r0, r0, #1\n\
        cmp r8, r0\n\
        ble _08013678\n\
        ldr r1, _08013674  @ 0xFFFFFF00\n\
        add r8, r1\n\
        movs r5, #0\n\
        mov ip, r5\n\
    _08013624:\n\
        movs r0, #1\n\
        lsls r0, r5\n\
        mov r7, sl\n\
        ands r0, r7\n\
        cmp r0, #0\n\
        beq _08013664\n\
        movs r4, #0\n\
        movs r6, #0xf8\n\
        lsls r6, r6, #2\n\
        mov r3, ip\n\
        add r3, r9\n\
        lsls r0, r5, #5\n\
        ldr r1, _08013670  @ gPaletteBuffer\n\
        adds r2, r0, r1\n\
    _08013640:\n\
        ldrh r1, [r3]\n\
        adds r0, r6, #0\n\
        ands r0, r1\n\
        subs r1, r6, r0\n\
        mov r7, r8\n\
        muls r7, r1, r7\n\
        adds r1, r7, #0\n\
        asrs r1, r1, #8\n\
        adds r0, r0, r1\n\
        ands r0, r6\n\
        ldrh r1, [r2]\n\
        orrs r0, r1\n\
        strh r0, [r2]\n\
        adds r3, #2\n\
        adds r2, #2\n\
        adds r4, #1\n\
        cmp r4, #0xf\n\
        ble _08013640\n\
    _08013664:\n\
        movs r0, #0x30\n\
        add ip, r0\n\
        adds r5, #1\n\
        cmp r5, #0x1f\n\
        ble _08013624\n\
        b _080136C0\n\
        .align 2, 0\n\
    _08013670: .4byte gPaletteBuffer\n\
    _08013674: .4byte 0xFFFFFF00\n\
    _08013678:\n\
        movs r5, #0\n\
        movs r7, #0\n\
    _0801367C:\n\
        movs r0, #1\n\
        lsls r0, r5\n\
        mov r1, sl\n\
        ands r0, r1\n\
        cmp r0, #0\n\
        beq _080136B8\n\
        movs r4, #0\n\
        movs r6, #0xf8\n\
        lsls r6, r6, #2\n\
        mov r0, r9\n\
        adds r3, r7, r0\n\
        lsls r0, r5, #5\n\
        ldr r1, _08013720  @ gPaletteBuffer\n\
        adds r2, r0, r1\n\
    _08013698:\n\
        ldrh r1, [r3]\n\
        adds r0, r6, #0\n\
        ands r0, r1\n\
        mov r1, r8\n\
        muls r1, r0, r1\n\
        adds r0, r1, #0\n\
        asrs r0, r0, #8\n\
        ands r0, r6\n\
        ldrh r1, [r2]\n\
        orrs r0, r1\n\
        strh r0, [r2]\n\
        adds r3, #2\n\
        adds r2, #2\n\
        adds r4, #1\n\
        cmp r4, #0xf\n\
        ble _08013698\n\
    _080136B8:\n\
        adds r7, #0x30\n\
        adds r5, #1\n\
        cmp r5, #0x1f\n\
        ble _0801367C\n\
    _080136C0:\n\
        movs r0, #0x80\n\
        lsls r0, r0, #1\n\
        ldr r5, [sp]\n\
        cmp r5, r0\n\
        ble _08013728\n\
        ldr r7, _08013724  @ 0xFFFFFF00\n\
        adds r5, r5, r7\n\
        str r5, [sp]\n\
        movs r5, #0\n\
    _080136D2:\n\
        movs r0, #1\n\
        lsls r0, r5\n\
        mov r1, sl\n\
        ands r0, r1\n\
        adds r7, r5, #1\n\
        cmp r0, #0\n\
        beq _08013718\n\
        movs r4, #0\n\
        lsls r0, r5, #1\n\
        adds r0, r0, r5\n\
        lsls r0, r0, #4\n\
        movs r6, #0xf8\n\
        lsls r6, r6, #7\n\
        mov r1, r9\n\
        adds r3, r0, r1\n\
        lsls r0, r5, #5\n\
        ldr r5, _08013720  @ gPaletteBuffer\n\
        adds r2, r0, r5\n\
    _080136F6:\n\
        ldrh r1, [r3]\n\
        adds r0, r6, #0\n\
        ands r0, r1\n\
        subs r1, r6, r0\n\
        ldr r5, [sp]\n\
        muls r1, r5, r1\n\
        asrs r1, r1, #8\n\
        adds r0, r0, r1\n\
        ands r0, r6\n\
        ldrh r1, [r2]\n\
        orrs r0, r1\n\
        strh r0, [r2]\n\
        adds r3, #2\n\
        adds r2, #2\n\
        adds r4, #1\n\
        cmp r4, #0xf\n\
        ble _080136F6\n\
    _08013718:\n\
        adds r5, r7, #0\n\
        cmp r5, #0x1f\n\
        ble _080136D2\n\
        b _08013772\n\
        .align 2, 0\n\
    _08013720: .4byte gPaletteBuffer\n\
    _08013724: .4byte 0xFFFFFF00\n\
    _08013728:\n\
        movs r5, #0\n\
    _0801372A:\n\
        movs r0, #1\n\
        lsls r0, r5\n\
        mov r7, sl\n\
        ands r0, r7\n\
        adds r7, r5, #1\n\
        cmp r0, #0\n\
        beq _0801376C\n\
        movs r4, #0\n\
        lsls r0, r5, #1\n\
        adds r0, r0, r5\n\
        lsls r0, r0, #4\n\
        movs r6, #0xf8\n\
        lsls r6, r6, #7\n\
        mov r1, r9\n\
        adds r3, r0, r1\n\
        lsls r0, r5, #5\n\
        ldr r5, _08013788  @ gPaletteBuffer\n\
        adds r2, r0, r5\n\
    _0801374E:\n\
        ldrh r1, [r3]\n\
        adds r0, r6, #0\n\
        ands r0, r1\n\
        ldr r1, [sp]\n\
        muls r0, r1, r0\n\
        asrs r0, r0, #8\n\
        ands r0, r6\n\
        ldrh r1, [r2]\n\
        orrs r0, r1\n\
        strh r0, [r2]\n\
        adds r3, #2\n\
        adds r2, #2\n\
        adds r4, #1\n\
        cmp r4, #0xf\n\
        ble _0801374E\n\
    _0801376C:\n\
        adds r5, r7, #0\n\
        cmp r5, #0x1f\n\
        ble _0801372A\n\
    _08013772:\n\
        bl EnablePaletteSync\n\
        add sp, #4\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _08013788: .4byte gPaletteBuffer\n\
        .syntax divided\n\
    ");
}

#endif

struct Proc8599FD4 {
    PROC_HEADER;

    int unk2C, unk30, unk34, unk38, unk3C, unk40, unk44, unk48, unk4C;
};

void sub_801378C(struct Proc8599FD4 *proc)
{
    proc->unk44 = 0;
}

void sub_8013794(struct Proc8599FD4 *proc)
{
    int val = proc->unk44 + proc->unk48;

    proc->unk44 = val;

    WriteFadedPaletteFromArchive(
        (proc->unk2C * (0x100 - val) + proc->unk38 * val) / 0x100,
        (proc->unk30 * (0x100 - val) + proc->unk3C * val) / 0x100,
        (proc->unk34 * (0x100 - val) + proc->unk40 * val) / 0x100,
        proc->unk4C
    );

    if (proc->unk44 == 0x100)
        Proc_Break(proc);
}

CONST_DATA struct ProcCmd gUnknown_08599FD4[] = {
    PROC_YIELD,
    PROC_CALL(sub_801378C),
    PROC_REPEAT(sub_8013794),
    PROC_END
};

void sub_8013800(int a, int b, int c, int d, int e, int f, int g, int h, ProcPtr parent)
{
    struct Proc8599FD4 *proc = Proc_Start(gUnknown_08599FD4, parent);

    proc->unk2C = a;
    proc->unk30 = b;
    proc->unk34 = c;
    proc->unk38 = d;
    proc->unk3C = e;
    proc->unk40 = f;
    proc->unk48 = h;
    proc->unk4C = g;
}

bool sub_8013844(void)
{
    if (Proc_Find(gUnknown_08599FD4) != NULL)
        return true;

    return false;
}

struct ProcSpacialSeTest {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x64);
    /* 64 */ short unk64;
    /* 66 */ short unk66;
};

void SpacialSeTest_OnInit(struct ProcSpacialSeTest *proc)
{
    proc->unk64 = 0;
    proc->unk66 = 90;
}

void SpacialSeTest_OnLoop(struct ProcSpacialSeTest * proc)
{
    int location = 0;

    if (gKeyStatusPtr->newKeys & A_BUTTON)
        proc->unk66++;

    if (((proc->unk64++) & 0x0F) == 0)
    {
        if (gKeyStatusPtr->heldKeys & DPAD_LEFT)
            location = -proc->unk66;

        if (gKeyStatusPtr->heldKeys & DPAD_RIGHT)
            location = +proc->unk66;

        PlaySeSpacial(0x9A, location);
    }
}

struct ProcCmd CONST_DATA ProcScr_SpacialSeTest[] = {
    PROC_CALL(LockGame),

    PROC_CALL(SpacialSeTest_OnInit),
    PROC_REPEAT(SpacialSeTest_OnLoop),
};

void StartSpacialSeTest(void)
{
    Proc_Start(ProcScr_SpacialSeTest, PROC_TREE_3);
}

void sub_80138EC(void)
{
    return;
}

void StartPalFadeToBlack(int palid, int duration, ProcPtr parent)
{
    StartPalFade(Pal_AllBlack, palid, duration, parent);
}

void StartPalFadeToWhite(int palid, int duration, ProcPtr parent)
{
    StartPalFade(Pal_AllWhite, palid, duration, parent);
}

struct PalFadeProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct PalFadeSt * st;
};

void PalFade_OnLoop(struct PalFadeProc *proc);

struct ProcCmd CONST_DATA ProcScr_PalFade[] =
{
    PROC_MARK(0xA),
    PROC_REPEAT(PalFade_OnLoop),

    PROC_END,
};

struct PalFadeSt *StartPalFade(u16 const *colors, int pal, int duration, ProcPtr parent)
{
    struct PalFadeSt * st = sPalFadeSt + pal;
    struct PalFadeProc * proc = Proc_Start(ProcScr_PalFade, parent);

    CpuCopy16(gPaletteBuffer + pal * 0x10, st->from_colors, sizeof(st->from_colors));

    st->pal = gPaletteBuffer + pal * 0x10;
    st->to_colors = colors;
    st->clock = 0;
    st->clock_end = duration;
    st->clock_stop = duration + 1;

    proc->st = st;
    return st;
}

void EndPalFade(void)
{
    Proc_EndEach(ProcScr_PalFade);
}

void SetPalFadeStop(struct PalFadeSt * st, int val)
{
    st->clock_stop = val;
}

void PalFade_OnLoop(struct PalFadeProc * proc)
{
    int i;

    u16 const * from_colors = proc->st->from_colors;
    u16 const * to_colors = proc->st->to_colors;

    u16 * pal = proc->st->pal;

    if (proc->st->clock == proc->st->clock_stop || proc->st->clock > proc->st->clock_end)
    {
        Proc_End(proc);
        return;
    }

    for (i = 0; i < 0x10; ++i)
    {
        int red_a   = from_colors[i] & 0x001F;
        int green_a = from_colors[i] & 0x03E0;
        int blue_a  = from_colors[i] & 0x7C00;

        int red_b   = to_colors[i] & 0x001F;
        int green_b = to_colors[i] & 0x03E0;
        int blue_b  = to_colors[i] & 0x7C00;

        int red   = Interpolate(INTERPOLATE_LINEAR, red_a,   red_b,   proc->st->clock, proc->st->clock_end);
        int green = Interpolate(INTERPOLATE_LINEAR, green_a, green_b, proc->st->clock, proc->st->clock_end);
        int blue  = Interpolate(INTERPOLATE_LINEAR, blue_a,  blue_b,  proc->st->clock, proc->st->clock_end);

        pal[i] = (blue & 0x7C00) | (green & 0x03E0) | (red & 0x001F);
    }

    EnablePaletteSync();
    proc->st->clock++;
}

void SetBlackPal(int palid)
{
    CpuCopy16(Pal_AllBlack, gPaletteBuffer + palid * 0x10, 0x20);
}

void SetWhitePal(int palid)
{
    CpuCopy16(Pal_AllWhite, gPaletteBuffer + palid * 0x10, 0x20);
}

void SetAllBlackPals(void)
{
    int i;

    for (i = 0; i < 0x20; ++i)
        SetBlackPal(i);
}

void SetAllWhitePals(void)
{
    int i;

    for (i = 0; i < 0x20; ++i)
        SetBlackPal(i);
}

void FadeToBlack_OnInit(struct Proc *proc)
{
    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.win1_enableBlend = 1;
    gLCDControlBuffer.wincnt.wobj_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    SetSpecialColorEffectsParameters(3, 0, 0, 0);

    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendBackdropA(1);

    proc->unk64 = 0x10;
    proc->unk66 = 0;
}

void FadeToCommon_OnLoop(struct Proc *proc)
{
    if (gLCDControlBuffer.blendY == 0x10)
    {
        Proc_End(proc);
        return;
    }

    proc->unk66 += proc->unk64;

    if (proc->unk66 >= 0x100)
        proc->unk66 = 0x100;

    gLCDControlBuffer.blendY = proc->unk66 >> 4;
}

void FadeFromBlack_OnInit(struct Proc * proc)
{
    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.win1_enableBlend = 1;
    gLCDControlBuffer.wincnt.wobj_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    SetSpecialColorEffectsParameters(3, 0, 0, 0x10);

    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendTargetB(1, 1, 1, 1, 1);
    SetBlendBackdropA(1);

    proc->unk64 = 0x10;
    proc->unk66 = 0x100;
}

void FadeFromCommon_OnLoop(struct Proc *proc)
{
    if (gLCDControlBuffer.blendY == 0) {
        Proc_End(proc);
        return;
    }

    proc->unk66 -= proc->unk64;

    if (proc->unk66 <= 0)
        proc->unk66 = 0;

    gLCDControlBuffer.blendY = proc->unk66 >> 4;
}

void FadeToWhite_OnInit(struct Proc *proc)
{
    FadeToBlack_OnInit(proc);
    SetSpecialColorEffectsParameters(2, 0, 0, 0);
}

void FadeFromWhite_OnInit(struct Proc * proc)
{
    FadeFromBlack_OnInit(proc);
    SetSpecialColorEffectsParameters(2, 0, 0, 0x10);
}

struct ProcCmd CONST_DATA ProcScr_FadeToBlack[] =
{
    PROC_CALL(FadeToBlack_OnInit),
    PROC_SLEEP(0),

    PROC_REPEAT(FadeToCommon_OnLoop),
    PROC_BLOCK,
};

struct ProcCmd CONST_DATA ProcScr_FadeFromBlack[] =
{
    PROC_CALL(FadeFromBlack_OnInit),
    PROC_SLEEP(0),

    PROC_REPEAT(FadeFromCommon_OnLoop),
    PROC_BLOCK,
};

struct ProcCmd CONST_DATA ProcScr_FadeToWhite[] =
{
    PROC_CALL(FadeToWhite_OnInit),
    PROC_SLEEP(0),

    PROC_REPEAT(FadeToCommon_OnLoop),
    PROC_BLOCK,
};

struct ProcCmd CONST_DATA ProcScr_FadeFromWhite[] =
{
    PROC_CALL(FadeFromWhite_OnInit),
    PROC_SLEEP(0),

    PROC_REPEAT(FadeFromCommon_OnLoop),
    PROC_BLOCK,
};

bool FadeExists(void)
{
    if (!Proc_Find(ProcScr_FadeFromBlack) &&
        !Proc_Find(ProcScr_FadeToBlack) &&
        !Proc_Find(ProcScr_FadeFromWhite) &&
        !Proc_Find(ProcScr_FadeToWhite)) {
        return false;
    }

    return true;
}

void StartFadeToBlack(int q4_speed)
{
    struct Proc * proc = Proc_Start(ProcScr_FadeToBlack, PROC_TREE_3);
    proc->unk64 = q4_speed;
}

void StartFadeFromBlack(int q4_speed)
{
    struct Proc * proc = Proc_Start(ProcScr_FadeFromBlack, PROC_TREE_3);
    proc->unk64 = q4_speed;
}

void StartLockingFadeToBlack(int q4_speed, ProcPtr parent)
{
    struct Proc * proc = Proc_StartBlocking(ProcScr_FadeToBlack, parent);
    proc->unk64 = q4_speed;
}

void StartLockingFadeFromBlack(int q4_speed, ProcPtr parent)
{
    struct Proc * proc = Proc_StartBlocking(ProcScr_FadeFromBlack, parent);
    proc->unk64 = q4_speed;
}

void StartLockingFadeToWhite(int q4_speed, ProcPtr parent)
{
    struct Proc * proc = Proc_StartBlocking(ProcScr_FadeToWhite, parent);
    proc->unk64 = q4_speed;
}

void StartLockingFadeFromWhite(int q4_speed, ProcPtr parent)
{
    struct Proc * proc = Proc_StartBlocking(ProcScr_FadeFromWhite, parent);
    proc->unk64 = q4_speed;
}

void StartMidFadeToBlack(void)
{
    StartFadeToBlack(0x10);
}

void StartSlowFadeToBlack(void)
{
    StartFadeToBlack(0x04);
}

void StartFastFadeToBlack(void)
{
    StartFadeToBlack(0x40);
}

void StartMidFadeFromBlack(void)
{
    StartFadeFromBlack(0x10);
}

void StartSlowFadeFromBlack(void)
{
    StartFadeFromBlack(0x04);
}

void StartFastFadeFromBlack(void)
{
    StartFadeFromBlack(0x40);
}

void StartMidLockingFadeToBlack(ProcPtr parent)
{
    StartLockingFadeToBlack(0x10, parent);
}

void StartSlowLockingFadeToBlack(ProcPtr parent)
{
    StartLockingFadeToBlack(0x04, parent);
}

void StartFastLockingFadeToBlack(ProcPtr parent)
{
    StartLockingFadeToBlack(0x40, parent);
}

void StartMidLockingFadeFromBlack(ProcPtr parent)
{
    StartLockingFadeFromBlack(0x10, parent);
}

void StartSlowLockingFadeFromBlack(ProcPtr parent)
{
    StartLockingFadeFromBlack(0x04, parent);
}

void StartFastLockingFadeFromBlack(ProcPtr parent)
{
    StartLockingFadeFromBlack(0x40, parent);
}

void StartSlowLockingFadeToWhite(ProcPtr parent)
{
    StartLockingFadeToWhite(0x04, parent);
}

void StartSlowLockingFadeFromWhite(ProcPtr parent)
{
    StartLockingFadeFromWhite(0x04, parent);
}

void sub_8013E30(ProcPtr parent)
{
    StartFadeCore(1, 0x04, parent, sub_80141B0);
}

void sub_8013E48(ProcPtr parent)
{
    StartFadeCore(1, 0x08, parent, sub_80141B0);
}

void sub_8013E60(ProcPtr parent)
{
    StartFadeCore(1, 0x10, parent, sub_80141B0);
}

void sub_8013E78(ProcPtr parent)
{
    StartFadeCore(1, 0x20, parent, sub_80141B0);
}

void sub_8013E90(ProcPtr parent)
{
    StartFadeCore(1, 0x40, parent, sub_80141B0);
}

void sub_8013EA8(ProcPtr parent)
{
    StartFadeCore(0, 0x08, parent, NULL);
}

void sub_8013EBC(ProcPtr parent)
{
    StartFadeCore(0, 0x10, parent, NULL);
}

void sub_8013ED0(ProcPtr parent)
{
    StartFadeCore(0, 0x20, parent, NULL);
}

void sub_8013EE4(ProcPtr parent)
{
    StartFadeCore(0, 0x40, parent, NULL);
}

void sub_8013EF8(ProcPtr parent)
{
    StartFadeCore(3, 0x04, parent, sub_80141B0);
}

void sub_8013F10(ProcPtr parent)
{
    StartFadeCore(3, 0x08, parent, sub_80141B0);
}

void sub_8013F28(ProcPtr parent)
{
    StartFadeCore(3, 0x10, parent, sub_80141B0);
}

void sub_8013F40(ProcPtr parent)
{
    StartFadeCore(3, 0x20, parent, sub_80141B0);
}

void sub_8013F58(ProcPtr parent)
{
    StartFadeCore(3, 0x40, parent, sub_80141B0);
}

void sub_8013F70(ProcPtr parent)
{
    StartFadeCore(2, 0x04, parent, NULL);
}

void sub_8013F84(ProcPtr parent)
{
    StartFadeCore(2, 0x08, parent, NULL);
}

void sub_8013F98(ProcPtr parent)
{
    StartFadeCore(2, 0x08, parent, NULL);
    sub_8014170();
}

void sub_8013FB0(ProcPtr parent)
{
    StartFadeCore(2, 0x10, parent, NULL);
}

void sub_8013FC4(ProcPtr parent)
{
    StartFadeCore(2, 0x20, parent, NULL);
}

void sub_8013FD8(ProcPtr parent)
{
    StartFadeCore(2, 0x40, parent, NULL);
}

void sub_8013FEC(ProcPtr parent)
{
    StartFadeCore(6, 0x10, parent, NULL);
}

void sub_8014000(ProcPtr parent)
{
    StartFadeCore(7, 0x10, parent, NULL);
}

void sub_8014014(ProcPtr parent)
{
    StartFadeCore(6, 0x08, parent, NULL);
}

void sub_8014028(ProcPtr parent)
{
    StartFadeCore(4, 0x04, parent, NULL);
}

void sub_801403C(ProcPtr parent)
{
    StartFadeCore(4, 0x08, parent, NULL);
}

void sub_8014050(ProcPtr parent)
{
    StartFadeCore(7, 0x08, parent, sub_801420C);
}

void WaitForFade(ProcPtr proc)
{
    if (!FadeExists())
        Proc_Break(proc);
}

void sub_8014084(ProcPtr parent, void *func)
{
    StartFadeCore(3, 0x40, parent, func);
}

struct FadeKindEnt {
    ProcPtr (* spawn_proc)(const struct ProcCmd* script, ProcPtr parent);
    void (* setup_color_fade)(u8 component_step);
    int unit;
};

struct FadeKindEnt const gUnknown_080D7964[] =
{
    { Proc_Start,         ColorFadeSetupFromBlack,        +1 }, // from black
    { Proc_Start,         ColorFadeSetupFromColorToBlack, -1 }, // to black
    { Proc_StartBlocking, ColorFadeSetupFromBlack,        +1 }, // from black locking
    { Proc_StartBlocking, ColorFadeSetupFromColorToBlack, -1 }, // to black locking
    { Proc_Start,         ColorFadeSetupFromWhite,        -1 }, // from white
    { Proc_Start,         ColorFadeSetupFromColorToWhite, +1 }, // to white
    { Proc_StartBlocking, ColorFadeSetupFromWhite,        -1 }, // from white locking
    { Proc_StartBlocking, ColorFadeSetupFromColorToWhite, +1 }, // to white locking
};

void StartFadeCore(int kind, int speed, ProcPtr parent, void *end_callback)
{
    ProcPtr (* spawn_proc)(struct ProcCmd const * scr, ProcPtr parent);
    void (* setup_color_fade)(s8 component_step);

    struct FadeCoreProc * proc;
    int component_step;

    spawn_proc = gUnknown_080D7964[kind].spawn_proc;
    proc = spawn_proc(ProcScr_FadeCore, parent);

    proc->unk_54 = speed;
    proc->on_end = end_callback;

    component_step = proc->unk_54 >> 4;

    if (component_step == 0)
        component_step = 1;

    // need to cast because parameter types don't match (int vs. i8)
    setup_color_fade = (void *) gUnknown_080D7964[kind].setup_color_fade;
    setup_color_fade(component_step * gUnknown_080D7964[kind].unit);
}

void FadeCoreEndEach(void)
{
    Proc_EndEach(ProcScr_FadeCore);
}

void sub_80140F4(struct FadeCoreProc * proc)
{
    proc->unk_58 = 0;
    proc->unk_5C = 0;
    proc->on_end = NULL;
}

void sub_8014100(struct FadeCoreProc * proc)
{
    if (!sub_8014124(proc)) {
        if (proc->on_end)
            proc->on_end();

        Proc_Break(proc);
    }
}
