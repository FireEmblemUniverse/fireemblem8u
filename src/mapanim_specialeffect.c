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
#include "bmlib.h"
#include "bmtrick.h"
#include "rng.h"
#include "constants/classes.h"
#include "constants/characters.h"

void MapAnim_BeginMISSAnim(struct Unit * unit)
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

void MapAnim_BeginNODAMAGEAnim(struct Unit * unit)
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

CONST_DATA struct ProcCmd ProcScr_MapAnimWallBreak[] = {
    PROC_SLEEP(0x1),
    PROC_CALL(WallBreakAnim_Init),
    PROC_WHILE(APProc_Exists),
    PROC_END
};

void MapAnim_BeginWallBreakAnim(struct Unit * unit, int unk)
{
    struct MAEffectProc* proc = Proc_Start(ProcScr_MapAnimWallBreak, PROC_TREE_3);

    proc->unit = unit;

    proc->xDisplay = 16 * (SCREEN_TILE_X(unit->xPos)) + 8;
    proc->yDisplay = 16 * (SCREEN_TILE_Y(unit->yPos)) - 8;

    proc->unk48 = unk ^ 1;
}

void WallBreakAnim_Init(struct MAEffectProc * proc)
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

CONST_DATA struct ProcCmd ProcScr_PoisonAnimHandler[] = {
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnim_BeginPoisonAnim),
    PROC_WHILE(APProc_Exists),
    PROC_END
};

void NewMapPoisonEffect(struct Unit * unit)
{
    struct MAEffectProc* proc = Proc_Start(ProcScr_PoisonAnimHandler, PROC_TREE_3);

    proc->unit = unit;

    proc->xDisplay = 8 * (1 + 2 * (SCREEN_TILE_X(unit->xPos)));
    proc->yDisplay = 8 * (1 + 2 * (SCREEN_TILE_Y(unit->yPos)));
}

