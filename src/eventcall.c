/**
 * Most "ASMCs" are here (functions called through chapter events)
 * Exceptions include the Suspend effect function and probably other
 * system (non-chapter) functions called through events
 */

#include "global.h"
#include "variables.h"
#include "functions.h"
#include "constants/video-global.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "bmlib.h"
#include "proc.h"
#include "event.h"
#include "soundwrapper.h"
#include "gamecontrol.h"
#include "bmio.h"
#include "hardware.h"
#include "bmunit.h"
#include "bmmap.h"
#include "mu.h"
#include "bmreliance.h"
#include "bmtrick.h"
#include "bmdifficulty.h"
#include "ctc.h"
#include "fontgrp.h"
#include "uimenu.h"
#include "bmmind.h"
#include "uiutils.h"
#include "bmbattle.h"
#include "bmitem.h"
#include "bmudisp.h"
#include "bmsave.h"
#include "ekrbattle.h"
#include "prepscreen.h"
#include "eventinfo.h"
#include "mapanim.h"
#include "muctrl.h"
#include "scene.h"
#include "sysutil.h"

#include "eventcall.h"

CONST_DATA struct ProcCmd ProcScr_BmGameOver[] = {
    PROC_SLEEP(0x1E),
    PROC_CALL(GameOver_FadeOutCurrentBgm),
    PROC_SLEEP(0xA),
    PROC_CALL(StartSlowFadeToBlack),
    PROC_SLEEP(0x50),
    PROC_CALL(EndAllMus),
    PROC_CALL(SkilGameOverForToturialExtraMap),
    PROC_CALL(StartGameOverScreen),
    PROC_YIELD,

PROC_LABEL(0x0),
    PROC_CALL(PostGameOverHandler),
    PROC_END
};

void EventCallGameOverExt(ProcPtr proc)
{
    Proc_StartBlocking(ProcScr_BmGameOver, proc);
}

void GameOver_FadeOutCurrentBgm(ProcPtr proc)
{
    if ((PLAY_FLAG_TUTORIAL & gPlaySt.chapterStateBits) || 0 == gPlaySt.config.disableBgm)
        Sound_FadeOutBGM(4);
}

void SkilGameOverForToturialExtraMap(ProcPtr proc)
{
    if ((PLAY_FLAG_TUTORIAL | PLAY_FLAG_EXTRA_MAP) & gPlaySt.chapterStateBits)
        Proc_Goto(proc, 0);
}

void PostGameOverHandler(ProcPtr proc)
{
    SetNextGameActionId(GAME_ACTION_EVENT_RETURN);
    EndBMapMain();
    DeleteEventEngines();
}

int CheckWaitAction_unused(void)
{
    return UNIT_ACTION_WAIT == gActionData.unitActionType;
}

void UnsetKeyIgnoreMask(void)
{
    SetKeyStatus_IgnoreMask(0);
}

void AsnycKeyStatus_ButtonB(void)
{
    AsnycKeyStatus(B_BUTTON);
}

CONST_DATA struct ProcCmd ProcScr_ForceAsyncButtonB[] = {
    PROC_SLEEP(0x1C),
    PROC_CALL(AsnycKeyStatus_ButtonB),
    PROC_SLEEP(0x8),
    PROC_CALL(UnsetKeyIgnoreMask),
    PROC_END
};

void NewForceAsyncButtonB(ProcPtr proc)
{
    Proc_Start(ProcScr_ForceAsyncButtonB, PROC_TREE_4);
}

void HideAllAlliesExceptLeader(void)
{
    struct Unit * leader = GetUnitFromCharId(GetPlayerLeaderUnitId());
    int i;

    int x = leader->xPos;
    int y = leader->yPos;

    for (i = 1; i < FACTION_GREEN; i++)
    {
        struct Unit *unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit == leader)
            continue;

        if (unit->xPos != x || unit->yPos != y)
            continue;
        
        if ((US_RESCUING | US_RESCUED) & unit->state)
            continue;

        unit->state |= US_HIDDEN | US_NOT_DEPLOYED;
    }
    RefreshUnitSprites();
}

