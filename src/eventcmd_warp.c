#include "global.h"
#include "functions.h"
#include "bmfx.h"


void StartEventWarpAnim_ret(ProcPtr parent, s16 x, s16 y, s8 subcmd, s8 flag)
{
    StartEventWarpAnim(parent, x, y, subcmd, flag);
}

s8 EventWarpAnimExists_ret()
{
    return EventWarpAnimExists();
}

