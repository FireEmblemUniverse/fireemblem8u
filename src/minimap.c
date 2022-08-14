#include "global.h"

#include "constants/terrains.h"

#include "bmmap.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "uiutils.h"

#include "minimap.h"

struct MinimapProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ int unk_3c;
    /* 40 */ int unk_40;

    /* 44 */ u8 _pad[0x4A - 0x44];

    /* 4A */ s16 unk_4a;
    /* 4C */ s16 unk_4c;
};

extern u8 gGfx_MinimapTiles[];
extern u16 gPal_MinimapTiles[];
extern u16 gPal_08A1FFD0[];

extern s16 gUnknown_02000280;

extern s16* gUnknown_02000500;
extern s16* gUnknown_02000504;
extern s16* gUnknown_02000508;

extern u16 (*gUnknown_0200050C)[8][16];

// hino.s
void sub_80131D0(s16*);
void sub_80131F0(s16*, int, int, int, int);


void ApplyMinimapGraphics(int);
void sub_80A86AC(struct MinimapProc*);

void Minimap_HandleOpen(ProcPtr proc);
void sub_80A8568(struct MinimapProc* proc);
void sub_80A7F1C(struct MinimapProc* proc);
void Minimap_LoopRotateIn(struct MinimapProc* proc);
void sub_80A8410(void);
void Minimap_Idle_InputHandler(ProcPtr proc);
void Minimap_HandleClose(struct MinimapProc* proc);
void Minimap_LoopRotateOut(struct MinimapProc* proc);
void Minimap_AdjustCursorOnClose(struct MinimapProc* proc);

struct ProcCmd CONST_DATA gProcScr_Minimap[] = {
    PROC_CALL(AddSkipThread2),

    PROC_SLEEP(0),

    PROC_CALL(ClearBg0Bg1),
    PROC_SLEEP(0),

    PROC_CALL(Minimap_HandleOpen),
    PROC_CALL(sub_80A8568),
    PROC_CALL(sub_80A7F1C),

    PROC_REPEAT(Minimap_LoopRotateIn),

    PROC_CALL(sub_80A8410),

    PROC_REPEAT(Minimap_Idle_InputHandler),

    PROC_CALL(Minimap_HandleClose),

    PROC_REPEAT(Minimap_LoopRotateOut),

    PROC_CALL(Minimap_AdjustCursorOnClose),
    PROC_CALL(ClearBg0Bg1),
    PROC_SLEEP(0),

    PROC_CALL(LoadUiFrameGraphics),
    PROC_CALL(Font_InitForUIDefault),
    PROC_CALL(LoadObjUIGfx),

    PROC_CALL(SubSkipThread2),

    PROC_END,
};


