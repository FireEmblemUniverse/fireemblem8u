#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "bm.h"
#include "uiutils.h"
#include "bmio.h"
#include "mu.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"

extern struct Anim *gAnims[4];
extern void *gUnknown_02000010[2];

bool sub_8055BB4(void)
{
    return PrepareBattleGraphicsMaybe();
}

bool sub_8055BC4(void)
{
    return PrepareBattleGraphicsMaybe();
}

void BeginAnimsOnBattleAnimations(void)
{
    int ret;

    if (GetBattleAnimArenaFlag() == true) {
        BeginAnimsOnBattle_Arena();
        return;
    }

    if (CheckBanimHensei() == true) {
        BeginAnimsOnBattle_Hensei();
        return;
    }

    NewEkrBattleDeamon();
    AnimClearAll();
    ret = GetEkrSomePosMaybe();
    gEkrPos2Maybe = ret;
    NewEkrBattleStarting();

    gAnims[0] = NULL;
    gAnims[1] = NULL;
    gAnims[2] = NULL;
    gAnims[3] = NULL;

    gUnknown_02000010[0] = NULL;
    gUnknown_02000010[1] = NULL;

    SetMainUpdateRoutine(MainUpdate_8055C68);
    SetPrimaryHBlankHandler(NULL);
}

void EkrMainEndExec(void)
{
    if (GetBattleAnimArenaFlag() == true) {
        ExecBattleAnimArenaExit();
        return;
    }

    if (CheckBanimHensei() == true) {
        ExecEkrHenseiEnd();
        return;
    }

    NewEkrbattleending();
    SetMainUpdateRoutine(MainUpdate_8055C68);
}

void MainUpdate_8055C68(void)
{
    UpdateKeyStatus(gKeyStatusPtr);
    ClearSprites();

    Proc_Run(gProcTreeRootArray[1]);

    if (GetGameLock() == 0)
        Proc_Run(gProcTreeRootArray[2]);
    
    Proc_Run(gProcTreeRootArray[3]);
    Proc_Run(gProcTreeRootArray[5]);

    PushSpriteLayerObjects(0);
    Proc_Run(gProcTreeRootArray[4]);

    AnimUpdateAll();
    BattleAIS_ExecCommands();

    PushSpriteLayerObjects(0xD);

    gBmSt.mainLoopEndedFlag = true;
    gBmSt.prevVCount = REG_VCOUNT;
    VBlankIntrWait();
}

void NewEkrBattleStarting(void)
{
    Proc_Start(ProcScr_ekrBattleStarting, PROC_TREE_3);
}

void ekrBaStart_InitScreen(struct ProcEkrBattleStarting *proc)
{
    int val;

    proc->unk2C = 0;
    proc->unk2E = 0xF;

    val = (gEkrPairBmLoc[0] + gEkrPairBmLoc[2]) * 8 + 8;
    proc->unk34 = val;
    proc->unk32 = val;

    val = (gEkrPairBmLoc[1] + gEkrPairBmLoc[3]) * 8 + 8;
    proc->unk3C = val;
    proc->unk3A = val;

    CpuFastFill(0, gBG2TilemapBuffer, 0x800);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    SetSpecialColorEffectsParameters(3, 0, 0, 4);
    SetBlendTargetA(0, 0, 0, 1, 0);

    SetWinEnable(1, 0, 0);
    SetWin0Box(0, 0, 0xF0, 0xA0);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 1, 1, 0);
    
    gLCDControlBuffer.wincnt.win0_enableBlend = 0;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    Proc_Break(proc);
}

void ekrBaStart_SreenFailIn(struct ProcEkrBattleStarting *proc)
{
    int left, top, right, bottom;
    
    if (proc->unk2C != proc->unk2E)
        proc->unk2C++;

    left   = Interpolate(INTERPOLATE_LINEAR, 0,    proc->unk32, proc->unk2C, proc->unk2E);
    top    = Interpolate(INTERPOLATE_LINEAR, 0,    proc->unk3A, proc->unk2C, proc->unk2E);
    right  = Interpolate(INTERPOLATE_LINEAR, 0xF0, proc->unk34, proc->unk2C, proc->unk2E);
    bottom = Interpolate(INTERPOLATE_LINEAR, 0xA0, proc->unk3C, proc->unk2C, proc->unk2E);

    SetWin0Box(left, top, right, bottom);

    if (proc->unk2C == proc->unk2E) {
        SetWOutLayers(1, 1, 1, 1, 1);
        SetupOAMBufferSplice(0);
        BMapDispSuspend();
        SetWin0Box(0, 0, 0xF0, 0xA0);
        EkrMaybePalFadeWithVal(gPaletteBuffer, 0x6, 0xA, 0x4);
        EnablePaletteSync();
        MU_EndAll();
        Proc_Break(proc);
    }
}

