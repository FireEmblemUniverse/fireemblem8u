#include "global.h"

#include "hardware.h"
#include "ctc.h"

#include "uiutils.h"

static const u16 gUnknown_080DA2F4[] = {
    TILEREF(0x01, BGPAL_UI_FRAME),
    TILEREF(0x02, BGPAL_UI_FRAME),
    TILEREF(0x03, BGPAL_UI_FRAME),
    TILEREF(0x05, BGPAL_UI_FRAME),

    TILEREF(0x07, BGPAL_UI_FRAME),
    TILEREF(0x08, BGPAL_UI_FRAME),
    TILEREF(0x09, BGPAL_UI_FRAME),
    TILEREF(0x0A, BGPAL_UI_FRAME),

    TILEREF(0x06, BGPAL_UI_FRAME),
    TILEREF(0x09, BGPAL_UI_FRAME),
    TILEREF(0x09, BGPAL_UI_FRAME),
    TILEREF(0x0A, BGPAL_UI_FRAME),

    TILEREF(0x1A, BGPAL_UI_FRAME),
    TILEREF(0x1B, BGPAL_UI_FRAME),
    TILEREF(0x1B, BGPAL_UI_FRAME),
    TILEREF(0x21, BGPAL_UI_FRAME),
};

static const u16 gUnknown_080DA314[] = {
    TILEREF(0x01, BGPAL_UI_FRAME),
    TILEREF(0x02, BGPAL_UI_FRAME),
    TILEREF(0x03, BGPAL_UI_FRAME),
    TILEREF(0x05, BGPAL_UI_FRAME),

    TILEREF(0x66, BGPAL_UI_FRAME),
    TILEREF(0x67, BGPAL_UI_FRAME),
    TILEREF(0x67, BGPAL_UI_FRAME),
    TILEREF(0x68, BGPAL_UI_FRAME),

    TILEREF(0x06, BGPAL_UI_FRAME),
    TILEREF(0x09, BGPAL_UI_FRAME),
    TILEREF(0x09, BGPAL_UI_FRAME),
    TILEREF(0x0A, BGPAL_UI_FRAME),

    TILEREF(0x1A, BGPAL_UI_FRAME),
    TILEREF(0x1B, BGPAL_UI_FRAME),
    TILEREF(0x1B, BGPAL_UI_FRAME),
    TILEREF(0x21, BGPAL_UI_FRAME),
};

static const u16 gUnknown_080DA334[] = {
    TILEREF(0x72, BGPAL_UI_FRAME),
    TILEREF(0x73, BGPAL_UI_FRAME),
    TILEREF(0x73, BGPAL_UI_FRAME),
    TILEREF(0x74, BGPAL_UI_FRAME),

    TILEREF(0x75, BGPAL_UI_FRAME),
    TILEREF(0x09, BGPAL_UI_FRAME),
    TILEREF(0x09, BGPAL_UI_FRAME),
    TILEREF(0x76, BGPAL_UI_FRAME),

    TILEREF(0x75, BGPAL_UI_FRAME),
    TILEREF(0x09, BGPAL_UI_FRAME),
    TILEREF(0x09, BGPAL_UI_FRAME),
    TILEREF(0x76, BGPAL_UI_FRAME),

    TILEREF(0x77, BGPAL_UI_FRAME),
    TILEREF(0x78, BGPAL_UI_FRAME),
    TILEREF(0x78, BGPAL_UI_FRAME),
    TILEREF(0x79, BGPAL_UI_FRAME),
};

static const u16 gUnknown_080DA354[] = {
    TILEREF(0x01, BGPAL_UI_FRAME),
    TILEREF(0x02, BGPAL_UI_FRAME),
    TILEREF(0x03, BGPAL_UI_FRAME),
    TILEREF(0x05, BGPAL_UI_FRAME),

    TILEREF(0x0C, BGPAL_UI_FRAME),
    TILEREF(0x0D, BGPAL_UI_FRAME),
    TILEREF(0x0E, BGPAL_UI_FRAME),
    TILEREF(0x0F, BGPAL_UI_FRAME),

    TILEREF(0x0B, BGPAL_UI_FRAME),
    TILEREF(0x0E, BGPAL_UI_FRAME),
    TILEREF(0x0E, BGPAL_UI_FRAME),
    TILEREF(0x0F, BGPAL_UI_FRAME),

    TILEREF(0x1A, BGPAL_UI_FRAME),
    TILEREF(0x1B, BGPAL_UI_FRAME),
    TILEREF(0x1B, BGPAL_UI_FRAME),
    TILEREF(0x21, BGPAL_UI_FRAME),
};

