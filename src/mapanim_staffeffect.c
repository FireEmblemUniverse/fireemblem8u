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
    PROC_CALL(MapSpellAnim_CommonEnd),
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
    SetDefaultMapAnimScreenConf();
    BG_SetPosition(2, 0, 0);

    Decompress(
        gUnknown_089AF950,
        (void *)(VRAM) + GetBackgroundTileDataOffset(2) + BM_BGCHR_BANIM_UNK160 * 0x20);

    SetBlendConfig(1, 16, 16, 0);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendBackdropA(0);
    SetBlendTargetB(0, 0, 0, 1, 1);
    SetBlendBackdropB(1);

    proc->frame = 0;
    proc->timer = 0;

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

void MapLatonafx_InitGfx(struct MAEffectProc * proc)
{
    if (proc->timer > 2)
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
        int xOff = MapLatonafxLocation[proc->timer * 2 + 0];
        int yOff = MapLatonafxLocation[proc->timer * 2 + 1];

        NewMapLatonaShiningfx(
            proc->xDisplay/8 + xOff - 3,
            proc->yDisplay/8 + yOff - 3,
            6, 10, 8, proc);

        PlaySeSpacial(0x89, proc->xDisplay); // TODO: song ids

        proc->timer++;
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
    SetBlendConfig(2, 0, 0, (proc->unk64--) >> 2);

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
    SetBlendConfig(1, 0, 0x10, 0);
    proc->timer2 = 0;
}

