#include "global.h"
#include "functions.h"
#include "bmfx.h"


void StartEventWarpAnim_ret(ProcPtr parent, s16 xCamera, s16 yCamera, s8 xWarp, s8 yWarp)
{
    StartEventWarpAnim(parent, xCamera, yCamera, xWarp, yWarp);
}

s8 EventWarpAnimExists_ret()
{
    return EventWarpAnimExists();
}

