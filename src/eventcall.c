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

#include "eventcall.h"

CONST_DATA struct ProcCmd ProcScr_BmGameOver[] = {
    PROC_SLEEP(0x1E),
    PROC_CALL(GameOver_FadeOutCurrentBgm),
    PROC_SLEEP(0xA),
    PROC_CALL(StartSlowFadeToBlack),
    PROC_SLEEP(0x50),
    PROC_CALL(MU_EndAll),
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
    MU_EndAll();
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
    sub_800915C(-1, 2, 0x20, 4, 0x180, 0x180, 0x180, proc);
}

void sub_8085578(ProcPtr proc)
{
    sub_800915C(-1, 2, 0x20, 4, 0x200, 0x140, 0x140, proc);
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

CONST_DATA struct ProcCmd gUnknown_089EE000[] = {
    PROC_YIELD,

PROC_LABEL(0),
    PROC_REPEAT(sub_8085618),

PROC_LABEL(1),
    PROC_REPEAT(sub_8085670),
    PROC_END
};

void sub_8085618(struct Proc * proc)
{
    struct Proc8085618 * parent = proc->proc_parent;

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

void sub_8085670(struct Proc * proc)
{
    struct Proc8085618 * parent = proc->proc_parent;

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

void sub_80856D0(struct EventEngineProc * proc)
{
    struct Proc8085618 *parent = proc->proc_parent;

    if (0x36 == parent->unk4C) {
        if (GetGameClock() % 2) {
            BG_SetPosition(3, GetGameClock() & 1, 0);
        }
    } else {
        if (GetGameClock() % 2) {
            (u16)gBmSt.camera.y &= 0xFFFD;
            gBmSt.camera.y ^= 1;
        }
    }
}

CONST_DATA struct ProcCmd ProcScr_089EE030[] = {
    PROC_YIELD,
    PROC_REPEAT(sub_80856D0),
    PROC_END
};

void sub_8085728(ProcPtr parent)
{
    ProcPtr proc = Proc_Find(ProcScr_089EE030);
    if (!proc)
        proc = Proc_Start(ProcScr_089EE030, parent);

    Proc_Goto(proc, 0);
    PlaySoundEffect(0x26A);
}

void sub_808576C(ProcPtr parent)
{
    ProcPtr proc = Proc_Find(gUnknown_089EE000);
    if (!proc) {
        PlaySoundEffect(0x26A);
        proc = Proc_Start(gUnknown_089EE000, parent);
    }
    Proc_Goto(proc, 0);
}

void sub_80857B0(ProcPtr parent)
{
    ProcPtr proc = Proc_Find(gUnknown_089EE000);
    if (!proc) {
        PlaySoundEffect(0x26A);
        proc = Proc_Start(gUnknown_089EE000, parent);
    }
    Proc_Goto(proc, 1);
}

void sub_80857F4(ProcPtr parent)
{
    ProcPtr proc = Proc_Find(gUnknown_089EE000);
    if (!proc)
        proc = Proc_Start(gUnknown_089EE000, parent);
    Proc_Goto(proc, 0);
}

void sub_808581C(ProcPtr parent)
{
    ProcPtr proc = Proc_Find(gUnknown_089EE000);
    if (!proc)
        proc = Proc_Start(gUnknown_089EE000, parent);
    Proc_Goto(proc, 1);
}

void sub_8085844(ProcPtr parent)
{
    (u16)gBmSt.camera.x &= 0xFFFC;
    Proc_EndEach(gUnknown_089EE000);
    Sound_FadeOutSE(4);
}

CONST_DATA struct ProcCmd ProcScr_089EE048[] = {
    PROC_YIELD,
    PROC_CALL(sub_8085894),
    PROC_REPEAT(sub_808589C),
    PROC_END
};

void sub_808586C(void)
{
    (u16)gBmSt.camera.y &= 0xFFFC;
    Proc_EndEach(ProcScr_089EE030);
    Sound_FadeOutSE(4);
}

void sub_8085894(struct Proc * proc)
{
    proc->unk4C = 0;
}

void sub_808589C(struct Proc * proc)
{
    struct Proc8085618 * parent = proc->proc_parent;

    if (-1 == parent->unk4C)
    {
        if (GetGameClock() % 2)
        {
            (u16)gBmSt.camera.x &= 0xFFFD;
            gBmSt.camera.x ^= 1;
        }
    } else
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

void sub_808591C(struct EventEngineProc * proc)
{
    Proc_Start(ProcScr_089EE048, proc);
    PlaySoundEffect(0x26A);
}

void sub_8085948(struct EventEngineProc * proc)
{
    (u16)gBmSt.camera.y &= 0xFFFC;
    Sound_FadeOutSE(4);
    Proc_EndEach(ProcScr_089EE048);
}

void SetEventId_0x84(ProcPtr proc)
{
    SetFlag(0x84);
}

void UnsetEventId_0x84(ProcPtr proc)
{
    ClearFlag(0x84);
}

void sub_8085988(struct EventEngineProc * proc)
{
    proc->unitLoadCount = 0;
}

void sub_8085990(struct EventEngineProc * proc)
{
    struct Unit * unit = proc->unit;
    int count = proc->unitLoadCount;
    sub_8026C1C(unit, count);
    
    if (63 == proc->unitLoadCount++) {
        unit->state |= US_HIDDEN | US_NOT_DEPLOYED;
        RefreshEntityBmMaps();
        RefreshUnitSprites();
        Proc_Break(proc);
    }    
}

CONST_DATA struct ProcCmd ProcScr_089EE068[] = {
    PROC_YIELD,
    PROC_CALL(sub_8085988),
    PROC_REPEAT(sub_8085990),
    PROC_END
};

void sub_80859D0(ProcPtr proc, ProcPtr parent)
{
    struct Proc89EE068 *_proc;
    _proc = Proc_Start(ProcScr_089EE068, parent);
    _proc->unk_proc = proc;
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

void sub_8085C10()
{
    UpdateBestGlobalSupportValue(0x100, 0x100, 1);
}

void sub_8085C24()
{
    UpdateBestGlobalSupportValue(0x100, 0x100, 2);
}

void sub_8085C38()
{
    UpdateBestGlobalSupportValue(0x100, 0x100, 3);
}

void sub_8085C4C()
{
    InitDungeon(0);
}

void sub_8085C58()
{
    InitDungeon(1);
}

/* Display the "Map Clear!"" Effect (From the Tower of Valni and Lagdou Ruins) */
void DisplayMapClearMapAnim(ProcPtr proc)
{
    DisplayEventMapAnim(proc, 1);
}

void DisplayCongratulationsMapAnim(ProcPtr proc)
{
    DisplayEventMapAnim(proc, 0);
}

void DisplayEventMapAnim(ProcPtr parent, int val)
{
    struct ProcEventMapAnim * proc = Proc_StartBlocking(ProcScr_EventMapAnim, parent);

#ifndef NONMATCHING
    asm("add r2, r0, #0");
#endif
    proc->mode = val;

    SetDispEnable(0, 0, 1, 1, 1);
    FlushLCDControl();
    
    BG_SetPosition(0, 0, 0xFFD4);
    BG_SetPosition(1, 0, 0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);

    SetWinEnable(0, 0, 0);
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;
    SetBlendConfig(1, 4, 0xC, 0);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 1);

    Decompress(Img_PhaseChangeSquares, BG_CHR_ADDR(BGCHR_PHASE_CHANGE_SQUARES));
    ApplyPalette(Pal_PhaseChangePlayer, BGPAL_PHASE_CHANGE);

    DrawEventMapAnimMaskfx(0, 0);
    ApplyPalette(Pal_EventMapAnimMaskfx, 0);

    if (0 == val) {
        Decompress(Img_Congratulations, BG_CHR_ADDR(0xA00));
        ApplyPalette(Pal_Congratulations, 0x12);
    } else {
        Decompress(Img_MapClear, BG_CHR_ADDR(0xA00));
        ApplyPalette(Pal_MapClear, 0x12);
    }

    BG_EnableSyncByMask(3);
    gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0;
    EnablePaletteSync();
}

void DrawEventMapAnimMaskfx(int index, int mode)
{
    if (0 == mode)
        Decompress(ImgLut_EventMapAnimMaskfx[index], BG_CHR_ADDR(0x140));
    else
        Decompress(ImgLut_EventMapAnimMaskfx[index], BG_CHR_ADDR(0x200));
}

void sub_8085E08(int index, int mode)
{
    int i;
    u16 *buf = gBG0TilemapBuffer;
    int val = 0x200;
    if (0 == mode)
        val = 0x140;

    Decompress(gUnknown_089EE9C8[index], buf);

    for (i = 0; i < 0x160; i++, buf++)
        *buf += val;
}

void sub_8085E48(struct ProcEventMapAnim * proc)
{
    if (0 == proc->mode)
        StartBgm(0x3D, 0);
    else
        StartBgm(0x3C, 0);

    SetDispEnable(1, 1, 1, 1, 1);
    proc->timer = 0;
}

void sub_8085E94(struct ProcEventMapAnim * proc)
{
    int iy, ix;
    struct Proc89EEA28 *child;

    for (iy = 2; iy >= 0; --iy) {
        for (ix = 14; ix >= 0; --ix) {
            int val = (ix - proc->timer) + (0xE - iy);
            int newX, newY;

            if (val > 0x10)
                val = 0x10;
            if (val < 0)
                val = 0;

            val = (0x10 - val) & 0xFE;

            newX = ix * 2;
            newY = iy * 2 + 0x07;

            gBG1TilemapBuffer[TILEMAP_INDEX(newX + 0, newY + 0)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x00, BGPAL_PHASE_CHANGE);
            gBG1TilemapBuffer[TILEMAP_INDEX(newX + 1, newY + 0)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x01, BGPAL_PHASE_CHANGE);
            gBG1TilemapBuffer[TILEMAP_INDEX(newX + 0, newY + 1)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x20, BGPAL_PHASE_CHANGE);
            gBG1TilemapBuffer[TILEMAP_INDEX(newX + 1, newY + 1)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x21, BGPAL_PHASE_CHANGE);
        }
    }

    proc->timer++;
    BG_EnableSyncByMask(2);

    if (0x1C == proc->timer) {
        proc->timer = 0;
        child = Proc_Start(gUnknown_089EEA28, proc);
        child->mode = proc->mode;
        Proc_Break(proc);
    }
}

void nullsub_30()
{
    return;
}

void sub_8085F88(struct ProcEventMapAnim * proc)
{
    int iy, ix;

    for (iy = 2; iy >= 0; --iy) {
        for (ix = 14; ix >= 0; --ix) {
            int val = (ix - proc->timer) + (0xE - iy);
            int newX, newY;

            if (val > 0x10)
                val = 0x10;
            if (val < 0)
                val = 0;

            val = val & 0xFE;

            newX = ix * 2;
            newY = iy * 2 + 0x07;

            gBG1TilemapBuffer[TILEMAP_INDEX(newX + 0, newY + 0)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x01, BGPAL_PHASE_CHANGE) + TILE_HFLIP;
            gBG1TilemapBuffer[TILEMAP_INDEX(newX + 1, newY + 0)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x00, BGPAL_PHASE_CHANGE) + TILE_HFLIP;
            gBG1TilemapBuffer[TILEMAP_INDEX(newX + 0, newY + 1)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x21, BGPAL_PHASE_CHANGE) + TILE_HFLIP;
            gBG1TilemapBuffer[TILEMAP_INDEX(newX + 1, newY + 1)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x20, BGPAL_PHASE_CHANGE) + TILE_HFLIP;
        }
    }
    
    proc->timer++;
    BG_EnableSyncByMask(2);

    if (0x1C == proc->timer) {
        Proc_EndEach(gUnknown_089EEA28);
        proc->timer = 0;
        proc->count = 0;
        SetBlendConfig(1, 0x10, 0x10, 0);
        SetBlendTargetA(1, 0, 0, 0, 0);
        SetBlendTargetB(0, 1, 1, 1, 1);
        Proc_Break(proc);
    }
}

void sub_808609C(struct ProcEventMapAnim * proc)
{
    switch (proc->timer) {
        case 0:
            sub_8085E08(proc->count, 1 & proc->count);
            BG_EnableSyncByMask(1);
            proc->count += 1;
            break;

        case 1:
            if (6 == proc->count) {
                Proc_Break(proc);
                return;
            }
            DrawEventMapAnimMaskfx(proc->count, 1 & proc->count);
            proc->timer = -1;
            break;

        default:
            break;
    }

    proc->timer++;
}

void sub_8086100(struct ProcEventMapAnim * proc)
{
    BG_SetPosition(0, 0, 0);
    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_EnableSyncByMask(3);
    SetDefaultColorEffects();
}

void sub_8086134(struct Proc89EEA28 * proc)
{
    proc->timer = 0;
}

void sub_808613C(struct Proc89EEA28 * proc)
{
    int val1 = Interpolate(0, -24, 0, proc->timer, 0x10);
    int val2 = Interpolate(0, 2, 0x100, proc->timer, 0x10);

    SetObjAffine(
        0,
        Div(+COS(0) * 0x10, 0x100),
        Div(-SIN(0) * 0x10, val2),
        Div(+SIN(0) * 0x10, 0x100),
        Div(+COS(0) * 0x10, val2)
    );
    
    PutSprite(
        0, 0x1FF & (val1 + 0x18), 0x40,
        Obj_089EE99C, 0
    );

    if (0x10 == proc->timer) {
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }

    proc->timer++;
}

void sub_808622C(struct Proc89EEA28 * proc)
{
    int val = Interpolate(0, 0, 0x10, proc->timer, 8);

    if (0 == proc->mode)
        ApplyPalette(Pal_Congratulations, 0x12);
    else
        ApplyPalette(Pal_MapClear, 0x12);

    EfxPalWhiteInOut(gPaletteBuffer, 0x12, 1, val);
    EnablePaletteSync();
    PutSprite(0, 0x18, 0x40, Obj_089EE99C, 0);

    if (8 == proc->timer) {
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }

    proc->timer++;
}

void sub_80862C4(struct Proc89EEA28 * proc)
{
    int val = Interpolate(0, 0x10, 0, proc->timer, 8);

    if (0 == proc->mode)
        ApplyPalette(Pal_Congratulations, 0x12);
    else
        ApplyPalette(Pal_MapClear, 0x12);

    EfxPalWhiteInOut(gPaletteBuffer, 0x12, 1, val);
    EnablePaletteSync();
    PutSprite(0, 0x18, 0x40, Obj_089EE99C, 0);

    if (8 == proc->timer) {
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }

    proc->timer++;
}

void sub_808635C(struct Proc89EEA28 * proc)
{
    SetObjAffine(
        0,
        Div(+COS(0) * 0x10, 0x100),
        Div(-SIN(0) * 0x10, 0x100),
        Div(+SIN(0) * 0x10, 0x100),
        Div(+COS(0) * 0x10, 0x100)
    );
    PutSprite(0, 0x18, 0x40, Obj_089EE99C, 0);

    if (0x20 == proc->timer)
        Proc_BreakEach(ProcScr_EventMapAnim);

    proc->timer++;
}

void HandleCh5xUnits_Start()
{
    int i;
    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++) {
        struct Unit *unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        switch (unit->pCharacterData->number) {
            case CHARACTER_EPHRAIM:
            case CHARACTER_FORDE:
            case CHARACTER_KYLE:
            case CHARACTER_ORSON_CH5X:
                continue;
        }
        if (US_BIT16 & unit->state)
            unit->state |= US_BIT26;

        unit->state |= US_BIT16 | US_HIDDEN;
    }
}

void HandleCh5xUnits_End()
{
    int i;
    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++) {
        struct Unit *unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        switch (unit->pCharacterData->number) {
            case CHARACTER_EPHRAIM:
            case CHARACTER_FORDE:
            case CHARACTER_KYLE:
                unit->state &= ~US_DEAD;
                unit->state |= US_HIDDEN | US_BIT16;
                continue;

            case CHARACTER_ORSON_CH5X:
                ClearUnit(unit);
                continue;
        }

        if (0 == (unit->state & US_BIT26))
            unit->state &= ~(US_BIT16 | US_HIDDEN);

    }
}

void CallRouteSplitMenu(ProcPtr proc)
{
    ClearBg0Bg1();
    SetDispEnable(1, 1, 1, 1, 1);
    SetTextFont(0);
    InitSystemTextFont();
    LoadUiFrameGraphics();
    StartMenu(&MenuDef_RouteSplit, proc);
}

int MenuCommand_DrawRouteSplit(struct MenuProc* menu, struct MenuItemProc* menu_item)
{
    const char *str = GetStringFromIndex(menu_item->def->nameMsgId);

    Text_SetParams(&menu_item->text, 0, TEXT_COLOR_SYSTEM_WHITE);
    Text_DrawString(&menu_item->text, str);
    PutText(
        &menu_item->text,
        TILEMAP_LOCATED(gBG0TilemapBuffer, menu_item->xTile + 1, menu_item->yTile)
    );
    ResetText();
    return 0;
}

u8 Command_EirikaMode(struct MenuProc* menu, struct MenuItemProc* menu_item)
{
    gPlaySt.chapterModeIndex = CHAPTER_MODE_EIRIKA;
    SetEventSlotC(0xC17);
    return MENU_ACT_CLEAR | MENU_ACT_SND6A | MENU_ACT_END | MENU_ACT_SKIPCURSOR;
}

u8 Command_EphraimMode(struct MenuProc* menu, struct MenuItemProc* menu_item)
{
    gPlaySt.chapterModeIndex = CHAPTER_MODE_EPHRAIM;
    SetEventSlotC(0xC18);
    return MENU_ACT_CLEAR | MENU_ACT_SND6A | MENU_ACT_END | MENU_ACT_SKIPCURSOR;
}

void AutolevelSecondaryLord()
{
    u8 i;
    struct BattleUnit bunit;
    struct Unit *unit;

    switch (gPlaySt.chapterModeIndex) {
    case CHAPTER_MODE_EIRIKA:
        unit = GetUnitFromCharId(CHARACTER_EPHRAIM);
        break;

    case CHAPTER_MODE_EPHRAIM:
        unit = GetUnitFromCharId(CHARACTER_EIRIKA);
        break;
    }

    /** 
     * This may cause bug if unit is not initialized!
     *
     * if (!UNIT_IS_VALID(unit))
     *     return;
     */

    if (unit->level < 15) {
        u8 old_level = unit->level;
        u8 tar_level = unit->level + 6;

        if (tar_level < 10)
            tar_level = 10;
        if (tar_level > 15)
            tar_level = 15;

        while (old_level < tar_level) {
            InitBattleUnit(&bunit, unit);
            bunit.unit.exp += 100;
            CheckBattleUnitLevelUp(&bunit);
            UpdateUnitFromBattle(unit, &bunit);
            old_level++;
        }
        unit->exp = 0;
    }

    for (i = 0; i < 8; i++) {
        u8 rank = unit->ranks[i] - 1;
        if (rank <= 0x45)
            unit->ranks[i] = 0x47;
    }

    for (i = 0; i < 5; i++) {
        if (0 == unit->items[i]) {
            switch (gPlaySt.chapterModeIndex) {
            case CHAPTER_MODE_EIRIKA:
                UnitAddItem(unit, MakeNewItem(ITEM_LANCE_STEEL));
                break;
            
            case CHAPTER_MODE_EPHRAIM:
                UnitAddItem(unit, MakeNewItem(ITEM_SWORD_STEEL));
                break;
            }
            break;
        }
    }
}

void AutoGenerateUnitdef(u8 idx, int jid, s8 x_from, s8 y_from, s8 x_to, s8 y_to)
{
    gUdefREDAs[idx].x = x_to;
    gUdefREDAs[idx].y = y_to;
    gUdefREDAs[idx].flags = 0;
    gUdefREDAs[idx].a = 0;
    gUdefREDAs[idx].b = 0xFFFF;
    gUdefREDAs[idx].delayFrames = 30;


    gUdefs[idx].charIndex = CHARACTER_EIRIKA;
    gUdefs[idx].classIndex = jid;
    gUdefs[idx].leaderCharIndex = 0;
    gUdefs[idx].autolevel = false;
    gUdefs[idx].allegiance = FACTION_ID_RED;
    gUdefs[idx].level = 1;
    gUdefs[idx].xPosition = x_from;
    gUdefs[idx].yPosition = y_from;
    gUdefs[idx].genMonster = false;
    gUdefs[idx].itemDrop = true;
    gUdefs[idx].unk_05_7 = false;
    gUdefs[idx].extraData = 0;
    gUdefs[idx].redaCount = 1;
    gUdefs[idx].redas = &gUdefREDAs[idx];

    gUdefs[idx].items[0] = 0;
    gUdefs[idx].items[1] = 0;
    gUdefs[idx].items[2] = 0;
    gUdefs[idx].items[3] = 0;

    gUdefs[idx].ai[0] = 0;
    gUdefs[idx].ai[1] = 0;
    gUdefs[idx].ai[2] = 0;
    gUdefs[idx].ai[3] = 0;
}

void sub_808679C(void)
{
#if NONMATCHING
    AutoGenerateUnitdef(0, gAutoUdefJids[0 + 4 * gUdefCnt], 0, 2, 14, 2);
    AutoGenerateUnitdef(1, gAutoUdefJids[1 + 4 * gUdefCnt], 0, 3, 14, 3);
    AutoGenerateUnitdef(2, gAutoUdefJids[2 + 4 * gUdefCnt], 0, 4, 14, 4);
    AutoGenerateUnitdef(3, gAutoUdefJids[3 + 4 * gUdefCnt], 0, 5, 14, 5);
#else
    int val;
    u8 jid;
    u8 * jid_lut;

    jid = gAutoUdefJids[0 + 4 * gUdefCnt];
    AutoGenerateUnitdef(0, jid, 0, 2, 14, 2);

    val = 4 * gUdefCnt;
    jid_lut = gAutoUdefJids + 1;
    jid = jid_lut[val];
    AutoGenerateUnitdef(1, jid, 0, 3, 14, 3);

    val = 4 * gUdefCnt;
    jid_lut = gAutoUdefJids + 2;
    jid = jid_lut[val];
    AutoGenerateUnitdef(2, jid, 0, 4, 14, 4);

    val = 4 * gUdefCnt;
    jid_lut = gAutoUdefJids + 3;
    jid = jid_lut[val];
    AutoGenerateUnitdef(3, jid, 0, 5, 14, 5);
#endif

    /* Terminator */
    gUdefs[4].charIndex = 0;

    gUdefCnt++;
    if (gAutoUdefJids[4 * gUdefCnt] == 0)
        gUdefCnt = 0;
}
