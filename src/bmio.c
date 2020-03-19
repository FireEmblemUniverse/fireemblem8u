#include "global.h"

#include <string.h>

#include "constants/classes.h"

#include "proc.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "chapterdata.h"
#include "rng.h"
#include "ctc.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmbattle.h"
#include "bmtrick.h"
#include "mu.h"
#include "uimenu.h"

#include "bmio.h"

// General Battle Map System Stuff, mostly low level hardware stuff but also more

// TODO: move to where appropriate
extern const struct ProcCmd gProc_BMapMain[]; // gProc_BMapMain

struct WeatherParticle {
    /* 00 */ short xPosition;
    /* 02 */ short yPosition;

    /* 04 */ short xSpeed;
    /* 06 */ short ySpeed;

    /* 08 */ u8  gfxIndex;
    /* 09 */ u8  typeId;
};

union WeatherEffectData {
    /**
     * Array of weather particles
     */
    struct WeatherParticle particles[0x40];

    /**
     * Buffer for cloud graphics
     */
    u32 gfxData[0xC0];
};

union GradientEffectData {
    /**
     * Buffer holding colors for vertical gradient.
     */
    u16 lines[320];

    /**
     * Buffer holding 8 different variations of the tileset palette
     * Variations have increasing amounts of red; used for flames weather effect
     */
    u16 fireGradient[8][0x40];
};

struct BMVSyncProc {
    PROC_HEADER;

    /* 2C */ const struct TileGfxAnim* tileGfxAnimStart;
    /* 30 */ const struct TileGfxAnim* tileGfxAnimCurrent;

    /* 34 */ short tileGfxAnimClock;
    /* 36 */ short tilePalAnimClock;

    /* 38 */ const struct TilePalAnim* tilePalAnimStart;
    /* 3C */ const struct TilePalAnim* tilePalAnimCurrent;
};

static void BMapVSync_UpdateMapImgAnimations(struct BMVSyncProc* proc);
static void BMapVSync_UpdateMapPalAnimations(struct BMVSyncProc* proc);
static void BMapVSync_InitMapAnimations(struct BMVSyncProc* proc);
static void BMapVSync_OnEnd(struct BMVSyncProc* proc);
static void BMapVSync_OnLoop(struct BMVSyncProc* proc);

static void WfxNone_Init(void);
static void WfxSnow_Init(void);
static void WfxSnow_VSync(void);
static void WfxRain_Init(void);
static void WfxRain_VSync(void);
static void WfxSandStorm_Init(void);
static void WfxSandStorm_VSync(void);
static void WfxSnowStorm_Init(void);
static void WfxSnowStorm_VSync(void);
static void WfxBlueHSync(void);
static void WfxBlue_Init(void);
static void WfxBlue_VSync(void);
static void WfxFlamesHSync(void);
static void WfxFlamesInitGradient(void);
static void WfxFlamesInitParticles(void);
static void WfxFlames_Init(void);
static void WfxFlamesUpdateGradient(void);
static void WfxFlamesUpdateParticles(void);
static void WfxFlames_VSync(void);
static void WfxCloudsOffsetGraphicsEffect(u32* lines);
static void WfxClouds_Init(void);
static void WfxClouds_VSync(void);
static void WfxClouds_Update(void);
static void WfxInit(void);
static void WfxVSync(void);
static void WfxUpdate(void);

static void ClearBattleMapState(void);
static void InitMoreBMapGraphics(void);

// TODO: figure out if those variables should really belong to EWRAM_DATA
static EWRAM_DATA union WeatherEffectData sWeatherEffect = {};
static EWRAM_DATA union GradientEffectData sGradientEffect = {};

static CONST_DATA struct ProcCmd sProc_BMVSync[] = { // gProc_VBlankHandler
    PROC_MARK(PROC_MARK_1),
    PROC_SET_END_CB(BMapVSync_OnEnd),

    PROC_SLEEP(0),

PROC_LABEL(0),
    PROC_CALL(BMapVSync_UpdateMapImgAnimations),
    PROC_CALL(BMapVSync_UpdateMapPalAnimations),

    PROC_CALL(SMS_FlushDirect),
    PROC_CALL(WfxVSync),

    PROC_REPEAT(BMapVSync_OnLoop),

    PROC_END
};

CONST_DATA struct ProcCmd gProc_MapTask[] = { // gProc_MapTask
    PROC_NAME("MAPTASK"),
    PROC_END_DUPLICATES,
    PROC_MARK(PROC_MARK_1),

    PROC_SLEEP(0),

PROC_LABEL(0),
    PROC_CALL(SMS_DisplayAllFromInfoStructs),
    PROC_CALL(WfxUpdate),
    PROC_CALL(UpdateBmMapDisplay),

    PROC_SLEEP(0),
    PROC_GOTO(0)
};

// TODO: better repr?
static CONST_DATA u16 sObj_RainParticle1[] = {
    1, 0x0000, 0x0000, 0x102A
};

// TODO: better repr?
static CONST_DATA u16 sObj_RainParticle2[] = {
    1, 0x8000, 0x0000, 0x100A
};

static CONST_DATA u16* sRainParticleObjLookup[3] = { // Weather particle Obj Data Lookup
    sObj_RainParticle1, sObj_RainParticle2, sObj_RainParticle2
};

