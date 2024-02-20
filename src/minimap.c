#include "global.h"

#include "constants/terrains.h"

#include "bmmap.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bm.h"
#include "bmlib.h"
#include "bmunit.h"
#include "ctc.h"

#include "minimap.h"

struct MinimapProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ int xCameraSpeed;
    /* 30 */ int yCameraSpeed;
    /* 34 */ int xRegionRadius;
    /* 38 */ int yRegionRadius;
    /* 3C */ int xScreen;
    /* 40 */ int yScreen;
    /* 44 */ STRUCT_PAD(0x44, 0x4A);
    /* 4A */ s16 cameraMoved;
    /* 4C */ s16 animClock;
};

extern u8 gGfx_MinimapTiles[];
extern u16 gPal_MinimapTiles[];
extern u16 gPal_08A1FFD0[];

extern s16 gMinimapWinBuf[320 * 2];

extern s16* gMinimapFrontWinBuf;
extern s16* gMinimapBackWinBuf;
extern s16* gMinimapDisplayedWinBuf;

void ApplyMinimapGraphics(int);
void Minimap_InitProcVars(struct MinimapProc*);

void Minimap_Init(ProcPtr proc);
void Minimap_AdjustDisplay(struct MinimapProc* proc);
void Minimap_InitOpenAnim(struct MinimapProc* proc);
void Minimap_OpenAnim(struct MinimapProc* proc);
void InitMinimapFlashPalette(void);
void Minimap_Main(ProcPtr proc);
void Minimap_InitCloseAnim(struct MinimapProc* proc);
void Minimap_CloseAnim(struct MinimapProc* proc);
void Minimap_AdjustCursorOnClose(struct MinimapProc* proc);

struct ProcCmd CONST_DATA gProcScr_Minimap[] = {
    PROC_CALL(LockGame),
    PROC_SLEEP(0),

    PROC_CALL(ClearBg0Bg1),
    PROC_SLEEP(0),

    PROC_CALL(Minimap_Init),
    PROC_CALL(Minimap_AdjustDisplay),

    PROC_CALL(Minimap_InitOpenAnim),
    PROC_REPEAT(Minimap_OpenAnim),

    PROC_CALL(InitMinimapFlashPalette),

    PROC_REPEAT(Minimap_Main),

    PROC_CALL(Minimap_InitCloseAnim),
    PROC_REPEAT(Minimap_CloseAnim),

    PROC_CALL(Minimap_AdjustCursorOnClose),

    PROC_CALL(ClearBg0Bg1),
    PROC_SLEEP(0),

    PROC_CALL(LoadUiFrameGraphics),
    PROC_CALL(ResetText),
    PROC_CALL(LoadObjUIGfx),

    PROC_CALL(UnlockGame),

    PROC_END,
};

//! FE8U = 0x080A7578
int GetMinimapConnectKindAt(int x, int y) {
    int index = 0;

    int terrainId = gBmMapTerrain[y][x];

    if (gBmMapTerrain[y + 1][x] == terrainId) {
        index += 1;
    }

    index *= 2;

    if (gBmMapTerrain[y - 1][x] == terrainId) {
        index += 1;
    }

    index *= 2;

    if (gBmMapTerrain[y][x + 1] == terrainId) {
        index += 1;
    }

    index *= 2;

    if (gBmMapTerrain[y][x - 1] == terrainId) {
        index += 1;
    }

    return index;
}

//! FE8U = 0x080A75CC
int NormalizeSeaMinimapTerrain(int terrainId) {
    switch (terrainId) {
        case TERRAIN_DEEPS:
        case TERRAIN_GUNNELS:
        case TERRAIN_TILE_00:
            return TERRAIN_SEA;
        default:
            return terrainId;
    }
}

//! FE8U = 0x080A75E8
int GetMinimapSeaKindAt(int x, int y) {
    int terrainIdA;
    int terrainIdB;

    int index = 0;

    terrainIdA = NormalizeSeaMinimapTerrain(gBmMapTerrain[y][x]);
    terrainIdB = NormalizeSeaMinimapTerrain(gBmMapTerrain[y + 1][x]);

    if (terrainIdB == terrainIdA) {
        index += 1;
    }

    index *= 2;

    terrainIdB = NormalizeSeaMinimapTerrain(gBmMapTerrain[y - 1][x]);

    if (terrainIdB == terrainIdA) {
        index += 1;
    }

    index *= 2;

    terrainIdB = NormalizeSeaMinimapTerrain(gBmMapTerrain[y][x + 1]);

    if (terrainIdB == terrainIdA) {
        index += 1;
    }

    index *= 2;

    terrainIdB = NormalizeSeaMinimapTerrain(gBmMapTerrain[y][x - 1]);

    if (terrainIdB == terrainIdA) {
        index += 1;
    }

    return index;
}

