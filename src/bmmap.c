#include "global.h"

#include "constants/terrains.h"

#include "hardware.h"
#include "chapterdata.h"
#include "proc.h"
#include "event.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmtrick.h"

static void BmMapInit(void* buffer, u8*** outHandle, int width, int height);

static void RenderBmMapColumn(u16 xOffset);
static void RenderBmMapLine(u16 yOffset);

static void RefreshUnitsOnBmMap(void);
static void RefreshTorchlightsOnBmMap(void);
static void RefreshMinesOnBmMap(void);

enum { MAP_POOL_SIZE = 0x7B8 };

// TODO: figure out what's up with this (overlaps with a lot of other objects?)
extern u16 gBmMapBuffer[];

EWRAM_DATA struct Vec2 gBmMapSize = {};

EWRAM_DATA u8** gBmMapUnit     = NULL;
EWRAM_DATA u8** gBmMapTerrain  = NULL;
EWRAM_DATA u8** gBmMapMovement = NULL;
EWRAM_DATA u8** gBmMapRange    = NULL;
EWRAM_DATA u8** gBmMapFog      = NULL;
EWRAM_DATA u8** gBmMapHidden   = NULL;
EWRAM_DATA u8** gBmMapUnk      = NULL;

EWRAM_DATA static u8 sBmMapUnitPool[MAP_POOL_SIZE] = {};
EWRAM_DATA static u8 sBmMapTerrainPool[MAP_POOL_SIZE] = {};
EWRAM_DATA static u8 sBmMapFogPool[MAP_POOL_SIZE] = {};
EWRAM_DATA static u8 sBmMapHiddenPool[MAP_POOL_SIZE] = {};
EWRAM_DATA static u8 sBmMapUnkPool[MAP_POOL_SIZE] = {};

EWRAM_DATA static u16 sTilesetConfig[0x1000 + 0x200] = {};

EWRAM_DATA static u16 sBmBaseTilesPool[MAP_POOL_SIZE] = {};

static u8** sInitializingMap;

static u8 sBmMapMovementPool[MAP_POOL_SIZE];
static u8 sBmMapRangePool[MAP_POOL_SIZE];

u8*   gTilesetTerrainLookup = (u8*)(sTilesetConfig + 0x1000);
u16** gBmMapBaseTiles       = (u16**)(sBmBaseTilesPool);

void InitChapterMap(int chapterId) {
    UnpackChapterMap(gBmMapBuffer, chapterId);
    UnpackChapterMapGraphics(chapterId);

    BmMapInit(sBmMapUnitPool,     &gBmMapUnit,     gBmMapSize.x, gBmMapSize.y);
    BmMapInit(sBmMapTerrainPool,  &gBmMapTerrain,  gBmMapSize.x, gBmMapSize.y);
    BmMapInit(sBmMapMovementPool, &gBmMapMovement, gBmMapSize.x, gBmMapSize.y);
    BmMapInit(sBmMapRangePool,    &gBmMapRange,    gBmMapSize.x, gBmMapSize.y);
    BmMapInit(sBmMapFogPool,      &gBmMapFog,      gBmMapSize.x, gBmMapSize.y);
    BmMapInit(sBmMapHiddenPool,   &gBmMapHidden,   gBmMapSize.x, gBmMapSize.y);
    BmMapInit(sBmMapUnkPool, &gBmMapUnk, gBmMapSize.x, gBmMapSize.y);

    BmMapFill(gBmMapUnit, 0);
    BmMapFill(gBmMapTerrain, 0);

    InitBaseTilesBmMap();
    ApplyEnabledMapChanges();
    RefreshTerrainBmMap();

    // TODO: chapter id definitions
    if (gRAMChapterData.chapterIndex == 0x75)
        sub_8019624();
}

