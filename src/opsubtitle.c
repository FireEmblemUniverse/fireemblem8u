#include "global.h"

#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "efxbattle.h"
#include "bmlib.h"
#include "spline.h"
#include "sysutil.h"

#include "constants/songs.h"

/*
The opening monologue that introduces the Sacred Stones / associated lore.
*/

struct OpSubtitleProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ s8 index;
    /* 2A */ s16 timer_2a;
    /* 2C */ s16 timer_2c;

    /* 2E */ u8 pad[0x4c-0x2e];

    /* 4C */ s16 unk_4c;
    /* 4E */ s16 unk_4e;
};

struct OpSubtitleEnt {
    void* gfx;
    void* tsa;
    int timer;
};

const struct OpSubtitleEnt gOpSubtitleGfxLut[] = {
    {
        /*
        "In an age long past...
        evil flooded over the land.
        Creatures awash in the dark
        tide ran wild, pushing mankind
        to the brink of annihilation."
        */
        gGfx_OpSubtitle_00,
        gTsa_OpSubtitle_00,
        335,
    },
    {
        /*
        "In its despair, mankind
        appealed to the heavens, and
        from a blinding light came hope."
        */
        gGfx_OpSubtitle_01,
        gTsa_OpSubtitle_01,
        280,
    },
    {
        /*
        "The Sacred Stones"
        */
        gGfx_OpSubtitle_02,
        gTsa_OpSubtitle_02,
        120,
    },
    {
        /*
        "These five glorious treasures
        held the power to dispel evil."
        */
        gGfx_OpSubtitle_03,
        gTsa_OpSubtitle_03,
        280,
    },
    {
        /*
        "The hero Grado and his warriors
        used the Sacred Stones to combat
        evil's darkness. They defeated
        the Demon King and sealed his
        soul away within the stones."
        */
        gGfx_OpSubtitle_04,
        gTsa_OpSubtitle_04,
        330,
    },
    {
        /*
        "With the darkness imprisoned,
        peace returned to Magvel."
        */
        gGfx_OpSubtitle_05,
        gTsa_OpSubtitle_05,
        300,
    },
    {
        /*
        "But this peace would not last..."
        */
        gGfx_OpSubtitle_06,
        gTsa_OpSubtitle_06,
        250,
    },
};

//! FE8U = 0x080C488C
void OpSubtitle_InitBgFromCommGfx(int bg) {
    int offset = GetBackgroundTileDataOffset(bg);

    Decompress(Img_CommGameBgScreen, (void*)(offset + VRAM));

    CpuFastFill(0, (void*)(offset + 0x06005000), 0x20);

    BG_EnableSyncByMask(1 << bg);

    CpuFastFill(0x08A708A7, PAL_BG(0xE), 0x20);

    EnablePaletteSync();

    return;
}

//! FE8U = 0x080C48F0
void OpSubtitle_FillBgIncrementalTiles(int bg) {
    u16* mapBuf;
    int tmp;
    int i;

    mapBuf = BG_GetMapBuffer(bg);
    tmp = 0xF000;

    for (i = 0; i < 0x280; mapBuf++, i++) {
        *mapBuf = tmp + i;
    }

    return;
}

//! FE8U = 0x080C4918
void OpSubtitle_HandleStartPress(ProcPtr proc) {

    if (gKeyStatusPtr->newKeys & START_BUTTON) {
        Sound_FadeOutBGM(1);
        Proc_Goto(proc, 6);
    }

    return;
}

u16 CONST_DATA gBgConfig_OpSubtitle[] = {
    0x0000, 0x6000, 0,
    0x0000, 0x6800, 0,
    0x8000, 0x7000, 0,
    0x8000, 0x7800, 0,
};

