/* NONMATCHING research candidate, excluded from the ROM build.
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

void MapFloodCoreStep(int connection, int dx, int dy)
{
    struct FloodState * state = &gMovMapFillState;
    unsigned sourceX = state->source->x;
    unsigned sourceY = state->source->y;
    int x = sourceX + dx;
    int y = sourceY + dy;
    unsigned cost = gWorkingTerrainMoveCosts[gBmMapTerrain[y][x]];
    cost += gWorkingBmMap[sourceY][sourceX];
    if (cost >= gWorkingBmMap[y][x])
        return;
    if (state->checkUnits)
    {
        unsigned unit = gBmMapUnit[y][x];
        if (unit && ((state->unitId ^ unit) & 0x80))
            return;
    }
    if (cost > state->movement)
        return;
    state->destination->x = x;
    state->destination->y = y;
    state->destination->connection = connection;
    state->destination->cost = cost;
    state->destination++;
    gWorkingBmMap[y][x] = cost;
}
