#include "global.h"

#include "hardware.h"
#include "ctc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "gamecontrol.h"
#include "bmlib.h"
#include "bm.h"
#include "opanim.h"
#include "sysutil.h"

u16 CONST_DATA gSprite_Title_FireEmblemLogo[] = {
    5,
    0x4000, 0xC000, 0x0000,
    0x4000, 0xC040, 0x0008,
    0x4000, 0xC080, 0x0010,
    0x0000, 0x80C0, 0x0018,
    0x8000, 0x40E0, 0x001C,
};

u16 CONST_DATA gSprite_Title_SacredStonesBanner[] = {
    4,
    0x4000, 0xC000, 0x0000,
    0x4000, 0xC040, 0x0008,
    0x4000, 0xC080, 0x0010,
    0x8000, 0x80C0, 0x0018,
};

u16 CONST_DATA gSprite_Title_CopyrightInfo[] = {
    8,
    0x4000, 0x4000, 0x0000,
    0x4000, 0x4020, 0x0004,
    0x4000, 0x4040, 0x0008,
    0x4000, 0x4060, 0x000C,
    0x4000, 0x4080, 0x0010,
    0x4000, 0x40A0, 0x0014,
    0x4000, 0x40C0, 0x0018,
    0x0000, 0x00E0, 0x001C,
};

u16 CONST_DATA gSprite_Title_PressStart[] = {
    4,
    0x4000, 0x8000, 0x0000,
    0x0000, 0x4020, 0x0004,
    0x4000, 0x8030, 0x0040,
    0x0000, 0x4050, 0x0044,
};

//! FE8U = 0x080C5430
void DrawTitleSprites_Init(struct TitleScreenProc* proc) {
    proc->unk_4c = 0;
    proc->unk_52 = 0;

    return;
}

//! FE8U = 0x080C5440
void DrawTitleSprites_Loop(struct TitleScreenProc* proc) {

    PutSpriteExt(0, 4, 48, gSprite_Title_FireEmblemLogo, 0x2000);
    PutSpriteExt(0, 220, 41, gObject_16x16, 0x201E); // TM
    PutSpriteExt(2, 4, 1077, gSprite_Title_FireEmblemLogo, 0x2080);
    PutSpriteExt(1, 16, 85, gSprite_Title_SacredStonesBanner, 0x31A0);
    PutSpriteExt(1, 72, 124, gSprite_Title_PressStart, 0x1ba);
    PutSpriteExt(1, 4, 148, gSprite_Title_CopyrightInfo, 0x1180);

    if (DivRem(proc->unk_4c, 3) == 0) {
        proc->unk_52 = (proc->unk_52 + 1) & 0x1f;
    }

    if ((proc->unk_52 & 0x10) != 0) {
        CopyToPaletteBuffer(gPal_08AADBE8 + (proc->unk_52 & 0xf), 0x210, 2);
    } else {
        CopyToPaletteBuffer(gPal_08AADBE8 + ((0x1f - proc->unk_52) & 0xf), 0x210, 2);
    }

    proc->unk_4c++;
}

struct ProcCmd CONST_DATA gProcScr_DrawTitleSprites[] = {
    PROC_CALL(DrawTitleSprites_Init),
    PROC_REPEAT(DrawTitleSprites_Loop),

    PROC_END,
};

//! FE8U = 0x080C5548
void sub_80C5548(int arg) {
    struct BgAffineSrcData src;

    src.texX = 0x7800;
    src.texY = 0x5000;
    src.scrX = 0x78;
    src.scrY = 0x50;


    src.sx = arg;
    src.sy = arg;

    src.alpha = 0;

    BgAffineSet(&src, gOpAnimBgAffineDstData, 1);

    return;
}

//! FE8U = 0x080C5580
void SkipTitleFx_Loop_KeyListener(struct Proc* proc) {
    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON | START_BUTTON)) {
        Proc_Goto(proc->proc_parent, 3);
    }

    return;
}

struct ProcCmd CONST_DATA gProcScr_SkipTitleFxKeyListener[] = {
    PROC_YIELD,
    PROC_REPEAT(SkipTitleFx_Loop_KeyListener),

    PROC_END,
};

