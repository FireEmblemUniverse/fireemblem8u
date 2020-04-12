#include "global.h"

#include "constants/terrains.h"

#include "rng.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "proc.h"
#include "mu.h"

#include "bmidoten.h"

static void RevertMovementScript(u8* begin, u8* end);

inline void SetWorkingBmMap(u8** map)
{
    gWorkingBmMap = map;
}

void GenerateUnitMovementMap(struct Unit* unit)
{
    SetWorkingMoveCosts(GetUnitMovementCost(unit));
    SetWorkingBmMap(gBmMapMovement);

    GenerateMovementMap(unit->xPos, unit->yPos, UNIT_MOV(unit), unit->index);
}

void GenerateUnitMovementMapExt(struct Unit* unit, s8 movement)
{
    SetWorkingMoveCosts(GetUnitMovementCost(unit));
    SetWorkingBmMap(gBmMapMovement);

    GenerateMovementMap(unit->xPos, unit->yPos, movement, unit->index);
}

void GenerateUnitExtendedMovementMap(struct Unit* unit)
{
    SetWorkingMoveCosts(GetUnitMovementCost(unit));
    SetWorkingBmMap(gBmMapMovement);

    GenerateMovementMap(unit->xPos, unit->yPos, MAP_MOVEMENT_EXTENDED, 0);
}

void GenerateExtendedMovementMapOnRange(int x, int y, const s8 mct[TERRAIN_COUNT])
{
    SetWorkingMoveCosts(mct);
    SetWorkingBmMap(gBmMapRange);

    GenerateMovementMap(x, y, MAP_MOVEMENT_EXTENDED, 0);
}

void GenerateExtendedMovementMap(int x, int y, const s8 mct[TERRAIN_COUNT])
{
    SetWorkingMoveCosts(mct);
    SetWorkingBmMap(gBmMapMovement);

    GenerateMovementMap(x, y, MAP_MOVEMENT_EXTENDED, 0);
}

void GenerateMovementMapOnWorkingMap(struct Unit* unit, int x, int y, int movement)
{
    SetWorkingMoveCosts(GetUnitMovementCost(unit));

    GenerateMovementMap(x, y, movement, unit->index);
}

void SetWorkingMoveCosts(const s8 mct[TERRAIN_COUNT])
{
    int i;

    for (i = 0; i < TERRAIN_COUNT; ++i)
        gWorkingTerrainMoveCosts[i] = mct[i];
}

void GenerateMovementMap(int x, int y, int movement, int unitId)
{
    gMovMapFillState.pUnk04 = gUnknown_030049B0;
    gMovMapFillState.pUnk00 = gUnknown_03004C50;

    gMovMapFillState.movement = movement;

    if (unitId == 0)
    {
        gMovMapFillState.hasUnit = FALSE;
    }
    else
    {
        gMovMapFillState.hasUnit = TRUE;
        gMovMapFillState.unitId = unitId;
    }

    gMovMapFillState.maxMovementValue = MAP_MOVEMENT_MAX;

    BmMapFill(gWorkingBmMap, -1);

    gMovMapFillState.pUnk04->xPos = x;
    gMovMapFillState.pUnk04->yPos = y;
    gMovMapFillState.pUnk04->connexion = 5;
    gMovMapFillState.pUnk04->leastMoveCost = 0;

    gWorkingBmMap[y][x] = 0;

    gMovMapFillState.pUnk04++;
    gMovMapFillState.pUnk04->connexion = 4;

    CallARM_FillMovementMap();
}

void sub_801A570(int connexion, int x, int y)
{
    // This is a C implementation of the ARM (asm) function IRAMARM_Func5
    // Probably used during testing before switching to the a more "optimal" version.

    short tileMovementCost;

    x += gMovMapFillState.pUnk00->xPos;
    y += gMovMapFillState.pUnk00->yPos;

    tileMovementCost = gWorkingTerrainMoveCosts[gBmMapTerrain[y][x]]
        + (s8) gWorkingBmMap[(u8) gMovMapFillState.pUnk00->yPos][(u8) gMovMapFillState.pUnk00->xPos];

    if (tileMovementCost >= gWorkingBmMap[y][x])
        return;

    if (gMovMapFillState.hasUnit && gBmMapUnit[y][x])
        if ((gBmMapUnit[y][x] ^ gMovMapFillState.unitId) & 0x80)
            return;

    if (tileMovementCost > gMovMapFillState.movement)
        return;

    gMovMapFillState.pUnk04->xPos = x;
    gMovMapFillState.pUnk04->yPos = y;
    gMovMapFillState.pUnk04->connexion = connexion;
    gMovMapFillState.pUnk04->leastMoveCost = tileMovementCost;

    gMovMapFillState.pUnk04++;

    gWorkingBmMap[y][x] = tileMovementCost;
}

