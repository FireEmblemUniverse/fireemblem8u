#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "hardware.h"
#include "bmlib.h"
#include "bmmap.h"
#include "rng.h"

#include "constants/classes.h"
#include "constants/items.h"

CONST_DATA short gUnknown_0875879C[0x140] = {
    0,   0,   0,
    1,   1,   1,
    2,   2,
    3,   3,   3,
    4,   4,
    5,   5,   5,
    6,   6,   6,
    7,   7,   7,
    8,   8,   8,
    9,   9,   9,
    10,  10,  10,
    11,  11,  11, 11,
    12,  12,  12, 12,
    13,  13,  13, 13, 13,
    14,  14,  14, 14, 14, 14,
    15,  15,  15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
    14,  14,  14, 14, 14, 14,
    13,  13,  13, 13, 13,
    12,  12,  12, 12,
    11,  11,  11, 11,
    10,  10,  10,
    9,   9,   9,
    8,   8,   8,
    7,   7,   7,
    6,   6,   6,
    5,   5,   5,
    4,   4,
    3,   3,   3,
    2,   2,
    1,   1,   1,
    0,   0,   0,
    -1,  -1,
    -2,  -2,  -2,
    -3,  -3,
    -4,  -4,  -4,
    -5,  -5,
    -6,  -6,  -6,
    -7,  -7,  -7,
    -8,  -8,  -8,
    -9,  -9,  -9,
    -10, -10, -10,
    -11, -11, -11,
    -12, -12, -12, -12,
    -13, -13, -13, -13,
    -14, -14, -14, -14, -14,
    -15, -15, -15, -15, -15, -15,
    -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16, -16,
    -15, -15, -15, -15, -15, -15,
    -14, -14, -14, -14, -14,
    -13, -13, -13, -13,
    -12, -12, -12, -12,
    -11, -11, -11,
    -10, -10, -10,
    -9,  -9,  -9,
    -8,  -8,  -8,
    -7,  -7,  -7,
    -6,  -6,  -6,
    -5,  -5,
    -4,  -4,  -4,
    -3,  -3,
    -2,  -2,  -2,
    -1,  -1,
    0, 0, 0,
    1, 1, 1,
    2, 2,
    3, 3, 3,
    4, 4,
    5, 5, 5,
    6, 6, 6,
    7, 7, 7,
    8, 8, 8,
    9, 9, 9,
    10, 10, 10,
    11, 11, 11, 11,
    12, 12, 12, 12,
    13, 13, 13, 13, 13,
    14, 14, 14, 14, 14, 14,
    15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
};

void sub_8070D04(u16 * tm, u16 width, u16 height, int pal, int chr)
{
    int i, j;
    u16 tileref, len;
    u16 * _tm = tm;

    for (i = height; i != 0; i--)
    {
        for (j = width; j != 0; j--)
        {
            tileref = *_tm;
            if (pal != -1) tileref = TILEREF(tileref & 0xFFF, pal);
            if (chr != -1) tileref += chr;

            *_tm = tileref;
            _tm++;
        }

        tileref = 0x20 - width;
        _tm += tileref;
    }
}

void FillBGRect(u16 * tm, u16 width, u16 height, int pal, int chr)
{
    int i, j;
    u16 * _tm = tm;
    for (i = height; i != 0; i--)
    {
        u16 len = 0x20 - width;

        for (j = width; j != 0; j--)
            *(_tm++) = TILEREF(chr, pal);

        _tm += len;
    }
}

void sub_8070DBC(u16 * tm, u16 width, u16 height, int pal, int chr)
{
    int i, j;
    u16 val;
    u16 * _tm = tm;

    for (i = height; i != 0; i--)
    {
        for (j = width; j != 0; j--)
        {
            val = *_tm;
            if (pal != -1) val = TILEREF(val, pal);
            if (chr != -1) val += chr;

            *_tm = val;
            _tm++;
        }

        val = 0x20 - width;
        _tm += val;
    }
}

