#include "global.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "bmlib.h"
#include "hardware.h"
#include "proc.h"
#include "bmmap.h"
#include "bm.h"
#include "bmudisp.h"
#include "bmio.h"
#include "sio.h"

CONST_DATA struct ProcCmd ProcScr_ekrBattleEnding[] = {
    PROC_NAME("ekrBattleEnding"),
    PROC_REPEAT(ekrBattleEnding_80560F0),
    PROC_REPEAT(ekrBattleEnding_8056170),
    PROC_REPEAT(ekrBattleEnding_80561C8),
    PROC_REPEAT(ekrBattleEnding_8056228),
    PROC_REPEAT(ekrBattleEnding_8056288),
    PROC_REPEAT(ekrBattleEnding_8056310),
    PROC_REPEAT(ekrBattleEnding_8056390),
    PROC_REPEAT(ekrBattleEnding_8056484),
    PROC_END
};

void NewEkrbattleending(void)
{
    struct ProcEkrBattleEnding * proc;
    proc = Proc_Start(ProcScr_ekrBattleEnding, PROC_TREE_3);
    proc->timer = 0;
}

void ekrBattleEnding_80560F0(struct ProcEkrBattleEnding * proc)
{
    int ret;

    if (gBanimBG == 0) {
        Proc_Break(proc);
        return;
    }

    switch (GetBanimDragonStatusType()) {
    case EKRDRGON_TYPE_DRACO_ZOMBIE:
    case EKRDRGON_TYPE_DEMON_KING:
        Proc_Break(proc);
        return;
    
    case EKRDRGON_TYPE_MYRRH:
        break;
    }

    ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x10, proc->timer, 0x8);
    PutBanimBgPAL(gBanimBG - 1);
    EfxPalBlackInOut(gPaletteBuffer, 0x6, 0xA, ret);
    EnablePaletteSync();

    if (++proc->timer == 0x9) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void ekrBattleEnding_8056170(struct ProcEkrBattleEnding * proc)
{
    if (gBanimBG == 0) {
        Proc_Break(proc);
        return;
    }

    switch (GetBanimDragonStatusType()) {
    case EKRDRGON_TYPE_DRACO_ZOMBIE:
    case EKRDRGON_TYPE_DEMON_KING:
        Proc_Break(proc);
        return;
    
    case EKRDRGON_TYPE_MYRRH:
        break;
    }

    UnpackChapterMapGraphics(gPlaySt.chapterIndex);
    EfxChapterMapFadeOUT(0x10);
    RenderBmMap();
    BG_SetPosition(BG_3, 0, 0);
    Proc_Break(proc);
}

void ekrBattleEnding_80561C8(struct ProcEkrBattleEnding * proc)
{
    if (gBanimBG == 0) {
        Proc_Break(proc);
        return;
    }

    switch (GetBanimDragonStatusType()) {
    case EKRDRGON_TYPE_DRACO_ZOMBIE:
    case EKRDRGON_TYPE_DEMON_KING:
        Proc_Break(proc);
        return;
    
    case EKRDRGON_TYPE_MYRRH:
        break;
    }

    EfxChapterMapFadeOUT(Interpolate(INTERPOLATE_LINEAR, 0x10, 0x4, proc->timer, 0x8));

    if (++proc->timer == 0x9) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void ekrBattleEnding_8056228(struct ProcEkrBattleEnding * proc)
{
    int val;

    proc->timer = 0;

    val = (gEkrBmLocation[0] + gEkrBmLocation[2]) * 8 + 8;
    proc->x2 = val;
    proc->x1 = val;

    val = (gEkrBmLocation[1] + gEkrBmLocation[3]) * 8 + 8;
    proc->y2 = val;
    proc->y1 = val;

    AnimClearAll();
    NewEkrUnitKakudai(1);
    NewEkrBaseKaiten(1);
    NewEkrWindowAppear(1, 0xB);
    NewEkrBaseAppear(1, 0xB);
    Proc_Break(proc);
}

void ekrBattleEnding_8056288(struct ProcEkrBattleEnding * proc)
{
    if (++proc->timer > 0xC)
    {
        EndEkrGauge();
        Proc_Break(proc);
        InitBmBgLayers();
        
        SetWinEnable(1, 0, 0);
        SetWin0Box(0, 0, 0, 0);
        SetWin0Layers(1, 1, 1, 1, 1);
        SetWOutLayers(1, 1, 1, 1, 0);
    }
}

void ekrBattleEnding_8056310(struct ProcEkrBattleEnding * proc)
{
    proc->timer = 0;
    proc->terminator = 0xF;
    ResetUnitSprites();
    BMapDispResume_FromBattleDelayed();
    RefreshUnitSprites();
    ForceSyncUnitSpriteSheet();
    SetupMapSpritesPalettes();

    SetBlendConfig(3, 0, 0, 4);
    SetBlendTargetA(0, 0, 0, 1, 0);

    gLCDControlBuffer.wincnt.win0_enableBlend = 0;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    if (GetBattleAnimArenaFlag() != 1)
        UnpackChapterMapPalette();

    if (GetBanimLinkArenaFlag() == 1)
        sub_8049788();
    
    Proc_Break(proc);
}

void ekrBattleEnding_8056390(struct ProcEkrBattleEnding * proc)
{
    int left, top, right, bottom;

    if (proc->timer != proc->terminator)
        proc->timer++;

    left   = Interpolate(INTERPOLATE_LINEAR, proc->x1, 0,    proc->timer, proc->terminator);
    top    = Interpolate(INTERPOLATE_LINEAR, proc->y1, 0,    proc->timer, proc->terminator);
    right  = Interpolate(INTERPOLATE_LINEAR, proc->x2, 0xF0, proc->timer, proc->terminator);
    bottom = Interpolate(INTERPOLATE_LINEAR, proc->y2, 0xA0, proc->timer, proc->terminator);

    SetWin0Box(left, top, right, bottom);
    CpuFastFill16(0, gBG2TilemapBuffer, 0x800);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    if (proc->timer == proc->terminator)
    {
        proc->timer = 0;
        SetWin0Box(0, 0, 0xF0, 0xA0);
        EnablePaletteSync();
        Proc_Break(proc);
    }
}

void ekrBattleEnding_8056484(struct ProcEkrBattleEnding * proc)
{
    EndEkrBattleDeamon();
    RefreshBMapDisplay_FromBattle();
    Proc_Break(proc);
}
