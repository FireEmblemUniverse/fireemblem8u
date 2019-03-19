#include "global.h"

#include "constants/terrains.h"

#include "rng.h"
#include "bmunit.h"
#include "bmmap.h"

void FillMovementMapForUnit(struct Unit* unit);
void FillMovementMapForUnitAndMovement(struct Unit* unit, s8 movement);
void FillMovementMapForUnitPosition(struct Unit* unit);
void FillMovementRangeMapSomehow(int x, int y, const s8 mct[TERRAIN_COUNT]);
void FillMovementMapSomehow(int x, int y, const s8 mct[TERRAIN_COUNT]);
void FillMovementMapForUnitAt(struct Unit* unit, int x, int y, int movement);
void StoreMovCostTable(const s8 mct[TERRAIN_COUNT]);
void FillMovementMap(int x, int y, int movement, int id);
void sub_801A570(int connexion, int x, int y);
void sub_801A640(int x, int y, u8 output[]);
void sub_801A7F4(u8* begin, u8* end);
void sub_801A82C(struct Unit* unit, int x, int y);
// ??? sub_801A8E4(???);
// ??? sub_801A9D0(???);
// ??? MapAddInRange(???);
// ??? StoreR3ToMapSomething(???);
// ??? FillMapAttackRangeForUnit(???);
// ??? FillRangeByRangeMask(???);
// ??? FillMapStaffRangeForUnit(???);
// ??? ApplyStuffToRangeMaps(???);
// ??? sub_801B950(???);
void SetSubjectMap(u8** map);
// ??? FillRangeMap(???);
// ??? GetCurrentMovCostTable(???);

// gSubjectMap (?)
extern u8** gUnknown_030049A0;

// working Terrain-to-MoveCost table
extern u8 gUnknown_03004BB0[];

struct UnkMovMapFill {
    /* 00 */ s8 xPos;
    /* 01 */ s8 yPos;
    /* 02 */ u8 connexion;
    /* 03 */ u8 leastMoveCost;
};

struct Unk03004E60 {
    /* 00 */ struct UnkMovMapFill* pUnk00;
    /* 04 */ struct UnkMovMapFill* pUnk04;
    /* 08 */ s8 hasUnit;
    /* 09 */ u8 movement;
    /* 0A */ u8 unitId;
    /* 0B */ u8 maxMovementValue;
};

enum {
    RECT_DIRECTION_RIGHT,
    RECT_DIRECTION_LEFT,
    RECT_DIRECTION_UP,
    RECT_DIRECTION_DOWN,

    RECT_DIRECTION_END,
};

extern struct UnkMovMapFill gUnknown_030049B0[];
extern struct UnkMovMapFill gUnknown_03004C50[];

extern struct Unk03004E60 gUnknown_03004E60;

// inlined SetSubjectMap
static inline void SetMap(u8** map) {
    gUnknown_030049A0 = map;
}

void FillMovementMapForUnit(struct Unit* unit) {
    StoreMovCostTable(GetUnitMovementCost(unit));
    SetMap(gBmMapMovement);

    FillMovementMap(unit->xPos, unit->yPos, UNIT_MOV(unit), unit->index);
}

void FillMovementMapForUnitAndMovement(struct Unit* unit, s8 movement) {
    StoreMovCostTable(GetUnitMovementCost(unit));
    SetMap(gBmMapMovement);

    FillMovementMap(unit->xPos, unit->yPos, movement, unit->index);
}

void FillMovementMapForUnitPosition(struct Unit* unit) {
    StoreMovCostTable(GetUnitMovementCost(unit));
    SetMap(gBmMapMovement);

    FillMovementMap(unit->xPos, unit->yPos, MAP_MOVEMENT_MAX_124, 0);
}

void FillMovementRangeMapSomehow(int x, int y, const s8 mct[TERRAIN_COUNT]) {
    StoreMovCostTable(mct);
    SetMap(gBmMapRange);

    FillMovementMap(x, y, MAP_MOVEMENT_MAX_124, 0);
}

void FillMovementMapSomehow(int x, int y, const s8 mct[TERRAIN_COUNT]) {
    StoreMovCostTable(mct);
    SetMap(gBmMapMovement);

    FillMovementMap(x, y, MAP_MOVEMENT_MAX_124, 0);
}

