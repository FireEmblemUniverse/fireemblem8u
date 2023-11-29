#include "global.h"
#include "proc.h"
#include "bmlib.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "mapanim.h"
#include "hardware.h"
#include "bmitem.h"
#include "constants/items.h"

/*********************************************
 ******************* Latona ******************
 *********************************************/
CONST_DATA struct ProcCmd ProcScr_MapLatonafx[] = {
    PROC_SLEEP(1),
    PROC_CALL(MapLatonafx_Init),
    PROC_REPEAT(MapLatonafx_InitGfx),
    PROC_START_CHILD_BLOCKING(ProcScr_MapLatonaBlinkingfx),
    PROC_SLEEP(0x3C),
    PROC_CALL(MapLatonafx_End),
    PROC_END
};

void MapAnimCallSpellAssocLatonafx(struct Unit * unit)
{
    struct MAEffectProc * proc = Proc_Start(ProcScr_MapLatonafx, PROC_TREE_3);

    proc->unit = unit;

    proc->xDisplay = 8 * (1 + 2 * (unit->xPos - (gBmSt.camera.x>>4)));
    proc->yDisplay = 8 * (1 + 2 * (unit->yPos - (gBmSt.camera.y>>4)));
}

void MapLatonafx_Init(struct MAEffectProc * proc)
{
    sub_807E978();
    BG_SetPosition(2, 0, 0);

    Decompress(
        gUnknown_089AF950,
        (void *)(VRAM) + GetBackgroundTileDataOffset(2) + BM_BGCHR_BANIM_UNK160 * 0x20);

    SetSpecialColorEffectsParameters(1, 16, 16, 0);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendBackdropA(0);
    SetBlendTargetB(0, 0, 0, 1, 1);
    SetBlendBackdropB(1);

    proc->unk40 = 0;
    proc->unk42 = 0;

    if (GetItemIndex(gManimSt.actor[0].bu->weaponBefore) == ITEM_STAFF_LATONA)
        sub_80144CC(Pal_089AFFB8, 0x80, 0x20, 2, (struct Proc*) proc);
    else
        sub_80144CC(Pal_089AFF78, 0x80, 0x20, 2, (struct Proc*) proc);
}

CONST_DATA s16 MapLatonafxLocation[0x8] = {
     1, -1,
    -2,  2,
     2,  1,
    -2, -2
};

void MapLatonafx_InitGfx(struct MAEffectProc* proc)
{
    if (proc->unk42 > 2)
    {
        DeleteAllPaletteAnimator();
        NewPaletteAnimator_(Pal_089AFF78, 0x80, 0x20, 4, proc);

        if (GetItemIndex(gManimSt.actor[0].bu->weaponBefore) == ITEM_STAFF_LATONA)
            NewPaletteAnimator_(Pal_089AFFB8, 0x80, 0x20, 4, (struct Proc*) proc);
        else
            NewPaletteAnimator_(Pal_089AFF78, 0x80, 0x20, 4, (struct Proc*) proc);

        Decompress(
            gUnknown_089AFFF8,
            (void*)(VRAM) + GetBackgroundTileDataOffset(2) + BM_BGCHR_BANIM_UNK160 * 0x20);

        NewMapLatonaShiningfx(
            proc->xDisplay/8 - 4,
            proc->yDisplay/8 - 4,
            8, 60, 0, proc);

        Proc_Break(proc);

        PlaySeSpacial(0x8C, proc->xDisplay); // TODO: song ids
    }
    else
    {
        int xOff = MapLatonafxLocation[proc->unk42 * 2 + 0];
        int yOff = MapLatonafxLocation[proc->unk42 * 2 + 1];

        NewMapLatonaShiningfx(
            proc->xDisplay/8 + xOff - 3,
            proc->yDisplay/8 + yOff - 3,
            6, 10, 8, proc);

        PlaySeSpacial(0x89, proc->xDisplay); // TODO: song ids

        proc->unk42++;
    }
}

void sub_807D2C8(void)
{
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
}

CONST_DATA struct ProcCmd ProcScr_MapLatonaBlinkingfx[] = {
    PROC_CALL(MapLatonaBlinkingfx_Init),
    PROC_REPEAT(MapLatonaBlinkingfx_Main),
    PROC_END
};

void MapLatonaBlinkingfx_Init(struct MAEffectProc * proc)
{
    DeleteAllPaletteAnimator();

    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    SetBlendTargetA(1, 1, 1, 1, 1);
    SetBlendBackdropA(1);

    proc->unk64 = 0x40;

    MapLatonaBlinkingfx_Main(proc);
}

