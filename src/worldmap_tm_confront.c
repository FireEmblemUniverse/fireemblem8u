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
void nullsub_47(void)
{
    return;
}

//! FE8U = 0x080C054C
void sub_80C054C(struct GmapTmConfrontProc * proc, const struct Vec2 * pPos)
{
    int i;

    for (i = 0; i < 2; i++)
    {
        struct WorldMapMainProc * worldMapProc = Proc_Find(gProcScr_WorldMapMain);
        GmMu_GetPosition(worldMapProc->unk_54, proc->unk_2e[i], &proc->unk_30[i].x, &proc->unk_30[i].y);
        proc->unk_40[i].x = pPos[i].x;
        proc->unk_40[i].y = pPos[i].y;
        proc->unk_38[i].x = proc->unk_30[i].x + pPos[i].x;
        proc->unk_38[i].y = proc->unk_30[i].y + pPos[i].y;
    }

    proc->unk_2a = 0;

    return;
}

// clang-format off

const struct Vec2 gUnknown_082068F4[] =
{
    { -11, 0, },
    { +11, 0, },
};

// clang-format on

//! FE8U = 0x080C05AC
void sub_80C05AC(struct GmapTmConfrontProc * proc)
{
    sub_80C054C(proc, gUnknown_082068F4);
    proc->unk_2c = 16;
    return;
}

// clang-format off

const struct Vec2 gUnknown_082068FC[] =
{
    { +3, 0, },
    { -3, 0, },
};

// clang-format on

//! FE8U = 0x080C05C4
void sub_80C05C4(struct GmapTmConfrontProc * proc)
{
    sub_80C054C(proc, gUnknown_082068FC);
    proc->unk_2c = 5;
    PlaySoundEffect(0x313);
    return;
}

// clang-format off

const struct Vec2 gUnknown_08206904[] =
{
    { -2, 0, },
    { +2, 0, },
};

// clang-format on

//! FE8U = 0x080C05F8
void sub_80C05F8(struct GmapTmConfrontProc * proc)
{
    sub_80C054C(proc, gUnknown_08206904);
    proc->unk_2c = 5;
    return;
}

//! FE8U = 0x080C0610
void sub_80C0610(struct GmapTmConfrontProc * proc)
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
                ((struct WorldMapMainProc *)Proc_Find(gProcScr_WorldMapMain))->unk_54, proc->unk_2e[i], x, y);
        }
    }
    else
    {
        for (i = 0; i < 2; i++)
        {
            GmMu_SetPosition(
                ((struct WorldMapMainProc *)Proc_Find(gProcScr_WorldMapMain))->unk_54, proc->unk_2e[i],
                proc->unk_38[i].x, proc->unk_38[i].y);
        }

        proc->unk_2a = 0;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080C06F0
void sub_80C06F0(struct GmapTmConfrontProc * proc)
{
    int i;
    s16 x_;
    s16 x;
    s16 y;

    Decompress(gUnknown_08AA1970, (void *)0x06013000);

    x_ = 0;

    for (i = 0; i < 2; i++)
    {
        GmMu_GetPosition(
            ((struct WorldMapMainProc *)Proc_Find(gProcScr_WorldMapMain))->unk_54, proc->unk_2e[i], &x,
            &y);

        x_ = x_ + x;
    }

    x_ = x_ / 2;
    x = x_ - gGMData.xCamera;
    x -= 20;

    y = (y - 12);
    y -= gGMData.yCamera;

    if (((u16)y < DISPLAY_HEIGHT) && ((u16)x < DISPLAY_WIDTH))
    {
        proc->unk_48 = APProc_Create(gUnknown_08AA1C70, x, y, 0x3980, 0, 7);
    }

    PlaySoundEffect(0x314);

    return;
}

//! FE8U = 0x080C07B8
void sub_80C07B8(ProcPtr proc)
{
    if (!APProc_Exists())
    {
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_08A3E6E4[] =
{
    PROC_NAME("Gmap Tm Confront"),
    PROC_MARK(PROC_MARK_8),

    PROC_SET_END_CB(nullsub_47),
    PROC_YIELD,

    PROC_CALL(sub_80C05AC),

    PROC_REPEAT(sub_80C0610),
    PROC_CALL(sub_80C05C4),
    PROC_YIELD,

    PROC_REPEAT(sub_80C0610),
    PROC_CALL(sub_80C05F8),
    PROC_YIELD,

    PROC_REPEAT(sub_80C0610),
    PROC_CALL(sub_80C05C4),
    PROC_YIELD,

    PROC_REPEAT(sub_80C0610),
    PROC_CALL(sub_80C05F8),
    PROC_YIELD,

    PROC_REPEAT(sub_80C0610),

    PROC_CALL(sub_80C06F0),
    PROC_REPEAT(sub_80C07B8),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080C07D4
ProcPtr sub_80C07D4(int a, int b, ProcPtr parent)
{
    struct GmapTmConfrontProc * proc;

    if (parent != NULL)
    {
        proc = Proc_StartBlocking(gUnknown_08A3E6E4, parent);
    }
    else
    {
        proc = Proc_Start(gUnknown_08A3E6E4, PROC_TREE_3);
    }

    proc->unk_2e[1] = a;
    proc->unk_2e[0] = b;

#if BUGFIX
    return proc;
#endif
}

//! FE8U = 0x080C080C
void sub_80C080C(void)
{
    Proc_EndEach(gUnknown_08A3E6E4);
    return;
}

//! FE8U = 0x080C081C
bool sub_80C081C(void)
{
    return Proc_Find(gUnknown_08A3E6E4) ? TRUE : FALSE;
}