// TODO: better repr?
static CONST_DATA u16 sObj_BackgroundClouds[] = { // Obj Data
    18,

    0x4000, 0xC000, 0,
    0x4000, 0xC030, 6,
    0x4000, 0xC070, 0,
    0x4000, 0xC0A0, 6,
    0x8000, 0x80E0, 0,
    0x0020, 0x8000, 10,
    0x4020, 0xC020, 0,
    0x4020, 0xC050, 6,
    0x4020, 0xC090, 0,
    0x4020, 0xC0C0, 6,
    0x4040, 0xC000, 0,
    0x4040, 0xC0B0, 0,
    0x4060, 0xC000, 4,
    0x4060, 0xC0B0, 4,
    0x4080, 0xC000, 0,
    0x4080, 0xC0B0, 0,
    0x40A0, 0xC000, 0,
    0x40A0, 0xC0B0, 0,
};

static CONST_DATA struct ProcCmd sProc_DelayedBMapDispResume[] = { // gProc_GameGfxUnblocker
    PROC_SLEEP(0),

    PROC_CALL(BMapDispResume),
    PROC_END
};

/**
 * Each 3 array entries represent one config template
 * First two values are initial speed, third is type id
 * Used for the "slower" weathers (regular snow, rain & flames)
 */
static const u16 sInitialParticleConfigTemplates[] = {
    0xB0,  0xC0,  0,
    0xB0,  0xD0,  0,
    0xB0,  0xE0,  0,
    0xB0,  0xF0,  0,
    0xB0,  0x100, 0,
    0xB0,  0x110, 0,

    0xF0,  0x140, 1,
    0xF0,  0x150, 1,
    0xF0,  0x160, 1,
    0xF0,  0x170, 1,
    0xF0,  0x180, 1,
    0xF0,  0x190, 1,
    0xF0,  0x1A0, 1,

    0x100, 0x200, 2,
    0xF0,  0x220, 2,
    0xE0,  0x240, 2,
};

void BMapVSync_UpdateMapImgAnimations(struct BMVSyncProc* proc) {
    if (!proc->tileGfxAnimStart)
        return;

    if (proc->tileGfxAnimClock) {
        proc->tileGfxAnimClock--;
        return;
    }

    proc->tileGfxAnimClock = proc->tileGfxAnimCurrent->time;

    CpuFastCopy(
        proc->tileGfxAnimCurrent->data,
        BG_TILE_ADDR(0x140),
        proc->tileGfxAnimCurrent->size
    );

    if ((++proc->tileGfxAnimCurrent)->time == 0)
        proc->tileGfxAnimCurrent = proc->tileGfxAnimStart;
}

void BMapVSync_UpdateMapPalAnimations(struct BMVSyncProc* proc) {
    if (!proc->tilePalAnimStart)
        return;

    if (proc->tilePalAnimClock) {
        proc->tilePalAnimClock--;
        return;
    }

    proc->tilePalAnimClock = proc->tilePalAnimCurrent->time;

    CpuCopy16(
        proc->tilePalAnimCurrent->data,
        proc->tilePalAnimCurrent->colorStart + (0x10 * BM_BGPAL_6) + gPaletteBuffer,
        proc->tilePalAnimCurrent->colorCount*2
    );

    EnablePaletteSync();

    if ((++proc->tilePalAnimCurrent)->time == 0)
        proc->tilePalAnimCurrent = proc->tilePalAnimStart;
}

void BMapVSync_InitMapAnimations(struct BMVSyncProc* proc) {
    proc->tileGfxAnimClock = 0;
    proc->tilePalAnimClock = 0;

    proc->tileGfxAnimStart = proc->tileGfxAnimCurrent =
        gChapterDataAssetTable[GetROMChapterStruct(gRAMChapterData.chapterIndex)->mapTileAnim1Id];

    proc->tilePalAnimStart = proc->tilePalAnimCurrent =
        gChapterDataAssetTable[GetROMChapterStruct(gRAMChapterData.chapterIndex)->mapTileAnim2Id];
}

void BMapVSync_OnEnd(struct BMVSyncProc* proc) {
    SetSecondaryHBlankHandler(NULL);
}

void BMapVSync_OnLoop(struct BMVSyncProc* proc) {
    Proc_Goto(proc, 0);
}

void BMapVSync_Start(void) {
    BMapVSync_InitMapAnimations(
        Proc_Start(sProc_BMVSync, PROC_TREE_VSYNC));

    WfxInit();
    gUnknown_0202BCB0.gameGfxSemaphore = 0;
}

void BMapVSync_End(void) {
    Proc_EndEach(sProc_BMVSync);
}

void BMapDispSuspend(void) {
    if (++gUnknown_0202BCB0.gameGfxSemaphore > 1)
        return; // gfx was already blocked, nothing needs to be done.

    SetSecondaryHBlankHandler(NULL);
    gPaletteBuffer[0] = 0;
    EnablePaletteSync();
    Proc_BlockEachMarked(1);
}

void BMapDispResume(void) {
    struct Proc* proc;

    if (!gUnknown_0202BCB0.gameGfxSemaphore)
        return; // wasn't blocked

    if (--gUnknown_0202BCB0.gameGfxSemaphore)
        return; // still blocked

    Proc_UnblockEachMarked(1);

    proc = Proc_Find(sProc_BMVSync);

    if (proc) {
        // restart vblank proc
        Proc_End(proc);
        BMapVSync_Start();
    }
}

void AllocWeatherParticles(unsigned weatherId) {
    switch (weatherId) {

    case WEATHER_SNOW:
    case WEATHER_SNOWSTORM:
    case WEATHER_RAIN:
    case WEATHER_SANDSTORM:
        SetupOAMBufferSplice(0x20);
        break;

    case WEATHER_FLAMES:
        SetupOAMBufferSplice(0x10);
        break;

    default:
        SetupOAMBufferSplice(0);
        break;

    } // switch (weatherId)
}

void WfxNone_Init(void) {
    AllocWeatherParticles(gRAMChapterData.chapterWeatherId);
    SetSecondaryHBlankHandler(NULL);
}

