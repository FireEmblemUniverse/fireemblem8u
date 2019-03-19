#include "global.h"

#include "constants/terrains.h"

#include "rng.h"
#include "bmitem.h"
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
void sub_801A8E4(void);
void sub_801A9D0(void);
void MapAddInRange(int x, int y, int range, int value);
void StoreR3ToMapSomething(int x, int y, int range, int value);
void FillMapAttackRangeForUnit(struct Unit* unit);
void FillRangeByRangeMask(struct Unit* unit, int reach);
void FillMapStaffRangeForUnit(struct Unit* unit);
void ApplyStuffToRangeMaps(s8 boolDisplayStaffRange);
void sub_801B950(int value);
void SetSubjectMap(u8** map);
void FillRangeMap(short x, short y, short minRange, short maxRange);
u8* GetCurrentMovCostTable(void);

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

inline void SetSubjectMap(u8** map) {
    gUnknown_030049A0 = map;
}

void FillMovementMapForUnit(struct Unit* unit) {
    StoreMovCostTable(GetUnitMovementCost(unit));
    SetSubjectMap(gBmMapMovement);

    FillMovementMap(unit->xPos, unit->yPos, UNIT_MOV(unit), unit->index);
}

void FillMovementMapForUnitAndMovement(struct Unit* unit, s8 movement) {
    StoreMovCostTable(GetUnitMovementCost(unit));
    SetSubjectMap(gBmMapMovement);

    FillMovementMap(unit->xPos, unit->yPos, movement, unit->index);
}

void FillMovementMapForUnitPosition(struct Unit* unit) {
    StoreMovCostTable(GetUnitMovementCost(unit));
    SetSubjectMap(gBmMapMovement);

    FillMovementMap(unit->xPos, unit->yPos, MAP_MOVEMENT_MAX_124, 0);
}

void FillMovementRangeMapSomehow(int x, int y, const s8 mct[TERRAIN_COUNT]) {
    StoreMovCostTable(mct);
    SetSubjectMap(gBmMapRange);

    FillMovementMap(x, y, MAP_MOVEMENT_MAX_124, 0);
}

