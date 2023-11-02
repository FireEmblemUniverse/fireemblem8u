#include "global.h"

#include "bm.h"
#include "ctc.h"
#include "bmlib.h"
#include "hardware.h"
#include "prepscreen.h"
#include "uiutils.h"
#include "fontgrp.h"
#include "sysutil.h"

void ParallelFiniteLoop_Init(struct ParallelFiniteLoopProc * proc)
{
    proc->count = 0;
}

void ParallelFiniteLoop_Loop(struct ParallelFiniteLoopProc * proc)
{
    if (proc->count >= proc->maxCount)
    {
        proc->func(proc->proc_parent);
        Proc_Break(proc);
    }
    proc->count++;
}

struct ProcCmd CONST_DATA ProcScr_ParallelFiniteLoop[] = {
    PROC_YIELD,
    PROC_CALL(ParallelFiniteLoop_Init),
    PROC_REPEAT(ParallelFiniteLoop_Loop),
    PROC_END,
};

void StartParallelFiniteLoop(void * func, int count, ProcPtr parent)
{
    struct ParallelFiniteLoopProc * proc =
        Proc_Start(ProcScr_ParallelFiniteLoop, parent);

    proc->maxCount = count;
    proc->func = (ParallelWorkerFunc *)func;
}

void SemiTransBox_Init(struct SemiTransBoxProc * proc)
{
    int i;
    for (i = 0; i < 4; i++)
        proc->valid[i] = 0;
}

void SemiTransBox_Main(struct SemiTransBoxProc * proc)
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

struct ProcCmd CONST_DATA ProcScr_SysSemiTransBox[] = {
    PROC_CALL(SemiTransBox_Init),

PROC_LABEL(0),
    PROC_REPEAT(SemiTransBox_Main),

PROC_LABEL(1),
    PROC_BLOCK,

    PROC_END,
};

ProcPtr NewSemiTransBoxHandler(ProcPtr parent)
{
    Proc_End(Proc_Find(ProcScr_SysSemiTransBox));
    return Proc_Start(ProcScr_SysSemiTransBox, parent);
}

void SemiTransBoxSetGfx(u32 obj_offset)
{
    struct SemiTransBoxProc * proc = Proc_Find(ProcScr_SysSemiTransBox);

    if (proc != NULL)
    {
        proc->chr = ((obj_offset << 0xf) >> 0x14);
        Decompress(gUnknown_08A2E950, OBJ_VRAM0 + obj_offset);
    }
}

void EnableSemiTransBox(int index, int x, int y, int width, int height, u16 oam2)
{
    struct SemiTransBoxProc * proc = Proc_Find(ProcScr_SysSemiTransBox);

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

void DisableSemiTransBox(int index)
{
    struct SemiTransBoxProc * proc = Proc_Find(ProcScr_SysSemiTransBox);
    if (proc != NULL)
        proc->valid[index] = 0;
}

void BlockAllSemiTransBoxs(void)
{
    struct SemiTransBoxProc * proc = Proc_Find(ProcScr_SysSemiTransBox);
    if (proc != NULL)
        Proc_Goto(proc, 1);
}

void UnblockAllSemiTransBoxs(void)
{
    struct SemiTransBoxProc * proc = Proc_Find(ProcScr_SysSemiTransBox);
    if (proc != NULL)
    {
        Proc_Goto(proc, 0);
        SemiTransBoxSetGfx(proc->chr * CHR_SIZE);
    }
}

void EndSemiTransBoxs(void)
{
    Proc_End(Proc_Find(ProcScr_SysSemiTransBox));
}

void ParallelWorker_OnLoop(struct ParallelWorkerProc * proc)
{
    proc->func(proc->proc_parent);
    return;
}

struct ProcCmd CONST_DATA ProcScr_ParallelWorker[] = {
    PROC_YIELD,
    PROC_REPEAT(ParallelWorker_OnLoop),
    PROC_END,
};


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
}