void WfxSnow_Init(void) {
    int i;

    int gfxTileIndices[] = {
        0x29,
        0x09,
        0x08
    };

    AllocWeatherParticles(gRAMChapterData.chapterWeatherId);

    for (i = 0; i < 0x40; ++i) {
        unsigned templateIndex = (i & 0xF) * 3;

        sWeatherEffect.particles[i].xPosition = AdvanceGetLCGRNValue();
        sWeatherEffect.particles[i].yPosition = AdvanceGetLCGRNValue();

        sWeatherEffect.particles[i].xSpeed = sInitialParticleConfigTemplates[templateIndex + 0] * 2;
        sWeatherEffect.particles[i].ySpeed = sInitialParticleConfigTemplates[templateIndex + 1] * 2;
        sWeatherEffect.particles[i].typeId = sInitialParticleConfigTemplates[templateIndex + 2];

        sWeatherEffect.particles[i].gfxIndex = gfxTileIndices[sInitialParticleConfigTemplates[templateIndex + 2]];
    }
}

void WfxSnow_VSync(void) {
    if (GetPrimaryOAMSize()) {
        struct { short x, y; } origins[3];
        int i;

        struct WeatherParticle* it = sWeatherEffect.particles + ((GetGameClock() % 2) * 0x20);

        origins[0].x = (gUnknown_0202BCB0.camera.x * 12) / 16;
        origins[0].y = gUnknown_0202BCB0.camera.y;

        origins[1].x = gUnknown_0202BCB0.camera.x;
        origins[1].y = gUnknown_0202BCB0.camera.y;

        origins[2].x = (gUnknown_0202BCB0.camera.x * 20) / 16;
        origins[2].y = gUnknown_0202BCB0.camera.y;

        for (i = 0; i < 0x20; ++i) {
            it->xPosition += it->xSpeed;
            it->yPosition += it->ySpeed;

            CallARM_PushToPrimaryOAM(
                ((it->xPosition >> 8) - origins[it->typeId].x) & 0xFF,
                ((it->yPosition >> 8) - origins[it->typeId].y) & 0xFF,
                gObject_8x8,
                (BM_OBJPAL_1 << 12) + it->gfxIndex
            );

            ++it;
        }
    }
}

void WfxRain_Init(void) {
    int i;

    AllocWeatherParticles(gRAMChapterData.chapterWeatherId);

    for (i = 0; i < 0x40; ++i) {
        unsigned templateIndex = (i & 0xF) * 3;

        sWeatherEffect.particles[i].xPosition = AdvanceGetLCGRNValue();
        sWeatherEffect.particles[i].yPosition = AdvanceGetLCGRNValue();

        sWeatherEffect.particles[i].xSpeed   = sInitialParticleConfigTemplates[templateIndex + 0] * 6;
        sWeatherEffect.particles[i].ySpeed   = sInitialParticleConfigTemplates[templateIndex + 1] * 16;
        sWeatherEffect.particles[i].gfxIndex = sInitialParticleConfigTemplates[templateIndex + 2];
    }
}

void WfxRain_VSync(void) {
    if (GetPrimaryOAMSize()) {
        int i;

        struct WeatherParticle* it = sWeatherEffect.particles + ((GetGameClock() % 2) * 0x20);

        for (i = 0; i < 0x20; ++i) {
            it->xPosition += it->xSpeed;
            it->yPosition += it->ySpeed;

            CallARM_PushToPrimaryOAM(
                ((it->xPosition >> 8) - gUnknown_0202BCB0.camera.x) & 0xFF,
                ((it->yPosition >> 8) - gUnknown_0202BCB0.camera.y) & 0xFF,
                sRainParticleObjLookup[it->gfxIndex],
                0
            );

            ++it;
        }
    }
}

void WfxSandStorm_Init(void) {
    int i;

    AllocWeatherParticles(gRAMChapterData.chapterWeatherId);

    CopyDataWithPossibleUncomp(gUnknown_085A3964, gUnknown_02020188);
    CopyTileGfxForObj(gUnknown_02020188, OBJ_VRAM0 + 0x1C * 0x20, 4, 4);

    for (i = 0; i < 0x40; ++i) {
        sWeatherEffect.particles[i].xPosition = AdvanceGetLCGRNValue();
        sWeatherEffect.particles[i].yPosition = (AdvanceGetLCGRNValue() % 160 + 240) & 0xFF;

        sWeatherEffect.particles[i].xSpeed = (AdvanceGetLCGRNValue() & 0x7) - 32;
        sWeatherEffect.particles[i].ySpeed = 0;
    }
}

void WfxSandStorm_VSync(void) {
    if (GetPrimaryOAMSize()) {
        int i;

        struct WeatherParticle* it = sWeatherEffect.particles + ((GetGameClock() % 2) * 0x20);

        for (i = 0; i < 0x20; ++i) {
            it->xPosition += it->xSpeed;

            CallARM_PushToPrimaryOAM(
                ((it->xPosition & 0xFF) - 0x10) & 0x1FF,
                it->yPosition,
                gObject_32x32,
                (BM_OBJPAL_1 << 12) + 0x1C
            );

            ++it;
        }
    }
}