CONST_DATA u16 gEfxTileRefPals_08758A1C[] = {
    0xB000, 0xC000, 0xD000, 0xE000, 0xF000,
    0xB000, 0xC000, 0xD000, 0xE000, 0xF000,
};

void EfxTmModifyPal(u16 * tm, u16 width, u16 height)
{
    int i, j;
    u16 tileref;
    u16 * _tm = tm;
#ifndef NONMATCHING
    register u32 _tileref asm("r0");
#else
    u32 _tileref;
#endif
    
    for (i = height; i != 0; i--)
    {
        u16 len = 0x20 - width;

        for (j = width; j != 0; j--)
        {
            tileref = _tileref = *_tm;
            tileref = (tileref & 0xFFF)
                    + gEfxTileRefPals_08758A1C[(u16)(((_tileref >> 0xC) & 0xF) - 6)];
            *_tm = tileref;
            _tm++;
        }

        len = 0x20 - width;
        _tm += len;
    }
}

void EfxTmCpyBG(const void * ptr1, void * ptr2, u16 width, u16 height, int pal, int chr)
{
    EfxTmCpyExt(ptr1, -1, ptr2, 32, width, height, pal, chr);
}

void EfxTmCpyBgHFlip(const u16 * tsa, u16 * tm, u16 width, u16 height, int pal, int chr)
{
    EfxTmCpyExtHFlip(tsa, -1, tm, 32, width, height, pal, chr);
}

void EfxTmCpyExt(const u16 * src, s16 src_width, u16 * dst, s16 dst_width, u16 width, u16 hight, int pal, int chr)
{
    int i, j;

    for (i = hight; i != 0; i--)
    {
        u16 len1 = 0;
        u16 len2 = 0;

        for (j = width; j != 0; j--)
        {
            u16 val = *src;
            if (pal != -1)
                val = val + (pal << 0xC);

            if (chr != -1)
                val = val + chr;

            *dst = val;

            src++;
            dst++;
        }

        if (src_width != -1)
        {
            len1 = src_width - width;
            src = src + len1;
        }

        if (dst_width != -1)
        {
            len2 = dst_width - width;
            dst = dst + len2;
        }
    }
}

void EfxTmCpyExtHFlip(const u16 * src, s16 src_width, u16 * dst, s16 dst_width, u16 width, u16 hight, int pal, int chr)
{
    int i, j;

    dst += width - 1;

    for (i = hight; i != 0; i--)
    {
        u16 len1 = 0;
        u16 len2 = 0;

        for (j = width; j != 0; j--)
        {
            u16 val = *src;
            if (pal != -1)
                val = val + (pal << 0xC);

            if (chr != -1)
                val = val + chr;

            *dst = val ^ TILE_HFLIP;

            src++;
            dst--;
        }

        if (src_width != -1)
        {
            len1 = src_width - width;
            src = src + len1;
        }

        if (dst_width != -1)
        {
            len2 = width + dst_width;
            dst = dst + len2;
        }
    }
}