void MapLatonaShiningfx_Loop1(struct MAAnotherProc * proc)
{
    proc->timer2 += 2;

    SetBlendConfig(1, proc->timer2, 0x10, 0);

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

    SetBlendConfig(1,
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
    PROC_REPEAT(NightMarefx_Loop),
    PROC_CALL(NightMarefx_End),
    PROC_SLEEP(0x01),
    PROC_CALL(MapSpellAnim_CommonEnd),
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
    SetDefaultMapAnimScreenConf();
    BG_SetPosition(2, 0, 0);

    Decompress(
        Img_NightMareMapAnimfx,
        (void*)(VRAM) + GetBackgroundTileDataOffset(2) + BM_BGCHR_BANIM_UNK160 * 0x20);

    ApplyPalette(
        Pal_NightMareMapAnimfx,
        BM_BGPAL_BANIM_UNK4);

    SetBlendConfig(1, 0x10, 0x10, 0);

    proc->frame = 0;
    proc->timer = 0;

    EnablePaletteSync();
}

const struct MapAnimSpellfxConf NigtMarefxConf[] = {
    {0,  4, 16},
    {1,  4, 16},
    {2,  4, 16},
    {3,  4, 16},
    {4,  4, 16},
    {5,  4, 16},
    {6,  4, 14},
    {7,  4, 10},
    {8,  4,  8},
    {9,  4,  4},
    {10, 4,  2},
    {-1, 30, 0},
    {14, 6, 16},
    {15, 6, 16},
    {16, 6, 16},
    {17, 6, 16},
    {18, 6, 16},
    {19, 6, 16},
    {20, 6, 16},
    {21, 6, 16},
    {22, 6, 16},
    {23, 6, 16},
    {24, 6, 16},
    {25, 6, 16},
    {26, 6, 16},
    {27, 6, 16},
    {32, 6, 16},
    {25, 6, 16},
    {26, 6, 16},
    {27, 6, 16},
    {28, 6, 16},
    {29, 6, 16},
    {30, 6, 16},
    {31, 6, 16},
};

CONST_DATA void * TsaSet_NightMareMapAnimfx[] = {
    Tsa_NightMareMapAnimfx1,
    Tsa_NightMareMapAnimfx2,
    Tsa_NightMareMapAnimfx3,
    Tsa_NightMareMapAnimfx4,
    Tsa_NightMareMapAnimfx5,
    Tsa_NightMareMapAnimfx6,
    Tsa_NightMareMapAnimfx7,
    Tsa_NightMareMapAnimfx8,
    Tsa_NightMareMapAnimfx9,
    Tsa_NightMareMapAnimfx10,
    Tsa_NightMareMapAnimfx11,
    Tsa_NightMareMapAnimfx12,
    Tsa_NightMareMapAnimfx13,
    Tsa_NightMareMapAnimfx14,
    Tsa_NightMareMapAnimfx15,
    Tsa_NightMareMapAnimfx16,
    Tsa_NightMareMapAnimfx17,
    Tsa_NightMareMapAnimfx18,
    Tsa_NightMareMapAnimfx19,
    Tsa_NightMareMapAnimfx20,
    Tsa_NightMareMapAnimfx21,
    Tsa_NightMareMapAnimfx22,
    Tsa_NightMareMapAnimfx23,
    Tsa_NightMareMapAnimfx24,
    Tsa_NightMareMapAnimfx25,
    Tsa_NightMareMapAnimfx26,
    Tsa_NightMareMapAnimfx27,
    Tsa_NightMareMapAnimfx28,
    Tsa_NightMareMapAnimfx29,
    Tsa_NightMareMapAnimfx30,
    Tsa_NightMareMapAnimfx31,
    Tsa_NightMareMapAnimfx32,
    Tsa_NightMareMapAnimfx33,
};

void NightMarefx_Loop(struct MAEffectProc * proc)
{
    if (proc->timer == 0)
    {
        if (proc->frame == 0)
            PlaySeSpacial(0x384, proc->xDisplay);
        else if (proc->frame > 0x21)
        {
            Proc_Break(proc);
            return;
        }

        if (NigtMarefxConf[proc->frame].tsa_idx < 0)
        {
            BG_Fill(gBG2TilemapBuffer, 0);
            BG_EnableSyncByMask(BG2_SYNC_BIT);
        }
        else
        {
            Decompress(TsaSet_NightMareMapAnimfx[NigtMarefxConf[proc->frame].tsa_idx], gGenericBuffer);

            sub_800159C(
                gBG2TilemapBuffer,
                (void *)gGenericBuffer,
                proc->xDisplay / 8 - 9,
                proc->yDisplay / 8 - 9,
                TILEREF(BM_BGCHR_BANIM_UNK160, BM_BGPAL_BANIM_UNK4));

            BG_EnableSyncByMask(BG2_SYNC_BIT);
        }
        SetBlendConfig(1, NigtMarefxConf[proc->frame].blend, 0x10, 0);

        proc->timer = NigtMarefxConf[proc->frame].duration;
        proc->frame++;
    }
    proc->timer--;
}

void NightMarefx_End(struct MAEffectProc * proc)
{
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
}

/*********************************************
 ********** Antitoxin & Pure water ***********
 *********************************************/

struct ProcCmd CONST_DATA ProcScr_MapAnimAntitoxinPureWaterfx[] = {
    PROC_SLEEP(1),
    PROC_CALL(AntitoxinPureWaterfx_Init),
    PROC_REPEAT(AntitoxinPureWaterfx_Loop),
    PROC_SLEEP(1),
    PROC_CALL(MapSpellAnim_CommonEnd),
    PROC_END,
};

void MapAnimCallSpellAssocAntitoxinPureWaterfx(struct Unit * unit, u8 * img, u16 * pal)
{
    struct MAEffectProc * proc = Proc_Start(ProcScr_MapAnimAntitoxinPureWaterfx, PROC_TREE_3);

    proc->unit = unit;

    proc->xDisplay = 8 * (1 + 2 * (unit->xPos - (gBmSt.camera.x >> 4)));
    proc->yDisplay = 8 * (1 + 2 * (unit->yPos - (gBmSt.camera.y >> 4)));

    proc->img = img;
    proc->pal = pal;
}

void AntitoxinPureWaterfx_Init(struct MAEffectProc * proc)
{
    PlaySeSpacial(0xB6, proc->xDisplay);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 2;

    BG_SetPosition(BG_2, 0, 0);

    Decompress(
        proc->img,
        (void*)(VRAM) + GetBackgroundTileDataOffset(2) + BM_BGCHR_BANIM_UNK160 * 0x20);

    ApplyPalette(
        proc->pal,
        BM_BGPAL_BANIM_UNK4);

    SetDefaultMapAnimScreenConf();
    SetBlendConfig(1, 0x10, 0x10, 0);

    proc->frame = 0;
}

CONST_DATA u8 gUnknown_089A3B6C[] = {
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
    0xFF
};
