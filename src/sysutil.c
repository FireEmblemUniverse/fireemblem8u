#include "global.h"

#include "ctc.h"
#include "bmlib.h"
#include "hardware.h"
#include "prepscreen.h"
#include "bm.h"
#include "uiutils.h"
#include "sysutil.h"

//! FE8U = 0x080ACDF0
void ParallelFiniteLoop_Init(struct ParallelFiniteLoopProc * proc)
{
    proc->count = 0;
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
}

struct ProcCmd CONST_DATA ProcScr_ParallelFiniteLoop[] =
{
    PROC_YIELD,

    PROC_CALL(ParallelFiniteLoop_Init),
    PROC_REPEAT(ParallelFiniteLoop_Loop),

    PROC_END,
};

//! FE8U = 0x080ACE20
void StartParallelFiniteLoop(void * func, int count, ProcPtr parent)
{
    struct ParallelFiniteLoopProc * proc = Proc_Start(ProcScr_ParallelFiniteLoop, parent);
    proc->maxCount = count;
    proc->func = (ParallelWorkerFunc *)func;
    return;
}

//! FE8U = 0x080ACE3C
void SemiTransportWindow_Init(struct SemiTransportWindowProc * proc)
{
    int i;
    for (i = 0; i < 4; i++)
        proc->valid[i] = false;
}

//! FE8U = 0x080ACE54
void SemiTransportWindow_Main(struct SemiTransportWindowProc * proc)
{
    int i;
    int j;
    int k;
    int xOam1;
    int yOam0;

    for (i = 0; i < 4; i++)
    {
        if (proc->valid[i] == false)
            continue;

        if (proc->width[i] > 1)
        {
            if (proc->height[i] > 1)
            {
                PutSpriteExt(0xd, proc->x[i] | OAM1_HFLIP, proc->y[i], gObject_8x8, proc->chr + proc->oam2[i] + 4);
                PutSpriteExt(
                    0xd, proc->x[i] + (proc->width[i] - 1) * 8, proc->y[i], gObject_8x8,
                    proc->chr + proc->oam2[i] + 4);
                PutSpriteExt(
                    0xd, proc->x[i] | OAM1_HFLIP | OAM1_VFLIP, proc->y[i] + (proc->height[i] - 1) * 8, gObject_8x8,
                    proc->chr + proc->oam2[i] + 4);
                PutSpriteExt(
                    0xd, (proc->x[i] + (proc->width[i] - 1) * 8) | OAM1_VFLIP, proc->y[i] + (proc->height[i] - 1) * 8,
                    gObject_8x8, proc->chr + proc->oam2[i] + 4);

                j = proc->width[i] - 2;

                yOam0 = proc->y[i];
                xOam1 = proc->x[i] + 8;

                for (; j > 3; j -= 4)
                {
                    PutSpriteExt(0xd, xOam1, yOam0, gObject_32x8, proc->chr + proc->oam2[i]);
                    xOam1 = xOam1 + 0x20;
                }

                for (; j > 1; j -= 2)
                {
                    PutSpriteExt(0xd, xOam1, yOam0, gObject_16x8, proc->chr + proc->oam2[i]);
                    xOam1 = xOam1 + 0x10;
                }

                for (; j > 0; j--)
                {
                    PutSpriteExt(0xd, xOam1, yOam0, gObject_8x8, proc->chr + proc->oam2[i]);
                    xOam1 = xOam1 + 8;
                }

                j = proc->width[i] - 2;
                yOam0 = proc->y[i] + (proc->height[i] - 1) * 8;
                xOam1 = proc->x[i] + 8;

                for (; j > 3; j -= 4)
                {
                    PutSpriteExt(0xd, xOam1, yOam0, gObject_32x8, proc->chr + proc->oam2[i]);
                    xOam1 = xOam1 + 0x20;
                }

                for (; j > 1; j -= 2)
                {
                    PutSpriteExt(0xd, xOam1, yOam0, gObject_16x8, proc->chr + proc->oam2[i]);
                    xOam1 = xOam1 + 0x10;
                }

                for (; j > 0; j--)
                {
                    PutSpriteExt(0xd, xOam1, yOam0, gObject_8x8, proc->chr + proc->oam2[i]);
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
                        PutSpriteExt(0xd, xOam1, yOam0, gObject_32x8, proc->chr + proc->oam2[i]);
                        xOam1 = xOam1 + 0x20;
                    }

                    for (; j > 1; j -= 2)
                    {
                        PutSpriteExt(0xd, xOam1, yOam0, gObject_16x8, proc->chr + proc->oam2[i]);
                        xOam1 = xOam1 + 0x10;
                    }

                    for (; j > 0; j--)
                    {
                        PutSpriteExt(0xd, xOam1, yOam0, gObject_8x8, proc->chr + proc->oam2[i]);
                        xOam1 = xOam1 + 8;
                    }
                }
            }
        }
    }
}

