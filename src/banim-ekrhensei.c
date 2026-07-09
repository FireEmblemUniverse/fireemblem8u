#include "global.h"
#include "bmbattle.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "proc.h"
#include "uiutils.h"
#include "bmlib.h"
#include "bm.h"

int CheckBanimHensei(void)
{
    if (gBattleStats.config & BATTLE_CONFIG_PROMOTION_PREP)
        return true;

    return false;
}

void BeginAnimsOnBattle_Hensei(void)
{
    int pos;
    NewEkrBattleDeamon();
    AnimClearAll();
    pos = GetBanimInitPosReal();
    gEkrInitPosReal = pos;
    NewEkrHenseiInitPROC();
    SetPrimaryHBlankHandler(NULL);
}

void ExecEkrHenseiEnd(void)
{
    AnimClearAll();
    NewEkrHenseiEnd();
    SetMainUpdateRoutine(MainUpdate_0);
}

void EkrHenseiInit_Init(struct ProcEkrHensei *proc);
void EkrHenseiInit_SetupFade(struct ProcEkrHensei *proc);
void EkrHenseiInit_FadeInLoop(struct ProcEkrHensei *proc);
void EkrHenseiInit_End(struct ProcEkrHensei *proc);

void NewEkrHenseiInitPROC(void)
{
    Proc_Start(ProcScr_ekrHenseiInit, PROC_TREE_3);
}

CONST_DATA struct ProcCmd ProcScr_ekrHenseiInit[] = {
    PROC_NAME("ekrHenseiInitPROC"),
    PROC_REPEAT(EkrHenseiInit_Init),
    PROC_REPEAT(EkrHenseiInit_SetupFade),
    PROC_REPEAT(EkrHenseiInit_FadeInLoop),
    PROC_REPEAT(EkrHenseiInit_End),
    PROC_END
};

void EkrHenseiInit_Init(struct ProcEkrHensei *proc)
{
    InitOam(0);
    EfxClearScreenFx();
    UpdateBanimFrame();

    NewEkrGauge();
    NewEkrDispUP();
    NewEkrBattle();

    PutBanimBG(gBanimBG - 1);
    CpuFastCopy(PAL_BG(0), gEfxPal, 0x400);
    EfxPalBlackInOut(PAL_BG(0), 0, 0x20, 0x10);
    EnablePaletteSync();
    Proc_Break(proc);
}

void EkrHenseiInit_SetupFade(struct ProcEkrHensei *proc)
{
    EkrGauge_Set4C();
    EkrDispUpSet4C();

    proc->timer = 0;
    proc->terminator = 0x10;
    Proc_Break(proc);
}

void EkrHenseiInit_FadeInLoop(struct ProcEkrHensei *proc)
{
    int color = Interpolate(INTERPOLATE_LINEAR, 0x10, 0, proc->timer, proc->terminator);

    CpuFastCopy(gEfxPal, PAL_BG(0), 0x400);
    EfxPalBlackInOut(PAL_BG(0), 0, 0x20, color);
    EnablePaletteSync();

    if (++proc->timer == (proc->terminator + 1))
        Proc_Break(proc);
}

void EkrHenseiInit_End(struct ProcEkrHensei *proc)
{
    Proc_Break(proc);
}

void EkrHenseiEnd_Init(struct ProcEkrHensei *proc);
void EkrHenseiEnd_FadeOutLoop(struct ProcEkrHensei *proc);
void EkrHenseiEnd_End(struct ProcEkrHensei *proc);

CONST_DATA struct ProcCmd ProcScr_ekrHenseiEnd[] = {
    PROC_NAME("ekrHenseiEndPROC"),
    PROC_REPEAT(EkrHenseiEnd_Init),
    PROC_REPEAT(EkrHenseiEnd_FadeOutLoop),
    PROC_REPEAT(EkrHenseiEnd_End),
    PROC_END
};

void NewEkrHenseiEnd(void)
{
    Proc_Start(ProcScr_ekrHenseiEnd, PROC_TREE_3);
}

void EkrHenseiEnd_Init(struct ProcEkrHensei *proc)
{
    CpuFastCopy(PAL_BG(0), gEfxPal, 0x400);

    proc->timer = 0;
    proc->terminator = 0x10;

    Proc_Break(proc);
}

void EkrHenseiEnd_FadeOutLoop(struct ProcEkrHensei *proc)
{
    int color = Interpolate(INTERPOLATE_LINEAR, 0, 0x10, proc->timer, proc->terminator);

    CpuFastCopy(gEfxPal, PAL_BG(0), 0x400);
    EfxPalBlackInOut(PAL_BG(0), 0, 0x20, color);
    EnablePaletteSync();

    if (++proc->timer == (proc->terminator + 1))
        Proc_Break(proc);
}

void EkrHenseiEnd_End(struct ProcEkrHensei *proc)
{
    EndEkrBattleDeamon();
    EndEkrGauge();
    SetMainUpdateRoutine(OnMain);
    SetInterrupt_LCDVBlank(OnVBlank);
    Proc_Break(proc);
}
