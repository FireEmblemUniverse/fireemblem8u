#include "global.h"

#include "bmidoten.h"
#include "bmmap.h"
#include "bmpatharrowdisp.h"
#include "bmunit.h"
#include "ctc.h"
#include "hardware.h"
#include "mu.h"
#include "variables.h"

void SetLastCoords(u16 x, u16 y) {
    gUnknown_0859DBA0.proc->lastX = x;
    gUnknown_0859DBA0.proc->lastY = y;
}

#define TERRAIN_AT(x, y) gBmMapTerrain[y][x]

// I could only get a match by inlining the whole loop body into one gross line.
void CutOffPathLength(s8 newIndex) {
    if (gUnknown_0859DBA0.proc->pathLen >= newIndex) {
        s8 i;
        gUnknown_0859DBA0.proc->pathLen = newIndex - 1;
        gUnknown_0859DBA0.proc->pathCosts[gUnknown_0859DBA0.proc->pathLen] =
            gUnknown_0859DBA0.proc->maxMov;
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

void GetMovementScriptFromPath(void) {
    s8 i;
    for (i = 1; i <= gUnknown_0859DBA0.proc->pathLen; i++)
    {
        s8 x, y;
        s8 newX, newY;
        u8 result;


        newX = gUnknown_0859DBA0.proc->pathX[i];
        x = gUnknown_0859DBA0.proc->pathX[i - 1];
        if (newX < x) {
            gWorkingMovementScript[i - 1] = MU_COMMAND_MOVE_LEFT;
        }
        else if (newX > x) {
            gWorkingMovementScript[i - 1] = MU_COMMAND_MOVE_RIGHT;
        }

        else if (gUnknown_0859DBA0.proc->pathY[i] < gUnknown_0859DBA0.proc->pathY[i - 1]) {
            gWorkingMovementScript[i - 1] = MU_COMMAND_MOVE_UP;
        }
        else {
            gWorkingMovementScript[i - 1] = MU_COMMAND_MOVE_DOWN;
        }
    }
    gWorkingMovementScript[i - 1] = MU_COMMAND_HALT;
}

void GenerateMovementMapForActiveUnit(void) {
    GenerateMovementMapOnWorkingMap(
		gActiveUnit,
		gUnknown_0859DBA0.proc->pathX[gUnknown_0859DBA0.proc->pathLen],
		gUnknown_0859DBA0.proc->pathY[gUnknown_0859DBA0.proc->pathLen],
		gUnknown_0859DBA0.proc->pathCosts[gUnknown_0859DBA0.proc->pathLen]);
}

void ResetPathArrow(void) {
    CutOffPathLength(1);
    GenerateMovementMapForActiveUnit();
    GenerateBestMovementScript(
        gUnknown_0202BCB0.playerCursor.x,
        gUnknown_0202BCB0.playerCursor.y,
        gWorkingMovementScript);
    GetPathFromMovementScript();
}

bool8 PathContainsNoCycle(void) {
    s8 i, j;
    for (i = gUnknown_0859DBA0.proc->pathLen; i > 0; --i) {
        for (j = i - 1; j >= 0; --j) {
            if (gUnknown_0859DBA0.proc->pathX[i] == gUnknown_0859DBA0.proc->pathX[j] &&
                gUnknown_0859DBA0.proc->pathY[i] == gUnknown_0859DBA0.proc->pathY[j])
            {
                return 0;
            }
        }
    }

    return 1;
}

void PathArrowDisp_Init(u8 a) {
    CopyDataWithPossibleUncomp(gUnknown_08A03054, (void *) OBJ_VRAM0 + 0x5E00);
    CopyToPaletteBuffer(gUnknown_08A0328C, 0x98 * 4, 0x20);
    if (a == 0) {
        gUnknown_0859DBA0.proc->maxMov =
            gActiveUnit->movBonus + gActiveUnit->pClassData->baseMov - gActionData.moveCount;
        CutOffPathLength(0);
        AddPointToPathArrowProc(gActiveUnit->xPos, gActiveUnit->yPos);
        gUnknown_0859DBA0.proc->pathCosts[0] = gUnknown_0859DBA0.proc->maxMov;
        // This seems strange. But passing -1 to a signed argument doesn't seem to match
        SetLastCoords(0xFFFF, 0xFFFF);
        UpdatePathArrowWithCursor();
    }
}

static inline s8 GetBmMapPointAtCursor() {
    return gWorkingBmMap[gUnknown_0202BCB0.playerCursor.y][gUnknown_0202BCB0.playerCursor.x];
}

static inline u8 GetTerrainAtCursor() {
    return TERRAIN_AT(gUnknown_0202BCB0.playerCursor.x, gUnknown_0202BCB0.playerCursor.y);
}

#define LAST_X_POINT gUnknown_0859DBA0.proc->pathX[gUnknown_0859DBA0.proc->pathLen]
#define LAST_Y_POINT gUnknown_0859DBA0.proc->pathY[gUnknown_0859DBA0.proc->pathLen]

#define abs(n) (((n) >= 0) ? (n) : -(n))

void UpdatePathArrowWithCursor(void) {
    s8 point;
    s32 pointAlias;

    if (gUnknown_0859DBA0.proc->lastX == gUnknown_0202BCB0.playerCursor.x &&
        gUnknown_0859DBA0.proc->lastY == gUnknown_0202BCB0.playerCursor.y)
    {
        return;
    }
    SetLastCoords(gUnknown_0202BCB0.playerCursor.x, gUnknown_0202BCB0.playerCursor.y);
    SetWorkingBmMap(gBmMapMovement);
    if (GetBmMapPointAtCursor() == -1)
        return;
    pointAlias = point = GetPointAlongPath(
        gUnknown_0202BCB0.playerCursor.x, gUnknown_0202BCB0.playerCursor.y);
    if (pointAlias != -1) {
        ++point;
        CutOffPathLength(point);
        return;
    }
    if (gUnknown_0859DBA0.proc->pathCosts[gUnknown_0859DBA0.proc->pathLen] >=
        GetWorkingMoveCosts()[GetTerrainAtCursor()])
    {
        if (abs(LAST_X_POINT - gUnknown_0202BCB0.playerCursor.x) +
            abs(LAST_Y_POINT - gUnknown_0202BCB0.playerCursor.y) == 1)
        {
            AddPointToPathArrowProc(
                gUnknown_0202BCB0.playerCursor.x, gUnknown_0202BCB0.playerCursor.y);
            return;
        }
    }
    if (gUnknown_0859DBA0.proc->pathCosts[gUnknown_0859DBA0.proc->pathLen] == 0)
        CutOffPathLength(1);
    SetWorkingBmMap(gBmMapOther);
    GenerateMovementMapForActiveUnit();
    if (GetBmMapPointAtCursor() == -1) {
        ResetPathArrow();
        return;
    }
    GenerateBestMovementScript(
        gUnknown_0202BCB0.playerCursor.x,
        gUnknown_0202BCB0.playerCursor.y,
        gWorkingMovementScript);
    GetPathFromMovementScript();
    if (!PathContainsNoCycle())
        ResetPathArrow();
}

u8 GetDirectionOfPathBeforeIndex(u8 i) {
    if (i == 0)
        return 0;
    if (gUnknown_0859DBA0.proc->pathX[i - 1] < gUnknown_0859DBA0.proc->pathX[i])
        return 3;
    if (gUnknown_0859DBA0.proc->pathX[i - 1] > gUnknown_0859DBA0.proc->pathX[i])
        return 1;
    if (gUnknown_0859DBA0.proc->pathY[i - 1] < gUnknown_0859DBA0.proc->pathY[i])
        return 4;
    if (gUnknown_0859DBA0.proc->pathY[i - 1] > gUnknown_0859DBA0.proc->pathY[i])
        return 2;
}

u8 GetDirectionOfPathAfterIndex(u8 i) {
    if (i == gUnknown_0859DBA0.proc->pathLen)
        return 0;
    if (gUnknown_0859DBA0.proc->pathX[i] < gUnknown_0859DBA0.proc->pathX[i + 1])
        return 1;
    if (gUnknown_0859DBA0.proc->pathX[i] > gUnknown_0859DBA0.proc->pathX[i + 1])
        return 3;
    if (gUnknown_0859DBA0.proc->pathY[i] < gUnknown_0859DBA0.proc->pathY[i + 1])
        return 2;
    if (gUnknown_0859DBA0.proc->pathY[i] > gUnknown_0859DBA0.proc->pathY[i + 1])
        return 4;
}

u8 PointInCameraBounds(s16 x, s16 y, u8 xBound, u8 yBound) {
    if (y - gUnknown_0202BCB0.camera.y > -yBound &&
		y - gUnknown_0202BCB0.camera.y <= 0x9f &&
		x - gUnknown_0202BCB0.camera.x > -xBound &&
		x - gUnknown_0202BCB0.camera.x <= 0xef)
	{
		return 1;
	}
    return 0;
}

#define PATH_ARROW_OAM_AT(a, b) gPathArrowOAMTable[a][b];

void DrawPathArrow(void) {
    s8 i;
    if (gUnknown_0859DBA0.proc->pathLen == 0)
        return;
    for (i = gUnknown_0859DBA0.proc->pathLen; i >= 0; i--) {
        s16 xp = 16 * gUnknown_0859DBA0.proc->pathX[i];
        s16 yp = 16 * gUnknown_0859DBA0.proc->pathY[i];
        if (PointInCameraBounds(xp, yp, 16, 16)) {
            u16 oam2 = PATH_ARROW_OAM_AT(
                GetDirectionOfPathAfterIndex(i),
                GetDirectionOfPathBeforeIndex(i));
            PutSprite(
                11,
                xp - gUnknown_0202BCB0.camera.x,
                yp - gUnknown_0202BCB0.camera.y,
                gObject_16x16,
                oam2);
        }
    }
}

void DrawUpdatedPathArrow(void) {
    UpdatePathArrowWithCursor();
    DrawPathArrow();
}