void WfxSnowStorm_Init(void) {
    int i;

    u8 typeLookup[] = { 0, 0, 0, 0, 0, 0, 1, 1 };

    AllocWeatherParticles(gRAMChapterData.chapterWeatherId);

    CopyDataWithPossibleUncomp(gUnknown_085A39EC, gUnknown_02020188);
    CopyTileGfxForObj(gUnknown_02020188, OBJ_VRAM0 + 0x18 * 0x20, 8, 4);

    for (i = 0; i < 0x40; ++i) {
        unsigned type = typeLookup[i & 7];

        sWeatherEffect.particles[i].xPosition = AdvanceGetLCGRNValue();
        sWeatherEffect.particles[i].yPosition = AdvanceGetLCGRNValue();

        sWeatherEffect.particles[i].ySpeed    = (AdvanceGetLCGRNValue() & 0x3FF) - 0x100;
        sWeatherEffect.particles[i].gfxIndex  = type;

        switch (type) {

        case 0:
            sWeatherEffect.particles[i].xSpeed = 0x700 + (AdvanceGetLCGRNValue() & 0x1FF);
            break;

        case 1:
            sWeatherEffect.particles[i].xSpeed = 0xA00 + (AdvanceGetLCGRNValue() & 0x1FF);
            break;

        } // switch(type)
    }
}

void WfxSnowStorm_VSync(void) {
    if (GetPrimaryOAMSize()) {
        int i;

        struct WeatherParticle* it = sWeatherEffect.particles + ((GetGameClock() % 2) * 0x20);

        for (i = 0; i < 0x20; ++i) {
            it->xPosition += it->xSpeed;
            it->yPosition += it->ySpeed;

            CallARM_PushToPrimaryOAM(
                ((it->xPosition >> 8) - gUnknown_0202BCB0.camera.x) & 0xFF,
                ((it->yPosition >> 8) - gUnknown_0202BCB0.camera.y) & 0xFF,
                gObject_32x32,
                (BM_OBJPAL_1 << 12) + 0x18 + (it->gfxIndex * 4)
            );

            ++it;
        }

    }
}

void WfxBlueHSync(void) {
    u16 nextLine = (REG_VCOUNT + 1);

    if (nextLine > 160)
        nextLine = 0;

    nextLine += gUnknown_0202BCB0.camera.y / 2;

    if (nextLine >= 320)
        ((u16*)(PLTT))[0] = 0;
    else
        ((u16*)(PLTT))[0] = nextLine[sGradientEffect.lines];
}

void WfxBlue_Init(void) {
    u16* palIt = sGradientEffect.lines;
    int i = 0;

    void(*handler)(void) = WfxBlueHSync;

    for (; i < 320; ++i)
        *palIt++ = RGB(0, 0, (31 - i / 10));

    SetSecondaryHBlankHandler(handler);
}

void WfxBlue_VSync(void) {}

void WfxFlamesHSync(void) {
    const u16* src;
    u16* dst;

    u16 nextLine = (REG_VCOUNT + 1);

    if (nextLine < 96)
        return;

    if (nextLine >= 160)
        return;

    nextLine -= 96;

    src  = sGradientEffect.fireGradient[0];
    src += nextLine * 8;

    dst = ((u16*)(PLTT)) + 0x70 + (nextLine % 8) * 8;

    CpuFastCopy(src, dst, 8);
}

void WfxFlamesInitGradientPublic(void) {
    int k, j, i;

    for (i = 0; i < 4; ++i) {
        for (j = 0; j < 0x10; ++j) {
            const int color = gPaletteBuffer[0x10 * (i + BM_BGPAL_TILESET_BASE) + j];

            int r = RED_VALUE(color);
            int g = GREEN_VALUE(color);
            int b = BLUE_VALUE(color);

            for (k = 0; k < 8; ++k) {
                r = r + 2;

                if (r > 31)
                    r = 31;

                sGradientEffect.fireGradient[k][0x10 * i + j] = 
                    (b << 10) + (g << 5) + r;
            }
        }
    }
}

void WfxFlamesInitGradient(void) {
    int i, j, k;

    UnpackChapterMapPalette();

    for (i = 0; i < 4; ++i) {
        for (j = 0; j < 0x10; ++j) {
            const int color = gPaletteBuffer[0x10 * (i + BM_BGPAL_TILESET_BASE) + j];

            int r = RED_VALUE(color);
            int g = GREEN_VALUE(color);
            int b = BLUE_VALUE(color);

            for (k = 0; k < 8; ++k) {
                r = r + 2;

                if (r > 31)
                    r = 31;

                sGradientEffect.fireGradient[k][0x10 * i + j] = 
                    (b << 10) + (g << 5) + r;
            }
        }
    }

    SetSecondaryHBlankHandler(WfxFlamesHSync);
}

void WfxFlamesInitParticles(void) {
    int i;

    AllocWeatherParticles(gRAMChapterData.chapterWeatherId);
    CopyDataWithPossibleUncomp(gUnknown_085A3A84, OBJ_VRAM0 + 0x18 * 0x20);
    CopyToPaletteBuffer(gUnknown_085A3AC0, 0x340, 0x20);

    for (i = 0; i < 0x10; ++i) {
        sWeatherEffect.particles[i].xPosition = AdvanceGetLCGRNValue();
        sWeatherEffect.particles[i].yPosition = AdvanceGetLCGRNValue();

        sWeatherEffect.particles[i].xSpeed = -sInitialParticleConfigTemplates[i*3 + 0];
        sWeatherEffect.particles[i].ySpeed = -sInitialParticleConfigTemplates[i*3 + 1];
    }
}

void WfxFlames_Init(void) {
    WfxFlamesInitGradient();
    WfxFlamesInitParticles();
}

void WfxFlamesUpdateGradient(void) {
    int i, j;

    CpuFastCopy(
        gPaletteBuffer + BM_BGPAL_TILESET_BASE * 0x10,
        ((u16*)(PLTT)) + BM_BGPAL_TILESET_BASE * 0x10,

        0x20 * 4
    );

    for (i = 12; i < 16; ++i) {
        const int color = gPaletteBuffer[(BM_BGPAL_TILESET_BASE + 2) * 0x10 + i];

        int r = RED_VALUE(color);
        int g = GREEN_VALUE(color);
        int b = BLUE_VALUE(color);

        for (j = 0; j < 8; ++j) {
            r = r + 2;

            if (r > 31)
                r = 31;

            sGradientEffect.fireGradient[j][0x10 * 2 + i] = 
                (b << 10) + (g << 5) + r;
        }

    }
}