void sub_8071068(u16 * tm, int arg1, int arg2)
{
    int r1, i, flag = 0;

    if (arg2 != 0)
    {
        for (i = 0; i <= 40; i = r1)
        {
            if (arg2 <= i)
            {
                if (flag == 0)
                {
                    flag = 1;
                    *tm++ = 0xE;
                }
                else
                    *tm++ = 0xFF;

                r1 = i + 4;
            }
            else if (arg2 == (i + 1))
            {
                flag = 1;
                if (arg1 <= i)
                {
                    *tm++ = 0xD;
                    r1 = i + 4;
                }
                else
                {
                    r1 = i + 4;

                    if (arg1 == (i + 1))
                        *tm++ = 0xC;
                }
            }
            else if (arg2 == (i + 2))
            {
                flag = 1;
                if (arg1 <= i)
                {
                    *tm++ = 0xB;
                    r1 = i + 4;
                }
                else if (arg1 == (i + 1))
                {
                    *tm++ = 0xA;
                    r1 = i + 4;
                }
                else
                {
                    r1 = i + 4;

                    if (arg1 == (i + 2))
                        *tm++ = 0x9;
                }
            }
            else if (arg2 == (i + 3))
            {
                flag = 1;
                if (arg1 <= i)
                {
                    *tm++ = 0x8;
                    r1 = i + 4;
                }
                else if (arg1 == (i + 1))
                {
                    *tm++ = 0x7;
                    r1 = i + 4;
                }
                else if (arg1 == (i + 2))
                {
                    *tm++ = 0x6;
                    r1 = i + 4;
                }
                else
                {
                    r1 = i + 4;

                    if (arg1 == (i + 3))
                        *tm++ = 0x5;
                }
            }
            else if (r1 = i + 4, arg2 >= r1)
            {
                if (arg1 <= i)
                    *tm++ = 0x4;
                else if (arg1 == (i + 1))
                    *tm++ = 0x3;
                else if (arg1 == (i + 2))
                    *tm++ = 0x2;
                else if (arg1 == (i + 3))
                    *tm++ = 0x1;
                else if (arg1 >= r1)
                    *tm++ = 0x0;
            }
        }
    }
}

const u16 gBarfxTileConf1[] = {
    0, 1, 2, 3, 4, 5, 6,
};

const u16 gBarfxTileConf2[] = {
    8, 9, 10, 11, 12, 13, 14, 15, 16
};

const u16 gBarfxTileConf3[] = {
    18, 19, 20, 21, 22, 23
};

void EkrModifyBarfx(u16 * tm, int arg)
{
    int i;

    if (arg > 5)
        *tm = 6;
    else
        *tm = gBarfxTileConf1[arg];

    tm = tm + 1;

    for (i = 0; i <= 0x57; i += 8)
    {
        if (arg >= i + 0xE)
            *tm = 0x10;
        else if (arg >= i + 0x6)
            *tm = gBarfxTileConf2[arg - (i + 0x6)];
        else
            *tm = 0x7;

        tm = tm + 1;
    }

    if (arg > 0x62)
        *tm = 0x17;
    else if (arg > 0x5D)
        *tm = gBarfxTileConf3[arg - 0x5E];
    else
        *tm = 0x11;
}

bool EkrPalModifyUnused(u16 * pal_start, u16 * pal_end, u16 * dst, u16 amount, u16 start, u16 end)
{
    int i;
    for (i = 0; i < amount; i++)
    {
        int r1 = *pal_start & 0x001F;
        int g1 = *pal_start & 0x03E0;
        int b1 = *pal_start & 0x7C00;

        int r2 = *pal_end & 0x001F;
        int g2 = *pal_end & 0x03E0;
        int b2 = *pal_end & 0x7C00;

        u16 r = Interpolate(0, r1, r2, (s16)start, (s16)end);
        u16 g = Interpolate(0, g1, g2, (s16)start, (s16)end);
        u16 b = Interpolate(0, b1, b2, (s16)start, (s16)end);

        *dst = (b & 0x7C00) | (g & 0x03E0) | (r & 0x001F);

        pal_start++;
        pal_end++;
        dst++;
    }

    if (start == end)
        return true;

    return false;
}

void EfxPalBlackInOut(u16 * pal_buf, int line, int length, int ref)
{
    int i, j, _ref = Div(ref * 0x20, 0x10);

    for (i = line; i < (line + length); i++)
    {
        u16 * pal = pal_buf + i * 0x10;
        for (j = 0; j < 0x10; j++)
        {
            int r = RED_VALUE(pal[j]);
            int g = GREEN_VALUE(pal[j]);
            int b = BLUE_VALUE(pal[j]);

            r = r - ((r * _ref) >> 5);
            g = g - ((g * _ref) >> 5);
            b = b - ((b * _ref) >> 5);

            pal[j] = RGB(r, g, b);
        }
    }
}

