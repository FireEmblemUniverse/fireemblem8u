#include "global.h"

#include "bmidoten.h"
#include "bmpatharrowdisp.h"
#include "bmunit.h"
#include "hardware.h"
#include "mu.h"

void sub_80329D8(u16 a, u16 b) {
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

void sub_8032D74(void) {
    sub_80329EC(1);
    GenerateMovementMapForActiveUnit();
    GenerateBestMovementScript(
            gUnknown_0202BCB0.playerCursor.x, gUnknown_0202BCB0.playerCursor.y, gWorkingMovementScript);
    GetPathFromMovementScript();
}

u32 PathContainsNoCycle(void) {
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

// Initializes some PathArrowProc stuff
void sub_8032E28(u8 a) {
    CopyDataWithPossibleUncomp(gUnknown_08A03054, (void *) OBJ_VRAM0 + 0x5E00);
    CopyToPaletteBuffer(gUnknown_08A0328C, 0x98 * 4, 0x20);
    if (a == 0) {
        gUnknown_0859DBA0.proc->maxMov =
            gActiveUnit->movBonus + gActiveUnit->pClassData->baseMov - gActionData.moveCount;
        sub_80329EC(0);
        AddPointToPathArrowProc(gActiveUnit->xPos, gActiveUnit->yPos);
        gUnknown_0859DBA0.proc->pathCosts[0] = gUnknown_0859DBA0.proc->maxMov;
        // This seems strange. But passing -1 to a signed argument doesn't seem to match
        sub_80329D8(0xFFFF, 0xFFFF);
        sub_8032EB4();
    }
}

#ifdef NONMATCHING

extern u8 **gBmMapMovement;
extern u8 **gBmMapUnk;

void sub_8032EB4(void) {
    u8 * costs;
    u8 terrain;
    s8 point;

    if (gUnknown_0859DBA0.proc->u29 == gUnknown_0202BCB0.playerCursor.x && gUnknown_0859DBA0.proc->u2a == gUnknown_0202BCB0.playerCursor.y) return;
    sub_80329D8(gUnknown_0202BCB0.playerCursor.x, gUnknown_0202BCB0.playerCursor.y);
    SetWorkingBmMap(gBmMapMovement);
    if ((s8) gWorkingBmMap[gUnknown_0202BCB0.playerCursor.y][gUnknown_0202BCB0.playerCursor.x] == -1) return;
    point = GetPointAlongPath(gUnknown_0202BCB0.playerCursor.x, gUnknown_0202BCB0.playerCursor.y);
    if (point != -1) {
        sub_80329EC(point + 1);
        return;
    }
    //terrain = gBmMapTerrain[gUnknown_0202BCB0.playerCursor.y][gUnknown_0202BCB0.playerCursor.x];
    if (gUnknown_0859DBA0.proc->pathCosts[gUnknown_0859DBA0.proc->pathLen] >= GetWorkingMoveCosts()[gBmMapTerrain[gUnknown_0202BCB0.playerCursor.y][gUnknown_0202BCB0.playerCursor.x]]) {
        s32 distX, distY;
        //s8 pathLen = gUnknown_0859DBA0.proc->pathLen;
        distX = gUnknown_0859DBA0.proc->pathX[gUnknown_0859DBA0.proc->pathLen] - gUnknown_0202BCB0.playerCursor.x;
        if (distX < 0)
            distX = gUnknown_0202BCB0.playerCursor.x - gUnknown_0859DBA0.proc->pathX[gUnknown_0859DBA0.proc->pathLen];
        distY = gUnknown_0859DBA0.proc->pathY[gUnknown_0859DBA0.proc->pathLen] - gUnknown_0202BCB0.playerCursor.y;
        if (distY < 0)
            distY = gUnknown_0202BCB0.playerCursor.y - gUnknown_0859DBA0.proc->pathY[gUnknown_0859DBA0.proc->pathLen];
        if (distX + distY == 1) {
            AddPointToPathArrowProc(gUnknown_0202BCB0.playerCursor.x, gUnknown_0202BCB0.playerCursor.y);
            return;
        }
    }
    if (gUnknown_0859DBA0.proc->pathCosts[gUnknown_0859DBA0.proc->pathLen] == 0)
        sub_80329EC(1);
    SetWorkingBmMap(gBmMapUnk);
    GenerateMovementMapForActiveUnit();
    if (((s8) gWorkingBmMap[gUnknown_0202BCB0.playerCursor.y][gUnknown_0202BCB0.playerCursor.x]) == -1) {
        sub_8032D74();
        return;
    }
    GenerateBestMovementScript(gUnknown_0202BCB0.playerCursor.x, gUnknown_0202BCB0.playerCursor.y, gWorkingMovementScript);
    GetPathFromMovementScript();
    if (PathContainsNoCycle() == 0)
        sub_8032D74();
}

#else // NONMATCHING

__attribute__((naked))
void sub_8032EB4(void) {
	asm("\n\
        .syntax unified\n\
		push {r4, r5, r6, r7, lr}\n\
		ldr r7, _08032F38  @ gUnknown_0859DBA0\n\
		ldr r2, [r7]\n\
		adds r0, r2, #0\n\
		adds r0, #0x29\n\
		ldr r5, _08032F3C  @ gUnknown_0202BCB0\n\
		movs r1, #0\n\
		ldrsb r1, [r0, r1]\n\
		movs r3, #0x14\n\
		ldrsh r0, [r5, r3]\n\
		cmp r1, r0\n\
		bne _08032EDE\n\
		adds r0, r2, #0\n\
		adds r0, #0x2a\n\
		movs r1, #0\n\
		ldrsb r1, [r0, r1]\n\
		movs r2, #0x16\n\
		ldrsh r0, [r5, r2]\n\
		cmp r1, r0\n\
		bne _08032EDE\n\
		b _08033060\n\
	_08032EDE:\n\
		ldrh r0, [r5, #0x14]\n\
		ldrh r1, [r5, #0x16]\n\
		bl sub_80329D8\n\
		ldr r0, _08032F40  @ gBmMapMovement\n\
		ldr r0, [r0]\n\
		bl SetWorkingBmMap\n\
		movs r3, #0x16\n\
		ldrsh r0, [r5, r3]\n\
		ldr r1, _08032F44  @ gWorkingBmMap\n\
		ldr r1, [r1]\n\
		lsls r0, r0, #2\n\
		adds r0, r0, r1\n\
		movs r2, #0x14\n\
		ldrsh r1, [r5, r2]\n\
		ldr r0, [r0]\n\
		adds r0, r0, r1\n\
		ldrb r0, [r0]\n\
		lsls r0, r0, #0x18\n\
		asrs r0, r0, #0x18\n\
		movs r4, #1\n\
		negs r4, r4\n\
		cmp r0, r4\n\
		bne _08032F12\n\
		b _08033060\n\
	_08032F12:\n\
		movs r0, #0x14\n\
		ldrsb r0, [r5, r0]\n\
		movs r1, #0x16\n\
		ldrsb r1, [r5, r1]\n\
		bl GetPointAlongPath\n\
		lsls r0, r0, #0x18\n\
		lsrs r1, r0, #0x18\n\
		asrs r0, r0, #0x18\n\
		cmp r0, r4\n\
		beq _08032F48\n\
		lsls r0, r1, #0x18\n\
		movs r3, #0x80\n\
		lsls r3, r3, #0x11\n\
		adds r0, r0, r3\n\
		asrs r0, r0, #0x18\n\
		bl sub_80329EC\n\
		b _08033060\n\
		.align 2, 0\n\
	_08032F38: .4byte gUnknown_0859DBA0\n\
	_08032F3C: .4byte gUnknown_0202BCB0\n\
	_08032F40: .4byte gBmMapMovement\n\
	_08032F44: .4byte gWorkingBmMap\n\
	_08032F48:\n\
		ldr r4, [r7]\n\
		adds r0, r4, #0\n\
		adds r0, #0x2c\n\
		ldrb r0, [r0]\n\
		lsls r0, r0, #0x18\n\
		asrs r0, r0, #0x18\n\
		adds r4, #0x55\n\
		adds r4, r4, r0\n\
		bl GetWorkingMoveCosts\n\
		movs r1, #0x16\n\
		ldrsh r6, [r5, r1]\n\
		ldr r1, _08032FB8  @ gBmMapTerrain\n\
		ldr r2, [r1]\n\
		lsls r1, r6, #2\n\
		adds r1, r1, r2\n\
		movs r2, #0x14\n\
		ldrsh r3, [r5, r2]\n\
		ldr r1, [r1]\n\
		adds r1, r1, r3\n\
		ldrb r1, [r1]\n\
		adds r0, r0, r1\n\
		movs r1, #0\n\
		ldrsb r1, [r4, r1]\n\
		ldrb r0, [r0]\n\
		lsls r0, r0, #0x18\n\
		asrs r0, r0, #0x18\n\
		cmp r1, r0\n\
		blt _08032FDC\n\
		ldr r4, [r7]\n\
		adds r0, r4, #0\n\
		adds r0, #0x2c\n\
		movs r1, #0\n\
		ldrsb r1, [r0, r1]\n\
		adds r0, #1\n\
		adds r0, r0, r1\n\
		ldrb r0, [r0]\n\
		lsls r0, r0, #0x18\n\
		asrs r0, r0, #0x18\n\
		subs r2, r0, r3\n\
		cmp r2, #0\n\
		bge _08032F9E\n\
		subs r2, r3, r0\n\
	_08032F9E:\n\
		adds r0, r4, #0\n\
		adds r0, #0x41\n\
		adds r0, r0, r1\n\
		movs r1, #0\n\
		ldrsb r1, [r0, r1]\n\
		subs r0, r1, r6\n\
		cmp r0, #0\n\
		blt _08032FBC\n\
		adds r0, r2, r0\n\
		cmp r0, #1\n\
		beq _08032FC4\n\
		b _08032FDC\n\
		.align 2, 0\n\
	_08032FB8: .4byte gBmMapTerrain\n\
	_08032FBC:\n\
		subs r0, r6, r1\n\
		adds r0, r2, r0\n\
		cmp r0, #1\n\
		bne _08032FDC\n\
	_08032FC4:\n\
		ldr r1, _08032FD8  @ gUnknown_0202BCB0\n\
		movs r0, #0x14\n\
		ldrsb r0, [r1, r0]\n\
		ldrb r1, [r1, #0x16]\n\
		lsls r1, r1, #0x18\n\
		asrs r1, r1, #0x18\n\
		bl AddPointToPathArrowProc\n\
		b _08033060\n\
		.align 2, 0\n\
	_08032FD8: .4byte gUnknown_0202BCB0\n\
	_08032FDC:\n\
		ldr r0, _08033034  @ gUnknown_0859DBA0\n\
		ldr r0, [r0]\n\
		adds r1, r0, #0\n\
		adds r1, #0x2c\n\
		ldrb r1, [r1]\n\
		lsls r1, r1, #0x18\n\
		asrs r1, r1, #0x18\n\
		adds r0, #0x55\n\
		adds r0, r0, r1\n\
		ldrb r0, [r0]\n\
		lsls r0, r0, #0x18\n\
		asrs r0, r0, #0x18\n\
		cmp r0, #0\n\
		bne _08032FFE\n\
		movs r0, #1\n\
		bl sub_80329EC\n\
	_08032FFE:\n\
		ldr r0, _08033038  @ gBmMapUnk\n\
		ldr r0, [r0]\n\
		bl SetWorkingBmMap\n\
		bl GenerateMovementMapForActiveUnit\n\
		ldr r2, _0803303C  @ gUnknown_0202BCB0\n\
		movs r3, #0x16\n\
		ldrsh r4, [r2, r3]\n\
		ldr r0, _08033040  @ gWorkingBmMap\n\
		ldr r1, [r0]\n\
		lsls r0, r4, #2\n\
		adds r0, r0, r1\n\
		movs r1, #0x14\n\
		ldrsh r3, [r2, r1]\n\
		ldr r0, [r0]\n\
		adds r0, r0, r3\n\
		movs r1, #0\n\
		ldrsb r1, [r0, r1]\n\
		movs r0, #1\n\
		negs r0, r0\n\
		cmp r1, r0\n\
		bne _08033044\n\
		bl sub_8032D74\n\
		b _08033060\n\
		.align 2, 0\n\
	_08033034: .4byte gUnknown_0859DBA0\n\
	_08033038: .4byte gBmMapUnk\n\
	_0803303C: .4byte gUnknown_0202BCB0\n\
	_08033040: .4byte gWorkingBmMap\n\
	_08033044:\n\
		ldr r2, _08033068  @ gWorkingMovementScript\n\
		adds r0, r3, #0\n\
		adds r1, r4, #0\n\
		bl GenerateBestMovementScript\n\
		bl GetPathFromMovementScript\n\
		bl PathContainsNoCycle\n\
		lsls r0, r0, #0x18\n\
		cmp r0, #0\n\
		bne _08033060\n\
		bl sub_8032D74\n\
	_08033060:\n\
		pop {r4, r5, r6, r7}\n\
		pop {r0}\n\
		bx r0\n\
		.align 2, 0\n\
	_08033068: .4byte gWorkingMovementScript\n\
		.syntax divided\n\
	");
}

#endif // NONMATCHING
