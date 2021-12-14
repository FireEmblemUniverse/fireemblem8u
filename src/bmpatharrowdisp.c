#include "global.h"

#include "bmidoten.h"
#include "bmpatharrowdisp.h"
#include "mu.h"

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

s32 GetPointAlongPath(s8 x, s8 y) {
    s8 i;
    for (i = 0; i <= gUnknown_0859DBA0.proc->pathLen; i++) {
        if (gUnknown_0859DBA0.proc->pathX[i] == x && gUnknown_0859DBA0.proc->pathY[i] == y)
            return i;
    }
    return -1;
}

void GetPathFromMovementScript(void) {
    s8 i = 0;
    while (TRUE) {
        // I do not know what these +1s are about. but they are necessary to
        // the match as far as I can tell.  maybe I'm supposed to use another
        // enum or something.
        u32 cmd = gWorkingMovementScript[i++] + 1;

        if (cmd <= 0xa) {
            switch (cmd) {

            case MU_COMMAND_END + 1:
            case MU_COMMAND_HALT + 1:
                return;
            case MU_COMMAND_FACE_LEFT + 1:
            case MU_COMMAND_FACE_RIGHT + 1:
            case MU_COMMAND_FACE_DOWN + 1:
            case MU_COMMAND_FACE_UP + 1:
            case MU_COMMAND_WAIT + 1:
                continue;
            case MU_COMMAND_MOVE_LEFT + 1:
                AddPointToPathArrowProc(
                    gUnknown_0859DBA0.proc->pathX[gUnknown_0859DBA0.proc->pathLen] - 1,
                    gUnknown_0859DBA0.proc->pathY[gUnknown_0859DBA0.proc->pathLen]);
                break;
            case MU_COMMAND_MOVE_RIGHT + 1:
                AddPointToPathArrowProc(
                    gUnknown_0859DBA0.proc->pathX[gUnknown_0859DBA0.proc->pathLen] + 1,
                    gUnknown_0859DBA0.proc->pathY[gUnknown_0859DBA0.proc->pathLen]);
                break;
            case MU_COMMAND_MOVE_UP + 1:
                AddPointToPathArrowProc(
                    gUnknown_0859DBA0.proc->pathX[gUnknown_0859DBA0.proc->pathLen],
                    gUnknown_0859DBA0.proc->pathY[gUnknown_0859DBA0.proc->pathLen] - 1);
                break;
            case MU_COMMAND_MOVE_DOWN + 1:
                AddPointToPathArrowProc(
                    gUnknown_0859DBA0.proc->pathX[gUnknown_0859DBA0.proc->pathLen],
                    gUnknown_0859DBA0.proc->pathY[gUnknown_0859DBA0.proc->pathLen] + 1);
                break;
            }
        }
    }
}