void InitChapterPreviewMap(int chapterId) {
    UnpackChapterMap(gBmMapBuffer, chapterId);

    BmMapInit(sBmMapUnitPool,    &gBmMapUnit,    gBmMapSize.x, gBmMapSize.y);
    BmMapInit(sBmMapTerrainPool, &gBmMapTerrain, gBmMapSize.x, gBmMapSize.y);

    BmMapFill(gBmMapUnit, 0);
    BmMapFill(gBmMapTerrain, 0);

    InitBaseTilesBmMap();
    RefreshTerrainBmMap();
}

void sub_8019624(void) {
    int ix, iy;

    // Automatic water shadows?

    for (iy = 0; iy < gBmMapSize.y; ++iy) {
        for (ix = 0; ix < gBmMapSize.x; ++ix) {
            int connexion;

            if (gBmMapTerrain[iy][ix] != TERRAIN_WATER)
                continue;

            connexion = 0;

            if (ix > 0) {
                if (gBmMapTerrain[iy][ix - 1] == TERRAIN_FLOOR_17)
                    connexion = 1;

                if (gBmMapTerrain[iy][ix - 1] == TERRAIN_STAIRS)
                    connexion = 1;

                if (gBmMapTerrain[iy][ix - 1] == TERRAIN_CHEST_20)
                    connexion = 1;

                if (gBmMapTerrain[iy][ix - 1] == TERRAIN_CHEST_21)
                    connexion = 1;
            }

            if (iy > 0) {
                if (gBmMapTerrain[iy - 1][ix] == TERRAIN_FLOOR_17)
                    connexion += 2;

                if (gBmMapTerrain[iy - 1][ix] == TERRAIN_STAIRS)
                    connexion += 2;

                if (gBmMapTerrain[iy - 1][ix] == TERRAIN_CHEST_20)
                    connexion += 2;

                if (gBmMapTerrain[iy - 1][ix] == TERRAIN_CHEST_21)
                    connexion += 2;
            }

            if (ix > 0 && iy > 0)
                if ((gBmMapTerrain[iy]    [ix - 1] == TERRAIN_FLOOR_17) &&
                    (gBmMapTerrain[iy + 1][ix - 1] == TERRAIN_WATER) &&
                    (gBmMapTerrain[iy - 1][ix]     != TERRAIN_FLOOR_17))
                    connexion = 4;

            switch (connexion) {

            case 1: // straight shadow on the left
                gBmMapBaseTiles[iy][ix] = 0x2DC;
                break;

            case 2: // straight shadow on the top
                gBmMapBaseTiles[iy][ix] = 0x2D8;
                break;

            case 3: // shadow on both the left and the top
                gBmMapBaseTiles[iy][ix] = 0x358;
                break;

            case 4: // shadow on the left, but stronger at the top-left than bottom-left
                gBmMapBaseTiles[iy][ix] = 0x35C;
                break;

            } // switch (connexion)
        }
    }
}

void sub_8019778(void) {
    UnpackChapterMap(gBmMapBuffer, gRAMChapterData.chapterIndex);

    InitBaseTilesBmMap();
    ApplyEnabledMapChanges();
    RefreshTerrainBmMap();
    sub_8019624();
}

void BmMapInit(void* buffer, u8*** outHandle, int x, int y) {
    int i;
    u8* itBuffer;

    sInitializingMap = buffer;

    x  += 2; // two tiles on each edge (shared)
    y += 4; // two tiles on each edge

    // itBuffer = start of tile area (the first y * sizeof(u8*) bytes are reserved for row pointers)
    itBuffer = buffer + y * sizeof(u8*);

    // Setting up the row pointers
    for (i = 0; i < y; ++i) {
        sInitializingMap[i] = itBuffer;
        itBuffer += x;
    }

    // first row is actually the third, ensuring the top two map rows as safety
    *outHandle = sInitializingMap + 2;
}

void BmMapFill(u8** map, int value) {
    int size = (gBmMapSize.y + 4) * (gBmMapSize.x + 2);

    if (size % 2)
        size = size - 1;

    value = (0xFF & value);
    value += value << 8;

    CpuFill16(value, map[-2], size);

    SetWorkingBmMap(map);
}