//! FE8U = 0x080A767C
int NormalizeWaterMinimapTerrain(int terrainId) {
    switch (terrainId) {
        case TERRAIN_FLOOR_17:
        case TERRAIN_WALL_1A:
        case TERRAIN_BRACE:
        case TERRAIN_TILE_00:
            return TERRAIN_WATER;
        default:
            return terrainId;
    }
}

//! FE8U = 0x080A769C
int GetMinimapWaterKindAt(int x, int y) {
    int terrainIdA;
    int terrainIdB;

    int index = 0;

    terrainIdA = NormalizeWaterMinimapTerrain(gBmMapTerrain[y][x]);
    terrainIdB = NormalizeWaterMinimapTerrain(gBmMapTerrain[y + 1][x]);

    if (terrainIdB == terrainIdA) {
        index += 1;
    }

    index *= 2;

    terrainIdB = NormalizeWaterMinimapTerrain(gBmMapTerrain[y - 1][x]);

    if (terrainIdB == terrainIdA) {
        index += 1;
    }

    index *= 2;

    terrainIdB = NormalizeWaterMinimapTerrain(gBmMapTerrain[y][x + 1]);

    if (terrainIdB == terrainIdA) {
        index += 1;
    }

    index *= 2;

    terrainIdB = NormalizeWaterMinimapTerrain(gBmMapTerrain[y][x - 1]);

    if (terrainIdB == terrainIdA) {
        index += 1;
    }

    return index;
}

//! FE8U = 0x080A7730
int GetMinimapRiverKindAt(int x, int y) {
    int terrainId;

    int index = 0;

    terrainId = gBmMapTerrain[y + 1][x];

    if ((terrainId == TERRAIN_RIVER) ||
        (terrainId == TERRAIN_SEA) ||
        (terrainId == TERRAIN_DEEPS) ||
        (terrainId == TERRAIN_LAKE) ||
        (terrainId == TERRAIN_BRIDGE_13)) {
        index += 1;
    }

    index *= 2;

    terrainId = gBmMapTerrain[y - 1][x];

    if ((terrainId == TERRAIN_RIVER) ||
        (terrainId == TERRAIN_SEA) ||
        (terrainId == TERRAIN_DEEPS) ||
        (terrainId == TERRAIN_LAKE) ||
        (terrainId == TERRAIN_BRIDGE_13)) {
        index += 1;
    }

    index *= 2;

    terrainId = gBmMapTerrain[y][x + 1];

    if ((terrainId == TERRAIN_RIVER) ||
        (terrainId == TERRAIN_SEA) ||
        (terrainId == TERRAIN_DEEPS) ||
        (terrainId == TERRAIN_LAKE) ||
        (terrainId == TERRAIN_BRIDGE_13)) {
        index += 1;
    }

    index *= 2;

    terrainId = gBmMapTerrain[y][x - 1];

    if ((terrainId == TERRAIN_RIVER) ||
        (terrainId == TERRAIN_SEA) ||
        (terrainId == TERRAIN_DEEPS) ||
        (terrainId == TERRAIN_LAKE) ||
        (terrainId == TERRAIN_BRIDGE_13)) {
        index += 1;
    }

    return index;
}

