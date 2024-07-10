#include "global.h"

#include "bm.h"
#include "ap.h"
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

void SysBlackBox_Init(struct SysBlackBoxProc * proc)
{
    int i;
    for (i = 0; i < 4; i++)
        proc->valid[i] = 0;
}

void SysBlackBox_Main(struct SysBlackBoxProc * proc)
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

struct ProcCmd CONST_DATA ProcScr_SysBlackBox[] = {
    PROC_CALL(SysBlackBox_Init),

PROC_LABEL(0),
    PROC_REPEAT(SysBlackBox_Main),

PROC_LABEL(1),
    PROC_BLOCK,

    PROC_END,
};

ProcPtr NewSysBlackBoxHandler(ProcPtr parent)
{
    Proc_End(Proc_Find(ProcScr_SysBlackBox));
    return Proc_Start(ProcScr_SysBlackBox, parent);
}

void SysBlackBoxSetGfx(u32 obj_offset)
{
    struct SysBlackBoxProc * proc = Proc_Find(ProcScr_SysBlackBox);

    if (proc != NULL)
    {
        proc->chr = ((obj_offset << 0xf) >> 0x14);
        Decompress(Img_SysBlackBox, OBJ_VRAM0 + obj_offset);
    }
}

void EnableSysBlackBox(int index, int x, int y, int width, int height, u16 oam2)
{
    struct SysBlackBoxProc * proc = Proc_Find(ProcScr_SysBlackBox);

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

void DisableSysBlackBox(int index)
{
    struct SysBlackBoxProc * proc = Proc_Find(ProcScr_SysBlackBox);
    if (proc != NULL)
        proc->valid[index] = 0;
}

void BlockAllSysBlackBoxs(void)
{
    struct SysBlackBoxProc * proc = Proc_Find(ProcScr_SysBlackBox);
    if (proc != NULL)
        Proc_Goto(proc, 1);
}

void UnblockAllSysBlackBoxs(void)
{
    struct SysBlackBoxProc * proc = Proc_Find(ProcScr_SysBlackBox);
    if (proc != NULL)
    {
        Proc_Goto(proc, 0);
        SysBlackBoxSetGfx(proc->chr * CHR_SIZE);
    }
}

void EndSysBlackBoxs(void)
{
    Proc_End(Proc_Find(ProcScr_SysBlackBox));
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

void SysGrayBox_Init(struct ProcSysGrayBox * proc)
{
    int i;
    for (i = 0; i < 4; i++)
        proc->priv[i].valid = 0;
}

void SysGrayBox_Loop(struct ProcSysGrayBox * proc)
{
    int i, j, k;
    u16 oam2;
    struct SysGrayBoxConf * priv;

    for (i = 0; i < 4; i++)
    {
        priv = &proc->priv[i];

        if (priv->valid == 0)
            continue;

        oam2 = OAM2_PAL(proc->pal) + proc->chr + priv->chr;

        PutSpriteExt(
            priv->layer,
            priv->x & 0x1FF,
            priv->y & 0xFF,
            gObject_8x8,
            oam2);

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

CONST_DATA struct ProcCmd ProcScr_SysGrayBox[] = {
    PROC_CALL(SysGrayBox_Init),
    PROC_REPEAT(SysGrayBox_Loop),
    PROC_END
};

ProcPtr NewSysGrayBox(u32 vobj_offset, u32 pal, ProcPtr parent)
{
    struct ProcSysGrayBox * proc =
        Proc_Start(ProcScr_SysGrayBox, parent);

    Decompress(Img_SysGrayBox, OBJ_VRAM0 + vobj_offset);
    ApplyPalette(PAL_BG(1), pal + 0x10);
    proc->chr = (vobj_offset << 0xF) >> 0x14;
    proc->pal = pal;
    return proc;
}

void EnableUnransportWindow(int index, int layer, int x, int y, int w, int h, u16 chr)
{
    struct ProcSysGrayBox * proc = Proc_Find(ProcScr_SysGrayBox);
    if (proc)
    {
        struct SysGrayBoxConf * config = &proc->priv[index];
        config->valid = true;

        config->layer = layer;
        config->x = x;
        config->y = y;
        config->width = w;
        config->height = h;
        config->chr = chr;
    }
}

void DisableSysGrayBox(int index)
{
    struct ProcSysGrayBox * proc = Proc_Find(ProcScr_SysGrayBox);

    if (proc != NULL)
    {
        struct SysGrayBoxConf * config = &proc->priv[index];
        config->valid = false;
    }
}

void EndSysGrayBoxs(void)
{
    Proc_End(Proc_Find(ProcScr_SysGrayBox));
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

void nop_80ADDF8(void)
{
    return;
}

void BgAffinRotScaling(u8 bg, s16 angle, s16 x_center, s16 y_center, s16 sx, s16 sy)
{
    struct BgAffineSrcData data;
    struct BgAffineDstData * dst;

    if (sx <= 4)
        sx = 4;

    if (sy <= 4)
        sy = 4;

    data.texX = x_center * 0x100;
    data.texY = y_center * 0x100;
    data.scrX = 0;
    data.scrY = 0;
    data.sx = 0x10000 / sx;
    data.sy = 0x10000 / sy;
    data.alpha = angle * 0x10;

    dst = &gLCDControlBuffer.bg3affin;
    if (bg == BG_2)
        dst = &gLCDControlBuffer.bg2affin;

    BgAffineSet(&data, dst, 1);
}

void BgAffinScaling(u8 bg, s16 sy, s16 sx)
{
    struct BgAffineDstData * affin = NULL;
    if (bg == BG_2)
        affin = &gLCDControlBuffer.bg2affin;

    /**
     * y = y * (1 / sy)
     * x = x * (1 / sx)
     *
     * Both of which are 8.8 fixed point numbers:
     * a halfword with 8 integer bits and 8 fractional bits.
     * 
     * See tonc 10.4.1: https://www.coranac.com/tonc/text/affine.htm
     */

    affin->pb = (affin->pb * sy) >> 8;
    affin->pd = (affin->pd * sy) >> 8;
    affin->pa = (affin->pa * sx) >> 8;
    affin->pc = (affin->pc * sx) >> 8;
}

void BgAffinAnchoring(u8 bg, s16 q0_x, s16 q0_y, s16 p0_x, s16 p0_y)
{
    /**
     * vector q0: origin in screen space
     * vector p0: origin in texture space
     *
     * See tonc 12.3: https://www.coranac.com/tonc/text/affbg.htm:
     *
     * bgaff->dx= asx->tex_x - (pa*asx->scr_x + pb*asx->scr_y);
     * bgaff->dy= asx->tex_y - (pc*asx->scr_x + pd*asx->scr_y);
     */
    struct BgAffineDstData * affin = NULL;
    if (bg == BG_2)
        affin = &gLCDControlBuffer.bg2affin;

    affin->dx = affin->pa * (-q0_x) + affin->pb * (-q0_y) + p0_x * 0x100;
    affin->dy = affin->pc * (-q0_x) + affin->pd * (-q0_y) + p0_y * 0x100;
}

void BgAffinRotScalingHighPrecision(u8 bg, int angle, int texX, int texY, int sx, int sy)
{
    struct BgAffineSrcData data;
    struct BgAffineDstData * dst;

    if (sx <= 0x400)
        sx = 0x400;

    if (sy <= 0x400)
        sy = 0x400;

    data.texX = texX;
    data.texY = texY;
    data.scrX = 0;
    data.scrY = 0;
    data.sx = 0x1000000 / sx;
    data.sy = 0x1000000 / sy;
    data.alpha = angle >> 4;

    dst = &gLCDControlBuffer.bg3affin;
    if (bg == BG_2)
        dst = &gLCDControlBuffer.bg2affin;

    BgAffineSet(&data, dst, 1);
}

void BgAffinScalingHighPrecision(u8 bg, int sy, int sx)
{
    struct BgAffineDstData * affin = NULL;
    if (bg == BG_2)
        affin = &gLCDControlBuffer.bg2affin;

    affin->pb = (affin->pb * sy) >> 0x10;
    affin->pd = (affin->pd * sy) >> 0x10;
    affin->pa = (affin->pa * sx) >> 0x10;
    affin->pc = (affin->pc * sx) >> 0x10;
}

void BgAffinAnchoringHighPrecision(u8 bg, int q0_x, int q0_y, int p0_x, int p0_y)
{
    struct BgAffineDstData * affin = NULL;
    if (bg == BG_2)
        affin = &gLCDControlBuffer.bg2affin;

    affin->dx = ((affin->pa * (-q0_x) + affin->pb * (-q0_y)) >> 8) + p0_x;
    affin->dy = ((affin->pc * (-q0_x) + affin->pd * (-q0_y)) >> 8) + p0_y;
}

void sub_80AE044(int a, u16 * buf, int c, int d, int e, int f, int g, int h)
{
    int i, ip, r4;
    u16 * r5, * r6;
    int r8, sl;
    int g2;

    r8 = buf[0] / 2;
    sl = 0x78;

    r6 = buf + 2;
    r5 = (void *)BG_VRAM + a * 0xA000;

    if (g == 0)
        return;

    if (h == 0)
        return;

    if (g == -1)
    {
        asm("" ::: "memory");
        g = buf[0];
        h = buf[1];
    }

    c >>= 1;
    do e >>= 1; while (0); // by me
    g >>= 1;
    g <<= 1;
    g2 = g; // by permuter
    r6 = r6 + r8 * f + e;
    r5 = r5 + sl * d + c;

    for (i = 0; i < h; i++)
    {
        CpuCopy16(r6, r5, g2);
        r6 = r6 + r8;
        r5 = r5 + sl;
    }
}

void sub_80AE0F0(int a, int b, int c, int d, int e, u16 f) 
{
    int i, r8 = 0x78;
    u16 * r5 = (void *)BG_VRAM + a * 0xA000;

    if (d == 0)
        return;

    if (e == 0)
        return;

    b = b >> 1;

    d = d >> 1;
    d = d << 1;

    r5 = r5 + r8 * c + b;

    for (i = 0; i < e; i++)
    {
        CpuFill16(f, r5, d);
        r5 = r5 + r8;
    }
}

void SetBlankBgColor(int r, int g, int b)
{
    r = r & 0x1F;
    g = g & 0x1F;
    b = b & 0x1F;

    gPaletteBuffer[0] = ((b << 10) + (g << 5)) + r;
    EnablePaletteSync();
}

void FadeInOut_Init(struct ProcFadeInOut * proc)
{
    ArchiveCurrentPalettes();
    proc->timer = 0;
}

void FadeIn_Loop(struct ProcFadeInOut * proc)
{
    int color;

    proc->timer += proc->speed;

    if (proc->white_out != false)
        color = 0x200 - proc->timer * 2;
    else
        color = proc->timer * 2;

    WriteFadedPaletteFromArchive(color, color, color, proc->mask);
    SetDispEnable(1, 1, 1, 1, 1);

    if (proc->timer == 0x80)
        Proc_Break(proc);
}

void FadeOut_Loop(struct ProcFadeInOut * proc)
{
    int color;

    proc->timer += proc->speed;

    if (proc->white_out != false)
        color = 0x100 + proc->timer * 2;
    else
        color = 0x100 - proc->timer * 2;

    WriteFadedPaletteFromArchive(color, color, color, proc->mask);

    if (proc->timer == 0x80)
        Proc_Break(proc);
}

void FadeInOut_DisableGfx(struct ProcFadeInOut * proc)
{
    if (proc->mask == 0xFFFF)
    {
        SetDispEnable(0, 0, 0, 0, 1);
    }
    else
    {
        SetDispEnable(0, 0, 0, 0, 0);
    }
}

CONST_DATA struct ProcCmd ProcScr_BmFadeIN[] = {
    PROC_CALL(FadeInOut_DisableGfx),
    PROC_YIELD,
    PROC_CALL(FadeInOut_Init),
    PROC_REPEAT(FadeIn_Loop),
    PROC_END
};

bool FadeInExists(void)
{
    return !!Proc_Find(ProcScr_BmFadeIN);
}

CONST_DATA struct ProcCmd ProcScr_BmFadeOUT[] = {
    PROC_YIELD,
    PROC_CALL(EnableAllGfx),
    PROC_CALL(FadeInOut_Init),
    PROC_REPEAT(FadeOut_Loop),
    PROC_CALL(FadeInOut_DisableGfx),
    PROC_END
};

bool FadeOutExists(void)
{
    return !!Proc_Find(ProcScr_BmFadeOUT);
}

void NewFadeIn(int speed, ProcPtr parent)
{
    struct ProcFadeInOut * proc =
        Proc_Start(ProcScr_BmFadeIN, PROC_TREE_4);

    proc->white_out = false;
    proc->speed = speed;
    proc->mask = -1;
}

void NewFadeOut(int speed, ProcPtr parent)
{
    struct ProcFadeInOut * proc =
        Proc_Start(ProcScr_BmFadeOUT, PROC_TREE_4);

    proc->white_out = false;
    proc->speed = speed;
    proc->mask = -1;
}

void NewBlockedFadeIn(int speed, ProcPtr parent)
{
    struct ProcFadeInOut * proc =
        Proc_StartBlocking(ProcScr_BmFadeIN, parent);

    proc->white_out = false;
    proc->speed = speed;
    proc->mask = -1;
}

void NewBlockedFadeOut(int speed, ProcPtr parent)
{
    struct ProcFadeInOut * proc =
        Proc_StartBlocking(ProcScr_BmFadeOUT, parent);

    proc->white_out = false;
    proc->speed = speed;
    proc->mask = -1;
}

void NewFadeIn2(int speed, ProcPtr parent)
{
    struct ProcFadeInOut * proc =
        Proc_Start(ProcScr_BmFadeIN, PROC_TREE_4);

    proc->white_out = false;
    proc->speed = speed;
    proc->mask = 0xFFFF;
}

void NewFadeOut2(int speed, ProcPtr parent)
{
    struct ProcFadeInOut * proc =
        Proc_Start(ProcScr_BmFadeOUT, PROC_TREE_4);

    proc->white_out = false;
    proc->speed = speed;
    proc->mask = 0xFFFF;
}

void NewFadeInWhite(int speed, ProcPtr parent)
{
    struct ProcFadeInOut * proc =
        Proc_Start(ProcScr_BmFadeIN, PROC_TREE_4);

    proc->white_out = true;
    proc->speed = speed;
    proc->mask = -1;
}

void NewFadeOutWhite(int speed, ProcPtr parent)
{
    struct ProcFadeInOut * proc =
        Proc_Start(ProcScr_BmFadeOUT, PROC_TREE_4);

    proc->white_out = true;
    proc->speed = speed;
    proc->mask = -1;
}

void NewBlockedFadeInWhite(int speed, ProcPtr parent)
{
    struct ProcFadeInOut * proc =
        Proc_StartBlocking(ProcScr_BmFadeIN, parent);

    proc->white_out = true;
    proc->speed = speed;
    proc->mask = -1;
}

void NewBlockedFadeOutWhite(int speed, ProcPtr parent)
{
    struct ProcFadeInOut * proc =
        Proc_StartBlocking(ProcScr_BmFadeOUT, parent);

    proc->white_out = true;
    proc->speed = speed;
    proc->mask = -1;
}

void NewFadeInWhite2(int speed, ProcPtr parent)
{
    struct ProcFadeInOut * proc =
        Proc_Start(ProcScr_BmFadeIN, PROC_TREE_4);

    proc->white_out = true;
    proc->speed = speed;
    proc->mask = 0xFFFF;
}

void NewFadeOutWhite2(int speed, ProcPtr parent)
{
    struct ProcFadeInOut * proc =
        Proc_Start(ProcScr_BmFadeOUT, PROC_TREE_4);

    proc->white_out = true;
    proc->speed = speed;
    proc->mask = 0xFFFF;
}

void WipeAllPalette(void)
{
    CpuFastFill16(0, gPaletteBuffer, 0x400);
    EnablePaletteSync();
}

void EndFadeInOut(void)
{
    Proc_End(Proc_Find(ProcScr_BmFadeIN));
    Proc_End(Proc_Find(ProcScr_BmFadeOUT));
}

//! FE8U = 0x080AE4D8
void BmBgfx_Init(struct ProcBmBgfx * proc)
{
    proc->conf = 0;
    proc->bg = 0;
    proc->vram_base = 0;
    proc->vram_free_space = 0;
    proc->vram_base_offset = 0;
    proc->size_per_fx = 0;
    proc->flip = 0;
    proc->timer = 0;
    proc->total_duration = 0;
    proc->counter_procloop = 0;
    proc->callback = 0;
    proc->func_call_type = 0;
    proc->counter_functioncall = 0;
    proc->x = 0;
    proc->y = 0;
    proc->loop_en = 1;
    proc->counter = 0;
}

//! FE8U = 0x080AE518
void BmBgfx_Loop(struct ProcBmBgfx * proc)
{
    struct BmBgxConf * conf = proc->conf;

    if (proc->callback != NULL)
    {
        proc->func_call_type = 0;
        if (proc->callback(proc) != 0)
            return;
    }
    else
    {
        proc->callback = NULL;
    }

    while (1)
    {
        if (conf->type == BMFX_CONFT_LOOP_START)
            conf++;

        /* Loop identifier */
        if (conf->type == BMFX_CONFT_LOOP)
        {
            if (proc->loop_en != false)
            {
                if (proc->counter == 0)
                    proc->counter = conf->duration;
                else if (proc->counter > 0)
                    proc->counter = proc->counter - 1;

                if (proc->counter != 0)
                {
                    int i;
                    struct BmBgxConf * conf_ = conf - 1;
                    for (i = conf_->type; i != BMFX_CONFT_LOOP_START; i = conf_->type)
                    {
                        conf = conf_;
                        conf_--;
                    }
                }
                else
                {
                    conf++;
                }
            }
            else
            {
                proc->counter = 0;
                conf++;
            }
        }

        if (conf->type == BMFX_CONFT_CALL_IDLE)
        {
            if (proc->callback != NULL)
            {
                proc->counter_functioncall++;
                proc->func_call_type = 1;
                proc->callback(proc);
            }
            conf++;
        }

        if (conf->type == BMFX_CONFT_BLOCKING)
            break;

        if (conf->type < 11 && conf->type > 8)
        {
            Proc_Break(proc);
            break;
        }

        if (proc->timer == 0)
        {
            switch (conf->type)
            {
                case BMFX_CONFT_IMG:
                case BMFX_CONFT_ZIMG:
                    if (proc->vram_free_space == 0)
                        proc->flip = 1 - proc->flip;
                    break;
            }

            switch (conf->type)
            {
                case BMFX_CONFT_IMG:
                    CpuFastCopy(
                        conf->data,
                        (void *)(0x6000000 + proc->vram_base + proc->vram_base_offset + proc->vram_free_space + proc->flip * proc->size_per_fx),
                        conf->size);

                    proc->vram_free_space = proc->vram_free_space + conf->size;
                    break;

                case BMFX_CONFT_ZIMG:
                    Decompress(
                        conf->data,
                        (void *)(0x6000000 + proc->vram_base + proc->vram_base_offset + proc->vram_free_space + proc->flip * proc->size_per_fx));

                    proc->vram_free_space = proc->vram_free_space + conf->size;

                    break;

                case BMFX_CONFT_TSA:
                    if (proc->size_per_fx == 0x8000)
                        SetBackgroundTileDataOffset(proc->bg, (proc->vram_base + (proc->flip << 0xf)) & 0xFFFF);

                    CallARM_FillTileRect(
                        BG_GetMapBuffer(proc->bg), conf->data,
                        (u16)((proc->pal_bank << 0xc) +
                              (((proc->vram_base_offset + proc->flip * proc->size_per_fx) << 0x11) >> 0x16)));

                    proc->vram_free_space = 0;
                    BG_EnableSyncByMask(1 << proc->bg);

                    break;

                case BMFX_CONFT_PAL:
                    ApplyPalettes(conf->data, proc->pal_bank, conf->size);
                    break;
            }
        }

        proc->timer++;
        if (proc->timer <= conf->duration)
            break;

        conf++;
        proc->timer = 0;
    }

    proc->conf = conf;
    proc->counter_procloop++;
}

//! FE8U = 0x080AE71C
void BmBgfx_End(struct ProcBmBgfx * proc)
{
    if (proc->conf->type == 10)
    {
        SetBackgroundTileDataOffset(proc->bg, proc->vram_base);
        BG_Fill(BG_GetMapBuffer(proc->bg), 0);
        BG_EnableSyncByMask(1 << proc->bg);
    }
}

struct ProcCmd CONST_DATA ProcScr_BmBgfx[] =
{
    PROC_CALL(BmBgfx_Init),
    PROC_YIELD,
    PROC_REPEAT(BmBgfx_Loop),
    PROC_CALL(BmBgfx_End),
    PROC_END,
};

//! FE8U = 0x080AE750
bool CheckBmBgfxDone(void)
{
    if (Proc_Find(ProcScr_BmBgfx))
        return true;

    return false;
}

//! FE8U = 0x080AE76C
void BmBgfxAdvance(void)
{
    struct ProcBmBgfx * proc = Proc_Find(ProcScr_BmBgfx);
    if ((proc != NULL) && (proc->conf->type == BMFX_CONFT_BLOCKING))
        proc->conf++;
}

//! FE8U = 0x080AE790
void EndBmBgfx(void)
{
    Proc_End(Proc_Find(ProcScr_BmBgfx));
}

//! FE8U = 0x080AE7A4
void BmBgfxSetLoopEN(u8 loop_en)
{
    struct ProcBmBgfx * proc = Proc_Find(ProcScr_BmBgfx);
    if (proc != NULL)
        proc->loop_en = loop_en;
}

//! FE8U = 0x080AE7C4
void StartBmBgfx(struct BmBgxConf * input, int bg, int x, int y, int vram_off, int size, int pal_bank, void * func, ProcPtr parent)
{
    struct ProcBmBgfx * proc;

    if (parent == NULL)
        proc = Proc_Start(ProcScr_BmBgfx, PROC_TREE_3);
    else
        proc = Proc_Start(ProcScr_BmBgfx, parent);

    proc->conf = input;
    proc->bg = bg;
    proc->pal_bank = pal_bank;

    if (size < 0)
        size = 0x4000;

    if (vram_off < 0)
        vram_off = 0;

    proc->vram_base = GetBackgroundTileDataOffset(bg);
    proc->vram_base_offset = vram_off;
    proc->size_per_fx = size;
    proc->x = x;
    proc->y = y;

    proc->callback = func;

    BG_SetPosition(bg, -x & 0xff, -y & 0xff);

    for (; input->type < BMFX_CONFT_END; input++)
        proc->total_duration += input->duration;
}

void MixPaletteCore(struct ProcMixPalette * proc, int val)
{
    int i, j;

    u16 * dst = gPaletteBuffer + PAL_COLOR_OFFSET(proc->targetPalId, 0);
    u16 * ptrA = proc->srcA;
    u16 * ptrB = proc->srcB;

    for (i = 0; i < proc->palCount; i++)
    {
        for (j = 0; j < 0x10; j++)
        {
            *dst = ((((*ptrA & RED_MASK)   * (0x80 - val) + val * (*ptrB & RED_MASK))   >> 7) & RED_MASK) +
                   ((((*ptrA & GREEN_MASK) * (0x80 - val) + val * (*ptrB & GREEN_MASK)) >> 7) & GREEN_MASK) +
                   ((((*ptrA & BLUE_MASK)  * (0x80 - val) + val * (*ptrB & BLUE_MASK))  >> 7) & BLUE_MASK);

            dst++;
            ptrA++;
            ptrB++;
        }
    }
    EnablePaletteSync();
}

void MixPalette_Init(struct ProcMixPalette * proc)
{
    proc->timer = 0;
}

void MixPalette_Loop(struct ProcMixPalette * proc)
{
    proc->timer += proc->speed;

    if (proc->timer > 0x100)
        proc->timer = 0;

    MixPaletteCore(proc, proc->timer < 0x80 ? proc->timer : 0x100 - proc->timer);
}

struct ProcCmd CONST_DATA ProcScr_MixPalette[] =
{
    PROC_YIELD,
    PROC_CALL(MixPalette_Init),
    PROC_REPEAT(MixPalette_Loop),

    PROC_END,
};

void StartMixPalette(u16 * palA, u16 * palB, int speed, int targetPalId, int palCount, ProcPtr parent)
{
    struct ProcMixPalette * proc = Proc_Start(ProcScr_MixPalette, parent);

    proc->speed = speed;
    proc->targetPalId = targetPalId;
    proc->palCount = palCount;

    proc->srcA = palA;
    proc->srcB = palB;
}

void EndMixPalette(void)
{
    Proc_End(Proc_Find(ProcScr_MixPalette));
}

ProcPtr StartSpriteAnimfx(const u8 * gfx, const u16 * pal, const void * apDef, int x, int y, int animId, int palId, int palCount, u16 chr, int aObjNode)
{
    if (gfx != NULL)
        Decompress(gfx, (void *)(0x06010000 + OAM2_CHR(chr) * CHR_SIZE));

    if (pal != NULL)
    {
        ApplyPalettes(pal, (palId + 0x10), palCount);
    }

    return APProc_Create(apDef, x, y, OAM2_PAL(palId) + chr, animId, aObjNode);
}

int GetBgXOffset(int bg)
{
    switch (bg) {
    case BG_0:
        return gLCDControlBuffer.bgoffset[BG_0].x;

    case BG_1:
        return gLCDControlBuffer.bgoffset[BG_1].x;

    case BG_2:
        return gLCDControlBuffer.bgoffset[BG_2].x;

    case BG_3:
        return gLCDControlBuffer.bgoffset[BG_3].x;
    }
}

int GetBgYOffset(int bg)
{
    switch (bg) {
    case BG_0:
        return gLCDControlBuffer.bgoffset[BG_0].y;

    case BG_1:
        return gLCDControlBuffer.bgoffset[BG_1].y;

    case BG_2:
        return gLCDControlBuffer.bgoffset[BG_2].y;

    case BG_3:
        return gLCDControlBuffer.bgoffset[BG_3].y;
    }
}

char * AppendString(const char * src, char * dst)
{
    strcpy(dst, src);
    return dst + strlen(src);
}

char * AppendCharacter(int character, char * str)
{
    *str = character;
    str++;
    *str = '\0';
    return str;
}