void WfxFlamesUpdateParticles(void) {
    struct WeatherParticle* it = sWeatherEffect.particles;

    if (GetPrimaryOAMSize()) {
        int i;

        for (i = 0; i < 0x10; ++i, ++it) {
            int yDisplay;
            int objTile;

            it->xPosition += it->xSpeed;
            it->yPosition += it->ySpeed;

            yDisplay = ((it->yPosition >> 8) - gUnknown_0202BCB0.camera.y) & 0xFF;

            if (yDisplay < 0x40)
                continue;

            if (yDisplay > 0xA0)
                continue;

            objTile = 31 - ((yDisplay - 0x40) / 8);

            if (objTile < 24)
                objTile = 24;

            CallARM_PushToPrimaryOAM(
                ((it->xPosition >> 8) - gUnknown_0202BCB0.camera.x) & 0xFF,
                yDisplay,
                gObject_8x8,
                (BM_OBJPAL_10 << 12) + objTile
            );
        }
    }
}

void WfxFlames_VSync(void) {
    WfxFlamesUpdateGradient();
    WfxFlamesUpdateParticles();
}

void WfxCloudsOffsetGraphicsEffect(u32* lines) {
    u32 lineBuf[8];
    int iy, ix;

    // What this function is doing is "shifting" a 14
    // tile wide 4bpp image one pixel to the right(?)

    // Remember: lowest nibble of any gfx data is the leftmost pixel

    // Saving the rightmost tile column for later
    for (iy = 0; iy < 8; ++iy)
        lineBuf[iy] = lines[iy + 0x68];

    // Shift all tiles right one pixel
    for (ix = (14 - 1); ix >= 0; --ix) {
        for (iy = 0; iy < 8; ++iy) {
            lines[(8*(ix - 1)) + iy + 8] =
                (lines[(8*(ix - 1)) + iy + 8] << 4) | (lines[(8*(ix - 1)) + iy] >> 28);
        }
    }

    // the leftmost pixel column now contains garbage
    // but that's only, we're fixing it now
    // this is why we needed the rightmost column to be saved
    for (iy = 0; iy < 8; ++iy) {
        lines[iy] &= ~0xF;
        lines[iy] = (lines[iy]) | (lineBuf[iy] >> 28);
    }
}

void WfxClouds_Init(void) {
    AllocWeatherParticles(WEATHER_NONE);

    CopyDataWithPossibleUncomp(
        gUnknown_085A3B00,
        sWeatherEffect.gfxData
    );

    CopyToPaletteBuffer(
        gUnknown_085A401C,
        ((0x10 + BM_OBJPAL_10) * 0x10 * sizeof(u16)),
        0x10 * sizeof(u16)
    );
}

void WfxClouds_VSync(void) {
    u32* gfx = sWeatherEffect.gfxData;

    switch (GetGameClock() % 8) {

    case 0:
        WfxCloudsOffsetGraphicsEffect(gfx + 0 * (14 * 8));
        break;

    case 2:
        WfxCloudsOffsetGraphicsEffect(gfx + 1 * (14 * 8));
        break;

    case 4:
        WfxCloudsOffsetGraphicsEffect(gfx + 2 * (14 * 8));
        break;

    case 6:
        WfxCloudsOffsetGraphicsEffect(gfx + 3 * (14 * 8));
        break;

    case 7:
        CopyTileGfxForObj(gfx, OBJ_VRAM0 + (0x20 * 18), 14, 4);
        break;

    } // switch (GetGameClock() % 8)
}

void WfxClouds_Update(void) {
    int y = gUnknown_0202BCB0.camera.y;

    PutSprite(
        14,
        0, -(y / 5),
        sObj_BackgroundClouds,
        0xAC12
    );
}

void WfxInit(void) {
    switch (gRAMChapterData.chapterWeatherId) {

    case WEATHER_NONE:
        WfxNone_Init();
        break;

    case WEATHER_SNOW:
        WfxSnow_Init();
        break;

    case WEATHER_SANDSTORM:
        WfxSandStorm_Init();
        break;

    case WEATHER_SNOWSTORM:
        WfxSnowStorm_Init();
        break;

    case WEATHER_RAIN:
        WfxRain_Init();
        break;

    case WEATHER_3:
        WfxBlue_Init();
        break;

    case WEATHER_FLAMES:
        WfxFlames_Init();
        break;

    case WEATHER_CLOUDS:
        WfxClouds_Init();
        break;

    } // switch (gRAMChapterData.chapterWeatherId)
}

void WfxVSync(void) {
    switch (gRAMChapterData.chapterWeatherId) {

    case WEATHER_SNOW:
        WfxSnow_VSync();
        break;

    case WEATHER_SANDSTORM:
        WfxSandStorm_VSync();
        break;

    case WEATHER_SNOWSTORM:
        WfxSnowStorm_VSync();
        break;

    case WEATHER_RAIN:
        WfxRain_VSync();
        break;

    case WEATHER_3:
        WfxBlue_VSync();
        break;

    case WEATHER_FLAMES:
        WfxFlames_VSync();
        break;

    case WEATHER_CLOUDS:
        WfxClouds_VSync();
        break;

    } // switch (gRAMChapterData.chapterWeatherId)
}

void WfxUpdate(void) {
    if (gRAMChapterData.chapterWeatherId == WEATHER_CLOUDS)
        WfxClouds_Update();
}

