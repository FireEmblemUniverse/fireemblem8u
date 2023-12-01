#include "global.h"
#include "mu.h"
#include "proc.h"
#include "hardware.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "ap.h"
#include "ctc.h"
#include "bmio.h"
#include "rng.h"
#include "bmlib.h"
#include "mapanim.h"
#include "bm.h"

static struct MapAnimStarfxConf gMapAnimStarfxConfs[0x10];
static u16 sSpellAssocPalBackup[0xA0];

CONST_DATA struct ProcCmd ProcScr_MapAnimStartSpellAssocFade[] = {
    PROC_CALL(SpellAssocFadeMain),
    PROC_SLEEP(0xF),
    PROC_END
};

void MapAnimStartSpellAssocFadeExt(ProcPtr proc)
{
    if (proc)
        Proc_StartBlocking(ProcScr_MapAnimStartSpellAssocFade, proc);
    else
        Proc_Start(ProcScr_MapAnimStartSpellAssocFade, PROC_TREE_3);
}

void SpellAssocFadeMain(ProcPtr proc)
{
    int i;

    CpuFastCopy(PAL_BG(0x6), sSpellAssocPalBackup, 0x140);

    for (i = 0; i < 10; i++)
        SetPalFadeStop(StartPalFade(Pal_AllBlack, i + 6, 0x3C, proc), 15);
}

CONST_DATA struct ProcCmd ProcScr_MapAnimSpellAssocResetPal[] = {
    PROC_CALL(SpellAssocResetPalMain),
    PROC_SLEEP(0x10),
    PROC_END
};

void MapAnimSpellAssocResetPalExt(ProcPtr proc)
{
    if (proc)
        Proc_StartBlocking(ProcScr_MapAnimSpellAssocResetPal, proc);
    else
        Proc_Start(ProcScr_MapAnimSpellAssocResetPal, PROC_TREE_3);
}

void SpellAssocResetPalMain(ProcPtr proc)
{
    int i;
    for (i = 0; i < 10; i++)
        StartPalFade(sSpellAssocPalBackup + 0x10 * i, i + 6, 15, proc);
}

CONST_DATA struct ProcCmd ProcScr_MapAnimBgShaker[] = {
    PROC_CALL(BG0Shaker_Init),
    PROC_REPEAT(BG0Shaker_Loop),
    PROC_END
};

void NewBG0Shaker(void)
{
    Proc_Start(ProcScr_MapAnimBgShaker, PROC_TREE_3);
}

void BG0Shaker_Init(struct MAFrameShakeProc * proc)
{
    proc->timer = 0;
}

void BG0Shaker_Loop(struct MAFrameShakeProc * proc)
{
    BG_SetPosition(0,
        DivRem(AdvanceGetLCGRNValue(), 9) - 4,
        DivRem(AdvanceGetLCGRNValue(), 9) - 4);

    BG_SetPosition(1,
        DivRem(AdvanceGetLCGRNValue(), 9) - 4,
        DivRem(AdvanceGetLCGRNValue(), 9) - 4);

    if (proc->timer++ > 15)
    {
        BG_SetPosition(BG_0, 0, 0);
        BG_SetPosition(BG_1, 0, 0);

        Proc_Break(proc);
    }
}

void LoadSparkGfx(void)
{
    Decompress(
        Img_089AE7A4,
        OBJ_VRAM0 + BM_OBJCHR_BANIM_EFFECT2 * 0x20);

    ApplyPalette(Pal_089AE7C4, 0x10 + BM_OBJPAL_BANIM_EFFECT2);
}

void PutSparkGfx(int x, int y)
{
    if (x < -4)
        return;

    if (x > 235)
        return;

    if (y < -4)
        return;

    if (y > 155)
        return;

    CallARM_PushToSecondaryOAM(
        (x - 4) & 0x1FF,
        (y - 4) & 0xFF,
        gObject_8x8,
        TILEREF(BM_OBJCHR_BANIM_EFFECT2, BM_OBJPAL_BANIM_EFFECT2));
}

void PutSparkGfxRotation(int xCenter, int yCenter, int distance, int angle)
{
    PutSparkGfx(
        xCenter + ((SIN(angle) * distance) >> 12),
        yCenter + ((COS(angle) * distance) >> 12));
}

void MapAnimRotation_Init(struct MAStarProc * proc)
{
    int i;

    LoadSparkGfx();

    for (i = 0; i < 16; ++i)
    {
        gMapAnimStarfxConfs[i].distance = 0x10;
        gMapAnimStarfxConfs[i].angle = i << 8;
    }

    proc->distance = 0;
    proc->angle = 0;
    proc->timer = proc->start;
}

void MapAnimRotation_Main(struct MAStarProc * proc)
{
    int i, ret = Interpolate(5, proc->lo, proc->hi, proc->timer, proc->end) * 16;

    proc->distance = ret;
    proc->angle = ret >> 1;

    for (i = 0; i < 16; ++i)
    {
        PutSparkGfxRotation(
            proc->xCenter, proc->yCenter,
            (proc->distance + gMapAnimStarfxConfs[i].distance) >> 4,
            (proc->angle    + gMapAnimStarfxConfs[i].angle) >> 4);
    }

    proc->timer++;

    if (proc->timer > proc->terminator)
        Proc_Break(proc);
}

CONST_DATA struct ProcCmd ProcScr_MapAnimSpellAssocRotationEffect[] = {
    PROC_CALL(LockGame),
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnimRotation_Init),
    PROC_REPEAT(MapAnimRotation_Main),
    PROC_CALL(UnlockGame),
    PROC_END
};

void StartStarRotationEffect(int xCenter, int yCenter, int lo, int hi, int start, int end, int terminator)
{
    struct MAStarProc * proc =
        Proc_Start(ProcScr_MapAnimSpellAssocRotationEffect, PROC_TREE_3);

    proc->xCenter = xCenter;
    proc->yCenter = yCenter;
    proc->lo = lo;
    proc->hi = hi;
    proc->start = start;
    proc->end = end;
    proc->terminator = terminator;
}

void StartStarExplosionEffect(int x, int y)
{
    StartStarRotationEffect(x, y, 1, 0xC8, 0, 0x50, 0x28);
}

void StartStarImplosionEffect(int x, int y)
{
    StartStarRotationEffect(x, y, 0xC8, 1, 0, 0x3C, 0x37);
}