ProcPtr GetParallelWorker(void * func)
{
    struct ParallelWorkerProc * proc = NULL;
    while ((proc = Proc_FindAfter(ProcScr_ParallelWorker, (struct Proc *)proc)))
        if (proc->func == func)
            return proc;

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

void ConfigSysHandCursorShadowEnabled(u8 enabled)
{
    struct SysHandCursorProc * proc = Proc_Find(ProcScr_SysHandCtrl);
    if (proc)
        proc->enable_bmshadow = enabled;
}

void DisableAllGfx(void)
{
    SetDispEnable(0, 0, 0, 0, 0);
}

void EnableAllGfx(void)
{
    SetDispEnable(1, 1, 1, 1, 1);
}

void UntransBox_Init(struct ProcSysUntransBox * proc)
{
    int i;
    for (i = 0; i < 4; i++)
        proc->priv[i].valid = 0;
}

void UntransBox_Loop(struct ProcSysUntransBox * proc)
{
    int i, j, k;
    u16 oam2;
    struct SysUntransBoxConf * priv;

    for (i = 0; i < 4; i++)
    {
        priv = &proc->priv[i];

        if (priv->valid == 0)
            continue;

        oam2 = OAM2_PAL(proc->pal) + proc->chr + priv->chr;

        PutSpriteExt(priv->layer, priv->x & 0x1FF, priv->y & 0xFF, gObject_8x8, oam2);

        PutSpriteExt(priv->layer,
            ((priv->x + (priv->width - 1) * 8) & 0x1FF) + 0x1000,
            priv->y & 0xFF, gObject_8x8, oam2);

        PutSpriteExt(priv->layer,
            ((priv->x + (priv->width - 1) * 8) & 0x1FF) + 0x3000,
            (priv->y + (priv->height - 1) * 8) & 0xFF,
            gObject_8x8, oam2);

        PutSpriteExt(priv->layer,
            (priv->x & 0x1FF) + 0x2000,
            (priv->y + (priv->height - 1) * 8) & 0xFF,
            gObject_8x8, oam2);

        j = 1;

        for (; j < (priv->width - 4); j = j + 4)
        {
            PutSpriteExt(priv->layer,
                (priv->x + j * 8) & 0x1FF,
                priv->y & 0xFF,
                gObject_32x8, oam2 + 1);

            PutSpriteExt(priv->layer,
                ((priv->x + j * 8) & 0x1FF) + 0x2000,
                (priv->y + (priv->height - 1) * 8) & 0xFF,
                gObject_32x8, oam2 + 1);
        }

        for (; j < (priv->width - 2); j = j + 2)
        {
            PutSpriteExt(priv->layer,
                (priv->x + j * 8) & 0x1FF,
                priv->y & 0xFF,
                gObject_16x8, oam2 + 1);

            PutSpriteExt(priv->layer,
                ((priv->x + j * 8) & 0x1FF) + 0x2000,
                (priv->y + (priv->height - 1) * 8) & 0xFF,
                gObject_16x8, oam2 + 1);
        }

        for (; j < (priv->width - 1); j = j + 1)
        {
            PutSpriteExt(priv->layer,
                (priv->x + j * 8) & 0x1FF,
                priv->y & 0xFF,
                gObject_8x8, oam2 + 1);

            PutSpriteExt(priv->layer,
                ((priv->x + j * 8) & 0x1FF) + 0x2000,
                (priv->y + (priv->height - 1) * 8) & 0xFF,
                gObject_8x8, oam2 + 1);
        }

        j = 1;
        for (; j < (priv->height - 1); j = j + 1)
        {
            PutSpriteExt(priv->layer,
                priv->x & 0x1FF,
                (priv->y + j * 8) & 0xFF,
                gObject_8x8, oam2 + 9);

            PutSpriteExt(priv->layer,
                ((priv->x + (priv->width - 1) * 8) & 0x1FF) + 0x1000,
                (priv->y + j * 8) & 0xFF,
                gObject_8x8, oam2 + 9);

            k = 1;
            for (; k < (priv->width - 4); k = k + 4)
            {
                PutSpriteExt(priv->layer,
                    (priv->x + k * 8) & 0x1FF,
                    (priv->y + j * 8) & 0xFF,
                    gObject_32x8, oam2 + 5);
            }

            for (; k < (priv->width - 2); k = k + 2)
            {
                PutSpriteExt(priv->layer,
                    (priv->x + k * 8) & 0x1FF,
                    (priv->y + j * 8) & 0xFF,
                    gObject_16x8, oam2 + 5);
            }

            for (; k < (priv->width - 1); k = k + 1)
            {
                PutSpriteExt(priv->layer,
                    (priv->x + k * 8) & 0x1FF,
                    (priv->y + j * 8) & 0xFF,
                    gObject_8x8, oam2 + 5);
            }
        }
    }
}

CONST_DATA struct ProcCmd ProcScr_UntransBox[] = {
    PROC_CALL(UntransBox_Init),
    PROC_REPEAT(UntransBox_Loop),
    PROC_END
};

ProcPtr NewUntransBox(u32 vobj_offset, u32 pal, ProcPtr parent)
{
    struct ProcSysUntransBox * proc =
        Proc_Start(ProcScr_UntransBox, parent);

    Decompress(Img_SysUntransBox, OBJ_VRAM0 + vobj_offset);
    ApplyPalette(PAL_BG(1), pal + 0x10);
    proc->chr = (vobj_offset << 0xF) >> 0x14;
    proc->pal = pal;
    return proc;
}

void EnableUnransportWindow(int index, int layer, int x, int y, int w, int h, u16 chr)
{
    struct ProcSysUntransBox * proc = Proc_Find(ProcScr_UntransBox);
    if (proc)
    {
        struct SysUntransBoxConf * config = &proc->priv[index];
        config->valid = true;

        config->layer = layer;
        config->x = x;
        config->y = y;
        config->width = w;
        config->height = h;
        config->chr = chr;
    }
}

void DisableUntransBox(int index)
{
    struct ProcSysUntransBox * proc = Proc_Find(ProcScr_UntransBox);

    if (proc != NULL)
    {
        struct SysUntransBoxConf * config = &proc->priv[index];
        config->valid = false;
    }
}

void EndUntransBoxs(void)
{
    Proc_End(Proc_Find(ProcScr_UntransBox));
}

void SysBrownBox_Init(struct ProcSysBrownBox * proc)
{
    int i;
    for (i = 0; i < 4; i++)
    {
        proc->priv[i].valid = false;
        proc->priv[i].width = 0;
    }
}

CONST_DATA u16 Obj_SmallBrownNameBoxe1[] = {
    9,
    0x4000, 0x4000, 0x0000,
    0x4000, 0x4020, 0x0001,
    0x4000, 0x4040, 0x0001,
    0x4004, 0x4000, 0x0005,
    0x4004, 0x4020, 0x0006,
    0x4004, 0x4040, 0x0006,
    0x400C, 0x4000, 0x000A,
    0x400C, 0x4020, 0x000B,
    0x400C, 0x4040, 0x000B
};

CONST_DATA u16 Obj_SmallBrownNameBoxe2[] = {
    9,
    0x4000, 0x4000, 0x0001,
    0x4000, 0x4020, 0x0001,
    0x4000, 0x5040, 0x0000,
    0x4004, 0x4000, 0x0006,
    0x4004, 0x4020, 0x0006,
    0x4004, 0x5040, 0x0005,
    0x400C, 0x4000, 0x000B,
    0x400C, 0x4020, 0x000B,
    0x400C, 0x5040, 0x000A
};

CONST_DATA u16 Obj_SmallBrownNameBoxe3[] = {
    9,
    0x4000, 0x6000, 0x000a,
    0x4000, 0x6020, 0x000b,
    0x4000, 0x6040, 0x000b,
    0x4008, 0x4000, 0x0005,
    0x4008, 0x4020, 0x0006,
    0x4008, 0x4040, 0x0006,
    0x400c, 0x6000, 0x0000,
    0x400c, 0x6020, 0x0001,
    0x400c, 0x6040, 0x0001
};

CONST_DATA u16 Obj_SmallBrownNameBoxe4[] = {
    9,
    0x4000, 0x6000, 0x000b,
    0x4000, 0x6020, 0x000b,
    0x4000, 0x7040, 0x000a,
    0x4008, 0x4000, 0x0006,
    0x4008, 0x4020, 0x0006,
    0x4008, 0x5040, 0x0005,
    0x400c, 0x6000, 0x0001,
    0x400c, 0x6020, 0x0001,
    0x400c, 0x7040, 0x0000
};

CONST_DATA u16 Obj_SmallBrownNameBoxe5[] = {
    3,
    0x4000, 0x4000, 0x0001,
    0x4004, 0x4000, 0x0006,
    0x400C, 0x4000, 0x000B
};

CONST_DATA u16 Obj_SmallBrownNameBoxe6[] = {
    3,
    0x4000, 0x6000, 0x000b,
    0x4008, 0x4000, 0x0006,
    0x400c, 0x6000, 0x0001
};

void SysBrownBox_Loop(struct ProcSysBrownBox * proc)
{
    int i;
    int x;
    u8 * pframe, _frame;
    struct SysBrownBoxConf * priv;

    u16 * objs1[] = {
        Obj_SmallBrownNameBoxe1,
        Obj_SmallBrownNameBoxe2,
        Obj_SmallBrownNameBoxe3,
        Obj_SmallBrownNameBoxe4
    };

    u16 * objs2[] = {
        Obj_SmallBrownNameBoxe5,
        Obj_SmallBrownNameBoxe5,
        Obj_SmallBrownNameBoxe6,
        Obj_SmallBrownNameBoxe6
    };

    pframe = &proc->priv[0].frame;
    priv = &proc->priv[0];

    for (i = 3; i >= 0; pframe = pframe + 8, priv++, i--)
    {
        if (priv->valid == 0)
            continue;

        x = priv->x;

        if (priv->width != 0)
        {
            int frame = priv->frame;
            if (frame & 1)
            {
                PutSpriteExt(
                    proc->layer,
                    x + 0x60,
                    priv->y + proc->y,
                    objs2[frame],
                    proc->oam2
                );
                x = x + 0x20;
            }
            PutSpriteExt(
                proc->layer,
                x,
                priv->y + proc->y,
                objs1[*pframe],
                proc->oam2
            );

            _frame = *pframe;

            if ((_frame & 1) == 0)
            {
                x = x + 0x60;
                PutSpriteExt(
                    proc->layer,
                    x,
                    priv->y + proc->y,
                    objs2[_frame],
                    proc->oam2
                );
            }
        }
        else
        {
            // _080ADB2C
            PutSpriteExt(
                proc->layer,
                x,
                priv->y + proc->y,
                objs1[priv->frame],
                proc->oam2
            );
        }
    }
}

CONST_DATA struct ProcCmd ProcScr_SysBrownBox[] = {
    PROC_CALL(SysBrownBox_Init),
    PROC_YIELD,
    PROC_REPEAT(SysBrownBox_Loop),
    PROC_END
};

void StartSysBrownBox(int layer, u32 vobj_offset, int pal, u16 oam2, u16 y, ProcPtr parent)
{
    u32 oam2_chr, oam2_pal;
    struct ProcSysBrownBox * proc;

    EndSysBrownBox();
    proc = Proc_Start(ProcScr_SysBrownBox, parent);
    Decompress(Img_SysBrownBox, OBJ_VRAM0 + vobj_offset);
    ApplyPalette(Pal_SysBrownBox, pal + 0x10);

    oam2_chr = (vobj_offset << 0xF) >> 0x14;
    oam2_pal = OAM2_PAL(pal);

    proc->oam2 = oam2 + (oam2_chr + oam2_pal);
    proc->y = y;
    proc->layer = layer;
}

void EnableSysBrownBox(int index, int x, int y, int frame)
{
    struct ProcSysBrownBox * proc =
        Proc_Find(ProcScr_SysBrownBox);

    proc->priv[index].valid = true;
    proc->priv[index].x = x & 0x1FF;
    proc->priv[index].y = y & 0x0FF;
    proc->priv[index].frame = frame;
}

void DisableSysBrownBox(int index)
{
    struct ProcSysBrownBox * proc =
        Proc_Find(ProcScr_SysBrownBox);

    if (proc)
        proc->priv[index].valid = false;
}


void SetSysBrownBoxWidth(int index, u8 width)
{
    struct ProcSysBrownBox * proc =
        Proc_Find(ProcScr_SysBrownBox);

    if (proc)
        proc->priv[index].width = width;
}

void EndSysBrownBox(void)
{
    Proc_End(Proc_Find(ProcScr_SysBrownBox));
}

void SysboxTextMain(struct ProcSysboxText * proc)
{
    char ch;
    int i;

    SetTextFont(&proc->font);

    if (proc->timer == proc->delay)
        proc->timer = 0;

    if (proc->timer == 0)
    {
        for (i = 0; i < proc->speed; i++)
        {
            const char * str = proc->str;
            if (*str == '\0')
            {
                Proc_Break(proc);
                break;
            }

            ch = *str;
            if (ch == '\1')
            {
                proc->line++;
                proc->str++;
            }
            else
            {
                proc->str =
                    Text_DrawCharacter(&proc->texts[proc->line], proc->str);
            }
        }
    }
    proc->timer++;
    SetTextFont(NULL);
}

CONST_DATA struct ProcCmd ProcScr_SysboxText[] = {
    PROC_YIELD,
    PROC_REPEAT(SysboxTextMain),
    PROC_END
};

void NewSysboxText(int vobj_offset, int pal, const char * str, int line, int delay, int speed, ProcPtr parent)
{
    int i, obj_pal;
    struct ProcSysboxText * proc;
    proc = Proc_Find(ProcScr_SysboxText);
    if (!proc)
        proc = Proc_StartBlocking(ProcScr_SysboxText, parent);

    InitSpriteTextFont(&proc->font, OBJ_VRAM0 + vobj_offset, pal);
    proc->str = str;
    proc->line = 0;
    proc->max_line = line;
    proc->timer = 0;
    proc->delay = delay;
    proc->speed = speed;

    obj_pal = pal + 0x10;
    for (i = 0; i < line; i++)
    {
        InitSpriteText(&proc->texts[i]);
        SpriteText_DrawBackgroundExt(&proc->texts[i], 0);
    }

    ApplyPalette(Pal_Text, obj_pal);
    SetTextFontGlyphs(0);
    SetTextFont(NULL);
    Proc_Goto(proc, 0);
}

void EndAllProcChildren(ProcPtr p)
{
    ProcPtr proc = NULL;
    while (1)
    {
        proc = Proc_FindAfterWithParent(proc, p);
        if (!proc)
            break;

        Proc_End(proc);
    }
}

void sub_80ADDF8(void)
{
    return;
}
