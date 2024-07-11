#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "hardware.h"
#include "bm.h"
#include "gba_sprites.h"
#include "bmlib.h"
#include "uiutils.h"
#include "ctc.h"

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

    GmHideMuUnit(GM_MU, WM_MU_0);
}

void GmapRm_DisplayLeaderUnit(struct ProcGmapRm * proc)
{
    if (proc->flag & GMAPRM_FLAG_3)
        GmShowMuUnit(GM_MU, WM_MU_0);
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

void GmapRmBorder1_End(struct ProcGmapRmBorder1 * proc)
{
    AP_Delete(proc->sprite2);
    AP_Delete(proc->sprite1);

    if (CountProcs(ProcScr_GmapRmBorder1) == 1)
        EndGmapRmBaPalAnim1();
}

void GmapRmBorder1_80C2750(struct ProcGmapRmBorder1 * proc)
{
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 1, 0, 0, 0);
    SetBlendConfig(0, 0, 0x10, 0);

    proc->timer = 0;

    if (CountProcs(ProcScr_GmapRmBorder1) <= 1)
    {
        ApplyPalette(Pal_WmHighLightNationMap, 0x19);
    }
}

void GmapRmBorder1_PutSprite2(struct ProcGmapRmBorder1 * proc, int x, int y, bool transparency)
{
    s16 ix, iy;
    GmapRm_GetPosition(&ix, &iy);

    x -= ix;
    y -= iy;

    if (transparency)
        AP_Update(proc->sprite2, x, OBJ_TRANSLUCENT | y);
    else
        AP_Update(proc->sprite2, x, y);
}

const struct GmMapRmBorderSet GfxSet_WmNationMap[WM_NATION_MAX] = {
    [WM_NATION_Frelia] = {
        Img_WmHightLightMapFrecia,
        Ap_WmHightLightMapFrecia,
        0x36, 0x28
    },
    [WM_NATION_Grado] = {
        Img_WmHightLightMap2,
        Ap_WmHightLightMap2,
        0x58, 0x75
    },
    [WM_NATION_Jehanna] = {
        Img_WmHightLightMap3,
        Ap_WmHightLightMap3,
        0xB1, 0x57
    },
    [WM_NATION_Carcino] = {
        Img_WmHightLightMap4,
        Ap_WmHightLightMap4,
        0x7F, 0x39
    },
    [WM_NATION_ZahaWoods] = {
        Img_WmHightLightMap5,
        Ap_WmHightLightMap5,
        0x9A, 0x2C
    },
    [WM_NATION_Rausten] = {
        Img_WmHightLightMap6,
        Ap_WmHightLightMap6,
        0xBC, 0x26
    },
    [WM_NATION_Pokhara] = {
        Img_WmHightLightMap7,
        Ap_WmHightLightMap7,
        0x84, 0x30
    },
    [WM_NATION_Renais] = {
        Img_WmHightLightMap8,
        Ap_WmHightLightMap8,
        0x65, 0x4A
    },
};

void GmapRmBorder1_NationMergeIn(struct ProcGmapRmBorder1 * proc)
{
    int offset, x, y;

    if (++proc->timer < 22)
    {
        u32 coeff = sub_800B7E0(proc->timer, 22, 2);
        int ret = DivArm(0x1000, coeff * 0x10);

        SetBlendConfig(0, ret, 0x10 - ret, 0);
        offset = DivArm(0x1000, (0x1000 - coeff) * 18);

        x = GfxSet_WmNationMap[proc->index].x + offset;
        y = GfxSet_WmNationMap[proc->index].y;

        GmapRmBorder1_PutSprite2(proc, x, y, 1);
    }
    else
    {
        SetBlendConfig(0, 0x10, 0x10, 0);
        proc->timer = 0;

        x = GfxSet_WmNationMap[proc->index].x;
        y = GfxSet_WmNationMap[proc->index].y;

        GmapRmBorder1_PutSprite2(proc, x, y, 0);
        Proc_Break(proc);
    }
}

void GmapRmBorder1_80C28C4(struct ProcGmapRmBorder1 * proc)
{
    if (CountProcs(ProcScr_GmapRmBorder1) == 1)
        EndGmapRmBaPalAnim1();
}