void ResetAllPlayerUnitState(void)
{
    int i;
    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        SetUnitHp(unit, GetUnitMaxHp(unit));
        SetUnitStatus(unit, US_NONE);
        unit->torchDuration = 0;
        unit->barrierDuration = 0;
        unit->state &=
            US_DEAD | US_NOT_DEPLOYED | US_GROWTH_BOOST |
            US_SOLOANIM_1 | US_SOLOANIM_2 | US_BIT16 |
            US_BIT20 | US_BIT21 | US_BIT22 |
            US_BIT25 | US_BIT26;

        unit->xPos = -1;

        unit->state |= US_HIDDEN;
        unit->rescue = 0;
    }

    RefreshEntityBmMaps();
    EndAllMus();
}

void TryLockParentProc(ProcPtr proc)
{
    struct Proc * _proc = proc;
    TryLockProc(_proc->proc_parent);
}

void TryUnlockParentProc(ProcPtr proc)
{
    struct Proc * _proc = proc;
    TryUnlockProc(_proc->proc_parent);
}

void ResetAllBG(void)
{
    SetupBackgrounds(NULL);
    SetDispEnable(0, 0, 0, 0, 0);
}

void SwapUnitStatsChar100(void)
{
    SwapUnitStats(GetUnitFromCharId(0x100), GetUnitFromCharId(0x100));
}

void sub_8085550(ProcPtr proc)
{
    StartScreenFlashing(-1, 2, 0x20, 4, 0x180, 0x180, 0x180, proc);
}

void sub_8085578(ProcPtr proc)
{
    StartScreenFlashing(-1, 2, 0x20, 4, 0x200, 0x140, 0x140, proc);
}

void sub_80855A0(struct UnkProc80855A0 * proc)
{
    proc->unk4D = 1;
    SetBlendConfig(3, 0, 0, 16);
    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendBackdropA(1);
}

void sub_80855D4(void)
{
    SetDispEnable(0, 0, 0, 0, 0);
}

void sub_80855F8(void)
{
    SetDispEnable(1, 1, 1, 1, 1);
}

CONST_DATA struct ProcCmd ProcScr_EventHorizontalQuakefx[] = {
    PROC_YIELD,

PROC_LABEL(0),
    PROC_REPEAT(EventQuakefxHorizon_ViolentLoop),

PROC_LABEL(1),
    PROC_REPEAT(EventQuakefxHorizon_SlightLoop),
    PROC_END
};

void EventQuakefxHorizon_ViolentLoop(struct Proc * proc)
{
    struct ProcEventQuakeHandler * parent = proc->proc_parent;

    if (-1 == parent->unk4C)
    {
        if (GetGameClock() % 2)
            gBmSt.camera.x ^= 2;
    } else
    {
        if (GetGameClock() % 2)
            BG_SetPosition(3, GetGameClock() & 2, 0);
    }
}

void EventQuakefxHorizon_SlightLoop(struct Proc * proc)
{
    struct ProcEventQuakeHandler * parent = proc->proc_parent;

    if (-1 == parent->unk4C)
    {
        if (GetGameClock() % 2)
        {
            (u16)gBmSt.camera.x &= ~2;
            gBmSt.camera.x ^= 1;
        }
    }
    else
    {
        if (GetGameClock() % 2)
            BG_SetPosition(3, GetBgXOffset(3) ^ 1, 0);
    }
}

void EventQuakefxVeritical_Loop(struct Proc * proc)
{
    struct ProcEventQuakeHandler * parent = proc->proc_parent;

    if (0x36 == parent->unk4C)
    {
        if (GetGameClock() % 2)
            BG_SetPosition(3, GetGameClock() & 1, 0);
    }
    else
    {
        if (GetGameClock() % 2)
        {
            (u16)gBmSt.camera.y &= 0xFFFD;
            gBmSt.camera.y ^= 1;
        }
    }
}

CONST_DATA struct ProcCmd ProcScr_EventVerticalQuakefx[] = {
    PROC_YIELD,
    PROC_REPEAT(EventQuakefxVeritical_Loop),
    PROC_END
};