struct ProcCmd CONST_DATA ProcScr_PrepSemiTransportWindow[] =
{
    PROC_CALL(SemiTransportWindow_Init),

PROC_LABEL(0),
    PROC_REPEAT(SemiTransportWindow_Main),

PROC_LABEL(1),
    PROC_BLOCK,

    PROC_END,
};

//! FE8U = 0x080AD1AC
ProcPtr NewSemiTransportWindowHandler(ProcPtr parent)
{
    Proc_End(Proc_Find(ProcScr_PrepSemiTransportWindow));
    return Proc_Start(ProcScr_PrepSemiTransportWindow, parent);
}

//! FE8U = 0x080AD1D0
void SemiTransportWindowSetGfx(u32 obj_offset)
{
    struct SemiTransportWindowProc * proc = Proc_Find(ProcScr_PrepSemiTransportWindow);

    if (proc != NULL)
    {
        proc->chr = ((obj_offset << 0xf) >> 0x14);
        Decompress(gUnknown_08A2E950, OBJ_VRAM0 + obj_offset);
    }
}

//! FE8U = 0x080AD204
void EnableSemiTransportWindow(int index, int x, int y, int width, int height, u16 oam2)
{
    struct SemiTransportWindowProc * proc = Proc_Find(ProcScr_PrepSemiTransportWindow);

    if (proc != NULL)
    {
        proc->valid[index] = true;

        proc->x[index] = x;
        proc->y[index] = y;
        proc->width[index] = width;
        proc->height[index] = height;
        proc->oam2[index] = oam2;
    }
}

//! FE8U = 0x080AD26C
void DisableSemiTransportWindow(int index)
{
    struct SemiTransportWindowProc * proc = Proc_Find(ProcScr_PrepSemiTransportWindow);

    if (proc != NULL)
    {
        proc->valid[index] = 0;
    }
}

//! FE8U = 0x080AD28C
void BlockAllSemiTransportWindows(void)
{
    struct SemiTransportWindowProc * proc = Proc_Find(ProcScr_PrepSemiTransportWindow);

    if (proc != NULL)
        Proc_Goto(proc, 1);
}

//! FE8U = 0x080AD2A8
void UnblockAllSemiTransportWindows(void)
{
    struct SemiTransportWindowProc * proc = Proc_Find(ProcScr_PrepSemiTransportWindow);

    if (proc != NULL)
    {
        Proc_Goto(proc, 0);
        SemiTransportWindowSetGfx(proc->chr * CHR_SIZE);
    }
}

//! FE8U = 0x080AD2D4
void EndSemiTransportWindows(void)
{
    Proc_End(Proc_Find(ProcScr_PrepSemiTransportWindow));
}

//! FE8U = 0x080AD2E8
void ParallelWorker_OnLoop(struct ParallelWorkerProc * proc)
{
    proc->func(proc->proc_parent);
}

struct ProcCmd CONST_DATA ProcScr_ParallelWorker[] = {
    PROC_YIELD,
    PROC_REPEAT(ParallelWorker_OnLoop),
    PROC_END,
};

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
            break;

        Proc_End(proc);
    }
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