void GmapRmBorder1_NationMergeOut(struct ProcGmapRmBorder1 * proc)
{
    int offset, x, y;

    if (++proc->timer < 22)
    {
        u32 coeff = sub_800B7E0(proc->timer, 22, 2);
        int ret = DivArm(0x1000, coeff * 0x10);

        SetBlendConfig(0, 0x10 - ret, ret, 0);
        offset = DivArm(0x1000, coeff * 18);

        x = GfxSet_WmNationMap[proc->index].x - offset;
        y = GfxSet_WmNationMap[proc->index].y;

        GmapRmBorder1_PutSprite2(proc, x, y, 1);
    }
    else
    {
        SetDefaultColorEffects();
        Proc_Break(proc);
    }
}

void GmapRmBorder1_80C2964(struct ProcGmapRmBorder1 * proc)
{
    if (CountProcs(ProcScr_GmapRmBorder1) <= 1)
    {
        StartGmapRmBaPalAnim1(NULL);
        Proc_Goto(proc, 1);
    }
}

void GmapRmBorder1_PutSpriteAll(struct ProcGmapRmBorder1 * proc)
{
    s16 ix, iy, x, y;
    GmapRm_GetPosition(&ix, &iy);

    x = GfxSet_WmNationMap[proc->index].x - ix;
    y = GfxSet_WmNationMap[proc->index].y - iy;

    AP_Update(proc->sprite1, x, OBJ_TRANSLUCENT | y);

    x = GfxSet_WmNationMap[proc->index].x;
    y = GfxSet_WmNationMap[proc->index].y;

    GmapRmBorder1_PutSprite2(proc, x, y, 0);
}

