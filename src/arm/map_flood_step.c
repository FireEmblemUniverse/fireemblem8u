#include "global.h"
#include "bmidoten.h"
#include "bmbattle.h"
#include "bmmap.h"

// Coordinates are read unsigned, matching the original ARM byte loads.
// Queue only strictly cheaper paths. Callers provide valid coordinates and capacity.
void MapFloodCoreStep(int connectionArg, int dx, int dy)
{
    register int connection asm("r0") = connectionArg;
    register int x asm("r1") = dx;
    register int y asm("r2") = dy;
    register struct MovMapFillState * state asm("r3") = &gMovMapFillState;
    register struct MovMapFillStateExt * node asm("r4");
    register unsigned sourceX asm("r5");
    register unsigned sourceY asm("r6");
    register u8 ** rows asm("r7");
    register u8 * costs asm("r8");
    register unsigned oldCost asm("r9");
    register unsigned cost asm("r10");

    asm("" : "+r"(state));
    node = state->src;
    asm("" : "+r"(node));
    sourceX = (u8) node->xPos;
    asm("" : "+r"(sourceX));
    x += sourceX;
    asm("" : "+r"(x));
    sourceY = (u8) node->yPos;
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
        register unsigned flag asm("r4") = (u8) state->hasUnit;
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
    node = state->dst;
    asm("" : "+r"(node));
    node->xPos = x;
    node->yPos = y;
    node->connexion = connection;
    node->leastMoveCost = cost;
    node++;
    asm("" : "+r"(node));
    state->dst = node;
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
