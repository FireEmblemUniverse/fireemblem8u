#include "global.h"
#include "bmunit.h"
#include "proc.h"
#include "ctc.h"
#include "variables.h"
#include "functions.h"

/**
 * Unit Swapping Animation/Effect (When you swap unit places in the prep screen)
 */

struct PrepUnitSwapProc {
    PROC_HEADER;

    /* 2C */ struct Unit *unit;
    /* 30 */ s16 x_tile_cur;
    /* 32 */ s16 y_tile_cur;
    /* 34 */ s16 x_tile_dest;
    /* 36 */ s16 y_tile_dest;

    /* 38 */ u8 _pad_38[0x3C - 0x38];

    /* 3C */ s16 counter;
    /* 3E */ s16 counter_max;

    /* 40 */ u8 _pad_40[0x44 - 0x40];

    /* 44 */ int divisor;
};

static void PrepUnitSwapProc_Init(struct PrepUnitSwapProc *proc);
static void PrepUnitSwapProc_MainLoop(struct PrepUnitSwapProc *proc);
static void PrepUnitSwapProc_OnEnd(struct PrepUnitSwapProc *proc);


/* secton.data */

struct ProcCmd CONST_DATA sProcScr_PrepUnitSwap[] = {
    PROC_YIELD,
    PROC_CALL(PrepUnitSwapProc_Init),
    PROC_REPEAT(PrepUnitSwapProc_MainLoop),
    PROC_CALL(PrepUnitSwapProc_OnEnd),
    PROC_END,
};


/* section.text */

void PrepUnitSwapProc_Init(struct PrepUnitSwapProc *proc)
{
    u16 _sqrt;
    int tmp0, tmp1;

    proc->x_tile_cur = proc->unit->xPos * 0x10;
    proc->y_tile_cur = proc->unit->yPos * 0x10;

    tmp0 = proc->x_tile_dest - proc->x_tile_cur;
    tmp1 = proc->y_tile_dest - proc->y_tile_cur;

    _sqrt = Sqrt(tmp0 * tmp0 + tmp1 * tmp1);

    proc->divisor = Interpolate(0, 0x1000, 0x20000, _sqrt, 0x200);
    proc->counter_max = Interpolate(0, 0x000C, 0x00030, _sqrt, 0x200);
    proc->counter = 0;
}

void PrepUnitSwapProc_MainLoop(struct PrepUnitSwapProc *proc)
{
    int val0 = Interpolate(0, 0, 0x10000, proc->counter, proc->counter_max);

    int xd = proc->x_tile_dest - proc->x_tile_cur;
    int yd = proc->y_tile_dest - proc->y_tile_cur;

    int x_tmp = xd * SIN(val0 >> 9) / proc->divisor;
    int y_tmp = yd * SIN(val0 >> 9) / proc->divisor;

    u32 x = ((xd * val0) >> 0x10) + y_tmp;
    u32 y = ((yd * val0) >> 0x10) - x_tmp;

    x = x + proc->x_tile_cur - gGameState.camera.x;
    y = y + proc->y_tile_cur - gGameState.camera.y;

    if (((x + 0x10) <= 0x100) && ((y + 0x20) <= 0xC0)) {
        PutSprite(4, x, y - 0xC, gObject_16x16, 6);
        PutUnitSprite(4, x, y, proc->unit);
    }

    if (++proc->counter > proc->counter_max)
        Proc_Break(proc);
}

void PrepUnitSwapProc_OnEnd(struct PrepUnitSwapProc *proc)
{   
    proc->unit->xPos = proc->x_tile_dest / 16;
    proc->unit->yPos = proc->y_tile_dest / 16;
}

void StartPrepUnitSwap(ProcPtr parent, struct Unit *unit, int x_dest, int y_dest)
{
    struct PrepUnitSwapProc *proc = Proc_Start(sProcScr_PrepUnitSwap, parent);

    proc->unit = unit;
    proc->x_tile_dest = x_dest * 16;
    proc->y_tile_dest = y_dest * 16;

    HideUnitSMS(unit);
}

int PrepUnitSwapProcExits()
{
    if (Proc_Find(sProcScr_PrepUnitSwap))
        return 1;
    else
        return 0;
}
