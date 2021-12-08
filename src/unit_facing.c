#include "global.h"

#include "bmunit.h"
#include "mu.h"

void ChangeActiveUnitFacing(int xLook, int yLook) {
    int direction = GetFacingDirection(gActiveUnit->xPos, gActiveUnit->yPos, xLook, yLook)
        + MU_COMMAND_FACE_BASE;
    gWorkingMovementScript[0] = direction;
    gWorkingMovementScript[1] = MU_COMMAND_HALT;
    MU_StartMoveScript_Auto(gWorkingMovementScript);
}
