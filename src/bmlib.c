#include "global.h"
#include "variables.h"
#include "functions.h"
#include "uiutils.h"
#include "hardware.h"
#include "proc.h"
#include "bm.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmlib.h"

struct Struct8012F98 {
    u8* dst;
    int unk_04;
};

int Interpolate(int method, int lo, int hi, int x, int x_max)
{
    int deno, dx, base, ret;
#ifndef NONMATCHING
    register int _deno asm("r0");
#else
    int _deno;
#endif

    if (0 == x_max)
        return hi;

    switch (method) {
    case INTERPOLATE_LINEAR:
        // y = lo + (hi - lo) * x / xmax
        deno =(hi - lo) * x;
        ret = lo + Div(deno, x_max);
        break;

    case INTERPOLATE_SQUARE:
        // y = lo + (hi - lo)^2 * x^2 / xmax^2
        _deno = x * x;
        deno = _deno * (hi - lo);
        ret = lo + Div(deno, x_max * x_max);
        break;

    case INTERPOLATE_CUBIC:
        // y = lo + (hi - lo)^3 * x^3 / xmax^3
        deno = x * x * x * (hi - lo);
        ret = lo + Div(deno,  x_max * x_max * x_max);
        break;

    case INTERPOLATE_POW4:
        // y = lo + (hi - lo)^4 * x^4 / xmax^4
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
    const struct TileMapArr *tsa = src;

    if ((((u32) dst) - VRAM) < VRAM_SIZE)
        is_wram = FALSE; // is vram
    else
        is_wram = TRUE;

    func_lut[is_wram + ((tsa->type & 0xF0) >> 3)](src, dst);
}

int GetDataSize(const void* data)
{
    const struct TileMapArr *tsa = data;
    return tsa->size;
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
#ifndef NONMATCHING
    register u16 *_dst asm("r4") = dst;
#else
    u16 *_dst = dst;
#endif

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
#ifndef NONMATCHING
        register int val asm("r3") = val2 >> 0x10;
        LIMIT_AREA(val, 0, 240);

        if (buf[2 * y1 + 0] > val)
            buf[2 * y1 + 0] = val;

        if (buf[2 * y1 + 1] < val)
            buf[2 * y1 + 1] = val;
        asm(""::"r"(buf + 2 * y1));
#else
        int val = val2 >> 0x10;
        LIMIT_AREA(val, 0, 240);

        if (buf[2 * y1 + 0] > val)
            buf[2 * y1 + 0] = val;

        if (buf[2 * y1 + 1] < val)
            buf[2 * y1 + 1] = val;
#endif

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
    u16 *src = &gPaletteBuffer[PAL_OFFSET(index)];

    for (i = 0; i < 16; i++)
        dst[index].from_colors[i] = *src++;
}

void WriteFadedPaletteFromArchive(int a1, int a2, int a3, u32 mask)
{
    int i, j;
    struct PalFadeSt *st;
    u16 *buffer = gPaletteBuffer;

    SetPalFadeStClkEnd1(a1);
    SetPalFadeStClkEnd2(a2);
    SetPalFadeStClkEnd3(a3);

    st = GetPalFadeSt();

    if (a1 > 0x100) {
        a1 -= 0x100;

        for (i = 0; i < 0x20; i++) {
            if ((1 << i) & mask) {
                for (j = 0; j < 0x10; j++) {
                    u8 r __attribute__((unused)) = st[i].from_colors[j] & 0x1F;
                    buffer[0x10 * i + j] = ((st[i].from_colors[j] & 0x1F) + (((0x1F - (st[i].from_colors[j] & 0x1F)) * a1) >> 8)) & 0x1F;
                }
            }
        }
    } else {
        for (i = 0; i < 0x20; i++) {
            if ((1 << i) & mask) {
                for (j = 0; j < 0x10; j++) {
                    u8 r __attribute__((unused)) = st[i].from_colors[j] & 0x1F;
                    buffer[0x10 * i + j] = (((st[i].from_colors[j] & 0x1F) * a1) >> 8) & 0x1F;
                }
            }
        }
    }

    if (a2 > 0x100) {
        a2 -= 0x100;

        for (i = 0; i < 0x20; i++) {
            if ((1 << i) & mask) {
                for (j = 0; j < 0x10; j++) {
                    u16 g = st[i].from_colors[j] & 0x3E0;
                    buffer[0x10 * i + j] |= 0x3E0 & (g + ((0x3E0 - g) * a2 >> 8));
                }
            }
        }
    } else {
        for (i = 0; i < 0x20; i++) {
            if ((1 << i) & mask) {
                for (j = 0; j < 0x10; j++) {
                    u16 g = st[i].from_colors[j] & 0x3E0;
                    buffer[0x10 * i + j] |= 0x3E0 & (g * a2 >> 8);
                }
            }
        }
    }

    if (a3 > 0x100) {
        a3 -= 0x100;

        for (i = 0; i < 0x20; i++) {
            if ((1 << i) & mask) {
                for (j = 0; j < 0x10; j++) {
                    u16 b = st[i].from_colors[j] & 0x7C00;
                    buffer[0x10 * i + j] |= 0x7C00 & (b + ((0x7C00 - b) * a3 >> 8));
                }
            }
        }
    } else {
        for (i = 0; i < 0x20; i++) {
            if ((1 << i) & mask) {
                for (j = 0; j < 0x10; j++) {
                    u16 b = st[i].from_colors[j] & 0x7C00;
                    buffer[0x10 * i + j] |= 0x7C00 & (b * a3 >> 8);
                }
            }
        }
    }

    EnablePaletteSync();
}

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

struct PalFadeSt * StartPalFade(u16 const *colors, int pal, int duration, ProcPtr parent)
{
    struct PalFadeSt * st = sPalFadeSt + pal;
    struct PalFadeProc * proc = Proc_Start(ProcScr_PalFade, parent);

    CpuCopy16(gPaletteBuffer + PAL_OFFSET(pal), st->from_colors, sizeof(st->from_colors));

    st->pal = gPaletteBuffer + PAL_OFFSET(pal);
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
    CpuCopy16(Pal_AllBlack, gPaletteBuffer + PAL_OFFSET(palid), 0x20);
}

void SetWhitePal(int palid)
{
    CpuCopy16(Pal_AllWhite, gPaletteBuffer + PAL_OFFSET(palid), 0x20);
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

void FadeToBlack_OnInit(struct Proc * proc)
{
    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.win1_enableBlend = 1;
    gLCDControlBuffer.wincnt.wobj_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    SetBlendConfig(3, 0, 0, 0);

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

    SetBlendConfig(3, 0, 0, 0x10);

    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendTargetB(1, 1, 1, 1, 1);
    SetBlendBackdropA(1);

    proc->unk64 = 0x10;
    proc->unk66 = 0x100;
}

void FadeFromCommon_OnLoop(struct Proc * proc)
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
    SetBlendConfig(2, 0, 0, 0);
}

void FadeFromWhite_OnInit(struct Proc * proc)
{
    FadeFromBlack_OnInit(proc);
    SetBlendConfig(2, 0, 0, 0x10);
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

void FadeInBlackSpeed04(ProcPtr parent)
{
    StartFadeCore(2, 0x04, parent, NULL);
}

void FadeInBlackSpeed08(ProcPtr parent)
{
    StartFadeCore(2, 0x08, parent, NULL);
}

void FadeInBlackSpeed08Unk(ProcPtr parent)
{
    StartFadeCore(2, 0x08, parent, NULL);
    sub_8014170();
}

void FadeInBlackSpeed10(ProcPtr parent)
{
    StartFadeCore(2, 0x10, parent, NULL);
}

void FadeInBlackSpeed20(ProcPtr parent)
{
    StartFadeCore(2, 0x20, parent, NULL);
}

void FadeInBlackSpeed40(ProcPtr parent)
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

void sub_8014084(ProcPtr parent, void * func)
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

struct ProcCmd CONST_DATA ProcScr_FadeCore[] = {
    PROC_MARK(10),
    PROC_CALL(FadeCore_Init),
    PROC_YIELD,
    PROC_CALL(FadeCore_Tick),
    PROC_REPEAT(FadeCore_Loop),
    PROC_END,
};

void StartFadeCore(int kind, int speed, ProcPtr parent, void * end_callback)
{
    ProcPtr (* spawn_proc)(struct ProcCmd const * scr, ProcPtr parent);
    void (* setup_color_fade)(s8 component_step);

    struct FadeCoreProc * proc;
    int component_step;

    spawn_proc = gUnknown_080D7964[kind].spawn_proc;
    proc = spawn_proc(ProcScr_FadeCore, parent);

    proc->speed = speed;
    proc->on_end = end_callback;

    component_step = proc->speed >> 4;

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

void FadeCore_Init(struct FadeCoreProc * proc)
{
    proc->looper = 0;
    proc->counter = 0;
    proc->on_end = NULL;
}

void FadeCore_Loop(struct FadeCoreProc * proc)
{
    if (!FadeCore_Tick(proc)) {
        if (proc->on_end)
            proc->on_end();

        Proc_Break(proc);
    }
}

bool FadeCore_Tick(struct FadeCoreProc * proc)
{
    proc->looper += proc->speed;
    proc->counter += proc->speed;

    if (proc->looper < 0x10)
    { 
        if (proc->counter != proc->speed)
            return TRUE;
    }
    else
    {
        proc->looper = proc->looper - 0x10;
    }

    CALLARM_ColorFadeTick();
    SetBackdropColor(0);

    if (proc->counter >= 0x200)
        return FALSE;

    return TRUE;
}

void sub_8014170(void)
{
    sub_800183C(0x10, 0x10, 0);
    sub_8014194();
}

void sub_8014184(int a, int b)
{
    sub_800183C(a, b, 0);
    sub_8014194();
}

void sub_8014194(void)
{
    struct FadeCoreProc * proc = Proc_Find(ProcScr_FadeCore);

    if (proc)
        proc->on_end = NULL;
}

void sub_80141B0(void)
{
    SetBlendDarken(0x10);
    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendBackdropA(1);
    SetBackdropColor(0);
    SetDispEnable(0, 0, 0, 0, 0);
}

void sub_801420C(void)
{
    SetBlendBrighten(0x10);

    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendBackdropA(1);
}

struct ProcCmd CONST_DATA ProcScr_TemporaryLock[] = {
    PROC_YIELD,
    PROC_REPEAT(TemporaryLock_OnLoop),
    PROC_END,
};

void StartTemporaryLock(ProcPtr proc, int duration)
{
    struct Proc * gproc;

    gproc = Proc_StartBlocking(ProcScr_TemporaryLock, proc);
    gproc->unk58 = duration;
}

void TemporaryLock_OnLoop(struct Proc * proc)
{
    if (proc->unk58 == 0)
    {
        Proc_Break(proc);
        return;
    }
    proc->unk58--;
}

char CONST_DATA SJisZero[] = "０";
char CONST_DATA SJisDash[] = "ー";

int NumberToStringSJis(int number, char * buf)
{
    int numOff, numStart;

    numOff = 0;

    if (number == 0)
    {
        *buf++ = SJisZero[0];
        *buf++ = SJisZero[1];
        *buf++ = '\0';

        return 1;
    }

    if (number < 0)
    {
        buf[0] = SJisDash[0];
        buf[1] = SJisDash[1];

        number = -number;
        numOff = 2;
    }

    if (number > 99999)
        numOff += 10;
    else if (number > 9999)
        numOff += 8;
    else if (number > 999)
        numOff += 6;
    else if (number > 99)
        numOff += 4;
    else if (number > 9)
        numOff += 2;

    numStart = numOff;

    while (number > 0)
    {
        int rem = DivRem(number, 10);

        buf[numOff]   = SJisZero[0];
        buf[numOff+1] = SJisZero[1] + rem;

        number = Div(number, 10);
        numOff -= 2;
    }

    *(buf + numStart + 2) = '\0';
    return (numStart >> 1) + 1;
}

char CONST_DATA AsciiZero = '0';
char CONST_DATA AsciiDash = '-';

int NumberToStringAscii(int number, char * buf)
{
    int numOff, numStart;

    numOff = 0;

    if (number == 0)
    {
        buf[0] = AsciiZero;
        buf[1] = '\0';

        return 1;
    }

    if (number < 0)
    {
        *buf++ = AsciiDash;
        number = -number;
    }

    if (number > 99999)
        numOff = 5;
    else if (number > 9999)
        numOff = 4;
    else if (number > 999)
        numOff = 3;
    else if (number > 99)
        numOff = 2;
    else if (number > 9)
        numOff = 1;

    numStart = numOff;

    while (number > 0)
    {
        int rem = DivRem(number, 10);

        buf[numOff] = AsciiZero + rem;

        number = Div(number, 10);
        numOff -= 1;
    }

    *(buf + numStart + 1) = '\0';
    return numStart + 1;
}

static struct Text tmp_text;

struct Text * PutStringCentered(u16 * tm, int color, int width, char const * str)
{
    struct Text * const text = &tmp_text;

    InitText(text, width);

    Text_SetCursor(text, (width * 8 - GetStringTextLen(str) - 1) / 2);
    Text_SetColor(text, color);
    Text_DrawString(text, str);

    PutText(text, tm);

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return text;
}

struct Text * PutString(u16 * tm, int color, char const * str)
{
    struct Text * const text = &tmp_text;

    InitText(text, (GetStringTextLen(str) + 7) / 8);

    Text_SetColor(text, color);
    Text_DrawString(text, str);

    PutText(text, tm);

    return text;
}

struct ProcCmd CONST_DATA ProcScr_PaletteAnimator[] = {
    PROC_REPEAT(PaletteAnimator_Loop),
};

void DeleteAllPaletteAnimator(void)
{
    Proc_EndEach(ProcScr_PaletteAnimator);
}

ProcPtr StartPaletteAnimatorExt(u16 const * colors, int pal_offset, int pal_size, int interval, ProcPtr parent)
{
    struct ProcPaletteAnimator * proc;

    proc = Proc_Start(ProcScr_PaletteAnimator, parent);

    proc->colors = colors;
    proc->palOffset = pal_offset;
    proc->colorCount = pal_size / 2;
    proc->clock = interval;
    proc->clock_end = interval;
    proc->counter = 0;
    proc->reverseOrder = 0;

    return proc;
}

void StartPaletteAnimatorReverse(u16 const * colors, int pal_offset, int pal_size, int interval, ProcPtr parent)
{
    struct ProcPaletteAnimator * proc;
    proc = StartPaletteAnimatorExt(colors, pal_offset, pal_size, interval, parent);
    proc->reverseOrder = false;
}

void StartPaletteAnimatorNormal(u16 const * colors, int pal_offset, int pal_size, int interval, ProcPtr parent)
{
    struct ProcPaletteAnimator * proc;
    proc = StartPaletteAnimatorExt(colors, pal_offset, pal_size, interval, parent);
    proc->reverseOrder = true;
}

void PaletteAnimator_Loop(struct ProcPaletteAnimator * proc)
{
    int colornum;

    proc->clock++;

    if (proc->clock < proc->clock_end)
        return;

    proc->clock = 0;

    colornum = DivRem(proc->counter, proc->colorCount);

    if (proc->reverseOrder)
        colornum = proc->colorCount - colornum - 1;

    CopyToPaletteBuffer(proc->colors + colornum, proc->palOffset, 2*proc->colorCount - 2*colornum);

    if (colornum > 0)
        CopyToPaletteBuffer(proc->colors, proc->palOffset + 2*proc->colorCount - 2*colornum, 2*colornum);

    proc->counter++;
}

void sub_8014560(u16 * tm, int x, int y, u16 tileref, int width, int height)
{
    int ix, iy;

    for (iy = y; iy < y + height; ++iy)
    {
        for (ix = x; ix < x + width; ++ix, ++tileref)
        {
            if ((ix >= 0 && ix < 0x20) && (iy >= 0 && iy < 0x20))
                tm[TILEMAP_INDEX(ix, iy)] = tileref;
        }
    }
}

void sub_80145C8(u16 * tm, int x, int y, u16 tileref, int width, int height, u16 const * src, bool hflip)
{
    int ix, iy;

    u16 const * src_1 = src;

    if (hflip)
    {
        for (iy = 0; iy < height; ++iy)
        {
            for (ix = 0; ix < width; ++ix)
            {
                if ((x+ix >= 0 && x+ix < 0x20) && (y+iy >= 0 && y+iy < 0x20))
                {
                    *(tm + (x + ix) + ((y + iy) * 0x20)) = (*(src_1 + (width - 1 - ix) + (iy * 0x20)) + tileref) ^ TILE_HFLIP;
                }
            }
        }
    }
    else
    {
        for (iy = 0; iy < height; ++iy)
        {
            for (ix = 0; ix < width; ++ix)
            {
                if ((x+ix >= 0 && x+ix < 0x20) && (y+iy >= 0 && y+iy < 0x20))
                {
                    *(tm + (x + ix) + ((y + iy) * 0x20)) = *(src_1 + ix + (iy * 0x20)) + tileref;
                }
            }
        }
    }
}

void sub_80146A0(u16 * tm, int x, int y, u16 tileref, int width, int height, u16 const * src, int arg_7)
{
    int ix, iy;

    u16 const * src_1 = src;

    int r4 = Div(0x20, width);
    int r6 = Div(arg_7, r4);
    int r0 = DivRem(arg_7, r4);

    src_1 = src_1 + (width * r0) + (r6 * height) * 32;

    for (iy = 0; iy < height; ++iy)
    {
        for (ix = 0; ix < width; ++ix)
        {
            if ((x+ix >= 0 && x+ix < 0x20) && (y+iy >= 0 && y+iy < 0x20))
            {
                *(tm + (x + ix) + ((y + iy) * 32)) = *(src_1 + ix + (iy * 32)) + tileref;
            }
        }
    }
}

void sub_801474C(u16 * tm, int x, int y, u16 tileref, int width, int height, u8 const * src, int arg_7)
{
    int ix, iy;
    int r0, r5;

    u16 const * src_1 = (u16 const *) src;

    u16 r9 = *src + 1;

    src_1 = src_1 + 1;

    r5 = Div(r9, width);
    r0 = Div(arg_7, r5);

    src_1 = src_1 + width * (arg_7 - r5 * r0) + ((r0 * height) * 0x20);

    for (iy = 0; iy < height; ++iy)
    {
        for (ix = 0; ix < width; ++ix)
        {
            if ((x+ix >= 0 && x+ix < 0x20) && (y+iy >= 0 && y+iy < 0x20))
            {
                *(tm + (x + ix) + ((y + iy) * 32)) = *(src_1 + ix + (r9 * (height - iy - 1))) + tileref;
            }
        }
    }
}

void sub_8014804(u16 * tm, int x, int y, u32 const * arg_3, u16 tileref)
{
    s16 iy, ix;

    u16 const * r2 = ((u16 const *) arg_3) + 1;

    s16 r9 = 0xFF & (((u32 const *) arg_3)[0] >> 0);
    s16 r3 = 0xFF & (((u32 const *) arg_3)[0] >> 8);

    for (iy = r3; iy >= 0; --iy)
    {
        if ((y + iy >= 0 && y + iy < 0x20))
        {
            u16 * r1 = x + (y + iy) * 32 + tm;

            for (ix = r9; ix >= 0; --ix, r2++, r1++)
            {
                if (x+ix >= 0 && x+ix < 0x20)
                    *(r1) = *r2 + tileref;
            }
        }
    }
}

void CallDelayed_OnLoop(struct CallDelayedProc * proc)
{
    proc->clock--;

    if (proc->clock == -1)
    {
        void (* func)(void) = (void(*)(void)) proc->func;

        func();
        Proc_Break(proc);
    }
}

void CallDelayedArg_OnLoop(struct CallDelayedProc * proc)
{
    proc->clock--;

    if (proc->clock == -1)
    {
        void (* func)(int) = (void(*)(int)) proc->func;

        func(proc->arg);
        Proc_Break(proc);
    }
}

struct ProcCmd CONST_DATA ProcScr_CallDelayed[] = {
    PROC_REPEAT(CallDelayed_OnLoop),
    PROC_END,
};

void CallDelayed(void (* func)(void), int delay)
{
    struct CallDelayedProc * proc = Proc_Start(ProcScr_CallDelayed, PROC_TREE_3);

    proc->func = func;
    proc->clock = delay;
}

struct ProcCmd CONST_DATA ProcScr_CallDelayedArg[] = {
    PROC_REPEAT(CallDelayedArg_OnLoop),
    PROC_END,
};

void CallDelayedArg(void (* func)(int), int arg, int delay)
{
    struct CallDelayedProc * proc = Proc_Start(ProcScr_CallDelayedArg, PROC_TREE_3);

    proc->func = func;
    proc->arg = arg;
    proc->clock = delay;
}

void sub_8014904(u8 * out, int size)
{
    while (size > 0)
    {
        *out++ = 0;
        size--;
    }
}

void sub_801491C(u8 * out, int size, int value)
{
    while (size > 0)
    {
        *out++ = value;
        size--;
    }
}

void sub_8014930(u16 * out, int size, int value)
{
    while (size > 0)
    {
        *out++ = value;
        size--;
    }
}

u16 CONST_DATA Pal_AllBlack[] = { RGB_16TIMES(0,  0,  0)  };
u16 CONST_DATA Pal_AllWhite[] = { RGB_16TIMES(31, 31, 31) };
u16 CONST_DATA Pal_AllRed[]   = { RGB_16TIMES(31, 0,  0)  };
u16 CONST_DATA Pal_AllGreen[] = { RGB_16TIMES(0,  31, 0)  };
u16 CONST_DATA Pal_AllBlue[]  = { RGB_16TIMES(0,  0,  31) };
u16 CONST_DATA Pal_AllYellow[] = { RGB_16TIMES(30, 31, 1)  };

struct ProcCmd CONST_DATA ProcScr_PartialGameLock[] = {
    PROC_REPEAT(PartialGameLock_OnLoop),
    PROC_END,
};

void StartPartialGameLock(ProcPtr proc)
{
    struct Proc * gproc;

    gproc = Proc_StartBlocking(ProcScr_PartialGameLock, proc);
    gproc->unk64 = GetGameLock();
}

void PartialGameLock_OnLoop(struct Proc * proc)
{
    if (GetGameLock() == proc->unk64)
        Proc_Break(proc);
}

void VramCopy(u8 const * src, u8 * dst, int size)
{
    if ((size & 0x1F) != 0)
        CpuCopy16(src, dst, size);
    else
        CpuFastCopy(src, dst, size);
}

void VramCopyInRaw(u8 const * src, u8 * dst, int width, int height)
{
    int i, line_size = width * CHR_SIZE;

    for (i = 0; i < height; ++i)
    {
        VramCopy(src, dst, line_size);

        src += line_size;
        dst += 0x20 * CHR_SIZE;
    }
}

void PutTmLinear(u16 const * src, u16 * dst, int size, u16 tileref)
{
    while (size > 0)
    {
        *dst++ = *src++ + tileref;
        size -= 2;
    }
}

u16 * GetTmOffsetById(int bgid, int x, int y)
{
    switch (bgid) {
    case 0:
        return gBG0TilemapBuffer + TILEMAP_INDEX(x, y);

    case 1:
        return gBG1TilemapBuffer + TILEMAP_INDEX(x, y);

    case 2:
        return gBG2TilemapBuffer + TILEMAP_INDEX(x, y);

    case 3:
        return gBG3TilemapBuffer + TILEMAP_INDEX(x, y);

    default:
        return NULL;
    }
}

void sub_8014A78(void)
{
    if (gLCDControlBuffer.bg0cnt.colorMode == 0)
        sub_8014930((u16 *) (VRAM + GetBackgroundTileDataOffset(0)), 0x10, 0);

    if (gLCDControlBuffer.bg1cnt.colorMode == 0)
        sub_8014930((u16 *) (VRAM + GetBackgroundTileDataOffset(1)), 0x10, 0);

    if (gLCDControlBuffer.bg2cnt.colorMode == 0)
        sub_8014930((u16 *) (VRAM + GetBackgroundTileDataOffset(2)), 0x10, 0);

    if (gLCDControlBuffer.bg3cnt.colorMode == 0)
        sub_8014930((u16 *) (VRAM + GetBackgroundTileDataOffset(3)), 0x10, 0);
}

int Screen2Pan(int x)
{
    if (x < 0)
        return -0x60;

    if (x >= DISPLAY_WIDTH)
        return +0x5F;

    return Div(0xC0 * x, DISPLAY_WIDTH) - 0x60;
}

void PlaySeSpacial(int song, int x)
{
    struct MusicPlayerInfo * info;

    PlaySoundEffect(song);

    info = gMPlayTable[gSongTable[song].ms].info;

    m4aMPlayImmInit(info);
    m4aMPlayPanpotControl(info, 0xFFFF, Screen2Pan(x));
}

void PlaySeDelayed(int song, int delay)
{
    CallDelayedArg(PlaySeFunc, song, delay);
}

void PlaySeFunc(int song)
{
    PlaySoundEffect(song);
}

void _StartBgm(short song)
{
    StartBgm(song, NULL);
}

void _FadeBgmOut(short speed)
{
    Sound_FadeOutBGM(speed);
}

void sub_8014BE0(int palid)
{
    int i;

    u16 * pal = gPaletteBuffer + palid * 0x10;

    for (i = 0; i < 0x10; ++i)
    {
        int red   = ((pal[i] & (0x1F))       / 4) * 3;
        int green = ((pal[i] & (0x1F << 5))  / 4) * 3;
        int blue  = ((pal[i] & (0x1F << 10)) / 4) * 3;

        pal[i] = (red & (0x1F)) | (green & (0x1F << 5)) | (blue & (0x1F << 10));
    }
}

void MemCpy(const void * _src, void * _dst, int size)
{
    u8 const * src = _src;
    u8 * dst = _dst;
    while (size != 0)
    {
        *dst = *src;

        dst++;
        src++;

        size--;
    }
}

void PutDrawTextCentered(struct Text * text, int x, int y, char const * str, int width)
{
    int off;

    off = GetStringTextLen(str);
    off = (width*8 - off) >> 1;

    Text_SetCursor(text, off);
    Text_DrawString(text, str);

    PutText(text, gBG0TilemapBuffer + TILEMAP_INDEX(x, y));
}