void StartEventVeriticalQuakefx(ProcPtr parent)
{
    ProcPtr proc = Proc_Find(ProcScr_EventVerticalQuakefx);
    if (!proc)
        proc = Proc_Start(ProcScr_EventVerticalQuakefx, parent);

    Proc_Goto(proc, 0);
    PlaySoundEffect(0x26A);
}

void StartEventHorizontalQuakefxViolently(ProcPtr parent)
{
    ProcPtr proc = Proc_Find(ProcScr_EventHorizontalQuakefx);
    if (!proc) {
        PlaySoundEffect(0x26A);
        proc = Proc_Start(ProcScr_EventHorizontalQuakefx, parent);
    }
    Proc_Goto(proc, 0);
}

void StartEventHorizontalQuakefxSlightly(ProcPtr parent)
{
    ProcPtr proc = Proc_Find(ProcScr_EventHorizontalQuakefx);
    if (!proc) {
        PlaySoundEffect(0x26A);
        proc = Proc_Start(ProcScr_EventHorizontalQuakefx, parent);
    }
    Proc_Goto(proc, 1);
}

void StartEventHorizontalQuakefxViolentlyNoSound(ProcPtr parent)
{
    ProcPtr proc = Proc_Find(ProcScr_EventHorizontalQuakefx);
    if (!proc)
        proc = Proc_Start(ProcScr_EventHorizontalQuakefx, parent);
    Proc_Goto(proc, 0);
}

void StartEventHorizontalQuakefxSlightlyNoSound(ProcPtr parent)
{
    ProcPtr proc = Proc_Find(ProcScr_EventHorizontalQuakefx);
    if (!proc)
        proc = Proc_Start(ProcScr_EventHorizontalQuakefx, parent);
    Proc_Goto(proc, 1);
}

void EndEventHorizontalQuakefx(ProcPtr parent)
{
    (u16)gBmSt.camera.x &= 0xFFFC;
    Proc_EndEach(ProcScr_EventHorizontalQuakefx);
    Sound_FadeOutSE(4);
}

void EndEventVerticalQuakefx(void)
{
    (u16)gBmSt.camera.y &= 0xFFFC;
    Proc_EndEach(ProcScr_EventVerticalQuakefx);
    Sound_FadeOutSE(4);
}

CONST_DATA struct ProcCmd ProcScr_EventQuakefx[] = {
    PROC_YIELD,
    PROC_CALL(EventQuakefx_Init),
    PROC_REPEAT(EventQuakefx_Loop),
    PROC_END
};

void EventQuakefx_Init(struct Proc * proc)
{
    proc->unk4C = 0;
}

void EventQuakefx_Loop(struct Proc * proc)
{
    struct ProcEventQuakeHandler * parent = proc->proc_parent;

    if (-1 == parent->unk4C)
    {
        if (GetGameClock() % 2)
        {
            (u16)gBmSt.camera.x &= 0xFFFD;
            gBmSt.camera.x ^= 1;
        }
    }
    else
    {
        if (GetGameClock() % 2)
            BG_SetPosition(3, GetBgXOffset(3) ^ 1, 0);
    }

    if (0x10 == ++proc->unk4C)
    {
        Proc_Break(proc);
        Sound_FadeOutSE(4);
    }
}

void StartEventQuakefx(ProcPtr proc)
{
    Proc_Start(ProcScr_EventQuakefx, proc);
    PlaySoundEffect(0x26A);
}

void EndEventQuakefx(ProcPtr proc)
{
    (u16)gBmSt.camera.y &= 0xFFFC;
    Sound_FadeOutSE(4);
    Proc_EndEach(ProcScr_EventQuakefx);
}

void SetEventId_0x84(ProcPtr proc)
{
    SetFlag(0x84);
}

void UnsetEventId_0x84(ProcPtr proc)
{
    ClearFlag(0x84);
}

void UnitTornOut_Init(struct ProcUnitTornOut * proc)
{
    proc->timer = 0;
}