//! FE8U = 0x080A77D4
int GetMinimapCliffKindAt(int x, int y) {

    int terrainId = gBmMapTerrain[y][x];

    if ((gBmMapTerrain[y][x - 1] == terrainId) ||
        (gBmMapTerrain[y][x + 1] == terrainId)) {

        if ((gBmMapTerrain[y - 1][x] == TERRAIN_SEA) ||
            (gBmMapTerrain[y - 1][x] == TERRAIN_DEEPS) ||
            (gBmMapTerrain[y - 1][x] == TERRAIN_LAKE)) {
            return 4;
        }

        if ((gBmMapTerrain[y + 1][x] == TERRAIN_SEA) ||
            (gBmMapTerrain[y + 1][x] == TERRAIN_DEEPS) ||
            (gBmMapTerrain[y + 1][x] == TERRAIN_LAKE)) {
            return 0;
        }

        if (gBmMapTerrain[y - 1][x] == TERRAIN_DESERT) {
            return 0xC;
        }

        return 8;
    }

    if ((gBmMapTerrain[y - 1][x] == terrainId) ||
        (gBmMapTerrain[y + 1][x] == terrainId)) {

        if ((gBmMapTerrain[y][x + 1] == TERRAIN_SEA) ||
            (gBmMapTerrain[y][x + 1] == TERRAIN_DEEPS) ||
            (gBmMapTerrain[y][x + 1] == TERRAIN_LAKE)) {
            return 2;
        }

        if ((gBmMapTerrain[y][x - 1] == TERRAIN_SEA) ||
            (gBmMapTerrain[y][x - 1] == TERRAIN_DEEPS) ||
            (gBmMapTerrain[y][x - 1] == TERRAIN_LAKE)) {
            return 6;
        }

        if (gBmMapTerrain[y][x + 1] == TERRAIN_DESERT) {
            return 0xD;
        }

        return 9;

    }

    if ((gBmMapTerrain[y + 1][x - 1] == terrainId) ||
        (gBmMapTerrain[y - 1][x + 1] == terrainId)) {

        if ((gBmMapTerrain[y - 1][x - 1] == TERRAIN_SEA) ||
            (gBmMapTerrain[y - 1][x - 1] == TERRAIN_DEEPS) ||
            (gBmMapTerrain[y - 1][x - 1] == TERRAIN_LAKE)) {
            return 5;
        }

        if ((gBmMapTerrain[y + 1][x + 1] == TERRAIN_SEA) ||
            (gBmMapTerrain[y + 1][x + 1] == TERRAIN_DEEPS) ||
            (gBmMapTerrain[y + 1][x + 1] == TERRAIN_LAKE)) {
            return 1;
        }

        if (gBmMapTerrain[y - 1][x - 1] == TERRAIN_DESERT) {
            return 0xE;
        }

        return 10;
    }

    if ((gBmMapTerrain[y + 1][x + 1] == terrainId) ||
        (gBmMapTerrain[y - 1][x - 1] == terrainId)) {

        if ((gBmMapTerrain[y - 1][x + 1] == TERRAIN_SEA) ||
            (gBmMapTerrain[y - 1][x + 1] == TERRAIN_DEEPS) ||
            (gBmMapTerrain[y - 1][x + 1] == TERRAIN_LAKE)) {
            return 3;
        }

        if ((gBmMapTerrain[y + 1][x - 1] == TERRAIN_SEA) ||
            (gBmMapTerrain[y + 1][x - 1] == TERRAIN_DEEPS) ||
            (gBmMapTerrain[y + 1][x - 1] == TERRAIN_LAKE)) {
            return 7;
        }

        if (gBmMapTerrain[y - 1][x + 1] == TERRAIN_DESERT) {
            return 0xF;
        }

        return 0xB;
    }

    return 8;
}

//! FE8U = 0x080A78FC
int GetMinimapStairTileAt(int x, int y) {
    if (gBmMapTerrain[y - 1][x] == TERRAIN_STAIRS) {
        return 0x12;
    }

    if (gBmMapTerrain[y + 1][x] == TERRAIN_STAIRS) {
        return 0x12;
    }

    if (gBmMapTerrain[y][x - 1] == TERRAIN_STAIRS) {
        return 0x12;
    }

    if (gBmMapTerrain[y][x + 1] != TERRAIN_STAIRS) {
        return 0x11;
    }

    return 0x12;
}

//! FE8U = 0x080A7940
int GetMinimapDoorTileAt(int x, int y) {

    if (gBmMapTerrain[y][x + 1] == TERRAIN_DOOR) {
        return 0x16;
    }

    if (gBmMapTerrain[y][x - 1] == TERRAIN_DOOR) {
        return 0x17;
    }

    return 7;
}

//! FE8U = 0x080A7970
int GetMinimapBridgeKindAt(int x, int y) {
    if ((gBmMapTerrain[y][x + 1] == TERRAIN_BRIDGE_13) ||
        (gBmMapTerrain[y][x - 1] == TERRAIN_BRIDGE_13)) {
        return 0x10;
    }

    if ((gBmMapTerrain[y + 1][x] == TERRAIN_BRIDGE_13) ||
        (gBmMapTerrain[y - 1][x] == TERRAIN_BRIDGE_13)) {
        return 0x18;
    }

    if ((gBmMapTerrain[y][x + 1] == TERRAIN_RIVER) ||
        (gBmMapTerrain[y][x - 1] == TERRAIN_RIVER)) {
        return 0x18;
    }

    if ((gBmMapTerrain[y + 1][x] == TERRAIN_RIVER) ||
        (gBmMapTerrain[y - 1][x] == TERRAIN_RIVER)) {
        return 0x10;
    }

    if ((gBmMapTerrain[y][x + 1] == TERRAIN_LAKE) ||
        (gBmMapTerrain[y][x - 1] == TERRAIN_LAKE)) {
        return 0x18;
    }

    if ((gBmMapTerrain[y + 1][x] == TERRAIN_LAKE) ||
        (gBmMapTerrain[y - 1][x] == TERRAIN_LAKE)) {
        return 0x10;
    }

    if ((gBmMapTerrain[y][x + 1] == TERRAIN_WATER) ||
        (gBmMapTerrain[y][x - 1] == TERRAIN_WATER)) {
        return 0x18;
    }

    if ((gBmMapTerrain[y + 1][x] == TERRAIN_WATER) ||
        (gBmMapTerrain[y - 1][x] == TERRAIN_WATER)) {
        return 0x10;
    }

    // return; // BUG?
}

