#include "global.h"

#include "worldmap.h"

struct AutoMuTarget
{
    /* 00 */ union
    {
        u8 node;
        struct Vec2 pos;
    } src;
    /* 04 */ union
    {
        u8 node;
        struct Vec2 pos;
    } dst;
};

struct GMapAutoMuProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ u8 unk_29;
    /* 2A */ u8 unk_2a;
    // 2B
    /* 2C */ u16 unk_2c;
    /* 2E */ u16 unk_2e;
    /* 30 */ struct AutoMuTarget unk_30;
    /* 38 */ u8 unk_38;
    /* 39 */ u8 unk_39;
    /* 3A */ s16 unk_3a;
    /* 3C */ s16 unk_3c;
};

//! FE8U = 0x080C3124
void sub_80C3124(struct GMapAutoMuProc * proc)
{
    if (sub_80BE12C(GM_MAIN->unk_54, proc->unk_2c) != 0)
    {
        sub_80BE330(GM_MAIN->unk_54, proc->unk_2c);
    }

    EndGmapUnitFade();

    switch (proc->unk_29)
    {
        case 0:
        default:
            gGMData.units[proc->unk_2c].location = proc->unk_30.dst.node;
            break;

        case 1:
            GmMu_SetPosition(GM_MAIN->unk_54, proc->unk_2c, proc->unk_30.dst.pos.x, proc->unk_30.dst.pos.y);
            break;
    }

    if ((proc->unk_2a & 2) != 0)
    {
        HideGmUnit(proc->unk_2c);
    }

    return;
}