//! FE8U = 0x080C55A4
void Title_StartSkipFxListener(ProcPtr proc) {
    Proc_Start(gProcScr_SkipTitleFxKeyListener, proc);

    return;
}

//! FE8U = 0x080C55B8
void Title_EndSkipFxListener(void) {
    Proc_End(Proc_Find(gProcScr_SkipTitleFxKeyListener));

    return;
}

//! FE8U = 0x080C55CC
void Title_Init(struct TitleScreenProc* proc) {
    gLCDControlBuffer.dispcnt.mode = 0;

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    SetBackgroundTileDataOffset(0, 0);
    SetBackgroundTileDataOffset(1, 0);
    SetBackgroundTileDataOffset(2, 0x8000);
    SetBackgroundTileDataOffset(3, 0xc000);

    SetBackgroundMapDataOffset(0, 0x6800);
    SetBackgroundMapDataOffset(1, 0x7000);
    SetBackgroundMapDataOffset(2, 0xb000);
    SetBackgroundMapDataOffset(3, 0x7800);

    SetBackgroundScreenSize(0, 0);
    SetBackgroundScreenSize(1, 0);
    SetBackgroundScreenSize(2, 0);
    SetBackgroundScreenSize(3, 0);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);
    BG_SetPosition(2, 0, 0);
    BG_SetPosition(3, 0, 0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_Fill(gBG3TilemapBuffer, 0);

    SetBlendBackdropA(0);
    SetBlendBackdropB(0);

    SetDefaultColorEffects();

    BG_EnableSyncByMask(0xf);

    proc->timer = 0;
    proc->timer_idle = 0;

    return;
}

//! FE8U = 0x080C56F4
void Title_SetupMainGraphics(struct TitleScreenProc * proc)
{
    int i;

    switch (proc->timer) {
    case 0:
        Decompress(gGfx_TitleMainBackground_1, (void*)0x6000000);

        break;

    case 1:
        Decompress(gGfx_TitleMainBackground_2, (void*)0x06003000);
        Decompress(gTsa_TitleMainBackground, gBG1TilemapBuffer);
        ApplyPalette(gPal_TitleMainBackground, 0xE);

        for (i = 0; i < 0x280; i++)
            gBG1TilemapBuffer[i] += 0xE000;

        if (proc->mode != 0)
            gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0x7FFF; // White
        else
            gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0;

        break;

    case 2:
        Decompress(gGfx_TitleDragonForeground, (void*)0x06005000);
        Decompress(gTsa_TitleDragonForeground, gBG0TilemapBuffer);
        ApplyPalette(gPal_TitleDragonForeground, 0xF);

        for (i = 0; i < 0x280; i++)
            gBG0TilemapBuffer[i] += 0xF280;

        BG_EnableSyncByMask(1);
        break;

    case 3:
        Decompress(gGfx_FireEmblemLogo, (void*)0x06010000);
        break;

    case 4:
        Decompress(gGfx_SubtitlePressStart, (void*)0x06013000);
        ApplyPalettes(gPal_PressStart, 0x10, 4);
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }

    proc->timer++;
}

//! FE8U = 0x080C5848
void TitleScreenTryJumpIntroAnim(struct TitleScreenProc * proc)
{
    if (proc->mode != 0)
        Proc_Goto(proc, 0);
    else
        Proc_Start(gProcScr_DrawTitleSprites, proc);
}

//! FE8U = 0x080C5870
void sub_80C5870(void) {
    BG_EnableSyncByMask(0xf);

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    SetBlendConfig(1, 8, 8, 0);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 0, 0, 0);

    return;
}

