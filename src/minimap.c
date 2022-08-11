#include "global.h"

#include "constants/terrains.h"

#include "bmmap.h"


int sub_80A7578(int x, int y) {

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

int sub_80A75CC(int terrainId) {

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

    terrainIdA = sub_80A75CC(gBmMapTerrain[y][x]);

    terrainIdB = sub_80A75CC(gBmMapTerrain[y + 1][x]);

    if (terrainIdB == terrainIdA) {
        index += 1;
    }

    index *= 2;

    terrainIdB = sub_80A75CC(gBmMapTerrain[y - 1][x]);

    if (terrainIdB == terrainIdA) {
        index += 1;
    }

    index *= 2;

    terrainIdB = sub_80A75CC(gBmMapTerrain[y][x + 1]);

    if (terrainIdB == terrainIdA) {
        index += 1;
    }

    index *= 2;

    terrainIdB = sub_80A75CC(gBmMapTerrain[y][x - 1]);

    if (terrainIdB == terrainIdA) {
        index += 1;
    }

    return index;
}

int sub_80A767C(int terrainId) {

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

int sub_80A769C(int x, int y) {
    int terrainIdA;
    int terrainIdB;

    int index = 0;

    terrainIdA = sub_80A767C(gBmMapTerrain[y][x]);

    terrainIdB = sub_80A767C(gBmMapTerrain[y + 1][x]);

    if (terrainIdB == terrainIdA) {
        index += 1;
    }

    index *= 2;

    terrainIdB = sub_80A767C(gBmMapTerrain[y - 1][x]);

    if (terrainIdB == terrainIdA) {
        index += 1;
    }

    index *= 2;

    terrainIdB = sub_80A767C(gBmMapTerrain[y][x + 1]);

    if (terrainIdB == terrainIdA) {
        index += 1;
    }

    index *= 2;

    terrainIdB = sub_80A767C(gBmMapTerrain[y][x - 1]);

    if (terrainIdB == terrainIdA) {
        index += 1;
    }

    return index;
}

int sub_80A7730(int x, int y) {
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

int sub_80A77D4(int x, int y) {

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

int sub_80A78FC(int x, int y) {
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

int sub_80A7940(int x, int y) {

    if (gBmMapTerrain[y][x + 1] == TERRAIN_DOOR) {
        return 0x16;
    }

    if (gBmMapTerrain[y][x - 1] == TERRAIN_DOOR) {
        return 0x17;
    }

    return 7;

}

int sub_80A7970(int x, int y) {
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

int sub_80A7A0C(int x, int y) {

    switch (gBmMapTerrain[y][x]) {
        case TERRAIN_PLAINS:
            return 1;

        case TERRAIN_ROAD:
            return sub_80A7578(x, y) + 0x40;

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
            return sub_80A7730(x, y) + 0x60;

        case TERRAIN_MOUNTAIN:
            return 0xB;

        case TERRAIN_PEAK:
            return 0x14;

        case TERRAIN_BRIDGE_13:
        case TERRAIN_BRIDGE_34:
            return sub_80A7970(x, y);

        case TERRAIN_WATER:
            return sub_80A769C(x, y) + 0x30;

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
            return sub_80A7940(x, y);

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
            return sub_80A77D4(x, y) + 0x50;

        case TERRAIN_BALLISTA_REGULAR:
        case TERRAIN_BALLISTA_LONG:
        case TERRAIN_BALLISTA_KILLER:
            return 0x13;

        case TERRAIN_SHIP_FLAT:
            return 0x3A;

        case TERRAIN_STAIRS:
            return sub_80A78FC(x, y);

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
            return sub_80A7578(x, y) + 0x20;

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
    return (u16*)(gUnknown_02020188 + (sub_80A7A0C(x, y) * 0x20));
}

extern u8 gUnknown_08205D84[];

u16* sub_80A7C0C(int x, int y) {
    int unitId;
    u8 hack[4];

    memcpy(hack, gUnknown_08205D84, 3);

    unitId = gBmMapUnit[y][x];

    if (unitId == 0) {
        return (u16*)(gUnknown_02020188);
    } else {
        return (u16*)(gUnknown_02020188 + (hack[unitId >> 6] * 0x20));
    }
}
