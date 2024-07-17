#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "bmlib.h"

CONST_DATA struct ProcCmd ProcScr_efxFlashBG[] = {
    PROC_NAME("efxFlashBG"),
    PROC_MARK(PROC_MARK_EFX_BGCOL),
    PROC_REPEAT(EfxFlashBgMain),
    PROC_REPEAT(EfxFlashRestorePalSync),
    PROC_END
};

void NewEfxFlashBgWhite(struct Anim * anim, int duartion)
{
    struct ProcEfxFlashing * proc;
    proc = Proc_Start(ProcScr_efxFlashBG, PROC_TREE_VSYNC);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duartion;
    CpuFastFill16(-1, gEfxPal, PLTT_SIZE);
}

void NewEfxFlashBgRed(struct Anim * anim, int duartion)
{
    struct ProcEfxFlashing * proc;
    proc = Proc_Start(ProcScr_efxFlashBG, PROC_TREE_VSYNC);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duartion;
    CpuFastFill16(0x001F001F, gEfxPal, PLTT_SIZE);
}

void NewEfxFlashBgBlack(struct Anim * anim, int duartion)
{
    struct ProcEfxFlashing * proc;
    proc = Proc_Start(ProcScr_efxFlashBG, PROC_TREE_VSYNC);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duartion;
    CpuFastFill16(0, gEfxPal, PLTT_SIZE);
}

void NewEfxFlashBgDirectly(struct Anim * anim, int duartion)
{
    struct ProcEfxFlashing * proc;
    proc = Proc_Start(ProcScr_efxFlashBG, PROC_TREE_VSYNC);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duartion;
}

void EfxFlashBgMain(struct ProcEfxFlashing * proc)
{
    /**
     * Disable the normal palette sync and use the non-cache buffer
    */
    CpuFastCopy(gEfxPal, (u16 *)PLTT, PLTT_SIZE);
    DisablePaletteSync();

    if (++proc->timer >= proc->terminator)
        Proc_Break(proc);
}

void EfxFlashRestorePalSync(struct ProcEfxFlashing * proc)
{
    EnablePaletteSync();
    Proc_Break(proc);
}

CONST_DATA struct ProcCmd ProcScr_efxWhiteOUT[] = {
    PROC_NAME("efxWhiteOUT"),
    PROC_REPEAT(EfxWhiteOutMain1),
    PROC_REPEAT(EfxWhiteOutMain2),
    PROC_REPEAT(EfxWhiteOutRestorePalSync),
    PROC_END
};

void NewEfxWhiteOUT(struct Anim * anim, int duartion, int duartion2)
{
    struct ProcEfxFlashing * proc;
    proc = Proc_Start(ProcScr_efxWhiteOUT, PROC_TREE_VSYNC);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duartion;
    proc->terminator2 = duartion2;
}

void EfxWhiteOutMain1(struct ProcEfxFlashing * proc)
{
    CpuFastCopy(gPaletteBuffer, gEfxPal, PLTT_SIZE);
    EfxPalWhiteInOut(gEfxPal, 0x0, 0x20, 0x0);
    CpuFastCopy(gEfxPal, (u16 *)PLTT, PLTT_SIZE);
    DisablePaletteSync();

    if (++proc->timer > proc->terminator)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EfxWhiteOutMain2(struct ProcEfxFlashing * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x10, proc->timer, proc->terminator2);
    CpuFastCopy(gPaletteBuffer, gEfxPal, PLTT_SIZE);
    EfxPalWhiteInOut(gEfxPal, 0x0, 0x20, ret);
    CpuFastCopy(gEfxPal, (u16 *)PLTT, PLTT_SIZE);
    DisablePaletteSync();

    if (++proc->timer > proc->terminator2)
        Proc_Break(proc);
}

void EfxWhiteOutRestorePalSync(struct ProcEfxFlashing * proc)
{
    EnablePaletteSync();
    Proc_Break(proc);
}

CONST_DATA struct ProcCmd ProcScr_efxWhiteIN[] = {
    PROC_NAME("efxWhiteIN"),
    PROC_REPEAT(EfxWhiteInMain1),
    PROC_REPEAT(EfxWhiteInMain2),
    PROC_REPEAT(EfxWhiteInRestorePalSync),
    PROC_END
};

void NewEfxWhiteIN(struct Anim * anim, int duartion, int duartion2)
{
    struct ProcEfxFlashing * proc;
    proc = Proc_Start(ProcScr_efxWhiteIN, PROC_TREE_VSYNC);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duartion;
    proc->terminator2 = duartion2;
}