void MapAnim_BeginPoisonAnim(struct MAEffectProc * proc)
{
    PlaySeSpacial(0xB7, proc->xDisplay); // TODO: song ids

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

CONST_DATA struct ProcCmd ProcScr_PoisonAnim2[] = {
    PROC_SLEEP(0x1),
    PROC_CALL(MapAnim_BeginPoisonAnim2),
    PROC_WHILE(APProc_Exists),
    PROC_CALL(MapAnim_Poison2ResetMap),
    PROC_END
};

void NewMapAnimPoisonAnim2(struct Unit * unit)
{
    struct MAEffectProc * proc = Proc_Start(ProcScr_PoisonAnim2, PROC_TREE_3);

    proc->unit = unit;

    proc->xDisplay = 8 * (1 + 2 * SCREEN_TILE_X(unit->xPos));
    proc->yDisplay = 8 * (1 + 2 * SCREEN_TILE_Y(unit->yPos));
}

void MapAnim_BeginPoisonAnim2(struct MAEffectProc * proc)
{
    PlaySeSpacial(0xB7, proc->xDisplay); // TODO: song ids

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

CONST_DATA struct ProcCmd ProcScr_089A398C[] = {
    PROC_SLEEP(0x1),
    PROC_CALL(sub_807CE18),
    PROC_REPEAT(sub_807CE78),
    PROC_CALL(sub_807D09C),
    PROC_SLEEP(0x14),
    PROC_CALL(sub_807DA2C),
    PROC_END
};

void sub_807CDD0(struct Unit * unit)
{
    struct MAEffectProc * proc = Proc_Start(ProcScr_089A398C, PROC_TREE_3);

    proc->unit = unit;

    proc->xDisplay = 8 * (1 + 2 * SCREEN_TILE_X(unit->xPos));
    proc->yDisplay = 8 * (1 + 2 * SCREEN_TILE_Y(unit->yPos));
}

void sub_807CE18(struct MAEffectProc * proc)
{
    sub_807E978();
    BG_SetPosition(BG_2, 0, 0);

    // TODO: BM_BANIM_BGCHR_...
    Decompress(
        Img_089B7610,
        (void*)(VRAM) + GetBackgroundTileDataOffset(BG_2) + BM_BGCHR_BANIM_UNK160 * 0x20);

    ApplyPalette(
        Pal_089B80C4,
        BM_BGPAL_BANIM_UNK4);

    SetSpecialColorEffectsParameters(1, 16, 16, 0);

    proc->unk40 = 0;
    proc->unk42 = 0;

    EnablePaletteSync();
}

CONST_DATA u16 * ImgLut_089A39C4[] = {
    Img_089B80E4,
    Img_089B8140,
    Img_089B81A4,
    Img_089B8214,
    Img_089B828C,
    Img_089B82F0,
    Img_089B835C,
};

void sub_807CE78(struct MAEffectProc * proc)
{
    if (proc->unk42 == 0)
    {
        if (proc->unk40 == 0)
            PlaySeSpacial(0x3CA, proc->xDisplay); // TODO: song ids

        else if (proc->unk40 == 1)
            sub_807CF30(proc);

        else if (proc->unk40 > 6)
        {
            Proc_Break((struct Proc*) proc);
            return;
        }

        Decompress(
            ImgLut_089A39C4[proc->unk40],
            gGenericBuffer);

        sub_800159C(
            gBG2TilemapBuffer,
            (void *)gGenericBuffer,
            proc->xDisplay / 8 - 8,
            proc->yDisplay / 8 - 7,
            TILEREF(BM_BGCHR_BANIM_UNK160, BM_BGPAL_BANIM_UNK4));

        BG_EnableSyncByMask(BG2_SYNC_BIT);

        proc->unk40++;
        proc->unk42 = 5;
    }

    proc->unk42--;
}

void sub_807CF30(struct MAEffectProc* proc)
{
    int unused = DivRem(AdvanceGetLCGRNValue(), 101);

    struct Trap * trap = GetTrapAt(proc->unit->xPos, proc->unit->yPos);

    int level = trap
        ? (u8) trap->data[TRAP_EXTDATA_TRAP_DAMAGE]
        : 1;

    u8 i;

    gUnitDefEggHatching.charIndex = CHARACTER_MONSTER_BA;
    gUnitDefEggHatching.classIndex = CLASS_GORGON;
    gUnitDefEggHatching.leaderCharIndex = 0;
    gUnitDefEggHatching.autolevel = TRUE;

    if (UNIT_FACTION(proc->unit) == FACTION_BLUE)
        gUnitDefEggHatching.allegiance = 0;

    else if (UNIT_FACTION(proc->unit) == FACTION_RED)
        gUnitDefEggHatching.allegiance = 2;

    else if (UNIT_FACTION(proc->unit) == FACTION_GREEN)
        gUnitDefEggHatching.allegiance = 1;

    gUnitDefEggHatching.level = level;

    gUnitDefEggHatching.xPosition = proc->unit->xPos;
    gUnitDefEggHatching.yPosition = proc->unit->yPos;

    gUnitDefEggHatching.redaCount = 0;
    gUnitDefEggHatching.redas = NULL;

    gUnitDefEggHatching.genMonster = FALSE;
    gUnitDefEggHatching.itemDrop = FALSE;

    for (i = 0; i < UNIT_DEFINITION_ITEM_COUNT; i++)
        gUnitDefEggHatching.items[i] = 0;

    for (i = 0; i < UNIT_DEFINITION_ITEM_COUNT; i++)
        if (proc->unit->items[i + 1])
            gUnitDefEggHatching.items[i] = proc->unit->items[i + 1];

    if (proc->unit->state & US_DROP_ITEM)
        gUnitDefEggHatching.itemDrop = TRUE;

    gUnitDefEggHatching.ai[0] = proc->unit->ai1;
    gUnitDefEggHatching.ai[1] = proc->unit->ai2;
    gUnitDefEggHatching.ai[2] = proc->unit->ai1data; // this looks incorrect
    gUnitDefEggHatching.ai[3] = proc->unit->ai1data >> 8; // this is 0

    LoadUnits(&gUnitDefEggHatching);
    GetUnitFromCharId(CHARACTER_MONSTER_BA);

    ClearUnit(GetUnit(proc->unit->index));

    RefreshEntityBmMaps();
    RenderBmMap();
    RefreshUnitSprites();
    MU_EndAll();
}

void sub_807D09C(void)
{
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
}