void BmMapFillEdges(u8** map, u8 value) {
    int ix, iy;

    u8** theMap = map;

    // Set tile values for horizontal edges
    for (iy = 0; iy < gBmMapSize.y; ++iy) {
        theMap[iy][0]              = value;
        theMap[iy][gBmMapSize.x-1] = value;
    }

    // Set tile values for vertical edges
    for (ix = 0; ix < gBmMapSize.x; ++ix) {
        theMap[0]             [ix] = value;
        theMap[gBmMapSize.y-1][ix] = value;
    }
}

void UnpackChapterMap(void* into, int chapterId) {
    // Decompress map data
    CopyDataWithPossibleUncomp(
        GetChapterMapPointer(chapterId), into);

    // Setting map size
    gBmMapSize.x = ((u8*)(into))[0];
    gBmMapSize.y = ((u8*)(into))[1];

    // Decompress tileset config
    CopyDataWithPossibleUncomp(
        gChapterDataAssetTable[GetROMChapterStruct(chapterId)->mapTileConfigId], sTilesetConfig);

    // Setting max camera offsets (?) TODO: figure out
    gUnknown_0202BCB0.unk28.x = gBmMapSize.x*16 - 240;
    gUnknown_0202BCB0.unk28.y = gBmMapSize.y*16 - 160;
}

void UnpackChapterMapGraphics(int chapterId) {
    // Decompress tileset graphics (part 1)
    CopyDataWithPossibleUncomp(
        gChapterDataAssetTable[GetROMChapterStruct(chapterId)->mapObj1Id],
        (void*)(BG_VRAM + 0x20 * 0x400)); // TODO: tile id constant?

    // Decompress tileset graphics (part 2, if it exists)
    if (gChapterDataAssetTable[GetROMChapterStruct(chapterId)->mapObj2Id])
        CopyDataWithPossibleUncomp(
            gChapterDataAssetTable[GetROMChapterStruct(chapterId)->mapObj2Id],
            (void*)(BG_VRAM + 0x20 * 0x600)); // TODO: tile id constant?

    // Apply tileset palette
    CopyToPaletteBuffer(
        gChapterDataAssetTable[GetROMChapterStruct(chapterId)->mapPaletteId],
        0x20 * 6, 0x20 * 10); // TODO: palette id constant?
}

void UnpackChapterMapPalette(void) {
    CopyToPaletteBuffer(
        gChapterDataAssetTable[GetROMChapterStruct(gRAMChapterData.chapterIndex)->mapPaletteId],
        0x20 * 6, 0x20 * 10); // TODO: palette id constant?
}

void InitBaseTilesBmMap(void) {
    int ix, iy;

    u16** rows;
    u16*  tiles;
    u16*  itBuffer;

    rows  = gBmMapBaseTiles;
    tiles = gBmMapBuffer;

    gBmMapSize.y++; // ?

    // Ignore first short (x, y byte pair)
    tiles++;

    // Tile buffer starts after the rows
    itBuffer = (u16*)(gBmMapBaseTiles + gBmMapSize.y);

    for (iy = 0; iy < gBmMapSize.y; ++iy) {
        // Set row buffer
        rows[iy] = itBuffer;
        itBuffer += gBmMapSize.x;

        // Set tiles
        for (ix = 0; ix < gBmMapSize.x; ++ix)
            gBmMapBaseTiles[iy][ix] = *tiles++;
    }

    // Fill "bottom" row with empty tiles?
    // "bottom" as the y had been increased too this is just weird

    tiles = gBmMapBaseTiles[iy - 1];

    for (ix = 0; ix < gBmMapSize.x; ++ix)
        *tiles++ = 0;

    gBmMapSize.y--; // ?
}