//! FE8U = 0x080C31A8
void sub_80C31A8(struct GMapAutoMuProc * proc)
{
    proc->unk_3c--;

    if (proc->unk_3c < 1)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080C31C4
void sub_80C31C4(struct GMapAutoMuProc * proc)
{
    if ((proc->unk_2a & 1) != 0)
    {
        Proc_Goto(proc, 0);
    }

    return;
}

//! FE8U = 0x080C31E0
void sub_80C31E0(struct GMapAutoMuProc * proc)
{
    if ((proc->unk_2a & 2) != 0)
    {
        Proc_Goto(proc, 4);
    }

    return;
}

//! FE8U = 0x080C31FC
void sub_80C31FC(struct GMapAutoMuProc * proc)
{
    switch (proc->unk_29)
    {
        case 0:
        default:
            Proc_Goto(proc, 1);
            break;

        case 1:
            Proc_Goto(proc, 2);
            break;
    }

    return;
}

//! FE8U = 0x080C3220
void sub_80C3220(struct GMapAutoMuProc * proc)
{
    GmMu_StartFadeIn(GM_MAIN->unk_54, proc->unk_2c, 30);
    ShowGmUnit(proc->unk_2c);

    return;
}

//! FE8U = 0x080C3244
void sub_80C3244(struct GMapAutoMuProc * proc)
{
    GmMu_StartFadeOut(GM_MAIN->unk_54, proc->unk_2c, 30);

    return;
}

//! FE8U = 0x080C3264
void sub_80C3264(struct GMapAutoMuProc * proc)
{
    if (!GmUnitFadeExists())
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080C3280
void sub_80C3280(struct GMapAutoMuProc * proc)
{
    struct UnknownSub80BDEB4 input;

    input.unk_00 = proc->unk_2c;
    input.unk_01 = proc->unk_38;
    input.unk_06 = proc->unk_30.src.node;
    input.unk_08 = proc->unk_30.dst.node;
    input.unk_0c = proc->unk_3a;
    input.unk_0a = 0;
    input.unk_02 = (proc->unk_2a >> 2) & 1;
    input.unk_03 = 0xff;
    input.unk_04 = 4;

    sub_80BDEB4(GM_MAIN->unk_54, &input);

    return;
}

//! FE8U = 0x080C32E4
void sub_80C32E4(struct GMapAutoMuProc * proc)
{
    struct UnknownSub80BDFA4 input;

    input.unk_00 = proc->unk_2c;
    input.unk_01 = proc->unk_39;
    input.unk_02 = proc->unk_38;
    input.unk_06 = proc->unk_30.src.pos.x;
    input.unk_08 = proc->unk_30.src.pos.y;
    input.unk_0a = proc->unk_30.dst.pos.x;
    input.unk_0c = proc->unk_30.dst.pos.y;
    input.unk_10 = proc->unk_3a;
    input.unk_0e = 0;
    input.unk_03 = (proc->unk_2a >> 2) & 1;
    input.unk_04 = 0xff;
    input.unk_05 = 4;

    sub_80BDFA4(GM_MAIN->unk_54, &input);

    return;
}

//! FE8U = 0x080C3350
void sub_80C3350(struct GMapAutoMuProc * proc)
{
    if (!sub_80BE12C(GM_MAIN->unk_54, proc->unk_2c))
    {
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd ProcScr_GmapAutoMu[];

//! FE8U = 0x080C3378
ProcPtr sub_80C3378(struct Sub80C3378 * input, int flag, ProcPtr parent)
{
    struct GMapAutoMuProc * proc;

    if (parent != NULL)
    {
        proc = Proc_StartBlocking(ProcScr_GmapAutoMu, parent);
    }
    else
    {
        proc = Proc_Start(ProcScr_GmapAutoMu, PROC_TREE_3);
    }

    proc->unk_29 = 0;
    proc->unk_2a = flag;

    proc->unk_2c = input->wm_uid;
    proc->unk_38 = input->unk_01;

    proc->unk_30.src.node = input->node1;
    proc->unk_30.dst.node = input->node2;

    proc->unk_3c = input->delay;
    proc->unk_3a = input->speed;

    return proc;
}

//! FE8U = 0x080C33D4
ProcPtr sub_80C33D4(struct Sub80C33D4 * input, int flag, ProcPtr parent)
{
    struct GMapAutoMuProc * proc;

    if (parent != NULL)
    {
        proc = Proc_StartBlocking(ProcScr_GmapAutoMu, parent);
    }
    else
    {
        proc = Proc_Start(ProcScr_GmapAutoMu, PROC_TREE_3);
    }

    proc->unk_29 = 1;
    proc->unk_2a = flag;
    proc->unk_2c = input->unk_00;
    proc->unk_39 = input->unk_01;
    proc->unk_38 = input->unk_02;

    proc->unk_30.src.pos.x = input->unk_06;
    proc->unk_30.src.pos.y = input->unk_08;
    proc->unk_30.dst.pos.x = input->unk_0a;
    proc->unk_30.dst.pos.y = input->unk_0c;

    proc->unk_3c = input->unk_0e;
    proc->unk_3a = input->unk_10;

    return proc;
}

//! FE8U = 0x080C343C
void sub_80C343C(int index)
{
    struct GMapAutoMuProc * proc;
    struct ProcFindIterator procIter;

    if (index < 0)
    {
        Proc_EndEach(ProcScr_GmapAutoMu);
        return;
    }

    Proc_FindBegin(&procIter, ProcScr_GmapAutoMu);
    do
    {
        proc = Proc_FindNext(&procIter);

        if (proc->unk_2c == index)
        {
            Proc_End(proc);
            return;
        }
    } while (proc != NULL);

    return;
}

//! FE8U = 0x080C3484
bool sub_80C3484(int index)
{
    struct GMapAutoMuProc * proc;
    struct ProcFindIterator procIter;

    if (index < 0)
    {
        return Proc_Find(ProcScr_GmapAutoMu) ? true : false;
    }

    Proc_FindBegin(&procIter, ProcScr_GmapAutoMu);
    do
    {
        proc = Proc_FindNext(&procIter);

        if (proc->unk_2c == index)
        {
            return true;
        }
    } while (proc != NULL);

    return false;
}
