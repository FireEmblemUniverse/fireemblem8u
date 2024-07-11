#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "bm.h"
#include "bmlib.h"
#include "bmio.h"
#include "mu.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"

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
    ret = GetBanimInitPosReal();
    gEkrInitPosReal = ret;
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

    gBmSt.sync_hardware = true;
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

    proc->timer = 0;
    proc->terminator = 0xF;

    val = (gEkrBmLocation[0] + gEkrBmLocation[2]) * 8 + 8;
    proc->x2 = val;
    proc->x1 = val;

    val = (gEkrBmLocation[1] + gEkrBmLocation[3]) * 8 + 8;
    proc->y2 = val;
    proc->y1 = val;

    CpuFastFill(0, gBG2TilemapBuffer, 0x800);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    SetBlendConfig(3, 0, 0, 4);
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
    
    if (proc->timer != proc->terminator)
        proc->timer++;

    left   = Interpolate(INTERPOLATE_LINEAR, 0,    proc->x1, proc->timer, proc->terminator);
    top    = Interpolate(INTERPOLATE_LINEAR, 0,    proc->y1, proc->timer, proc->terminator);
    right  = Interpolate(INTERPOLATE_LINEAR, 0xF0, proc->x2, proc->timer, proc->terminator);
    bottom = Interpolate(INTERPOLATE_LINEAR, 0xA0, proc->y2, proc->timer, proc->terminator);

    SetWin0Box(left, top, right, bottom);

    if (proc->timer == proc->terminator) {
        SetWOutLayers(1, 1, 1, 1, 1);
        InitOam(0);
        BMapDispSuspend();
        SetWin0Box(0, 0, 0xF0, 0xA0);
        EfxPalBlackInOut(gPaletteBuffer, 0x6, 0xA, 0x4);
        EnablePaletteSync();
        EndAllMus();
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

        case EKR_DISTANCE_MONOCOMBAT:
            if (gBanimValid[EKR_POS_L] == false) {
                EkrGauge_Set4C();
                EkrDispUpSet4C();
            }

            if (gBanimValid[EKR_POS_R] == false) {
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
    NewEkrUnitKakudai(0);
    NewEkrBaseKaiten(0);
    NewEkrWindowAppear(0, 0xB);
    NewEkrNamewinAppear(0, 0xB, 0);
    NewEkrBaseAppear(0, 0xB);

    proc->timer = 0;
    Proc_Break(proc);
}

void ekrBaStart_ExecEkrBattle6C(struct ProcEkrBattleStarting *proc)
{
    if (++proc->timer > 0xB) {
        if (gBanimBG == 0 || GetBanimDragonStatusType() != EKRDRGON_TYPE_NORMAL) {

            /* In normal battle, here will directly end the proc */
            NewEkrBattle();
            Proc_End(proc);
        } else {
            proc->timer = 0;
            NewEkrBattle();
            Proc_Break(proc);
        }
    }
}

void ekrBaStart_8055FE8(struct ProcEkrBattleStarting *proc)
{
    EfxChapterMapFadeOUT(Interpolate(0, 4, 0x10, proc->timer, 8));

    if (++proc->timer == 0x9) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void ekrBaStart_8056024(struct ProcEkrBattleStarting *proc)
{
    if (gEkrSnowWeather == 0)
        gUnknown_0201FAD8 = 0x6;
    else
        gUnknown_0201FAD8 = 0xA;

    PutBanimBG(gBanimBG - 1);
    EfxPalBlackInOut(gPaletteBuffer, 0x6, 0xA, 0x10);
    Proc_Break(proc);
}

void ekrBaStart_8056078(struct ProcEkrBattleStarting *proc)
{
    int val = Interpolate(0, 0x10, 0, proc->timer, 8);

    PutBanimBgPAL(gBanimBG - 1);
    EfxPalBlackInOut(gPaletteBuffer, 0x6, 0xA, val);
    EnablePaletteSync();

    if (++proc->timer == 0x9) {
        proc->timer = 0;
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
