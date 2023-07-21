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

void sub_8070D04(u16 * ptr, u16 a, u16 b, int r3, int r4)
{
    int i, j;
    u16 val;
    u16 * ptr_ = ptr;

    for (i = b; i != 0; i--)
    {
        for (j = a; j != 0; j--)
        {
            val = *ptr_;
            if (r3 != -1) val = TILEREF(val & 0xFFF, r3);
            if (r4 != -1) val += r4;

            *ptr_ = val;
            ptr_++;
        }
        val = 0x20 - a;
        ptr_ += val;
    }
}

void FillBGRect(u16 * ptr, u16 a, u16 b, int r3, int r4)
{
    int i, j;
    u16 * _ptr = ptr;
    for (i = b; i != 0; i--)
    {
        u16 len = 0x20 - a;

        for (j = a; j != 0; j--)
            *(_ptr++) = TILEREF(r4, r3);

        _ptr += len;
    }
}

void sub_8070DBC(u16 * tm, u16 a, u16 b, int r3, int r4)
{
    int i, j;
    u16 val;
    u16 * _ptr = tm;

    for (i = b; i != 0; i--)
    {
        for (j = a; j != 0; j--)
        {
            val = *_ptr;
            if (r3 != -1) val = TILEREF(val, r3);
            if (r4 != -1) val += r4;

            *_ptr = val;
            _ptr++;
        }

        val = 0x20 - a;
        _ptr += val;
    }
}

void sub_8070E24(u16 * ptr, u16 a, u16 b, int r3, int r4)
{
    int i, j;
    u16 val;
    u16 * _ptr = ptr;
#ifndef NONMATCHING
    register u32 r0 asm("r0");
#else
    u32 r0;
#endif
    
    for (i = b; i != 0; i--)
    {
        u16 len = 0x20 - a;

        for (j = a; j != 0; j--)
        {
            val = r0 = *_ptr;
            val = (val & 0xFFF) + gUnknown_08758A1C[(u16)(((r0 >> 0xC) & 0xF) - 6)];
            *_ptr = val;
            _ptr++;
        }

        len = 0x20 - a;
        _ptr += len;
    }
}

void sub_8070E94(const void * ptr1, void * ptr2, u16 a, u16 b, int r4, int r5)
{
    sub_8070EF4(ptr1, -1, ptr2, 32, a, b, r4, r5);
}

void sub_8070EC4(const u16 * tsa, u16 * tm, u16 a, u16 b, int c, int d)
{
    sub_8070FA4(tsa, -1, tm, 32, a, b, c, d);
}

#if 0
void sub_8070EF4(const u16 * src, int ref, u16 * tm, int a, int b, int c, int d, int e)
{

}
#endif
