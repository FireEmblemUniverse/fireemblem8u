#include "global.h"

#include "bmidoten.h"
#include "bmmap.h"
#include "bmpatharrowdisp.h"
#include "bmunit.h"
#include "ctc.h"
#include "hardware.h"
#include "mu.h"
#include "bmlib.h"
#include "bmmind.h"
#include "variables.h"

EWRAM_DATA struct PathArrowProc gPathArrowProc = { 0 };

CONST_DATA u16 gPathArrowOAMTable[5][5] = {
    {0x3AF0, 0x3B04, 0x3B06, 0x3B00, 0x3B02},
    {0x3AF0, 0x3AF0, 0x3AF8, 0x3B0C, 0x3AFC},
    {0x3AF2, 0x3AF8, 0x3AF2, 0x3AFA, 0x3B08},
    {0x3AF4, 0x3B0E, 0x3AFA, 0x3AF4, 0x3AFE},
    {0x3AF6, 0x3AFC, 0x3B0A, 0x3AFE, 0x3AF6},
};

CONST_DATA struct PathArrowProc * gpPathArrowProc = &gPathArrowProc;

void SetLastCoords(u16 x, u16 y) {
    gpPathArrowProc->lastX = x;
    gpPathArrowProc->lastY = y;
}

#define TERRAIN_AT(x, y) gBmMapTerrain[y][x]

// I could only get a match by inlining the whole loop body into one gross line.
void CutOffPathLength(s8 newIndex) {
    if (gpPathArrowProc->pathLen >= newIndex) {
        s8 i;
        gpPathArrowProc->pathLen = newIndex - 1;
        gpPathArrowProc->pathCosts[gpPathArrowProc->pathLen] =
            gpPathArrowProc->maxMov;
        for (i = 1; i <= gpPathArrowProc->pathLen; i++) {
            u8 *costs = GetWorkingMoveCosts();
            gpPathArrowProc->pathCosts[i] =
                gpPathArrowProc->pathCosts[i - 1] -
                costs[TERRAIN_AT(
                    gpPathArrowProc->pathX[i],
                    gpPathArrowProc->pathY[i])];
        }
    }
}

void AddPointToPathArrowProc(s8 x, s8 y) {
    u8 * costs;
    gpPathArrowProc->pathLen++;
    gpPathArrowProc->pathX[gpPathArrowProc->pathLen] = x;
    gpPathArrowProc->pathY[gpPathArrowProc->pathLen] = y;
    costs = GetWorkingMoveCosts();
    gpPathArrowProc->pathCosts[gpPathArrowProc->pathLen] =
        gpPathArrowProc->pathCosts[gpPathArrowProc->pathLen - 1] -
        costs[gBmMapTerrain[y][x]];
}

s32 GetPointAlongPath(s8 x, s8 y) {
    s8 i;
    for (i = 0; i <= gpPathArrowProc->pathLen; i++) {
        if (gpPathArrowProc->pathX[i] == x && gpPathArrowProc->pathY[i] == y)
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
                    gpPathArrowProc->pathX[gpPathArrowProc->pathLen] - 1,
                    gpPathArrowProc->pathY[gpPathArrowProc->pathLen]);
                break;
            case MU_COMMAND_MOVE_RIGHT + 1:
                AddPointToPathArrowProc(
                    gpPathArrowProc->pathX[gpPathArrowProc->pathLen] + 1,
                    gpPathArrowProc->pathY[gpPathArrowProc->pathLen]);
                break;
            case MU_COMMAND_MOVE_UP + 1:
                AddPointToPathArrowProc(
                    gpPathArrowProc->pathX[gpPathArrowProc->pathLen],
                    gpPathArrowProc->pathY[gpPathArrowProc->pathLen] - 1);
                break;
            case MU_COMMAND_MOVE_DOWN + 1:
                AddPointToPathArrowProc(
                    gpPathArrowProc->pathX[gpPathArrowProc->pathLen],
                    gpPathArrowProc->pathY[gpPathArrowProc->pathLen] + 1);
                break;
            }
        }
    }
}

