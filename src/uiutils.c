#include "global.h"

#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "constants/video-global.h"
#include "uiutils.h"

static const u16 gUnknown_080DA2F4[] = {
    TILEREF(0x01, BGPAL_WINDOW_FRAME),
    TILEREF(0x02, BGPAL_WINDOW_FRAME),
    TILEREF(0x03, BGPAL_WINDOW_FRAME),
    TILEREF(0x05, BGPAL_WINDOW_FRAME),

    TILEREF(0x07, BGPAL_WINDOW_FRAME),
    TILEREF(0x08, BGPAL_WINDOW_FRAME),
    TILEREF(0x09, BGPAL_WINDOW_FRAME),
    TILEREF(0x0A, BGPAL_WINDOW_FRAME),

    TILEREF(0x06, BGPAL_WINDOW_FRAME),
    TILEREF(0x09, BGPAL_WINDOW_FRAME),
    TILEREF(0x09, BGPAL_WINDOW_FRAME),
    TILEREF(0x0A, BGPAL_WINDOW_FRAME),

    TILEREF(0x1A, BGPAL_WINDOW_FRAME),
    TILEREF(0x1B, BGPAL_WINDOW_FRAME),
    TILEREF(0x1B, BGPAL_WINDOW_FRAME),
    TILEREF(0x21, BGPAL_WINDOW_FRAME),
};

static const u16 gUnknown_080DA314[] = {
    TILEREF(0x01, BGPAL_WINDOW_FRAME),
    TILEREF(0x02, BGPAL_WINDOW_FRAME),
    TILEREF(0x03, BGPAL_WINDOW_FRAME),
    TILEREF(0x05, BGPAL_WINDOW_FRAME),

    TILEREF(0x66, BGPAL_WINDOW_FRAME),
    TILEREF(0x67, BGPAL_WINDOW_FRAME),
    TILEREF(0x67, BGPAL_WINDOW_FRAME),
    TILEREF(0x68, BGPAL_WINDOW_FRAME),

    TILEREF(0x06, BGPAL_WINDOW_FRAME),
    TILEREF(0x09, BGPAL_WINDOW_FRAME),
    TILEREF(0x09, BGPAL_WINDOW_FRAME),
    TILEREF(0x0A, BGPAL_WINDOW_FRAME),

    TILEREF(0x1A, BGPAL_WINDOW_FRAME),
    TILEREF(0x1B, BGPAL_WINDOW_FRAME),
    TILEREF(0x1B, BGPAL_WINDOW_FRAME),
    TILEREF(0x21, BGPAL_WINDOW_FRAME),
};

static const u16 gUnknown_080DA334[] = {
    TILEREF(0x72, BGPAL_WINDOW_FRAME),
    TILEREF(0x73, BGPAL_WINDOW_FRAME),
    TILEREF(0x73, BGPAL_WINDOW_FRAME),
    TILEREF(0x74, BGPAL_WINDOW_FRAME),

    TILEREF(0x75, BGPAL_WINDOW_FRAME),
    TILEREF(0x09, BGPAL_WINDOW_FRAME),
    TILEREF(0x09, BGPAL_WINDOW_FRAME),
    TILEREF(0x76, BGPAL_WINDOW_FRAME),

    TILEREF(0x75, BGPAL_WINDOW_FRAME),
    TILEREF(0x09, BGPAL_WINDOW_FRAME),
    TILEREF(0x09, BGPAL_WINDOW_FRAME),
    TILEREF(0x76, BGPAL_WINDOW_FRAME),

    TILEREF(0x77, BGPAL_WINDOW_FRAME),
    TILEREF(0x78, BGPAL_WINDOW_FRAME),
    TILEREF(0x78, BGPAL_WINDOW_FRAME),
    TILEREF(0x79, BGPAL_WINDOW_FRAME),
};