void DisableMapPaletteAnimations(void) {
    struct BMVSyncProc* proc = Proc_Find(sProc_BMVSync);

    if (proc)
        proc->tilePalAnimStart = NULL;
}

void ResetMapPaletteAnimations(void) {
    struct BMVSyncProc* proc = Proc_Find(sProc_BMVSync);

    if (proc)
        proc->tilePalAnimStart = proc->tilePalAnimCurrent =
            gChapterDataAssetTable[GetROMChapterStruct(gRAMChapterData.chapterIndex)->mapTileAnim2Id];
}

void SetWeather(unsigned weatherId) {
    gRAMChapterData.chapterWeatherId = weatherId;

    AllocWeatherParticles(weatherId);
    WfxInit();
}

u8 GetTextDisplaySpeed(void) {
    u8 speedLookup[4] = { 8, 4, 1, 0 };
    return speedLookup[gRAMChapterData.cfgTextSpeed];
}

int IsFirstPlaythrough(void) {
    if (!sub_80A3870())
        return TRUE;

    if (gRAMChapterData.chapterStateBits & CHAPTER_FLAG_7)
        return FALSE;

    return gRAMChapterData.unk41_5;
}

void InitPlaythroughState(int isDifficult, s8 unk) {
    CpuFill16(0, &gRAMChapterData, sizeof(gRAMChapterData));

    gRAMChapterData.chapterIndex = 0;

    if (isDifficult)
        gRAMChapterData.chapterStateBits |= CHAPTER_FLAG_DIFFICULT;

    // TODO: WHAT ARE THOSE
    gRAMChapterData.unk42_6 = unk;
    gRAMChapterData.unk42_2 = 0;
    gRAMChapterData.unk40_2 = 0;
    gRAMChapterData.unk40_3 = 0;
    gRAMChapterData.unk40_5 = 0;
    gRAMChapterData.cfgTextSpeed = 1; // TODO: (DEFAULT?) TEXT SPEED DEFINITIONS
    gRAMChapterData.unk40_8 = 0;
    gRAMChapterData.unk41_1 = 0;
    gRAMChapterData.unk41_2 = 0;
    gRAMChapterData.cfgWindowColor = 0;
    gRAMChapterData.unk41_7 = 0;
    gRAMChapterData.unk41_8 = 0;
    gRAMChapterData.unk42_4 = 0;
    gRAMChapterData.unk42_8 = 0;
    gRAMChapterData.unk43_2 = 0;
    gRAMChapterData.unk40_1 = 0;
    gRAMChapterData.unk41_5 = 0;
}

void ClearBattleMapState(void) {
    int logicLock = gUnknown_0202BCB0.gameLogicSemaphore;

    CpuFill16(0, &gUnknown_0202BCB0, sizeof(gUnknown_0202BCB0));
    gUnknown_0202BCB0.gameLogicSemaphore = logicLock;
}

void StartBattleMap(struct GameCtrlProc* gameCtrl) {
    int i;

    SetupBackgrounds(NULL);

    SetMainUpdateRoutine(SomeUpdateRoutine);
    SetInterrupt_LCDVBlank(GeneralVBlankHandler);

    ClearBattleMapState();
    sub_80156D4();
    SetupMapSpritesPalettes();
    ClearLocalEvents();
    SMS_ClearUsageTable();
    ResetMenuOverrides();
    ClearTraps();

    gRAMChapterData.chapterPhaseIndex = FACTION_GREEN; // TODO: PHASE/ALLEGIANCE DEFINITIONS
    gRAMChapterData.chapterTurnNumber = 0;

    // TODO: BATTLE MAP/CHAPTER/OBJECTIVE TYPE DEFINITION (STORY/TOWER/SKIRMISH)
    if (GetChapterThing() == 2) {
        if (!(gRAMChapterData.chapterStateBits & CHAPTER_FLAG_PREPSCREEN))
            gRAMChapterData.chapterVisionRange = 3 * (NextRN_100() & 1);
    } else {
        gRAMChapterData.chapterVisionRange =
            GetROMChapterStruct(gRAMChapterData.chapterIndex)->initialFogLevel;
    }

    gRAMChapterData.chapterWeatherId =
        GetROMChapterStruct(gRAMChapterData.chapterIndex)->initialWeather;

    SetupBackgroundForWeatherMaybe();
    InitChapterMap(gRAMChapterData.chapterIndex);
    InitMapObstacles();

    gRAMChapterData.unk4 = GetGameClock();
    gRAMChapterData.chapterTotalSupportGain = 0;

    gRAMChapterData.unk48 = 0;
    gRAMChapterData.unk4A_1 = 0;
    gRAMChapterData.unk4B = 0;
    gRAMChapterData.unk4A_5 = 0;

    for (i = 1; i < 0x40; ++i) {
        struct Unit* unit = GetUnit(i);

        if (unit && unit->pCharacterData) {
            if (unit->state & US_BIT21)
                unit->state = unit->state | US_NOT_DEPLOYED;
            else
                unit->state = unit->state &~ US_NOT_DEPLOYED;
        }
    }

    ClearTemporaryUnits();
    LoadChapterBallistae();

    if (gameCtrl)
        StartBMapMain(gameCtrl);

    // TODO: MACRO?
    gPaletteBuffer[0] = 0;
    EnablePaletteSync();

    sub_8001ED0(TRUE, TRUE, TRUE, TRUE, TRUE);
    sub_8001F48(TRUE);

    SetSpecialColorEffectsParameters(3, 0, 0, 0x10);
}