void RefreshTerrainBmMap(void) {
    int ix, iy;

    for (iy = 0; iy < gBmMapSize.y; ++iy)
        for (ix = 0; ix < gBmMapSize.x; ++ix)
            gBmMapTerrain[iy][ix] = gTilesetTerrainLookup[gBmMapBaseTiles[iy][ix] >> 2];

    RefreshAllLightRunes();
}

int GetTrueTerrainAt(int x, int y) {
    return gTilesetTerrainLookup[gBmMapBaseTiles[y][x] >> 2];
}

void DisplayBmTile(u16* bg, int xTileMap, int yTileMap, int xBmMap, int yBmMap) {
    u16* out = bg + yTileMap * 0x40 + xTileMap * 2; // TODO: BG_LOCATED_TILE?
    u16* tile = sTilesetConfig + gBmMapBaseTiles[yBmMap][xBmMap];

    // TODO: palette id constants
    u16 base = gBmMapFog[yBmMap][xBmMap] ? (6 << 12) : (11 << 12);

    out[0x00 + 0] = base + *tile++;
    out[0x00 + 1] = base + *tile++;
    out[0x20 + 0] = base + *tile++;
    out[0x20 + 1] = base + *tile++;
}

void nullsub_8(void) {}

void DisplayMovementViewTile(u16* bg, int xBmMap, int yBmMap, int xTileMap, int yTileMap) {
    bg = bg + 2*(yTileMap * 0x20 + xTileMap);

    if (!bg)
        nullsub_8();

    // TODO: tile macros?
    // TODO: are the movement and range maps s8[][]?

    if (((s8**)(gBmMapMovement))[yBmMap][xBmMap] >= 0) {
        bg[0x00 + 0] = 0x4280;
        bg[0x00 + 1] = 0x4281;
        bg[0x20 + 0] = 0x4282;
        bg[0x20 + 1] = 0x4283;

        return;
    }

    if (((s8**)(gBmMapRange))[yBmMap][xBmMap]) {
        if (bg[0]) {
            bg[0x00 + 0] = 0x5284;
            bg[0x00 + 1] = 0x5285;
            bg[0x20 + 0] = 0x5286;
            bg[0x20 + 1] = 0x5287;

            return;
        } else {
            bg[0x00 + 0] = 0x5280;
            bg[0x00 + 1] = 0x5281;
            bg[0x20 + 0] = 0x5282;
            bg[0x20 + 1] = 0x5283;

            return;
        }
    }

    bg[0x00 + 0] = 0;
    bg[0x00 + 1] = 0;
    bg[0x20 + 0] = 0;
    bg[0x20 + 1] = 0;
}

void RenderBmMap(void) {
    int ix, iy;

    gUnknown_0202BCB0.mapRenderOrigin.x = gUnknown_0202BCB0.camera.x >> 4;
    gUnknown_0202BCB0.mapRenderOrigin.y = gUnknown_0202BCB0.camera.y >> 4;

    for (iy = (10 - 1); iy >= 0; --iy)
        for (ix = (15 - 1); ix >= 0; --ix)
            DisplayBmTile(gBG3TilemapBuffer, ix, iy,
                (short) gUnknown_0202BCB0.mapRenderOrigin.x + ix, (short) gUnknown_0202BCB0.mapRenderOrigin.y + iy);

    BG_EnableSyncByMask(1 << 3);
    BG_SetPosition(3, 0, 0);

    gLCDControlBuffer.dispcnt.bg0_on = TRUE;
    gLCDControlBuffer.dispcnt.bg1_on = TRUE;
    gLCDControlBuffer.dispcnt.bg2_on = TRUE;
    gLCDControlBuffer.dispcnt.bg3_on = TRUE;
    gLCDControlBuffer.dispcnt.obj_on = TRUE;
}