void GenerateBestMovementScript(int x, int y, u8 output[])
{
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

    // As we build the list *in reverse*, the directions are also "reversed" as we traverse the path.

    while (((s8**) gWorkingBmMap)[y][x] != 0)
    {
        // Build neighbor cost list

        if (x == (gBmMapSize.x - 1))
            neighbourCosts[MU_COMMAND_MOVE_LEFT] |= 0xFF;
        else
            neighbourCosts[MU_COMMAND_MOVE_LEFT] = gWorkingBmMap[y][x+1];

        if (x == 0)
            neighbourCosts[MU_COMMAND_MOVE_RIGHT] |= 0xFF;
        else
            neighbourCosts[MU_COMMAND_MOVE_RIGHT] = gWorkingBmMap[y][x-1];

        if (y == (gBmMapSize.y - 1))
            neighbourCosts[MU_COMMAND_MOVE_UP] |= 0xFF;
        else
            neighbourCosts[MU_COMMAND_MOVE_UP] = gWorkingBmMap[y+1][x];

        if (y == 0)
            neighbourCosts[MU_COMMAND_MOVE_DOWN] |= 0xFF;
        else
            neighbourCosts[MU_COMMAND_MOVE_DOWN] = gWorkingBmMap[y-1][x];

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

        switch (bestDirectionCount)
        {

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
        // reminder: directions are reversed

        switch (nextDirection)
        {

        case MU_COMMAND_MOVE_LEFT:
            x++;
            break;

        case MU_COMMAND_MOVE_RIGHT:
            x--;
            break;

        case MU_COMMAND_MOVE_UP:
            y++;
            break;

        case MU_COMMAND_MOVE_DOWN:
            y--;
            break;

        } // switch (nextDirection)
    }

    // reverse and terminate output
    RevertMovementScript(outputStart, output);
}

void RevertMovementScript(u8* begin, u8* end)
{
    u8 buffer[MU_COMMAND_MAX_COUNT];

    u8* it = buffer;

    while (end > begin)
        *it++ = *--end;

    *it = MU_COMMAND_HALT;

    for (it = buffer; *it != MU_COMMAND_HALT;)
        *begin++ = *it++;

    *begin = MU_COMMAND_HALT;
}

void UnitApplyWorkingMovementScript(struct Unit* unit, int x, int y)
{
    u8* it = gWorkingMovementScript;

    for (;;) {
        gActionData.xMove = x;
        gActionData.yMove = y;

        switch (*it)
        {

        case MU_COMMAND_MOVE_UP: // up
            y--;
            break;

        case MU_COMMAND_MOVE_DOWN: // down
            y++;
            break;

        case MU_COMMAND_MOVE_LEFT: // left
            x--;
            break;

        case MU_COMMAND_MOVE_RIGHT: // right
            x++;
            break;

        } // switch (*it)

        if (!(UNIT_CATTRIBUTES(unit) & (CA_THIEF | CA_FLYER | CA_ASSASSIN)))
        {
            if (gBmMapHidden[y][x] & HIDDEN_BIT_TRAP)
            {
                *++it = MU_COMMAND_HALT;

                gActionData.unitActionType = UNIT_ACTION_TRAPPED;
                gActionData.xMove = x;
                gActionData.yMove = y;

                return;
            }
        }

        if (gBmMapHidden[y][x] & HIDDEN_BIT_UNIT)
        {
            *it++ = MU_COMMAND_BUMP;
            *it++ = MU_COMMAND_HALT;

            gActionData.unitActionType = UNIT_ACTION_TRAPPED;

            return;
        }

        if (*it == MU_COMMAND_HALT)
            break;

        it++;
    }
}

void MarkMovementMapEdges(void) {
    int ix, iy;

    for (iy = gBmMapSize.y - 1; iy >= 0; --iy)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; --ix)
        {
            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            if ((s8) gBmMapMovement[iy][ix] == gMovMapFillState.maxMovementValue)
                continue;

            if ((s8) gBmMapMovement[iy][ix - 1] < 0 && (ix != 0))
                gBmMapMovement[iy][ix - 1] = gMovMapFillState.maxMovementValue;

            if ((s8) gBmMapMovement[iy][ix + 1] < 0 && (ix != (gBmMapSize.x - 1)))
                gBmMapMovement[iy][ix + 1] = gMovMapFillState.maxMovementValue;

            if ((s8) gBmMapMovement[iy - 1][ix] < 0 && (iy != 0))
                gBmMapMovement[iy - 1][ix] = gMovMapFillState.maxMovementValue;

            if ((s8) gBmMapMovement[iy + 1][ix] < 0 && (iy != (gBmMapSize.y - 1)))
                gBmMapMovement[iy + 1][ix] = gMovMapFillState.maxMovementValue;
        }
    }

    gMovMapFillState.maxMovementValue++;
}

