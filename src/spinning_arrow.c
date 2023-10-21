#include "global.h"

#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "prepscreen.h" // for graphics / palette declarations

struct SpinningArrowProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int kind;
    /* 30 */ int flags;
    /* 34 */ int x[2];
    /* 3C */ int y[2];
    /* 44 */ int unk_44[2]; // first arrow current frame?
    /* 4C */ int unk_4c[2]; // second arrow current frame?
    /* 54 */ u16 oam2;
};

//! FE8U = 0x080ACB14
void UiSpinningArrows_Init(struct SpinningArrowProc * proc)
{
    proc->kind = 0;
    proc->oam2 = 0;

    proc->unk_4c[0] = 0;
    proc->unk_44[0] = 0;
    proc->y[0] = 0;
    proc->x[0] = 0;

    proc->unk_4c[1] = 0;
    proc->unk_44[1] = 0;
    proc->y[1] = 0;
    proc->x[1] = 0;

    proc->flags = 0;

    return;
}

// clang-format off

u16 CONST_DATA gSprite_UiSpinningArrows_Horizontal[] =
{
    2,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, 0,
    OAM0_SHAPE_8x8 + OAM0_Y(8), OAM1_SIZE_8x8, OAM2_CHR(0x6),
};

u16 CONST_DATA gSprite_UiSpinningArrows_Vertical[] =
{
    1,
    OAM0_SHAPE_16x8, OAM1_SIZE_16x8, 0,
};

// clang-format on

//! FE8U = 0x080ACB34
void UiSpinningArrows_Loop(struct SpinningArrowProc * proc)
{
    int i;

    int xOam1_a = proc->x[0];
    int yOam0_a = proc->y[0];

    int xOam1_b = proc->x[1];
    int yOam0_b = proc->y[1];

    proc->unk_44[0]++;
    proc->unk_44[1]++;

    for (i = 0; i < 2; i++)
    {
        if (proc->unk_4c[i] != 0)
        {
            proc->unk_44[i] += 3;
            proc->unk_4c[i]++;
        }

        if ((proc->unk_44[i] >> 3) > 5)
        {
            proc->unk_44[i] = 0;
        }
    }

    if (proc->kind == 0)
    {
        if (proc->unk_4c[0] != 0)
        {
            int r1 = (proc->unk_4c[0] >> 3) - 4;
            xOam1_a = proc->x[0] + r1;
            if ((proc->unk_4c[0] >> 3) == 4)
            {
                proc->unk_4c[0] = 0;
            }
        }

        if (proc->unk_4c[1] != 0)
        {
            int r1 = (proc->unk_4c[1] >> 3) - 4;
            xOam1_b = proc->x[1] - r1;
            if ((proc->unk_4c[1] >> 3) == 4)
            {
                proc->unk_4c[1] = 0;
            }
        }

        if (proc->flags & 1)
        {
            PutSpriteExt(
                0xd, OAM1_X(xOam1_a), OAM0_Y(yOam0_a), gSprite_UiSpinningArrows_Horizontal,
                proc->oam2 + (proc->unk_44[0] >> 3));
        }

        if (proc->flags & 2)
        {
            PutSpriteExt(
                0xd, OAM1_X(xOam1_b) + OAM1_HFLIP, OAM0_Y(yOam0_b), gSprite_UiSpinningArrows_Horizontal,
                proc->oam2 + (proc->unk_44[1] >> 3));
        }
    }

    if (proc->kind == 1)
    {
        if (proc->unk_4c[0] != 0)
        {
            int r1 = (proc->unk_4c[0] >> 3) - 4;
            yOam0_a = proc->y[0] + r1;
            if ((proc->unk_4c[0] >> 3) == 4)
            {
                proc->unk_4c[0] = 0;
            }
        }

        if (proc->unk_4c[1] != 0)
        {
            int r1 = (proc->unk_4c[1] >> 3) - 4;
            yOam0_b = proc->y[1] - r1;
            if ((proc->unk_4c[1] >> 3) == 4)
            {
                proc->unk_4c[1] = 0;
            }
        }

        if (proc->flags & 1)
        {
            PutSpriteExt(
                0xd, OAM1_X(xOam1_a), OAM0_Y(yOam0_a), gSprite_UiSpinningArrows_Vertical,
                proc->oam2 + (proc->unk_44[0] >> 3) * 2);
        }

        if (proc->flags & 2)
        {
            PutSpriteExt(
                0xd, OAM1_X(xOam1_b) + OAM1_VFLIP, OAM0_Y(yOam0_b), gSprite_UiSpinningArrows_Vertical,
                proc->oam2 + (proc->unk_44[1] >> 3) * 2);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_UiSpinningArrows[] =
{
    PROC_CALL(UiSpinningArrows_Init),
    PROC_YIELD,
    PROC_REPEAT(UiSpinningArrows_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080ACCE0
ProcPtr StartUiSpinningArrows(ProcPtr parent)
{
    return Proc_Start(gProcScr_UiSpinningArrows, parent);
}

//! FE8U = 0x080ACCF4
ProcPtr LoadUiSpinningArrowGfx(int kind, int chr, int palId)
{
    int oam2Chr;
    int oam2Pal;

    struct SpinningArrowProc * proc = Proc_Find(gProcScr_UiSpinningArrows);

    if (proc != NULL)
    {
        ApplyPalette(Pal_MapBattleInfoNum, palId + 0x10);

        if (kind == 0)
        {
            Decompress(gImg_UiSpinningArrow_Horizontal, (void *)(chr + 0x06010000));
        }

        if (kind == 1)
        {
            Decompress(gImg_UiSpinningArrow_Vertical, (void *)(chr + 0x06010000));
        }

        oam2Chr = chr >> 5;
        oam2Pal = OAM2_PAL(palId);
        proc->oam2 = oam2Chr + oam2Pal;

        proc->kind = kind;
    }

    // return proc;
}

//! FE8U = 0x080ACD60
void SetUiSpinningArrowConfig(int flags)
{
    struct SpinningArrowProc * proc = Proc_Find(gProcScr_UiSpinningArrows);

    if (proc != NULL)
    {
        proc->flags = flags;
    }

    return;
}

//! FE8U = 0x080ACD7C
void SetUiSpinningArrowPositions(int x1, int y1, int x2, int y2)
{
    struct SpinningArrowProc * proc = Proc_Find(gProcScr_UiSpinningArrows);

    if (proc != NULL)
    {
        proc->x[0] = x1;
        proc->y[0] = y1;

        proc->x[1] = x2;
        proc->y[1] = y2;
    }

    return;
}

//! FE8U = 0x080ACDA4
void SetUiSpinningArrowFastMaybe(int kind)
{
    struct SpinningArrowProc * proc = Proc_Find(gProcScr_UiSpinningArrows);

    if (proc != NULL)
    {
        if (kind == 0)
        {
            proc->unk_4c[0] = 1;
        }

        if (kind == 1)
        {
            proc->unk_4c[1] = 1;
        }

        if (kind == 2)
        {
            proc->unk_4c[0] = 1;
        }

        if (kind == 3)
        {
            proc->unk_4c[1] = 1;
        }
    }

    return;
}

//! FE8U = 0x080ACDDC
void EndUiSpinningArrows(void)
{
    Proc_End(Proc_Find(gProcScr_UiSpinningArrows));
    return;
}