//! FE8U = 0x080C58CC
void Title_SetupSpecialEffectGraphics(struct TitleScreenProc* proc) {
    int i;

    switch (proc->timer) {
        case 0:
            SetBackgroundTileDataOffset(0, 0xc000);
            SetBackgroundMapDataOffset(0, 0x7800);

            Decompress(gGfx_08AAFD14, (void*)0x06008000);
            Decompress(gTsa_08AAFF10, (void*)0x0600B000);
            ApplyPalette(gPal_08AB0114, 0);
            gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0x7FFF; // White

            goto _080C5A14;

        case 1:
            Decompress(gGfx_08AADC08, (void*)0x0600C000);
            Decompress(gTsa_08AAE61C, gBG0TilemapBuffer);
            ApplyPalette(gPal_08AAE8CC, 1);

            for (i = 0; i < 0x280; i++) {
                gBG0TilemapBuffer[i] += 0x1000;
            }

            BG_EnableSyncByMask(1);

            goto _080C5A14;

        case 2:
            Decompress(gGfx_08AAE8EC, (void*)0x0600D000);
            Decompress(gTsa_08AAF928, gBG0TilemapBuffer);
            ApplyPalette(gPal_08AAFCF4, 2);

            for (i = 0; i < 0x280; i++) {
                gBG0TilemapBuffer[i] += 0x2080;
            }

            goto _080C5A14;

        case 3:
            Decompress(gGfx_TitleLargeGlowingOrb, (void*)0x06014400);
            ApplyPalettes(gPal_TitleLargeGlowingOrb, 0x14, 3);
            Decompress(gGfx_TitleSmallLightBubbles, (void*)0x06015400);
            ApplyPalette(gPal_TitleSmallLightBubbles, 0x17);

            goto _080C5A14;

        default:
_080C5A14:
            proc->timer++;

            return;

        case 4:
            proc->timer = 0;
            Proc_Break(proc);

            return;
    }
}

//! FE8U = 0x080C5A44
void sub_80C5A44(struct TitleScreenProc* proc) {

    gLCDControlBuffer.dispcnt.mode = 1;

    SetBackgroundScreenSize(2, 2);

    BgAffineSetOpAnim(8, 0);

    gLCDControlBuffer.bg2cnt.areaOverflowMode = 0;

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    gLCDControlBuffer.bg0cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetBlendConfig(2, 8, 8, 0x10);

    SetBlendTargetA(1, 1, 1, 1, 1);

    gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0;
    EnablePaletteSync();

    proc->timer = 0;

    return;
}

