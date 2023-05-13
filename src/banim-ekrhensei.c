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

struct ProcEkrHensei {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ s16 unk2C;
    /* 2E */ s16 unk2E;
};

int CheckBanimHensei(void)
{
    if (gBattleStats.config & BATTLE_CONFIG_PROMOTION_CHAR100)
        return true;

    return false;
}

void BeginAnimsOnBattle_Hensei(void)
{
    int pos;
    NewEkrBattleDeamon();
    AnimClearAll();
    pos = GetEkrSomePosMaybe();
    gEkrPos2Maybe = pos;
    NewEkrHenseiInitPROC();
    SetPrimaryHBlankHandler(NULL);
}

void ExecEkrHenseiEnd(void)
{
    AnimClearAll();
    NewEkrHenseiEnd();
    SetMainUpdateRoutine(MainUpdate_8055C68);
}

void sub_8076380(struct ProcEkrHensei *proc);
void sub_80763E0(struct ProcEkrHensei *proc);
void sub_8076400(struct ProcEkrHensei *proc);
void sub_8076464(struct ProcEkrHensei *proc);

void NewEkrHenseiInitPROC(void)
{
    Proc_Start(ProcScr_ekrHenseiInit, PROC_TREE_3);
}

CONST_DATA struct ProcCmd ProcScr_ekrHenseiInit[] = {
    PROC_NAME("ekrHenseiInitPROC"),
    PROC_REPEAT(sub_8076380),
    PROC_REPEAT(sub_80763E0),
    PROC_REPEAT(sub_8076400),
    PROC_REPEAT(sub_8076464),
    PROC_END
};

void sub_8076380(struct ProcEkrHensei *proc)
{
    SetupOAMBufferSplice(0);
    EfxClearScreenFx();
    UpdateBanimFrame();

    NewEkrGauge();
    NewEkrDispUP();
    NewEkrBattle();

    PutBanimBG(gEkrPairSomeTile - 1);
    CpuFastCopy(PAL_BG(0), gEkrBgPalBackupMaybe, 0x400);
    EkrMaybePalFadeWithVal(PAL_BG(0), 0, 0x20, 0x10);
    EnablePaletteSync();
    Proc_Break(proc);
}

void sub_80763E0(struct ProcEkrHensei *proc)
{
    EkrGauge_Set4C();
    EkrDispUpSet4C();

    proc->unk2C = 0;
    proc->unk2E = 0x10;
    Proc_Break(proc);
}

void sub_8076400(struct ProcEkrHensei *proc)
{
    int color = Interpolate(INTERPOLATE_LINEAR, 0x10, 0, proc->unk2C, proc->unk2E);

    CpuFastCopy(gEkrBgPalBackupMaybe, PAL_BG(0), 0x400);
    EkrMaybePalFadeWithVal(PAL_BG(0), 0, 0x20, color);
    EnablePaletteSync();

    if (++proc->unk2C == (proc->unk2E + 1))
        Proc_Break(proc);
}

void sub_8076464(struct ProcEkrHensei *proc)
{
    Proc_Break(proc);
}

void sub_8076484(struct ProcEkrHensei *proc);
void sub_80764B0(struct ProcEkrHensei *proc);
void sub_8076514(struct ProcEkrHensei *proc);

CONST_DATA struct ProcCmd ProcScr_ekrHenseiEnd[] = {
    PROC_NAME("ekrHenseiEndPROC"),
    PROC_REPEAT(sub_8076484),
    PROC_REPEAT(sub_80764B0),
    PROC_REPEAT(sub_8076514),
    PROC_END
};

void NewEkrHenseiEnd(void)
{
    Proc_Start(ProcScr_ekrHenseiEnd, PROC_TREE_3);
}

void sub_8076484(struct ProcEkrHensei *proc)
{
    CpuFastCopy(PAL_BG(0), gEkrBgPalBackupMaybe, 0x400);

    proc->unk2C = 0;
    proc->unk2E = 0x10;

    Proc_Break(proc);
}

void sub_80764B0(struct ProcEkrHensei *proc)
{
    int color = Interpolate(INTERPOLATE_LINEAR, 0, 0x10, proc->unk2C, proc->unk2E);

    CpuFastCopy(gEkrBgPalBackupMaybe, PAL_BG(0), 0x400);
    EkrMaybePalFadeWithVal(PAL_BG(0), 0, 0x20, color);
    EnablePaletteSync();

    if (++proc->unk2C == (proc->unk2E + 1))
        Proc_Break(proc);
}

void sub_8076514(struct ProcEkrHensei *proc)
{
    EndEkrBattleDeamon();
    EndEkrGauge();
    SetMainUpdateRoutine(OnGameLoopMain);
    SetInterrupt_LCDVBlank(OnVBlank);
    Proc_Break(proc);
}