void MarkWorkingMapEdges(void)
{
    int ix, iy;

    for (iy = gBmMapSize.y - 1; iy >= 0; --iy)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; --ix)
        {
            if (gWorkingBmMap[iy][ix] > MAP_MOVEMENT_MAX)
                continue;

            if ((s8) gWorkingBmMap[iy][ix] == gMovMapFillState.maxMovementValue)
                continue;

            if ((s8) gWorkingBmMap[iy][ix - 1] < 0 && (ix != 0))
                gWorkingBmMap[iy][ix - 1] = gMovMapFillState.maxMovementValue;

            if ((s8) gWorkingBmMap[iy][ix + 1] < 0 && (ix != (gBmMapSize.x - 1)))
                gWorkingBmMap[iy][ix + 1] = gMovMapFillState.maxMovementValue;

            if ((s8) gWorkingBmMap[iy - 1][ix] < 0 && (iy != 0))
                gWorkingBmMap[iy - 1][ix] = gMovMapFillState.maxMovementValue;

            if ((s8) gWorkingBmMap[iy + 1][ix] < 0 && (iy != (gBmMapSize.y - 1)))
                gWorkingBmMap[iy + 1][ix] = gMovMapFillState.maxMovementValue;
        }
    }

    gMovMapFillState.maxMovementValue++;
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
            gWorkingBmMap[iy][ix] += value;
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
            gWorkingBmMap[iy][ix] += value;
        }
    }
}

void MapSetInRange(int x, int y, int range, int value)
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
            gWorkingBmMap[iy][ix] = value;
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
            gWorkingBmMap[iy][ix] = value;
        }
    }
}

inline void MapAddInBoundedRange(short x, short y, short minRange, short maxRange)
{
    MapAddInRange(x, y, maxRange,     +1);
    MapAddInRange(x, y, minRange - 1, -1);
}

void GenerateUnitCompleteAttackRange(struct Unit* unit)
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
            MapAddInBoundedRange(ix, iy, 1, 1);
        })

        break;

    case REACH_RANGE1 | REACH_RANGE2:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapAddInBoundedRange(ix, iy, 1, 2);
        })

        break;

    case REACH_RANGE1 | REACH_RANGE2 | REACH_RANGE3:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapAddInBoundedRange(ix, iy, 1, 3);
        })

        break;

    case REACH_RANGE2:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapAddInBoundedRange(ix, iy, 2, 2);
        })

        break;

    case REACH_RANGE2 | REACH_RANGE3:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapAddInBoundedRange(ix, iy, 2, 3);
        })

        break;

    case REACH_RANGE3:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapAddInBoundedRange(ix, iy, 3, 3);
        })

        break;

    case REACH_RANGE3 | REACH_TO10:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapAddInBoundedRange(ix, iy, 3, 10);
        })

        break;

    case REACH_RANGE1 | REACH_RANGE3:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapAddInBoundedRange(ix, iy, 1, 1);
            MapAddInBoundedRange(ix, iy, 3, 3);
        })

        break;

    case REACH_RANGE1 | REACH_RANGE3 | REACH_TO10:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapAddInBoundedRange(ix, iy, 1, 1);
            MapAddInBoundedRange(ix, iy, 3, 10);
        })

        break;

    case REACH_RANGE1 | REACH_RANGE2 | REACH_RANGE3 | REACH_TO10:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapAddInBoundedRange(ix, iy, 1, 10);
        })

        break;

    case REACH_RANGE1 | REACH_TO10:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapAddInBoundedRange(ix, iy, 1, 4);
        })

        break;

    } // switch (GetUnitWeaponReachBits(unit, -1))

    if (UNIT_CATTRIBUTES(unit) & CA_BALLISTAE)
    {
        FOR_EACH_IN_MOVEMENT_RANGE({
            int item = GetBallistaItemAt(ix, iy);

            if (item)
            {
                MapAddInBoundedRange(ix, iy,
                    GetItemMinRange(item), GetItemMaxRange(item));
            }
        })
    }

    #undef FOR_EACH_IN_MOVEMENT_RANGE

    SetWorkingBmMap(gBmMapMovement);
}

