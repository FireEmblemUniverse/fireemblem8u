#include "global.h"
#include "proc.h"
#include "bmlib.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "mapanim.h"
#include "hardware.h"
#include "bmlib.h"
#include "bmitem.h"
#include "bmmind.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "ap.h"
#include "eventinfo.h"
#include "efxbattle.h"
#include "constants/items.h"
#include "constants/video-global.h"

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
        StartPaletteAnimatorReverse(Pal_089AFFB8, 0x80, 0x20, 2, (struct Proc*) proc);
    else
        StartPaletteAnimatorReverse(Pal_089AFF78, 0x80, 0x20, 2, (struct Proc*) proc);
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
        StartPaletteAnimatorNormal(Pal_089AFF78, 0x80, 0x20, 4, proc);

        if (GetItemIndex(gManimSt.actor[0].bu->weaponBefore) == ITEM_STAFF_LATONA)
            StartPaletteAnimatorNormal(Pal_089AFFB8, 0x80, 0x20, 4, (struct Proc*) proc);
        else
            StartPaletteAnimatorNormal(Pal_089AFF78, 0x80, 0x20, 4, (struct Proc*) proc);

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

            AddAttr2dBitMap(
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

void AntitoxinPureWaterfx_Loop(struct MAEffectProc * proc)
{
    static u8 CONST_DATA lut[] =
    {
         0,  1,  2,  3,
         4,  5,  6,  7,
         8,  9, 10, 11,
        12, 13, 14, 15,
        16, 17, 18, 19,

        UINT8_MAX, // end
    };

    sub_80146A0(
        gBG2TilemapBuffer,
        proc->xDisplay / 8 - 3,
        proc->yDisplay / 8 - 3,
        TILEREF(BGCHR_MANIM_160, BGPAL_MANIM_4),
        6, 6,
        gUnknown_089AF310,
        lut[proc->frame / 2]);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    proc->frame++;

    if (lut[proc->frame / 2] == UINT8_MAX)
    {
        Proc_Break(proc);
    }
}

struct ProcCmd CONST_DATA ProcScr_089A3B84[] = {
    PROC_SLEEP(1),
    PROC_CALL(sub_807D818),
    PROC_SLEEP(100),
    PROC_END,
};

void sub_807D7D8(struct Unit * unit)
{
    struct MAEffectProc * proc;

    proc = Proc_Start(ProcScr_089A3B84, PROC_TREE_3);

    proc->xDisplay = SCREEN_TILE_X(unit->xPos) * 16 + 8;
    proc->yDisplay = SCREEN_TILE_Y(unit->yPos) * 16 + 8;
}

void sub_807D818(struct MAEffectProc * proc)
{
    PlaySeSpacial(0x10F, proc->xDisplay);
}

struct ProcCmd CONST_DATA ProcScr_MapAnimEffectAnimator[] = {
    PROC_SLEEP(1),
    PROC_CALL(MapAnimEffectAnimator_Init),
    PROC_REPEAT(MapAnimEffectAnimator_Loop1),
    PROC_SLEEP(30),
    PROC_REPEAT(MapAnimEffectAnimator_Loop2),
    PROC_CALL(MapSpellAnim_CommonEnd),
    PROC_END,
};

void NewMapAnimEffectAnimator(struct Unit * unit, void const * img, void const * pal, u16 song)
{
    struct ProcMapAnimator * proc;

    proc = Proc_Start(ProcScr_MapAnimEffectAnimator, PROC_TREE_3);

    proc->unit = unit;
    proc->img = img;
    proc->pal = pal;
    proc->song = song;
}

void MapAnimEffectAnimator_Init(struct ProcMapAnimator * proc)
{
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 2;

    BG_SetPosition(BG_2, 0, 0);

    Decompress(proc->img, ((void *) VRAM) + GetBackgroundTileDataOffset(BG_2) + CHR_SIZE * BGCHR_MANIM_160);

    sub_8014560(
        gBG2TilemapBuffer,
        SCREEN_TILE_X(proc->unit->xPos) * 2 - 2,
        SCREEN_TILE_Y(proc->unit->yPos) * 2 - 2,
        TILEREF(BGCHR_MANIM_160, BGPAL_MANIM_4), 6, 6);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    StartPaletteAnimatorNormal(proc->pal, BGPAL_MANIM_4 * 0x20, 0x20, 4, proc);

    proc->ca = 0;
    proc->cb = 0x10;

    PlaySeSpacial(proc->song, (SCREEN_TILE_X(proc->unit->xPos) * 2 + 1) * 8);
}

void MapAnimEffectAnimator_Loop1(struct ProcMapAnimator * proc)
{
    proc->ca++;

    if (proc->ca == 0x10)
    {
        Proc_Break(proc);
    }

    proc->cb = 0x16 - proc->ca;

    if (proc->cb > 0x10)
        proc->cb = 0x10;

    SetBlendAlpha(proc->ca, proc->cb);

    SetBlendTargetA(0, 0, 1, 0, 0); SetBlendBackdropA(0);
    SetBlendTargetB(0, 0, 0, 1, 1); SetBlendBackdropB(1);
}

void MapAnimEffectAnimator_Loop2(struct ProcMapAnimator * proc)
{
    proc->ca--;

    if (proc->ca == 0)
    {
        Proc_Break(proc);
    }

    proc->cb = 0x16 - proc->ca;

    if (proc->cb > 0x10)
        proc->cb = 0x10;

    SetBlendAlpha(proc->ca, proc->cb);

    SetBlendTargetA(0, 0, 1, 0, 0); SetBlendBackdropA(0);
    SetBlendTargetB(0, 0, 0, 1, 1); SetBlendBackdropB(1);
}

void MapSpellAnim_CommonEnd(ProcPtr proc)
{
    DeleteAllPaletteAnimator();

    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    SetDefaultColorEffects();
    SetWinEnable(0, 0, 0);
}

void MapSpellAnim_EndWithHBlank(ProcPtr proc)
{
    SetPrimaryHBlankHandler(NULL);

    DeleteAllPaletteAnimator();

    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    SetDefaultColorEffects();
    SetWinEnable(0, 0, 0);
}

struct ProcCmd CONST_DATA ProcScr_MapAnimWarpFlashy[] = {
    PROC_SLEEP(1),
    PROC_CALL(WarpFlashy_Init),
    PROC_REPEAT(WarpFlashy_Loop),
    PROC_SLEEP(1),
    PROC_CALL(MapSpellAnim_CommonEnd),
    PROC_END,
};

void StartWarpFlashy(struct Unit * unit, int arg_04, int arg_08)
{
    struct MAEffectProc * proc;

    proc = Proc_Start(ProcScr_MapAnimWarpFlashy, PROC_TREE_3);

    proc->unit = unit;
    proc->xDisplay = SCREEN_TILE_X(unit->xPos) * 2;
    proc->yDisplay = SCREEN_TILE_Y(unit->yPos) * 2;
}

void WarpFlashy_Init(struct MAEffectProc * proc)
{
    BG_SetPosition(BG_2, 0, 0);

    Decompress(Img_LinkArenaWarpFx, ((void *) VRAM) + GetBackgroundTileDataOffset(2) + CHR_SIZE * BGCHR_MANIM_160);
    ApplyPalette(Pal_LinkArenaWarpFx, BGPAL_MANIM_4);

    LoadSparkGfx();

    proc->frame = 0;
}

void WarpFlashy_Loop(struct MAEffectProc * proc)
{
    static CONST_DATA u8 lut[] =
    {
        0, 1, 2, 3,
        3, 3, 3, 3,
        3, 3, 3, 3,
        3, 3, 3, 4,
        5, 6, 7, 8,
        9,
        UINT8_MAX, // end
    };

    sub_80146A0(
        gBG2TilemapBuffer,
        proc->xDisplay - 1,
        proc->yDisplay - 3,
        TILEREF(BGCHR_MANIM_160, BGPAL_MANIM_4),
        4, 6,
        gUnknown_089AE4A4, lut[proc->frame / 2]);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    proc->frame++;

    if (lut[proc->frame / 2] == UINT8_MAX)
    {
        Proc_Break(proc);
    }

    SetDefaultMapAnimScreenConf();
    SetBlendAlpha(12, 12);
}

struct ProcCmd CONST_DATA ProcScr_MapAnimTorch[] = {
    PROC_SLEEP(1),
    PROC_CALL(MapAnimTorch_Init),
    PROC_SLEEP(30),
    PROC_REPEAT(MapAnimTorch_Loop1),
    PROC_REPEAT(MapAnimTorch_Loop2),
    PROC_SLEEP(1),
    PROC_CALL(MapAnimTorch_ResetHBlank),
    PROC_CALL(MapSpellAnim_EndWithHBlank),
    PROC_END,
};

void MapAnimTorchEffect(struct Unit * unit)
{
    struct MAEffectProc * proc;

    proc = Proc_Start(ProcScr_MapAnimTorch, PROC_TREE_3);

    proc->unit = unit;
    proc->xDisplay = SCREEN_TILE_IX(gActionData.xOther);
    proc->yDisplay = SCREEN_TILE_IY(gActionData.yOther);
}

void MapAnimTorch_Init(struct MAEffectProc * proc)
{
    PlaySoundEffect(0xB3);

    Decompress(Img_MapAnimTorchfx, ((void *) VRAM) + 0x10000 + OBCHR_MANIM_1C0 * CHR_SIZE);
    ApplyPalette(Pal_MapAnimTorchfx, 0x10 + OBJPAL_MANIM_4);

    SetWhitePal(BGPAL_MANIM_4);
    sub_8014930(
        ((void *) VRAM) + GetBackgroundTileDataOffset(BG_2) + BGCHR_MANIM_160 * CHR_SIZE,
        CHR_SIZE / sizeof(u16),
        0xFFFF);

    sub_8014930(
        gBG2TilemapBuffer,
        ARRAY_COUNT(gBG2TilemapBuffer),
        TILEREF(BGCHR_MANIM_160, BGPAL_MANIM_4));

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    proc->frame = 0;
    proc->timer = 0;

    if ((proc->xDisplay + 4) >= 0)
    {
        APProc_Create(
            ApConf_MapAnimTorchfx,
            proc->xDisplay + 4,
            proc->yDisplay,
            OAM2_CHR(OBCHR_MANIM_1C0) + OAM2_PAL(OBJPAL_MANIM_4), 0, 2);
    }
    InitScanline();
    sub_8081EAC();
    SetDefaultMapAnimScreenConf();

    SetBlendAlpha(0, 0x10);
}

void MapAnimTorch_Loop1(struct MAEffectProc * proc)
{
    int ret, ca;

    ret = Interpolate(INTERPOLATE_RCUBIC, 1, 160, proc->frame, 80);
    UpdateMapAnimScanline(proc->xDisplay + 8, proc->yDisplay + 8, ret);

    proc->frame++;

    ca = (proc->frame * 0x10) / 40;

    if (ca >= 0x10)
        ca = 0x10;

    SetBlendAlpha(ca, 0x10);

    if (proc->frame >= 40)
    {
        Proc_Break(proc);
        APProc_DeleteAll();
    }
}

void MapAnimTorch_Loop2(struct MAEffectProc * proc)
{
    int ret, ca;

    ret = Interpolate(INTERPOLATE_RCUBIC, 1, 160, proc->frame, 80);
    UpdateMapAnimScanline(proc->xDisplay + 8, proc->yDisplay + 8, ret);

    proc->frame++;

    ca = 0x10 - ((proc->frame - 40) * 0x10) / 30;

    if (ca <= 0)
        ca = 0;

    SetBlendAlpha(ca, 0x10);

    if (proc->frame >= 70)
    {
        Proc_Break(proc);
    }
}

void MapAnimTorch_ResetHBlank(struct MAEffectProc * proc)
{
    MapAnimResetHBlank();
}

struct ProcCmd CONST_DATA ProcScr_MapAnimBerserk[] = {
    PROC_SLEEP(1),
    PROC_CALL(MapAnimBerserk_Loop),
    PROC_SLEEP(120),
    PROC_CALL(MapSpellAnim_CommonEnd),
    PROC_END,
};

void MapAnimBerserkEffect(struct Unit * unit)
{
    struct MAEffectProc * proc;

    proc = Proc_Start(ProcScr_MapAnimBerserk, PROC_TREE_3);

    proc->unit = unit;
    proc->xDisplay = (SCREEN_TILE_X(unit->xPos) * 2 + 1) * 8;
    proc->yDisplay = (SCREEN_TILE_Y(unit->yPos) * 2 + 1) * 8;
}

void MapAnimBerserk_Loop(struct MAEffectProc * proc)
{
    PlaySeSpacial(0x87, proc->xDisplay);
    BG_SetPosition(BG_2, 0, 0);
    SetDefaultMapAnimScreenConf();
    Decompress(Img_MapAnimBerserkfx, ((void *) VRAM) + 0x10000 + CHR_SIZE * OBCHR_MANIM_1C0);
    ApplyPalette(Pal_MapAnimBerserkfx, 0x10 + OBJPAL_MANIM_4);
    APProc_Create(
        ApConf_MapAnimBerserkfx,
        proc->xDisplay,
        proc->yDisplay,
        OAM2_CHR(OBCHR_MANIM_1C0) + OAM2_PAL(OBJPAL_MANIM_4),
        0, 2);

    proc->unk48 = 1;
}

struct ProcCmd CONST_DATA ProcScr_MapAnimRepair[] = {
    PROC_SLEEP(1),
    PROC_CALL(MapAnimRepair_Init0),
    PROC_CALL(MapAnimRepair_Init),
    PROC_REPEAT(MapAnimRepair_Loop1),
    PROC_REPEAT(MapAnimRepair_Loop2),
    PROC_REPEAT(MapAnimRepair_Loop3),
    PROC_CALL(MapSpellAnim_CommonEnd),
    PROC_END,
};

void MapAnimRepairEffect(struct Unit * unit)
{
    struct MAEffectProc * proc;

    proc = Proc_Start(ProcScr_MapAnimRepair, PROC_TREE_3);

    proc->xDisplay = SCREEN_TILE_X(unit->xPos) * 0x10 + 8;
    proc->yDisplay = SCREEN_TILE_Y(unit->yPos) * 0x10 + 8;
}

void MapAnimRepair_Init(struct MAEffectProc * proc)
{
    PlaySeSpacial(0x86, proc->xDisplay);
}

void MapAnimRepair_Init0(struct MAEffectProc * proc)
{
    BG_SetPosition(BG_2, 0, 0);
    SetDefaultMapAnimScreenConf();
    SetBlendAlpha(0x10, 0x10);
    Decompress(Img_MapAnimRepairfx, ((void *) VRAM) + GetBackgroundTileDataOffset(BG_2) + CHR_SIZE * BGCHR_MANIM_160);
    ApplyPalette(Pal_HammerneBg, BGPAL_MANIM_4);
    proc->unk48 = 0;
    proc->frame_idx = 0;
}

void MapAnimRepair_Loop1(struct MAEffectProc * proc)
{
    static u8 const unk_param_list[] =
    {
        0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6,
        UINT8_MAX, // end
    };

    sub_801474C(
        gBG2TilemapBuffer,
        proc->xDisplay / 8 - 2, proc->yDisplay / 8 - 9,
        TILEREF(BGCHR_MANIM_160, BGPAL_MANIM_4),
        4, 11, Tsa_089B17A4,
        unk_param_list[proc->unk48++]);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    if (unk_param_list[proc->unk48] == UINT8_MAX)
        Proc_Break(proc);
}

void MapAnimRepair_Loop2(struct MAEffectProc * proc)
{
    u8 blend_coef_list[] =
    {
        16, 14, 12, 10, 8, 10, 12, 14, 16,
        16, 14, 12, 10, 8, 10, 12, 14, 16,
        UINT8_MAX, // end
    };

    SetBlendAlpha(blend_coef_list[proc->frame_idx++], 0x10);

    if (blend_coef_list[proc->frame_idx] == UINT8_MAX)
    {
        proc->frame_idx = 0;
        Proc_Break(proc);
    }
}

void MapAnimRepair_Loop3(struct MAEffectProc * proc)
{
    enum { DURATION = 30 };

    SetBlendAlpha(
        Interpolate(INTERPOLATE_LINEAR, 0x10, 0, proc->frame_idx++, DURATION), 0x10);

    if (proc->frame_idx > DURATION)
    {
        Proc_Break(proc);
    }
}

struct ProcCmd CONST_DATA ProcScr_MapAnimRestore[] = {
    PROC_SLEEP(1),
    PROC_CALL(MapAnimRepair_Init0),
    PROC_CALL(MapAnimRestore_Init),
    PROC_REPEAT(MapAnimRestore_Loop),
    PROC_REPEAT(MapAnimRepair_Loop2),
    PROC_REPEAT(MapAnimRepair_Loop3),
    PROC_CALL(MapSpellAnim_CommonEnd),
    PROC_END,
};

void MapAnimRestoreEffect(struct Unit * unit)
{
    struct MAEffectProc * proc;

    proc = Proc_Start(ProcScr_MapAnimRestore, PROC_TREE_3);

    proc->xDisplay = (SCREEN_TILE_X(unit->xPos) * 2 + 1) * 8;
    proc->yDisplay = (SCREEN_TILE_Y(unit->yPos) * 2 + 1) * 8;
}

void MapAnimRestore_Init(struct MAEffectProc * proc)
{
    PlaySeSpacial(0x82, proc->xDisplay);
    ApplyPalette(Pal_MapAnimRestore, BGPAL_MANIM_4);
}

void MapAnimRestore_Loop(struct MAEffectProc * proc)
{
    // same as func_fe6_080663E0 except gUnk_082E07A8 -> gUnk_082DF868

    static u8 const unk_param_list[] =
    {
        0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6,
        UINT8_MAX, // end
    };

    sub_801474C(
        gBG2TilemapBuffer,
        proc->xDisplay / 8 - 2, proc->yDisplay / 8 - 9,
        TILEREF(BGCHR_MANIM_160, BGPAL_MANIM_4),
        4, 11, Tsa_089B0864,
        unk_param_list[proc->unk48++]);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    if (unk_param_list[proc->unk48] == UINT8_MAX)
        Proc_Break(proc);
}

struct ProcCmd CONST_DATA ProcScr_MapAnimSleep[] = {
    PROC_SLEEP(1),
    PROC_CALL(MapAnimSleep_Init),
    PROC_SLEEP(50),
    PROC_CALL(MapAnimSleep_Anim1),
    PROC_SLEEP(50),
    PROC_CALL(MapAnimSleep_Anim2),
    PROC_CALL(MapSpellAnim_CommonEnd),
    PROC_END,
};

void MapAnimSleepEffect(struct Unit * unit)
{
    struct MAEffectProc * proc;

    proc = Proc_Start(ProcScr_MapAnimSleep, PROC_TREE_3);

    proc->xDisplay = (SCREEN_TILE_X(unit->xPos) * 2 + 1) * 8;
    proc->yDisplay = (SCREEN_TILE_Y(unit->yPos) * 2 + 1) * 8;
}

void MapAnimSleep_Init(struct MAEffectProc * proc)
{
    PlaySeSpacial(0x85, proc->xDisplay);

    BG_SetPosition(BG_2, 0, 0);
    SetDefaultMapAnimScreenConf();

    Decompress(Img_SleepSprites, OBJ_VRAM0 + OBCHR_MANIM_1C0 * CHR_SIZE);
    ApplyPalette(Pal_SleepSprites, 0x10 + OBJPAL_MANIM_4);

    APProc_Create(
        ApConf_MapAnimSleep,
        proc->xDisplay,
        proc->yDisplay - 16,
        OAM2_CHR(OBCHR_MANIM_1C0) + OAM2_PAL(OBJPAL_MANIM_4), 0, 2);
}

void MapAnimSleep_Anim1(struct MAEffectProc * proc)
{
    PlaySeSpacial(0x85, proc->xDisplay);
    APProc_Create(
        ApConf_MapAnimSleep,
        proc->xDisplay,
        proc->yDisplay - 8,
        OAM2_CHR(OBCHR_MANIM_1C0) + OAM2_PAL(OBJPAL_MANIM_4), 0, 2);
}

void MapAnimSleep_Anim2(struct MAEffectProc * proc)
{
    PlaySeSpacial(0x85, proc->xDisplay);
    APProc_Create(
        ApConf_MapAnimSleep,
        proc->xDisplay,
        proc->yDisplay,
        OAM2_CHR(OBCHR_MANIM_1C0) + OAM2_PAL(OBJPAL_MANIM_4), 0, 2);
}

struct ProcCmd CONST_DATA ProcScr_MapAnimMonsterStone[] = {
    PROC_SLEEP(1),
    PROC_CALL(MapAnimMonsterStone_Init),
    PROC_REPEAT(MapAnimMonsterStone_Loop1),
    PROC_CALL(MapAnimMonsterStone_Resetfx),
    PROC_SLEEP(60),
    PROC_CALL(MapSpellAnim_CommonEnd),
    PROC_END,
};

void MapAnimMonsterStoneEffect(struct Unit * unit)
{
    struct MAEffectProc * proc;

    proc = Proc_Start(ProcScr_MapAnimMonsterStone, PROC_TREE_3);

    proc->unit = unit;
    proc->xDisplay = (SCREEN_TILE_X(unit->xPos) * 2 + 1) * 8;
    proc->yDisplay = (SCREEN_TILE_Y(unit->yPos) * 2 + 1) * 8;
}

void MapAnimMonsterStone_Init(struct MAEffectProc * proc)
{
    SetDefaultMapAnimScreenConf();
    BG_SetPosition(2, 0, 0);

    Decompress(
        Img_MonsterStoneMapAnimfx,
        (void*)(VRAM) + GetBackgroundTileDataOffset(BG_2) + BGCHR_MANIM_160 * CHR_SIZE);

    ApplyPalette(
        Pal_MonsterStoneMapAnimfx,
        BGPAL_MANIM_4);

    SetBlendAlpha(0x10, 0x10);

    proc->frame = 0;
    proc->timer = 0;

    EnablePaletteSync();
}

CONST_DATA void * TsaSet_MonsterStoneMapAnimfx[] = {
    Tsa1_MonsterStoneMapAnimfx,
    Tsa2_MonsterStoneMapAnimfx,
    Tsa3_MonsterStoneMapAnimfx,
    Tsa4_MonsterStoneMapAnimfx,
    Tsa5_MonsterStoneMapAnimfx,
    Tsa6_MonsterStoneMapAnimfx,
    Tsa7_MonsterStoneMapAnimfx,
    Tsa8_MonsterStoneMapAnimfx,
    Tsa9_MonsterStoneMapAnimfx,
    Tsa10_MonsterStoneMapAnimfx
};

void MapAnimMonsterStone_Loop1(struct MAEffectProc * proc)
{
    if (proc->timer == 0)
    {
        if (proc->frame == 0)
            PlaySeSpacial(0x3BA, proc->xDisplay);
        else if (proc->frame > 9)
        {
            Proc_Break(proc);
        }

        Decompress(TsaSet_MonsterStoneMapAnimfx[proc->frame], gGenericBuffer);

        AddAttr2dBitMap(
            gBG2TilemapBuffer,
            (void *)gGenericBuffer,
            proc->xDisplay / 8 - 4,
            proc->yDisplay / 8 - 4,
            TILEREF(BM_BGCHR_BANIM_UNK160, BM_BGPAL_BANIM_UNK4));

        BG_EnableSyncByMask(BG2_SYNC_BIT);

        proc->frame++;
        proc->timer = 4;
    }
    proc->timer--;
}

void MapAnimMonsterStone_Resetfx(struct MAEffectProc * proc)
{
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
}

struct ProcCmd CONST_DATA ProcScr_MapAnimEffect_Unk_089A3DB4[] = {
    PROC_SLEEP(1),
    PROC_CALL(MapAnim_Init_807E390),
    PROC_SLEEP(10),
    PROC_REPEAT(MapAnim_Loop1_807E404),
    PROC_SLEEP(60),
    PROC_REPEAT(MapAnim_Loop2_807E448),
    PROC_SLEEP(1),
    PROC_CALL(MapSpellAnim_EndWithHBlank),
    PROC_END,
};

void StartMapAnimEffect_Unk_089A3DB4(struct Unit * unit)
{
    struct MAEffectProc * proc;

    proc = Proc_Start(ProcScr_MapAnimEffect_Unk_089A3DB4, PROC_TREE_3);

    proc->xDisplay = (SCREEN_TILE_X(unit->xPos) * 2 + 1) * 8;
    proc->yDisplay = (SCREEN_TILE_Y(unit->yPos)) * 16 + 18;
}

void MapAnim_Init_807E390(struct MAEffectProc * proc)
{
    PlaySeSpacial(0xFD, proc->xDisplay);

    InitScanline();
    sub_8081EAC();
    SetPrimaryHBlankHandler(HBlank_MapAnimEffect_Unk_8081FA8);
    SetDefaultMapAnimScreenConf();
    SetBlendAlpha(0x10, 0x10);

    CallARM_FillTileRect(gBG2TilemapBuffer, gGenericBuffer, TILEREF(BGCHR_MANIM_160, BGPAL_MANIM_4));
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    StartMapAnimEffect_Unk_089A3EC4(2, 0, 1, proc);
    Proc_Start(ProcScr_ManimShiftingSineWaveScanlineBuf, proc);

    proc->unk48 = 0;
    proc->frame_idx = 0;
}

u8 CONST_DATA gUnknown_089A3DFC[] =
{
    4, 6, 7, 8, 8, 9,
    UINT8_MAX, // end
};

void MapAnim_Loop1_807E404(struct MAEffectProc * proc)
{
    if (proc->unk48 >= 12)
    {
        proc->unk48--;
        Proc_Break(proc);
    }

    sub_808218C(proc->xDisplay, proc->yDisplay, ++proc->unk48, 12, gUnknown_089A3DFC);
}

void MapAnim_Loop2_807E448(struct MAEffectProc * proc)
{
    if (proc->unk48 <= 0)
    {
        proc->unk48++;
        Proc_Break(proc);
    }

    sub_808218C(proc->xDisplay, proc->yDisplay, --proc->unk48, 12, gUnknown_089A3DFC);
}

struct ProcCmd CONST_DATA ProcScr_MapAnimSilencefx[] = {
    PROC_SLEEP(1),
    PROC_CALL(MapAnimSilence_InitGfx),
    PROC_SLEEP(50),
    PROC_CALL(MapAnimSilence_InitScreenConf),
    PROC_SLEEP(40),
    PROC_REPEAT(MapAnimSilence_Loop),
    PROC_CALL(MapSpellAnim_CommonEnd),
    PROC_END,
};

void MapAnimCallSpellAssocSilencefx(struct Unit * unit)
{
    struct MAEffectProc * proc;

    proc = Proc_Start(ProcScr_MapAnimSilencefx, PROC_TREE_3);

    proc->xDisplay = (SCREEN_TILE_X(unit->xPos) * 2 + 1) * 8;
    proc->yDisplay = (SCREEN_TILE_Y(unit->yPos) * 2 + 1) * 8;
}

void MapAnimSilence_InitGfx(struct MAEffectProc * proc)
{
    PlaySeSpacial(0x83, proc->xDisplay);

    BG_SetPosition(BG_2, 0, 0);
    SetDefaultMapAnimScreenConf();

    Decompress(Img_ManimSilenceBgfx, ((void *) VRAM) + GetBackgroundTileDataOffset(BG_2) + CHR_SIZE * BGCHR_MANIM_160);
    Decompress(Img_ManimSilenceObjfx, OBJ_VRAM0 + CHR_SIZE * OBCHR_MANIM_1C0);
    ApplyPalette(Pal_ManimSilencefx, BGPAL_MANIM_4);
    ApplyPalette(Pal_ManimSilencefx, 0x10 + OBJPAL_MANIM_4);

    APProc_Create(
        ApConf_ManimSilencefx,
        proc->xDisplay, proc->yDisplay | OAM0_BLEND,
        OAM2_CHR(OBCHR_MANIM_1C0) + OAM2_PAL(OBJPAL_MANIM_4), 0, 2);

    proc->unk48 = 0;

    SetBlendTargetA(0, 0, 0, 0, 1);
    SetBlendBackdropA(0);
    SetBlendConfig(BLEND_EFFECT_NONE, 0x10, 0x10, 0);
}

void MapAnimSilence_InitScreenConf(struct MAEffectProc * proc)
{
    PlaySeSpacial(0x84, proc->xDisplay);

    sub_8014560(
        gBG2TilemapBuffer,
        proc->xDisplay / 8 - 2,
        proc->yDisplay / 8 - 2,
        TILEREF(BGCHR_MANIM_160, BGPAL_MANIM_4), 4, 4);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendBackdropA(0);
    SetBlendAlpha(0x10, 0x10);
}

void MapAnimSilence_Loop(struct MAEffectProc * proc)
{
    SetBlendAlpha(Interpolate(INTERPOLATE_LINEAR, 0x10, 0, proc->unk48++, 30), 0x10);

    if (proc->unk48 >= 30)
        Proc_Break(proc);
}

struct ProcCmd CONST_DATA ProcScr_MapAnimBarrierfx[] = {
    PROC_SLEEP(1),
    PROC_CALL(MapAnimBarrierfx_Init),
    PROC_REPEAT(MapAnimBarrierfx_Loop),
    PROC_CALL(MapSpellAnim_CommonEnd),
    PROC_END,
};

void MapAnimCallSpellAssocBarrierfx(struct Unit * unit)
{
    struct MAEffectProc * proc;

    proc = Proc_Start(ProcScr_MapAnimBarrierfx, PROC_TREE_3);

    proc->xDisplay = (SCREEN_TILE_X(unit->xPos) * 2 + 1) * 8;
    proc->yDisplay = (SCREEN_TILE_Y(unit->yPos) * 2 + 1) * 8;
}

void MapAnimBarrierfx_Init(struct MAEffectProc * proc)
{
    PlaySeSpacial(0x88, proc->xDisplay);

    BG_SetPosition(BG_2, 0, 0);
    SetDefaultMapAnimScreenConf();

    SetBlendAlpha(0x10, 0x10);

    Decompress(Img_ManimBarrierBgfx, ((void *) VRAM) + GetBackgroundTileDataOffset(BG_2) + CHR_SIZE * BGCHR_MANIM_160);
    ApplyPalette(Pal_BarrierBg, BGPAL_MANIM_4);

    proc->unk48 = 0;
    proc->frame_idx = 0;
}

void MapAnimBarrierfx_Loop(struct MAEffectProc * proc)
{
    static u8 const unk_param_list[] =
    {
        0, 0, 1, 1, 2, 2, 3, 3,
        4, 4, 3, 3, 4, 4, 3, 3,
        4, 4, 3, 3, 4, 4, 3, 3,
        4, 4, 3, 3, 4, 4, 3, 3,
        4, 4, 3, 3, 4, 4, 3, 3,
        2, 2, 1, 1, 0, 0,
        UINT8_MAX, // end
    };

    sub_801474C(
        gBG2TilemapBuffer,
        proc->xDisplay / 8 - 2, proc->yDisplay / 8 - 8,
        TILEREF(BGCHR_MANIM_160, BGPAL_MANIM_4),
        4, 10, Tsa_089B343C,
        unk_param_list[proc->unk48++]);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    if (unk_param_list[proc->unk48] == UINT8_MAX)
        Proc_Break(proc);
}

struct ProcCmd CONST_DATA ProcScr_MapAnimUnlock[] = {
    PROC_SLEEP(1),
    PROC_CALL(MapAnimUnlock_Init),
    PROC_REPEAT(MapAnimUnlock_Loop1),
    PROC_SLEEP(80),
    PROC_REPEAT(MapAnimUnlock_Loop2),
    PROC_SLEEP(1),
    PROC_CALL(MapSpellAnim_EndWithHBlank),
    PROC_CALL(HideUnitUnlockDoor),
    PROC_SLEEP(4),
    PROC_CALL(UnhideUnit),
    PROC_END,
};

void MapAnimUnlockEffect(int x, int y)
{
    struct MAEffectProc * proc;

    proc = Proc_Start(ProcScr_MapAnimUnlock, PROC_TREE_3);

    proc->xDisplay = SCREEN_TILE_X(x) * 2 * 8 + 8;
    proc->yDisplay = SCREEN_TILE_Y(y) * 2 * 8 + 8;
}

void HideUnitUnlockDoor(void)
{
    GetUnit(gActionData.subjectIndex)->state |= US_HIDDEN;
    StartAvailableDoorTileEvent(gActionData.xOther, gActionData.yOther);
}

void UnhideUnit(void)
{
    GetUnit(gActionData.subjectIndex)->state &= ~US_HIDDEN;
}

void MapAnimUnlock_Init(struct MAEffectProc * proc)
{
    PlaySeSpacial(0x8D, proc->xDisplay);

    BG_SetPosition(BG_2, 0, 0);
    Decompress(Img_MapAnimUnlockBgfx, ((void *) VRAM) + GetBackgroundTileDataOffset(BG_2) + CHR_SIZE * BGCHR_MANIM_160);

    sub_801474C(
        gBG2TilemapBuffer,
        proc->xDisplay / 8 - 2, proc->yDisplay / 8 - 2,
        TILEREF(BGCHR_MANIM_160, BGPAL_MANIM_4),
        4, 4, Tsa_MapAnimUnlockBgfx, 0);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    Decompress(Img_MapAnimUnlockObjfx, ((void *) VRAM) + 0x10000 + CHR_SIZE * OBCHR_MANIM_1C0);
    ApplyPalette(Pal_MapAnimUnlockObjfx, 0x10 + OBJPAL_MANIM_4);

    StartPaletteAnimatorReverse(Pal_MapAnimUnlockObjfx_Unk, 0x20 * BGPAL_MANIM_4, 0x20, 4, proc);

    InitScanline();
    sub_8081EAC();
    SetDefaultMapAnimScreenConf();

    SetBlendAlpha(0x10, 0x10);

    proc->unk48 = 1;
}

void MapAnimUnlock_Loop1(struct MAEffectProc * proc)
{
    int ret = Interpolate(INTERPOLATE_RCUBIC, 1, 0x10, proc->unk48, 30);

    proc->unk48++;

    UpdateMapAnimScanline(proc->xDisplay, proc->yDisplay, ret);

    if (proc->unk48 >= 30)
    {
        proc->unk48 = 0;

        Proc_Break(proc);

        APProc_Create(ApConf_089A6254, proc->xDisplay, proc->yDisplay, OAM2_CHR(OBCHR_MANIM_1C0) + OAM2_PAL(OBJPAL_MANIM_4), 0, 2);
        APProc_Create(ApConf_089A6254, proc->xDisplay, proc->yDisplay, OAM2_CHR(OBCHR_MANIM_1C0) + OAM2_PAL(OBJPAL_MANIM_4), 1, 2);
    }
}

void MapAnimUnlock_Loop2(struct MAEffectProc * proc)
{
    int ret = Interpolate(INTERPOLATE_RCUBIC, 0x10, 0, proc->unk48, 30);

    proc->unk48++;

    UpdateMapAnimScanline(proc->xDisplay, proc->yDisplay, ret);

    if (proc->unk48 >= 30)
        Proc_Break(proc);
}

void SetDefaultMapAnimScreenConf(void)
{
    // TODO: macro?
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 0;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 2;

    SetBlendTargetA(0, 0, 1, 0, 0); SetBlendBackdropA(0);
    SetBlendTargetB(0, 0, 0, 1, 1); SetBlendBackdropB(1);

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 0;

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 0, 1, 1);
}

struct ProcCmd CONST_DATA ProcScr_MapAnimEffect_Unk_089A3EC4[] = {
    PROC_REPEAT(sub_807EA60),
    PROC_END,
};

void StartMapAnimEffect_Unk_089A3EC4(int bg, int x_inc, int y_inc, ProcPtr parent)
{
    struct ManimSomethingProc_08067498 * proc;

    proc = Proc_Start(ProcScr_MapAnimEffect_Unk_089A3EC4, parent);

    proc->bg = bg;

    proc->x = 0;
    proc->x_inc = x_inc;
    proc->y = 0;
    proc->y_inc = y_inc;
}

void sub_807EA50(void)
{
    Proc_EndEach(ProcScr_MapAnimEffect_Unk_089A3EC4);
}

void sub_807EA60(struct ManimSomethingProc_08067498 * proc)
{
    BG_SetPosition(proc->bg, proc->x, proc->y);

    proc->x += proc->x_inc;
    proc->y += proc->y_inc;
}
