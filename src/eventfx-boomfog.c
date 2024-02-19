#include "global.h"
#include "proc.h"
#include "bmunit.h"
#include "bmfx.h"
#include "mapanim.h"
#include "ap.h"

CONST_DATA struct ProcCmd ProcScr_BoomFogFx[] = {
    PROC_SLEEP(1),
    PROC_CALL(MapAnim_GorgonHatch_Init),
    PROC_WHILE(APProc_Exists),
    PROC_END
};

void NewBoomFogFx(struct Unit * unit)
{
    struct MAEffectProc * proc;
    proc = Proc_Start(ProcScr_BoomFogFx, PROC_TREE_3);

    proc->unit = unit;
    proc->xDisplay = 8 * (2 * SCREEN_TILE_X(unit->xPos) + 1);
    proc->yDisplay = 8 * (2 * SCREEN_TILE_Y(unit->yPos) + 1);
}

bool CheckBoomFogFxExists(void)
{
    return Proc_Find(ProcScr_BoomFogFx) ? 1 : 0;
}