void EfxPalWhiteInOut(u16 * pal_buf, int line, int length, int ref)
{
    int i, j, _ref = Div(ref * 0x20, 0x10);

    for (i = line; i < (line + length); i++)
    {
        u16 * pal = pal_buf + i * 0x10;
        for (j = 0; j < 0x10; j++)
        {
            int r = RED_VALUE(pal[j]);
            int g = GREEN_VALUE(pal[j]);
            int b = BLUE_VALUE(pal[j]);

            r = r + (((0x1F - r) * _ref) >> 5);
            g = g + (((0x1F - g) * _ref) >> 5);
            b = b + (((0x1F - b) * _ref) >> 5);

            pal[j] = RGB(r, g, b);
        }
    }
}

void EfxPalFlashingInOut(u16 * pal_buf, int line, int length, int r0, int g0, int b0)
{
    int i, j;

    int _r = Div(r0 * 0x20, 0x10);
    int _g = Div(g0 * 0x20, 0x10);
    int _b = Div(b0 * 0x20, 0x10);

    for (i = line; i < (line + length); i++)
    {
        u16 * pal = pal_buf + i * 0x10;
        for (j = 0; j < 0x10; j++)
        {
            int r = RED_VALUE(pal[j]);
            int g = GREEN_VALUE(pal[j]);
            int b = BLUE_VALUE(pal[j]);

            r = r + (((0x1F - r) * _r) >> 5);
            g = g + (((0x1F - g) * _g) >> 5);
            b = b + (((0x1F - b) * _b) >> 5);

            pal[j] = RGB(r, g, b);
        }
    }
}

void EfxPalModifyPetrifyEffect(u16 * pal_buf, int line, int length)
{
    int i, j;

    for (i = line; i < (line + length); i++)
    {
        for (j = 0; j < 0x10; j++)
        {
            int r, g, b, c;
            u16 * pal = pal_buf + i * 0x10 + j;

            r = RED_VALUE(pal[0]);
            g = GREEN_VALUE(pal[0]);
            b = BLUE_VALUE(pal[0]);

            c = r * 3 + g * 6 + b;

            c = Div(c, 10);

            pal[0] = RGB(c, c, c);
        }
    }
}

void EfxSplitColor(u16 * pal, u8 * dst, u32 length)
{
    u32 i, r, g, b;
    u16 color;

    for (i = 0; i < length; i++)
    {
        color = *pal++;

        r = RED_VALUE(color);
        g = GREEN_VALUE(color);
        b = BLUE_VALUE(color);

        *dst++ = r;
        *dst++ = g;
        *dst++ = b;
    }
}

void EfxSplitColorPetrify(u16 * src, u8 * dst, u32 length)
{
    int r, g, b, _c;
    u16 color;
    u32 i;

    for (i = 0; i < length; i++)
    {
        color = *src++;

        r = RED_VALUE(color);
        g = GREEN_VALUE(color);
        b = BLUE_VALUE(color);

        _c = Div(r * 3 + g * 6 + b, 10);

        *dst++ = _c;
        *dst++ = _c;
        *dst++ = _c;
    }
}

void sub_8071574(s8 * src1, s8 * src2, u16 * pal, u32 length, int ref)
{
    u32 i;
    s16 c1, c2, c;

    for (i = 0; i < length; i++)
    {
        c1 = *src2;
        c2 = *src1;
        src1++, src2++;
        c = (c1 - c2) * 0x100;
        *pal++ = Div(c, ref);

        c1 = *src2;
        c2 = *src1;
        src1++, src2++;
        c = (c1 - c2) * 0x100;
        *pal++ = Div(c, ref);

        c1 = *src2;
        c2 = *src1;
        src1++, src2++;
        c = (c1 - c2) * 0x100;
        *pal++ = Div(c, ref);
    }
}