void RenderBmMapOnBg2(void) {
    int ix, iy;

    SetBackgroundTileDataOffset(2, 0x8000);

    gUnknown_0202BCB0.mapRenderOrigin.x = gUnknown_0202BCB0.camera.x >> 4;
    gUnknown_0202BCB0.mapRenderOrigin.y = gUnknown_0202BCB0.camera.y >> 4;

    for (iy = (10 - 1); iy >= 0; --iy)
        for (ix = (15 - 1); ix >= 0; --ix)
            DisplayBmTile(gBG2TilemapBuffer, ix, iy,
                (short) gUnknown_0202BCB0.mapRenderOrigin.x + ix, (short) gUnknown_0202BCB0.mapRenderOrigin.y + iy);

    BG_EnableSyncByMask(1 << 2);
    BG_SetPosition(2, 0, 0);
}

void UpdateBmMapDisplay(void) {
    // TODO: figure out

    if (gUnknown_0202BCB0.camera.x != gUnknown_0202BCB0.cameraPrevious.x) {
        if (gUnknown_0202BCB0.camera.x > gUnknown_0202BCB0.cameraPrevious.x) {
            if (((gUnknown_0202BCB0.camera.x - 1) ^ (gUnknown_0202BCB0.cameraPrevious.x - 1)) & 0x10)
                RenderBmMapColumn(15);
        } else {
            if ((gUnknown_0202BCB0.camera.x ^ gUnknown_0202BCB0.cameraPrevious.x) & 0x10)
                RenderBmMapColumn(0);
        }
    }

    if (gUnknown_0202BCB0.camera.y != gUnknown_0202BCB0.cameraPrevious.y) {
        if (gUnknown_0202BCB0.camera.y > gUnknown_0202BCB0.cameraPrevious.y) {
            if (((gUnknown_0202BCB0.camera.y - 1) ^ (gUnknown_0202BCB0.cameraPrevious.y - 1)) & 0x10)
                RenderBmMapLine(10);
        } else {
            if ((gUnknown_0202BCB0.camera.y ^ gUnknown_0202BCB0.cameraPrevious.y) & 0x10)
                RenderBmMapLine(0);
        }
    }

    gUnknown_0202BCB0.cameraPrevious = gUnknown_0202BCB0.camera;

    BG_SetPosition(3,
        gUnknown_0202BCB0.camera.x - gUnknown_0202BCB0.mapRenderOrigin.x * 16,
        gUnknown_0202BCB0.camera.y - gUnknown_0202BCB0.mapRenderOrigin.y * 16
    );

    // TODO: GAME STATE BITS CONSTANTS
    if (gUnknown_0202BCB0.gameStateBits & 1) {
        BG_SetPosition(2,
            gUnknown_0202BCB0.camera.x - gUnknown_0202BCB0.mapRenderOrigin.x * 16,
            gUnknown_0202BCB0.camera.y - gUnknown_0202BCB0.mapRenderOrigin.y * 16
        );
    }
}

void RenderBmMapColumn(u16 xOffset) {
    u16 xBmMap = (gUnknown_0202BCB0.camera.x >> 4) + xOffset;
    u16 yBmMap = (gUnknown_0202BCB0.camera.y >> 4);

    u16 xTileMap = ((gUnknown_0202BCB0.camera.x >> 4) - gUnknown_0202BCB0.mapRenderOrigin.x + xOffset) & 0xF;
    u16 yTileMap = ((gUnknown_0202BCB0.camera.y >> 4) - gUnknown_0202BCB0.mapRenderOrigin.y);

    int iy;

    if (!(gUnknown_0202BCB0.gameStateBits & 1)) {
        for (iy = 10; iy >= 0; --iy) {
            DisplayBmTile(gBG3TilemapBuffer,
                xTileMap, (yTileMap + iy) & 0xF,
                xBmMap, (yBmMap + iy));
        }

        BG_EnableSyncByMask(1 << 3);
    } else {
        for (iy = 10; iy >= 0; --iy) {
            DisplayBmTile(gBG3TilemapBuffer,
                xTileMap, (yTileMap + iy) & 0xF,
                xBmMap, (yBmMap + iy));

            DisplayMovementViewTile(gBG2TilemapBuffer,
                xBmMap, (yBmMap + iy),
                xTileMap, (yTileMap + iy) & 0xF);
        }

        BG_EnableSyncByMask((1 << 3) | (1 << 2));
    }
}