void FillMovementMapSomehow(int x, int y, const s8 mct[TERRAIN_COUNT]) {
    StoreMovCostTable(mct);
    SetSubjectMap(gBmMapMovement);

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

void sub_801A9D0(void)
{
    int ix, iy;

    for (iy = gBmMapSize.y - 1; iy >= 0; --iy)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; --ix)
        {
            if (gUnknown_030049A0[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            if ((s8) gUnknown_030049A0[iy][ix] == gUnknown_03004E60.maxMovementValue)
                continue;

            if ((s8) gUnknown_030049A0[iy][ix - 1] < 0 && (ix != 0))
                gUnknown_030049A0[iy][ix - 1] = gUnknown_03004E60.maxMovementValue;

            if ((s8) gUnknown_030049A0[iy][ix + 1] < 0 && (ix != (gBmMapSize.x - 1)))
                gUnknown_030049A0[iy][ix + 1] = gUnknown_03004E60.maxMovementValue;

            if ((s8) gUnknown_030049A0[iy - 1][ix] < 0 && (iy != 0))
                gUnknown_030049A0[iy - 1][ix] = gUnknown_03004E60.maxMovementValue;

            if ((s8) gUnknown_030049A0[iy + 1][ix] < 0 && (iy != (gBmMapSize.y - 1)))
                gUnknown_030049A0[iy + 1][ix] = gUnknown_03004E60.maxMovementValue;
        }
    }

    gUnknown_03004E60.maxMovementValue++;
}

void MapAddInRange(int x, int y, int range, int value)
{
    int ix, iy, iRange;

    // Handles rows [y, y+range]
    // For each row, decrement range
    for (iRange = range, iy = y; (iy <= y + range) && (iy < gBmMapSize.y); --iRange, ++iy)
    {
        int xMin, xMax, xRange;

        xMin = x - iRange;
        xRange = 2 * iRange + 1;

        if (xMin < 0)
        {
            xRange += xMin;
            xMin = 0;
        }

        xMax = xMin + xRange;

        if (xMax > gBmMapSize.x)
        {
            xMax -= (xMax - gBmMapSize.x);
            xMax = gBmMapSize.x;
        }

        for (ix = xMin; ix < xMax; ++ix)
        {
            gUnknown_030049A0[iy][ix] += value;
        }
    }

    // Handle rows [y-range, y-1], starting from the bottom most row
    // For each row, decrement range
    for (iRange = (range - 1), iy = (y - 1); (iy >= y - range) && (iy >= 0); --iRange, --iy)
    {
        int xMin, xMax, xRange;

        xMin = x - iRange;
        xRange = 2 * iRange + 1;

        if (xMin < 0)
        {
            xRange += xMin;
            xMin = 0;
        }

        xMax = xMin + xRange;

        if (xMax > gBmMapSize.x)
        {
            xMax -= (xMax - gBmMapSize.x);
            xMax = gBmMapSize.x;
        }

        for (ix = xMin; ix < xMax; ++ix)
        {
            gUnknown_030049A0[iy][ix] += value;
        }
    }
}

void StoreR3ToMapSomething(int x, int y, int range, int value)
{
    int ix, iy, iRange;

    // Handles rows [y, y+range]
    // For each row, decrement range
    for (iRange = range, iy = y; (iy <= y + range) && (iy < gBmMapSize.y); --iRange, ++iy)
    {
        int xMin, xMax, xRange;

        xMin = x - iRange;
        xRange = 2 * iRange + 1;

        if (xMin < 0)
        {
            xRange += xMin;
            xMin = 0;
        }

        xMax = xMin + xRange;

        if (xMax > gBmMapSize.x)
        {
            xMax -= (xMax - gBmMapSize.x);
            xMax = gBmMapSize.x;
        }

        for (ix = xMin; ix < xMax; ++ix)
        {
            gUnknown_030049A0[iy][ix] = value;
        }
    }

    // Handle rows [y-range, y-1], starting from the bottom most row
    // For each row, decrement range
    for (iRange = (range - 1), iy = (y - 1); (iy >= y - range) && (iy >= 0); --iRange, --iy)
    {
        int xMin, xMax, xRange;

        xMin = x - iRange;
        xRange = 2 * iRange + 1;

        if (xMin < 0)
        {
            xRange += xMin;
            xMin = 0;
        }

        xMax = xMin + xRange;

        if (xMax > gBmMapSize.x)
        {
            xMax -= (xMax - gBmMapSize.x);
            xMax = gBmMapSize.x;
        }

        for (ix = xMin; ix < xMax; ++ix)
        {
            gUnknown_030049A0[iy][ix] = value;
        }
    }
}

inline void FillRangeMap(short x, short y, short minRange, short maxRange)
{
    MapAddInRange(x, y, maxRange,     +1);
    MapAddInRange(x, y, minRange - 1, -1);
}

void FillMapAttackRangeForUnit(struct Unit* unit)
{
    int ix, iy;

    #define FOR_EACH_IN_MOVEMENT_RANGE(block) \
        for (iy = gBmMapSize.y - 1; iy >= 0; --iy) \
        { \
            for (ix = gBmMapSize.x - 1; ix >= 0; --ix) \
            { \
                if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) \
                    continue; \
                if (gBmMapUnit[iy][ix]) \
                    continue; \
                if (gBmMapUnk[iy][ix]) \
                    continue; \
                block \
            } \
        }

    switch (GetUnitWeaponReachBits(unit, -1))
    {

    case REACH_RANGE1:
        FOR_EACH_IN_MOVEMENT_RANGE({
            FillRangeMap(ix, iy, 1, 1);
        })

        break;

    case REACH_RANGE1 | REACH_RANGE2:
        FOR_EACH_IN_MOVEMENT_RANGE({
            FillRangeMap(ix, iy, 1, 2);
        })

        break;

    case REACH_RANGE1 | REACH_RANGE2 | REACH_RANGE3:
        FOR_EACH_IN_MOVEMENT_RANGE({
            FillRangeMap(ix, iy, 1, 3);
        })

        break;

    case REACH_RANGE2:
        FOR_EACH_IN_MOVEMENT_RANGE({
            FillRangeMap(ix, iy, 2, 2);
        })

        break;

    case REACH_RANGE2 | REACH_RANGE3:
        FOR_EACH_IN_MOVEMENT_RANGE({
            FillRangeMap(ix, iy, 2, 3);
        })

        break;

    case REACH_RANGE3:
        FOR_EACH_IN_MOVEMENT_RANGE({
            FillRangeMap(ix, iy, 3, 3);
        })

        break;

    case REACH_RANGE3 | REACH_TO10:
        FOR_EACH_IN_MOVEMENT_RANGE({
            FillRangeMap(ix, iy, 3, 10);
        })

        break;

    case REACH_RANGE1 | REACH_RANGE3:
        FOR_EACH_IN_MOVEMENT_RANGE({
            FillRangeMap(ix, iy, 1, 1);
            FillRangeMap(ix, iy, 3, 3);
        })

        break;

    case REACH_RANGE1 | REACH_RANGE3 | REACH_TO10:
        FOR_EACH_IN_MOVEMENT_RANGE({
            FillRangeMap(ix, iy, 1, 1);
            FillRangeMap(ix, iy, 3, 10);
        })

        break;

    case REACH_RANGE1 | REACH_RANGE2 | REACH_RANGE3 | REACH_TO10:
        FOR_EACH_IN_MOVEMENT_RANGE({
            FillRangeMap(ix, iy, 1, 10);
        })

        break;

    case REACH_RANGE1 | REACH_TO10:
        FOR_EACH_IN_MOVEMENT_RANGE({
            FillRangeMap(ix, iy, 1, 4);
        })

        break;

    } // switch (GetUnitWeaponReachBits(unit, -1))

    if (UNIT_CATTRIBUTES(unit) & CA_BALLISTAE)
    {
        FOR_EACH_IN_MOVEMENT_RANGE({
            int item = GetBallistaItemAt(ix, iy);

            if (item)
            {
                FillRangeMap(ix, iy,
                    GetItemMinRange(item), GetItemMaxRange(item));
            }
        })
    }

    #undef FOR_EACH_IN_MOVEMENT_RANGE

    SetSubjectMap(gBmMapMovement);
}

