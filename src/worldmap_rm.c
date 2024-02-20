#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "hardware.h"
#include "bm.h"
#include "bmlib.h"
#include "uiutils.h"
#include "worldmap.h"

CONST_DATA struct ProcCmd ProcScr_GmapRmUpdateDirect[] = {
    PROC_NAME("Gmap RM update"),
    PROC_MARK(PROC_MARK_8),
    PROC_REPEAT(GmapRmUpdateDirect_Loop),
    PROC_END
};

void GmapRmUpdateDirect_Loop(struct Proc * proc)
{
    struct ProcGmapRm * parent;
    parent = proc->proc_parent;
    BG_SetPosition(BG_1, parent->x, parent->y);
}

CONST_DATA struct ProcCmd ProcScr_GmapRmUpdateExt[] = {
    PROC_NAME("Gmap RM update"),
    PROC_MARK(PROC_MARK_8),
    PROC_SET_END_CB(GmapRmUpdateExt_End),
    PROC_YIELD,
    PROC_REPEAT(GmapRmUpdateExt_Delay),
    PROC_CALL(GmapRmUpdateExt_InitPosition),
    PROC_REPEAT(GmapRmUpdateExt_ScrollPosition),
    PROC_END
};

void GmapRmUpdateExt_End(struct ProcGmapRmUpdate * proc)
{
    GmapRMSetPosition(proc->x1, proc->y1);
}

void GmapRmUpdateExt_Delay(struct ProcGmapRmUpdate * proc)
{
    if (--proc->delay <= 0)
        Proc_Break(proc);
}

void GmapRmUpdateExt_InitPosition(struct ProcGmapRmUpdate * proc)
{
    GmapRMSetPosition(proc->x0, proc->y0);
    proc->timer = 0;
}

void GmapRmUpdateExt_ScrollPosition(struct ProcGmapRmUpdate * proc)
{
    if (++proc->timer < proc->speed)
    {
        int ret = sub_8014CA4(proc->timer, proc->speed, 0x800, 0x800);
        u16 x = proc->x0 + DivArm(0x1000, (proc->x1 - proc->x0) * ret);
        u16 y = proc->y0 + DivArm(0x1000, (proc->y1 - proc->y0) * ret);

        GmapRMSetPosition(x, y);
    }
    else
    {
        GmapRMSetPosition(proc->x1, proc->y1);
        Proc_Break(proc);
    }
}

ProcPtr StartGmapRmUpdateExt(int x0, int y0, int x1, int y1, int speed, int delay, ProcPtr parent)
{
    struct ProcGmapRmUpdate * proc;

    if (parent)
        proc = Proc_StartBlocking(ProcScr_GmapRmUpdateExt, parent);
    else
        proc = Proc_Start(ProcScr_GmapRmUpdateExt, PROC_TREE_3);

    proc->x0 = x0;
    proc->y0 = y0;
    proc->x1 = x1;
    proc->y1 = y1;
    proc->speed = speed;
    proc->delay = delay;
    return proc;
}

void EndGmapRmUpdateExt(void)
{
    Proc_EndEach(ProcScr_GmapRmUpdateExt);
}

void GmapRm_OnEnd(struct ProcGmapRm * proc)
{
    GM_SCREEN->gmroute->flags |= 4;
    GM_SCREEN->gmroute->flags |= 3;

    SkipGmNodeIconDisplay(GM_ICON);
    SetupGmapNodeGfx();

    LoadObjUIGfx();
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_EnableSyncByMask(BG1_SYNC_BIT);
    LoadLegacyUiFrameGraphics();

    gGMData.state.bits.state_3 = 0;
}

void GmapRm_InitNop(void)
{
    return;
}

void GmapRm_StartUpdateDirect(struct ProcGmapRm * proc)
{
    GM_SCREEN->gmroute->flags &= 0xFB;

    BG_SetPosition(BG_1, 0, 0);
    Decompress(Img_EventGmap, (void *)BG_VRAM);
    ApplyPalettes(Pal_EventGmap, 5, 4);
    Decompress(Tsa_EventGmap, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x5000);
    BG_EnableSyncByMask(BG1_SYNC_BIT);

    Proc_Start(ProcScr_GmapRmUpdateDirect, proc);
}

void GmapRm_80C205C(struct ProcGmapRm * proc)
{
    if (!(proc->flag & 1))
        Proc_Goto(proc, 0);
}

void GmapRm_80C2078(struct ProcGmapRm * proc)
{
    if (!(proc->flag & 2))
        Proc_Goto(proc, 1);
}

void GmapRm_80C2094(struct ProcGmapRm * proc)
{
    if (proc->flag & 4)
        Proc_Break(proc);
}
