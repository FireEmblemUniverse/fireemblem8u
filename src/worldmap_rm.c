#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "hardware.h"
#include "bm.h"
#include "bmlib.h"
#include "uiutils.h"
#include "worldmap.h"
#include "constants/worldmap.h"

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
    GmapRm_SetPosition(proc->x1, proc->y1);
}

void GmapRmUpdateExt_Delay(struct ProcGmapRmUpdate * proc)
{
    if (--proc->delay <= 0)
        Proc_Break(proc);
}

void GmapRmUpdateExt_InitPosition(struct ProcGmapRmUpdate * proc)
{
    GmapRm_SetPosition(proc->x0, proc->y0);
    proc->timer = 0;
}

void GmapRmUpdateExt_ScrollPosition(struct ProcGmapRmUpdate * proc)
{
    if (++proc->timer < proc->speed)
    {
        int ret = sub_8014CA4(proc->timer, proc->speed, 0x800, 0x800);
        u16 x = proc->x0 + DivArm(0x1000, (proc->x1 - proc->x0) * ret);
        u16 y = proc->y0 + DivArm(0x1000, (proc->y1 - proc->y0) * ret);

        GmapRm_SetPosition(x, y);
    }
    else
    {
        GmapRm_SetPosition(proc->x1, proc->y1);
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

struct ProcCmd CONST_DATA ProcScr_GmapRM[] = {
    PROC_NAME("Gmap RM"),
    PROC_MARK(8),
    PROC_SET_END_CB(GmapRm_OnEnd),
    PROC_CALL(GmapRm_InitNop),
    PROC_SLEEP(1),
    PROC_CALL(GmapRm_StartUpdateDirect),
    PROC_CALL(GmapRm_Goto0IfFlag0),
    PROC_CALL(GmapRm_InitBlend),
    PROC_REPEAT(GmapRm_BlendIn),

PROC_LABEL(GMAPRM_LABEL_0),
    PROC_CALL(GmapRm_80C2320),
    PROC_REPEAT(GmapRm_Blocking),
    PROC_CALL(GmapRm_Goto1IfFlag1),
    PROC_CALL(GmapRm_80C214C),
    PROC_SLEEP(1),
    PROC_REPEAT(GmapRm_BlendOut),

PROC_LABEL(GMAPRM_LABEL_1),
    PROC_CALL(GmapRm_80C2398),
    PROC_END,
};

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
    GM_SCREEN->gmroute->flags &= ~GM_ROUTE_FLAG_2;

    BG_SetPosition(BG_1, 0, 0);
    Decompress(Img_EventGmap, (void *)BG_VRAM);
    ApplyPalettes(Pal_EventGmap, 5, 4);
    Decompress(Tsa_EventGmap, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x5000);
    BG_EnableSyncByMask(BG1_SYNC_BIT);

    Proc_Start(ProcScr_GmapRmUpdateDirect, proc);
}

void GmapRm_Goto0IfFlag0(struct ProcGmapRm * proc)
{
    if (!(proc->flag & GMAPRM_FLAG_0))
        Proc_Goto(proc, GMAPRM_LABEL_0);
}

void GmapRm_Goto1IfFlag1(struct ProcGmapRm * proc)
{
    if (!(proc->flag & GMAPRM_FLAG_1))
        Proc_Goto(proc, GMAPRM_LABEL_1);
}

void GmapRm_Blocking(struct ProcGmapRm * proc)
{
    if (proc->flag & GMAPRM_FLAG_UNBLOCK)
        Proc_Break(proc);
}

void GmapRm_InitBlend(struct ProcGmapRm * proc)
{
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 1);
    SetBlendConfig(1, 0x10, 0, 0);

    SetDispEnable(1, 1, 1, 1, 1);
    proc->timer = 0;
}

void GmapRm_BlendIn(struct ProcGmapRm * proc)
{
    if (++proc->timer < 75)
    {
        u16 val = (proc->timer * 0x10) / 75;
        SetBlendConfig(1, val, 0x10 - val, 0);
    }
    else
    {
        Proc_Break(proc);
    }
}