void DisplayExtendedSysHand(struct SysHandCursorProc * proc)
{
    int i;

#if !NONMATCHING
    u32 clk;
    u16 * src, * dst, * _dst;

    clk = GetGameClock();
    dst = gPaletteBuffer;
    _dst = dst + (proc->pal_bank * 0x10  + 0x10E);
    src = &PAL_BUF_COLOR(Pal_08A1D448, gPlaySt.config.windowColor, (clk / 4) % 0x10);
    *_dst = *src;
#else
    gPaletteBuffer[proc->pal_bank * 0x10  + 0x10E] =
        Pal_08A1D448[gPlaySt.config.windowColor * 0x10 + ((GetGameClock() / 5) % 0x10)];
#endif

    EnablePaletteSync();
    PutSpriteExt(4, proc->x, proc->y + 8, gObject_8x8,
        OAM2_PAL(proc->pal_bank) + proc->chr2 + proc->chr);

    for (i = 1; i < proc->shadow_len; i++)
        PutSpriteExt(4, proc->x + i * 8, proc->y + 8, gObject_8x8,
            OAM2_PAL(proc->pal_bank) + proc->chr2 + proc->chr + 1);

    PutSpriteExt(4, proc->x + proc->shadow_len * 8, proc->y + 8, gObject_8x8,
        OAM2_PAL(proc->pal_bank) + proc->chr2 + proc->chr + 2);
}

void SysHandCursor_Init(struct SysHandCursorProc * proc)
{
    proc->enable_sysshadow = false;
}

void SysHandCursor_Loop(struct SysHandCursorProc * proc)
{
    DisplayUiHand(proc->x, proc->y);

    if (proc->enable_sysshadow != false)
        DisplayExtendedSysHand(proc);

    if (proc->enable_bmshadow != false)
        DisplayBmTextShadow(proc->x, proc->y + 2);
}

CONST_DATA struct ProcCmd ProcScr_SysHandCtrl[] = {
    PROC_CALL(SysHandCursor_Init),

PROC_LABEL(0),
    PROC_BLOCK,

PROC_LABEL(1),
    PROC_REPEAT(SysHandCursor_Loop),
    PROC_END
};

ProcPtr ResetSysHandCursor(ProcPtr parent)
{
    Proc_End(Proc_Find(ProcScr_SysHandCtrl));
    return Proc_Start(ProcScr_SysHandCtrl, parent);
}

void DisplaySysHandCursorTextShadow(u32 vobj_offset, u32 pal)
{
    struct SysHandCursorProc * proc = Proc_Find(ProcScr_SysHandCtrl);
    if (proc)
    {
        proc->enable_bmshadow = false;
        proc->chr = (vobj_offset << 0xF) >> 0x14;
        proc->pal_bank = pal & 0xF;
        Decompress(Img_PrepTextShadow, OBJ_VRAM0 + vobj_offset);
    }
}

void SetSysHandCursorXPos(int x)
{
    struct SysHandCursorProc * proc = Proc_Find(ProcScr_SysHandCtrl);
    if (proc)
        proc->x = x;
}

void SetSysHandCursorYPos(int y)
{
    struct SysHandCursorProc * proc = Proc_Find(ProcScr_SysHandCtrl);
    if (proc)
        proc->y = y;
}

void ShowSysHandCursor(int x, int y, int shadow_len, u16 chr)
{
    struct SysHandCursorProc * proc = Proc_Find(ProcScr_SysHandCtrl);
    if (proc)
    {
        proc->x = x;
        proc->y = y;

        if (shadow_len == 0)
            proc->enable_sysshadow = false;
        else
        {
            proc->enable_sysshadow = true;
            proc->shadow_len = shadow_len;
            proc->chr2 = chr;
        }
        Proc_Goto(proc, 1);
    }
}

void HideSysHandCursor(void)
{
    struct SysHandCursorProc * proc = Proc_Find(ProcScr_SysHandCtrl);
    if (proc)
        Proc_Goto(proc, 0);
}

void EndSysHandCursor(void)
{
    Proc_End(Proc_Find(ProcScr_SysHandCtrl));
}

void configSysHandCursorShadowEnabled(u8 enabled)
{
    struct SysHandCursorProc * proc = Proc_Find(ProcScr_SysHandCtrl);
    if (proc)
        proc->enable_bmshadow = enabled;
}