static const u16 gUnknown_080DA354[] = {
    TILEREF(0x01, BGPAL_WINDOW_FRAME),
    TILEREF(0x02, BGPAL_WINDOW_FRAME),
    TILEREF(0x03, BGPAL_WINDOW_FRAME),
    TILEREF(0x05, BGPAL_WINDOW_FRAME),

    TILEREF(0x0C, BGPAL_WINDOW_FRAME),
    TILEREF(0x0D, BGPAL_WINDOW_FRAME),
    TILEREF(0x0E, BGPAL_WINDOW_FRAME),
    TILEREF(0x0F, BGPAL_WINDOW_FRAME),

    TILEREF(0x0B, BGPAL_WINDOW_FRAME),
    TILEREF(0x0E, BGPAL_WINDOW_FRAME),
    TILEREF(0x0E, BGPAL_WINDOW_FRAME),
    TILEREF(0x0F, BGPAL_WINDOW_FRAME),

    TILEREF(0x1A, BGPAL_WINDOW_FRAME),
    TILEREF(0x1B, BGPAL_WINDOW_FRAME),
    TILEREF(0x1B, BGPAL_WINDOW_FRAME),
    TILEREF(0x21, BGPAL_WINDOW_FRAME),
};

static const u16 gUnknown_080DA374[] = {
    TILEREF(0x78, BGPAL_WINDOW_FRAME),
    TILEREF(0x79, BGPAL_WINDOW_FRAME),
    TILEREF(0x7A, BGPAL_WINDOW_FRAME),
    TILEREF(0x7B, BGPAL_WINDOW_FRAME),
    TILEREF(0x7C, BGPAL_WINDOW_FRAME),
    TILEREF(0x7D, BGPAL_WINDOW_FRAME),
    TILEREF(0x09, BGPAL_WINDOW_FRAME),
    TILEREF(0x09, BGPAL_WINDOW_FRAME),
    TILEREF(0x34, BGPAL_WINDOW_FRAME),
    TILEREF(0x7A, BGPAL_WINDOW_FRAME),
    TILEREF(0x7B, BGPAL_WINDOW_FRAME),
    TILEREF(0x7C, BGPAL_WINDOW_FRAME),
    TILEREF(0x63, BGPAL_WINDOW_FRAME) + 0x0400,
    TILEREF(0x63, BGPAL_WINDOW_FRAME),
    TILEREF(0x62, BGPAL_WINDOW_FRAME) + 0x0400,
    TILEREF(0x62, BGPAL_WINDOW_FRAME),
    TILEREF(0x60, BGPAL_WINDOW_FRAME),
    TILEREF(0x60, BGPAL_WINDOW_FRAME) + 0x0800,
    TILEREF(0x61, BGPAL_WINDOW_FRAME),
    TILEREF(0x61, BGPAL_WINDOW_FRAME) + 0x0800,
};

static const u16* sUiFrameModelTilemapLookup[] = {
    gUnknown_080DA2F4,
    gUnknown_080DA334,
    gUnknown_080DA354,
    gUnknown_080DA314,
};

static const u16* sLegacyUiFramePaletteLookup[] = {
    gLegacyUiFrameAPalette,
    gLegacyUiFrameBPalette,
    gLegacyUiFrameCPalette,
    gLegacyUiFrameDPalette,
};

static const u16* sUiFramePaletteLookup[] = {
    gUiFramePaletteA,
    gUiFramePaletteB,
    gUiFramePaletteC,
    gUiFramePaletteD,
};

static const void* sLegacyUiFrameImageLookup[] = {
    gLegacyUiFrameAImage,
    gLegacyUiFrameBImage,
    gLegacyUiFrameCImage,
    gLegacyUiFrameDImage,
};

static const void* sUiFrameImageLookup[] = {
    gUiFrameImage,
    gUiFrameImage,
    gUiFrameImage,
    gUiFrameImage,
};

static const u16* sStatBarPaletteLookup[] = {
    gUiBarPaletteA,
    gUiBarPaletteB,
    gUiBarPaletteC,
    gUiBarPaletteD,
};

// TODO: OBJ DATA/SPRITE HELPER DEFINITIONS
static u16 sSprite_Hand[] = {
    1,
    0x0002, 0x4000, 0x0000
};

static u8 sHandHOffsetLookup[] = {
    0, 0, 0, 0, 0, 0, 0, 1, 1, 2, 2, 2, 3, 3, 3, 3,
    4, 4, 4, 4, 4, 4, 4, 3, 3, 2, 2, 2, 1, 1, 1, 1,
};

EWRAM_DATA
static struct Vec2 sPrevHandScreenPosition = {};

EWRAM_DATA
static int sPrevHandClockFrame = 0;

void UnpackLegacyUiFramePalette(int palId)
{
    if (palId < 0)
        palId = BGPAL_WINDOW_FRAME;

    ApplyPalette(sLegacyUiFramePaletteLookup[gPlaySt.config.windowColor], palId);
}

