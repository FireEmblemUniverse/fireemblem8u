#include "global.h"
#include "spline.h"
#include "worldmap.h"

void GmMoveCursor_OnEnd(struct GMapMoveCursorProc * proc)
{
    gGMData.ix = proc->xdst;
    gGMData.iy = proc->ydst;
}

void GmMoveCursor_OnInit(struct GMapMoveCursorProc * proc)
{
    proc->timer = 0;
}

void GmMoveCursor_OnLoop(struct GMapMoveCursorProc * proc)
{
    proc->timer++;

    if (proc->timer < proc->duration)
    {
        int coeff = _DivArm1(proc->timer, proc->duration, proc->move_type);
        int x = proc->xsrc + DivArm(0x1000, proc->xmove * coeff);
        int y = proc->ysrc + DivArm(0x1000, proc->ymove * coeff);

        gGMData.ix = x;
        gGMData.iy = y;
    }
    else
    {
        gGMData.ix = proc->xdst;
        gGMData.iy = proc->ydst;
        Proc_End(proc);
    }
}

struct ProcCmd CONST_DATA ProcScr_GmMoveCursor[] =
{
    PROC_NAME("Gmap Move Cursor"),
    PROC_MARK(PROC_MARK_WMSTUFF),

    PROC_SET_END_CB(GmMoveCursor_OnEnd),

    PROC_CALL(GmMoveCursor_OnInit),
    PROC_YIELD,
    PROC_REPEAT(GmMoveCursor_OnLoop),

    PROC_END,
};

ProcPtr StartGmMoveCursor(struct Vec2 * src, struct Vec2 * dst, int duration, int move_type, ProcPtr parent)
{
    struct GMapMoveCursorProc * proc;

    if (parent)
        proc = Proc_Start(ProcScr_GmMoveCursor, parent);
    else
        proc = Proc_Start(ProcScr_GmMoveCursor, PROC_TREE_3);

    if (src == NULL)
    {
        proc->xsrc = gGMData.ix;
        proc->ysrc = gGMData.iy;
    }
    else
    {
        proc->xsrc = src->x << 8;
        proc->ysrc = src->y << 8;
    }

    if (dst == NULL)
    {
        proc->xdst = 0;
        proc->ydst = 0;
    }
    else
    {
        proc->xdst = dst->x << 8;
        proc->ydst = dst->y << 8;
    }

    proc->xmove = proc->xdst - proc->xsrc;
    proc->ymove = proc->ydst - proc->ysrc;

    proc->duration = duration;
    proc->move_type = move_type;

    return proc;
}

s8 GmMoveCursorExists(void)
{
    return Proc_Exists(ProcScr_GmMoveCursor);
}

void GmScrollManage_OnEnd(struct GMapScrollManageProc * proc)
{
    gGMData.xCamera = proc->xdst;
    gGMData.yCamera = proc->ydst;

    if (proc->wm_flag)
        *proc->wm_flag |= proc->lock;
}

void GmScrollManage_OnInit(struct GMapScrollManageProc * proc)
{
    proc->timer = 0;
}

void GmScrollManage_OnLoop(struct GMapScrollManageProc * proc)
{
    if (proc->delay > 0)
    {
        proc->delay--;
        return;
    }

    if (*proc->wm_flag & proc->lock)
        proc->timer = proc->duration;
    else
        proc->timer += 0x1000;

    if (proc->timer < proc->duration)
    {
        int coeff = _DivArm2(proc->timer, proc->duration, proc->move_type);
        int x = proc->xsrc + DivArm(0x1000, (proc->xdst - proc->xsrc) * coeff);
        int y = proc->ysrc + DivArm(0x1000, (proc->ydst - proc->ysrc) * coeff);

        gGMData.xCamera = x;
        gGMData.yCamera = y;
    }
    else
        Proc_Break(proc);
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_GmScrollManage[] =
{
    PROC_NAME("Gmap Scroll Manage"),
    PROC_MARK(PROC_MARK_WMSTUFF),

    PROC_SET_END_CB(GmScrollManage_OnEnd),

    PROC_CALL(GmScrollManage_OnInit),
    PROC_REPEAT(GmScrollManage_OnLoop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080BF370
ProcPtr StartGmScrollManage(struct GmScrollInfo * input, ProcPtr parent)
{
    u16 _src;

    struct GMapScrollManageProc * proc = Proc_Start(ProcScr_GmScrollManage, parent);

    if ((input->xsrc < 0) || (input->ysrc < 0))
    {
        input->xsrc = gGMData.xCamera;
        input->ysrc = gGMData.yCamera;
    }

    _src = input->xsrc;
    proc->xsrc = _src;
    proc->ysrc = input->ysrc;

    gGMData.xCamera = _src;
    gGMData.yCamera = proc->ysrc;

    if (input->xdst < 0)
        proc->xdst = _src;
    else
        proc->xdst = input->xdst;

    proc->ydst = input->ydst;
    proc->move_type = input->move_type;
    proc->duration = input->duration << 0xc;
    proc->delay = input->delay;

    proc->wm_flag = input->flags;

    if (proc->wm_flag != 0)
    {
        *proc->wm_flag &= ~input->lock;
        proc->lock = input->lock;
    }
    return proc;
}

#if BUFFIX
bool GmScrollManageExist(void)
#else
ProcPtr GmScrollManageExist(void)
#endif
{
    return Proc_Find(ProcScr_GmScrollManage);
}

void StartGmScroll(s16 xStart, s16 yStart, s16 xEnd, s16 yEnd, s16 speed, s16 delay)
{
    struct GmScrollInfo info;

    struct WorldMapMainProc * worldMapProc = GM_MAIN;
    info.flags = &worldMapProc->scrolling;

    info.lock = 1;
    info.move_type = 1;
    info.xsrc = xStart;
    info.ysrc = yStart;
    info.xdst = xEnd;
    info.ydst = yEnd;
    info.duration = speed;
    info.delay = delay;

    StartGmScrollManage(&info, worldMapProc);

    GM_CURSOR->unk_32--;
}

bool CheckGmScrolling(void)
{
    return !(GM_MAIN->scrolling & 1);
}

void EndGmScroll(void)
{
    struct WorldMapMainProc * worldMapProc = Proc_Find(ProcScr_WorldMapMain);
    Proc_EndEach(ProcScr_GmScrollManage);

    worldMapProc->scrolling |= 1;
}
