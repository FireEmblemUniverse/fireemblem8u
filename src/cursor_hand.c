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
    /* 3C */ u8 flags[4];
    /* 40 */ s16 x[4];
    /* 48 */ s16 y[4];
};

// clang-format off

u16 CONST_DATA gSprite_UiCursorHand_08A20B3C[] =
{
    1,
    OAM0_SHAPE_16x16 + OAM0_Y(2), OAM1_SIZE_16x16, 0,
};

u16 CONST_DATA gSprite_UiCursorHand_08A20B44[] =
{
    1,
    OAM0_SHAPE_16x16 + OAM0_Y(2), OAM1_SIZE_16x16, OAM2_CHR(0x6),
};

// clang-format on

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
void UiCursorHand_Init(struct CursorHandProc * proc)
{
    int i;

    for (i = 0; i < 4; i++)
    {
        proc->flags[i] = 0;

        proc->unk_2c[i].a = 0;
        proc->unk_2c[i].b = 0;
        proc->unk_2c[i].c = DISPLAY_WIDTH;
        proc->unk_2c[i].d = DISPLAY_HEIGHT;
    }

    return;
}

//! FE8U = 0x080AC930
void UiCursorHand_Loop(struct CursorHandProc * proc)
{
    int i;

    for (i = 0; i < 4; i++)
    {
        int x;
        int y;

        if (!(proc->flags[i] & 1))
        {
            continue;
        }

        x = proc->x[i];
        y = proc->y[i];

        if (x < proc->unk_2c[i].a || x >= proc->unk_2c[i].c)
        {
            continue;
        }

        if (y < proc->unk_2c[i].b || y >= proc->unk_2c[i].d)
        {
            continue;
        }

        if (proc->flags[i] & 2)
        {
            PutSprite(3, proc->x[i] - 12, proc->y[i], gSprite_UiCursorHand_08A20B44, 0);
        }
        else
        {
            PutSprite(3, proc->x[i] - 12, proc->y[i], gSprite_UiCursorHand_08A20B3C, 0);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_UiCursorHand[] =
{
    PROC_CALL(UiCursorHand_Init),

PROC_LABEL(0),
    PROC_REPEAT(UiCursorHand_Loop),

PROC_LABEL(1),
    PROC_BLOCK,

    PROC_END,
};

// clang-format on

//! FE8U = 0x080AC9C0
ProcPtr StartUiCursorHand(ProcPtr parent)
{
    return Proc_Start(gProcScr_UiCursorHand, parent);
}

//! FE8U = 0x080AC9D4
void SetUiCursorHandConfig(int index, int x, int y, u8 flags)
{
    struct CursorHandProc * proc = Proc_Find(gProcScr_UiCursorHand);

    if (proc != NULL)
    {
        proc->flags[index] = 1;
        proc->x[index] = x;
        proc->y[index] = y;
        proc->flags[index] = flags | 1;

        if (flags & 2)
        {
            Decompress(gImg_UiCursorHandTop, (void *)0x060100C0);
            Decompress(gImg_UiCursorHandBottom, (void *)0x060104C0);
        }
    }

    return;
}

//! FE8U = 0x080ACA4C
void UiCursorHand_80ACA4C(int index, int a, int b, int c, int d)
{
    struct CursorHandProc * proc = Proc_Find(gProcScr_UiCursorHand);

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
    struct CursorHandProc * proc = Proc_Find(gProcScr_UiCursorHand);

    if (proc != NULL)
    {
        proc->flags[index] = 0;
    }

    return;
}

//! FE8U = 0x080ACAA4
void sub_80ACAA4(void)
{
    struct CursorHandProc * proc = Proc_Find(gProcScr_UiCursorHand);

    if (proc != NULL)
    {
        int i;

        for (i = 0; i < 8; i++)
        {
            proc->flags[i] = 0;
        }
    }

    return;
}

//! FE8U = 0x080ACAC8
void BlockUiCursorHand(void)
{
    struct CursorHandProc * proc = Proc_Find(gProcScr_UiCursorHand);

    if (proc != NULL)
    {
        Proc_Goto(proc, 1);
    }

    return;
}

//! FE8U = 0x080ACAE4
void UnblockUiCursorHand(void)
{
    struct CursorHandProc * proc = Proc_Find(gProcScr_UiCursorHand);

    if (proc != NULL)
    {
        Proc_Goto(proc, 0);
    }

    return;
}

//! FE8U = 0x080ACB00
void EndUiCursorHand(void)
{
    Proc_End(Proc_Find(gProcScr_UiCursorHand));
    return;
}