void UnpackUiFramePalette(int palId)
{
    if (palId < 0)
        palId = BGPAL_WINDOW_FRAME;

    ApplyPalette(sUiFramePaletteLookup[gPlaySt.config.windowColor], palId);
}

void UnpackLegacyUiFrameImage(void* dest)
{
    if (dest == NULL)
        dest = BG_CHAR_ADDR(0);

    Decompress(sLegacyUiFrameImageLookup[gPlaySt.config.windowColor], dest);
}

void UnpackUiFrameImage(void* dest)
{
    if (dest == NULL)
        dest = BG_CHAR_ADDR(0);

    Decompress(sUiFrameImageLookup[gPlaySt.config.windowColor], dest);
}

void UnpackUiBarPalette(int palId)
{
    if (palId < 0)
        palId = BGPAL_UI_STATBAR;

    ApplyPalette(sStatBarPaletteLookup[gPlaySt.config.windowColor], palId);
}

void UnpackUiFrameBuffered(int id)
{
    int bufSize;
    s8* bufAddr;

    if (id < 0)
        id = gPlaySt.config.windowColor;

    bufSize = GetDataSize(sUiFrameImageLookup[id]);
    bufAddr = gFadeComponentStep - bufSize;

    Decompress(sUiFrameImageLookup[id], bufAddr);
    RegisterDataMove(bufAddr, BG_CHAR_ADDR(0), bufSize);

    UnpackUiFramePalette(-1);
}

void DrawUiFrame(u16* tilemap, int x, int y, int width, int height, int tilebase, int style)
{
    const u16* model = sUiFrameModelTilemapLookup[style];

    int xMax = x + width  - 1;
    int yMax = y + height - 1;

    int iy, ix;

    for (iy = y + 1; iy < yMax; iy += 2)
    {
        for (ix = x + 1; ix < xMax; ix += 2)
        {
            u16 tilemapOffset = TILEMAP_INDEX(ix, iy);

            tilemap[tilemapOffset + TILEMAP_INDEX(0, 0)] = model[6]  + tilebase; // center tile
            tilemap[tilemapOffset + TILEMAP_INDEX(1, 0)] = model[6]  + tilebase; // center tile
            tilemap[tilemapOffset + TILEMAP_INDEX(0, 1)] = model[9]  + tilebase; // bottom center tile (0, 0)
            tilemap[tilemapOffset + TILEMAP_INDEX(1, 1)] = model[10] + tilebase; // bottom center tile (1, 0)
        }

        tilemap[TILEMAP_INDEX(x,    iy+0)] = model[8]  + tilebase; // left center tile
        tilemap[TILEMAP_INDEX(xMax, iy+0)] = model[7]  + tilebase; // right center tile 0
        tilemap[TILEMAP_INDEX(x,    iy+1)] = model[8]  + tilebase; // left center tile
        tilemap[TILEMAP_INDEX(xMax, iy+1)] = model[11] + tilebase; // right center tile 1
    }

    for (ix = x + 1; ix < xMax; ix += 2)
    {
        tilemap[TILEMAP_INDEX(ix+0, y)]    = model[2]  + tilebase; // top center tile
        tilemap[TILEMAP_INDEX(ix+1, y)]    = model[2]  + tilebase; // top centertile
        tilemap[TILEMAP_INDEX(ix+0, yMax)] = model[13] + tilebase; // bottom center tile (0, 1)
        tilemap[TILEMAP_INDEX(ix+1, yMax)] = model[14] + tilebase; // bottom center tile (1, 1)
    }

    tilemap[TILEMAP_INDEX(x+0, y+0)] = model[0] + tilebase; // top left tile (0, 0)
    tilemap[TILEMAP_INDEX(x+1, y+0)] = model[1] + tilebase; // top left tile (1, 0)
    tilemap[TILEMAP_INDEX(x+0, y+1)] = model[4] + tilebase; // top left tile (0, 1)
    tilemap[TILEMAP_INDEX(x+1, y+1)] = model[5] + tilebase; // top left tile (1, 1)

    tilemap[TILEMAP_INDEX(xMax, y)] = model[3] + tilebase; // top right tile

    tilemap[TILEMAP_INDEX(x, yMax)] = model[12] + tilebase; // bottom left tile

    tilemap[TILEMAP_INDEX(xMax, yMax)] = model[15] + tilebase; // bottom right tile
}

