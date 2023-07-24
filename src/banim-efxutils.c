#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "hardware.h"
#include "constants/classes.h"
#include "constants/items.h"

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
                {
                    *tm++ = 0xFF;
                }

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
                    {
                        *tm++ = 0xC;
                    }
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
                    {
                        *tm++ = 0x9;
                    }
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
                    {
                        *tm++ = 0x5;
                    }
                }
            }
            else if (r1 = i + 4, arg2 >= r1)
            {
                if (arg1 <= i)
                {
                    *tm++ = 0x4;
                }
                else if (arg1 == (i + 1))
                {
                    *tm++ = 0x3;
                }
                else if (arg1 == (i + 2))
                {
                    *tm++ = 0x2;
                }
                else if (arg1 == (i + 3))
                {
                    *tm++ = 0x1;
                }
                else if (arg1 >= r1)
                {
                    *tm++ = 0x0;
                }
            }
        }
    }
}

void sub_8071140(u16 * tm, int arg)
{
    int i;

    if (arg > 5)
        *tm = 6;
    else
        *tm = gUnknown_080E1394[arg];

    tm = tm + 1;

    for (i = 0; i <= 0x57; i += 8)
    {
        if (arg >= i + 0xE)
            *tm = 0x10;
        else if (arg >= i + 0x6)
            *tm = gUnknown_080E13A2[arg - (i + 0x6)];
        else
            *tm = 0x7;

        tm = tm + 1;
    }

    if (arg > 0x62)
        *tm = 0x17;
    else if (arg > 0x5D)
        *tm = gUnknown_080E13B4[arg - 0x5E];
    else
        *tm = 0x11;
}