int Minimap_GetRoadTileIndex(int x, int y) {

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

int sub_80A75E8(int x, int y) {
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

int Minimap_GetWaterTileIndex(int x, int y) {
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

int Minimap_GetRiverTileIndex(int x, int y) {
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

int Minimap_GetCliffBoneTileIndex(int x, int y) {

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

int Minimap_GetStairsTileIndex(int x, int y) {
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

int Minimap_GetDoorTileIndex(int x, int y) {

    if (gBmMapTerrain[y][x + 1] == TERRAIN_DOOR) {
        return 0x16;
    }

    if (gBmMapTerrain[y][x - 1] == TERRAIN_DOOR) {
        return 0x17;
    }

    return 7;

}

int Minimap_GetBridgeTileIndex(int x, int y) {
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

int Minimap_GetTileForTerrainAt(int x, int y) {

    switch (gBmMapTerrain[y][x]) {
        case TERRAIN_PLAINS:
            return 1;

        case TERRAIN_ROAD:
            return Minimap_GetRoadTileIndex(x, y) + 0x40;

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
            return Minimap_GetRiverTileIndex(x, y) + 0x60;

        case TERRAIN_MOUNTAIN:
            return 0xB;

        case TERRAIN_PEAK:
            return 0x14;

        case TERRAIN_BRIDGE_13:
        case TERRAIN_BRIDGE_34:
            return Minimap_GetBridgeTileIndex(x, y);

        case TERRAIN_WATER:
            return Minimap_GetWaterTileIndex(x, y) + 0x30;

        case TERRAIN_SEA:
        case TERRAIN_LAKE:
        case TERRAIN_GLACIER:
        case TERRAIN_SKY:
        case TERRAIN_DEEPS:
            return sub_80A75E8(x, y) + 0x30;

        case TERRAIN_FLOOR_17:
        case TERRAIN_FLOOR_18:
        case TERRAIN_DECK:
            return 0xC;

        case TERRAIN_PILLAR:
            return 0xD;

        case TERRAIN_DOOR:
            return Minimap_GetDoorTileIndex(x, y);

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
            return Minimap_GetCliffBoneTileIndex(x, y) + 0x50;

        case TERRAIN_BALLISTA_REGULAR:
        case TERRAIN_BALLISTA_LONG:
        case TERRAIN_BALLISTA_KILLER:
            return 0x13;

        case TERRAIN_SHIP_FLAT:
            return 0x3A;

        case TERRAIN_STAIRS:
            return Minimap_GetStairsTileIndex(x, y);

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
            return Minimap_GetRoadTileIndex(x, y) + 0x20;

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

u16* sub_80A7BF8(int x, int y) {
    return (u16*)(gUnknown_02020188 + (Minimap_GetTileForTerrainAt(x, y) * 0x20));
}

u16* sub_80A7C0C(int x, int y) {

    u8 gUnknown_08205D84[] = {
        0x1D, 0x1F, 0x1E,
    };

    int unitId = gBmMapUnit[y][x];

    if (unitId == 0) {
        return (u16*)(gUnknown_02020188);
    } else {
        return (u16*)(gUnknown_02020188 + (gUnknown_08205D84[unitId >> 6] * 0x20));
    }
}

void sub_80A7C5C(u16* vram, int palId) {
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
            u16* iterA = sub_80A7BF8(ix, iy);
            u16* iterB = sub_80A7BF8(ix + 1, iy);

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

            iterA = sub_80A7BF8(ix, iy + 1);
            iterB = sub_80A7BF8(ix + 1, iy + 1);

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

                iterA = sub_80A7C0C(ix, iy);
                iterB = sub_80A7C0C(ix + 1, iy);

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

                iterA = sub_80A7C0C(ix, iy + 1);
                iterB = sub_80A7C0C(ix + 1, iy + 1);

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

void Minimap_HandleOpen(ProcPtr proc) {

    PlaySoundEffect(0x78); // TODO: song120_se_sys_small_map_open1.mid

    sub_80A86AC(proc);
    ApplyMinimapGraphics(-1);
    sub_80A7C5C(0, -1);

    BG_EnableSyncByMask(3);

    return;
}

void sub_80A7EC4() {
    u16 vcount = REG_VCOUNT + 1;

    if (vcount > 160) {
        gUnknown_02000508 = gUnknown_02000500;
        vcount = 0;
    }

    REG_WIN0H = (gUnknown_02000508[vcount*2] << 8) + gUnknown_02000508[vcount*2 + 1];

    return;
}

void sub_80A7F04() {
    s16* swap;

    swap = gUnknown_02000500;
    gUnknown_02000500 = gUnknown_02000504;
    gUnknown_02000504 = swap;

    return;
}

void sub_80A7F1C(struct MinimapProc* proc) {
    gUnknown_02000500 = &gUnknown_02000280;
    gUnknown_02000504 = &gUnknown_02000280 - 320;
    gUnknown_02000508 = &gUnknown_02000280;

    gLCDControlBuffer.dispcnt.win0_on = 1;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.wincnt.win0_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg2 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win0_enableObj = 1;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 0;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wout_enableObj = 1;

    gLCDControlBuffer.win0_left = 240;
    gLCDControlBuffer.win0_top = 0;
    gLCDControlBuffer.win0_right = 0;
    gLCDControlBuffer.win0_bottom = 160;

    sub_8001ED0(0, 0, 1, 1, 0);
    sub_8001F0C(1, 1, 1, 1, 1);

    sub_8001F64(1);

    SetSpecialColorEffectsParameters(3, 16, 0, 0);

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.win1_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    proc->unk_4c = 0;

    SetPrimaryHBlankHandler(sub_80A7EC4);

    return;
}

void Minimap_LoopRotateIn(struct MinimapProc* proc) {
    int blendY;
    int unk;
    int i;
    int angle;
    struct Vec2 arr[4];

    blendY = proc->unk_4c;

    if (blendY < 0) {
        blendY = blendY + 3;
    }

    blendY = blendY >> 2;

    SetSpecialColorEffectsParameters(3, 16, 0, blendY);

    unk = sub_8012DCC(5, 0, 256, proc->unk_4c, 16);

    angle = unk;

    if (unk < 0) {
        angle = unk + 3;
    }

    angle = (angle >> 2) - 64;

    arr[0].x = -proc->unk_34;
    arr[0].y = -proc->unk_38;

    arr[1].x = +proc->unk_34;
    arr[1].y = -proc->unk_38;

    arr[2].x = +proc->unk_34;
    arr[2].y = +proc->unk_38;

    arr[3].x = -proc->unk_34;
    arr[3].y = +proc->unk_38;

    for (i = 0; i <= 3; i++) {
        int a1;
        int a2;

        a1 = (COS(angle) * arr[i].x) - (SIN(angle) * arr[i].y);
        a2 = (SIN(angle) * arr[i].x) + (COS(angle) * arr[i].y);

        arr[i].x = ((a1 * unk) >> 20) + 120;
        arr[i].y = ((a2 * unk) >> 20) + 80;
    }

    sub_80131D0(gUnknown_02000504);

    sub_80131F0(gUnknown_02000504, arr[0].x, arr[0].y, arr[1].x, arr[1].y);

    sub_80131F0(gUnknown_02000504, arr[1].x, arr[1].y, arr[2].x, arr[2].y);

    sub_80131F0(gUnknown_02000504, arr[2].x, arr[2].y, arr[3].x, arr[3].y);

    sub_80131F0(gUnknown_02000504, arr[3].x, arr[3].y, arr[0].x, arr[0].y);

    sub_80A7F04();

    proc->unk_4c++;

    if (proc->unk_4c > 16) {
        Proc_Break(proc);
    }

    return;

}

void Minimap_HandleClose(struct MinimapProc* proc) {
    PlaySoundEffect(0x79); // TODO: song121_se_sys_small_map_close1.mid

    sub_8001ED0(0, 0, 1, 1, 0);
    sub_8001F0C(1, 1, 1, 1, 1);

    SetSpecialColorEffectsParameters(3, 16, 0, 4);

    gUnknown_02000500 = &gUnknown_02000280;
    gUnknown_02000504 = &gUnknown_02000280 - 320;
    gUnknown_02000508 = &gUnknown_02000280;

    proc->unk_4c = 0;

    return;
}

void Minimap_LoopRotateOut(struct MinimapProc* proc) {
    int blendY;
    int i;
    int unk;
    int angle;
    struct Vec2 arr[4];

    blendY = proc->unk_4c;

    if (blendY < 0) {
        blendY = blendY + 3;
    }

    blendY = (blendY >> 2);

    SetSpecialColorEffectsParameters(3, 16, 0, 4 - blendY);

    unk = sub_8012DCC(2, 256, 0, proc->unk_4c, 16);

    angle = unk;

    if (unk < 0) {
        angle = unk + 3;
    }

    angle = 64 - (angle >> 2);

    arr[0].x = -proc->unk_34;
    arr[0].y = -proc->unk_38;

    arr[1].x = +proc->unk_34;
    arr[1].y = -proc->unk_38;

    arr[2].x = +proc->unk_34;
    arr[2].y = +proc->unk_38;

    arr[3].x = -proc->unk_34;
    arr[3].y = +proc->unk_38;

    for (i = 0; i <= 3; i++) {
        int a1;
        int a2;

        a1 = (COS(angle) * arr[i].x) - (SIN(angle) * arr[i].y);
        a2 = (SIN(angle) * arr[i].x) + (COS(angle) * arr[i].y);

        arr[i].x = ((a1 * unk) >> 20) + 120;
        arr[i].y = ((a2 * unk) >> 20) + 80;
    }

    sub_80131D0(gUnknown_02000504);

    sub_80131F0(gUnknown_02000504, arr[0].x, arr[0].y, arr[1].x, arr[1].y);

    sub_80131F0(gUnknown_02000504, arr[1].x, arr[1].y, arr[2].x, arr[2].y);

    sub_80131F0(gUnknown_02000504, arr[2].x, arr[2].y, arr[3].x, arr[3].y);

    sub_80131F0(gUnknown_02000504, arr[3].x, arr[3].y, arr[0].x, arr[0].y);

    sub_80A7F04();

    proc->unk_4c++;

    if (proc->unk_4c > 16) {
        Proc_Break(proc);
    }

    return;
}

void ApplyMinimapGraphics(int palId) {

    if (palId < 0) {
        palId = 3;
    }

    CopyDataWithPossibleUncomp(gGfx_MinimapTiles, gUnknown_02020188);

    CopyToPaletteBuffer(gPal_MinimapTiles, palId * 0x20, 0x20);
    CopyToPaletteBuffer(gPal_08A1FFD0, (palId + 1) * 0x20, 0x20);

    return;
}

#if NONMATCHING

void sub_80A8410() {

    int iVar7;
    int iVar8;

    (u16**)gUnknown_0200050C = &gUnknown_02020188;

    for (iVar7 = 1; iVar7 < 16; ++iVar7) {
        int color = gPaletteBuffer[(4 * 0x10) + iVar7];

        int red = RED_VALUE(color);
        int green = GREEN_VALUE(color);
        int blue = BLUE_VALUE(color);

        for (iVar8 = 0; iVar8 < 8; ++iVar8) {
            (**gUnknown_0200050C)[iVar7] = ((blue << 10) + (green << 5)) + red;

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

#else // if !NONMATCHING

__attribute__((naked))
void sub_80A8410() {

    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        ldr r1, _080A8490  @ gUnknown_0200050C\n\
        ldr r0, _080A8494  @ gUnknown_02020188\n\
        str r0, [r1]\n\
        movs r2, #1\n\
        ldr r0, _080A8498  @ gPaletteBuffer\n\
        mov sl, r0\n\
        movs r0, #0x1f\n\
        mov r8, r0\n\
        mov r9, r1\n\
    _080A842C:\n\
        adds r0, r2, #0\n\
        adds r0, #0x40\n\
        lsls r0, r0, #1\n\
        add r0, sl\n\
        ldrh r0, [r0]\n\
        adds r5, r0, #0\n\
        mov r1, r8\n\
        ands r5, r1\n\
        asrs r4, r0, #5\n\
        ands r4, r1\n\
        asrs r3, r0, #0xa\n\
        ands r3, r1\n\
        adds r0, r2, #1\n\
        mov ip, r0\n\
        lsls r6, r2, #1\n\
        movs r7, #7\n\
    _080A844C:\n\
        mov r1, r9\n\
        ldr r0, [r1]\n\
        adds r0, r6, r0\n\
        lsls r1, r3, #0xa\n\
        lsls r2, r4, #5\n\
        adds r1, r1, r2\n\
        adds r1, r1, r5\n\
        strh r1, [r0]\n\
        adds r5, #3\n\
        cmp r5, #0x1f\n\
        ble _080A8464\n\
        movs r5, #0x1f\n\
    _080A8464:\n\
        adds r4, #3\n\
        cmp r4, #0x1f\n\
        ble _080A846C\n\
        movs r4, #0x1f\n\
    _080A846C:\n\
        adds r3, #3\n\
        cmp r3, #0x1f\n\
        ble _080A8474\n\
        movs r3, #0x1f\n\
    _080A8474:\n\
        adds r6, #0x20\n\
        subs r7, #1\n\
        cmp r7, #0\n\
        bge _080A844C\n\
        mov r2, ip\n\
        cmp r2, #0xf\n\
        ble _080A842C\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
        _080A8490: .4byte gUnknown_0200050C\n\
        _080A8494: .4byte gUnknown_02020188\n\
        _080A8498: .4byte gPaletteBuffer\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCHING

void sub_80A849C() {
    u8 gUnknown_08205D87[] = {
        0, 4, 7, 6, 5, 4, 3, 2, 2, 1, 1, 1, 0, 0, 0, 0,
    };

    u8 idx = gUnknown_08205D87[(GetGameClock() >> 2) & 0xF];

    CopyToPaletteBuffer((*gUnknown_0200050C)[idx], 0x80, 0x20);

    return;
}

void sub_80A84D8() {
    register u8 idx asm("r0");
    register int color asm("r3");
    int r, g, b;

    u8 gUnknown_08205D97[] = {
        0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
        0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F,
        0x0F, 0x0E, 0x0D, 0x0C, 0x0B, 0x0A, 0x09, 0x08,
        0x07, 0x06, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00,
    };


    idx = gUnknown_08205D97[GetGameClock() & 0x1F];
    color = idx + 0x10;

    r = color;
    g = color;
    b = color;

    gPaletteBuffer[(0x10) * 0x10 + 0xE] = (b << 10) + (g << 5) + r;

    EnablePaletteSync();

    return;
}

void sub_80A851C(struct MinimapProc* proc) {
    int xBase;
    int yBase;
    int xNew;
    int yNew;

    u16 gUnknown_08205DB8[] = {
        0x0004, 0x00FF, 0x01FF, 0x0028,
        0x00FF, 0x1035, 0x0028, 0x0021,
        0x21FF, 0x0028, 0x0021, 0x3035,
        0x0028,
    };

    xBase = gUnknown_0202BCB0.camera.x;
    if (xBase < 0) {
        xBase = xBase + 3;
    }
    xBase = (xBase >> 2);
    xNew = proc->unk_3c + xBase;

    yBase = gUnknown_0202BCB0.camera.y;
    if (yBase < 0) {
        yBase = yBase + 3;
    }
    yBase = yBase >> 2;
    yNew = proc->unk_40 + yBase;

    CallARM_PushToSecondaryOAM(xNew, yNew, gUnknown_08205DB8, 0);

    return;
}

void sub_80A8568(struct MinimapProc* proc) {
    int x;
    int y;

    x = (240 - (gBmMapSize.x * 4)) >> 1;
    y = (160 - (gBmMapSize.y * 4)) >> 1;

    if ((gBmMapSize.y * 4) > 144) {
        int tmp;

        y = ((gBmMapSize.y * 4) - 144);

        tmp = ((gUnknown_0202BCB0.camera.y << 16) / gUnknown_0202BCB0.unk28.y) * y;

        tmp = tmp < 0 ? tmp + 0x0000FFFF : tmp;

        y = tmp >> 16;

        y = 8 - y;
    }

    proc->unk_3c = x;
    proc->unk_40 = y;

    BG_SetPosition(0, -x, -y);
    BG_SetPosition(1, -x, -y);

    return;
}


void Minimap_HandleDPadInput(struct MinimapProc* proc) {
    int x;
    int y;

    x = gUnknown_0202BCB0.camera.x;
    y = gUnknown_0202BCB0.camera.y;

    if (((x & 0xF) == 0) && ((y & 0xF) == 0)) {
        proc->unk_2c = 0;
        proc->unk_30 = 0;

        if (gKeyStatusPtr->heldKeys & DPAD_LEFT) {
            proc->unk_2c = -8;
            proc->unk_4a = 1;
        }

        if (gKeyStatusPtr->heldKeys & DPAD_RIGHT) {
            proc->unk_2c = +8;
            proc->unk_4a = 1;
        }

        if (gKeyStatusPtr->heldKeys & DPAD_UP) {
            proc->unk_30 = -8;
            proc->unk_4a = 1;
        }

        if (gKeyStatusPtr->heldKeys & DPAD_DOWN) {
            proc->unk_30 = +8;
            proc->unk_4a = 1;
        }
    }

    x = x + proc->unk_2c;
    y = y + proc->unk_30;

    if (x < 0) {
        x = 0;
    }

    if (x > gUnknown_0202BCB0.unk28.x) {
        x = gUnknown_0202BCB0.unk28.x;
    }

    if (y < 0) {
        y = 0;
    }

    if (y > gUnknown_0202BCB0.unk28.y) {
        y = gUnknown_0202BCB0.unk28.y;
    }

    gUnknown_0202BCB0.camera.x = x;
    gUnknown_0202BCB0.camera.y = y;

    return;
}

void sub_80A86AC(struct MinimapProc* proc) {

    proc->unk_4a = 0;

    proc->unk_34 = gBmMapSize.x << 1;
    proc->unk_38 = gBmMapSize.y << 1;

    return;
}

void Minimap_AdjustCursorOnClose(struct MinimapProc* proc) {
    int x;
    int y;

    if (proc->unk_4a != 0) {
        x = gUnknown_0202BCB0.camera.x;

        if (x < 0) {
            x += 15;
        }

        x = (x >> 4);
        x += 7;

        y = gUnknown_0202BCB0.camera.y;

        if (y < 0) {
            y += 15;
        }

        y = y >> 4;
        y += 5;

        SetCursorMapPosition(x, y);
    }

    SetPrimaryHBlankHandler(0);

    return;
}

void Minimap_Idle_InputHandler(ProcPtr proc) {
    sub_80A849C();

    sub_80A84D8(proc);
    sub_80A8568(proc);
    sub_80A851C(proc);
    Minimap_HandleDPadInput(proc);

    if (gKeyStatusPtr->heldKeys & (R_BUTTON | L_BUTTON)) {
        sub_8001ED0(0, 1, 0, 0, 0);
        sub_8001F0C(0, 0, 1, 1, 1);
        SetSpecialColorEffectsParameters(1, 8, 8, 0);
    } else {
        sub_8001ED0(0, 0, 1, 1, gKeyStatusPtr->heldKeys & (R_BUTTON | L_BUTTON));
        sub_8001F0C(1, 1, 1, 1, 1);
        SetSpecialColorEffectsParameters(3, 16, 0, 4);
    }

    if (((gUnknown_0202BCB0.camera.x & 0xF) == 0) && ((gUnknown_0202BCB0.camera.y & 0xF) == 0) && (gKeyStatusPtr->newKeys & (B_BUTTON | START_BUTTON))) {
        Proc_Break(proc);
    }

    return;
}

void StartMinimapPlayerPhase() {
    Proc_Start(gProcScr_Minimap, PROC_TREE_3);
    return;
}

void StartMinimapPrepPhase(ProcPtr proc) {
    Proc_StartBlocking(gProcScr_Minimap, proc);
    return;
}

void sub_80A87F0(int chapterId, u16* vram, int palId) {
    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);

    InitChapterPreviewMap(chapterId);

    ApplyMinimapGraphics(palId);

    sub_80A7C5C(vram, palId);

    return;
}