void ClearUiFrame(u16* tilemap, int x, int y, int width, int height)
{
    int i;

    width *= 2;
    tilemap += y*0x20 + x;

    for (i = 0; i < height; ++i)
    {
        CpuFill16(0, tilemap, width);
        tilemap += 0x20;
    }
}

void DrawUiFrame2(int x, int y, int width, int height, int style)
{
    u16 tilemapOffset;
    s8 r9;
    const u16* model = sUiFrameModelTilemapLookup[style];

    int xMax = x + width  - 1;
    int yMax = y + height - 1;
    int iy, ix;

    if (style != 3)
    {
        for (iy = y + 1; iy < yMax; iy += 2)
        {
            for (ix = x + 1; ix < xMax; ix += 2)
            {
                tilemapOffset = TILEMAP_INDEX2(ix, iy);

                gBG0TilemapBuffer[tilemapOffset] = 0;
                gBG1TilemapBuffer[tilemapOffset] = model[6];

                tilemapOffset += TILEMAP_INDEX2(1, 0);

                gBG0TilemapBuffer[tilemapOffset] = 0;
                gBG1TilemapBuffer[tilemapOffset] = model[6];

                tilemapOffset += TILEMAP_INDEX2(-1, 1);

                gBG0TilemapBuffer[tilemapOffset] = 0;
                gBG1TilemapBuffer[tilemapOffset] = model[9];

                tilemapOffset += TILEMAP_INDEX2(1, 0);

                gBG0TilemapBuffer[tilemapOffset] = 0;
                gBG1TilemapBuffer[tilemapOffset] = model[10];
            }

            gBG0TilemapBuffer[TILEMAP_INDEX2(x,    iy+0)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX2(x,    iy+0)] = model[8]; // left center tile

            gBG0TilemapBuffer[TILEMAP_INDEX2(xMax, iy+0)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX2(xMax, iy+0)] = model[7]; // right center tile 0

            gBG0TilemapBuffer[TILEMAP_INDEX2(x,    iy+1)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX2(x,    iy+1)] = model[8]; // left center tile

            gBG0TilemapBuffer[TILEMAP_INDEX2(xMax, iy+1)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX2(xMax, iy+1)] = model[11]; // right center tile 1
        }

        for (ix = x + 1; ix < xMax; ix += 2)
        {
            gBG0TilemapBuffer[TILEMAP_INDEX2(ix+0, y)]    = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX2(ix+0, y)]    = model[2]; // top center tile

            gBG0TilemapBuffer[TILEMAP_INDEX2(ix+1, y)]    = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX2(ix+1, y)]    = model[2]; // top centertile

            gBG0TilemapBuffer[TILEMAP_INDEX2(ix+0, yMax)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX2(ix+0, yMax)] = model[13]; // bottom center tile (0, 1)

            gBG0TilemapBuffer[TILEMAP_INDEX2(ix+1, yMax)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX2(ix+1, yMax)] = model[14]; // bottom center tile (1, 1)
        }

        gBG0TilemapBuffer[TILEMAP_INDEX2(x,    y)]    = 0;
        gBG0TilemapBuffer[TILEMAP_INDEX2(xMax, y)]    = 0;
        gBG0TilemapBuffer[TILEMAP_INDEX2(x,    yMax)] = 0;
        gBG0TilemapBuffer[TILEMAP_INDEX2(xMax, yMax)] = 0;

        gBG1TilemapBuffer[TILEMAP_INDEX2(x+0, y+0)] = model[0]; // top left tile (0, 0)
        gBG1TilemapBuffer[TILEMAP_INDEX2(x+1, y+0)] = model[1]; // top left tile (1, 0)
        gBG1TilemapBuffer[TILEMAP_INDEX2(x+0, y+1)] = model[4]; // top left tile (0, 1)
        gBG1TilemapBuffer[TILEMAP_INDEX2(x+1, y+1)] = model[5]; // top left tile (1, 1)

        gBG1TilemapBuffer[TILEMAP_INDEX2(xMax, y)]    = model[3];  // top right tile
        gBG1TilemapBuffer[TILEMAP_INDEX2(x,    yMax)] = model[12]; // bottom left tile
        gBG1TilemapBuffer[TILEMAP_INDEX2(xMax, yMax)] = model[15]; // bottom right tile
    }
    else
    {
        for (iy = y + 1; iy < yMax; iy += 2)
        {
            r9 = (iy == y + 1);

            for (ix = x + 1; ix < xMax; ix += 2)
            {
                tilemapOffset = TILEMAP_INDEX2(ix, iy);

                gBG0TilemapBuffer[tilemapOffset] = 0;
                gBG1TilemapBuffer[tilemapOffset] = model[r9 ? 5 : 9];

                tilemapOffset += TILEMAP_INDEX2(1, 0);

                gBG0TilemapBuffer[tilemapOffset] = 0;
                gBG1TilemapBuffer[tilemapOffset] = model[r9 ? 6 : 10];

                tilemapOffset += TILEMAP_INDEX2(-1, 1);

                gBG0TilemapBuffer[tilemapOffset] = 0;
                gBG1TilemapBuffer[tilemapOffset] = model[9];

                tilemapOffset += TILEMAP_INDEX2(1, 0);

                gBG0TilemapBuffer[tilemapOffset] = 0;
                gBG1TilemapBuffer[tilemapOffset] = model[10];
            }

            gBG0TilemapBuffer[TILEMAP_INDEX2(x,    iy+0)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX2(x,    iy+0)] = model[r9 ? 4 : 8]; // left center tile

            gBG0TilemapBuffer[TILEMAP_INDEX2(xMax, iy+0)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX2(xMax, iy+0)] = model[r9 ? 7 : 11]; // right center tile 0

            gBG0TilemapBuffer[TILEMAP_INDEX2(x,    iy+1)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX2(x,    iy+1)] = model[8]; // left center tile

            gBG0TilemapBuffer[TILEMAP_INDEX2(xMax, iy+1)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX2(xMax, iy+1)] = model[11]; // right center tile 1
        }

        for (ix = x + 1; ix < xMax; ix += 2)
        {
            gBG0TilemapBuffer[TILEMAP_INDEX2(ix+0, yMax)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX2(ix+0, yMax)] = model[13]; // bottom center tile (0, 1)

            gBG0TilemapBuffer[TILEMAP_INDEX2(ix+1, yMax)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX2(ix+1, yMax)] = model[14]; // bottom center tile (1, 1)
        }

        gBG0TilemapBuffer[TILEMAP_INDEX2(x,    yMax)] = 0;
        gBG0TilemapBuffer[TILEMAP_INDEX2(xMax, yMax)] = 0;

        gBG1TilemapBuffer[TILEMAP_INDEX2(x,    yMax)] = model[12]; // bottom left tile
        gBG1TilemapBuffer[TILEMAP_INDEX2(xMax, yMax)] = model[15]; // bottom right tile
    }

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