//! FE8U = 0x080C4944
void OpSubtitle_Init(struct OpSubtitleProc* proc) {

    SetupBackgrounds(gBgConfig_OpSubtitle);

    gLCDControlBuffer.dispcnt.mode = 1;

    gLCDControlBuffer.bg0cnt.priority = 3;
    gLCDControlBuffer.bg1cnt.priority = 3;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 3;

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 1;

    gLCDControlBuffer.bg2cnt.screenSize = 1;
    gLCDControlBuffer.bg2cnt.areaOverflowMode = 0;

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    SetBlendConfig(1, 0, 0x10, 0);

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(1, 1, 0, 0, 1);

    Decompress(Img_ChapterIntro_LensFlare, (void*)(GetBackgroundTileDataOffset(2) + VRAM));
    ApplyPalettes(Pal_ChapterIntro_LensFlare, 0, 3);

    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    StartBgm(SONG_PROLOGUE, 0);

    proc->index = 0;
    proc->timer_2a = 60;

    return;
}

//! FE8U = 0x080C4A3C
void Subtitle_LightFlareFx_Init(struct OpSubtitleProc* proc) {
    proc->unk_4c = 0;
    proc->unk_4e = 0;

    BlitU8TileMapData(gBG2TilemapBuffer, Tsa_ChapterIntroLensFlare, 0, 5);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 1;
    gLCDControlBuffer.dispcnt.bg3_on = 0;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    return;
}

