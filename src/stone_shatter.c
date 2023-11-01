#include "global.h"

#include "hardware.h"
#include "bmlib.h"

#include "stone_shatter.h"

//! FE8U = 0x080AE4D8
void StoneShatterAnim_Init(struct StoneShatterProc * proc)
{
    proc->unk_2c = 0;
    proc->unk_34 = 0;
    proc->unk_3c = 0;
    proc->unk_44 = 0;
    proc->unk_40 = 0;
    proc->unk_48 = 0;
    proc->unk_37 = 0;
    proc->unk_38 = 0;
    proc->unk_4c = 0;
    proc->unk_50 = 0;
    proc->unk_58 = 0;
    proc->unk_39 = 0;
    proc->unk_54 = 0;
    proc->unk_30 = 0;
    proc->unk_32 = 0;
    proc->unk_3a = 1;
    proc->unk_36 = 0;

    return;
}

//! FE8U = 0x080AE518
void StoneShatterAnim_Loop(struct StoneShatterProc * proc)
{
    struct Unknown08592628 * unk_2c = proc->unk_2c;

    if (proc->unk_58 != NULL)
    {
        proc->unk_39 = 0;

        if (proc->unk_58(proc) != 0)
        {
            return;
        }
    }
    else
    {
        proc->unk_58 = NULL;
    }

    while (1)
    {
        if (unk_2c->unk_00 == 4)
        {
            unk_2c++;
        }

        if (unk_2c->unk_00 == 5)
        {
            if (proc->unk_3a != 0)
            {
                if (proc->unk_36 == 0)
                {
                    proc->unk_36 = unk_2c->unk_0a;
                }
                else if (proc->unk_36 > 0)
                {
                    proc->unk_36 = proc->unk_36 - 1;
                }

                if (proc->unk_36 != 0)
                {
                    int i;
                    struct Unknown08592628 * unk_2c_ = unk_2c - 1;
                    for (i = unk_2c_->unk_00; i != 4; i = unk_2c_->unk_00)
                    {
                        unk_2c = unk_2c_;
                        unk_2c_--;
                    }
                }
                else
                {
                    unk_2c++;
                }
            }
            else
            {
                proc->unk_36 = 0;
                unk_2c++;
            }
        }

        if (unk_2c->unk_00 == 8)
        {
            if (proc->unk_58 != 0)
            {
                proc->unk_54++;
                proc->unk_39 = 1;
                proc->unk_58(proc);
            }

            unk_2c++;
        }

        if (unk_2c->unk_00 == 6)
        {
            break;
        }

        if (unk_2c->unk_00 < 11 && unk_2c->unk_00 > 8)
        {
            Proc_Break(proc);
            break;
        }

        if (proc->unk_38 == 0)
        {
            switch (unk_2c->unk_00)
            {
                case 0:
                case 1:
                    if (proc->unk_44 == 0)
                    {
                        proc->unk_37 = 1 - proc->unk_37;
                    }
                    break;
            }

            switch (unk_2c->unk_00)
            {
                case 0:
                    CpuFastCopy(
                        unk_2c->unk_04,
                        (void *)(0x6000000 + proc->unk_3c + proc->unk_40 + proc->unk_44 + proc->unk_37 * proc->unk_48),
                        unk_2c->unk_08);

                    proc->unk_44 = proc->unk_44 + unk_2c->unk_08;

                    break;

                case 1:
                    Decompress(
                        unk_2c->unk_04,
                        (void *)(0x6000000 + proc->unk_3c + proc->unk_40 + proc->unk_44 + proc->unk_37 * proc->unk_48));

                    proc->unk_44 = proc->unk_44 + unk_2c->unk_08;

                    break;

                case 2:
                    if (proc->unk_48 == 0x8000)
                    {
                        SetBackgroundTileDataOffset(proc->unk_34, (proc->unk_3c + (proc->unk_37 << 0xf)) & 0xFFFF);
                    }

                    CallARM_FillTileRect(
                        BG_GetMapBuffer(proc->unk_34), unk_2c->unk_04,
                        (u16)((proc->unk_35 << 0xc) +
                              (((proc->unk_40 + proc->unk_37 * proc->unk_48) << 0x11) >> 0x16)));

                    proc->unk_44 = 0;
                    BG_EnableSyncByMask(1 << proc->unk_34);

                    break;

                case 3:
                    ApplyPalettes(unk_2c->unk_04, proc->unk_35, unk_2c->unk_08);
                    break;
            }
        }

        proc->unk_38++;

        if (proc->unk_38 <= unk_2c->unk_0a)
        {
            break;
        }

        unk_2c++;
        proc->unk_38 = 0;
    }

    proc->unk_2c = unk_2c;
    proc->unk_50++;

    return;
}

//! FE8U = 0x080AE71C
void StoneShatterAnim_Finish(struct StoneShatterProc * proc)
{
    if (proc->unk_2c->unk_00 == 10)
    {
        SetBackgroundTileDataOffset(proc->unk_34, proc->unk_3c);
        BG_Fill(BG_GetMapBuffer(proc->unk_34), 0);
        BG_EnableSyncByMask(1 << proc->unk_34);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_StoneShatterAnimFx[] =
{
    PROC_CALL(StoneShatterAnim_Init),
    PROC_YIELD,

    PROC_REPEAT(StoneShatterAnim_Loop),
    PROC_CALL(StoneShatterAnim_Finish),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080AE750
s8 IsStoneShatterAnimActive(void)
{
    if (Proc_Find(gProcScr_StoneShatterAnimFx))
    {
        return 1;
    }

    return 0;
}

//! FE8U = 0x080AE76C
void sub_80AE76C(void)
{
    struct StoneShatterProc * proc = Proc_Find(gProcScr_StoneShatterAnimFx);

    if ((proc != NULL) && (proc->unk_2c->unk_00 == 6))
    {
        proc->unk_2c++;
    }

    return;
}

//! FE8U = 0x080AE790
void EndStoneShatterAnim(void)
{
    Proc_End(Proc_Find(gProcScr_StoneShatterAnimFx));
    return;
}

//! FE8U = 0x080AE7A4
void sub_80AE7A4(u8 a)
{
    struct StoneShatterProc * proc = Proc_Find(gProcScr_StoneShatterAnimFx);

    if (proc != NULL)
    {
        proc->unk_3a = a;
    }

    return;
}

//! FE8U = 0x080AE7C4
void StartStoneShatterAnimCore(struct Unknown08592628 * input, int bg, int x, int y, int e, int f, int g, void * func, ProcPtr parent)
{
    struct StoneShatterProc * proc;

    if (parent == NULL)
    {
        proc = Proc_Start(gProcScr_StoneShatterAnimFx, PROC_TREE_3);
    }
    else
    {
        proc = Proc_Start(gProcScr_StoneShatterAnimFx, parent);
    }

    proc->unk_2c = input;
    proc->unk_34 = bg;
    proc->unk_35 = g;

    if (f < 0)
    {
        f = 0x4000;
    }

    if (e < 0)
    {
        e = 0;
    }

    proc->unk_3c = GetBackgroundTileDataOffset(bg);
    proc->unk_40 = e;
    proc->unk_48 = f;
    proc->unk_30 = x;
    proc->unk_32 = y;

    proc->unk_58 = func;

    BG_SetPosition(bg, -x & 0xff, -y & 0xff);

    for (; input->unk_00 < 10; input++)
    {
        proc->unk_4c += input->unk_0a;
    }

    return;
}