//! FE8U = 0x080A7A0C
int GetMinimapTileAt(int x, int y) {
    switch (gBmMapTerrain[y][x]) {
        case TERRAIN_PLAINS:
            return 1;

        case TERRAIN_ROAD:
            return GetMinimapConnectKindAt(x, y) + 0x40;

        case TERRAIN_VILLAGE_03:
        case TERRAIN_VILLAGE_04:
        case TERRIAN_HOUSE:
        case TERRAIN_GATE_23:
        case TERRAIN_INN:
            return 2;

        case TERRAIN_ARMORY:
        case TERRAIN_VENDOR:
            return 3;

        case TERRAIN_ARENA_08:
            return 4;

        case TERRAIN_FORT:
            return 5;

        case TERRAIN_GATE_0B:
        case TERRAIN_RUINS_37:
            return 6;

        case TERRAIN_FOREST:
        case TERRAIN_SNAG:
            return 8;

        case TERRAIN_THICKET:
            return 9;

        case TERRAIN_SAND:
        case TERRAIN_DESERT:
            return 0xA;

        case TERRAIN_RIVER:
            return GetMinimapRiverKindAt(x, y) + 0x60;

        case TERRAIN_MOUNTAIN:
            return 0xB;

        case TERRAIN_PEAK:
            return 0x14;

        case TERRAIN_BRIDGE_13:
        case TERRAIN_BRIDGE_34:
            return GetMinimapBridgeKindAt(x, y);

        case TERRAIN_WATER:
            return GetMinimapWaterKindAt(x, y) + 0x30;

        case TERRAIN_SEA:
        case TERRAIN_LAKE:
        case TERRAIN_GLACIER:
        case TERRAIN_SKY:
        case TERRAIN_DEEPS:
            return GetMinimapSeaKindAt(x, y) + 0x30;

        case TERRAIN_FLOOR_17:
        case TERRAIN_FLOOR_18:
        case TERRAIN_DECK:
            return 0xC;

        case TERRAIN_PILLAR:
            return 0xD;

        case TERRAIN_DOOR:
            return GetMinimapDoorTileAt(x, y);

        case TERRAIN_THRONE:
            return 0xE;

        case TERRAIN_CHEST_20:
        case TERRAIN_CHEST_21:
            return 0xF;

        case TERRAIN_RUINS_25:
            return 0x1A;

        case TERRAIN_DARK:
            return 0x1B;

        case TERRAIN_CLIFF:
        case TERRAIN_BONE:
            return GetMinimapCliffKindAt(x, y) + 0x50;

        case TERRAIN_BALLISTA_REGULAR:
        case TERRAIN_BALLISTA_LONG:
        case TERRAIN_BALLISTA_KILLER:
            return 0x13;

        case TERRAIN_SHIP_FLAT:
            return 0x3A;

        case TERRAIN_STAIRS:
            return GetMinimapStairTileAt(x, y);

        case TERRAIN_FENCE_19:
        case TERRAIN_WALL_1A:
        case TERRAIN_WALL_1B:
        case TERRAIN_RUBBLE:
        case TERRAIN_ROOF:
        case TERRAIN_SHIP_WRECK:
        case TERRAIN_TILE_2C:
        case TERRAIN_TILE_2E:
        case TERRAIN_BARREL:
        case TERRAIN_GUNNELS:
        case TERRAIN_BRACE:
        case TERRAIN_MAST:
            return GetMinimapConnectKindAt(x, y) + 0x20;

        case TERRAIN_VALLEY:
            return 0x19;

        case TERRAIN_TILE_00:
        case TERRAIN_C_ROOM_09:
        case TERRAIN_BRIDGE_14:
        case TERRAIN_CHURCH:
        case TERRAIN_ARENA_30:
        case TERRAIN_FENCE_32:
        default:
            return 0;
    }
}

//! FE8U = 0x080A7BF8
u16* GetMinimapTerrainCellAt(int x, int y) {
    return (u16*)(gGenericBuffer + (GetMinimapTileAt(x, y) * 0x20));
}