void FillRangeByRangeMask(struct Unit* unit, int reach)
{
    int x = unit->xPos;
    int y = unit->yPos;

    switch (reach)
    {

    case REACH_RANGE1:
        FillRangeMap(x, y, 1, 1);
        break;

    case REACH_RANGE1 | REACH_RANGE2:
        FillRangeMap(x, y, 1, 2);
        break;

    case REACH_RANGE1 | REACH_RANGE2 | REACH_RANGE3:
        FillRangeMap(x, y, 1, 3);
        break;

    case REACH_RANGE2:
        FillRangeMap(x, y, 2, 2);
        break;

    case REACH_RANGE2 | REACH_RANGE3:
        FillRangeMap(x, y, 2, 3);
        break;

    case REACH_RANGE3:
        FillRangeMap(x, y, 3, 3);
        break;

    case REACH_RANGE3 | REACH_TO10:
        FillRangeMap(x, y, 3, 10);
        break;

    case REACH_RANGE1 | REACH_RANGE3:
        FillRangeMap(x, y, 1, 1);
        FillRangeMap(x, y, 3, 3);
        break;

    case REACH_RANGE1 | REACH_RANGE3 | REACH_TO10:
        FillRangeMap(x, y, 1, 1);
        FillRangeMap(x, y, 3, 10);
        break;

    case REACH_RANGE1 | REACH_RANGE2 | REACH_RANGE3 | REACH_TO10:
        FillRangeMap(x, y, 1, 10);
        break;

    case REACH_RANGE1 | REACH_TO10:
        FillRangeMap(x, y, 1, 4);
        break;

    case REACH_MAGBY2:
        FillRangeMap(x, y, 1, GetUnitMagBy2Range(unit));
        break;

    } // switch (reach)
}

