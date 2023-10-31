#include "global.h"

#include "ctc.h"
#include "bmlib.h"
#include "hardware.h"

typedef void ParallelWorkerFunc(ProcPtr);

struct ParallelFiniteLoopProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int maxCount;
    /* 30 */ int count;
    /* 34 */ ParallelWorkerFunc * func;
};

struct Proc8A20BD4
{
    /* 00 */ PROC_HEADER;
    /* 2A */ s16 x[4];
    /* 32 */ s16 y[4];
    /* 3A */ s8 height[4];
    /* 3E */ s8 width[4];
    /* 42 */ u16 unk_42[4];
    /* 4A */ u8 unk_4a[4];
    /* 4E */ u16 unk_4e;
};

struct ParallelWorkerProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ ParallelWorkerFunc * func;
};

//! FE8U = 0x080ACDF0
void ParallelFiniteLoop_Init(struct ParallelFiniteLoopProc * proc)
{
    proc->count = 0;
    return;
}

//! FE8U = 0x080ACDF8
void ParallelFiniteLoop_Loop(struct ParallelFiniteLoopProc * proc)
{
    if (proc->count >= proc->maxCount)
    {
        proc->func(proc->proc_parent);
        Proc_Break(proc);
    }

    proc->count++;

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_ParallelFiniteLoop[] =
{
    PROC_YIELD,

    PROC_CALL(ParallelFiniteLoop_Init),
    PROC_REPEAT(ParallelFiniteLoop_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080ACE20
void StartParallelFiniteLoop(void * func, int count, ProcPtr parent)
{
    struct ParallelFiniteLoopProc * proc = Proc_Start(ProcScr_ParallelFiniteLoop, parent);
    proc->maxCount = count;
    proc->func = (ParallelWorkerFunc *)func;
    return;
}

//! FE8U = 0x080ACE3C
void sub_80ACE3C(struct Proc8A20BD4 * proc)
{
    int i;

    for (i = 0; i < 4; i++)
    {
        proc->unk_4a[i] = 0;
    }

    return;
}

//! FE8U = 0x080ACE54
void sub_80ACE54(struct Proc8A20BD4 * proc)
{
    int i;
    int j;
    int k;
    int xOam1;
    int yOam0;

    for (i = 0; i < 4; i++)
    {
        if (proc->unk_4a[i] == 0)
        {
            continue;
        }

        if (proc->width[i] > 1)
        {
            if (proc->height[i] > 1)
            {
                PutSpriteExt(0xd, proc->x[i] | OAM1_HFLIP, proc->y[i], gObject_8x8, proc->unk_4e + proc->unk_42[i] + 4);
                PutSpriteExt(
                    0xd, proc->x[i] + (proc->width[i] - 1) * 8, proc->y[i], gObject_8x8,
                    proc->unk_4e + proc->unk_42[i] + 4);
                PutSpriteExt(
                    0xd, proc->x[i] | OAM1_HFLIP | OAM1_VFLIP, proc->y[i] + (proc->height[i] - 1) * 8, gObject_8x8,
                    proc->unk_4e + proc->unk_42[i] + 4);
                PutSpriteExt(
                    0xd, (proc->x[i] + (proc->width[i] - 1) * 8) | OAM1_VFLIP, proc->y[i] + (proc->height[i] - 1) * 8,
                    gObject_8x8, proc->unk_4e + proc->unk_42[i] + 4);

                j = proc->width[i] - 2;

                yOam0 = proc->y[i];
                xOam1 = proc->x[i] + 8;

                for (; j > 3; j -= 4)
                {
                    PutSpriteExt(0xd, xOam1, yOam0, gObject_32x8, proc->unk_4e + proc->unk_42[i]);
                    xOam1 = xOam1 + 0x20;
                }

                for (; j > 1; j -= 2)
                {
                    PutSpriteExt(0xd, xOam1, yOam0, gObject_16x8, proc->unk_4e + proc->unk_42[i]);
                    xOam1 = xOam1 + 0x10;
                }

                for (; j > 0; j--)
                {
                    PutSpriteExt(0xd, xOam1, yOam0, gObject_8x8, proc->unk_4e + proc->unk_42[i]);
                    xOam1 = xOam1 + 8;
                }

                j = proc->width[i] - 2;
                yOam0 = proc->y[i] + (proc->height[i] - 1) * 8;
                xOam1 = proc->x[i] + 8;

                for (; j > 3; j -= 4)
                {
                    PutSpriteExt(0xd, xOam1, yOam0, gObject_32x8, proc->unk_4e + proc->unk_42[i]);
                    xOam1 = xOam1 + 0x20;
                }

                for (; j > 1; j -= 2)
                {
                    PutSpriteExt(0xd, xOam1, yOam0, gObject_16x8, proc->unk_4e + proc->unk_42[i]);
                    xOam1 = xOam1 + 0x10;
                }

                for (; j > 0; j--)
                {
                    PutSpriteExt(0xd, xOam1, yOam0, gObject_8x8, proc->unk_4e + proc->unk_42[i]);
                    xOam1 = xOam1 + 8;
                }

                k = proc->height[i] - 2;
                yOam0 = proc->y[i] + 8;

                for (; k > 0; yOam0 += 8, k--)
                {
                    j = proc->width[i];
                    xOam1 = proc->x[i];

                    for (; j > 3; j -= 4)
                    {
                        PutSpriteExt(0xd, xOam1, yOam0, gObject_32x8, proc->unk_4e + proc->unk_42[i]);
                        xOam1 = xOam1 + 0x20;
                    }

                    for (; j > 1; j -= 2)
                    {
                        PutSpriteExt(0xd, xOam1, yOam0, gObject_16x8, proc->unk_4e + proc->unk_42[i]);
                        xOam1 = xOam1 + 0x10;
                    }

                    for (; j > 0; j--)
                    {
                        PutSpriteExt(0xd, xOam1, yOam0, gObject_8x8, proc->unk_4e + proc->unk_42[i]);
                        xOam1 = xOam1 + 8;
                    }
                }
            }
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_08A20BD4[] =
{
    PROC_CALL(sub_80ACE3C),

PROC_LABEL(0),
    PROC_REPEAT(sub_80ACE54),

PROC_LABEL(1),
    PROC_BLOCK,

    PROC_END,
};

// clang-format on

//! FE8U = 0x080AD1AC
ProcPtr sub_80AD1AC(ProcPtr parent)
{
    Proc_End(Proc_Find(gProcScr_08A20BD4));
    return Proc_Start(gProcScr_08A20BD4, parent);
}

//! FE8U = 0x080AD1D0
void sub_80AD1D0(int chr)
{
    struct Proc8A20BD4 * proc = Proc_Find(gProcScr_08A20BD4);

    if (proc != NULL)
    {
        proc->unk_4e = (((uintptr_t)chr << 0xf) >> 0x14);
        Decompress(gUnknown_08A2E950, (void *)(0x06010000 + chr));
    }

    return;
}

//! FE8U = 0x080AD204
void sub_80AD204(int index, int x, int y, int width, int height, u16 f)
{
    struct Proc8A20BD4 * proc = Proc_Find(gProcScr_08A20BD4);

    if (proc != NULL)
    {
        proc->unk_4a[index] = 1;

        proc->x[index] = x;
        proc->y[index] = y;
        proc->width[index] = width;
        proc->height[index] = height;
        proc->unk_42[index] = f;
    }

    return;
}

//! FE8U = 0x080AD26C
void sub_80AD26C(int index)
{
    struct Proc8A20BD4 * proc = Proc_Find(gProcScr_08A20BD4);

    if (proc != NULL)
    {
        proc->unk_4a[index] = 0;
    }

    return;
}

//! FE8U = 0x080AD28C
void sub_80AD28C(void)
{
    struct Proc8A20BD4 * proc = Proc_Find(gProcScr_08A20BD4);

    if (proc != NULL)
    {
        Proc_Goto(proc, 1);
    }

    return;
}

//! FE8U = 0x080AD2A8
void sub_80AD2A8(void)
{
    struct Proc8A20BD4 * proc = Proc_Find(gProcScr_08A20BD4);

    if (proc != NULL)
    {
        Proc_Goto(proc, 0);
        sub_80AD1D0(proc->unk_4e * CHR_SIZE);
    }

    return;
}

//! FE8U = 0x080AD2D4
void sub_80AD2D4(void)
{
    Proc_End(Proc_Find(gProcScr_08A20BD4));
    return;
}

//! FE8U = 0x080AD2E8
void ParallelWorker_OnLoop(struct ParallelWorkerProc * proc)
{
    proc->func(proc->proc_parent);
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_ParallelWorker[] =
{
    PROC_YIELD,
    PROC_REPEAT(ParallelWorker_OnLoop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080AD2F8
ProcPtr StartParallelWorker(void * func, ProcPtr parent)
{
    struct ParallelWorkerProc * proc = GetParallelWorker(func);
    if (proc == NULL)
    {
        proc = Proc_Start(ProcScr_ParallelWorker, parent);
        proc->func = (ParallelWorkerFunc *)func;
    }

    return proc;
}

//! FE8U = 0x080AD31C
void EndAllParallelWorkers(void)
{
    while (1)
    {
        ProcPtr proc = Proc_Find(ProcScr_ParallelWorker);
        if (proc == NULL)
        {
            break;
        }

        Proc_End(proc);
    }

    return;
}

//! FE8U = 0x080AD338
ProcPtr GetParallelWorker(void * func)
{
    struct ParallelWorkerProc * proc = NULL;

    while ((proc = Proc_FindAfter(ProcScr_ParallelWorker, (struct Proc *)proc)))
    {
        if (proc->func == func)
        {
            return proc;
        }
    }

    return NULL;
}
