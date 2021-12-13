#include "global.h"

#include "bmidoten.h"
#include "bmpatharrowdisp.h"

void sub_80329D8(u8 a, u8 b) {
    gUnknown_0859DBA0.proc->u29 = a;
    gUnknown_0859DBA0.proc->u2a = b;
}

extern u8** gBmMapTerrain;

#define TERRAIN_AT(x, y) gBmMapTerrain[y][x]

// Has something to do with updating costs of each step in a path.
// I could only get a match by inlining the whole loop body into one gross line.
void sub_80329EC(s8 arg1) {
    if (gUnknown_0859DBA0.proc->pathLen >= arg1) {
        s8 i;
        gUnknown_0859DBA0.proc->pathLen = arg1 - 1;
        gUnknown_0859DBA0.proc->pathCosts[gUnknown_0859DBA0.proc->pathLen] =
            gUnknown_0859DBA0.proc->u2b;
        for (i = 1; i <= gUnknown_0859DBA0.proc->pathLen; i++) {
            u8 *costs = GetWorkingMoveCosts();
            gUnknown_0859DBA0.proc->pathCosts[i] =
                gUnknown_0859DBA0.proc->pathCosts[i - 1] -
                costs[TERRAIN_AT(
                    gUnknown_0859DBA0.proc->pathX[i],
                    gUnknown_0859DBA0.proc->pathY[i])];
        }
    }
}

void AddPointToPathArrowProc(s8 x, s8 y) {
    u8 * costs;
    gUnknown_0859DBA0.proc->pathLen++;
    gUnknown_0859DBA0.proc->pathX[gUnknown_0859DBA0.proc->pathLen] = x;
    gUnknown_0859DBA0.proc->pathY[gUnknown_0859DBA0.proc->pathLen] = y;
    costs = GetWorkingMoveCosts();
    gUnknown_0859DBA0.proc->pathCosts[gUnknown_0859DBA0.proc->pathLen] =
        gUnknown_0859DBA0.proc->pathCosts[gUnknown_0859DBA0.proc->pathLen - 1] -
        costs[gBmMapTerrain[y][x]];
}