//! FE8U = 0x080C4A88
void Subtitle_LightFlareFx_Loop(struct OpSubtitleProc* proc) {
    int a;
    int b;
    int c;
    int d;

    if (proc->unk_4c < 30) {
        a = Interpolate(5, 4, 50, proc->unk_4c, 30);
        b = Interpolate(4, 0, 16, proc->unk_4c, 30);
    } else {
        a = Interpolate(0, 50, 100, proc->unk_4c - 30, 30);
        b = Interpolate(0, 16, 0, proc->unk_4c - 30, 30);
    }

    if (a > 49) {
        a = 100 - a;
    }

    c = Interpolate(0, 0, 214, proc->unk_4c, 60);
    d = Interpolate(0, 16, 128, proc->unk_4c, 60);

    BgAffinRotScaling(2, proc->unk_4e, 0, 0, a * 5 + 0x80, a * 5 + 0x80);
    BgAffinScaling(2, 0x100, 0x100);
    BgAffinAnchoring(2, c, d, 80, 72);

    proc->unk_4e -= 64;

    SetBlendConfig(1, b, 0x10, 0);

    proc->unk_4c++;

    if (proc->unk_4c > 59) {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080C4BA0
void Subtitle_LightFlareFx_End(void) {
    gLCDControlBuffer.dispcnt.bg2_on = 0;

    return;
}

struct ProcCmd CONST_DATA gProcScr_OpSubtitle_LightFlareFx[] = {
    PROC_SLEEP(1),

    PROC_CALL(Subtitle_LightFlareFx_Init),
    PROC_REPEAT(Subtitle_LightFlareFx_Loop),

    PROC_SLEEP(1),

    PROC_CALL(Subtitle_LightFlareFx_End),

    PROC_END,
};

void OpSubtitle_FadePalette(u16* src, u16* dst, int count, int coeff) {
    u16* srcIt;
    u16* dstIt;
    int i;

    if (count <= 0) {
        return;
    }

    dstIt = dst;
    srcIt = src;
    for (i = count; i; i--) {
        int color = (*srcIt);

        s16 r = DivArm(0x1000, (color & 0x1f) * coeff);
        s16 g = DivArm(0x1000, ((color >> 5) & 0x1f) * coeff);
        s16 b = DivArm(0x1000, ((color >> 10) & 0x1f) * coeff);

        *dstIt++ = (u32)r + ((u32)g << 5) + ((u32)b << 10);
        do srcIt++; while (0);
    }
}

//! FE8U = 0x080C4C3C
void OpSubtitle_AwaitTimer2a(struct OpSubtitleProc* proc) {

    proc->timer_2a--;

    if (proc->timer_2a < 1) {
        Proc_Break(proc);
    }

    OpSubtitle_HandleStartPress(proc);

    return;
}

//! FE8U = 0x080C4C60
void OpSubtitle_LoadSlideToBg0(struct OpSubtitleProc* proc) {

    Decompress(gOpSubtitleGfxLut[proc->index].gfx, (void*)0x06001000);

    Decompress(gOpSubtitleGfxLut[proc->index].tsa, gGenericBuffer);

    CallARM_FillTileRect(gBG0TilemapBuffer, gGenericBuffer, 0x3080);

    gLCDControlBuffer.dispcnt.bg0_on = 1;

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    proc->timer_2c = 0;

    return;
}

//! FE8U = 0x080C4CD0
void OpSubtitle_LoadSlideToBg0AndBg1(struct OpSubtitleProc* proc) {

    Decompress(gOpSubtitleGfxLut[proc->index].gfx, (void*)0x06001000);

    Decompress(gOpSubtitleGfxLut[proc->index].tsa, gGenericBuffer);

    CallARM_FillTileRect(gBG0TilemapBuffer, gGenericBuffer, 0x3080);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0xE080);

    gLCDControlBuffer.dispcnt.bg0_on = 1;

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    proc->timer_2c = 0;

    return;
}

//! FE8U = 0x080C4D54
void OpSubtitle_LoadTitleSlide(int index) {

    Decompress(gOpSubtitleGfxLut[index].gfx, (void*)0x06005000);

    Decompress(gOpSubtitleGfxLut[index].tsa, gGenericBuffer);

    CallARM_FillTileRect(gBG0TilemapBuffer, gGenericBuffer, 0x3280);

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}

//! FE8U = 0x080C4DA0
void OpSubtitle_FadeInSlide_Loop(struct OpSubtitleProc* proc) {

    proc->timer_2c++;

    if (proc->timer_2c < 80) {
        int coeff = _DivArm1(proc->timer_2c, 80, 0);

        OpSubtitle_FadePalette(
            gPal_OpSubtitle,
            PAL_BG(3),
            16,
            coeff
        );
    } else {
        ApplyPalette(gPal_OpSubtitle, 3);

        Proc_Break(proc);

        proc->timer_2a = gOpSubtitleGfxLut[proc->index].timer;
        proc->timer_2c = 0;
    }

    EnablePaletteSync();

    OpSubtitle_HandleStartPress(proc);

    return;
}

//! FE8U = 0x080C4E18
void OpSubtitle_FadeOutSlideAndAdvance_Loop(struct OpSubtitleProc* proc) {

    proc->timer_2c++;

    if (proc->timer_2c < 80) {
        int coeff = 0x1000 - _DivArm1(proc->timer_2c, 80, 0);

        OpSubtitle_FadePalette(
            gPal_OpSubtitle,
            PAL_BG(3),
            16,
            coeff
        );
    } else {
        CpuFastFill(0, PAL_BG(3), 0x20);

        proc->timer_2c = 0;

        proc->index++;

        if (proc->index < 2) {
            proc->timer_2a = 80;
            Proc_Break(proc);
        } else {
            gLCDControlBuffer.dispcnt.bg0_on = 0;
            gLCDControlBuffer.dispcnt.bg1_on = 0;
            gLCDControlBuffer.dispcnt.bg2_on = 0;
            gLCDControlBuffer.dispcnt.bg3_on = 0;
            gLCDControlBuffer.dispcnt.obj_on = 0;

            Proc_Goto(proc, 1);
        }
    }

    EnablePaletteSync();

    OpSubtitle_HandleStartPress(proc);

    return;
}

//! FE8U = 0x080C4EC4
void OpSubtitle_FadeOutSlideToTitle_Loop(struct OpSubtitleProc* proc) {

    proc->timer_2c++;

    if (proc->timer_2c < 80) {
        int coeff = 0x1000 - _DivArm1(proc->timer_2c, 80, 0);

        OpSubtitle_FadePalette(
            gPal_OpSubtitle,
            PAL_BG(3),
            16,
            coeff
        );
    } else {
        CpuFastFill(0, PAL_BG(3), 0x20);

        proc->timer_2c = 0;

        proc->index++;

        proc->timer_2a = 90;

        gLCDControlBuffer.dispcnt.bg0_on = 0;
        gLCDControlBuffer.dispcnt.bg1_on = 0;
        gLCDControlBuffer.dispcnt.bg2_on = 1;
        gLCDControlBuffer.dispcnt.bg3_on = 0;
        gLCDControlBuffer.dispcnt.obj_on = 0;

        Proc_Break(proc);
    }

    EnablePaletteSync();

    OpSubtitle_HandleStartPress(proc);

    return;
}

//! FE8U = 0x080C4F60
void OpSubtitle_BlendFadeInSlide_Loop(struct OpSubtitleProc* proc) {

    proc->timer_2c++;

    if (proc->timer_2c < 80) {
        int coeff = _DivArm1(proc->timer_2c, 80, 0);
        s16 var = DivArm(0x1000, coeff << 4);

        SetBlendConfig(1, 0x10 - var, var, 0);
    } else {
        SetBlendConfig(1, 0, 0x10, 0);

        if (proc->index < 5) {
            Proc_Break(proc);
            proc->timer_2a = gOpSubtitleGfxLut[proc->index].timer;
            proc->timer_2c = 0;
        } else {
            proc->timer_2a = gOpSubtitleGfxLut[proc->index].timer;
            proc->index++;

            Proc_Goto(proc, 4);
        }
    }

    EnablePaletteSync();

    OpSubtitle_HandleStartPress(proc);

    return;
}

//! FE8U = 0x080C501C
void OpSubtitle_BlendFadeOutSlide_Loop(struct OpSubtitleProc* proc) {

    proc->timer_2c++;

    if (proc->timer_2c < 80) {
        int coeff = _DivArm1(proc->timer_2c, 80, 0);
        s16 var = DivArm(0x1000, (0x1000 - coeff) << 4);

        SetBlendConfig(1, 0x10 - var, var, 0);
    } else {
        SetBlendConfig(1, 0x10, 0, 0);

        proc->timer_2c = 0;
        proc->index++;
        proc->timer_2a = 80;

        Proc_Break(proc);

        OpSubtitle_HandleStartPress(proc);
    }

    EnablePaletteSync();

    OpSubtitle_HandleStartPress(proc);

    return;
}

//! FE8U = 0x080C50A0
void OpSubtitle_SetupScrollTextBgs(struct OpSubtitleProc* proc) {
    OpSubtitle_InitBgFromCommGfx(1);

    CpuFastFill(0, PAL_BG(0xF), 0x20);

    OpSubtitle_FillBgIncrementalTiles(1);

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    CpuFastFill(0, (void*)0x06005000, 0x1000);

    BG_Fill(gBG0TilemapBuffer, 0x280);

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    proc->timer_2a = 22;
    proc->timer_2c = 0;

    return;
}

//! FE8U = 0x080C5104
void OpSubtitle_FadeInScrollTextPal_Loop(struct OpSubtitleProc* proc) {

    if (proc->timer_2c == 0) {
        gLCDControlBuffer.dispcnt.bg0_on = 1;
        gLCDControlBuffer.dispcnt.bg1_on = 1;
        gLCDControlBuffer.dispcnt.bg2_on = 1;
        gLCDControlBuffer.dispcnt.bg3_on = 0;
        gLCDControlBuffer.dispcnt.obj_on = 0;
    }

    proc->timer_2c++;

    if (proc->timer_2c < 46) {
        int coeff = _DivArm1(proc->timer_2c, 46, 0);

        OpSubtitle_FadePalette(
            Pal_OpSubtitleScrollText,
            PAL_BG(0xF),
            16,
            coeff
        );
    } else {
        ApplyPalette(Pal_OpSubtitleScrollText, 0xF);

        Proc_Break(proc);

        proc->timer_2a = gOpSubtitleGfxLut[proc->index].timer;
        proc->timer_2c = 0;
    }

    EnablePaletteSync();

    OpSubtitle_HandleStartPress(proc);

    return;
}

//! FE8U = 0x080C51A8
void OpSubtitle_ReloadTitleSlide(void) {
    OpSubtitle_LoadTitleSlide(2);

    ApplyPalette(gPal_OpSubtitle, 3);
    EnablePaletteSync();

    return;
}

struct ProcCmd CONST_DATA gProcScr_Opsubtitle_0[] = {
    PROC_SLEEP(0),

    PROC_SLEEP(36),

    PROC_CALL(OpSubtitle_ReloadTitleSlide),

    PROC_END,
};

u16 CONST_DATA gOpsubtitle_0[] = {
    0x0000, 0x6000, 0,
    0x0000, 0x6800, 0,
    0x0000, 0x7000, 0,
    0x8000, 0x7800, 0,
};

//! FE8U = 0x080C51C8
void OpSubtitle_SetupBackgrounds(void) {
    int bg;
    u16* bgConfig;

    memset(&gLCDControlBuffer.bg0cnt, 0, 2);
    memset(&gLCDControlBuffer.bg1cnt, 0, 2);
    memset(&gLCDControlBuffer.bg2cnt, 0, 2);
    memset(&gLCDControlBuffer.bg3cnt, 0, 2);

    bgConfig = gOpsubtitle_0;

    for (bg = 0; bg < 4; bg++) {
        SetBackgroundTileDataOffset(bg, *bgConfig++);
        SetBackgroundMapDataOffset(bg, *bgConfig++);
        SetBackgroundScreenSize(bg, *bgConfig++);

        BG_SetPosition(bg, 0, 0);
    }

    return;
}

//! FE8U = 0x080C5218
void OpSubtitle_SetupTitleBgs(struct OpSubtitleProc* proc) {
    OpSubtitle_SetupBackgrounds();

    gLCDControlBuffer.dispcnt.mode = 0;

    gLCDControlBuffer.bg0cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 3;
    gLCDControlBuffer.bg3cnt.priority = 0;

    SetBlendConfig(1, 0, 0x10, 0);

    SetBlendTargetA(0, 0, 0, 1, 0);
    SetBlendTargetB(1, 1, 0, 0, 0);

    SetBlendBackdropA(0);
    SetBlendBackdropB(0);

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, -3, -3);
    BG_SetPosition(2, 0, 0);
    BG_SetPosition(3, 0, 0);

    OpSubtitle_InitBgFromCommGfx(3);
    OpSubtitle_FillBgIncrementalTiles(3);

    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    OpSubtitle_LoadTitleSlide(2);

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 0;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 1;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    proc->index = 2;
    proc->timer_2a = 120;

    return;
}