void UnitTornOut_Loop(struct ProcUnitTornOut * proc)
{
    struct Unit * unit = proc->unit;
    int timer = proc->timer;

    TornOutUnitSprite(unit, timer);

    if (proc->timer++ == 63)
    {
        unit->state |= US_HIDDEN | US_NOT_DEPLOYED;
        RefreshEntityBmMaps();
        RefreshUnitSprites();
        Proc_Break(proc);
    }
}

CONST_DATA struct ProcCmd ProcScr_UnitTornOut[] = {
    PROC_YIELD,
    PROC_CALL(UnitTornOut_Init),
    PROC_REPEAT(UnitTornOut_Loop),
    PROC_END
};

void StartUnitTornOut(struct Unit * unit, ProcPtr parent)
{
    struct ProcUnitTornOut * proc;
    proc = Proc_Start(ProcScr_UnitTornOut, parent);
    proc->unit = unit;
}

void nullsub_20(ProcPtr proc)
{
    return;
}

void WorldFlushInit(struct ProcWorldFlush * proc)
{
    proc->count = 0;
    InitScanline();
    SetBlendTargetA(1, 1, 1, 1, 1);
    SetWin0Box(0, 0, 0xF0, 0xA0);
    SetWinEnable(1, 0, 0);

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 0;

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 1, 1, 1);

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 0;

    SetBlendConfig(2, 0, 0, 0);
    SetPrimaryHBlankHandler(WorldFlushHBlank);
    PlaySoundEffect(0x269);
}

void WorldFlushOut(struct ProcWorldFlush * proc)
{
    int val0, val1, val2, val3, count, max_count;
    
    val2 = 0x40;
    val1 = 0xF0;

    proc->count += 1;

    val1 = val1 * proc->count * proc->count;
    val0 = 0x1000;
    val1 = val1 / val0;

    val2 = val2 - proc->count;
    val2 = (0x10 * val2 * val2) / val0;
    val3 = 0x10 - val2;

    sub_8082730(0x78, 0x68, val1);
    SetBlendConfig(2, 0, 0, val3);

    count = proc->count;
    max_count = 0x40;
    if (count >= max_count)
        Proc_Break(proc);
}

void WorldFlushReload(struct ProcWorldFlush * proc)
{
    ApplyMapChangesById(1);
    EnableMapChange(1);
    RefreshTerrainBmMap();
    UpdateRoofedUnits();
    RenderBmMap();
    proc->count = 0;
}

/* https://decomp.me/scratch/sgFDG */
void WorldFlushIn(struct ProcWorldFlush * proc)
{
    int val0, val1, val3, val4, val5, count, max_count;
#ifndef NONMATCHING
    register int val2 asm("r5");
#else
    int val2;
#endif
    val1 = 0x80;
    val2 = 0xF0;

    proc->count += 1;

    val1 = val1 - proc->count;
    val5 = val1 * val2;
    val5 = val5 * val1;
    val4 = 0x4000;
    val2 = val5 / val4;

    val3 = (int)((proc->count *  0x10) * proc->count) / val4;
    val0 = 0x10 - val3;

    sub_8082730(0x78, 0x30, val2);
    SetBlendConfig(2, 0, 0, val0);

    count = proc->count;
    max_count = 0x80;
    if (count >= max_count)
        Proc_Break(proc);
}

void WorldFlushCallBack(void)
{
    SetPrimaryHBlankHandler(0);
    SetBlendConfig(0, 0, 0, 0);
    
    SetWinEnable(0, 0, 0);
    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;
}

CONST_DATA struct ProcCmd ProcScr_WorldFlush[] = {
    PROC_YIELD,
    PROC_SET_END_CB(WorldFlushCallBack),
    PROC_CALL(WorldFlushInit),
    PROC_REPEAT(WorldFlushOut),
    PROC_CALL(WorldFlushReload),
    PROC_REPEAT(WorldFlushIn),
    PROC_END
};

void StartWorldFlush(struct EventEngineProc * proc)
{
    Proc_StartBlocking(ProcScr_WorldFlush, proc);
}