static const u16 gUnknown_080DA374[] = {
    TILEREF(0x78, BGPAL_UI_FRAME),
    TILEREF(0x79, BGPAL_UI_FRAME),
    TILEREF(0x7A, BGPAL_UI_FRAME),
    TILEREF(0x7B, BGPAL_UI_FRAME),
    TILEREF(0x7C, BGPAL_UI_FRAME),
    TILEREF(0x7D, BGPAL_UI_FRAME),
    TILEREF(0x09, BGPAL_UI_FRAME),
    TILEREF(0x09, BGPAL_UI_FRAME),
    TILEREF(0x34, BGPAL_UI_FRAME),
    TILEREF(0x7A, BGPAL_UI_FRAME),
    TILEREF(0x7B, BGPAL_UI_FRAME),
    TILEREF(0x7C, BGPAL_UI_FRAME),
    TILEREF(0x63, BGPAL_UI_FRAME) + 0x0400,
    TILEREF(0x63, BGPAL_UI_FRAME),
    TILEREF(0x62, BGPAL_UI_FRAME) + 0x0400,
    TILEREF(0x62, BGPAL_UI_FRAME),
    TILEREF(0x60, BGPAL_UI_FRAME),
    TILEREF(0x60, BGPAL_UI_FRAME) + 0x0800,
    TILEREF(0x61, BGPAL_UI_FRAME),
    TILEREF(0x61, BGPAL_UI_FRAME) + 0x0800,
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
        palId = BGPAL_UI_FRAME;

    ApplyPalette(sLegacyUiFramePaletteLookup[gRAMChapterData.cfgWindowColor], palId);
}

void UnpackUiFramePalette(int palId)
{
    if (palId < 0)
        palId = BGPAL_UI_FRAME;

    ApplyPalette(sUiFramePaletteLookup[gRAMChapterData.cfgWindowColor], palId);
}

void UnpackLegacyUiFrameImage(void* dest)
{
    if (dest == NULL)
        dest = BG_CHAR_ADDR(0);

    CopyDataWithPossibleUncomp(sLegacyUiFrameImageLookup[gRAMChapterData.cfgWindowColor], dest);
}

void UnpackUiFrameImage(void* dest)
{
    if (dest == NULL)
        dest = BG_CHAR_ADDR(0);

    CopyDataWithPossibleUncomp(sUiFrameImageLookup[gRAMChapterData.cfgWindowColor], dest);
}

void UnpackUiBarPalette(int palId)
{
    if (palId < 0)
        palId = BGPAL_UI_STATBAR;

    ApplyPalette(sStatBarPaletteLookup[gRAMChapterData.cfgWindowColor], palId);
}