void DisplayUiHand(int x, int y)
{
    if ((GetGameClock() - 1) == sPrevHandClockFrame)
    {
        x = (x + sPrevHandScreenPosition.x) >> 1;
        y = (y + sPrevHandScreenPosition.y) >> 1;
    }

    sPrevHandScreenPosition.x = x;
    sPrevHandScreenPosition.y = y;
    sPrevHandClockFrame = GetGameClock();

    x += (sHandHOffsetLookup[GetGameClock() % ARRAY_COUNT(sHandHOffsetLookup)] - 14);
    PutSprite(2, x, y, sSprite_Hand, 0);
}

void DisplayUiHand_unused(int x, int y)
{
    x += (sHandHOffsetLookup[GetGameClock() % ARRAY_COUNT(sHandHOffsetLookup)] - 14);
    PutSprite(2, x, y, sSprite_Hand, 0);
}

void DisplayFrozenUiHand(int x, int y)
{
    x -= 12;
    PutSprite(3, x, y, sSprite_Hand, 0);
}

int GetUiHandPrevDisplayX(void)
{
    return sPrevHandScreenPosition.x;
}

int GetUiHandPrevDisplayY(void)
{
    return sPrevHandScreenPosition.y;
}

void ClearBg0Bg1(void)
{
    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

void DrawUiItemHover(int x, int y, int width)
{
    int xMax = x + width - 1;
    y += 1;

    // TODO: meaningful constants

    gBG1TilemapBuffer[TILEMAP_INDEX(x, y)] = TILEREF(0x7A, BGPAL_WINDOW_FRAME);

    for (x += 1; x < xMax; ++x)
        gBG1TilemapBuffer[TILEMAP_INDEX(x, y)] = TILEREF(0x7B, BGPAL_WINDOW_FRAME);

    gBG1TilemapBuffer[TILEMAP_INDEX(x, y)] = TILEREF(0x7C, BGPAL_WINDOW_FRAME);

    BG_EnableSyncByMask(BG1_SYNC_BIT);
}

void ClearUiItemHover(int x, int y, int width)
{
    int xMax = x + width - 1;
    y += 1;

    for (; x < xMax; x += 2)
    {
        gBG1TilemapBuffer[TILEMAP_INDEX(x + 0, y)] = gUnknown_080DA374[6];
        gBG1TilemapBuffer[TILEMAP_INDEX(x + 1, y)] = gUnknown_080DA374[7];
    }

    gBG1TilemapBuffer[TILEMAP_INDEX(xMax, y)] = (width % 2)
        ? gUnknown_080DA374[6]
        : gUnknown_080DA374[7];

    BG_EnableSyncByMask(BG1_SYNC_BIT);
}

void DrawUiItemHoverExt(int bg, int base, int x, int y, int width)
{
    u16* tilemap;
    int xMax;

    xMax = x + width - 1;
    y += 1;

    tilemap = BG_GetMapBuffer(bg);

    tilemap[TILEMAP_INDEX(x, y)] = TILEREF(0x7A, BGPAL_WINDOW_FRAME) + base;

    for (x += 1; x < xMax; ++x)
        tilemap[TILEMAP_INDEX(x, y)] = TILEREF(0x7B, BGPAL_WINDOW_FRAME) + base;

    tilemap[TILEMAP_INDEX(x, y)] = TILEREF(0x7C, BGPAL_WINDOW_FRAME) + base;

    BG_EnableSyncByMask(BG_SYNC_BIT(bg));
}

void ClearUiItemHoverExt(int bg, int base, int x, int y, int width)
{
    u16* tilemap;
    int xMax;

    xMax = x + width - 1;
    y += 1;

    tilemap = BG_GetMapBuffer(bg);

    for (; x < xMax; x += 2)
    {
        tilemap[TILEMAP_INDEX(x + 0, y)] = gUnknown_080DA374[6] + base;
        tilemap[TILEMAP_INDEX(x + 1, y)] = gUnknown_080DA374[7] + base;
    }

    tilemap[TILEMAP_INDEX(xMax, y)] = (width % 2)
        ? gUnknown_080DA374[6] + base
        : gUnknown_080DA374[7] + base;

    BG_EnableSyncByMask(BG_SYNC_BIT(bg));
}

void UnpackUnkUiFrame(void* vram, int palId, int palCount)
{
    Decompress(gUnkUiFrameImage, vram);
    ApplyPalettes(gUnkUiFramePalettes, palId, palCount);
}

void DisplayUiHandExt(int x, int y, unsigned objTileOffset)
{
    if ((GetGameClock() - 1) == sPrevHandClockFrame)
    {
        x = (x + sPrevHandScreenPosition.x) >> 1;
        y = (y + sPrevHandScreenPosition.y) >> 1;
    }

    sPrevHandScreenPosition.x = x;
    sPrevHandScreenPosition.y = y;
    sPrevHandClockFrame = GetGameClock();

    x += (sHandHOffsetLookup[GetGameClock() % ARRAY_COUNT(sHandHOffsetLookup)] - 14);
    PutSprite(2, x, y, sSprite_Hand, objTileOffset << 15 >> 20);
}

void DisplayFrozenUiHandExt(int x, int y, unsigned objTileOffset)
{
    x -= 12;
    PutSprite(3, x, y, sSprite_Hand, objTileOffset << 15 >> 20);
}

void LoadLegacyUiFrameGraphics(void)
{
    UnpackLegacyUiFrameImage(NULL);
    UnpackLegacyUiFramePalette(-1);
}

void LoadUiFrameGraphics(void)
{
    UnpackUiFrameImage(NULL);
    UnpackUiFramePalette(-1);
}

void LoadUiFrameGraphicsTo(unsigned vramOffset, int palId)
{
    UnpackUiFrameImage((void*)(VRAM + vramOffset));
    UnpackUiFramePalette(palId);
}
