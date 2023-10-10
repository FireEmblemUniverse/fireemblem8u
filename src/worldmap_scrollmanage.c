#include "global.h"

#include "spline.h"

#include "worldmap.h"

struct ProcA3E4F4
{
    /* 00 */ PROC_HEADER;
    /* 2A */ s16 unk_2a;
    /* 2C */ s16 unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ int unk_3c;
    /* 40 */ u8 unk_40;
    /* 41 */ STRUCT_PAD(0x41, 0x44);
    /* 44 */ int unk_44;
    /* 48 */ int unk_48;
};

struct GMapScrollManageProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int * unk_2c; // pointer to ?
    /* 30 */ int unk_30; // some set of bits?
    /* 34 */ s16 unk_34; // spline degree (?)
    /* 36 */ s16 unk_36; // initial camera x
    /* 38 */ s16 unk_38; // initial camera y
    /* 3A */ s16 unk_3a; // target camera x
    /* 3C */ s16 unk_3c; // target camera y
    /* 40 */ int unk_40; // duration
    /* 44 */ int unk_44; // frame counter
    /* 48 */ s16 unk_48; // start frame countdown (will only start once this reaches 0, else decrease this)
};

struct GmScrollInfo
{
    /* 00 */ int * unk_00; // pointer to ?
    /* 04 */ int unk_04; // some bits?
    /* 08 */ s16 unk_08; // spline degree (?)
    /* 0A */ s16 unk_0a; // initial camera x
    /* 0C */ s16 unk_0c; // initial camera y
    /* 0E */ s16 unk_0e; // target camera x
    /* 10 */ s16 unk_10; // target camera y
    /* 12 */ STRUCT_PAD(0x12, 0x14);
    /* 14 */ int unk_14; // duration
    /* 18 */ s16 unk_18; // delay
};

//! FE8U = 0x080BF180
void sub_80BF180(struct ProcA3E4F4 * proc)
{
    gGMData.unk08 = proc->unk_38;
    gGMData.unk0C = proc->unk_3c;
    return;
}

//! FE8U = 0x080BF190
void sub_80BF190(struct ProcA3E4F4 * proc)
{
    proc->unk_2c = 0;
    return;
}

//! FE8U = 0x080BF198
void sub_80BF198(struct ProcA3E4F4 * proc)
{
    proc->unk_2c++;

    if (proc->unk_2c < proc->unk_2a)
    {
        int coeff = sub_800B7E0(proc->unk_2c, proc->unk_2a, proc->unk_40);
        int x = proc->unk_30 + DivArm(0x1000, proc->unk_44 * coeff);
        int y = proc->unk_34 + DivArm(0x1000, proc->unk_48 * coeff);

        gGMData.unk08 = x;
        gGMData.unk0C = y;
    }
    else
    {
        gGMData.unk08 = proc->unk_38;
        gGMData.unk0C = proc->unk_3c;
        Proc_End(proc);
    }

    return;
}

extern struct ProcCmd gUnknown_08A3E4F4[];

//! FE8U = 0x080BF210
ProcPtr sub_80BF210(struct Vec2 * posA, struct Vec2 * posB, int c, int d, ProcPtr parent)
{
    struct ProcA3E4F4 * proc;

    if (parent)
    {
        proc = Proc_Start(gUnknown_08A3E4F4, parent);
    }
    else
    {
        proc = Proc_Start(gUnknown_08A3E4F4, PROC_TREE_3);
    }

    if (posA == NULL)
    {
        proc->unk_30 = gGMData.unk08;
        proc->unk_34 = gGMData.unk0C;
    }
    else
    {
        proc->unk_30 = posA->x << 8;
        proc->unk_34 = posA->y << 8;
    }

    if (posB == NULL)
    {
        proc->unk_38 = 0;
        proc->unk_3c = 0;
    }
    else
    {
        proc->unk_38 = posB->x << 8;
        proc->unk_3c = posB->y << 8;
    }

    proc->unk_44 = proc->unk_38 - proc->unk_30;
    proc->unk_48 = proc->unk_3c - proc->unk_34;

    proc->unk_2a = c;
    proc->unk_40 = d;

    return proc;
}

//! FE8U = 0x080BF294
s8 sub_80BF294(void)
{
    return (Proc_Find(gUnknown_08A3E4F4)) ? 1 : 0;
}