//! FE8U = 0x080C5328
void OpSubtitle_ClearTileAndDisableTitleBg2(void) {
    CpuFastFill(0, (void*)VRAM, 0x20);

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    gLCDControlBuffer.dispcnt.bg0_on = 1;
    gLCDControlBuffer.dispcnt.bg1_on = 1;
    gLCDControlBuffer.dispcnt.bg2_on = 0;
    gLCDControlBuffer.dispcnt.bg3_on = 1;
    gLCDControlBuffer.dispcnt.obj_on = 0;

    return;
}

//! FE8U = 0x080C5370
void OpSubtitle_BackupPalette(struct OpSubtitleProc* proc) {
    proc->timer_2c = 0;
    CpuFastCopy(gPaletteBuffer, gUnk_OpSubtitle_0, 0x200);

    return;
}

//! FE8U = 0x080C538C
void OpSubtitle_FadeOutWholePalette_Loop(struct OpSubtitleProc* proc) {

    proc->timer_2c++;

    if (proc->timer_2c < 60) {
        int coeff = 0x1000 - _DivArm1(proc->timer_2c, 60, 0);

        OpSubtitle_FadePalette(
            gUnk_OpSubtitle_0,
            gPaletteBuffer,
            0x200,
            coeff
        );
    } else {
        CpuFastFill(0, gPaletteBuffer, 0x200);

        proc->timer_2c = 0;
        proc->timer_2a = 60;

        Proc_Break(proc);
    }

    EnablePaletteSync();

    OpSubtitle_HandleStartPress(proc);

    return;
}