//! FE8U = 0x080A7C0C
u16* GetMinimapObjectCellAt(int x, int y) {
    u8 factionIconOffsetLut[] = {
        [FACTION_ID_BLUE]  = 0x1D,
        [FACTION_ID_GREEN] = 0x1F,
        [FACTION_ID_RED]   = 0x1E,
    };

    int unitId = gBmMapUnit[y][x];

    if (unitId == 0) {
        return (u16*)(gGenericBuffer + 0x00);
    } else {
        return (u16*)(gGenericBuffer + (factionIconOffsetLut[unitId >> 6] * 0x20));
    }
}

//! FE8U = 0x080A7C5C
void DrawMinimapInternal(u16* vram, int palId) {
    int iy;
    int ix;
    int chr;

    if (vram == 0) {
        vram = (void*)(BG_VRAM + 0x20);
    }

    chr = ((u32)vram << 15) >> 20;

    if (palId < 0) {
        palId = 3;
    }

    for (iy = 0; iy < gBmMapSize.y; iy += 2) {
        for (ix = 0; ix < gBmMapSize.x; ix += 2) {
            u16* iterA = GetMinimapTerrainCellAt(ix, iy);
            u16* iterB = GetMinimapTerrainCellAt(ix + 1, iy);

            *vram++ = *iterA;
            iterA += 2;
            *vram++ = *iterB;
            iterB += 2;
            *vram++ = *iterA;
            iterA += 2;
            *vram++ = *iterB;
            iterB += 2;
            *vram++ = *iterA;
            iterA += 2;
            *vram++ = *iterB;
            iterB += 2;
            *vram++ = *iterA;
            iterA += 2;
            *vram++ = *iterB;
            iterB += 2;

            iterA = GetMinimapTerrainCellAt(ix, iy + 1);
            iterB = GetMinimapTerrainCellAt(ix + 1, iy + 1);

            *vram++ = *iterA;
            iterA += 2;
            *vram++ = *iterB;
            iterB += 2;
            *vram++ = *iterA;
            iterA += 2;
            *vram++ = *iterB;
            iterB += 2;
            *vram++ = *iterA;
            iterA += 2;
            *vram++ = *iterB;
            iterB += 2;
            *vram++ = *iterA;
            iterA += 2;
            *vram++ = *iterB;
            iterB += 2;

            gBG1TilemapBuffer[TILEMAP_INDEX((ix / 2), (iy / 2))] = TILEREF(chr, palId);

            chr++;

            if ((gBmMapUnit[iy  ][ix  ] != 0) ||
                (gBmMapUnit[iy  ][ix+1] != 0) ||
                (gBmMapUnit[iy+1][ix  ] != 0) ||
                (gBmMapUnit[iy+1][ix+1] != 0)) {

                iterA = GetMinimapObjectCellAt(ix, iy);
                iterB = GetMinimapObjectCellAt(ix + 1, iy);

                *vram++ = *iterA;
                iterA += 2;
                *vram++ = *iterB;
                iterB += 2;
                *vram++ = *iterA;
                iterA += 2;
                *vram++ = *iterB;
                iterB += 2;
                *vram++ = *iterA;
                iterA += 2;
                *vram++ = *iterB;
                iterB += 2;
                *vram++ = *iterA;
                iterA += 2;
                *vram++ = *iterB;
                iterB += 2;

                iterA = GetMinimapObjectCellAt(ix, iy + 1);
                iterB = GetMinimapObjectCellAt(ix + 1, iy + 1);

                *vram++ = *iterA;
                iterA += 2;
                *vram++ = *iterB;
                iterB += 2;
                *vram++ = *iterA;
                iterA += 2;
                *vram++ = *iterB;
                iterB += 2;
                *vram++ = *iterA;
                iterA += 2;
                *vram++ = *iterB;
                iterB += 2;
                *vram++ = *iterA;
                iterA += 2;
                *vram++ = *iterB;
                iterB += 2;

                gBG0TilemapBuffer[TILEMAP_INDEX((ix / 2), (iy / 2))] = TILEREF(chr, (palId + 1));

                chr++;
            }

        }
    }

    return;
}

//! FE8U = 0x080A7E84
void Minimap_Init(ProcPtr proc) {
    PlaySoundEffect(0x78);

    Minimap_InitProcVars(proc);
    ApplyMinimapGraphics(-1);
    DrawMinimapInternal(0, -1);

    BG_EnableSyncByMask(3);

    return;
}

//! FE8U = 0x080A7EC4
void Minimap_OnHBlank() {
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > 160) {
        gMinimapDisplayedWinBuf = gMinimapFrontWinBuf;
        vcount = 0;
    }

    REG_WIN0H = WIN_RANGE(gMinimapDisplayedWinBuf[vcount*2], gMinimapDisplayedWinBuf[vcount*2 + 1]);

    return;
}