void GenerateUnitStandingReachRange(struct Unit* unit, int reach)
{
    int x = unit->xPos;
    int y = unit->yPos;

    switch (reach)
    {

    case REACH_RANGE1:
        MapAddInBoundedRange(x, y, 1, 1);
        break;

    case REACH_RANGE1 | REACH_RANGE2:
        MapAddInBoundedRange(x, y, 1, 2);
        break;

    case REACH_RANGE1 | REACH_RANGE2 | REACH_RANGE3:
        MapAddInBoundedRange(x, y, 1, 3);
        break;

    case REACH_RANGE2:
        MapAddInBoundedRange(x, y, 2, 2);
        break;

    case REACH_RANGE2 | REACH_RANGE3:
        MapAddInBoundedRange(x, y, 2, 3);
        break;

    case REACH_RANGE3:
        MapAddInBoundedRange(x, y, 3, 3);
        break;

    case REACH_RANGE3 | REACH_TO10:
        MapAddInBoundedRange(x, y, 3, 10);
        break;

    case REACH_RANGE1 | REACH_RANGE3:
        MapAddInBoundedRange(x, y, 1, 1);
        MapAddInBoundedRange(x, y, 3, 3);
        break;

    case REACH_RANGE1 | REACH_RANGE3 | REACH_TO10:
        MapAddInBoundedRange(x, y, 1, 1);
        MapAddInBoundedRange(x, y, 3, 10);
        break;

    case REACH_RANGE1 | REACH_RANGE2 | REACH_RANGE3 | REACH_TO10:
        MapAddInBoundedRange(x, y, 1, 10);
        break;

    case REACH_RANGE1 | REACH_TO10:
        MapAddInBoundedRange(x, y, 1, 4);
        break;

    case REACH_MAGBY2:
        MapAddInBoundedRange(x, y, 1, GetUnitMagBy2Range(unit));
        break;

    } // switch (reach)
}

void GenerateUnitCompleteStaffRange(struct Unit* unit)
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
            MapAddInBoundedRange(ix, iy, 1, 1);
        })

        break;

    case REACH_RANGE1 | REACH_RANGE2:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapAddInBoundedRange(ix, iy, 1, 2);
        })

        break;

    case REACH_MAGBY2:
        FOR_EACH_IN_MOVEMENT_RANGE({
            MapAddInBoundedRange(ix, iy, 1, magBy2Range);
        })

        break;

    default:
        break;

    } // switch (reach)

    #undef FOR_EACH_IN_MOVEMENT_RANGE
}

void GenerateDangerZoneRange(s8 boolDisplayStaffRange)
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

        if (gRAMChapterData.chapterVisionRange && (gBmMapFog[unit->yPos][unit->xPos] == 0))
            continue; // in the fog

        if (unit->state & US_UNDER_A_ROOF)
            continue; // under a roof

        // Fill movement map for unit
        GenerateUnitMovementMapExt(unit, UNIT_MOV(unit));

        savedUnitId = gBmMapUnit[unit->yPos][unit->xPos];
        gBmMapUnit[unit->yPos][unit->xPos] = 0;

        hasMagicRank = UnitHasMagicRank(unit);

        if (prevHasMagicRank != hasMagicRank)
        {
            BmMapFill(gBmMapUnk, 0);

            if (hasMagicRank)
                GenerateMagicSealMap(1);

            prevHasMagicRank = hasMagicRank;
        }

        SetWorkingBmMap(gBmMapRange);

        // Apply unit's range to range map

        if (boolDisplayStaffRange)
            GenerateUnitCompleteStaffRange(unit);
        else
            GenerateUnitCompleteAttackRange(unit);

        gBmMapUnit[unit->yPos][unit->xPos] = savedUnitId;
    }
}

void GenerateMagicSealMap(int value)
{
    int i;

    for (i = FACTION_RED + 1; i < FACTION_RED + 0x40; ++i)
    {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (UNIT_CATTRIBUTES(unit) & CA_MAGICSEAL)
            MapSetInRange(unit->xPos, unit->yPos, 10, value);
    }
}

inline u8* GetWorkingMoveCosts(void)
{
    return gWorkingTerrainMoveCosts;
}