void GmapRmBorder1_80C29F8(struct ProcGmapRmBorder1 * proc)
{
    GmapRmBorder1_PutSpriteAll(proc);
    if (CheckGmapRmBaPalAnim1State())
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void GmapRmBorder1_80C2A1C(struct ProcGmapRmBorder1 * proc)
{
    GmapRmBorder1_PutSpriteAll(proc);
    if (proc->flag)
        Proc_Break(proc);
}

struct ProcCmd CONST_DATA ProcScr_GmapRmBorder1[] = {
    PROC_NAME("Gmap RM border"),
    PROC_MARK(8),
    PROC_SET_END_CB(GmapRmBorder1_End),
    PROC_CALL(GmapRmBorder1_80C2750),
    PROC_REPEAT(GmapRmBorder1_NationMergeIn),
    PROC_CALL(GmapRmBorder1_80C2964),
    PROC_REPEAT(GmapRmBorder1_80C29F8),

PROC_LABEL(1),
    PROC_REPEAT(GmapRmBorder1_80C2A1C),
    PROC_REPEAT(GmapRmBorder1_80C29F8),
    PROC_CALL(GmapRmBorder1_80C28C4),
    PROC_REPEAT(GmapRmBorder1_NationMergeOut),
    PROC_END,
};

//! FE8U = 0x080C2A40
int StartGmapRmBorder1(void)
{
    int i;
    int j;
    int count;
    struct ProcGmapRmBorder1 * proc;
    struct ProcFindIterator procIter;

    int local_18[3];

    count = 0;

    Proc_FindBegin(&procIter, ProcScr_GmapRmBorder1);

    do
    {
        proc = Proc_FindNext(&procIter);
        if (proc == NULL)
        {
            break;
        }

        local_18[count] = proc->unk_2b;

        count++;
    } while (1);

    if (count == 0)
    {
        return 0;
    }

    for (i = 0; i < 3; i++)
    {
        for (j = 0; j < count && i != local_18[j]; j++)
        {
        }

        if (j == count)
        {
            return i;
        }
    }

    return -1;
}

//! FE8U = 0x080C2AAC
void DrawWmNationHighLightMapGfx(int chr, int index)
{
    void * vram = (void *)(0x06010000 + chr * 0x1000);
    Decompress(GfxSet_WmNationMap[index].img, vram);

    return;
}

//! FE8U = 0x080C2AD4
ProcPtr WmShowNationHighlightedMap(int index, ProcPtr parent)
{
    int countMaybe;
    struct ProcGmapRmBorder1 * proc;

    countMaybe = StartGmapRmBorder1();

    if (parent != NULL)
    {
        proc = Proc_StartBlocking(ProcScr_GmapRmBorder1, parent);
    }
    else
    {
        proc = Proc_Start(ProcScr_GmapRmBorder1, PROC_TREE_3);
    }

    DrawWmNationHighLightMapGfx(countMaybe, index);

    proc->sprite1 = AP_Create(GfxSet_WmNationMap[index].sprite, 0xd);

    proc->sprite1->tileBase = ((countMaybe << 12) >> 5) | -0x6400;
    AP_SwitchAnimation(proc->sprite1, 0);

    proc->sprite2 = AP_Create(GfxSet_WmNationMap[index].sprite, 0xd);
    proc->sprite2->tileBase = ((countMaybe << 12) >> 5) | -0x6400;
    AP_SwitchAnimation(proc->sprite2, 1);

    proc->index = index;
    proc->unk_2b = countMaybe;
    proc->flag = 0;

    return proc;
}

//! FE8U = 0x080C2B7C
void EndGmapRmBorder1(int index)
{
    struct ProcGmapRmBorder1 * proc;
    struct ProcFindIterator procIter;

    if (index < 0)
    {
        Proc_EndEach(ProcScr_GmapRmBorder1);
        return;
    }

    Proc_FindBegin(&procIter, ProcScr_GmapRmBorder1);
    do
    {
        proc = Proc_FindNext(&procIter);

        if (proc->index == index)
        {
            Proc_End(proc);
            return;
        }
    } while (proc != NULL);

    return;
}

//! FE8U = 0x080C2BC4
int sub_80C2BC4(int index)
{
    struct ProcGmapRmBorder1 * proc;
    struct ProcFindIterator procIter;

    if (index < 0)
    {
        return Proc_Find(ProcScr_GmapRmBorder1) != NULL;
    }

    Proc_FindBegin(&procIter, ProcScr_GmapRmBorder1);

    do
    {
        proc = Proc_FindNext(&procIter);
        if (proc->index == index)
        {
            return 1;
        }
    } while (proc != NULL);

    return 0;
}

//! FE8U = 0x080C2C10
void sub_80C2C10(int index)
{
    struct ProcGmapRmBorder1 * proc;
    struct ProcFindIterator procIter;

    Proc_FindBegin(&procIter, ProcScr_GmapRmBorder1);

    do
    {
        proc = Proc_FindNext(&procIter);
        if (index < 0)
        {
            proc->flag = 1;
        }
        else if (proc->index == index)
        {
            proc->flag = 1;
            return;
        }
    } while (proc != NULL);

    return;
}

//! FE8U = 0x080C2C54
void WmDotPalAnim_OnEnd(void)
{
    return;
}

//! FE8U = 0x080C2C58
void WmDotPalAnim_Init(struct ProcGmapRmBaPalAnim * proc)
{
    ApplyPalette(Pal_WmPlaceDot_Standard, 0x15);
    EnablePaletteSync();

    proc->timer = 0;
    proc->flag = 1;

    return;
}

//! FE8U = 0x080C2C80
void sub_80C2C80(int a, int b, const u16 * srcA, const u16 * srcB, u16 * dst)
{
    int i;

    int coeff = sub_800B7E0(a, b, 0);

    for (i = 0; i < 0x10; i++)
    {
        u16 color = srcA[i];

        int r1 = (color & 0x1f);
        int g1 = ((color & 0x3e0) >> 5);
        int b1 = ((color & 0x7c00) >> 10);

        u16 color2 = srcB[i];
        int r2 = r1 + DivArm(0x1000, coeff * ((color2 & 0x1f) - r1));
        int g2 = g1 + DivArm(0x1000, coeff * (((color2 & 0x3e0) >> 5) - g1));
        int b2 = b1 + DivArm(0x1000, coeff * (((color2 & 0x7c00) >> 10) - b1));

        dst[i] = (b2 << 10) + (g2 << 5) + r2;
    }

    EnablePaletteSync();

    return;
}

//! FE8U = 0x080C2D44
void WmDotPalAnim_Loop1(struct ProcGmapRmBaPalAnim * proc)
{
    proc->timer++;

    if (proc->timer < 30)
    {
        sub_80C2C80(proc->timer, 30, Pal_WmPlaceDot_Standard, Pal_WmPlaceDot_Standard - 0x10, gPaletteBuffer + 0x150);
        proc->flag = 0;
    }
    else
    {
        CpuCopy16(Pal_WmPlaceDot_Highlight, gPaletteBuffer + 0x150, PLTT_SIZE_4BPP);
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080C2DA4
void WmDotPalAnim_Loop2(struct ProcGmapRmBaPalAnim * proc)
{
    proc->timer++;

    if (proc->timer < 30)
    {
        sub_80C2C80(proc->timer, 30, Pal_WmPlaceDot_Highlight, Pal_WmPlaceDot_Highlight + 0x10, gPaletteBuffer + 0x150);
    }
    else
    {
        CpuCopy16(Pal_WmPlaceDot_Standard, gPaletteBuffer + 0x150, PLTT_SIZE_4BPP);
        proc->timer = 0;
        proc->flag = 1;
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_WmDotPalAnim[] =
{
    PROC_NAME("Gmap RM ba pal anim"),
    PROC_MARK(PROC_MARK_8),

    PROC_SET_END_CB(WmDotPalAnim_OnEnd),

    PROC_CALL(WmDotPalAnim_Init),
    PROC_SLEEP(1),

PROC_LABEL(0),
    PROC_REPEAT(WmDotPalAnim_Loop1),
    PROC_SLEEP(2),

    PROC_REPEAT(WmDotPalAnim_Loop2),
    PROC_SLEEP(2),

    PROC_GOTO(0),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080C2E04
ProcPtr StartWmDotPalAnim(ProcPtr parent)
{
    if (parent != NULL)
    {
        Proc_StartBlocking(ProcScr_WmDotPalAnim, parent);
    }
    else
    {
        Proc_Start(ProcScr_WmDotPalAnim, PROC_TREE_3);
    }

    // return; // BUG
}

//! FE8U = 0x080C2E28
void EndAllWmDotPalAnim(void)
{
    Proc_EndEach(ProcScr_WmDotPalAnim);
    return;
}

//! FE8U = 0x080C2E38
bool IsWmDotPalAnimActive(void)
{
    return Proc_Find(ProcScr_WmDotPalAnim) ? true : false;
}

//! FE8U = 0x080C2E50
s8 sub_80C2E50(void)
{
    struct ProcGmapRmBaPalAnim * proc = Proc_Find(ProcScr_WmDotPalAnim);

    if (proc != NULL)
    {
        return proc->flag;
    }

    return 0;
}

extern struct ProcCmd ProcScr_WmPlaceDot[];

//! FE8U = 0x080C2E70
void WmPlaceDot_OnEnd(struct ProcWmPlaceDot * proc)
{
    if (CountProcs(ProcScr_WmPlaceDot) == 1)
    {
        EndAllWmDotPalAnim();
    }

    if (((proc->unk_2a & 2) != 0) && (proc->effectProc != NULL))
    {
        sub_80C13CC(proc->effectProc);
    }

    return;
}

//! FE8U = 0x080C2EA4
void WmPlaceDot_Init(struct ProcWmPlaceDot * proc)
{
    if (CountProcs(ProcScr_WmPlaceDot) > 1)
    {
        return;
    }

    StartWmDotPalAnim(NULL);

    Decompress(Img_WorldMapPlaceDot, (void *)(0x060133C0));
    ApplyPalette(Pal_WmPlaceDot_Standard, 0x14);
    EnablePaletteSync();

    Proc_Goto(proc, 1);

    return;
}

// clang-format off

u16 CONST_DATA Sprite_WmPlaceDot[] =
{
    1,
    OAM0_SHAPE_8x8, OAM1_SIZE_8x8, 0,
};

// clang-format on

//! FE8U = 0x080C2EF0
void PutWmDotSprite(struct ProcWmPlaceDot * proc)
{
    s16 xOam1;
    s16 yOam0;
    int palId;
    s16 x;
    s16 y;

    GmapRm_GetPosition(&x, &y);

    xOam1 = -(x + 4) + proc->x;
    yOam0 = -(y + 4) + proc->y;

    if (((xOam1 + 0x21) > 0 && (xOam1 + 0x21) < 0x112) && ((yOam0 + 0x21) > 0 && (yOam0 + 0x21) < 0xc2))
    {
        if ((proc->unk_2a & 1) != 0)
        {
            palId = 5;
        }
        else
        {
            palId = 4;
        }

        PutSprite(0xb, xOam1, yOam0, Sprite_WmPlaceDot, proc->unk_2c + (palId << 0xc | 0x19e) + 0xc00);
    }

    return;
}

//! FE8U = 0x080C2F7C
void WmPlaceDot_Loop1(struct ProcWmPlaceDot * proc)
{
    PutWmDotSprite(proc);

    if (sub_80C2E50() != 0)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080C2F9C
void WmPlaceDot_Loop2(struct ProcWmPlaceDot * proc)
{
    PutWmDotSprite(proc);

    if (proc->flag != 0)
    {
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_WmPlaceDot[] =
{
    PROC_NAME("Gmap RM border"),
    PROC_MARK(PROC_MARK_8),

    PROC_SET_END_CB(WmPlaceDot_OnEnd),

    PROC_CALL(WmPlaceDot_Init),
    PROC_REPEAT(WmPlaceDot_Loop1),

PROC_LABEL(1),
    PROC_REPEAT(WmPlaceDot_Loop2),
    PROC_REPEAT(WmPlaceDot_Loop1),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080C2FC0
ProcPtr StartWmPlaceDot(int a, int b, int x, int y, int e, ProcPtr parent)
{
    struct ProcWmPlaceDot * proc;

    if (parent != NULL)
    {
        proc = Proc_StartBlocking(ProcScr_WmPlaceDot, parent);
    }
    else
    {
        proc = Proc_Start(ProcScr_WmPlaceDot, PROC_TREE_3);
    }

    proc->unk_2b = a;
    proc->unk_2c = b;
    proc->x = x;
    proc->y = y;
    proc->unk_2a = e;

    if ((e & 2) != 0)
    {
        proc->effectProc = StartGmapEffect(0, 1);
        proc->effectProc->flags_0 = 1;
        proc->effectProc->unk_2c = x;
        proc->effectProc->unk_2e = y;
    }
    else
    {
        proc->effectProc = NULL;
    }

    proc->flag = 0;

    return proc;
}

//! FE8U = 0x080C304C
void EndWmPlaceDotByIndex(int index)
{
    struct ProcWmPlaceDot * proc;
    struct ProcFindIterator procIter;

    if (index < 0)
    {
        Proc_EndEach(ProcScr_WmPlaceDot);
        return;
    }

    Proc_FindBegin(&procIter, ProcScr_WmPlaceDot);
    do
    {
        proc = Proc_FindNext(&procIter);
        if (proc->unk_2b == index)
        {
            Proc_End(proc);
            return;
        }
    } while (proc != NULL);

    return;
}

//! FE8U = 0x080C3094
bool IsWmPlaceDotActiveAtIndex(int index)
{
    struct ProcWmPlaceDot * proc;
    struct ProcFindIterator procIter;

    if (index < 0)
    {
        return Proc_Find(ProcScr_WmPlaceDot) ? true : false;
    }

    Proc_FindBegin(&procIter, ProcScr_WmPlaceDot);
    do
    {
        proc = Proc_FindNext(&procIter);
        if (proc->unk_2b == index)
        {
            return true;
        }
    } while (proc != NULL);

    return false;
}

//! FE8U = 0x080C30E0
void SetWmPlaceDotFlagForIndex(int index)
{
    struct ProcWmPlaceDot * proc;
    struct ProcFindIterator procIter;

    Proc_FindBegin(&procIter, ProcScr_WmPlaceDot);
    do
    {
        proc = Proc_FindNext(&procIter);
        if (index < 0)
        {
            proc->flag = 1;
        }
        else if (proc->unk_2b == index)
        {
            proc->flag = 1;
            return;
        }
    } while (proc != NULL);

    return;
}
