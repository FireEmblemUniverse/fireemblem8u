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

#if NONMATCHING

void sub_8071068(u16 * tm, int arg1, int arg2)
{
    int i, flag = 0;

    if (arg2 != 0)
    {
        for (i = 0; i <= 40;)
        {
            if (arg2 <= i)
            {
                if (flag == 0)
                {
                    flag = 1;
                    *tm = 0xE;
                }
                else
                {
                    *tm = 0xFF;
                }

                tm = tm + 1;
                i = i + 4;
            }
            else if (arg2 == (i + 1))
            {
                flag = 1;
                if (arg1 <= i)
                {
                    *tm = 0xD;
                    tm = tm + 1;
                    i = i + 4;
                }
                else
                {
                    i = i + 4;

                    if (arg1 == (i + 1))
                    {
                        *tm = 0xC;
                        tm = tm + 1;
                    }
                }
            }
            else if (arg2 == (i + 2))
            {
                flag = 1;
                if (arg1 <= i)
                {
                    *tm = 0xB;
                    tm = tm + 1;
                    i = i + 4;
                }
                else if (arg1 == (i + 1))
                {
                    *tm = 0xB;
                    tm = tm + 1;
                    i = i + 4;
                }
                else
                {
                    i = i + 4;

                    if (arg1 == (i + 2))
                    {
                        *tm = 0x9;
                        tm = tm + 1;
                    }
                }
            }
            else if (arg2 == (i + 3))
            {
                flag = 1;
                if (arg1 <= i)
                {
                    *tm = 0x8;
                    tm = tm + 1;
                    i = i + 4;
                }
                else if (arg1 == (i + 1))
                {
                    *tm = 0x7;
                    tm = tm + 1;
                    i = i + 4;
                }
                else if (arg1 == (i + 2))
                {
                    *tm = 0x6;
                    tm = tm + 1;
                    i = i + 4;
                }
                else
                {
                    i = i + 4;

                    if (arg1 == (i + 3))
                    {
                        *tm = 0x5;
                        tm = tm + 1;
                    }
                }
            }
            else if (arg2 >= (i + 4))
            {
                if (arg1 <= i)
                {
                    *tm = 0x4;
                    tm = tm + 1;
                }
                else if (arg1 == (i + 1))
                {
                    *tm = 0x3;
                    tm = tm + 1;
                }
                else if (arg1 == (i + 2))
                {
                    *tm = 0x2;
                    tm = tm + 1;
                }
                else if (arg1 == (i + 3))
                {
                    *tm = 0x1;
                    tm = tm + 1;
                }
                else if (arg1 >= (i + 4))
                {
                    *tm = 0x0;
                    tm = tm + 1;
                }
            }
        }
    }
}

void sub_8071140(u16 * tm, int arg)
{
    int i;

    if (arg > 5)
        *tm = 0;
    else
        *tm = gUnknown_080E1394[arg];

    tm = tm + 1;

    for (i = 0; i <= 0x57; tm++, i += 0x8)
    {
        if (arg >= (i + 0xE))
            *tm = 0x10;
        else if (arg >= (i + 0x6))
            *tm = gUnknown_080E13A2[arg - 6 - i];
        else
            *tm = 0x7;
    }

    if (arg > 0x62)
        *tm = 0x17;
    else if (arg > 0x5D)
        *tm = gUnknown_080E13B4[arg - 0x5E];
    else
        *tm = 0x11;
}

#else