void GmapRm_80C214C(struct ProcGmapRm * proc)
{
    Decompress(Img_GmapPath, (void *)BG_VRAM + 0x5000);
    GM_SCREEN->gmroute->flags |= GM_ROUTE_FLAG_2;
    GM_SCREEN->gmroute->flags |= GM_ROUTE_FLAG_0 | GM_ROUTE_FLAG_1;

    SkipGmNodeIconDisplay(GM_ICON);
    SetBlendConfig(1, 0x10, 0, 0);
    GmapRm_DisplayLeaderUnit(proc);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 3;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 1);

    SetDispEnable(1, 1, 1, 1, 1);

    gGMData.state.bits.state_3 = 0;
    SetupGmapNodeGfx();
    LoadObjUIGfx();
    proc->timer = 0;
}

void GmapRm_BlendOut(struct ProcGmapRm * proc)
{
    if (++proc->timer < 75)
    {
        u16 val = (proc->timer * 0x10) / 75;
        SetBlendConfig(1, 0x10 - val, val, 0);
    }
    else
    {
        Proc_Break(proc);
    }
}

void GmapRm_RemoveUnits(struct ProcGmapRm * proc)
{
    int i;

    for (i = WM_MU_2; i < WM_MU_MAX; i++)
    {
        if (gGMData.units[i].id == 0)
            continue;

        if (gGMData.units[WM_MU_0].location != gGMData.units[i].location)
            continue;

        GmMu_RemoveUnit(proc->gm_mu, i);
    }

    if (gGMData.units[WM_MU_0].state & GM_UNIT_STATE_B0)
        proc->flag |= GMAPRM_FLAG_3;
    else
        proc->flag &= ~GMAPRM_FLAG_3;

    GmMu_HideUnit(GM_MU, WM_MU_0);
}

void GmapRm_DisplayLeaderUnit(struct ProcGmapRm * proc)
{
    if (proc->flag & GMAPRM_FLAG_3)
        GmMu_ShowUnit(GM_MU, WM_MU_0);
}