void EfxWhiteInMain1(struct ProcEfxFlashing * proc)
{
    CpuFastCopy(gPaletteBuffer, gEfxPal, PLTT_SIZE);
    EfxPalWhiteInOut(gEfxPal, 0x0, 0x20, 0x10);
    CpuFastCopy(gEfxPal, (u16 *)PLTT, PLTT_SIZE);
    DisablePaletteSync();

    if (++proc->timer > proc->terminator)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EfxWhiteInMain2(struct ProcEfxFlashing * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 0x10, 0x0, proc->timer, proc->terminator2);
    CpuFastCopy(gPaletteBuffer, gEfxPal, PLTT_SIZE);
    EfxPalWhiteInOut(gEfxPal, 0x0, 0x20, ret);
    CpuFastCopy(gEfxPal, (u16 *)PLTT, PLTT_SIZE);
    DisablePaletteSync();

    if (++proc->timer > proc->terminator2)
        Proc_Break(proc);
}

void EfxWhiteInRestorePalSync(struct ProcEfxFlashing * proc)
{
    EnablePaletteSync();
    Proc_Break(proc);
}

CONST_DATA struct ProcCmd ProcScr_efxBlackOUT[] = {
    PROC_NAME("efxBlackOUT"),
    PROC_REPEAT(EfxBlackOutMain1),
    PROC_REPEAT(EfxBlackOutMain2),
    PROC_REPEAT(EfxBlackOutRestorePalSync),
    PROC_END
};

void NewEfxBlackOUT(struct Anim * anim, int duartion, int duartion2)
{
    struct ProcEfxFlashing * proc;
    proc = Proc_Start(ProcScr_efxBlackOUT, PROC_TREE_VSYNC);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duartion;
    proc->terminator2 = duartion2;
}

void EfxBlackOutMain1(struct ProcEfxFlashing * proc)
{
    CpuFastCopy(gPaletteBuffer, gEfxPal, PLTT_SIZE);
    EfxPalBlackInOut(gEfxPal, 0x0, 0x20, 0x0);
    CpuFastCopy(gEfxPal, (u16 *)PLTT, PLTT_SIZE);
    DisablePaletteSync();

    if (++proc->timer > proc->terminator)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EfxBlackOutMain2(struct ProcEfxFlashing * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x10, proc->timer, proc->terminator2);
    CpuFastCopy(gPaletteBuffer, gEfxPal, PLTT_SIZE);
    EfxPalBlackInOut(gEfxPal, 0x0, 0x20, ret);
    CpuFastCopy(gEfxPal, (u16 *)PLTT, PLTT_SIZE);
    DisablePaletteSync();

    if (++proc->timer > proc->terminator2)
        Proc_Break(proc);
}

void EfxBlackOutRestorePalSync(struct ProcEfxFlashing * proc)
{
    EnablePaletteSync();
    Proc_Break(proc);
}

CONST_DATA struct ProcCmd ProcScr_efxBlackIN[] = {
    PROC_NAME("efxBlackIN"),
    PROC_REPEAT(EfxBlackInMain1),
    PROC_REPEAT(EfxBlackInMain2),
    PROC_REPEAT(EfxBlackInRestorePalSync),
    PROC_END
};

void NewEfxBlackIN(struct Anim * anim, int duartion, int duartion2)
{
    struct ProcEfxFlashing * proc;
    proc = Proc_Start(ProcScr_efxBlackIN, PROC_TREE_VSYNC);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = duartion;
    proc->terminator2 = duartion2;
}

void EfxBlackInMain1(struct ProcEfxFlashing * proc)
{
    CpuFastCopy(gPaletteBuffer, gEfxPal, PLTT_SIZE);
    EfxPalBlackInOut(gEfxPal, 0x0, 0x20, 0x10);
    CpuFastCopy(gEfxPal, (u16 *)PLTT, PLTT_SIZE);
    DisablePaletteSync();

    if (++proc->timer > proc->terminator)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EfxBlackInMain2(struct ProcEfxFlashing * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 0x10, 0x0, proc->timer, proc->terminator2);
    CpuFastCopy(gPaletteBuffer, gEfxPal, PLTT_SIZE);
    EfxPalBlackInOut(gEfxPal, 0x0, 0x20, ret);
    CpuFastCopy(gEfxPal, (u16 *)PLTT, PLTT_SIZE);
    DisablePaletteSync();

    if (++proc->timer > proc->terminator2)
        Proc_Break(proc);
}

void EfxBlackInRestorePalSync(struct ProcEfxFlashing * proc)
{
    EnablePaletteSync();
    Proc_Break(proc);
}