void FillMapStaffRangeForUnit(struct Unit* unit)
{
    int ix, iy;

    int reach = GetUnitStaffReachBits(unit);
    int magBy2Range = GetUnitMagBy2Range(unit);

    #define FOR_EACH_IN_MOVEMENT_RANGE(block) \
        for (iy = gBmMapSize.y - 1; iy >= 0; --iy) \
        { \
            for (ix = gBmMapSize.x - 1; ix >= 0; --ix) \
            { \
                if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) \
                    continue; \
                if (gBmMapUnit[iy][ix]) \
                    continue; \
                if (gBmMapUnk[iy][ix]) \
                    continue; \
                block \
            } \
        }

    switch (reach)
    {

    case REACH_RANGE1:
        FOR_EACH_IN_MOVEMENT_RANGE({
            FillRangeMap(ix, iy, 1, 1);
        })

        break;

    case REACH_RANGE1 | REACH_RANGE2:
        FOR_EACH_IN_MOVEMENT_RANGE({
            FillRangeMap(ix, iy, 1, 2);
        })

        break;

    case REACH_MAGBY2:
        FOR_EACH_IN_MOVEMENT_RANGE({
            FillRangeMap(ix, iy, 1, magBy2Range);
        })

        break;

    default:
        break;

    } // switch (reach)

    #undef FOR_EACH_IN_MOVEMENT_RANGE
}

void ApplyStuffToRangeMaps(s8 boolDisplayStaffRange)
{
    int i, enemyFaction;
    int hasMagicRank, prevHasMagicRank;
    u8 savedUnitId;

    prevHasMagicRank = -1;

    BmMapFill(gBmMapRange, 0);

    enemyFaction = IsNotEnemyPhaseMaybe();

    for (i = enemyFaction + 1; i < enemyFaction + 0x80; ++i)
    {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue; // not a unit

        if (boolDisplayStaffRange && !UnitHasMagicRank(unit))
            continue; // no magic in magic range mode

        if (gUnknown_0202BCF0.chapterVisionRange && (gBmMapFog[unit->yPos][unit->xPos] == 0))
            continue; // in the fog

        if (unit->state & US_UNDER_A_ROOF)
            continue; // under a roof

        // Fill movement map for unit
        FillMovementMapForUnitAndMovement(unit, UNIT_MOV(unit));

        savedUnitId = gBmMapUnit[unit->yPos][unit->xPos];
        gBmMapUnit[unit->yPos][unit->xPos] = 0;

        hasMagicRank = UnitHasMagicRank(unit);

        if (prevHasMagicRank != hasMagicRank)
        {
            BmMapFill(gBmMapUnk, 0);

            if (hasMagicRank)
                sub_801B950(1);

            prevHasMagicRank = hasMagicRank;
        }

        SetSubjectMap(gBmMapRange);

        // Apply unit's range to range map

        if (boolDisplayStaffRange)
            FillMapStaffRangeForUnit(unit);
        else
            FillMapAttackRangeForUnit(unit);

        gBmMapUnit[unit->yPos][unit->xPos] = savedUnitId;
    }
}

void sub_801B950(int value)
{
    int i;

    for (i = FACTION_RED + 1; i < FACTION_RED + 0x40; ++i)
    {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (UNIT_CATTRIBUTES(unit) & CA_MAGICSEAL)
            StoreR3ToMapSomething(unit->xPos, unit->yPos, 10, value);
    }
}

inline u8* GetCurrentMovCostTable(void)
{
    return gUnknown_03004BB0;
}