//! FE8U = 0x080BF2AC
void sub_80BF2AC(struct GMapScrollManageProc * proc)
{
    gGMData.xCamera = proc->unk_3a;
    gGMData.yCamera = proc->unk_3c;

    if (proc->unk_2c)
    {
        *proc->unk_2c |= proc->unk_30;
    }

    return;
}

//! FE8U = 0x080BF2D0
void sub_80BF2D0(struct GMapScrollManageProc * proc)
{
    proc->unk_44 = 0;
    return;
}

//! FE8U = 0x080BF2D8
void sub_80BF2D8(struct GMapScrollManageProc * proc)
{
    if (proc->unk_48 > 0)
    {
        proc->unk_48--;
        return;
    }

    if (*proc->unk_2c & proc->unk_30)
    {
        proc->unk_44 = proc->unk_40;
    }
    else
    {
        proc->unk_44 += 0x1000;
    }

    if (proc->unk_44 < proc->unk_40)
    {
        int coeff = sub_800B84C(proc->unk_44, proc->unk_40, proc->unk_34);
        int x = proc->unk_36 + DivArm(0x1000, (proc->unk_3a - proc->unk_36) * coeff);
        int y = proc->unk_38 + DivArm(0x1000, (proc->unk_3c - proc->unk_38) * coeff);

        gGMData.xCamera = x;
        gGMData.yCamera = y;
    }
    else
    {
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd gUnknown_08A3E52C[];

// StartGmScrollManage
//! FE8U = 0x080BF370
ProcPtr sub_80BF370(struct GmScrollInfo * input, ProcPtr parent)
{
    u16 r1;

    struct GMapScrollManageProc * proc = Proc_Start(gUnknown_08A3E52C, parent);

    if ((input->unk_0a < 0) || (input->unk_0c < 0))
    {
        input->unk_0a = gGMData.xCamera;
        input->unk_0c = gGMData.yCamera;
    }

    r1 = input->unk_0a;
    proc->unk_36 = r1;
    proc->unk_38 = input->unk_0c;

    gGMData.xCamera = r1;
    gGMData.yCamera = proc->unk_38;

    if (input->unk_0e < 0)
    {
        proc->unk_3a = r1;
    }
    else
    {
        proc->unk_3a = input->unk_0e;
    }

    proc->unk_3c = input->unk_10;
    proc->unk_34 = input->unk_08;
    proc->unk_40 = input->unk_14 << 0xc;
    proc->unk_48 = input->unk_18;

    proc->unk_2c = input->unk_00;

    if (proc->unk_2c != 0)
    {
        *proc->unk_2c &= ~input->unk_04;
        proc->unk_30 = input->unk_04;
    }

    return proc;
}

// TODO: definition doesn't match usage

//! FE8U = 0x080BF3F4
ProcPtr sub_80BF3F4(void)
{
    return (Proc_Find(gUnknown_08A3E52C));
}

//! FE8U = 0x080BF404
void sub_80BF404(s16 xStart, s16 yStart, s16 xEnd, s16 yEnd, s16 speed, s16 delay)
{
    struct GmScrollInfo info;

    struct WorldMapMainProc * worldMapProc = Proc_Find(gProcScr_WorldMapMain);
    info.unk_00 = &worldMapProc->unk_30;

    info.unk_04 = 1;
    info.unk_08 = 1;
    info.unk_0a = xStart;
    info.unk_0c = yStart;
    info.unk_0e = xEnd;
    info.unk_10 = yEnd;
    info.unk_14 = speed;
    info.unk_18 = delay;

    sub_80BF370(&info, worldMapProc);

    ((struct WorldMapMainProc *)Proc_Find(gProcScr_WorldMapMain))->unk_50->unk_32--;

    return;
}

//! FE8U = 0x080BF490
int sub_80BF490(void)
{
    struct WorldMapMainProc * worldMapProc = Proc_Find(gProcScr_WorldMapMain);
    return !(worldMapProc->unk_30 & 1);
}

//! FE8U = 0x080BF4A8
void sub_80BF4A8(void)
{
    struct WorldMapMainProc * worldMapProc = Proc_Find(gProcScr_WorldMapMain);
    Proc_EndEach(gUnknown_08A3E52C);

    worldMapProc->unk_30 |= 1;

    return;
}