void RestartBattleMap(void) {
    SetupBackgrounds(NULL);

    SetMainUpdateRoutine(SomeUpdateRoutine);
    SetInterrupt_LCDVBlank(GeneralVBlankHandler);

    sub_80156D4();
    SetupMapSpritesPalettes();
    SMS_ClearUsageTable();

    ClearTraps();

    gRAMChapterData.chapterWeatherId =
        GetROMChapterStruct(gRAMChapterData.chapterIndex)->initialWeather;

    SetupBackgroundForWeatherMaybe();

    InitChapterMap(gRAMChapterData.chapterIndex);

    InitMapObstacles();
    LoadChapterBallistae();
    BMapVSync_End();
    BMapVSync_Start();

    Proc_Start(gProc_MapTask, PROC_TREE_4);

    // TODO: MACRO?
    gPaletteBuffer[0] = 0;
    EnablePaletteSync();

    gLCDControlBuffer.dispcnt.bg0_on = TRUE;
    gLCDControlBuffer.dispcnt.bg1_on = TRUE;
    gLCDControlBuffer.dispcnt.bg2_on = TRUE;
    gLCDControlBuffer.dispcnt.bg3_on = FALSE;
    gLCDControlBuffer.dispcnt.obj_on = FALSE;
}

/**
 * This is called after loading a suspended game
 * To get the game state back to where it was left off
 */
void GameCtrl_StartResumedGame(struct GameCtrlProc* gameCtrl) {
    struct BMapMainProc* mapMain;

    if (gRAMChapterData.chapterIndex == 0x7F) // TODO: CHAPTER_SPECIAL enum?
        sub_80A6C8C();

    SetupBackgrounds(NULL);

    SetMainUpdateRoutine(SomeUpdateRoutine);
    SetInterrupt_LCDVBlank(GeneralVBlankHandler);

    ClearBattleMapState();

    SetCursorMapPosition(
        gRAMChapterData.xCursor,
        gRAMChapterData.yCursor
    );

    LoadGameCoreGfx();
    SetupMapSpritesPalettes();
    SMS_ClearUsageTable();

    InitChapterMap(gRAMChapterData.chapterIndex);

    gUnknown_0202BCB0.unk3C = TRUE;

    mapMain = StartBMapMain(gameCtrl);

    gUnknown_0202BCB0.camera.x = sub_8015A40(16 * gUnknown_0202BCB0.playerCursor.x);
    gUnknown_0202BCB0.camera.y = sub_8015A6C(16 * gUnknown_0202BCB0.playerCursor.y);

    switch (gActionData.suspendPointType) {

    case SUSPEND_POINT_DURINGACTION:
        MapMain_ResumeFromAction(mapMain);
        break;

    case SUSPEND_POINT_PLAYERIDLE:
    case SUSPEND_POINT_CPPHASE:
        MapMain_ResumeFromPhaseIdle(mapMain);
        break;

    case SUSPEND_POINT_BSKPHASE:
        MapMain_ResumeFromBskPhase(mapMain);
        break;

    case SUSPEND_POINT_DURINGARENA:
        MapMain_ResumeFromArenaFight(mapMain);
        break;

    case SUSPEND_POINT_PHASECHANGE:
        MapMain_ResumeFromPhaseChange(mapMain);
        break;

    } // switch (gActionData.suspendPointType)

    sub_8001ED0(TRUE, TRUE, TRUE, TRUE, TRUE);
    sub_8001F48(TRUE);

    SetSpecialColorEffectsParameters(3, 0, 0, 0x10);
}

void RefreshBMapDisplay_FromBattle(void) {
    SetMainUpdateRoutine(SomeUpdateRoutine);
    SetInterrupt_LCDVBlank(GeneralVBlankHandler);

    LoadGameCoreGfx();
    SetupMapSpritesPalettes();

    ClearBg0Bg1();

    gLCDControlBuffer.dispcnt.win0_on = FALSE;
    gLCDControlBuffer.dispcnt.win1_on = FALSE;
    gLCDControlBuffer.dispcnt.objWin_on = FALSE;

    SetDefaultColorEffects();

    RegisterBlankTile(0);
    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(1 << 2); // Enable bg2 sync
}

void BMapDispResume_FromBattleDelayed(void) {
    LoadObjUIGfx();

    MU_Create(&gBattleActor.unit);
    MU_SetDefaultFacing_Auto();

    Proc_Start(sProc_DelayedBMapDispResume, PROC_TREE_3);
}

void InitMoreBMapGraphics(void) {
    UnpackChapterMapGraphics(gRAMChapterData.chapterIndex);
    AllocWeatherParticles(gRAMChapterData.chapterWeatherId);
    RenderBmMap();
    SMS_UpdateFromGameData();
    SetupMapSpritesPalettes();
    SMS_FlushIndirect();
    Font_LoadForUI();
}

void RefreshBMapGraphics(void) {
    SetupBackgrounds(NULL);

    LoadGameCoreGfx();
    InitMoreBMapGraphics();
}

struct BMapMainProc* StartBMapMain(struct GameCtrlProc* gameCtrl) {
    struct BMapMainProc* mapMain = Proc_Start(gProc_BMapMain, PROC_TREE_2);

    mapMain->gameCtrl = gameCtrl;
    gameCtrl->proc_lockCnt++;

    BMapVSync_Start();
    Proc_Start(gProc_MapTask, PROC_TREE_4);

    return mapMain;
}

void EndBMapMain(void) {
    struct BMapMainProc* mapMain;

    Proc_EndEachMarked(PROC_MARK_1);

    mapMain = Proc_Find(gProc_BMapMain);
    mapMain->gameCtrl->proc_lockCnt--;

    Proc_End(mapMain);
}