//! FE8U = 0x080C5AF0
void Title_Loop_DrawRotatingBlueLights(struct TitleScreenProc* proc) {
    int res;
    int time;

    if (proc->timer < 45) {
        res = Interpolate(0, 64, 256, proc->timer, 45);
    } else {
        res = Interpolate(0, 256, 448, proc->timer - 45, 45);
    }

    BgAffineSetOpAnim(
        res,
        Interpolate(0, 0, 64, proc->timer, 90)
    );

    if (res > 0xFF) {
        PutSpriteExt(0, 104, 64, gObject_32x32, 0x4220);
    }

    if (proc->timer < 23) {
        gLCDControlBuffer.blendY = Interpolate(0, 16, 0, proc->timer, 22);
    }

    time = proc->timer - 68;

    if (time > -1) {
        if (time == 0) {
            gLCDControlBuffer.bldcnt.effect = 3;
            SetBlendTargetA(1, 1, 1, 1, 0);
        }

        gLCDControlBuffer.blendY = Interpolate(0, 0, 16, time, 22);
    }

    if (proc->timer == 90) {
        proc->timer = 0;
        Proc_Break(proc);
    } else {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C5BD4
void sub_80C5BD4(void) {
    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(6);

    gLCDControlBuffer.dispcnt.mode = 0;

    SetBlendConfig(1, 0x10, 0x10, 0x10);

    SetBlendTargetA(0, 0, 0, 0, 1);
    SetBlendTargetB(0, 1, 0, 0, 0);

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    CpuFastFill(0, PAL_BG(0xE), 0x20);

    EnablePaletteSync();

    return;
}

//! FE8U = 0x080C5C64
void Title_Loop_DrawRedBlueOrbs(struct TitleScreenProc* proc) {

    ApplyPalette(gPal_TitleMainBackground, 0xE);

    sub_80C69B0(
        PAL_BG(0xE),
        0,
        Interpolate(0, 16, 0, proc->timer, 48)
    );

    if (proc->timer == 20) {
        StartBgmExt(2, 0, 0);
    }

    if (proc->timer < 20) {
        PutSpriteExt(0, 104, 64, gObject_32x32, 0x4220);
    } else if (proc->timer < 24) {
        if ((proc->timer & 1) != 0) {
            PutSpriteExt(0, 104, 64, gObject_32x32, 0x6228);
            PutSpriteExt(1, 104, 64, gObject_32x32, 0x5224);
        } else {
            PutSpriteExt(0, 104, 64, gObject_32x32, 0x5224);
            PutSpriteExt(1, 104, 64, gObject_32x32, 0x6228);
        }
    } else {
        int tmpA = proc->timer - 24;

        if (tmpA < 9) {
            int tmpB = Interpolate(1, 0, 128, tmpA, 8);

            if ((proc->timer & 1) != 0) {
                PutSpriteExt(0, (104 - tmpB) & 0x01FF, 64, gObject_32x32, 0x6228);
                PutSpriteExt(1, (tmpB + 104) & 0x01FF, 64, gObject_32x32, 0x5224);
            } else {
                PutSpriteExt(0, (tmpB + 104) & 0x01FF, 64, gObject_32x32, 0x5224);
                PutSpriteExt(1, (104 - tmpB) & 0x01FF, 64, gObject_32x32, 0x6228);
            }
        }
    }

    if (proc->timer == 48) {
        proc->timer = 0;
        Proc_Break(proc);
    } else {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C5DF0
void Title_PrepareMainScreenWithExtendedBgm(void) {

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    SetBlendConfig(1, 0, 0x10, 0);

    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(0, 1, 0, 0, 0);

    PlaySoundEffect(0x317);

    return;
}

//! FE8U = 0x080C5E60
void Title_Loop_RevealGreenDragonFlashFx(struct TitleScreenProc* proc) {

    gLCDControlBuffer.blendCoeffA = Interpolate(0, 0, 13, proc->timer, 12);

    if (proc->timer == 12) {
        proc->timer = 0;
        Proc_Break(proc);
    } else {
        proc->timer++;
    }
    return;
}

//! FE8U = 0x080C5EA0
void Title_Loop_FlashFxExpand(struct TitleScreenProc* proc) {
    int res = Interpolate(0, 0, 16, proc->timer, 12);

    if (proc->timer == 0) {
        BG_EnableSyncByMask(1);
    }

    ApplyPalette(gPal_08AAFCF4, 2);
    sub_80C69B0(PAL_BG(2), 0x7FFF, res);

    ApplyPalette(gPal_TitleMainBackground, 0xE);
    sub_80C69B0(PAL_BG(0xE), 0x7FFF, res);

    if (proc->timer == 12) {
        proc->timer = 0;
        Proc_Break(proc);
    } else {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C5F2C
void Title_LoadDemonKingOnBg2(void) {
    int i;

    Decompress(gGfx_TitleDemonKing, (void*)0x06008000);
    Decompress(gTsa_TitleDemonKing, gBG2TilemapBuffer);

    ApplyPalette(gPal_TitleDemonKing, 3);

    for (i = 0; i < 0x280; i++) {
        gBG2TilemapBuffer[i] += 0x3000;
    }

    BG_EnableSyncByMask(4);

    return;
}

//! FE8U = 0x080C5F84
void Title_ShowBg2(void) {

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    gLCDControlBuffer.bldcnt.effect = 0;

    return;
}

//! FE8U = 0x080C5FB4
void sub_80C5FB4(void) {

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    gLCDControlBuffer.bldcnt.effect = 1;

    return;
}

//! FE8U = 0x080C5FE8
void Title_PrepareMainLogoZoom(void) {

    gLCDControlBuffer.dispcnt.mode = 1;

    SetBackgroundScreenSize(2, 1);

    sub_80C5548(0x40);

    Decompress(gGfx_08AB0134, (void*)0x06008000);
    Decompress(gTsa_08AB0A20, gBG2TilemapBuffer);

    ApplyPalette(gPal_08AB0B24, 0);

    BG_EnableSyncByMask(4);

    CpuFastFill(0x7FFF7FFF, PAL_BG(0xe), 0x40);

    SetBackgroundTileDataOffset(0, 0);
    SetBackgroundMapDataOffset(0, 0x6800);

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    return;
}

//! FE8U = 0x080C6090
void Title_Loop_MainLogoZoom(struct TitleScreenProc* proc) {

    sub_80C5548(Interpolate(1, 32, 256, proc->timer, 16));

    if (proc->timer == 16) {
        proc->timer = 0;
        Proc_Break(proc);
    } else {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C60CC
void sub_80C60CC(void) {
    int i;

    for (i = 0; i <= 3; i++) {
        u8* buf = gGenericBuffer;
        CpuFastFill(0, buf + (i * 0x400), 0x200);
    }

    return;
}

//! FE8U = 0x080C6100
void nullsub_23(int a, int b) {
    return;
}

//! FE8U = 0x080C6104
void sub_80C6104(struct TitleScreenProc* proc) {

    SetBlendConfig(1, 0x10, 0x10, 0);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 0, 0, 0);

    proc->unk_30 = 0;

    sub_80C60CC();

    return;
}

s8 CONST_DATA gUnknown_08AA682C[] = {
    0x68, 0xC4,
    0x6B, 0xCA,
    0x6E, 0xCF,
    0x70, 0xD5,
    0x72, 0xDB,
    0x74, 0xE1,
    0x75, 0xE7,
    0x77, 0xED,
    0x77, 0xF3,
    0x78, 0xFA,
    0x78, 0x00,
    0x78, 0x06,
    0x77, 0x0D,
    0x77, 0x13,
    0x75, 0x19,
    0x74, 0x1F,
    0x72, 0x25,
    0x70, 0x2B,
    0x6E, 0x31,
    0x6B, 0x36,
    0x68, 0x3C,
    0x00, 0x00,
};

struct Unknown08AA6858 {
    /* 00 */ s16 a;
    /* 02 */ s16 b;
    /* 04 */ u8 c;
    /* 05 */ u8 d;
};

struct Unknown08AA6858 CONST_DATA gUnknown_08AA6858[] = {
    { 0x0060, 0x0100, 0x00, 0x00, },
    { 0x00A0, 0x0140, 0x01, 0x01, },
    { 0x0070, 0x0180, 0x02, 0x02, },
    { 0x0080, 0x0120, 0x03, 0x03, },
    { 0x0050, 0x0110, 0x04, 0x00, },
    { 0x0090, 0x0170, 0x05, 0x01, },
    { 0x00C0, 0x0140, 0x06, 0x02, },
    { 0x0060, 0x0130, 0x07, 0x03, },
    { 0x00B0, 0x0100, 0x08, 0x00, },
    { 0x0080, 0x0170, 0x09, 0x01, },
    { 0x0070, 0x0120, 0x0A, 0x02, },
    { 0x0080, 0x0110, 0x0B, 0x03, },
    { 0x0060, 0x0120, 0x0C, 0x00, },
    { 0x00A0, 0x0160, 0x0D, 0x01, },
    { 0x0090, 0x0120, 0x0E, 0x02, },
    { 0x0060, 0x0150, 0x0F, 0x03, },
    { 0x0070, 0x0170, 0x10, 0x00, },
    { 0x00A0, 0x0110, 0x11, 0x01, },
    { 0x00A0, 0x0180, 0x12, 0x02, },
    { 0x0080, 0x0130, 0x13, 0x03, },
    { 0x0070, 0x0120, 0x14, 0x00, },
    { 0x0060, 0x0160, 0x05, 0x01, },
    { 0x0080, 0x0110, 0x06, 0x02, },
    { 0x00A0, 0x0100, 0x07, 0x03, },
    { 0x00C0, 0x0180, 0x08, 0x00, },
    { 0x00B0, 0x0160, 0x09, 0x01, },
    { 0x0080, 0x0130, 0x0A, 0x02, },
    { 0x0060, 0x0150, 0x0B, 0x03, },
    { 0x0080, 0x0120, 0x0C, 0x00, },
    { 0x0070, 0x0140, 0x0D, 0x01, },
    { 0x0090, 0x0180, 0x0E, 0x02, },
    { 0xFFA0, 0xFF00, 0x00, 0x00, },
    { 0xFF60, 0xFEC0, 0x01, 0x01, },
    { 0xFF90, 0xFE80, 0x02, 0x02, },
    { 0xFF80, 0xFEE0, 0x03, 0x03, },
    { 0xFFB0, 0xFEF0, 0x04, 0x00, },
    { 0xFF70, 0xFE90, 0x05, 0x01, },
    { 0xFF40, 0xFEC0, 0x06, 0x02, },
    { 0xFFA0, 0xFED0, 0x07, 0x03, },
    { 0xFF50, 0xFF00, 0x08, 0x00, },
    { 0xFF80, 0xFE90, 0x09, 0x01, },
    { 0xFF90, 0xFEE0, 0x0A, 0x02, },
    { 0xFF80, 0xFEF0, 0x0B, 0x03, },
    { 0xFFA0, 0xFEE0, 0x0C, 0x00, },
    { 0xFF60, 0xFEA0, 0x0D, 0x01, },
    { 0xFF70, 0xFEE0, 0x0E, 0x02, },
    { 0xFFA0, 0xFEB0, 0x0F, 0x03, },
    { 0xFF90, 0xFE90, 0x10, 0x00, },
    { 0xFF60, 0xFEF0, 0x11, 0x01, },
    { 0xFF60, 0xFE80, 0x12, 0x02, },
    { 0xFF80, 0xFED0, 0x13, 0x03, },
    { 0xFF90, 0xFEE0, 0x14, 0x00, },
    { 0xFFA0, 0xFEA0, 0x05, 0x01, },
    { 0xFF80, 0xFEF0, 0x06, 0x02, },
    { 0xFF60, 0xFF00, 0x07, 0x03, },
    { 0xFF40, 0xFE80, 0x08, 0x00, },
    { 0xFF50, 0xFEA0, 0x09, 0x01, },
    { 0xFF80, 0xFED0, 0x0A, 0x02, },
    { 0xFFA0, 0xFEB0, 0x0B, 0x03, },
    { 0xFF80, 0xFEE0, 0x0C, 0x00, },
    { 0xFF90, 0xFEC0, 0x0D, 0x01, },
    { 0xFF70, 0xFE80, 0x0E, 0x02, },
    { 0x0000, 0x0000, 0x00, 0x00, },
};

//! FE8U = 0x080C6144
void DrawTitleLightBubbleSprites(int arg) {

    struct Unknown08AA6858* it = gUnknown_08AA6858;

    while (it->a != 0) {
        int m;
        int n;
        int xOam1;
        int yOam0;

        m = gUnknown_08AA682C[it->c * 2 + 0];
        xOam1 = Interpolate(0, (m * it->a) >> 8, (it->b * m) >> 8, arg, 24) + 116;

        n = gUnknown_08AA682C[it->c * 2 + 1];
        yOam0 = Interpolate(0, (n * it->a) >> 8, (it->b * n) >> 8, arg, 24) + 56;

        PutSpriteExt(
            4,
            (xOam1) & 0x01FF,
            ((yOam0) & 0xff) | 0x400,
            gObject_8x8,
            (it->d + 0x2a0) | 0x7400
        );

        it++;
    }

    return;
}

//! FE8U = 0x080C6204
void Title_Loop_LightExplosionFx(struct TitleScreenProc* proc) {

    int res;

    gLCDControlBuffer.blendCoeffA = Interpolate(0, 16, 0, proc->timer, 24);

    res = Interpolate(0, 16, 0, proc->timer, 24);

    ApplyPalette(gPal_TitleMainBackground, 0xE);
    sub_80C69B0(PAL_BG(0xe), 0x7FFF, res);

    ApplyPalette(gPal_TitleDragonForeground, 0xF);
    sub_80C69B0(PAL_BG(0xf), 0x7FFF, res);

    res = Interpolate(0, 0, 63, proc->timer, 24);
    nullsub_23(res, proc->unk_30);
    proc->unk_30 = res;

    PutSpriteExt(1, 16, 85, gSprite_Title_SacredStonesBanner, 0x31A0);

    DrawTitleLightBubbleSprites(proc->timer);

    if (proc->timer == 24) {
        proc->timer = 0;
        Proc_Break(proc);
    } else {
        proc->timer++;
    }

    return;
}

//! FE8U = 0x080C62DC
void sub_80C62DC(struct TitleScreenProc* proc) {

    gLCDControlBuffer.dispcnt.mode = 0;

    SetBackgroundScreenSize(2, 0);

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    Proc_Start(gProcScr_DrawTitleSprites, proc);

    SetBlendConfig(1, 8, 8, 0);

    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(1, 1, 0, 0, 0);

    return;
}

//! FE8U = 0x080C6354
void Title_IDLE(struct TitleScreenProc * proc)
{
    proc->timer_idle++;
    proc->timer = (++proc->timer & 0x3f);

    if (gKeyStatusPtr->newKeys & (A_BUTTON | START_BUTTON))
    {
        PlaySoundEffect(0x6D);
        SetNextGameActionId(GAME_ACTION_EVENT_RETURN);
        Proc_Break(proc);
    }
    else
    {
        if (proc->timer_idle == 815)
        {
            SetNextGameActionId(GAME_ACTION_CLASS_REEL);
            Proc_Break(proc);
        }
    }
}

//! FE8U = 0x080C63C4
void Title_EndAllProcChildren(ProcPtr proc) {
    EndAllProcChildren(proc);

    return;
}

//! FE8U = 0x080C63D0
void Title_RestartProc(struct TitleScreenProc* proc) {

    EndAllProcChildren(proc);

    Title_EndSkipFxListener();

    gPaletteBuffer[PAL_BACKDROP_OFFSET] = 0;

    EnablePaletteSync();

    proc->mode = 0;

    gLCDControlBuffer.dispcnt.bg0_on = 0;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    StartBgmExt(0x43, 0, 0);

    return;
}

struct ProcCmd CONST_DATA gProcScr_TitleScreen[] = {
PROC_LABEL(4),
    PROC_YIELD,

    PROC_CALL(Title_Init),

    PROC_REPEAT(Title_SetupMainGraphics),

    PROC_CALL(TitleScreenTryJumpIntroAnim),

    PROC_CALL(sub_80C5870),
    PROC_CALL(FadeInBlackSpeed20),

    PROC_YIELD,
    PROC_GOTO(1),

PROC_LABEL(0),
    /* Intro anim */
    PROC_YIELD,

    PROC_CALL(Title_StartSkipFxListener),
    PROC_REPEAT(Title_SetupSpecialEffectGraphics),
    PROC_CALL(sub_80C5A44),
    PROC_REPEAT(Title_Loop_DrawRotatingBlueLights),
    PROC_CALL(sub_80C5BD4),
    PROC_REPEAT(Title_Loop_DrawRedBlueOrbs),
    PROC_CALL(Title_PrepareMainScreenWithExtendedBgm),
    PROC_REPEAT(Title_Loop_RevealGreenDragonFlashFx),
    PROC_REPEAT(Title_Loop_FlashFxExpand),
    PROC_YIELD,

    PROC_CALL(Title_LoadDemonKingOnBg2),
    PROC_SLEEP(8),

    PROC_CALL(Title_ShowBg2),
    PROC_SLEEP(2),

    PROC_CALL(sub_80C5FB4),
    PROC_SLEEP(8),

    PROC_CALL(Title_EndSkipFxListener),

    PROC_CALL(Title_PrepareMainLogoZoom),
    PROC_REPEAT(Title_Loop_MainLogoZoom),

    PROC_CALL(sub_80C6104),
    PROC_REPEAT(Title_Loop_LightExplosionFx),

    PROC_CALL(sub_80C62DC),

    // fallthrough

PROC_LABEL(1),
    /* IDLE */
    PROC_REPEAT(Title_IDLE),

    // fallthrough

PROC_LABEL(2),
    PROC_CALL(sub_8013F40),
    PROC_YIELD,
    PROC_CALL(Title_EndAllProcChildren),
    PROC_GOTO(5),

PROC_LABEL(3),
    PROC_CALL(Title_RestartProc),
    PROC_GOTO(4),

PROC_LABEL(5),
    PROC_END,

};

//! FE8U = 0x080C6424
void StartTitleScreen_WithMusic(ProcPtr parent) {
    struct TitleScreenProc* proc;

    proc = Proc_StartBlocking(gProcScr_TitleScreen, parent);
    proc->mode = 0;

    StartBgmExt(0x43, 0, 0);
}

//! FE8U = 0x080C6444
void StartTitleScreen_FlagFalse(ProcPtr parent) {
    struct TitleScreenProc* proc;

    proc = Proc_StartBlocking(gProcScr_TitleScreen, parent);
    proc->mode = 0;
}

//! FE8U = 0x080C645C
void StartTitleScreen_FlagTrue(ProcPtr parent) {
    struct TitleScreenProc* proc;

    proc = Proc_StartBlocking(gProcScr_TitleScreen, parent);
    proc->mode = 1;
}
