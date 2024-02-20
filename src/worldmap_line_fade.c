#include "global.h"

#include "hardware.h"
#include "spline.h"
#include "sysutil.h"

#include "worldmap.h"

struct GmapLineFadeProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29;
    /* 2A */ s16 unk_2a;
    /* 2C */ s16 unk_2c;
};

extern u8 gWmHblankStatus;

//! FE8U = 0x080C0308
void GmapLineFade_OnEnd(void)
{
    gWmHblankStatus &= ~4;

    SetBlendConfig(BLEND_EFFECT_NONE, 0, 0, 0);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 0, 0);

    SetBlendBackdropA(0);
    SetBlendBackdropB(0);

    return;
}

//! FE8U = 0x080C0358
void GmapLineFade_80C0358(struct GmapLineFadeProc * proc)
{
    u16 * bufA;
    u16 * bufB;
    int i;

    u16 * buf = sub_80C1DA0(0, 1);

    int coeff = sub_800B84C(proc->unk_2a, proc->unk_2c, 0);
    s16 a = DivArm(0x1000, (coeff * -0x80)) + 0x80;
    s16 b = DivArm(0x1000, (coeff * -0x80)) + 0x50;

    for (i = 0; i < 0x50; i++)
    {
        if (i >= a)
        {
            buf[i] = 0;
            continue;
        }

        if (i >= b)
        {
            s16 tmp = (i - b);
            coeff = sub_800B84C(tmp, 0x30, 0);
            buf[i] = DivArm(0x1000, (coeff = (0x1000 - coeff)) * 0x10);
            continue;
        }

        buf[i] = 0x10;
    }

    bufA = buf;
    bufB = buf + 0x9f;
    for (i = 0; i < 0x50; i++)
    {
        *bufB-- = *bufA++;
    }

    sub_80C1DC8();

    return;
}

//! FE8U = 0x080C040C
void GmapLineFade_Init(struct GmapLineFadeProc * proc)
{
#ifndef NONMATCHING
    int size = 0x010000A0;
#endif

    if (proc->unk_29 == 2)
    {
        NewFadeIn(1, 0);
        proc->unk_2c = 100;
    }
    else
    {
        NewFadeIn(2, 0);
        proc->unk_2c = 50;
    }

    proc->unk_2a = 0;

#ifdef NONMATCHING
    CpuFill16(0x10, sub_80C1DA0(0, 0), 0x140);
#else
    {
        vu16 tmp = (vu16)0x10;
        CpuSet((void *)(&tmp), sub_80C1DA0(0, 0), size);
    }
#endif

    sub_80C1DD8(0, 0x04000054);
    sub_80C1DE8(0);

    SetBlendConfig(BLEND_EFFECT_DARKEN, 16, 16, 16);

    SetDispEnable(0, 1, 1, 1, 1);

    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendTargetB(0, 0, 0, 0, 0);

    SetBlendBackdropA(0);
    SetBlendBackdropB(0);

    gWmHblankStatus |= 4;

    return;
}

//! FE8U = 0x080C04CC
void GmapLineFade_Loop(struct GmapLineFadeProc * proc)
{
    proc->unk_2a++;

    if (proc->unk_2a < proc->unk_2c)
    {
        GmapLineFade_80C0358(proc);
    }
    else
    {
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_GmapLineFade[] =
{
    PROC_NAME("Gmap Line Fade"),
    PROC_MARK(PROC_MARK_8),

    PROC_SET_END_CB(GmapLineFade_OnEnd),

    PROC_CALL(GmapLineFade_Init),
    PROC_YIELD,

    PROC_REPEAT(GmapLineFade_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080C04F4
ProcPtr StartGmapLineFade(int unk, ProcPtr parent)
{
    struct GmapLineFadeProc * proc;

    if (parent != NULL)
    {
        proc = Proc_StartBlocking(gProcScr_GmapLineFade, parent);
    }
    else
    {
        proc = Proc_Start(gProcScr_GmapLineFade, PROC_TREE_3);
    }

    proc->unk_29 = unk;

    return proc;
}

//! FE8U = 0x080C0520
void EndGmapLineFade(void)
{
    Proc_EndEach(gProcScr_GmapLineFade);
    return;
}

//! FE8U = 0x080C0530
bool IsGmapLineFadeActive(void)
{
    return Proc_Find(gProcScr_GmapLineFade) ? TRUE : FALSE;
}
