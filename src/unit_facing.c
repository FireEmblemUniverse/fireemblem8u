#include "global.h"
#include "mapanim.h"
#include "bmunit.h"
#include "mu.h"

void ChangeActiveUnitFacing(int xLook, int yLook) {
    int direction = GetFacingDirection(gActiveUnit->xPos, gActiveUnit->yPos, xLook, yLook)
        + MOVE_CMD_FACE_BASE;
    gWorkingMovementScript[0] = direction;
    gWorkingMovementScript[1] = MOVE_CMD_HALT;
    SetAutoMuMoveScript(gWorkingMovementScript);
}