void EfxDecodeSplitedPalette(u16 * dst, s8 * src1, s8 * src2, s16 * src3, u32 length, int ref, int unk)
{
    u32 i;
    int r, g, b;

    for (i = 0; i < length; i++)
    {
        if (ref != unk)
        {
            r = *src3++;
            g = *src3++;
            b = *src3++;

            r = (r * ref) >> 8;
            g = (g * ref) >> 8;
            b = (b * ref) >> 8;

            r = r + *src1++;
            g = g + *src1++;
            b = b + *src1++;
        }
        else
        {
            r = *src2++;
            g = *src2++;
            b = *src2++;
        }
        *dst++ = RGB(r, g, b);
    }
}

void EfxChapterMapFadeOUT(int speed)
{
    UnpackChapterMapPalette();
    EfxPalBlackInOut(gPaletteBuffer, 6, 10, speed);
    EnablePaletteSync();
}

int sub_80716B0(int a)
{
    return DivRem(AdvanceGetLCGRNValue(), a + 1);
}

CONST_DATA struct ProcCmd ProcScr_ekrsubAnimeEmulator[] = {
    PROC_NAME("ekrsubAnimeEmulator"),
    PROC_REPEAT(EkrsubAnimeEmulatorMain),
    PROC_END
};

struct ProcEkrSubAnimeEmulator * NewEkrsubAnimeEmulator(int x, int y, u32 * anim_scr, int type, int oam2Base, int oamBase, ProcPtr parent)
{
    struct ProcEkrSubAnimeEmulator * proc =
        Proc_Start(ProcScr_ekrsubAnimeEmulator, parent);

    proc->timer = 0;
    proc->scr_cur = 0;
    proc->type = type;
    proc->valid = 0;
    proc->x1 = x;
    proc->y1 = y;
    proc->x2 = 0;
    proc->y2 = 0;
    proc->anim_scr = anim_scr;
    proc->sprite = NULL;
    proc->oam2Base = oam2Base;
    proc->oamBase = oamBase;
    return proc;
}

void EkrsubAnimeEmulatorMain(struct ProcEkrSubAnimeEmulator * proc)
{
    struct Anim _anim;
    u32 * anim_scr = proc->anim_scr;
    if (proc->timer == 0)
    {
        u32 inst = anim_scr[proc->scr_cur];
        if (ANIM_INS_TYPE_STOP == ANINS_GET_TYPE(inst))
        {
            switch (proc->type) {
            case 0:
                Proc_Break(proc);
                return;

            case 1:
                proc->timer = 1;
                proc->scr_cur = 0;
                break;

            case 2:
                proc->timer = 1;
                proc->scr_cur--;
                break;

            default:
                break;
            }
        }
        else if (ANIM_INS_TYPE_WAIT == ANINS_GET_TYPE(inst))
        {
            proc->timer = inst;
            proc->scr_cur++;
        }
        else
        {
            proc->sprite = ANINS_FORCESPRITE_GET_ADDRESS(inst);
            proc->timer = ANINS_FORCESPRITE_GET_DELAY(inst);
            proc->scr_cur++;
        }
    }

    proc->timer--;

    if (proc->valid == 0 && proc->sprite != NULL)
    {
        _anim.pSpriteData = proc->sprite;
        _anim.oam2Base = proc->oam2Base;
        _anim.oamBase = proc->oamBase;
        _anim.xPosition = proc->x1 + proc->x2;
        _anim.yPosition = proc->y1 + proc->y2;
        _anim.state2 = 0;
        AnimDisplay(&_anim);
    }
}

const s16 gAnimSpriteRotScalePosX[] = {
    0x08, 0x10, 0x20, 0x40,
    0x10, 0x20, 0x20, 0x40,
    0x08, 0x08, 0x10, 0x20,
    -1, -1, -1, -1
};

int GetAnimSpriteRotScaleX(u32 header)
{
    u32 a = header >> 30;
    u32 b = header & 0xC000;

#if !NONMATCHING
    const s16 * src = gAnimSpriteRotScalePosX;

    a = a << 1;
    b = b >> 11;
    a = a + b;

    return *(s16 *)((void *)src + a);
#else
    return gAnimSpriteRotScalePosX[a + (b >> 12)];
#endif
}

