#include "global.h"

#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "prepscreen.h" // for graphics / palette declarations

struct SpinningArrowProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34[2];
    /* 3C */ int unk_3c[2];
    /* 44 */ int unk_44[2];
    /* 4C */ int unk_4c[2];
    /* 54 */ u16 unk_54;
};

//! FE8U = 0x080ACB14
void sub_80ACB14(struct SpinningArrowProc * proc)
{
    proc->unk_2c = 0;
    proc->unk_54 = 0;

    proc->unk_4c[0] = 0;
    proc->unk_44[0] = 0;
    proc->unk_3c[0] = 0;
    proc->unk_34[0] = 0;

    proc->unk_4c[1] = 0;
    proc->unk_44[1] = 0;
    proc->unk_3c[1] = 0;
    proc->unk_34[1] = 0;

    proc->unk_30 = 0;

    return;
}

extern u16 gUnknown_08A20B7C[];
extern u16 gUnknown_08A20B8A[];

//! FE8U = 0x080ACB34
void sub_80ACB34(struct SpinningArrowProc * proc)
{
    int i;

    int xOam1_a = proc->unk_34[0];
    int yOam0_a = proc->unk_3c[0];

    int xOam1_b = proc->unk_34[1];
    int yOam0_b = proc->unk_3c[1];

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

    if (proc->unk_2c == 0)
    {
        if (proc->unk_4c[0] != 0)
        {
            int r1 = (proc->unk_4c[0] >> 3) - 4;
            xOam1_a = proc->unk_34[0] + r1;
            if ((proc->unk_4c[0] >> 3) == 4)
            {
                proc->unk_4c[0] = 0;
            }
        }

        if (proc->unk_4c[1] != 0)
        {
            int r1 = (proc->unk_4c[1] >> 3) - 4;
            xOam1_b = proc->unk_34[1] - r1;
            if ((proc->unk_4c[1] >> 3) == 4)
            {
                proc->unk_4c[1] = 0;
            }
        }

        if ((proc->unk_30 & 1) != 0)
        {
            PutSpriteExt(
                0xd, OAM1_X(xOam1_a), OAM0_Y(yOam0_a), gUnknown_08A20B7C, proc->unk_54 + (proc->unk_44[0] >> 3));
        }

        if ((proc->unk_30 & 2) != 0)
        {
            PutSpriteExt(
                0xd, OAM1_X(xOam1_b) + OAM1_HFLIP, OAM0_Y(yOam0_b), gUnknown_08A20B7C,
                proc->unk_54 + (proc->unk_44[1] >> 3));
        }
    }

    if (proc->unk_2c == 1)
    {
        if (proc->unk_4c[0] != 0)
        {
            int r1 = (proc->unk_4c[0] >> 3) - 4;
            yOam0_a = proc->unk_3c[0] + r1;
            if ((proc->unk_4c[0] >> 3) == 4)
            {
                proc->unk_4c[0] = 0;
            }
        }

        if (proc->unk_4c[1] != 0)
        {
            int r1 = (proc->unk_4c[1] >> 3) - 4;
            yOam0_b = proc->unk_3c[1] - r1;
            if ((proc->unk_4c[1] >> 3) == 4)
            {
                proc->unk_4c[1] = 0;
            }
        }

        if (proc->unk_30 & 1)
        {
            PutSpriteExt(
                0xd, OAM1_X(xOam1_a), OAM0_Y(yOam0_a), gUnknown_08A20B8A, proc->unk_54 + (proc->unk_44[0] >> 3) * 2);
        }

        if (proc->unk_30 & 2)
        {
            PutSpriteExt(
                0xd, OAM1_X(xOam1_b) + OAM1_VFLIP, OAM0_Y(yOam0_b), gUnknown_08A20B8A,
                proc->unk_54 + (proc->unk_44[1] >> 3) * 2);
        }
    }

    return;
}

extern struct ProcCmd gUnknown_08A20B94[];

//! FE8U = 0x080ACCE0
ProcPtr sub_80ACCE0(ProcPtr parent)
{
    return Proc_Start(gUnknown_08A20B94, parent);
}

//! FE8U = 0x080ACCF4
ProcPtr sub_80ACCF4(int kind, int chr, int palId)
{
    int oam2Chr;
    int oam2Pal;

    struct SpinningArrowProc * proc = Proc_Find(gUnknown_08A20B94);

    if (proc != NULL)
    {
        ApplyPalette(Pal_MapBattleInfoNum, palId + 0x10);

        if (kind == 0)
        {
            Decompress(gUnknown_08A1C7D8, (void *)(chr + 0x06010000));
        }

        if (kind == 1)
        {
            Decompress(gUnknown_08A1C704, (void *)(chr + 0x06010000));
        }

        oam2Chr = chr >> 5;
        oam2Pal = OAM2_PAL(palId);
        proc->unk_54 = oam2Chr + oam2Pal;

        proc->unk_2c = kind;
    }

    // return proc;
}

//! FE8U = 0x080ACD60
void sub_80ACD60(int flags)
{
    struct SpinningArrowProc * proc = Proc_Find(gUnknown_08A20B94);

    if (proc != NULL)
    {
        proc->unk_30 = flags;
    }

    return;
}

//! FE8U = 0x080ACD7C
void sub_80ACD7C(int x1, int y1, int x2, int y2)
{
    struct SpinningArrowProc * proc = Proc_Find(gUnknown_08A20B94);

    if (proc != NULL)
    {
        proc->unk_34[0] = x1;
        proc->unk_3c[0] = y1;

        proc->unk_34[1] = x2;
        proc->unk_3c[1] = y2;
    }

    return;
}

//! FE8U = 0x080ACDA4
void sub_80ACDA4(int kind)
{
    struct SpinningArrowProc * proc = Proc_Find(gUnknown_08A20B94);

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
void sub_80ACDDC(void)
{
    Proc_End(Proc_Find(gUnknown_08A20B94));
    return;
}