void UnpackUiFrameBuffered(int id)
{
    int bufSize;
    s8* bufAddr;

    if (id < 0)
        id = gRAMChapterData.cfgWindowColor;

    bufSize = FilterR0ForRawCopy(sUiFrameImageLookup[id]);
    bufAddr = gUnknown_02022288 - bufSize;

    CopyDataWithPossibleUncomp(sUiFrameImageLookup[id], bufAddr);
    RegisterTileGraphics(bufAddr, BG_CHAR_ADDR(0), bufSize);

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

#ifdef NONMATCHING

void ClearUiFrame(u16* tilemap, int x, int y, int width, int height)
{
    int i;

    width *= 2;
    tilemap += y*0x20 + x;

    for (i = 0; i < height; ++i)
    {
        CpuFill16(0, tilemap + i*0x20, width);
    }
}

#else // NONMATCHING

__attribute__((naked))
void ClearUiFrame(u16* tilemap, int x, int y, int width, int height)
{
    // :/

    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, r9\n\
        mov r6, r8\n\
        push {r6, r7}\n\
        sub sp, #4\n\
        adds r5, r0, #0\n\
        ldr r0, [sp, #0x20]\n\
        lsls r3, r3, #1\n\
        lsls r2, r2, #5\n\
        adds r2, r2, r1\n\
        lsls r2, r2, #1\n\
        adds r5, r5, r2\n\
        cmp r0, #0\n\
        ble _0804E35A\n\
        mov r7, sp\n\
        adds r4, r0, #0\n\
        movs r0, #0\n\
        mov r9, r0\n\
        lsls r0, r3, #0xa\n\
        lsrs r6, r0, #0xb\n\
        movs r0, #0x80\n\
        lsls r0, r0, #0x11\n\
        mov r8, r0\n\
    _0804E342:\n\
        mov r0, r9\n\
        strh r0, [r7]\n\
        mov r0, sp\n\
        adds r1, r5, #0\n\
        mov r2, r8\n\
        orrs r2, r6\n\
        bl CpuSet\n\
        adds r5, #0x40\n\
        subs r4, #1\n\
        cmp r4, #0\n\
        bne _0804E342\n\
    _0804E35A:\n\
        add sp, #4\n\
        pop {r3, r4}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCHING

#ifdef NONMATCHING

void DrawUiFrame2(int x, int y, int width, int height, int style)
{
    const u16* model = sUiFrameModelTilemapLookup[style];

    int xMax = x + width  - 1;
    int yMax = y + height - 1;

    int iy, ix;

    u16 tilemapOffset;
    s8 r9;

    if (style != 3)
    {
        for (iy = y + 1; iy < yMax; iy += 2)
        {
            for (ix = x + 1; ix < xMax; ix += 2)
            {
                tilemapOffset = TILEMAP_INDEX(ix, iy);

                gBG0TilemapBuffer[tilemapOffset] = 0;
                gBG1TilemapBuffer[tilemapOffset] = model[6];

                tilemapOffset += TILEMAP_INDEX(1, 0);

                gBG0TilemapBuffer[tilemapOffset] = 0;
                gBG1TilemapBuffer[tilemapOffset] = model[6];

                tilemapOffset += TILEMAP_INDEX(-1, 1);

                gBG0TilemapBuffer[tilemapOffset] = 0;
                gBG1TilemapBuffer[tilemapOffset] = model[9];

                tilemapOffset += TILEMAP_INDEX(1, 0);

                gBG0TilemapBuffer[tilemapOffset] = 0;
                gBG1TilemapBuffer[tilemapOffset] = model[10];
            }

            gBG0TilemapBuffer[TILEMAP_INDEX(x,    iy+0)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX(x,    iy+0)] = model[8]; // left center tile

            gBG0TilemapBuffer[TILEMAP_INDEX(xMax, iy+0)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX(xMax, iy+0)] = model[7]; // right center tile 0

            gBG0TilemapBuffer[TILEMAP_INDEX(x,    iy+1)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX(x,    iy+1)] = model[8]; // left center tile

            gBG0TilemapBuffer[TILEMAP_INDEX(xMax, iy+1)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX(xMax, iy+1)] = model[11]; // right center tile 1
        }

        for (ix = x + 1; ix < xMax; ix += 2)
        {
            gBG0TilemapBuffer[TILEMAP_INDEX(ix+0, y)]    = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX(ix+0, y)]    = model[2]; // top center tile

            gBG0TilemapBuffer[TILEMAP_INDEX(ix+1, y)]    = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX(ix+1, y)]    = model[2]; // top centertile

            gBG0TilemapBuffer[TILEMAP_INDEX(ix+0, yMax)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX(ix+0, yMax)] = model[13]; // bottom center tile (0, 1)

            gBG0TilemapBuffer[TILEMAP_INDEX(ix+1, yMax)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX(ix+1, yMax)] = model[14]; // bottom center tile (1, 1)
        }

        gBG0TilemapBuffer[TILEMAP_INDEX(x,    y)]    = 0;
        gBG0TilemapBuffer[TILEMAP_INDEX(xMax, y)]    = 0;
        gBG0TilemapBuffer[TILEMAP_INDEX(x,    yMax)] = 0;
        gBG0TilemapBuffer[TILEMAP_INDEX(xMax, yMax)] = 0;

        gBG1TilemapBuffer[TILEMAP_INDEX(x+0, y+0)] = model[0]; // top left tile (0, 0)
        gBG1TilemapBuffer[TILEMAP_INDEX(x+1, y+0)] = model[1]; // top left tile (1, 0)
        gBG1TilemapBuffer[TILEMAP_INDEX(x+0, y+1)] = model[4]; // top left tile (0, 1)
        gBG1TilemapBuffer[TILEMAP_INDEX(x+1, y+1)] = model[5]; // top left tile (1, 1)

        gBG1TilemapBuffer[TILEMAP_INDEX(xMax, y)]    = model[3];  // top right tile
        gBG1TilemapBuffer[TILEMAP_INDEX(x,    yMax)] = model[12]; // bottom left tile
        gBG1TilemapBuffer[TILEMAP_INDEX(xMax, yMax)] = model[15]; // bottom right tile
    }
    else
    {
        for (iy = y + 1; iy < yMax; iy += 2)
        {
            r9 = (iy == y + 1);

            for (ix = x + 1; ix < xMax; ix += 2)
            {
                tilemapOffset = TILEMAP_INDEX(ix, iy);

                gBG0TilemapBuffer[tilemapOffset] = 0;
                gBG1TilemapBuffer[tilemapOffset] = model[r9 ? 5 : 9];

                tilemapOffset += TILEMAP_INDEX(1, 0);

                gBG0TilemapBuffer[tilemapOffset] = 0;
                gBG1TilemapBuffer[tilemapOffset] = model[r9 ? 6 : 10];

                tilemapOffset += TILEMAP_INDEX(-1, 1);

                gBG0TilemapBuffer[tilemapOffset] = 0;
                gBG1TilemapBuffer[tilemapOffset] = model[9];

                tilemapOffset += TILEMAP_INDEX(1, 0);

                gBG0TilemapBuffer[tilemapOffset] = 0;
                gBG1TilemapBuffer[tilemapOffset] = model[10];
            }

            gBG0TilemapBuffer[TILEMAP_INDEX(x,    iy+0)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX(x,    iy+0)] = model[r9 ? 4 : 8]; // left center tile

            gBG0TilemapBuffer[TILEMAP_INDEX(xMax, iy+0)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX(xMax, iy+0)] = model[r9 ? 7 : 11]; // right center tile 0

            gBG0TilemapBuffer[TILEMAP_INDEX(x,    iy+1)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX(x,    iy+1)] = model[8]; // left center tile

            gBG0TilemapBuffer[TILEMAP_INDEX(xMax, iy+1)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX(xMax, iy+1)] = model[11]; // right center tile 1
        }

        for (ix = x + 1; ix < xMax; ix += 2)
        {
            gBG0TilemapBuffer[TILEMAP_INDEX(ix+0, yMax)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX(ix+0, yMax)] = model[13]; // bottom center tile (0, 1)

            gBG0TilemapBuffer[TILEMAP_INDEX(ix+1, yMax)] = 0;
            gBG1TilemapBuffer[TILEMAP_INDEX(ix+1, yMax)] = model[14]; // bottom center tile (1, 1)
        }

        gBG0TilemapBuffer[TILEMAP_INDEX(x,    yMax)] = 0;
        gBG0TilemapBuffer[TILEMAP_INDEX(xMax, yMax)] = 0;

        gBG1TilemapBuffer[TILEMAP_INDEX(x,    yMax)] = model[12]; // bottom left tile
        gBG1TilemapBuffer[TILEMAP_INDEX(xMax, yMax)] = model[15]; // bottom right tile
    }

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

#else // NONMATCHING

__attribute__((naked))
void DrawUiFrame2(int x, int y, int width, int height, int style)
{
    // :/

    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #0x4c\n\
        str r0, [sp]\n\
        adds r5, r1, #0\n\
        ldr r4, [sp, #0x6c]\n\
        ldr r1, _0804E5B0  @ sUiFrameModelTilemapLookup\n\
        lsls r0, r4, #2\n\
        adds r0, r0, r1\n\
        ldr r0, [r0]\n\
        mov ip, r0\n\
        ldr r0, [sp]\n\
        adds r2, r0, r2\n\
        subs r2, #1\n\
        str r2, [sp, #4]\n\
        adds r3, r5, r3\n\
        subs r3, #1\n\
        str r3, [sp, #8]\n\
        cmp r4, #3\n\
        bne _0804E398\n\
        b _0804E5BC\n\
    _0804E398:\n\
        adds r0, r5, #1\n\
        str r0, [sp, #0x1c]\n\
        ldr r1, [sp]\n\
        adds r1, #1\n\
        str r1, [sp, #0x18]\n\
        lsls r5, r5, #5\n\
        str r5, [sp, #0x24]\n\
        lsls r2, r3, #5\n\
        str r2, [sp, #0x30]\n\
        cmp r0, r3\n\
        bge _0804E48A\n\
        movs r3, #0\n\
        mov r9, r3\n\
        ldr r4, _0804E5B4  @ gBG1TilemapBuffer\n\
        mov r8, r4\n\
    _0804E3B6:\n\
        ldr r7, [sp, #0x18]\n\
        lsls r5, r0, #5\n\
        adds r6, r0, #1\n\
        mov sl, r6\n\
        adds r0, #2\n\
        str r0, [sp, #0x20]\n\
        ldr r0, [sp, #4]\n\
        cmp r7, r0\n\
        bge _0804E432\n\
        ldr r3, _0804E5B8  @ gBG0TilemapBuffer\n\
        movs r2, #0\n\
        ldr r6, _0804E5B4  @ gBG1TilemapBuffer\n\
    _0804E3CE:\n\
        adds r0, r5, r7\n\
        lsls r0, r0, #0x10\n\
        lsrs r4, r0, #0x10\n\
        lsls r1, r4, #1\n\
        adds r0, r1, r3\n\
        strh r2, [r0]\n\
        adds r1, r1, r6\n\
        str r1, [sp, #0x44]\n\
        mov r1, ip\n\
        ldrh r0, [r1, #0xc]\n\
        ldr r1, [sp, #0x44]\n\
        strh r0, [r1]\n\
        adds r0, r4, #1\n\
        lsls r0, r0, #0x10\n\
        lsrs r4, r0, #0x10\n\
        lsls r1, r4, #1\n\
        adds r0, r1, r3\n\
        strh r2, [r0]\n\
        adds r1, r1, r6\n\
        str r1, [sp, #0x44]\n\
        mov r1, ip\n\
        ldrh r0, [r1, #0xc]\n\
        ldr r1, [sp, #0x44]\n\
        strh r0, [r1]\n\
        adds r0, r4, #0\n\
        adds r0, #0x1f\n\
        lsls r0, r0, #0x10\n\
        lsrs r4, r0, #0x10\n\
        lsls r1, r4, #1\n\
        adds r0, r1, r3\n\
        strh r2, [r0]\n\
        adds r1, r1, r6\n\
        str r1, [sp, #0x44]\n\
        mov r1, ip\n\
        ldrh r0, [r1, #0x12]\n\
        ldr r1, [sp, #0x44]\n\
        strh r0, [r1]\n\
        adds r0, r4, #1\n\
        lsls r0, r0, #0x10\n\
        lsrs r0, r0, #0xf\n\
        adds r1, r0, r3\n\
        strh r2, [r1]\n\
        adds r0, r0, r6\n\
        mov r4, ip\n\
        ldrh r1, [r4, #0x14]\n\
        strh r1, [r0]\n\
        adds r7, #2\n\
        ldr r0, [sp, #4]\n\
        cmp r7, r0\n\
        blt _0804E3CE\n\
    _0804E432:\n\
        ldr r2, [sp]\n\
        adds r1, r5, r2\n\
        lsls r1, r1, #1\n\
        ldr r3, _0804E5B8  @ gBG0TilemapBuffer\n\
        adds r0, r1, r3\n\
        mov r4, r9\n\
        strh r4, [r0]\n\
        add r1, r8\n\
        mov r6, ip\n\
        ldrh r0, [r6, #0x10]\n\
        strh r0, [r1]\n\
        ldr r0, [sp, #4]\n\
        adds r1, r5, r0\n\
        lsls r1, r1, #1\n\
        adds r0, r1, r3\n\
        strh r4, [r0]\n\
        add r1, r8\n\
        ldrh r0, [r6, #0xe]\n\
        strh r0, [r1]\n\
        mov r1, sl\n\
        lsls r2, r1, #5\n\
        ldr r3, [sp]\n\
        adds r1, r2, r3\n\
        lsls r1, r1, #1\n\
        ldr r4, _0804E5B8  @ gBG0TilemapBuffer\n\
        adds r0, r1, r4\n\
        mov r5, r9\n\
        strh r5, [r0]\n\
        add r1, r8\n\
        ldrh r0, [r6, #0x10]\n\
        strh r0, [r1]\n\
        ldr r6, [sp, #4]\n\
        adds r2, r2, r6\n\
        lsls r2, r2, #1\n\
        adds r0, r2, r4\n\
        strh r5, [r0]\n\
        add r2, r8\n\
        mov r1, ip\n\
        ldrh r0, [r1, #0x16]\n\
        strh r0, [r2]\n\
        ldr r0, [sp, #0x20]\n\
        ldr r2, [sp, #8]\n\
        cmp r0, r2\n\
        blt _0804E3B6\n\
    _0804E48A:\n\
        ldr r7, [sp, #0x18]\n\
        ldr r3, [sp, #4]\n\
        cmp r7, r3\n\
        bge _0804E526\n\
        ldr r6, _0804E5B8  @ gBG0TilemapBuffer\n\
        ldr r4, _0804E5B4  @ gBG1TilemapBuffer\n\
        ldr r5, [sp, #0x24]\n\
        adds r5, #1\n\
        str r5, [sp, #0xc]\n\
        ldr r3, [sp, #0x30]\n\
        adds r3, #1\n\
        lsls r2, r7, #1\n\
        ldr r1, [sp, #0x30]\n\
        lsls r0, r1, #1\n\
        adds r1, r0, r4\n\
        adds r1, r2, r1\n\
        str r1, [sp, #0x34]\n\
        adds r0, r0, r6\n\
        adds r0, r2, r0\n\
        str r0, [sp, #0x38]\n\
        ldr r5, [sp, #0x24]\n\
        lsls r0, r5, #1\n\
        adds r1, r0, r4\n\
        adds r1, r1, r2\n\
        mov sl, r1\n\
        adds r0, r0, r6\n\
        adds r0, r0, r2\n\
        mov r9, r0\n\
        lsls r3, r3, #1\n\
        adds r0, r3, r4\n\
        adds r0, r0, r2\n\
        mov r8, r0\n\
        adds r3, r3, r6\n\
        adds r3, r2, r3\n\
        ldr r0, [sp, #0xc]\n\
        lsls r0, r0, #1\n\
        str r0, [sp, #0x3c]\n\
        adds r4, r0, r4\n\
        adds r1, r2, r4\n\
        adds r6, r0, r6\n\
        adds r2, r2, r6\n\
    _0804E4DC:\n\
        movs r5, #0\n\
        mov r4, r9\n\
        strh r5, [r4]\n\
        mov r6, ip\n\
        ldrh r0, [r6, #4]\n\
        mov r4, sl\n\
        strh r0, [r4]\n\
        strh r5, [r2]\n\
        ldrh r0, [r6, #4]\n\
        strh r0, [r1]\n\
        ldr r6, [sp, #0x38]\n\
        strh r5, [r6]\n\
        mov r4, ip\n\
        ldrh r0, [r4, #0x1a]\n\
        ldr r5, [sp, #0x34]\n\
        strh r0, [r5]\n\
        movs r6, #0\n\
        strh r6, [r3]\n\
        ldrh r0, [r4, #0x1c]\n\
        mov r4, r8\n\
        strh r0, [r4]\n\
        adds r5, #4\n\
        str r5, [sp, #0x34]\n\
        ldr r5, [sp, #0x38]\n\
        adds r5, #4\n\
        str r5, [sp, #0x38]\n\
        movs r6, #4\n\
        add sl, r6\n\
        add r9, r6\n\
        add r8, r6\n\
        adds r3, #4\n\
        adds r1, #4\n\
        adds r2, #4\n\
        adds r7, #2\n\
        ldr r0, [sp, #4]\n\
        cmp r7, r0\n\
        blt _0804E4DC\n\
    _0804E526:\n\
        ldr r1, [sp, #0x24]\n\
        ldr r3, [sp]\n\
        adds r2, r1, r3\n\
        lsls r2, r2, #1\n\
        ldr r4, _0804E5B8  @ gBG0TilemapBuffer\n\
        adds r0, r2, r4\n\
        movs r1, #0\n\
        strh r1, [r0]\n\
        ldr r5, [sp, #0x24]\n\
        ldr r6, [sp, #4]\n\
        adds r5, r5, r6\n\
        str r5, [sp, #0x10]\n\
        lsls r6, r5, #1\n\
        adds r0, r6, r4\n\
        strh r1, [r0]\n\
        ldr r0, [sp, #0x30]\n\
        adds r4, r0, r3\n\
        lsls r4, r4, #1\n\
        ldr r3, _0804E5B8  @ gBG0TilemapBuffer\n\
        adds r0, r4, r3\n\
        strh r1, [r0]\n\
        ldr r5, [sp, #0x30]\n\
        ldr r0, [sp, #4]\n\
        adds r3, r5, r0\n\
        lsls r3, r3, #1\n\
        ldr r5, _0804E5B8  @ gBG0TilemapBuffer\n\
        adds r0, r3, r5\n\
        strh r1, [r0]\n\
        ldr r0, _0804E5B4  @ gBG1TilemapBuffer\n\
        adds r2, r2, r0\n\
        mov r1, ip\n\
        ldrh r0, [r1]\n\
        strh r0, [r2]\n\
        ldr r0, [sp, #0x24]\n\
        adds r0, #1\n\
        ldr r2, [sp]\n\
        adds r0, r0, r2\n\
        lsls r0, r0, #1\n\
        ldr r5, _0804E5B4  @ gBG1TilemapBuffer\n\
        adds r0, r0, r5\n\
        ldrh r1, [r1, #2]\n\
        strh r1, [r0]\n\
        ldr r1, [sp, #0x1c]\n\
        lsls r0, r1, #5\n\
        adds r1, r0, r2\n\
        lsls r1, r1, #1\n\
        adds r1, r1, r5\n\
        mov r5, ip\n\
        ldrh r2, [r5, #8]\n\
        strh r2, [r1]\n\
        adds r0, #1\n\
        ldr r1, [sp]\n\
        adds r0, r0, r1\n\
        lsls r0, r0, #1\n\
        ldr r2, _0804E5B4  @ gBG1TilemapBuffer\n\
        adds r0, r0, r2\n\
        ldrh r1, [r5, #0xa]\n\
        strh r1, [r0]\n\
        adds r6, r6, r2\n\
        ldrh r0, [r5, #6]\n\
        strh r0, [r6]\n\
        adds r4, r4, r2\n\
        ldrh r0, [r5, #0x18]\n\
        strh r0, [r4]\n\
        adds r3, r3, r2\n\
        ldrh r0, [r5, #0x1e]\n\
        strh r0, [r3]\n\
        b _0804E76A\n\
        .align 2, 0\n\
    _0804E5B0: .4byte sUiFrameModelTilemapLookup\n\
    _0804E5B4: .4byte gBG1TilemapBuffer\n\
    _0804E5B8: .4byte gBG0TilemapBuffer\n\
    _0804E5BC:\n\
        adds r0, r5, #1\n\
        str r0, [sp, #0x1c]\n\
        ldr r3, [sp]\n\
        adds r3, #1\n\
        str r3, [sp, #0x18]\n\
        ldr r4, [sp, #8]\n\
        lsls r4, r4, #5\n\
        str r4, [sp, #0x30]\n\
        ldr r5, [sp, #8]\n\
        cmp r0, r5\n\
        blt _0804E5D4\n\
        b _0804E6F0\n\
    _0804E5D4:\n\
        movs r1, #0\n\
        ldr r6, [sp, #0x1c]\n\
        cmp r0, r6\n\
        bne _0804E5DE\n\
        movs r1, #1\n\
    _0804E5DE:\n\
        mov r9, r1\n\
        ldr r7, [sp, #0x18]\n\
        lsls r5, r0, #5\n\
        adds r1, r0, #1\n\
        mov sl, r1\n\
        adds r0, #2\n\
        str r0, [sp, #0x20]\n\
        mov r2, ip\n\
        adds r2, #0x10\n\
        str r2, [sp, #0x28]\n\
        mov r3, ip\n\
        adds r3, #0x16\n\
        str r3, [sp, #0x2c]\n\
        ldr r4, [sp, #4]\n\
        cmp r7, r4\n\
        bge _0804E67C\n\
        ldr r6, _0804E794  @ gBG0TilemapBuffer\n\
        mov r8, r6\n\
        movs r3, #0\n\
        ldr r2, _0804E798  @ gBG1TilemapBuffer\n\
        mov r0, r9\n\
        str r0, [sp, #0x48]\n\
    _0804E60A:\n\
        adds r0, r5, r7\n\
        lsls r0, r0, #0x10\n\
        lsrs r4, r0, #0x10\n\
        lsls r1, r4, #1\n\
        mov r6, r8\n\
        adds r0, r1, r6\n\
        strh r3, [r0]\n\
        adds r1, r1, r2\n\
        mov r0, ip\n\
        adds r0, #0x12\n\
        ldr r6, [sp, #0x48]\n\
        cmp r6, #0\n\
        beq _0804E626\n\
        subs r0, #8\n\
    _0804E626:\n\
        ldrh r0, [r0]\n\
        strh r0, [r1]\n\
        adds r0, r4, #1\n\
        lsls r0, r0, #0x10\n\
        lsrs r4, r0, #0x10\n\
        lsls r1, r4, #1\n\
        mov r6, r8\n\
        adds r0, r1, r6\n\
        strh r3, [r0]\n\
        adds r1, r1, r2\n\
        mov r0, ip\n\
        adds r0, #0x14\n\
        ldr r6, [sp, #0x48]\n\
        cmp r6, #0\n\
        beq _0804E646\n\
        subs r0, #8\n\
    _0804E646:\n\
        ldrh r0, [r0]\n\
        strh r0, [r1]\n\
        adds r0, r4, #0\n\
        adds r0, #0x1f\n\
        lsls r0, r0, #0x10\n\
        lsrs r4, r0, #0x10\n\
        lsls r1, r4, #1\n\
        mov r6, r8\n\
        adds r0, r1, r6\n\
        strh r3, [r0]\n\
        adds r1, r1, r2\n\
        mov r6, ip\n\
        ldrh r0, [r6, #0x12]\n\
        strh r0, [r1]\n\
        adds r0, r4, #1\n\
        lsls r0, r0, #0x10\n\
        lsrs r0, r0, #0xf\n\
        mov r4, r8\n\
        adds r1, r0, r4\n\
        strh r3, [r1]\n\
        adds r0, r0, r2\n\
        ldrh r1, [r6, #0x14]\n\
        strh r1, [r0]\n\
        adds r7, #2\n\
        ldr r6, [sp, #4]\n\
        cmp r7, r6\n\
        blt _0804E60A\n\
    _0804E67C:\n\
        ldr r1, [sp]\n\
        adds r0, r5, r1\n\
        lsls r0, r0, #1\n\
        ldr r2, _0804E794  @ gBG0TilemapBuffer\n\
        adds r1, r0, r2\n\
        movs r6, #0\n\
        strh r6, [r1]\n\
        ldr r3, _0804E798  @ gBG1TilemapBuffer\n\
        adds r1, r0, r3\n\
        mov r4, r9\n\
        ldr r0, [sp, #0x28]\n\
        cmp r4, #0\n\
        beq _0804E69A\n\
        mov r0, ip\n\
        adds r0, #8\n\
    _0804E69A:\n\
        ldrh r0, [r0]\n\
        strh r0, [r1]\n\
        ldr r0, [sp, #4]\n\
        adds r1, r5, r0\n\
        lsls r1, r1, #1\n\
        ldr r2, _0804E794  @ gBG0TilemapBuffer\n\
        adds r0, r1, r2\n\
        strh r6, [r0]\n\
        ldr r3, _0804E798  @ gBG1TilemapBuffer\n\
        adds r1, r1, r3\n\
        ldr r0, [sp, #0x2c]\n\
        cmp r4, #0\n\
        beq _0804E6B8\n\
        mov r0, ip\n\
        adds r0, #0xe\n\
    _0804E6B8:\n\
        ldrh r0, [r0]\n\
        strh r0, [r1]\n\
        mov r4, sl\n\
        lsls r2, r4, #5\n\
        ldr r5, [sp]\n\
        adds r1, r2, r5\n\
        lsls r1, r1, #1\n\
        ldr r3, _0804E794  @ gBG0TilemapBuffer\n\
        adds r0, r1, r3\n\
        strh r6, [r0]\n\
        ldr r4, _0804E798  @ gBG1TilemapBuffer\n\
        adds r1, r1, r4\n\
        mov r5, ip\n\
        ldrh r0, [r5, #0x10]\n\
        strh r0, [r1]\n\
        ldr r0, [sp, #4]\n\
        adds r2, r2, r0\n\
        lsls r2, r2, #1\n\
        adds r0, r2, r3\n\
        strh r6, [r0]\n\
        adds r2, r2, r4\n\
        ldrh r0, [r5, #0x16]\n\
        strh r0, [r2]\n\
        ldr r0, [sp, #0x20]\n\
        ldr r1, [sp, #8]\n\
        cmp r0, r1\n\
        bge _0804E6F0\n\
        b _0804E5D4\n\
    _0804E6F0:\n\
        ldr r7, [sp, #0x18]\n\
        ldr r2, [sp, #4]\n\
        cmp r7, r2\n\
        bge _0804E740\n\
        ldr r3, _0804E794  @ gBG0TilemapBuffer\n\
        mov r9, r3\n\
        movs r4, #0\n\
        mov r8, r4\n\
        ldr r3, _0804E798  @ gBG1TilemapBuffer\n\
        ldr r2, [sp, #0x30]\n\
        adds r2, #1\n\
        lsls r4, r7, #1\n\
        ldr r5, [sp, #0x30]\n\
        lsls r0, r5, #1\n\
        adds r1, r0, r3\n\
        adds r5, r4, r1\n\
        add r0, r9\n\
        adds r6, r4, r0\n\
        lsls r2, r2, #1\n\
        adds r3, r2, r3\n\
        adds r1, r4, r3\n\
        add r2, r9\n\
        adds r4, r4, r2\n\
    _0804E71E:\n\
        mov r0, r8\n\
        strh r0, [r6]\n\
        mov r2, ip\n\
        ldrh r0, [r2, #0x1a]\n\
        strh r0, [r5]\n\
        mov r3, r8\n\
        strh r3, [r4]\n\
        ldrh r0, [r2, #0x1c]\n\
        strh r0, [r1]\n\
        adds r5, #4\n\
        adds r6, #4\n\
        adds r1, #4\n\
        adds r4, #4\n\
        adds r7, #2\n\
        ldr r0, [sp, #4]\n\
        cmp r7, r0\n\
        blt _0804E71E\n\
    _0804E740:\n\
        ldr r1, [sp, #0x30]\n\
        ldr r3, [sp]\n\
        adds r2, r1, r3\n\
        lsls r2, r2, #1\n\
        ldr r4, _0804E794  @ gBG0TilemapBuffer\n\
        adds r0, r2, r4\n\
        movs r3, #0\n\
        strh r3, [r0]\n\
        ldr r5, [sp, #4]\n\
        adds r1, r1, r5\n\
        lsls r1, r1, #1\n\
        adds r0, r1, r4\n\
        strh r3, [r0]\n\
        ldr r6, _0804E798  @ gBG1TilemapBuffer\n\
        adds r2, r2, r6\n\
        mov r3, ip\n\
        ldrh r0, [r3, #0x18]\n\
        strh r0, [r2]\n\
        adds r1, r1, r6\n\
        ldrh r0, [r3, #0x1e]\n\
        strh r0, [r1]\n\
    _0804E76A:\n\
        movs r0, #0\n\
        movs r1, #0\n\
        movs r2, #0\n\
        bl BG_SetPosition\n\
        movs r0, #1\n\
        movs r1, #0\n\
        movs r2, #0\n\
        bl BG_SetPosition\n\
        movs r0, #3\n\
        bl BG_EnableSyncByMask\n\
        add sp, #0x4c\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _0804E794: .4byte gBG0TilemapBuffer\n\
    _0804E798: .4byte gBG1TilemapBuffer\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCHING

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

    gBG1TilemapBuffer[TILEMAP_INDEX(x, y)] = TILEREF(0x7A, BGPAL_UI_FRAME);

    for (x += 1; x < xMax; ++x)
        gBG1TilemapBuffer[TILEMAP_INDEX(x, y)] = TILEREF(0x7B, BGPAL_UI_FRAME);

    gBG1TilemapBuffer[TILEMAP_INDEX(x, y)] = TILEREF(0x7C, BGPAL_UI_FRAME);

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

    tilemap[TILEMAP_INDEX(x, y)] = TILEREF(0x7A, BGPAL_UI_FRAME) + base;

    for (x += 1; x < xMax; ++x)
        tilemap[TILEMAP_INDEX(x, y)] = TILEREF(0x7B, BGPAL_UI_FRAME) + base;

    tilemap[TILEMAP_INDEX(x, y)] = TILEREF(0x7C, BGPAL_UI_FRAME) + base;

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
    CopyDataWithPossibleUncomp(gUnkUiFrameImage, vram);
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