void FillMovementMapForUnitAt(struct Unit* unit, int x, int y, int movement) {
    StoreMovCostTable(GetUnitMovementCost(unit));

    FillMovementMap(x, y, movement, unit->index);
}

void StoreMovCostTable(const s8 mct[TERRAIN_COUNT]) {
    int i;

    for (i = 0; i < TERRAIN_COUNT; ++i)
        gUnknown_03004BB0[i] = mct[i];
}

void FillMovementMap(int x, int y, int movement, int id) {
    gUnknown_03004E60.pUnk04 = gUnknown_030049B0;
    gUnknown_03004E60.pUnk00 = gUnknown_03004C50;

    gUnknown_03004E60.movement = movement;

    if (id == 0) {
        gUnknown_03004E60.hasUnit = FALSE;
    } else {
        gUnknown_03004E60.hasUnit = TRUE;
        gUnknown_03004E60.unitId = id;
    }

    gUnknown_03004E60.maxMovementValue = MAP_MOVEMENT_MAX;

    BmMapFill(gUnknown_030049A0, -1);

    gUnknown_03004E60.pUnk04->xPos = x;
    gUnknown_03004E60.pUnk04->yPos = y;
    gUnknown_03004E60.pUnk04->connexion = 5;
    gUnknown_03004E60.pUnk04->leastMoveCost = 0;

    gUnknown_030049A0[y][x] = 0;

    gUnknown_03004E60.pUnk04++;
    gUnknown_03004E60.pUnk04->connexion = 4;

    CallARM_FillMovementMap();
}

void sub_801A570(int connexion, int x, int y) {
    // This is a C implementation of the ARM (asm) function IRAMARM_Func5
    // Probably used during testing before switching to the a more "optimal" version.

    short tileMovementCost;

    x += gUnknown_03004E60.pUnk00->xPos;
    y += gUnknown_03004E60.pUnk00->yPos;

    tileMovementCost = gUnknown_03004BB0[gBmMapTerrain[y][x]]
        + (s8) gUnknown_030049A0[(u8) gUnknown_03004E60.pUnk00->yPos][(u8) gUnknown_03004E60.pUnk00->xPos];

    if (tileMovementCost >= gUnknown_030049A0[y][x])
        return;

    if (gUnknown_03004E60.hasUnit && gBmMapUnit[y][x])
        if ((gBmMapUnit[y][x] ^ gUnknown_03004E60.unitId) & 0x80)
            return;

    if (tileMovementCost > gUnknown_03004E60.movement)
        return;

    gUnknown_03004E60.pUnk04->xPos = x;
    gUnknown_03004E60.pUnk04->yPos = y;
    gUnknown_03004E60.pUnk04->connexion = connexion;
    gUnknown_03004E60.pUnk04->leastMoveCost = tileMovementCost;

    gUnknown_03004E60.pUnk04++;

    gUnknown_030049A0[y][x] = tileMovementCost;
}

void sub_801A640(int x, int y, u8 output[]) {
    u8* outputStart = output;

    short bestCost;
    short bestDirectionCount;

    u8 neighbourCosts[4];
    u8 bestDirections[4];

    short nextDirection = 0;

    int i;

    // The basic algorithm here is:
    // 1. start from the end point
    // 2. get on the point that's closest to the origin (lowest cost)
    // 3. write direction to output
    // 4. repeat 2-4 until we reached origin (cost = 0)
    // 5. reverse and terminate output

    while (((s8**) gUnknown_030049A0)[y][x] != 0) {
        // Build neighbor cost list

        if (x == (gBmMapSize.x - 1))
            neighbourCosts[RECT_DIRECTION_RIGHT] |= 0xFF;
        else
            neighbourCosts[RECT_DIRECTION_RIGHT] = gUnknown_030049A0[y][x+1];

        if (x == 0)
            neighbourCosts[RECT_DIRECTION_LEFT] |= 0xFF;
        else
            neighbourCosts[RECT_DIRECTION_LEFT] = gUnknown_030049A0[y][x-1];

        if (y == (gBmMapSize.y - 1))
            neighbourCosts[RECT_DIRECTION_DOWN] |= 0xFF;
        else
            neighbourCosts[RECT_DIRECTION_DOWN] = gUnknown_030049A0[y+1][x];

        if (y == 0)
            neighbourCosts[RECT_DIRECTION_UP] |= 0xFF;
        else
            neighbourCosts[RECT_DIRECTION_UP] = gUnknown_030049A0[y-1][x];

        // find best cost

        bestCost = 0x100;
        bestDirectionCount = 0;

        for (i = 0; i < 4; ++i)
            if (bestCost > neighbourCosts[i])
                bestCost = neighbourCosts[i];

        // list all directions that have best cost

        for (i = 0; i < 4; ++i)
            if (bestCost == neighbourCosts[i])
                bestDirections[bestDirectionCount++] = i;

        // get next direction (choose randomly if necessary)

        switch (bestDirectionCount) {

        case 1:
            nextDirection = bestDirections[0];
            break;

        case 2:
            nextDirection = bestDirections[NextRN_N(2)];
            break;

        case 3:
            nextDirection = bestDirections[NextRN_N(3)];
            break;

        case 4:
            nextDirection = bestDirections[NextRN_N(4)];
            break;

        } // switch (bestDirectionCount)

        // write next direction

        *output++ = nextDirection;

        // update position given direction

        switch (nextDirection) {

        case RECT_DIRECTION_RIGHT:
            x++;
            break;

        case RECT_DIRECTION_LEFT:
            x--;
            break;

        case RECT_DIRECTION_DOWN:
            y++;
            break;

        case RECT_DIRECTION_UP:
            y--;
            break;

        } // switch (nextDirection)
    }

    // reverse and terminate output
    sub_801A7F4(outputStart, output);
}

