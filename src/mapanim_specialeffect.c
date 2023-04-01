#include "global.h"
#include "functions.h"
#include "variables.h"
#include "proc.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "mu.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bmio.h"
#include "hardware.h"
#include "ap.h"
#include "bmmap.h"
#include "bmudisp.h"
#include "mapanim.h"

void MapAnim_BeginMISSAnim(struct Unit* unit)
{
    Decompress(
        Img_MapAnimMISS,
        OBJ_VRAM0 + 0x20 * BM_OBJCHR_BANIM_EFFECT);

    APProc_Create(
        Obj_MapAnimMISS,
        16 * (SCREEN_TILE_X(unit->xPos)) + 8,
        16 * (SCREEN_TILE_Y(unit->yPos)) + 16,
        TILEREF(BM_OBJCHR_BANIM_EFFECT, 0), 0, 2);
}

void MapAnim_BeginNODAMAGEAnim(struct Unit* unit)
{
    Decompress(
        Img_MapAnimNODAMAGE,
        OBJ_VRAM0 + 0x20 * BM_OBJCHR_BANIM_EFFECT);

    APProc_Create(
        obj_MapAnimNODAMAGE,
        16 * (SCREEN_TILE_X(unit->xPos)) + 8,
        16 * (SCREEN_TILE_Y(unit->yPos)) + 16,
        TILEREF(BM_OBJCHR_BANIM_EFFECT, 0), 0, 2);
}

void MapAnim_BeginWallBreakAnim(struct Unit* unit, int unk)
{
    struct MAEffectProc* proc = Proc_Start(ProcScr_MapAnimWallBreak, PROC_TREE_3);

    proc->unit = unit;

    proc->xDisplay = 16 * (SCREEN_TILE_X(unit->xPos)) + 8;
    proc->yDisplay = 16 * (SCREEN_TILE_Y(unit->yPos)) - 8;

    proc->unk48 = unk ^ 1;
}

void WallBreakAnim_Init(struct MAEffectProc* proc)
{
    Decompress(
        Img_WallBreakAnim,
        OBJ_VRAM0 + 0x20 * BM_OBJCHR_BANIM_EFFECT);

    ApplyPalette(
        Pal_WallBreakAnim,
        16 + BM_OBJPAL_BANIM_EFFECT1);

    APProc_Create(
        Obj_WallBreakAnim,
        proc->xDisplay, proc->yDisplay + 16,
        TILEREF(BM_OBJCHR_BANIM_EFFECT, BM_OBJPAL_BANIM_EFFECT1),
        proc->unk48, 2);
}

void NewMapPoisonEffect(struct Unit* unit)
{
    struct MAEffectProc* proc = Proc_Start(ProcScr_PoisonAnimHandler, PROC_TREE_3);

    proc->unit = unit;

    proc->xDisplay = 8 * (1 + 2 * (SCREEN_TILE_X(unit->xPos)));
    proc->yDisplay = 8 * (1 + 2 * (SCREEN_TILE_Y(unit->yPos)));
}

void MapAnim_BeginPoisonAnim(struct MAEffectProc* proc)
{
    PlaySpacialSoundMaybe(0xB7, proc->xDisplay); // TODO: song ids

    Decompress(
        Img_PoisonAnim,
        OBJ_VRAM0 + 0x20 * BM_OBJCHR_BANIM_EFFECT2);

    ApplyPalette(
        Pal_PoisonAnim,
        16 + BM_OBJPAL_BANIM_EFFECT2);

    APProc_Create(
        Obj_PoisonAnim,
        proc->xDisplay - 8, proc->yDisplay + 8,
        TILEREF(BM_OBJCHR_BANIM_EFFECT2, BM_OBJPAL_BANIM_EFFECT2),
        0, 2);
}

void sub_807CD18(struct Unit* unit)
{
    struct MAEffectProc* proc = Proc_Start(ProcScr_PoisonAnim2, PROC_TREE_3);

    proc->unit = unit;

    proc->xDisplay = 8 * (1 + 2 * SCREEN_TILE_X(unit->xPos));
    proc->yDisplay = 8 * (1 + 2 * SCREEN_TILE_Y(unit->yPos));
}

void MapAnim_BeginPoisonAnim2(struct MAEffectProc* proc)
{
    PlaySpacialSoundMaybe(0xB7, proc->xDisplay); // TODO: song ids

    Decompress(
        Img_PoisonAnim,
        OBJ_VRAM0 + 0x20 * BM_OBJCHR_BANIM_EFFECT2);

    ApplyPalette(
        Pal_PoisonAnim,
        16 + BM_OBJPAL_BANIM_EFFECT2);

    APProc_Create(
        Obj_PoisonAnim,
        proc->xDisplay - 8, proc->yDisplay + 8,
        TILEREF(BM_OBJCHR_BANIM_EFFECT2, BM_OBJPAL_BANIM_EFFECT2),
        0, 2);
}

void MapAnim_Poison2ResetMap(void)
{
    RefreshEntityBmMaps();
    RenderBmMap();
    RefreshUnitSprites();
    MU_EndAll();
}


/* section.data */
CONST_DATA struct ProcCmd ProcScr_MapAnimWallBreak[] = {
    PROC_SLEEP(0x1),
    PROC_CALL(WallBreakAnim_Init),
    PROC_WHILE(APProc_Exists),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_PoisonAnimHandler[] = {
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnim_BeginPoisonAnim),
    PROC_WHILE(APProc_Exists),
    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_PoisonAnim2[] = {
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnim_BeginPoisonAnim2),
    PROC_WHILE(APProc_Exists),
    PROC_CALL(MapAnim_Poison2ResetMap),
    PROC_END
};
