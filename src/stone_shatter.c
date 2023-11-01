#include "global.h"

#include "hardware.h"
#include "bmlib.h"

struct Unknown08592628
{
    /* 00 */ u8 unk_00;
    /* 04 */ void * unk_04;
    /* 08 */ u16 unk_08;
    /* 0A */ u8 unk_0a;
    /* 0B */ STRUCT_PAD(0x0b, 0x0c);
};

typedef s8 Unk58Func(ProcPtr);

struct StoneShatterProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct Unknown08592628 * unk_2c;
    /* 30 */ u16 unk_30;
    /* 32 */ u16 unk_32;
    /* 34 */ u8 unk_34;
    /* 35 */ u8 unk_35;
    /* 36 */ s8 unk_36;
    /* 37 */ u8 unk_37;
    /* 38 */ u8 unk_38;
    /* 39 */ u8 unk_39;
    /* 3A */ s8 unk_3a;
    /* 3B */ STRUCT_PAD(0x3b, 0x3c);
    /* 3C */ int unk_3c;
    /* 40 */ u32 unk_40;
    /* 44 */ int unk_44;
    /* 48 */ u32 unk_48;
    /* 4C */ int unk_4c;
    /* 50 */ int unk_50;
    /* 54 */ int unk_54;
    /* 58 */ Unk58Func * unk_58;
};

//! FE8U = 0x080AE518
void sub_80AE518(struct StoneShatterProc * proc)
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
void sub_80AE71C(struct StoneShatterProc * proc)
{
    if (proc->unk_2c->unk_00 == 10)
    {
        SetBackgroundTileDataOffset(proc->unk_34, proc->unk_3c);
        BG_Fill(BG_GetMapBuffer(proc->unk_34), 0);
        BG_EnableSyncByMask(1 << proc->unk_34);
    }

    return;
}

extern struct ProcCmd gUnknown_08A20DFC[];

//! FE8U = 0x080AE750
s8 sub_80AE750(void)
{
    if (Proc_Find(gUnknown_08A20DFC))
    {
        return 1;
    }

    return 0;
}

//! FE8U = 0x080AE76C
void sub_80AE76C(void)
{
    struct StoneShatterProc * proc = Proc_Find(gUnknown_08A20DFC);

    if ((proc != NULL) && (proc->unk_2c->unk_00 == 6))
    {
        proc->unk_2c++;
    }

    return;
}

//! FE8U = 0x080AE790
void sub_80AE790(void)
{
    Proc_End(Proc_Find(gUnknown_08A20DFC));
    return;
}

//! FE8U = 0x080AE7A4
void sub_80AE7A4(u8 a)
{
    struct StoneShatterProc * proc = Proc_Find(gUnknown_08A20DFC);

    if (proc != NULL)
    {
        proc->unk_3a = a;
    }

    return;
}

//! FE8U = 0x080AE7C4
void sub_80AE7C4(struct Unknown08592628 * input, int bg, int x, int y, int e, int f, int g, void * func, ProcPtr parent)
{
    struct StoneShatterProc * proc;

    if (parent == NULL)
    {
        proc = Proc_Start(gUnknown_08A20DFC, PROC_TREE_3);
    }
    else
    {
        proc = Proc_Start(gUnknown_08A20DFC, parent);
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