void MapLatonaBlinkingfx_Main(struct MAEffectProc * proc)
{
    SetSpecialColorEffectsParameters(2, 0, 0, (proc->unk64--) >> 2);

    if (proc->unk64 == 0)
    {
        SetDefaultColorEffects();
        Proc_Break(proc);
    }
}

CONST_DATA struct ProcCmd ProcScr_MapLatonaShiningfx[] = {
    PROC_SET_END_CB(MapLatonaShiningfx_End),
    PROC_CALL(MapLatonaShiningfx_Init),
    PROC_YIELD,
    PROC_CALL(MapLatonaShiningfx_Start),
    PROC_REPEAT(MapLatonaShiningfx_Loop1),
    PROC_REPEAT(MapLatonaShiningfx_Loop2),
    PROC_REPEAT(MapLatonaShiningfx_Loop3),
    PROC_END
};

void NewMapLatonaShiningfx(int x, int y, int c, int duration, int e, ProcPtr parent)
{
    struct MAAnotherProc * proc =
        Proc_StartBlocking(ProcScr_MapLatonaShiningfx, parent);

    proc->x = x;
    proc->y = y;
    proc->unk54 = c;
    proc->terminator = e;
    proc->timer = duration;
}

void MapLatonaShiningfx_End(void)
{
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
}

void MapLatonaShiningfx_Init(void)
{
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
}

void MapLatonaShiningfx_Start(struct MAAnotherProc * proc)
{
    sub_8014560(
        gBG2TilemapBuffer,
        proc->x, proc->y,
        TILEREF(BM_BGCHR_BANIM_UNK160, BM_BGPAL_BANIM_UNK4),
        proc->unk54, proc->unk54);

    BG_EnableSyncByMask(BG2_SYNC_BIT);
    SetSpecialColorEffectsParameters(1, 0, 0x10, 0);
    proc->timer2 = 0;
}

void MapLatonaShiningfx_Loop1(struct MAAnotherProc * proc)
{
    proc->timer2 += 2;

    SetSpecialColorEffectsParameters(1, proc->timer2, 0x10, 0);

    if (proc->timer2 > 7)
    {
        proc->timer2 = 0;
        Proc_Break(proc);
    }
}

void MapLatonaShiningfx_Loop2(struct MAAnotherProc * proc)
{
    if (--proc->timer == -1)
        Proc_Break(proc);
}

void MapLatonaShiningfx_Loop3(struct MAAnotherProc * proc)
{
    if (proc->terminator == 0)
    {
        Proc_Break(proc);
        return;
    }

    SetSpecialColorEffectsParameters(1,
        Interpolate(0, 8, 0, proc->timer2++, proc->terminator), 0x10, 0);

    if (proc->timer2 >= proc->terminator)
    {
        proc->timer2 = 0;
        BG_Fill(gBG2TilemapBuffer, 0);
        BG_EnableSyncByMask(BG2_SYNC_BIT);
        Proc_Break(proc);
    }
}

/*********************************************
 ***************** Night mare ****************
 *********************************************/

CONST_DATA struct ProcCmd ProcScr_NightMarefx[] = {
    PROC_SLEEP(1),
    PROC_CALL(NightMarefx_Init),
    PROC_REPEAT(NightMarefx_InitGfx),
    PROC_CALL(NightMarefx_CallBlinking),
    PROC_SLEEP(0x01),
    PROC_CALL(MapLatonafx_End),
    PROC_END
};

void MapAnimCallSpellAssocNightMarefx(struct Unit * unit)
{
    struct MAEffectProc * proc = Proc_Start(ProcScr_NightMarefx, PROC_TREE_3);

    proc->unit = unit;

    proc->xDisplay = 8 * (1 + 2 * (unit->xPos - (gBmSt.camera.x>>4)));
    proc->yDisplay = 8 * (1 + 2 * (unit->yPos - (gBmSt.camera.y>>4)));
}

void NightMarefx_Init(struct MAEffectProc * proc)
{
    sub_807E978();
    BG_SetPosition(2, 0, 0);

    Decompress(
        Img_089B35D0,
        (void*)(VRAM) + GetBackgroundTileDataOffset(2) + BM_BGCHR_BANIM_UNK160 * 0x20);

    ApplyPalette(
        Pal_089B4BFC,
        BM_BGPAL_BANIM_UNK4);

    SetSpecialColorEffectsParameters(1, 0x10, 0x10, 0);

    proc->unk40 = 0;
    proc->unk42 = 0;

    EnablePaletteSync();
}
