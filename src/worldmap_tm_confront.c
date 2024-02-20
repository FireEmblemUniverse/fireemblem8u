#include "global.h"

#include "soundwrapper.h"
#include "m4a.h"
#include "spline.h"
#include "bmlib.h"
#include "ap.h"

#include "worldmap.h"

struct GmapTmConfrontProc
{
    /* 00 */ PROC_HEADER;
    /* 2A */ u16 unk_2a;
    /* 2C */ u16 unk_2c;
    /* 2E */ u8 unk_2e[2];
    /* 30 */ struct Vec2 unk_30[2];
    /* 38 */ struct Vec2 unk_38[2];
    /* 42 */ struct Vec2 unk_40[2];
    /* 48 */ void * unk_48;
};

//! FE8U = 0x080C0548
void GmTmConfront_OnEnd(void)
{
    return;
}

//! FE8U = 0x080C054C
void GmTmConfront_LoadPositions(struct GmapTmConfrontProc * proc, const struct Vec2 * posArray)
{
    int i;

    for (i = 0; i < 2; i++)
    {
        GmMu_GetPosition(GM_MU, proc->unk_2e[i], &proc->unk_30[i].x, &proc->unk_30[i].y);
        proc->unk_40[i].x = posArray[i].x;
        proc->unk_40[i].y = posArray[i].y;
        proc->unk_38[i].x = proc->unk_30[i].x + posArray[i].x;
        proc->unk_38[i].y = proc->unk_30[i].y + posArray[i].y;
    }

    proc->unk_2a = 0;

    return;
}

// clang-format off

const struct Vec2 gWmSkirmish_PositionsA[] =
{
    { -11, 0, },
    { +11, 0, },
};

// clang-format on

//! FE8U = 0x080C05AC
void GmTmConfront_InitUnitPositionA(struct GmapTmConfrontProc * proc)
{
    GmTmConfront_LoadPositions(proc, gWmSkirmish_PositionsA);
    proc->unk_2c = 16;
    return;
}

// clang-format off

const struct Vec2 gWmSkirmish_PositionsB[] =
{
    { +3, 0, },
    { -3, 0, },
};

// clang-format on

//! FE8U = 0x080C05C4
void GmTmConfront_InitUnitPositionB(struct GmapTmConfrontProc * proc)
{
    GmTmConfront_LoadPositions(proc, gWmSkirmish_PositionsB);
    proc->unk_2c = 5;
    PlaySoundEffect(0x313);
    return;
}

// clang-format off

const struct Vec2 gWmSkirmish_PositionsC[] =
{
    { -2, 0, },
    { +2, 0, },
};

// clang-format on

//! FE8U = 0x080C05F8
void GmTmConfront_InitUnitPositionC(struct GmapTmConfrontProc * proc)
{
    GmTmConfront_LoadPositions(proc, gWmSkirmish_PositionsC);
    proc->unk_2c = 5;
    return;
}

//! FE8U = 0x080C0610
void GmTmConfront_Loop_MoveUnitPositions(struct GmapTmConfrontProc * proc)
{
    int i;

    proc->unk_2a++;

    if (proc->unk_2a < proc->unk_2c)
    {
        int var = sub_800B7E0(proc->unk_2a, proc->unk_2c, 1);

        for (i = 0; i < 2; i++)
        {
            s16 x = proc->unk_30[i].x + DivArm(0x1000, proc->unk_40[i].x * var);
            s16 y = proc->unk_30[i].y + DivArm(0x1000, proc->unk_40[i].y * var);
            GmMu_SetPosition(
                GM_MU, proc->unk_2e[i], x, y);
        }
    }
    else
    {
        for (i = 0; i < 2; i++)
        {
            GmMu_SetPosition(
                GM_MU, proc->unk_2e[i],
                proc->unk_38[i].x, proc->unk_38[i].y);
        }

        proc->unk_2a = 0;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080C06F0
void GmTmConfront_StartAnim(struct GmapTmConfrontProc * proc)
{
    int i;
    s16 x_;
    s16 x;
    s16 y;

    Decompress(gImg_WorldmapSkirmish, (void *)0x06013000);

    x_ = 0;

    for (i = 0; i < 2; i++)
    {
        GmMu_GetPosition(
            GM_MU, proc->unk_2e[i], &x, &y);

        x_ = x_ + x;
    }

    x_ = x_ / 2;
    x = x_ - gGMData.xCamera;
    x -= 20;

    y = (y - 12);
    y -= gGMData.yCamera;

    if (((u16)y < DISPLAY_HEIGHT) && ((u16)x < DISPLAY_WIDTH))
    {
        proc->unk_48 = APProc_Create(SpriteAnim_WorldmapSkirmish, x, y, 0x3980, 0, 7);
    }

    PlaySoundEffect(0x314);

    return;
}

//! FE8U = 0x080C07B8
void GmTmConfront_WaitForAnim(ProcPtr proc)
{
    if (!APProc_Exists())
    {
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_GmapTmConfront[] =
{
    PROC_NAME("Gmap Tm Confront"),
    PROC_MARK(PROC_MARK_8),

    PROC_SET_END_CB(GmTmConfront_OnEnd),
    PROC_YIELD,

    PROC_CALL(GmTmConfront_InitUnitPositionA),
    PROC_REPEAT(GmTmConfront_Loop_MoveUnitPositions),

    PROC_CALL(GmTmConfront_InitUnitPositionB),
    PROC_YIELD,
    PROC_REPEAT(GmTmConfront_Loop_MoveUnitPositions),

    PROC_CALL(GmTmConfront_InitUnitPositionC),
    PROC_YIELD,
    PROC_REPEAT(GmTmConfront_Loop_MoveUnitPositions),

    PROC_CALL(GmTmConfront_InitUnitPositionB),
    PROC_YIELD,
    PROC_REPEAT(GmTmConfront_Loop_MoveUnitPositions),

    PROC_CALL(GmTmConfront_InitUnitPositionC),
    PROC_YIELD,
    PROC_REPEAT(GmTmConfront_Loop_MoveUnitPositions),

    PROC_CALL(GmTmConfront_StartAnim),
    PROC_REPEAT(GmTmConfront_WaitForAnim),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080C07D4
ProcPtr StartWorldmapSkirmishAnim(int a, int b, ProcPtr parent)
{
    struct GmapTmConfrontProc * proc;

    if (parent != NULL)
    {
        proc = Proc_StartBlocking(gProcScr_GmapTmConfront, parent);
    }
    else
    {
        proc = Proc_Start(gProcScr_GmapTmConfront, PROC_TREE_3);
    }

    proc->unk_2e[1] = a;
    proc->unk_2e[0] = b;

#if BUGFIX
    return proc;
#endif
}

//! FE8U = 0x080C080C
void EndWorldmapSkirmishAnim(void)
{
    Proc_EndEach(gProcScr_GmapTmConfront);
    return;
}

//! FE8U = 0x080C081C
bool IsWorldmapSkirmishAnimActive(void)
{
    return Proc_Find(gProcScr_GmapTmConfront) ? TRUE : FALSE;
}