void GetMovementScriptFromPath(void) {
    s8 i;
    for (i = 1; i <= gpPathArrowProc->pathLen; i++)
    {
        s8 x, y;
        s8 newX, newY;
        u8 result;


        newX = gpPathArrowProc->pathX[i];
        x = gpPathArrowProc->pathX[i - 1];
        if (newX < x) {
            gWorkingMovementScript[i - 1] = MU_COMMAND_MOVE_LEFT;
        }
        else if (newX > x) {
            gWorkingMovementScript[i - 1] = MU_COMMAND_MOVE_RIGHT;
        }

        else if (gpPathArrowProc->pathY[i] < gpPathArrowProc->pathY[i - 1]) {
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
		gpPathArrowProc->pathX[gpPathArrowProc->pathLen],
		gpPathArrowProc->pathY[gpPathArrowProc->pathLen],
		gpPathArrowProc->pathCosts[gpPathArrowProc->pathLen]);
}

void ResetPathArrow(void) {
    CutOffPathLength(1);
    GenerateMovementMapForActiveUnit();
    GenerateBestMovementScript(
        gBmSt.playerCursor.x,
        gBmSt.playerCursor.y,
        gWorkingMovementScript);
    GetPathFromMovementScript();
}

bool8 PathContainsNoCycle(void) {
    s8 i, j;
    for (i = gpPathArrowProc->pathLen; i > 0; --i) {
        for (j = i - 1; j >= 0; --j) {
            if (gpPathArrowProc->pathX[i] == gpPathArrowProc->pathX[j] &&
                gpPathArrowProc->pathY[i] == gpPathArrowProc->pathY[j])
            {
                return 0;
            }
        }
    }

    return 1;
}

void PathArrowDisp_Init(u8 a) {
    Decompress(gUnknown_08A03054, (void *) OBJ_VRAM0 + 0x5E00);
    ApplyPalette(gUnknown_08A0328C, 0x13);
    if (a == 0) {
        gpPathArrowProc->maxMov =
            gActiveUnit->movBonus + gActiveUnit->pClassData->baseMov - gActionData.moveCount;
        CutOffPathLength(0);
        AddPointToPathArrowProc(gActiveUnit->xPos, gActiveUnit->yPos);
        gpPathArrowProc->pathCosts[0] = gpPathArrowProc->maxMov;
        // This seems strange. But passing -1 to a signed argument doesn't seem to match
        SetLastCoords(0xFFFF, 0xFFFF);
        UpdatePathArrowWithCursor();
    }
}

static inline s8 GetBmMapPointAtCursor() {
    return gWorkingBmMap[gBmSt.playerCursor.y][gBmSt.playerCursor.x];
}

static inline u8 GetTerrainAtCursor() {
    return TERRAIN_AT(gBmSt.playerCursor.x, gBmSt.playerCursor.y);
}

#define LAST_X_POINT gpPathArrowProc->pathX[gpPathArrowProc->pathLen]
#define LAST_Y_POINT gpPathArrowProc->pathY[gpPathArrowProc->pathLen]

#define abs(n) (((n) >= 0) ? (n) : -(n))

void UpdatePathArrowWithCursor(void) {
    s8 point;
    s32 pointAlias;

    if (gpPathArrowProc->lastX == gBmSt.playerCursor.x &&
        gpPathArrowProc->lastY == gBmSt.playerCursor.y)
    {
        return;
    }
    SetLastCoords(gBmSt.playerCursor.x, gBmSt.playerCursor.y);
    SetWorkingBmMap(gBmMapMovement);
    if (GetBmMapPointAtCursor() == -1)
        return;
    pointAlias = point = GetPointAlongPath(
        gBmSt.playerCursor.x, gBmSt.playerCursor.y);
    if (pointAlias != -1) {
        ++point;
        CutOffPathLength(point);
        return;
    }
    if (gpPathArrowProc->pathCosts[gpPathArrowProc->pathLen] >=
        GetWorkingMoveCosts()[GetTerrainAtCursor()])
    {
        if (abs(LAST_X_POINT - gBmSt.playerCursor.x) +
            abs(LAST_Y_POINT - gBmSt.playerCursor.y) == 1)
        {
            AddPointToPathArrowProc(
                gBmSt.playerCursor.x, gBmSt.playerCursor.y);
            return;
        }
    }
    if (gpPathArrowProc->pathCosts[gpPathArrowProc->pathLen] == 0)
        CutOffPathLength(1);
    SetWorkingBmMap(gBmMapOther);
    GenerateMovementMapForActiveUnit();
    if (GetBmMapPointAtCursor() == -1) {
        ResetPathArrow();
        return;
    }
    GenerateBestMovementScript(
        gBmSt.playerCursor.x,
        gBmSt.playerCursor.y,
        gWorkingMovementScript);
    GetPathFromMovementScript();
    if (!PathContainsNoCycle())
        ResetPathArrow();
}

u8 GetDirectionOfPathBeforeIndex(u8 i) {
    if (i == 0)
        return 0;
    if (gpPathArrowProc->pathX[i - 1] < gpPathArrowProc->pathX[i])
        return 3;
    if (gpPathArrowProc->pathX[i - 1] > gpPathArrowProc->pathX[i])
        return 1;
    if (gpPathArrowProc->pathY[i - 1] < gpPathArrowProc->pathY[i])
        return 4;
    if (gpPathArrowProc->pathY[i - 1] > gpPathArrowProc->pathY[i])
        return 2;
}

u8 GetDirectionOfPathAfterIndex(u8 i) {
    if (i == gpPathArrowProc->pathLen)
        return 0;
    if (gpPathArrowProc->pathX[i] < gpPathArrowProc->pathX[i + 1])
        return 1;
    if (gpPathArrowProc->pathX[i] > gpPathArrowProc->pathX[i + 1])
        return 3;
    if (gpPathArrowProc->pathY[i] < gpPathArrowProc->pathY[i + 1])
        return 2;
    if (gpPathArrowProc->pathY[i] > gpPathArrowProc->pathY[i + 1])
        return 4;
}

u8 PointInCameraBounds(s16 x, s16 y, u8 xBound, u8 yBound) {
    if (y - gBmSt.camera.y > -yBound &&
		y - gBmSt.camera.y <= 0x9f &&
		x - gBmSt.camera.x > -xBound &&
		x - gBmSt.camera.x <= 0xef)
	{
		return 1;
	}
    return 0;
}

#define PATH_ARROW_OAM_AT(a, b) gPathArrowOAMTable[a][b];

void DrawPathArrow(void) {
    s8 i;
    if (gpPathArrowProc->pathLen == 0)
        return;
    for (i = gpPathArrowProc->pathLen; i >= 0; i--) {
        s16 xp = 16 * gpPathArrowProc->pathX[i];
        s16 yp = 16 * gpPathArrowProc->pathY[i];
        if (PointInCameraBounds(xp, yp, 16, 16)) {
            u16 oam2 = PATH_ARROW_OAM_AT(
                GetDirectionOfPathAfterIndex(i),
                GetDirectionOfPathBeforeIndex(i));
            PutSprite(
                11,
                xp - gBmSt.camera.x,
                yp - gBmSt.camera.y,
                gObject_16x16,
                oam2);
        }
    }
}

void DrawUpdatedPathArrow(void) {
    UpdatePathArrowWithCursor();
    DrawPathArrow();
}