NAKEDFUNC
void sub_8071068(u16 * tm, int arg1, int arg2)
{
    asm("\
	.syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        adds r3, r0, #0\n\
        adds r6, r1, #0\n\
        adds r7, r2, #0\n\
        movs r0, #0\n\
        mov ip, r0\n\
        cmp r7, #0\n\
        beq _08071138\n\
        movs r2, #0\n\
    _0807107A:\n\
        cmp r7, r2\n\
        bgt _08071090\n\
        mov r1, ip\n\
        cmp r1, #0\n\
        bne _0807108C\n\
        movs r0, #1\n\
        mov ip, r0\n\
        movs r0, #0xe\n\
        b _080710F0\n\
    _0807108C:\n\
        movs r0, #0xff\n\
        b _080710F0\n\
    _08071090:\n\
        adds r0, r2, #1\n\
        cmp r7, r0\n\
        bne _080710AC\n\
        movs r1, #1\n\
        mov ip, r1\n\
        cmp r6, r2\n\
        bgt _080710A2\n\
        movs r0, #0xd\n\
        b _080710F0\n\
    _080710A2:\n\
        adds r1, r2, #4\n\
        cmp r6, r0\n\
        bne _08071132\n\
        movs r0, #0xc\n\
        b _0807112E\n\
    _080710AC:\n\
        adds r4, r2, #2\n\
        cmp r7, r4\n\
        bne _080710D0\n\
        movs r1, #1\n\
        mov ip, r1\n\
        cmp r6, r2\n\
        bgt _080710BE\n\
        movs r0, #0xb\n\
        b _080710F0\n\
    _080710BE:\n\
        cmp r6, r0\n\
        bne _080710C6\n\
        movs r0, #0xa\n\
        b _080710F0\n\
    _080710C6:\n\
        adds r1, r2, #4\n\
        cmp r6, r4\n\
        bne _08071132\n\
        movs r0, #9\n\
        b _0807112E\n\
    _080710D0:\n\
        adds r5, r2, #3\n\
        cmp r7, r5\n\
        bne _08071102\n\
        movs r1, #1\n\
        mov ip, r1\n\
        cmp r6, r2\n\
        bgt _080710E2\n\
        movs r0, #8\n\
        b _080710F0\n\
    _080710E2:\n\
        cmp r6, r0\n\
        bne _080710EA\n\
        movs r0, #7\n\
        b _080710F0\n\
    _080710EA:\n\
        cmp r6, r4\n\
        bne _080710F8\n\
        movs r0, #6\n\
    _080710F0:\n\
        strh r0, [r3]\n\
        adds r3, #2\n\
        adds r1, r2, #4\n\
        b _08071132\n\
    _080710F8:\n\
        adds r1, r2, #4\n\
        cmp r6, r5\n\
        bne _08071132\n\
        movs r0, #5\n\
        b _0807112E\n\
    _08071102:\n\
        adds r1, r2, #4\n\
        cmp r7, r1\n\
        blt _08071132\n\
        cmp r6, r2\n\
        bgt _08071110\n\
        movs r0, #4\n\
        b _0807112E\n\
    _08071110:\n\
        cmp r6, r0\n\
        bne _08071118\n\
        movs r0, #3\n\
        b _0807112E\n\
    _08071118:\n\
        cmp r6, r4\n\
        bne _08071120\n\
        movs r0, #2\n\
        b _0807112E\n\
    _08071120:\n\
        cmp r6, r5\n\
        bne _08071128\n\
        movs r0, #1\n\
        b _0807112E\n\
    _08071128:\n\
        cmp r6, r1\n\
        blt _08071132\n\
        movs r0, #0\n\
    _0807112E:\n\
        strh r0, [r3]\n\
        adds r3, #2\n\
    _08071132:\n\
        adds r2, r1, #0\n\
        cmp r2, #0x28\n\
        ble _0807107A\n\
    _08071138:\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
	.syntax divided\n\
    ");
}

NAKEDFUNC
void sub_8071140(u16 * tm, int arg)
{
    asm("\
	.syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        adds r2, r0, #0\n\
        adds r3, r1, #0\n\
        cmp r3, #5\n\
        ble _0807114E\n\
        movs r0, #6\n\
        b _08071156\n\
    _0807114E:\n\
        ldr r0, _08071170  @ gUnknown_080E1394\n\
        lsls r1, r3, #1\n\
        adds r1, r1, r0\n\
        ldrh r0, [r1]\n\
    _08071156:\n\
        strh r0, [r2]\n\
        adds r2, #2\n\
        movs r1, #0\n\
        movs r7, #0x10\n\
        ldr r6, _08071174  @ gUnknown_080E13A2\n\
        subs r4, r3, #6\n\
        movs r5, #7\n\
    _08071164:\n\
        adds r0, r1, #0\n\
        adds r0, #0xe\n\
        cmp r3, r0\n\
        blt _08071178\n\
        strh r7, [r2]\n\
        b _0807118C\n\
        .align 2, 0\n\
    _08071170: .4byte gUnknown_080E1394\n\
    _08071174: .4byte gUnknown_080E13A2\n\
    _08071178:\n\
        adds r0, r1, #6\n\
        cmp r3, r0\n\
        blt _0807118A\n\
        subs r0, r4, r1\n\
        lsls r0, r0, #1\n\
        adds r0, r0, r6\n\
        ldrh r0, [r0]\n\
        strh r0, [r2]\n\
        b _0807118C\n\
    _0807118A:\n\
        strh r5, [r2]\n\
    _0807118C:\n\
        adds r2, #2\n\
        adds r1, #8\n\
        cmp r1, #0x57\n\
        ble _08071164\n\
        cmp r3, #0x62\n\
        ble _0807119C\n\
        movs r0, #0x17\n\
        b _080711B6\n\
    _0807119C:\n\
        cmp r3, #0x5d\n\
        ble _080711B4\n\
        ldr r0, _080711B0  @ gUnknown_080E13B4\n\
        adds r1, r3, #0\n\
        subs r1, #0x5e\n\
        lsls r1, r1, #1\n\
        adds r1, r1, r0\n\
        ldrh r0, [r1]\n\
        b _080711B6\n\
        .align 2, 0\n\
    _080711B0: .4byte gUnknown_080E13B4\n\
    _080711B4:\n\
        movs r0, #0x11\n\
    _080711B6:\n\
        strh r0, [r2]\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
	.syntax divided\n\
    ");
}

#endif