void RenderBmMapLine(u16 yOffset) {
    u16 xBmMap = (gUnknown_0202BCB0.camera.x >> 4);
    u16 yBmMap = (gUnknown_0202BCB0.camera.y >> 4) + yOffset;

    u16 xTileMap = ((gUnknown_0202BCB0.camera.x >> 4) - gUnknown_0202BCB0.mapRenderOrigin.x);
    u16 yTileMap = ((gUnknown_0202BCB0.camera.y >> 4) - gUnknown_0202BCB0.mapRenderOrigin.y + yOffset) & 0xF;

    int ix;

    if (!(gUnknown_0202BCB0.gameStateBits & 1)) {
        for (ix = 15; ix >= 0; --ix) {
            DisplayBmTile(gBG3TilemapBuffer,
                (xTileMap + ix) & 0xF, yTileMap,
                (xBmMap + ix), yBmMap);
        }

        BG_EnableSyncByMask(1 << 3);
    } else {
        for (ix = 15; ix >= 0; --ix) {
            DisplayBmTile(gBG3TilemapBuffer,
                (xTileMap + ix) & 0xF, yTileMap,
                (xBmMap + ix), yBmMap);

            DisplayMovementViewTile(gBG2TilemapBuffer,
                (xBmMap + ix), yBmMap,
                (xTileMap + ix) & 0xF, yTileMap);
        }

        BG_EnableSyncByMask((1 << 3) | (1 << 2));
    }
}

void RefreshUnitsOnBmMap(void) {
    struct Unit* unit;
    int i;

    // 1. Blue & Green units

    for (i = 1; i < FACTION_RED; ++i) {
        unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_HIDDEN)
            continue;

        // Put unit on unit map
        gBmMapUnit[unit->yPos][unit->xPos] = i;

        // If fog is enabled, apply unit vision to fog map
        if (gRAMChapterData.chapterVisionRange)
            MapAddInRange(unit->xPos, unit->yPos, GetUnitFogViewRange(unit), 1);
    }

    // 2. Red (& Purple) units

    if (gRAMChapterData.chapterPhaseIndex != FACTION_RED) {
        // 2.1. No red phase

        for (i = FACTION_RED + 1; i < FACTION_PURPLE + 6; ++i) {
            unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit))
                continue;

            if (unit->state & US_HIDDEN)
                continue;

            // If unit is magic seal, set fog in range 0-10.
            // Magic seal set the fog map probably solely for the alternate map palette.
            if (UNIT_CATTRIBUTES(unit) & CA_MAGICSEAL)
                MapAddInRange(unit->xPos, unit->yPos, 10, -1);

            if (gRAMChapterData.chapterVisionRange && !gBmMapFog[unit->yPos][unit->xPos]) {
                // If in fog, set unit bit on the hidden map, and set the "hidden in fog" state

                gBmMapHidden[unit->yPos][unit->xPos] |= HIDDEN_BIT_UNIT;
                unit->state = unit->state | US_BIT9;
            } else {
                // If not in fog, put unit on the map, and update state accordingly

                gBmMapUnit[unit->yPos][unit->xPos] = i;

                if (unit->state & US_BIT9)
                    unit->state = (unit->state &~ US_BIT9) | US_BIT8;
            }
        }
    } else {
        // 2.2. Yes red phase

        // This does mostly the same as the "No red phase" loop, except:
        // - It always puts the units on the unit map
        // - It never sets the "spotted" unit state bit (even if unit is seen)

        for (i = FACTION_RED + 1; i < FACTION_PURPLE + 6; ++i) {
            unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit))
                continue;

            if (unit->state & US_HIDDEN)
                continue;

            // See above
            if (UNIT_CATTRIBUTES(unit) & CA_MAGICSEAL)
                MapAddInRange(unit->xPos, unit->yPos, 10, -1);

            if (gRAMChapterData.chapterVisionRange) {
                // Update unit state according to fog level

                if (!gBmMapFog[unit->yPos][unit->xPos])
                    unit->state = unit->state | US_BIT9;
                else
                    unit->state = unit->state &~ US_BIT9;
            }

            // Put on unit map
            gBmMapUnit[unit->yPos][unit->xPos] = i;
        }
    }
}

