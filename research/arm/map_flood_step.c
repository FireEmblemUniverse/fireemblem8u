/* NONMATCHING research candidate, excluded from the ROM build.
 * 43 of 51 instruction words match; literal loads and two zero tests differ.
 * The remaining CMP/TST difference also changes carry on unit-blocked returns.
 * Coordinates and the output queue must be valid; the original has no bounds
 * or queue-capacity check. Equal-cost paths do not enter the queue.
 */
typedef unsigned char u8;
typedef unsigned int u32;
struct FloodNode { u8 x, y, connection, cost; };
struct FloodState {
    struct FloodNode * source;
    struct FloodNode * destination;
    u8 checkUnits, movement, unitId, maxMovementValue;
};
extern struct FloodState gMovMapFillState;
extern u8 ** gWorkingBmMap;
extern u8 ** gBmMapTerrain;
extern u8 ** gBmMapUnit;
extern u8 gWorkingTerrainMoveCosts[];

void MapFloodCoreStep(int connectionArg, int dx, int dy)
{
    register int connection asm("r0") = connectionArg;
    register int x asm("r1") = dx;
    register int y asm("r2") = dy;
    register struct FloodState * state asm("r3") = &gMovMapFillState;
    register struct FloodNode * node asm("r4");
    register unsigned sourceX asm("r5");
    register unsigned sourceY asm("r6");
    register u8 ** rows asm("r7");
    register u8 * costs asm("r8");
    register unsigned oldCost asm("r9");
    register unsigned cost asm("r10");

    asm("" : "+r"(state));
    node = state->source;
    asm("" : "+r"(node));
    sourceX = node->x;
    asm("" : "+r"(sourceX));
    x += sourceX;
    asm("" : "+r"(x));
    sourceY = node->y;
    asm("" : "+r"(sourceY));
    y += sourceY;
    asm("" : "+r"(y));
    {
        register u8 *** address asm("r7") = &gBmMapTerrain;
        register u8 * row asm("r7");
        register unsigned terrain asm("r7");
        asm("" : "+r"(address));
        rows = *address;
        asm("" : "+r"(rows));
        row = rows[y];
        asm("" : "+r"(row));
        terrain = row[x];
        asm("" : "+r"(terrain));
        costs = gWorkingTerrainMoveCosts;
        asm("" : "+r"(costs));
        cost = costs[terrain];
        asm("" : "+r"(cost));
    }
    {
        register u8 *** address asm("r7") = &gWorkingBmMap;
        register u8 * row asm("r9");
        asm("" : "+r"(address));
        rows = *address;
        asm("" : "+r"(rows));
        row = rows[sourceY];
        asm("" : "+r"(row));
        oldCost = row[sourceX];
        asm("" : "+r"(oldCost));
        cost += oldCost;
        asm("" : "+r"(cost));
        row = rows[y];
        asm("" : "+r"(row));
        oldCost = row[x];
        asm("" : "+r"(oldCost));
    }
    if (cost >= oldCost)
        goto end;
    {
        register unsigned flag asm("r4") = state->checkUnits;
        asm("" : "+r"(flag));
        if (flag)
        {
            register u8 *** address asm("r7") = &gBmMapUnit;
            register u8 * row asm("r7");
            register unsigned unit asm("r7");
            asm("" : "+r"(address));
            rows = *address;
            asm("" : "+r"(rows));
            row = rows[y];
            asm("" : "+r"(row));
            unit = row[x];
            asm("" : "+r"(unit));
            if (unit)
            {
                flag = state->unitId;
                asm("" : "+r"(flag));
                flag ^= unit;
                asm("" : "+r"(flag));
                flag &= 0x80;
                asm("" : : "r"(flag));
                if (flag)
                    goto end;
            }
        }
        flag = state->movement;
        asm("" : "+r"(flag));
        if (cost > flag)
            goto end;
    }
    node = state->destination;
    asm("" : "+r"(node));
    node->x = x;
    node->y = y;
    node->connection = connection;
    node->cost = cost;
    node++;
    asm("" : "+r"(node));
    state->destination = node;
    {
        register u8 *** address asm("r7") = &gWorkingBmMap;
        register u8 * row asm("r7");
        asm("" : "+r"(address) : : "memory");
        rows = *address;
        asm("" : "+r"(rows));
        row = rows[y];
        asm("" : "+r"(row));
        row[x] = cost;
    }
end:
    return;
}