void ekrBaStart_InitBattleScreen(struct ProcEkrBattleStarting *proc)
{
    if (0 == gEkrDebugModeMaybe) {
        NewEkrGauge();
        NewEkrDispUP();

        switch (gEkrDistanceType) {
        case EKR_DISTANCE_CLOSE:
        case EKR_DISTANCE_FAR:
        case EKR_DISTANCE_FARFAR:
            break;

        case EKR_DISTANCE_3:
            if (gEkrPairSideVaild[EKR_BATTLE_LEFT] == false) {
                EkrGauge_Set4C();
                EkrDispUpSet4C();
            }

            if (gEkrPairSideVaild[EKR_BATTLE_RIGHT] == false) {
                EkrGauge_Set50();
                EkrDispUpSet50();
            }
            break;

        case EKR_DISTANCE_PROMOTION:
            EkrGauge_Set4C();
            EkrDispUpSet4C();
            break;

        default:
            break;
        }
    }

    EfxClearScreenFx();
    NewEkrUnitKakudai(NULL);
    NewEkrBaseKaiten(NULL);
    NewEkrWindowAppear(0, 0xB);
    NewEkrNamewinAppear(0, 0xB, 0);
    NewEkrBaseAppear(0, 0xB);

    proc->unk2C = 0;
    Proc_Break(proc);
}

void ekrBaStart_ExecEkrBattle6C(struct ProcEkrBattleStarting *proc)
{
    if (++proc->unk2C > 0xB) {
        if (gEkrPairSomeTile == 0 || GetBanimDragonStatusType() != EKRDRGON_TYPE_NORMAL) {

            /* In normal battle, here will directly end the proc */
            NewEkrBattle();
            Proc_End(proc);
        } else {
            proc->unk2C = 0;
            NewEkrBattle();
            Proc_Break(proc);
        }
    }
}

void ekrBaStart_8055FE8(struct ProcEkrBattleStarting *proc)
{
    EkrUpdateSomePalMaybe(Interpolate(0, 4, 0x10, proc->unk2C, 8));

    if (++proc->unk2C == 0x9) {
        proc->unk2C = 0;
        Proc_Break(proc);
    }
}

void ekrBaStart_8056024(struct ProcEkrBattleStarting *proc)
{
    if (gEkrSnowWeather == 0)
        gUnknown_0201FAD8 = 0x6;
    else
        gUnknown_0201FAD8 = 0xA;

    sub_8075AD8(gEkrPairSomeTile - 1);
    EkrMaybePalFadeWithVal(gPaletteBuffer, 0x6, 0xA, 0x10);
    Proc_Break(proc);
}

void ekrBaStart_8056078(struct ProcEkrBattleStarting *proc)
{
    int val = Interpolate(0, 0x10, 0, proc->unk2C, 8);

    sub_8075AB4(gEkrPairSomeTile - 1);
    EkrMaybePalFadeWithVal(gPaletteBuffer, 0x6, 0xA, val);
    EnablePaletteSync();

    if (++proc->unk2C == 0x9) {
        proc->unk2C = 0;
        Proc_Break(proc);
    }
}

CONST_DATA struct ProcCmd ProcScr_ekrBattleStarting[] = {
    PROC_NAME("ekrBattleStarting"),
    PROC_REPEAT(ekrBaStart_InitScreen),
    PROC_REPEAT(ekrBaStart_SreenFailIn),
    PROC_REPEAT(ekrBaStart_InitBattleScreen),
    PROC_REPEAT(ekrBaStart_ExecEkrBattle6C),
    PROC_REPEAT(ekrBaStart_8055FE8),
    PROC_REPEAT(ekrBaStart_8056024),
    PROC_REPEAT(ekrBaStart_8056078),
    PROC_END
};