//! FE8U = 0x080A7F04
void InitMinimapWindowBuffers() {
    s16* swap = gMinimapFrontWinBuf;
    gMinimapFrontWinBuf = gMinimapBackWinBuf;
    gMinimapBackWinBuf = swap;

    return;
}

//! FE8U = 0x080A7F1C
void Minimap_InitOpenAnim(struct MinimapProc* proc) {
    gMinimapFrontWinBuf = gMinimapWinBuf;
    gMinimapBackWinBuf = gMinimapWinBuf - 320;
    gMinimapDisplayedWinBuf = gMinimapWinBuf;

    SetWinEnable(1, 0, 0);

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 0, 1, 1, 1);

    SetWin0Box(DISPLAY_WIDTH, 0, 0, DISPLAY_HEIGHT);

    SetBlendTargetA(0, 0, 1, 1, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);

    SetBlendBackdropB(1);

    SetBlendConfig(3, 16, 0, 0);

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.win1_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    proc->animClock = 0;

    SetPrimaryHBlankHandler(Minimap_OnHBlank);

    return;
}

//! FE8U = 0x080A8020
void Minimap_OpenAnim(struct MinimapProc* proc) {
    int unk;
    int i;
    int angle;
    struct Vec2 arr[4];

    SetBlendConfig(3, 16, 0, proc->animClock / 4);

    unk = Interpolate(INTERPOLATE_RCUBIC, 0, 256, proc->animClock, 16);
    angle = unk / 4 - 64;

    arr[0].x = -proc->xRegionRadius;
    arr[0].y = -proc->yRegionRadius;

    arr[1].x = +proc->xRegionRadius;
    arr[1].y = -proc->yRegionRadius;

    arr[2].x = +proc->xRegionRadius;
    arr[2].y = +proc->yRegionRadius;

    arr[3].x = -proc->xRegionRadius;
    arr[3].y = +proc->yRegionRadius;

    for (i = 0; i <= 3; i++) {
        int a1;
        int a2;

        a1 = (COS(angle) * arr[i].x) - (SIN(angle) * arr[i].y);
        a2 = (SIN(angle) * arr[i].x) + (COS(angle) * arr[i].y);

        arr[i].x = ((a1 * unk) >> 20) + 120;
        arr[i].y = ((a2 * unk) >> 20) + 80;
    }

    sub_80131D0(gMinimapBackWinBuf);

    sub_80131F0(gMinimapBackWinBuf, arr[0].x, arr[0].y, arr[1].x, arr[1].y);
    sub_80131F0(gMinimapBackWinBuf, arr[1].x, arr[1].y, arr[2].x, arr[2].y);
    sub_80131F0(gMinimapBackWinBuf, arr[2].x, arr[2].y, arr[3].x, arr[3].y);
    sub_80131F0(gMinimapBackWinBuf, arr[3].x, arr[3].y, arr[0].x, arr[0].y);

    InitMinimapWindowBuffers();

    proc->animClock++;

    if (proc->animClock > 16) {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080A81B8
void Minimap_InitCloseAnim(struct MinimapProc* proc) {
    PlaySoundEffect(0x79);

    SetBlendTargetA(0, 0, 1, 1, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);

    SetBlendConfig(3, 16, 0, 4);

    gMinimapFrontWinBuf = gMinimapWinBuf;
    gMinimapBackWinBuf = gMinimapWinBuf - 320;
    gMinimapDisplayedWinBuf = gMinimapWinBuf;

    proc->animClock = 0;

    return;
}

//! FE8U = 0x080A8234
void Minimap_CloseAnim(struct MinimapProc* proc) {
    int i;
    int unk;
    int angle;
    struct Vec2 arr[4];

    SetBlendConfig(3, 16, 0, 4 - (proc->animClock / 4));

    unk = Interpolate(INTERPOLATE_CUBIC, 256, 0, proc->animClock, 16);
    angle = 64 - (unk / 4);

    arr[0].x = -proc->xRegionRadius;
    arr[0].y = -proc->yRegionRadius;

    arr[1].x = +proc->xRegionRadius;
    arr[1].y = -proc->yRegionRadius;

    arr[2].x = +proc->xRegionRadius;
    arr[2].y = +proc->yRegionRadius;

    arr[3].x = -proc->xRegionRadius;
    arr[3].y = +proc->yRegionRadius;

    for (i = 0; i <= 3; i++) {
        int a1;
        int a2;

        a1 = (COS(angle) * arr[i].x) - (SIN(angle) * arr[i].y);
        a2 = (SIN(angle) * arr[i].x) + (COS(angle) * arr[i].y);

        arr[i].x = ((a1 * unk) >> 20) + 120;
        arr[i].y = ((a2 * unk) >> 20) + 80;
    }

    sub_80131D0(gMinimapBackWinBuf);

    sub_80131F0(gMinimapBackWinBuf, arr[0].x, arr[0].y, arr[1].x, arr[1].y);
    sub_80131F0(gMinimapBackWinBuf, arr[1].x, arr[1].y, arr[2].x, arr[2].y);
    sub_80131F0(gMinimapBackWinBuf, arr[2].x, arr[2].y, arr[3].x, arr[3].y);
    sub_80131F0(gMinimapBackWinBuf, arr[3].x, arr[3].y, arr[0].x, arr[0].y);

    InitMinimapWindowBuffers();

    proc->animClock++;

    if (proc->animClock > 16) {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080A83D0
void ApplyMinimapGraphics(int palId) {
    if (palId < 0) {
        palId = 3;
    }

    Decompress(gGfx_MinimapTiles, gGenericBuffer);

    ApplyPalette(gPal_MinimapTiles, palId);
    ApplyPalette(gPal_08A1FFD0, palId + 1);

    return;
}

//! FE8U = 0x080A8410
void InitMinimapFlashPalette() {
    int colorNum;
    int palNum;

    gMinimapObjectFlashPal = (u16 *)gGenericBuffer;

    for (colorNum = 1; colorNum < 16; colorNum++) {
        int color = gPaletteBuffer[BGPAL_OFFSET(4) + colorNum];

        int red = RED_VALUE(color);
        int green = GREEN_VALUE(color);
        int blue = BLUE_VALUE(color);

        for (palNum = 0; palNum < 8; palNum++) {
            gMinimapObjectFlashPal[colorNum + 0x10 * palNum] = ((blue << 10) + (green << 5)) + red;

            red += 3;
            if (red > 31) {
                red = 31;
            }

            green += 3;
            if (green > 31) {
                green = 31;
            }

            blue += 3;
            if (blue > 31) {
                blue = 31;
            }
        }
    }

    return;
}

//! FE8U = 0x080A849C
void Minimap_ApplyFlashPalette() {
    u8 gUnknown_08205D87[] = {
        0, 4, 7, 6,
        5, 4, 3, 2,
        2, 1, 1, 1,
        0, 0, 0, 0,
    };

    u8 idx = gUnknown_08205D87[(GetGameClock() >> 2) % sizeof(gUnknown_08205D87)];

    ApplyPalette(gMinimapObjectFlashPal + idx * 0x10, 4);

    return;
}

//! FE8U = 0x080A84D8
void Minimap_ApplyViewportFlashColor() {
    u8 idx;
    int tmp;
    int r, g, b;

    u8 gUnknown_08205D97[] = {
        0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
        0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F,
        0x0F, 0x0E, 0x0D, 0x0C, 0x0B, 0x0A, 0x09, 0x08,
        0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00,
    };

    tmp = GetGameClock() & 0x1F;
    idx = gUnknown_08205D97[tmp];
    tmp = idx + 0x10;

    r = tmp;
    g = tmp;
    b = tmp;

    gPaletteBuffer[OBPAL_OFFSET(0) + 0xE] = (b << 10) + (g << 5) + r;
    EnablePaletteSync();

    return;
}

//! FE8U = 0x080A851C
void Minimap_PutViewport(struct MinimapProc* proc) {
    int xScreen;
    int yScreen;

    u16 viewportSprite[] = {
        4,
        OAM0_SHAPE_8x8 + OAM0_Y(-1), OAM1_SIZE_8x8 + OAM1_X(-1), OAM2_CHR(0x28),
        OAM0_SHAPE_8x8 + OAM0_Y(-1), OAM1_SIZE_8x8 + OAM1_X(53) + OAM1_HFLIP, OAM2_CHR(0x28),
        OAM0_SHAPE_8x8 + OAM0_Y(33), OAM1_SIZE_8x8 + OAM1_X(-1) + OAM1_VFLIP, OAM2_CHR(0x28),
        OAM0_SHAPE_8x8 + OAM0_Y(33), OAM1_SIZE_8x8 + OAM1_X(53) + OAM1_HFLIP + OAM1_VFLIP, OAM2_CHR(0x28),
    };

    xScreen = proc->xScreen + gBmSt.camera.x / 4;
    yScreen = proc->yScreen + gBmSt.camera.y / 4;

    CallARM_PushToSecondaryOAM(xScreen, yScreen, viewportSprite, 0);

    return;
}

//! FE8U = 0x080A8568
void Minimap_AdjustDisplay(struct MinimapProc* proc) {
    int x = (DISPLAY_WIDTH - (gBmMapSize.x * 4)) >> 1;
    int y = (DISPLAY_HEIGHT - (gBmMapSize.y * 4)) >> 1;

    if ((gBmMapSize.y * 4) > DISPLAY_HEIGHT - 16) {
        y = ((gBmMapSize.y * 4) - DISPLAY_HEIGHT + 16);
        y = ((gBmSt.camera.y << 16) / gBmSt.cameraMax.y) * y / 0x10000;
        y = 8 - y;
    }

    proc->xScreen = x;
    proc->yScreen = y;

    BG_SetPosition(0, -x, -y);
    BG_SetPosition(1, -x, -y);

    return;
}

//! FE8U = 0x080A85E4
void Minimap_HandleMoveInput(struct MinimapProc* proc) {
    int x = gBmSt.camera.x;
    int y = gBmSt.camera.y;

    if (((x % 16) == 0) && ((y % 16) == 0)) {
        proc->xCameraSpeed = 0;
        proc->yCameraSpeed = 0;

        if (gKeyStatusPtr->heldKeys & DPAD_LEFT) {
            proc->xCameraSpeed = -8;
            proc->cameraMoved = 1;
        }

        if (gKeyStatusPtr->heldKeys & DPAD_RIGHT) {
            proc->xCameraSpeed = +8;
            proc->cameraMoved = 1;
        }

        if (gKeyStatusPtr->heldKeys & DPAD_UP) {
            proc->yCameraSpeed = -8;
            proc->cameraMoved = 1;
        }

        if (gKeyStatusPtr->heldKeys & DPAD_DOWN) {
            proc->yCameraSpeed = +8;
            proc->cameraMoved = 1;
        }
    }

    x = x + proc->xCameraSpeed;
    y = y + proc->yCameraSpeed;

    if (x < 0) {
        x = 0;
    }

    if (x > gBmSt.cameraMax.x) {
        x = gBmSt.cameraMax.x;
    }

    if (y < 0) {
        y = 0;
    }

    if (y > gBmSt.cameraMax.y) {
        y = gBmSt.cameraMax.y;
    }

    gBmSt.camera.x = x;
    gBmSt.camera.y = y;

    return;
}

//! FE8U = 0x080A86AC
void Minimap_InitProcVars(struct MinimapProc* proc) {
    proc->cameraMoved = 0;

    proc->xRegionRadius = gBmMapSize.x * 2;
    proc->yRegionRadius = gBmMapSize.y * 2;

    return;
}

//! FE8U = 0x080A86CC
void Minimap_AdjustCursorOnClose(struct MinimapProc* proc) {
    int x;
    int y;

    if (proc->cameraMoved != 0) {
        x = (gBmSt.camera.x / 16) + 7;
        y = (gBmSt.camera.y / 16) + 5;

        SetCursorMapPosition(x, y);
    }

    SetPrimaryHBlankHandler(NULL);

    return;
}

//! FE8U = 0x080A8708
void Minimap_Main(ProcPtr proc) {
    Minimap_ApplyFlashPalette();

    Minimap_ApplyViewportFlashColor(proc);
    Minimap_AdjustDisplay(proc);
    Minimap_PutViewport(proc);
    Minimap_HandleMoveInput(proc);

    if (gKeyStatusPtr->heldKeys & (R_BUTTON | L_BUTTON)) {
        SetBlendTargetA(0, 1, 0, 0, 0);
        SetBlendTargetB(0, 0, 1, 1, 1);
        SetBlendConfig(1, 8, 8, 0);
    } else {
        SetBlendTargetA(0, 0, 1, 1, 0);
        SetBlendTargetB(1, 1, 1, 1, 1);
        SetBlendConfig(3, 16, 0, 4);
    }

    if (((gBmSt.camera.x & 0xF) == 0) && ((gBmSt.camera.y & 0xF) == 0) && (gKeyStatusPtr->newKeys & (B_BUTTON | START_BUTTON))) {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080A87C8
void StartMinimapPlayerPhase() {
    Proc_Start(gProcScr_Minimap, PROC_TREE_3);
    return;
}

//! FE8U = 0x080A87DC
void StartMinimapPrepPhase(ProcPtr proc) {
    Proc_StartBlocking(gProcScr_Minimap, proc);
    return;
}

//! FE8U = 0x080A87F0
void DrawMinimap(int chapterId, u16* vram, int palId) {
    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);

    InitMapForMinimap(chapterId);
    ApplyMinimapGraphics(palId);
    DrawMinimapInternal(vram, palId);

    return;
}