//! FE8U = 0x080C5400
void OpSubtitle_FadeOutBgm(void) {
    Sound_FadeOutBGM(4);

    return;
}

//! FE8U = 0x080C540C
void OpSubtitle_ResetBg1Position(void) {
    BG_SetPosition(1, 0, 0);

    return;
}

struct ProcCmd CONST_DATA gProcScr_OpSubtitle[] = {
    PROC_SLEEP(0),

    PROC_CALL(OpSubtitle_Init),

    PROC_SLEEP(1),

    PROC_CALL_ARG(NewFadeIn, 2),
    PROC_WHILE(FadeInExists),

    PROC_REPEAT(OpSubtitle_AwaitTimer2a),

PROC_LABEL(0), // loop used for the first two "slides"
    PROC_CALL(OpSubtitle_LoadSlideToBg0),
    PROC_REPEAT(OpSubtitle_FadeInSlide_Loop),
    PROC_REPEAT(OpSubtitle_AwaitTimer2a),

    PROC_REPEAT(OpSubtitle_FadeOutSlideAndAdvance_Loop),
    PROC_REPEAT(OpSubtitle_AwaitTimer2a),

    PROC_GOTO(0),

PROC_LABEL(1),
    PROC_START_CHILD(gProcScr_OpSubtitle_LightFlareFx),
    PROC_START_CHILD(gProcScr_Opsubtitle_0),