void sub_801A7F4(u8* begin, u8* end) {
    u8 buffer[0x40];

    u8* it = buffer;

    while (end > begin)
        *it++ = *--end;

    *it = RECT_DIRECTION_END;

    for (it = buffer; *it != RECT_DIRECTION_END;)
        *begin++ = *it++;

    *begin = RECT_DIRECTION_END;
}

void sub_801A82C(struct Unit* unit, int x, int y) {
    u8* it = gUnknown_02033EFC;

    for (;;) {
        gActionData.xMove = x;
        gActionData.yMove = y;

        switch (*it) {

        case RECT_DIRECTION_DOWN: // up
            y--;
            break;

        case RECT_DIRECTION_UP: // down
            y++;
            break;

        case RECT_DIRECTION_RIGHT: // left
            x--;
            break;

        case RECT_DIRECTION_LEFT: // right
            x++;
            break;

        } // switch (*it)

        if (!(UNIT_CATTRIBUTES(unit) & (CA_LOCKPICK | CA_FLYER | CA_LETHALITY))) {
            if (gBmMapHidden[y][x] & HIDDEN_BIT_TRAP) {
                *++it = RECT_DIRECTION_END;

                gActionData.unitActionType = UNIT_ACTION_TRAPPED;
                gActionData.xMove = x;
                gActionData.yMove = y;

                return;
            }
        }

        if (gBmMapHidden[y][x] & HIDDEN_BIT_UNIT) {
            *it++ = 0xA;
            *it++ = RECT_DIRECTION_END;

            gActionData.unitActionType = UNIT_ACTION_TRAPPED;

            return;
        }

        if (*it == RECT_DIRECTION_END)
            break;

        it++;
    }
}

void sub_801A8E4(void) {
    int ix, iy;

    for (iy = gBmMapSize.y - 1; iy >= 0; --iy)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; --ix)
        {
            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            if ((s8) gBmMapMovement[iy][ix] == gUnknown_03004E60.maxMovementValue)
                continue;

            if ((s8) gBmMapMovement[iy][ix - 1] < 0 && (ix != 0))
                gBmMapMovement[iy][ix - 1] = gUnknown_03004E60.maxMovementValue;

            if ((s8) gBmMapMovement[iy][ix + 1] < 0 && (ix != (gBmMapSize.x - 1)))
                gBmMapMovement[iy][ix + 1] = gUnknown_03004E60.maxMovementValue;

            if ((s8) gBmMapMovement[iy - 1][ix] < 0 && (iy != 0))
                gBmMapMovement[iy - 1][ix] = gUnknown_03004E60.maxMovementValue;

            if ((s8) gBmMapMovement[iy + 1][ix] < 0 && (iy != (gBmMapSize.y - 1)))
                gBmMapMovement[iy + 1][ix] = gUnknown_03004E60.maxMovementValue;
        }
    }

    gUnknown_03004E60.maxMovementValue++;
}