void GmapRm_80C2320(struct ProcGmapRm * proc)
{
    UnskipGmNodeIconDisplay(GM_ICON);
    SetBlendConfig(0, 0x10, 0x10, 0);
    GmapRm_RemoveUnits(proc);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 3;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 3;

    BG_Fill(BG_GetMapBuffer(BG_2), 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
    gGMData.state.bits.state_3 = true;
}

void GmapRm_80C2398(struct ProcGmapRm * proc)
{
    SkipGmNodeIconDisplay(GM_ICON);
    SetBlendConfig(0, 0x10, 0x10, 0);
    GmapRm_DisplayLeaderUnit(proc);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 3;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetDispEnable(1, 1, 1, 1, 1);
    gGMData.state.bits.state_3 = 0;
    Proc_EndEach(ProcScr_GmapRmUpdateDirect);
}

ProcPtr StartGmapRm(int x, int y, u32 mask, ProcPtr parent)
{
    struct ProcGmapRm * proc;
    if (parent)
        proc = Proc_StartBlocking(ProcScr_GmapRM, parent);
    else
        proc = Proc_Start(ProcScr_GmapRM, PROC_TREE_3);

#if NONMATCHING
    proc->flag = mask & (~GMAPRM_FLAG_UNBLOCK);
#else
{
    u8 * flag_it = &proc->flag;
    u8 _mask = ~GMAPRM_FLAG_UNBLOCK;
    *flag_it = _mask & mask;
}
#endif

    proc->x = x;
    proc->y = y;

    return proc;
}

void EndGmapRM(void)
{
    Proc_EndEach(ProcScr_GmapRM);
}

int GmapRMExists(void)
{
    return (Proc_Find(ProcScr_GmapRM) != NULL) ? true : false;
}

void GmapRm_SetPosition(s16 x, s16 y)
{
    struct ProcGmapRm * proc = Proc_Find(ProcScr_GmapRM);
    if (proc != NULL)
    {
        proc->x = x;
        proc->y = y;
    }
}

bool GmapRm_GetPosition(s16 * px, s16 * py)
{
    struct ProcGmapRm * proc = Proc_Find(ProcScr_GmapRM);
    if (proc != NULL)
    {
        *px = proc->x;
        *py = proc->y;
        return true;
    }
    return false;
}

void GmapRm_SetUnblocked(void)
{
    struct ProcGmapRm * proc = Proc_Find(ProcScr_GmapRM);
    if (proc != NULL)
        proc->flag |= GMAPRM_FLAG_UNBLOCK;
}

void GmapRm_EndAll(void)
{
    struct ProcGmapRm * proc = Proc_Find(ProcScr_GmapRM);
    if (proc != NULL)
    {
        SkipGmNodeIconDisplay(GM_ICON);
        SetBlendConfig(0, 0x10, 0x10, 0);
        GmapRm_DisplayLeaderUnit(proc);

        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 1;
        gLCDControlBuffer.bg2cnt.priority = 3;
        gLCDControlBuffer.bg3cnt.priority = 3;

        gGMData.state.bits.state_3 = 0;

        SetDispEnable(0, 0, 0, 0, 0);
        Proc_EndEach(ProcScr_GmapRmUpdateDirect);
        Proc_End(proc);
    }
}

struct ProcCmd CONST_DATA ProcScr_GmapRmBaPalAnim1[] = {
    PROC_NAME("Gmap RM ba pal anim"),
    PROC_MARK(8),
    PROC_SET_END_CB(GmapRmBaPalAnim1_End),
    PROC_CALL(GmapRmBaPalAnim1_Init),
    PROC_SLEEP(1),

PROC_LABEL(0),
    PROC_REPEAT(GmapRmBaPalAnim1_Loop1),
    PROC_SLEEP(2),
    PROC_REPEAT(GmapRmBaPalAnim1_Loop2),
    PROC_SLEEP(2),
    PROC_GOTO(0),
    PROC_END,
};

void GmapRmBaPalAnim1_End(struct ProcGmapRmBaPalAnim * proc)
{
    int val = GetWMFaceBlendAmt();
    SetBlendConfig(0, val, 0x10 - val, 0);
}

void GmapRmBaPalAnim1_Init(struct ProcGmapRmBaPalAnim * proc)
{
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 1, 0, 0, 0);
    SetBlendConfig(0, 0, 0x10, 0);

    proc->timer = 0;
    proc->flag = 1;
}

void GmapRmBaPalAnim1_Loop1(struct ProcGmapRmBaPalAnim * proc)
{
    if (++proc->timer < 45)
    {
        u32 coeff = sub_800B84C(proc->timer, 45, 0);
        SetBlendConfig(0, DivArm(0x1000, coeff * 0x10), 0x10, 0);
        proc->flag = 0;
    }
    else
    {
        SetBlendConfig(0, 0x10, 0x10, 0);
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void GmapRmBaPalAnim1_Loop2(struct ProcGmapRmBaPalAnim * proc)
{
    if (++proc->timer < 45)
    {
        u32 coeff = sub_800B84C(proc->timer, 45, 0);
        SetBlendConfig(0, 0x10 - DivArm(0x1000, coeff * 0x10), 0x10, 0);
    }
    else
    {
        SetBlendConfig(0, 0, 0x10, 0);
        proc->timer = 0;
        proc->flag = 1;
        Proc_Break(proc);
    }
}

ProcPtr StartGmapRmBaPalAnim1(ProcPtr parent)
{
    ProcPtr proc;
    if (parent != NULL)
        proc = Proc_StartBlocking(ProcScr_GmapRmBaPalAnim1, parent);
    else
        proc = Proc_Start(ProcScr_GmapRmBaPalAnim1, PROC_TREE_3);

    return proc;
}

void EndGmapRmBaPalAnim1(void)
{
    Proc_EndEach(ProcScr_GmapRmBaPalAnim1);
}

bool CheckGmapRmBaPalAnim1Exists(void)
{
    return (Proc_Find(ProcScr_GmapRmBaPalAnim1) != NULL) ? true : false;
}

bool CheckGmapRmBaPalAnim1State(void)
{
    struct ProcGmapRmBaPalAnim * proc;
    proc = Proc_Find(ProcScr_GmapRmBaPalAnim1);
    if (proc)
        return proc->flag;

    return 0;
}