    PROC_CALL(OpSubtitle_SetupScrollTextBgs),
    PROC_REPEAT(OpSubtitle_AwaitTimer2a),

    PROC_REPEAT(OpSubtitle_FadeInScrollTextPal_Loop),
    PROC_CALL(OpSubtitle_SetupTitleBgs),
    PROC_REPEAT(OpSubtitle_AwaitTimer2a),

    PROC_REPEAT(OpSubtitle_BlendFadeOutSlide_Loop),
    PROC_REPEAT(OpSubtitle_AwaitTimer2a),

    PROC_CALL(OpSubtitle_ClearTileAndDisableTitleBg2),

    // fallthrough

PROC_LABEL(2),
    PROC_CALL(OpSubtitle_LoadSlideToBg0AndBg1),
    PROC_REPEAT(OpSubtitle_BlendFadeInSlide_Loop),
    PROC_REPEAT(OpSubtitle_AwaitTimer2a),

    PROC_REPEAT(OpSubtitle_BlendFadeOutSlide_Loop),
    PROC_REPEAT(OpSubtitle_AwaitTimer2a),

    PROC_GOTO(2),

PROC_LABEL(4),
    PROC_REPEAT(OpSubtitle_AwaitTimer2a),

    PROC_CALL(OpSubtitle_BackupPalette),
    PROC_REPEAT(OpSubtitle_FadeOutWholePalette_Loop),
    PROC_REPEAT(OpSubtitle_AwaitTimer2a),

    PROC_CALL(OpSubtitle_LoadSlideToBg0),
    PROC_REPEAT(OpSubtitle_FadeInSlide_Loop),
    PROC_REPEAT(OpSubtitle_AwaitTimer2a),

    PROC_REPEAT(OpSubtitle_FadeOutSlideToTitle_Loop),
    PROC_REPEAT(OpSubtitle_AwaitTimer2a),

    // fallthrough

PROC_LABEL(5),
    PROC_END_EACH(gProcScr_OpSubtitle_LightFlareFx),
    PROC_END_EACH(gProcScr_Opsubtitle_0),

    PROC_CALL(OpSubtitle_FadeOutBgm),

    PROC_CALL(StartSlowFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_SLEEP(30),

    PROC_GOTO(7),

PROC_LABEL(6), // ended due to Start Button press
    PROC_END_EACH(gProcScr_OpSubtitle_LightFlareFx),
    PROC_END_EACH(gProcScr_Opsubtitle_0),

    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),

    PROC_SLEEP(10),

    PROC_GOTO(7),

PROC_LABEL(7),
    PROC_CALL(OpSubtitle_ResetBg1Position),

    PROC_SLEEP(1),

    PROC_END,
};

//! FE8U = 0x080C541C
void StartIntroMonologue(ProcPtr proc) {
    Proc_StartBlocking(gProcScr_OpSubtitle, proc);

    return;
}