const s16 gAnimSpriteRotScalePosY[] = {
    0x08, 0x10, 0x20, 0x40,
    0x08, 0x08, 0x10, 0x20,
    0x10, 0x20, 0x20, 0x40,
    -1, -1, -1, -1
};

int GetAnimSpriteRotScaleY(u32 header)
{
    u32 a = header >> 30;
    u32 b = header & 0xC000;

#if !NONMATCHING
    const s16 * src = gAnimSpriteRotScalePosY;

    a = a << 1;
    b = b >> 11;
    a = a + b;

    return *(s16 *)((void *)src + a);
#else
    return gAnimSpriteRotScalePosY[a + (b >> 12)];
#endif
}

void BanimUpdateSpriteRotScale(void * src, struct AnimSpriteData * out, s16 x, s16 y, int unused)
{
    struct ObjAffineSrcData affin_src;
    struct AnimSpriteData * anim_sprite, * it;
    struct AnimSpriteData * scr = src;

    affin_src.rotation = 0;
    affin_src.xScale = x;
    affin_src.yScale = y;

    out[0].header = 0xFFFF0004;
    ObjAffineSet(&affin_src, &out[0].as.affine, 1, 2);

    anim_sprite = &out[1];
    out[1].header = 0xFFFF0004;
    ObjAffineSet(&affin_src, &out[1].as.affine, 1, 2);
    anim_sprite->as.affine.pa = -anim_sprite->as.affine.pa;
    anim_sprite->as.affine.pb = -anim_sprite->as.affine.pb;

    anim_sprite = &out[2];
    anim_sprite->header = 0xFFFF0004;
    ObjAffineSet(&affin_src, &out[2].as.affine, 1, 2);
    anim_sprite->as.affine.pc = -anim_sprite->as.affine.pc;
    anim_sprite->as.affine.pd = -anim_sprite->as.affine.pd;

    anim_sprite = &out[3];
    anim_sprite->header = 0xFFFF0004;
    ObjAffineSet(&affin_src, &out[3].as.affine, 1, 2);
    anim_sprite->as.affine.pa = -anim_sprite->as.affine.pa;
    anim_sprite->as.affine.pb = -anim_sprite->as.affine.pb;
    anim_sprite->as.affine.pc = -anim_sprite->as.affine.pc;
    anim_sprite->as.affine.pd = -anim_sprite->as.affine.pd;

    out = out + 4;

    for (; scr->header != 1; out++, scr++)
    {
        s16 r8, r5;
        int val1, val2, val, _val, header;
    
        r8 = x;
        r5 = y;

        header = scr->header;
        val = ((int)(-(header & 0x10000000)) >> 0x1F) & 0x2000000;

        if (header & 0x20000000)
            val = val + 0x4000000;

        out->header = (header &~ 0x3E000000) + 0x100 + val;
        out->as.object.oam2 = scr->as.object.oam2;

        val1 = GetAnimSpriteRotScaleX(header);
        val1 = val1 << 0x10;
        val1 = val1 >> 0x11;
        _val = val1 << 8;
        _val = val1 - Div(_val, r8);
        val1 = scr->as.object.x - _val;
        _val = scr->as.object.x << 8;
        _val = Div(_val, r8);
        _val = scr->as.object.x - _val;
        val1 = val1 - _val;
        out->as.object.x = val1;

        val1 = GetAnimSpriteRotScaleY(scr->header);
        val1 = val1 << 0x10;
        val1 = val1 >> 0x11;
        _val = val1 << 8;
        _val = val1 - Div(_val, r5);
        val1 = scr->as.object.y - _val;
        _val = scr->as.object.y << 8;
        _val = Div(_val, r5);
        _val = scr->as.object.y - _val;
        val1 = val1 - _val;
        out->as.object.y = val1;
    }
    out->header = scr->header;
    out->as.object.oam2 = scr->as.object.oam2;
    out->as.object.x = scr->as.object.x;
    out->as.object.y = scr->as.object.y;
}
