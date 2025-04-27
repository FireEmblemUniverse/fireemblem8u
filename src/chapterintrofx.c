#include "global.h"

#include "hardware.h"
#include "proc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "bmio.h"
#include "fontgrp.h"
#include "bmmap.h"
#include "chapterdata.h"
#include "bmfx.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmlib.h"
#include "sysutil.h"
#include "worldmap.h"

#include "constants/songs.h"

// clang-format off

struct ProcCmd CONST_DATA ProcScr_ChapterIntro_Bg2Scroll[] =
{
    PROC_REPEAT(ChapterIntro_Bg2Scroll_Loop),

    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_ChapterIntro_KeyListen[] =
{
    PROC_CALL(ChapterIntro_KeyListen_Init),
    PROC_REPEAT(ChapterIntro_KeyListen_Loop),

    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_ChapterIntro_Bg1And3Scroll[] =
{
    PROC_CALL(ChapterIntro_Bg1And3Scroll_Init),
    PROC_REPEAT(ChapterIntro_Bg1And3Scroll_Loop),

    PROC_END,
};

u8 CONST_DATA gChapterIntroLightXLerpLut[] =
{
    208, 208,
    204, 192,
    160, 128,
    96, 64,
    36, 32,
    48, 72,
    96, 120,
    136, 136,
    120, 0,
};

u8 CONST_DATA gChapterIntroLightYLerpLut[] =
{
    160, 128,
    96, 64,
    40, 32,
    36, 44,
    72, 104,
    136, 152,
    156, 144,
    120, 96,
    80, 0,
};

u16 CONST_DATA Sprite_ChapterIntro_DecalBanner[] =
{
    4,
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32, OAM2_LAYER(1),
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32 + OAM1_X(64), OAM2_CHR(0x8) + OAM2_LAYER(1),
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32 + OAM1_X(112) + OAM1_HFLIP, OAM2_CHR(0x8) + OAM2_LAYER(1),
    OAM0_SHAPE_64x32, OAM1_SIZE_64x32 + OAM1_X(176) + OAM1_HFLIP, OAM2_LAYER(1),
};

struct ProcCmd CONST_DATA ProcScr_ChapterIntro_PutDecalSprite[] =
{
    PROC_SLEEP(30),
    PROC_START_CHILD(ProcScr_ChapterIntro_RevealDecalSprite),
    PROC_REPEAT(ChapterIntro_PutDecalSprite_Loop),

    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_ChapterIntro_LightBurst[] =
{
    PROC_CALL(ChapterIntro_LightBurst_Init),
    PROC_REPEAT(ChapterIntro_LightBurst_Loop),

    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_ChapterIntro_RevealDecalSprite[] =
{
    PROC_CALL(ChapterIntro_RevealDecalSprite_Init),
    PROC_REPEAT(ChapterIntro_RevealDecalSprite_Loop),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_ChapterIntro[] =
{
    PROC_CALL(BMapDispSuspend),

    PROC_CALL(ChapterIntro_Init),

    PROC_SLEEP(60),

    PROC_START_CHILD(ProcScr_ChapterIntro_KeyListen),
    PROC_CALL_ARG(ChapterIntro_SetSkipTarget, 1),

    PROC_CALL(ChapterIntro_TwinLights_InitAndPlaySe),
    PROC_REPEAT(ChapterIntro_TwinLights_Loop),

    PROC_CALL(ChapterIntro_InitBLDCNT),
    PROC_START_CHILD(ProcScr_ChapterIntro_LightBurst),
    PROC_CALL(ChapterIntro_DrawChapterTitle),

    PROC_SLEEP(1),

    PROC_CALL(ChapterIntro_LightExplosion_Init),
    PROC_REPEAT(ChapterIntro_LightExplosion_Loop),
    PROC_CALL(ChapterIntro_SetBG_802009C),

    PROC_START_CHILD(ProcScr_ChapterIntro_Bg2Scroll),
    PROC_START_CHILD(ProcScr_ChapterIntro_PutDecalSprite),

    PROC_CALL(ChapterIntro_InitFogGfx),
    PROC_REPEAT(ChapterIntro_BlendFogAlpha_Loop),

    PROC_CALL_ARG(ChapterIntro_SetTimer, 160),
    PROC_REPEAT(ChapterIntro_TickTimerMaybe),

    PROC_CALL(ChapterIntro_8020A40),
    PROC_REPEAT(ChapterIntro_8020A8C),

    PROC_END_EACH(ProcScr_ChapterIntro_Bg2Scroll),
    PROC_END_EACH(ProcScr_ChapterIntro_Bg1And3Scroll),
    PROC_END_EACH(ProcScr_ChapterIntro_PutDecalSprite),

    PROC_CALL_ARG(ChapterIntro_SetSkipTarget, 0),

    PROC_CALL(ChapterIntro_InitCameraYPos),

    PROC_CALL(BMapDispResume),

    PROC_CALL(ChapterIntro_InitMapDisplay),
    PROC_CALL(ChapterIntro_BeginFadeToMap),
    PROC_REPEAT(ChapterIntro_LoopFadeToMap),

    PROC_SLEEP(30),

    PROC_GOTO(99),

PROC_LABEL(1),
    PROC_CALL(ChapterIntro_BeginFadeOut),
    PROC_REPEAT(ChapterIntro_LoopFadeOut),

    PROC_SLEEP(60),

    PROC_CALL(ChapterIntro_InitCameraYPos),

    PROC_CALL(BMapDispResume),

    PROC_CALL(ChapterIntro_InitMapDisplay),
    PROC_CALL(ChapterIntro_BeginFastFadeToMap),
    PROC_REPEAT(ChapterIntro_LoopFastFadeToMap),

PROC_LABEL(99),
    PROC_CALL(ChapterIntro_End),

    PROC_END,
};

struct ProcCmd CONST_DATA sProcScr_0859B318[] =
{
    PROC_CALL(ChapterIntro_8020AF8),
    PROC_CALL(ChapterIntro_InitMapDisplay),
    PROC_CALL(ChapterIntro_BeginFadeToMap),
    PROC_REPEAT(ChapterIntro_8021188),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0801FD90
void ChapterIntro_Bg2Scroll_Loop(void)
{
    int offset = (GetGameClock() / 2) & 0xFF;
    BG_SetPosition(BG_2, offset, offset);

    return;
}

//! FE8U = 0x0801FDAC
void ChapterIntro_KeyListen_Init(struct ChapterIntroFxProc * proc)
{
    struct ChapterIntroFxProc * parent = proc->proc_parent;

    parent->skipTarget = 0;
    proc->skipTarget = 0;

    return;
}

//! FE8U = 0x0801FDBC
void ChapterIntro_KeyListen_Loop(struct ChapterIntroFxProc * proc)
{
    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON | START_BUTTON))
    {
        if (((struct ChapterIntroFxProc *)proc->proc_parent)->isSkipping != 0)
        {
            proc->skipTarget = 1;
        }
        else
        {
            ((struct ChapterIntroFxProc *)proc->proc_parent)->isSkipping = 1;
        }
    }

    if (proc->skipTarget != 0)
    {
        struct ChapterIntroFxProc * parent = proc->proc_parent;

        if (parent->skipTarget != 0)
        {
            Proc_Goto(parent, parent->skipTarget);
            Proc_End(proc);
        }
    }

    return;
}

//! FE8U = 0x0801FE14
void PutScreenFogEffect(void)
{
    int ix;
    int iy;

    int tileRefA = TILEREF(0x3FF & (0x500 + 0x00), 4);
    int tileRefB = TILEREF(0x3FF & (0x500 + 0x10), 4);

    for (iy = 0; iy < 8; ++iy)
    {
        for (ix = 0; ix < 16; ++ix)
        {
            gBG3TilemapBuffer[TILEMAP_INDEX(0x00 + ix, iy + 0x00)] = tileRefA;
            gBG3TilemapBuffer[TILEMAP_INDEX(0x10 + ix, iy + 0x00)] = tileRefA;
            gBG3TilemapBuffer[TILEMAP_INDEX(0x00 + ix, iy + 0x10)] = tileRefA;
            gBG3TilemapBuffer[TILEMAP_INDEX(0x10 + ix, iy + 0x10)] = tileRefA;

            gBG3TilemapBuffer[TILEMAP_INDEX(0x00 + ix, iy + 0x08)] = tileRefB;
            gBG3TilemapBuffer[TILEMAP_INDEX(0x10 + ix, iy + 0x08)] = tileRefB;
            gBG3TilemapBuffer[TILEMAP_INDEX(0x00 + ix, iy + 0x18)] = tileRefB;
            gBG3TilemapBuffer[TILEMAP_INDEX(0x10 + ix, iy + 0x18)] = tileRefB;

            tileRefA++;
            tileRefB++;
        }

        tileRefA += 16;
        tileRefB += 16;
    }

    return;
}

//! FE8U = 0x0801FEE8
void PutScreenFogEffectOverlayed(void)
{
    int ix;
    int iy;

    int tileRefA = TILEREF(0x3FF & (0x500 + 0x00), 4);
    int tileRefB = TILEREF(0x3FF & (0x500 + 0x10), 4);

    for (iy = 0; iy < 8; ++iy)
    {
        for (ix = 0; ix < 16; ++ix)
        {
            gBG2TilemapBuffer[TILEMAP_INDEX(0x0F - ix, iy + 0x00)] = tileRefA + 0x400;
            gBG2TilemapBuffer[TILEMAP_INDEX(0x1F - ix, iy + 0x00)] = tileRefA + 0x400;
            gBG2TilemapBuffer[TILEMAP_INDEX(0x0F - ix, iy + 0x10)] = tileRefA + 0x400;
            gBG2TilemapBuffer[TILEMAP_INDEX(0x1F - ix, iy + 0x10)] = tileRefA + 0x400;

            gBG2TilemapBuffer[TILEMAP_INDEX(0x0F - ix, iy + 0x08)] = tileRefB + 0x400;
            gBG2TilemapBuffer[TILEMAP_INDEX(0x1F - ix, iy + 0x08)] = tileRefB + 0x400;
            gBG2TilemapBuffer[TILEMAP_INDEX(0x0F - ix, iy + 0x18)] = tileRefB + 0x400;
            gBG2TilemapBuffer[TILEMAP_INDEX(0x1F - ix, iy + 0x18)] = tileRefB + 0x400;

            tileRefA++;
            tileRefB++;
        }

        tileRefA += 16;
        tileRefB += 16;
    }

    return;
}

//! FE8U = 0x0801FFD0
void ChapterIntro_Bg1And3Scroll_Init(struct ChapterIntroFxProc * proc)
{
    proc->timer = 0;

    return;
}

//! FE8U = 0x0801FFD8
void ChapterIntro_Bg1And3Scroll_Loop(struct ChapterIntroFxProc * proc)
{
    proc->timer++;

    BG_SetPosition(BG_1, proc->timer / 2, 0);
    REG_BG3HOFS = proc->timer / 2;

    return;
}

//! FE8U = 0x08020010
int ChapterIntro_8020010(ProcPtr proc, void * vramDst, int palId)
{
    int refPal0;
    int refPal1;
    int i;

    u16 * buffer = gBG1TilemapBuffer;

    if (vramDst == 0)
    {
        vramDst = BG_CHR_ADDR(0x0);
    }

    ApplyPalettes(Pal_CommGameBgScreenInShop, palId, 2);
    Decompress(Img_CommGameBgScreen, vramDst);

    refPal0 = TILEREF(0, palId & 15);
    refPal1 = TILEREF(0, (palId + 1) & 15);

    for (i = 0; i < 224; i++)
    {
        *buffer++ = i + refPal0;
    }

    for (; i < 416; i++)
    {
        *buffer++ = i + refPal1;
    }

    for (; i < 640; i++)
    {
        *buffer++ = i + refPal0;
    }

    Proc_Start(ProcScr_ChapterIntro_Bg1And3Scroll, proc);

    // return; // BUG?
}

//! FE8U = 0x0802009C
void ChapterIntro_SetBG_802009C(void)
{
    gLCDControlBuffer.dispcnt.mode = DISPCNT_MODE_0;

    SetBackgroundTileDataOffset(BG_2, 0x8000);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 3;

    gLCDControlBuffer.bg2cnt.screenSize = 0;

    return;
}

//! FE8U = 0x080200F0
void ChapterIntro_Init(struct ChapterIntroFxProc * proc)
{
    SetupBackgrounds(NULL);

    gLCDControlBuffer.dispcnt.mode = DISPCNT_MODE_1;

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 2;

    SetDispEnable(0, 0, 0, 0, 1);

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_2, 0, 0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    SetBackgroundTileDataOffset(BG_2, 0x8000);

    SetWinEnable(1, 0, 0);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 1, 1, 1);

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    SetWin0Box(0, 0, 0, 0);

    SetBlendConfig(BLEND_EFFECT_NONE, 0, 0, 0);

    MaybeResetSomePal();

    sub_80017B4(0, 2, 64, -1);

    CALLARM_ColorFadeTick();

    EnablePaletteSync();

    gLCDControlBuffer.bg2cnt.screenSize = 1;
    gLCDControlBuffer.bg2cnt.areaOverflowMode = 1;

    Decompress(Img_ChapterIntro_LensFlare, BG_CHR_ADDR(0x400));
    ApplyPalettes(Pal_ChapterIntro_LensFlare, 0, 3);

    sub_800154C(gBG2TilemapBuffer, Tsa_08B18D68, 0, 5);

    Decompress(Img_ChapterIntro_Sprites, OBJ_CHR_ADDR(0x200));
    ApplyPalette(Pal_ChapterIntro_Sprites, 18);

    ChapterIntro_8020010(proc, 0, 14);

    BG_EnableSyncByMask(BG1_SYNC_BIT | BG2_SYNC_BIT);

    proc->isSkipping = 0;

    return;
}

//! FE8U = 0x080202BC
void ChapterIntro_TwinLights_InitAndPlaySe(struct ChapterIntroFxProc * proc)
{
    proc->timer = 0;
    proc->unk_4E = 0;
    proc->unk_64 = 0;
    proc->unk_66 = 0;
    proc->unk_68 = 3;

    PlaySoundEffect(SONG_SYS_CHAPTER_START);

    return;
}

//! FE8U = 0x080202F8
void ChapterIntro_TwinLights_Loop(struct ChapterIntroFxProc * proc)
{
    proc->xLight = Interpolate(
        INTERPOLATE_LINEAR, gChapterIntroLightXLerpLut[proc->timer], gChapterIntroLightXLerpLut[proc->timer + 1],
        proc->unk_4E, proc->unk_68);
    proc->yLight = Interpolate(
        INTERPOLATE_LINEAR, gChapterIntroLightYLerpLut[proc->timer], gChapterIntroLightYLerpLut[proc->timer + 1],
        proc->unk_4E, proc->unk_68);

    if (proc->unk_64 <= 100)
    {
        int scale = Interpolate(INTERPOLATE_RSQUARE, 320, 64, proc->unk_64, 100);

        // clang-format off
        SetObjAffine(
            0,
            Div(+COS(0) * 16, scale),
            Div(-SIN(0) * 16, scale),
            Div(+SIN(0) * 16, scale),
            Div(+COS(0) * 16, scale)
        );
        // clang-format on

        proc->unk_64++;
    }

    CallARM_PushToSecondaryOAM(
        OAM1_X(proc->xLight - 16), ((proc->yLight - 16) & 0x1FF) | OAM0_AFFINE_ENABLE, gObject_32x32,
        OAM2_CHR(0x210) + OAM2_PAL(2));
    CallARM_PushToSecondaryOAM(
        OAM1_X(224 - proc->xLight), ((144 - proc->yLight) & 0x1FF) | OAM0_AFFINE_ENABLE, gObject_32x32,
        OAM2_CHR(0x214) + OAM2_PAL(2));

    proc->unk_4E++;

    if (proc->unk_4E >= proc->unk_68)
    {
        proc->unk_4E = 0;

        proc->timer++;

        proc->unk_68 = Interpolate(INTERPOLATE_LINEAR, 3, 8, proc->unk_66, 18);

        proc->unk_66++;

        if (gChapterIntroLightXLerpLut[proc->timer + 1] == 0)
        {
            Proc_Break(proc);
        }
    }

    return;
}

//! FE8U = 0x080204AC
void ChapterIntro_LightExplosion_Init(struct ChapterIntroFxProc * proc)
{
    SetDispEnable(1, 1, 1, 0, 1);

    proc->timer = 0;
    proc->unk_64 = 0;
    proc->unk_66 = 0;
    proc->unk_68 = 0;

    return;
}

//! FE8U = 0x080204E4
void PutOppositeLightExplosionSprites(struct ChapterIntroFxProc * proc, int affineId, int xTarget, int yTarget)
{
    int x = Interpolate(INTERPOLATE_RCUBIC, DISPLAY_WIDTH / 2, xTarget, proc->timer, 70);
    int y = Interpolate(INTERPOLATE_RCUBIC, DISPLAY_HEIGHT / 2, yTarget, proc->timer, 70);

    CallARM_PushToSecondaryOAM(
        OAM1_X(x - 8) | OAM1_AFFINE_ID(affineId), ((y - 8) & 0x1FF) | OAM0_AFFINE_ENABLE, gObject_16x16,
        OAM2_CHR(0x218) + OAM2_PAL(2));

    CallARM_PushToSecondaryOAM(
        OAM1_X(232 - x) | OAM1_AFFINE_ID(affineId), ((152 - y) & 0x1FF) | OAM0_AFFINE_ENABLE, gObject_16x16,
        OAM2_CHR(0x218) + OAM2_PAL(2));

    return;
}

/**
 * Draws the 6 (3 above right, 3 below left) "light explosion" sprites that
 * appear while the lens flare is active.
 */
//! FE8U = 0x08020578
void ChapterIntro_LightExplosion_Loop(struct ChapterIntroFxProc * proc)
{
    int scale;

    if (proc->unk_64 <= 70)
    {
        scale = Interpolate(INTERPOLATE_RSQUARE, 320, 16, proc->unk_64, 70);

        // clang-format off
        SetObjAffine(
            1,
            Div(+COS(0) * 16, scale),
            Div(-SIN(0) * 16, scale),
            Div(+SIN(0) * 16, scale),
            Div(+COS(0) * 16, scale)
        );
        // clang-format on

        proc->unk_64++;
    }

    PutOppositeLightExplosionSprites(proc, 1, 215, 17);

    if (proc->unk_66 <= 70)
    {
        scale = Interpolate(INTERPOLATE_RSQUARE, 320, 16, proc->unk_66, 70);

        // clang-format off
        SetObjAffine(
            2,
            Div(+COS(0) * 16, scale),
            Div(-SIN(0) * 16, scale),
            Div(+SIN(0) * 16, scale),
            Div(+COS(0) * 16, scale)
        );
        // clang-format on

        proc->unk_66++;
    }

    PutOppositeLightExplosionSprites(proc, 2, 192, 32);

    if (proc->unk_68 <= 70)
    {
        scale = Interpolate(INTERPOLATE_RSQUARE, 320, 16, proc->unk_68, 70);

        // clang-format off
        SetObjAffine(
            3,
            Div(+COS(0) * 16, scale),
            Div(-SIN(0) * 16, scale),
            Div(+SIN(0) * 16, scale),
            Div(+COS(0) * 16, scale)
        );
        // clang-format on

        proc->unk_68++;
    }

    PutOppositeLightExplosionSprites(proc, 3, 169, 47);

    proc->timer++;

    if (proc->timer >= 70)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08020778
void ChapterIntro_DrawChapterTitle(void)
{
    int titleId;

    BG_Fill(gBG0TilemapBuffer, TILEREF(0x280, 1));

    sub_80895B4(8, 5);
    titleId = GetChapterTitleWM(&gPlaySt);
    _PutChapterTitleGfx(0x280, titleId);
    sub_80896FC(TILEMAP_LOCATED(gBG0TilemapBuffer, 3, 9), 5, titleId);

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}

/**
 * Draws the vine-like banner decal behind the chapter intro title. The
 * "split open" effect that reveals the decal sprite is handled by
 * "ProcScr_ChapterIntro_RevealDecalSprite".
 */
//! FE8U = 0x080207C8
void ChapterIntro_PutDecalSprite_Loop(void)
{
    CallARM_PushToSecondaryOAM(0, 64, Sprite_ChapterIntro_DecalBanner, OAM2_CHR(0x200) + OAM2_PAL(2));
    CallARM_PushToSecondaryOAM(0, 64, Sprite_ChapterIntro_DecalBanner, OAM2_CHR(0x200) + OAM2_PAL(2));

    return;
}

//! FE8U = 0x080207F4
void ChapterIntro_LightBurst_Init(struct ChapterIntroFxProc * proc)
{
    proc->timer = 0;
    proc->unk_4E = 0;
    proc->unk_66 = 0;
    return;
}

//! FE8U = 0x08020808
void ChapterIntro_LightBurst_Loop(struct ChapterIntroFxProc * proc)
{
    if (proc->unk_66 == 0)
    {
        SetBlendAlpha(16, proc->unk_4E);
        proc->unk_4E++;
    }
    else
    {
        SetBlendAlpha(proc->unk_4E >> 1, 16);
        proc->unk_4E--;
    }

    if (proc->timer < 256)
    {
        BgAffinRotScaling(BG_2, 0, 0, 0, 384, 384);
        BgAffinScaling(BG_2, (u16)proc->timer + DISPLAY_WIDTH, (u16)proc->timer + DISPLAY_WIDTH);
        BgAffinAnchoring(BG_2, 112, 88, 76, 76);
        FlushLCDControl();

        if (proc->unk_66 != 0)
        {
            proc->timer += 4;
        }
    }

    if (proc->unk_66 == 0)
    {
        if (proc->unk_4E < 16)
        {
            return;
        }

        proc->unk_4E = 32;
        SetBlendAlpha(16, 16);
        proc->unk_66++;

        return;
    }

    if (proc->unk_4E > 0)
    {
        return;
    }

    SetBlendAlpha(0, 16);

    Proc_EndEach(ProcScr_ChapterIntro_LightBurst);
    Proc_Break(proc);

    return;
}

//! FE8U = 0x080208F8
void ChapterIntro_InitBLDCNT(void)
{
    SetDispEnable(0, 1, 1, 0, 1);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 1, 0, 0, 0);

    return;
}

//! FE8U = 0x08020944
void ChapterIntro_InitFogGfx(struct ChapterIntroFxProc * proc)
{
    SetDispEnable(1, 1, 1, 0, 1);

    proc->timer = 0;

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 1, 0, 0, 0);

    Decompress(Img_ChapterIntro_Fog, BG_CHR_ADDR(0x400));
    ApplyPalette(Pal_ChapterIntro_Fog, 4);

    Decompress(Tsa_ChapterIntro_Fog, gGenericBuffer);
    CallARM_FillTileRect(gBG2TilemapBuffer, gGenericBuffer, TILEREF(0x0, 4));

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    return;
}

//! FE8U = 0x080209D8
void ChapterIntro_BlendFogAlpha_Loop(struct ChapterIntroFxProc * proc)
{
    SetBlendAlpha(proc->timer, 16);

    if (proc->skipTarget == 3 || (GetGameClock() & 3) == 0)
    {
        if (proc->isSkipping != 0)
        {
            proc->timer += 4;
        }
        else
        {
            proc->timer++;
        }

        if (proc->timer > 5)
        {
            SetBlendAlpha(6, 16);
            Proc_Break(proc);
        }
    }

    return;
}

//! FE8U = 0x08020A40
void ChapterIntro_8020A40(struct ChapterIntroFxProc * proc)
{
    proc->timer = 30;

    MaybeResetSomePal();

    MaybeSmoothChangeSomePal(PAL_BG(4), 4, 2, -1);
    MaybeSmoothChangeSomePal(PAL_BG(14), 14, 2, -1);
    MaybeSmoothChangeSomePal(PAL_OBJ(2), 18, 1, -1);

    return;
}

//! FE8U = 0x08020A8C
void ChapterIntro_8020A8C(struct ChapterIntroFxProc * proc)
{
    if ((GetGameClock() & 3) == 0)
    {
        CALLARM_ColorFadeTick();
        EnablePaletteSync();

        proc->timer--;

        if (proc->timer < 0)
        {
            SetDispEnable(1, 0, 0, 0, 1);
            SetBackgroundTileDataOffset(BG_2, 0);

            gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0;
            EnablePaletteSync();

            Proc_Break(proc);
        }
    }

    return;
}

//! FE8U = 0x08020AF8
void ChapterIntro_8020AF8(void)
{
    SetupBackgrounds(NULL);

    sub_80156D4();
    AllocWeatherParticles(gPlaySt.chapterWeatherId);

    RefreshUnitSprites();
    ForceSyncUnitSpriteSheet();

    InitSystemTextFont();

    return;
}

//! FE8U = 0x08020B20
void ChapterIntro_InitCameraYPos(void)
{
    gBmSt.camera.y = DISPLAY_HEIGHT * 4;
    return;
}

//! FE8U = 0x08020B30
void ChapterIntro_InitMapDisplay(void)
{
    int var;

    SetDispEnable(1, 1, 1, 1, 1);

    SetBlendAlpha(16, 0);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 1);

    SetBlendBackdropB(1);

    CpuFastFill(0, BG_CHR_ADDR(0x0), CHR_SIZE);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    DisableMapPaletteAnimations();

    UnpackChapterMapGraphics(gPlaySt.chapterIndex);

    ApplyUnitSpritePalettes();
    LoadObjUIGfx();

    var = GetROMChapterStruct(gPlaySt.chapterIndex)->initialPosX;
    var = GetCameraCenteredX(var * 16);
    var = (var + 0xF) & 0x1F0;
    gBmSt.camera.x = var;

    var = GetROMChapterStruct(gPlaySt.chapterIndex)->initialPosY;
    var = GetCameraCenteredY(var * 16);
    var = (var + 0xF) & 0x3F0;
    gBmSt.camera.y = var;

    RefreshEntityBmMaps();
    RenderBmMap();

    return;
}

//! FE8U = 0x08020C2C
void ChapterIntro_BeginFadeToMap(struct ChapterIntroFxProc * proc)
{
    MaybeResetSomePal();

    MaybeSmoothChangeSomePal(PAL_BG(6), 6, 10, 1);
    MaybeSmoothChangeSomePal(PAL_OBJ(10), 26, 6, 1);
    MaybeSmoothChangeSomePal(PAL_OBJ(0), 16, 2, 1);
    MaybeSmoothChangeSomePal(PAL_OBJ(7), 23, 1, 1);

    CALLARM_ColorFadeTick();

    EnablePaletteSync();

    proc->timer = 30;

    if (GetROMChapterStruct(gPlaySt.chapterIndex)->initialWeather == WEATHER_FLAMES)
    {
        WfxFlamesInitGradientPublic();
    }

    return;
}

//! FE8U = 0x08020CA4
void ChapterIntro_LoopFadeToMap(struct ChapterIntroFxProc * proc)
{
    if ((GetGameClock() & 1) == 0)
    {
        CALLARM_ColorFadeTick();

        if (GetROMChapterStruct(gPlaySt.chapterIndex)->initialWeather == WEATHER_FLAMES)
        {
            WfxFlamesInitGradientPublic();
        }

        if (GetBattleMapKind() == BATTLEMAP_KIND_SKIRMISH || GetROMChapterStruct(gPlaySt.chapterIndex)->fadeToBlack)
        {
            if (GetROMChapterStruct(gPlaySt.chapterIndex)->mapBgmIds[MAP_BGM_PROLOGUE] != 0xFFFF)
            {
                StartBgm(GetROMChapterStruct(gPlaySt.chapterIndex)->mapBgmIds[MAP_BGM_PROLOGUE], NULL);
            }

            proc->timer = 0;

            SetDispEnable(1, 1, 1, 0, 0);
        }
        else
        {
            int bldAmt;
            EnablePaletteSync();

            bldAmt = (proc->timer + 7) / 8;
            SetBlendAlpha(bldAmt + 12, 4 - bldAmt);
        }

        proc->timer--;

        if (proc->timer == 24 && GetROMChapterStruct(gPlaySt.chapterIndex)->mapBgmIds[MAP_BGM_PROLOGUE] != 0xFFFF)
        {
            StartBgm(GetROMChapterStruct(gPlaySt.chapterIndex)->mapBgmIds[MAP_BGM_PROLOGUE], NULL);
        }

        if (proc->timer < 0)
        {
            ResetMapPaletteAnimations();
            Proc_Break(proc);
        }
    }

    return;
}

//! FE8U = 0x08020DBC
void ChapterIntro_RevealDecalSprite_Init(struct ChapterIntroFxProc * proc)
{
    proc->timer = 0;
    SetWOutLayers(1, 1, 1, 1, 0);
    return;
}

//! FE8U = 0x08020DE8
void ChapterIntro_RevealDecalSprite_Loop(struct ChapterIntroFxProc * proc)
{
    int hWinOffs = Interpolate(INTERPOLATE_RCUBIC, 0, DISPLAY_WIDTH / 2, proc->timer, 40);

    SetWin0Box((DISPLAY_WIDTH / 2) - hWinOffs, 0, hWinOffs + (DISPLAY_WIDTH / 2), DISPLAY_HEIGHT);

    proc->timer++;

    if (proc->timer > 40)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08020E48
void ChapterIntro_BeginFadeOut(struct ChapterIntroFxProc * proc)
{
    Sound_FadeOutBGM(4);

    MaybeResetSomePal();

    MaybeSmoothChangeSomePal(PAL_BG(0), 0, 3, -2);
    MaybeSmoothChangeSomePal(PAL_BG(4), 4, 2, -2);
    MaybeSmoothChangeSomePal(PAL_BG(14), 14, 2, -2);
    MaybeSmoothChangeSomePal(PAL_OBJ(2), 18, 1, -2);

    proc->timer = 15;

    Sound_FadeOutSE(1);

    return;
}

//! FE8U = 0x08020EAC
void ChapterIntro_LoopFadeOut(struct ChapterIntroFxProc * proc)
{
    CALLARM_ColorFadeTick();
    EnablePaletteSync();

    proc->timer--;

    if (proc->timer < 0)
    {
        SetDispEnable(0, 0, 0, 0, 0);
        SetBackgroundTileDataOffset(BG_2, 0);
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08020F00
void ChapterIntro_BeginFastFadeToMap(struct ChapterIntroFxProc * proc)
{
    gLCDControlBuffer.dispcnt.mode = DISPCNT_MODE_0;

    CpuFastFill(0, BG_CHR_ADDR(0x0), CHR_SIZE);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    Proc_EndEach(ProcScr_ChapterIntro_Bg2Scroll);
    Proc_EndEach(ProcScr_ChapterIntro_Bg1And3Scroll);
    Proc_EndEach(ProcScr_ChapterIntro_PutDecalSprite);

    MaybeResetSomePal();

    MaybeSmoothChangeSomePal(PAL_BG(6), 6, 10, 2);
    MaybeSmoothChangeSomePal(PAL_OBJ(10), 26, 6, 2);
    MaybeSmoothChangeSomePal(PAL_OBJ(0), 16, 2, 2);
    MaybeSmoothChangeSomePal(PAL_OBJ(7), 23, 1, 2);

    CALLARM_ColorFadeTick();

    EnablePaletteSync();

    proc->timer = 14;

    if (GetROMChapterStruct(gPlaySt.chapterIndex)->mapBgmIds[MAP_BGM_PROLOGUE] != 0xFFFF)
    {
        StartBgm(GetROMChapterStruct(gPlaySt.chapterIndex)->mapBgmIds[MAP_BGM_PROLOGUE], NULL);
    }

    return;
}

//! FE8U = 0x08020FF8
void ChapterIntro_LoopFastFadeToMap(struct ChapterIntroFxProc * proc)
{
    CALLARM_ColorFadeTick();

    if (GetROMChapterStruct(gPlaySt.chapterIndex)->initialWeather == WEATHER_FLAMES)
    {
        WfxFlamesInitGradientPublic();
    }

    if (GetBattleMapKind() == BATTLEMAP_KIND_SKIRMISH || GetROMChapterStruct(gPlaySt.chapterIndex)->fadeToBlack)
    {
        proc->timer = 0;
        SetDispEnable(1, 1, 1, 0, 0);
    }
    else
    {
        EnablePaletteSync();
    }

    proc->timer--;

    if (proc->timer < 0)
    {
        ResetMapPaletteAnimations();
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08021080
void ChapterIntro_SetSkipTarget(s16 targetLabel, struct ChapterIntroFxProc * proc)
{
    proc->skipTarget = targetLabel;
    return;
}

//! FE8U = 0x08021088
void ChapterIntro_SetTimer(s16 timer, struct ChapterIntroFxProc * proc)
{
    proc->timer = timer;
    return;
}

//! FE8U = 0x08021090
void ChapterIntro_TickTimerMaybe(struct ChapterIntroFxProc * proc)
{
    if (proc->isSkipping != 0)
    {
        Proc_Break(proc);
        return;
    }

    if (proc->timer-- < 0)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080210C0
void sub_80210C0(struct ChapterIntroFxProc * proc)
{
    proc->isSkipping = 2;
    return;
}

//! FE8U = 0x080210C8
void ChapterIntro_End(void)
{
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetWinEnable(0, 0, 0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_EnableSyncByMask(BG0_SYNC_BIT);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    if (GetBattleMapKind() == BATTLEMAP_KIND_SKIRMISH || GetROMChapterStruct(gPlaySt.chapterIndex)->fadeToBlack)
    {
        RefreshBMapGraphics();
        sub_80141B0();
    }

    return;
}

//! FE8U = 0x08021188
void ChapterIntro_8021188(struct ChapterIntroFxProc * proc)
{
    if ((GetGameClock() & 1) == 0)
    {
        CALLARM_ColorFadeTick();

        if (GetROMChapterStruct(gPlaySt.chapterIndex)->initialWeather == 5)
        {
            WfxFlamesInitGradientPublic();
        }

        ResetMapPaletteAnimations();
        Proc_Break(proc);
    }

    return;
}
