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

CONST_DATA struct ProcCmd ProcScr_MapAnimGorgonHatch[] =
{
    PROC_SLEEP(1),

    PROC_CALL(MapAnim_GorgonHatch_Init),
    PROC_REPEAT(MapAnim_GorgonHatch_Loop),

    PROC_CALL(MapAnim_GorgonHatch_ClearBg2),
    PROC_SLEEP(20),

    PROC_CALL(MapSpellAnim_CommonEnd),

    PROC_END
};

//! FE8U = 0x0807CDD0
void MapAnim_StartGorgonHatchAnim(struct Unit * unit)
{
    struct MAEffectProc * proc = Proc_Start(ProcScr_MapAnimGorgonHatch, PROC_TREE_3);

    proc->unit = unit;

    proc->xDisplay = 8 * (1 + 2 * SCREEN_TILE_X(unit->xPos));
    proc->yDisplay = 8 * (1 + 2 * SCREEN_TILE_Y(unit->yPos));
}

//! FE8U = 0x0807CE18
void MapAnim_GorgonHatch_Init(struct MAEffectProc * proc)
{
    SetDefaultMapAnimScreenConf();
    BG_SetPosition(BG_2, 0, 0);

    // TODO: BM_BANIM_BGCHR_...
    Decompress(
        Img_GorgonHatchCloud,
        (void *)(VRAM) + GetBackgroundTileDataOffset(BG_2) + BM_BGCHR_BANIM_UNK160 * CHR_SIZE);

    ApplyPalette(
        Pal_GorgonHatchCloud,
        BM_BGPAL_BANIM_UNK4);

    SetBlendAlpha(16, 16);

    proc->frame = 0;
    proc->timer = 0;

    EnablePaletteSync();
}

CONST_DATA u16 * TsaLut_GorgonHatchCloud[] =
{
    Tsa_GorgonHatchCloud_A,
    Tsa_GorgonHatchCloud_B,
    Tsa_GorgonHatchCloud_C,
    Tsa_GorgonHatchCloud_D,
    Tsa_GorgonHatchCloud_E,
    Tsa_GorgonHatchCloud_F,
    Tsa_GorgonHatchCloud_G,
};

//! FE8U = 0x0807CE78
void MapAnim_GorgonHatch_Loop(struct MAEffectProc * proc)
{
    if (proc->timer == 0)
    {
        if (proc->frame == 0)
            PlaySeSpacial(0x3CA, proc->xDisplay); // TODO: song ids

        else if (proc->frame == 1)
            LoadGorgonFromEgg(proc);

        else if (proc->frame > 6)
        {
            Proc_Break(proc);
            return;
        }

        Decompress(
            TsaLut_GorgonHatchCloud[proc->frame],
            gGenericBuffer);

        AddAttr2dBitMap(
            gBG2TilemapBuffer,
            (void *)gGenericBuffer,
            proc->xDisplay / 8 - 8,
            proc->yDisplay / 8 - 7,
            TILEREF(BM_BGCHR_BANIM_UNK160, BM_BGPAL_BANIM_UNK4));

        BG_EnableSyncByMask(BG2_SYNC_BIT);

        proc->frame++;
        proc->timer = 5;
    }

    proc->timer--;
}

//! FE8U = 0x0807CF30
void LoadGorgonFromEgg(struct MAEffectProc * proc)
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
        gUnitDefEggHatching.allegiance = FACTION_ID_BLUE;

    else if (UNIT_FACTION(proc->unit) == FACTION_RED)
        gUnitDefEggHatching.allegiance = FACTION_ID_RED;

    else if (UNIT_FACTION(proc->unit) == FACTION_GREEN)
        gUnitDefEggHatching.allegiance = FACTION_ID_GREEN;

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
    gUnitDefEggHatching.ai[2] = proc->unit->ai_a_pc; // this looks incorrect
    gUnitDefEggHatching.ai[3] = proc->unit->ai_a_pc >> 8; // this is 0

    LoadUnits(&gUnitDefEggHatching);
    GetUnitFromCharId(CHARACTER_MONSTER_BA);

    ClearUnit(GetUnit(proc->unit->index));

    RefreshEntityBmMaps();
    RenderBmMap();
    RefreshUnitSprites();
    MU_EndAll();
}

//! FE8U = 0x0807D09C
void MapAnim_GorgonHatch_ClearBg2(void)
{
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
}
