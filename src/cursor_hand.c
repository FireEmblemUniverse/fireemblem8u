#include "global.h"

#include "bmlib.h"
#include "ctc.h"
#include "hardware.h"

struct Unk2C
{
    /* 00 */ u8 a;
    /* 01 */ u8 b;
    /* 02 */ u8 c;
    /* 03 */ u8 d;
};

struct CursorHandProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2c);
    /* 2C */ struct Unk2C unk_2c[4];
    /* 3C */ u8 unk_3c[4];
    /* 40 */ s16 unk_40[4];
    /* 48 */ s16 unk_48[4];
};

extern u16 gUnknown_08A20B3C[];
extern u16 gUnknown_08A20B44[];

//! FE8U = 0x080AC844
void sub_80AC844(u16 * buf, int xBase, int yBase, int bgIndex, int xOffset, int yOffset, int xMax, int yMax)
{
    int ix;
    int iy;

    u16 * bgBuf = BG_GetMapBuffer(bgIndex & 3);
    buf = buf + TILEMAP_INDEX(xBase, yBase);

    if (xOffset < 0)
    {
        xMax = xMax + xOffset;
        buf = buf - xOffset;
        xOffset = 0;
    }

    if (yOffset < 0)
    {
        yMax = yMax + yOffset;
        buf = buf - yOffset * 0x20;
        yOffset = 0;
    }

    for (iy = 0; yOffset + iy < 0x20 && iy < yMax; iy++)
    {
        for (ix = 0; xOffset + ix < 0x20 && ix < xMax; ix++)
        {
            bgBuf[TILEMAP_INDEX((xOffset + ix) & 0x1f, (yOffset + iy) & 0x1f)] = buf[TILEMAP_INDEX(ix, iy)];
        }
    }

    return;
}

//! FE8U = 0x080AC904
void sub_80AC904(struct CursorHandProc * proc)
{
    int i;

    for (i = 0; i < 4; i++)
    {
        proc->unk_3c[i] = 0;

        proc->unk_2c[i].a = 0;
        proc->unk_2c[i].b = 0;
        proc->unk_2c[i].c = DISPLAY_WIDTH;
        proc->unk_2c[i].d = DISPLAY_HEIGHT;
    }

    return;
}

//! FE8U = 0x080AC930
void sub_80AC930(struct CursorHandProc * proc)
{
    int i;

    for (i = 0; i < 4; i++)
    {
        int x;
        int y;

        if (!(proc->unk_3c[i] & 1))
        {
            continue;
        }

        x = proc->unk_40[i];
        y = proc->unk_48[i];

        if (x < proc->unk_2c[i].a || x >= proc->unk_2c[i].c)
        {
            continue;
        }

        if (y < proc->unk_2c[i].b || y >= proc->unk_2c[i].d)
        {
            continue;
        }

        if (proc->unk_3c[i] & 2)
        {
            PutSprite(3, proc->unk_40[i] - 12, proc->unk_48[i], gUnknown_08A20B44, 0);
        }
        else
        {
            PutSprite(3, proc->unk_40[i] - 12, proc->unk_48[i], gUnknown_08A20B3C, 0);
        }
    }

    return;
}

extern struct ProcCmd gUnknown_08A20B4C[];

//! FE8U = 0x080AC9C0
ProcPtr sub_80AC9C0(ProcPtr parent)
{
    return Proc_Start(gUnknown_08A20B4C, parent);
}

//! FE8U = 0x080AC9D4
void sub_80AC9D4(int index, int x, int y, u8 flags)
{
    struct CursorHandProc * proc = Proc_Find(gUnknown_08A20B4C);

    if (proc != NULL)
    {
        proc->unk_3c[index] = 1;
        proc->unk_40[index] = x;
        proc->unk_48[index] = y;
        proc->unk_3c[index] = flags | 1;

        if (flags & 2)
        {
            Decompress(gUnknown_0859EDB0, (void *)0x060100C0);
            Decompress(gUnknown_0859EDEC, (void *)0x060104C0);
        }
    }

    return;
}

//! FE8U = 0x080ACA4C
void sub_80ACA4C(int index, int a, int b, int c, int d)
{
    struct CursorHandProc * proc = Proc_Find(gUnknown_08A20B4C);

    if (proc != NULL)
    {
        proc->unk_2c[index].a = a;
        proc->unk_2c[index].b = b;
        proc->unk_2c[index].c = c;
        proc->unk_2c[index].d = d;
    }

    return;
}

//! FE8U = 0x080ACA84
void sub_80ACA84(u32 index)
{
    struct CursorHandProc * proc = Proc_Find(gUnknown_08A20B4C);

    if (proc != NULL)
    {
        proc->unk_3c[index] = 0;
    }

    return;
}

//! FE8U = 0x080ACAA4
void sub_80ACAA4(void)
{
    struct CursorHandProc * proc = Proc_Find(gUnknown_08A20B4C);

    if (proc != NULL)
    {
        int i;

        for (i = 0; i < 8; i++)
        {
            proc->unk_3c[i] = 0;
        }
    }

    return;
}

//! FE8U = 0x080ACAC8
void sub_80ACAC8(void)
{
    struct CursorHandProc * proc = Proc_Find(gUnknown_08A20B4C);

    if (proc != NULL)
    {
        Proc_Goto(proc, 1);
    }

    return;
}

//! FE8U = 0x080ACAE4
void sub_80ACAE4(void)
{
    struct CursorHandProc * proc = Proc_Find(gUnknown_08A20B4C);

    if (proc != NULL)
    {
        Proc_Goto(proc, 0);
    }

    return;
}

//! FE8U = 0x080ACB00
void sub_80ACB00(void)
{
    Proc_End(Proc_Find(gUnknown_08A20B4C));
    return;
}