void RefreshTorchlightsOnBmMap(void) {
    struct Trap* trap;
    
    for (trap = GetTrap(0); trap->type != TRAP_NONE; ++trap) {
        switch (trap->type) {

        case TRAP_TORCHLIGHT:
            MapAddInRange(trap->xPos, trap->yPos, trap->extra, 1);
            break;

        } // switch (trap->type)
    }
}

void RefreshMinesOnBmMap(void) {
    struct Trap* trap;
    
    for (trap = GetTrap(0); trap->type != TRAP_NONE; ++trap) {
        switch (trap->type) {

        case TRAP_MINE:
            if (!gBmMapUnit[trap->yPos][trap->xPos])
                gBmMapHidden[trap->yPos][trap->xPos] |= HIDDEN_BIT_TRAP;

            break;

        } // switch (trap->type)
    }
}

void RefreshEntityBmMaps(void) {
    // 1. Clear unit & hidden maps

    BmMapFill(gBmMapUnit, 0);
    BmMapFill(gBmMapHidden, 0);

    // 2. Clear fog map, with 1 (visible) if no fog, with 0 (hidden) if yes fog

    BmMapFill(gBmMapFog, !gRAMChapterData.chapterVisionRange ? 1 : 0);

    // 3. Populate unit, fog & hidden maps

    RefreshTorchlightsOnBmMap();
    RefreshUnitsOnBmMap();
    RefreshMinesOnBmMap();
}

char* GetTerrainName(int terrainId) {
    return GetStringFromIndex(gUnknown_0880D374[terrainId]);
}

int GetTerrainHealAmount(int terrainId) {
    return gUnknown_0880C744[terrainId];
}

int GetTerrainUnk(int terrainId) {
    return gUnknown_0880C785[terrainId];
}

void sub_801A278(void) {
    const u16* tile = sTilesetConfig;

    // TODO: game state bits constants
    if (!sub_800D208() || (gUnknown_0202BCB0.gameStateBits & 0x10)) {
        // TODO: macros?
        RegisterBlankTile(0x400 + (*tile++ & 0x3FF));
        RegisterBlankTile(0x400 + (*tile++ & 0x3FF));
        RegisterBlankTile(0x400 + (*tile++ & 0x3FF));
        RegisterBlankTile(0x400 + (*tile++ & 0x3FF));
    }

    // TODO: macro?
    gPaletteBuffer[0] = 0;
    EnablePaletteSync();
}

void RevertMapChange(int id) {
    const struct MapChange* mapChange;
    u8 ix, iy;

    CopyDataWithPossibleUncomp(GetChapterMapPointer(gRAMChapterData.chapterIndex), gBmMapBuffer);

    mapChange = GetMapChange(id);

    for (iy = mapChange->yOrigin; iy < (mapChange->yOrigin + mapChange->ySize); ++iy) {
        u16* itSource = (iy * gBmMapSize.x) + mapChange->xOrigin + (gBmMapBuffer + 1);
        u16* itDest   = gBmMapBaseTiles[iy] + mapChange->xOrigin;

        for (ix = mapChange->xOrigin; ix < (mapChange->xOrigin + mapChange->xSize); ++ix)
            *itDest++ = *itSource++;
    }
}