void ChapterChangeUnitCleanup(void) {
    int i, j;

    // Clear phantoms
    for (i = 1; i < 0x40; ++i) {
        struct Unit* unit = GetUnit(i);

        if (unit && unit->pCharacterData)
            if (UNIT_IS_PHANTOM(unit))
                ClearUnit(unit);
    }

    // Clear all non player units (green & red units)
    for (i = 0x41; i < 0xC0; ++i) {
        struct Unit* unit = GetUnit(i);

        if (unit && unit->pCharacterData)
            ClearUnit(unit);
    }

    // Reset player unit "temporary" states (HP, status, some state flags, etc)
    for (j = 1; j < 0x40; ++j) {
        struct Unit* unit = GetUnit(j);

        if (unit && unit->pCharacterData) {
            SetUnitHp(unit, GetUnitMaxHp(unit));
            SetUnitStatus(unit, UNIT_STATUS_NONE);

            unit->torchDuration = 0;
            unit->barrierDuration = 0;

            if (unit->state & US_NOT_DEPLOYED)
                unit->state = unit->state | US_BIT21;
            else
                unit->state = unit->state &~ US_BIT21;

            unit->state &= (
                US_DEAD | US_GROWTH_BOOST | US_SOLOANIM_1 | US_SOLOANIM_2 |
                US_BIT16 | US_BIT20 | US_BIT21 | US_BIT25 | US_BIT26
            );

            if (UNIT_CATTRIBUTES(unit) & CA_SUPPLY)
                unit->state = unit->state &~ US_DEAD;

            unit->state |= US_HIDDEN | US_NOT_DEPLOYED;

            unit->rescueOtherUnit = 0;
            unit->supportBits = 0;
        }
    }

    gRAMChapterData.chapterStateBits = gRAMChapterData.chapterStateBits &~ CHAPTER_FLAG_PREPSCREEN;
}

void MapMain_ResumeFromPhaseIdle(struct BMapMainProc* mapMain) {
    RefreshEntityBmMaps();
    SMS_UpdateFromGameData();

    gLCDControlBuffer.dispcnt.bg0_on = FALSE;
    gLCDControlBuffer.dispcnt.bg1_on = FALSE;
    gLCDControlBuffer.dispcnt.bg2_on = FALSE;
    gLCDControlBuffer.dispcnt.bg3_on = FALSE;
    gLCDControlBuffer.dispcnt.obj_on = FALSE;

    Proc_Goto(mapMain, 4);
}

void MapMain_ResumeFromAction(struct BMapMainProc* mapMain) {
    RefreshEntityBmMaps();
    SMS_UpdateFromGameData();

    gLCDControlBuffer.dispcnt.bg0_on = FALSE;
    gLCDControlBuffer.dispcnt.bg1_on = FALSE;
    gLCDControlBuffer.dispcnt.bg2_on = FALSE;
    gLCDControlBuffer.dispcnt.bg3_on = FALSE;
    gLCDControlBuffer.dispcnt.obj_on = FALSE;

    Proc_Goto(mapMain, 6);

    gActiveUnit = GetUnit(gActionData.subjectIndex);
    gBmMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = 0;

    HideUnitSMS(GetUnit(gActionData.subjectIndex));

    MU_Create(gActiveUnit);
    MU_SetDefaultFacing_Auto();
}

void MapMain_ResumeFromBskPhase(struct BMapMainProc* mapMain) {
    RefreshEntityBmMaps();
    SMS_UpdateFromGameData();

    gLCDControlBuffer.dispcnt.bg0_on = FALSE;
    gLCDControlBuffer.dispcnt.bg1_on = FALSE;
    gLCDControlBuffer.dispcnt.bg2_on = FALSE;
    gLCDControlBuffer.dispcnt.bg3_on = FALSE;
    gLCDControlBuffer.dispcnt.obj_on = FALSE;

    Proc_Goto(mapMain, 7);
}

void MapMain_ResumeFromArenaFight(struct BMapMainProc* mapMain) {
    gActiveUnit = GetUnit(gActionData.subjectIndex);

    PrepareArena2(gActiveUnit);

    BattleGenerateArena(gActiveUnit);
    BeginBattleAnimations();

    gLCDControlBuffer.dispcnt.bg0_on = FALSE;
    gLCDControlBuffer.dispcnt.bg1_on = FALSE;
    gLCDControlBuffer.dispcnt.bg2_on = FALSE;
    gLCDControlBuffer.dispcnt.bg3_on = FALSE;
    gLCDControlBuffer.dispcnt.obj_on = FALSE;

    RefreshEntityBmMaps();

    gBmMapUnit[gActionData.yMove][gActionData.xMove] = 0;

    SMS_UpdateFromGameData();

    Proc_Goto(mapMain, 10);

    sub_80B578C();
}

void MapMain_ResumeFromPhaseChange(struct BMapMainProc* mapMain) {
    RefreshEntityBmMaps();
    SMS_UpdateFromGameData();

    gLCDControlBuffer.dispcnt.bg0_on = FALSE;
    gLCDControlBuffer.dispcnt.bg1_on = FALSE;
    gLCDControlBuffer.dispcnt.bg2_on = FALSE;
    gLCDControlBuffer.dispcnt.bg3_on = FALSE;
    gLCDControlBuffer.dispcnt.obj_on = FALSE;

    Proc_Goto(mapMain, 8);
}

void GameCtrl_DeclareCompletedChapter(void) {
    RegisterChapterTimeAndTurnCount(&gRAMChapterData);

    ComputeChapterRankings();
    SaveChapterRankings();

    gRAMChapterData.chapterStateBits |= CHAPTER_FLAG_5;
}

void GameCtrl_DeclareCompletedPlaythrough(void) {
    SetNextGameActionId(GAME_ACTION_3);
    DeclareCompletedPlaythrough();
}

char* GetTacticianName(void) {
    return gRAMChapterData.playerName;
}

void SetTacticianName(const char* newName) {
    strcpy(gRAMChapterData.playerName, newName);
}
