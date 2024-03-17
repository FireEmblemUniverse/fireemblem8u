#include "global.h"

#include "hardware.h"
#include "bmunit.h"
#include "bmlib.h"
#include "worldmap.h"
#include "face.h"
#include "scene.h"
#include "savemenu.h"

#include "eventscript.h"
#include "event.h"

void GetWMCenteredCameraPosition(s16, s16, s16 *, s16 *);

// TODO: In "worldmap_scrollmanage.c", the signature returns a ProcPtr instead of s8/bool
s8 FindGmScrollManage(void);
int IsWmPlaceDotActiveAtIndex(int); // implicit?

//! FE8U = 0x0800BDCC
u8 Event80_WmSkip_Unsure(struct EventEngineProc * proc)
{
    int delay = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    sub_80BA008(delay);
    nullsub_5(delay);

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800BDE8
u8 Event81_WmFadeOut(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        SetDispEnable(0, 0, 0, 0, 0);
        return EVC_ADVANCE_CONTINUE;
    }

    StartSlowLockingFadeToBlack(proc);
    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800BE2C
u8 Event82_WmEnd(struct EventEngineProc * proc)
{
    EndWM(proc);
    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800BE38
u8 Event83_WmSetCamera(struct EventEngineProc * proc)
{
    u16 x = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    u16 y = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    gGMData.xCamera = x;
    gGMData.yCamera = y;

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800BE4C
u8 Event84_WmSetCameraOntoNode(struct EventEngineProc * proc)
{
    u16 x;
    u16 y;

    int nodeId = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    GetWMCenteredCameraPosition(nodeId[gWMNodeData].x, nodeId[gWMNodeData].y, &x, &y);

    gGMData.xCamera = x;
    gGMData.yCamera = y;

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800BE8C
u8 Event85_WmSetCameraOntoUnit(struct EventEngineProc * proc)
{
    u16 x;
    u16 y;

    int unitId = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    GetWMCenteredCameraPosition(
        gGMData.units[unitId].location[gWMNodeData].x, gGMData.units[unitId].location[gWMNodeData].y, &x, &y);

    gGMData.xCamera = x;
    gGMData.yCamera = y;

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800BED4
u8 Event86_WmScrollCamera(struct EventEngineProc * proc)
{
    s16 xStart = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    s16 yStart = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    s16 xEnd = EVT_CMD_ARGV(proc->pEventCurrent)[3];
    s16 yEnd = EVT_CMD_ARGV(proc->pEventCurrent)[4];

    s16 speed = EVT_CMD_ARGV(proc->pEventCurrent)[5];
    s16 delay = EVT_CMD_ARGV(proc->pEventCurrent)[6];

    if (EVENT_IS_SKIPPING(proc) || (speed == 0 && delay == 0))
    {
        gGMData.xCamera = xEnd;
        gGMData.yCamera = yEnd;

        return EVC_ADVANCE_CONTINUE;
    }

    StartGmScroll(xStart, yStart, xEnd, yEnd, speed, delay);

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800BF38
u8 Event87_WmScrollCameraOntoNode(struct EventEngineProc * proc)
{
    s16 xEnd;
    s16 yEnd;

    s16 xStart = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    s16 yStart = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    u16 nodeId = EVT_CMD_ARGV(proc->pEventCurrent)[3];

    s16 speed = EVT_CMD_ARGV(proc->pEventCurrent)[4];
    s16 delay = EVT_CMD_ARGV(proc->pEventCurrent)[5];

    GetWMCenteredCameraPosition(nodeId[gWMNodeData].x, nodeId[gWMNodeData].y, &xEnd, &yEnd);

    if (EVENT_IS_SKIPPING(proc) || (speed == 0 && delay == 0))
    {
        gGMData.xCamera = xEnd;
        gGMData.yCamera = yEnd;

        return EVC_ADVANCE_CONTINUE;
    }

    StartGmScroll(xStart, yStart, xEnd, yEnd, speed, delay);

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800BFD8
u8 Event88_WmScrollCameraOntoUnit(struct EventEngineProc * proc)
{
    s16 xEnd;
    s16 yEnd;

    s16 xStart = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    s16 yStart = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    u16 unitId = EVT_CMD_ARGV(proc->pEventCurrent)[3];

    s16 speed = EVT_CMD_ARGV(proc->pEventCurrent)[4];
    s16 delay = EVT_CMD_ARGV(proc->pEventCurrent)[5];

    GetWMCenteredCameraPosition(
        gGMData.units[unitId].location[gWMNodeData].x, gGMData.units[unitId].location[gWMNodeData].y, &xEnd, &yEnd);

    if (EVENT_IS_SKIPPING(proc) || (speed == 0 && delay == 0))
    {
        gGMData.xCamera = xEnd;
        gGMData.yCamera = yEnd;

        return EVC_ADVANCE_CONTINUE;
    }

    StartGmScroll(xStart, yStart, xEnd, yEnd, speed, delay);

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800C084
u8 Event89_WmScrollWait(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        if (FindGmScrollManage())
        {
            EndGmScroll();
        }

        return EVC_ADVANCE_CONTINUE;
    }

    if (!FindGmScrollManage())
    {
        return EVC_ADVANCE_YIELD;
    }

    return EVC_STOP_YIELD;
}

//! FE8U = 0x0800C0B8
u8 Event8A_WmShowCursor_Unsure(struct EventEngineProc * proc)
{
    gGMData.unk01 = 1;
    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C0C8
void Event8B_WmHideCursor_Unsure(void)
{
    gGMData.unk01 = 0;
    return;
}

//! FE8U = 0x0800C0D4
u8 Event8C_WmSetCursor_Unsure(struct EventEngineProc * proc)
{
    s16 x = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    s16 y = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    gGMData.ix = x << 8;
    gGMData.iy = y << 8;

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C0F0
u8 Event8D_WmNop(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        return EVC_ADVANCE_CONTINUE;
    }

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800C108
u8 Event8E_WmNop(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        return EVC_ADVANCE_CONTINUE;
    }

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800C120
u8 Event8F_WmNop(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        return EVC_ADVANCE_CONTINUE;
    }

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800C138
u8 Event90_WmAddPathDisplayed(struct EventEngineProc * proc)
{
    int pathId = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    if (EVENT_IS_SKIPPING(proc))
    {
        AddAndDrawGmPath(pathId, 0);
        return EVC_ADVANCE_CONTINUE;
    }

    AddAndDrawGmPath(pathId, 0x1e);
    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800C164
u8 Event91_WmAddPath(struct EventEngineProc * proc)
{
    struct WorldMapMainProc * worldMapProc;

    int pathId = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    AddGmPath(&gGMData, &gGMData.openPaths, pathId);

    GM_SCREEN->gmroute->flags |= 3;

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C198
u8 Event92_WmRemovePath(struct EventEngineProc * proc)
{
    struct WorldMapMainProc * worldMapProc;

    int pathId = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    RemoveGmPath(&gGMData, &gGMData.openPaths, pathId);

    GM_SCREEN->gmroute->flags |= 3;

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C1CC
u8 Event93_WmEnableNode(struct EventEngineProc * proc)
{
    int nodeId = EVT_CMD_ARG32_LE(proc->pEventCurrent);
    gGMData.nodes[nodeId].state |= 1;
    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C1E8
u8 Event94_WmDisableNode(struct EventEngineProc * proc)
{
    int nodeId = EVT_CMD_ARG32_LE(proc->pEventCurrent);
    gGMData.nodes[nodeId].state &= ~1;
    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C204
u8 Event95_WmEnableNodeDisplayed(struct EventEngineProc * proc)
{
    int nodeId = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    if (EVENT_IS_SKIPPING(proc))
    {
        gGMData.nodes[nodeId].state |= 1;
        return EVC_ADVANCE_CONTINUE;
    }

    if (!(gGMData.nodes[nodeId].state & 1))
    {
        StartGmBaseEntry(nodeId, 0, NULL);
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C254
u8 Event96_WmEnablePathTargetDisplayed(struct EventEngineProc * proc)
{
    int nodeId;
    int i;

    int pathId = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    for (i = 0; i < 2; i++)
    {
        nodeId = (pathId)[gWMPathData].node[i];

        if (!(gGMData.nodes[nodeId].state & 1))
        {
            break;
        }
    }

    if (i >= 2)
    {
        return EVC_ADVANCE_CONTINUE;
    }

    if (EVENT_IS_SKIPPING(proc))
    {
        gGMData.nodes[nodeId].state |= 1;
    }
    else
    {
        StartGmBaseEntry(nodeId, 0, NULL);
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C2DC
u8 Event97_WmInitNextStoryNode(struct EventEngineProc * proc)
{
    struct WorldMapMainProc * worldMapProc;

    int nodeId = WMLoc_GetNextLocId(gGMData.current_node);

    if (nodeId < 0)
    {
        return EVC_ADVANCE_CONTINUE;
    }

    if (EVENT_IS_SKIPPING(proc))
    {
        ResetGmStoryNode();
        gGMData.nodes[nodeId].state |= 1;
        gGMData.nodes[nodeId].state |= 2;

        GM_ICON->nodeId = nodeId;
        GM_ICON->unk_32_1 = 1;
    }
    else
    {
        if (!(gGMData.nodes[nodeId].state & 1))
        {
            StartGmBaseEntry(nodeId, 0, NULL);
            ResetGmStoryNode();
            gGMData.nodes[nodeId].state |= 2;
        }
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C36C
u8 Event98_WmSetNextStoryNodePath(struct EventEngineProc * proc)
{
    int nodeId;
    int i;
    struct WorldMapMainProc * worldMapProc;

    int pathId = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    for (i = 0; i < 2; i++)
    {
        nodeId = pathId[gWMPathData].node[i];
        if (!(gGMData.nodes[nodeId].state & 1))
        {
            break;
        }
    }

    if (i >= 2)
    {
        return EVC_ADVANCE_CONTINUE;
    }

    if (EVENT_IS_SKIPPING(proc))
    {
        gGMData.nodes[nodeId].state |= 1;
        gGMData.nodes[nodeId].state |= 2;

        GM_ICON->nodeId = nodeId;
        GM_ICON->unk_32_1 = 1;
    }
    else
    {
        StartGmBaseEntry(nodeId, 0, NULL);
        ResetGmStoryNode();
        gGMData.nodes[nodeId].state |= 2;
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C434
u8 Event99_GmNodeDisplayWait(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        if (GmBaseEntryExists())
        {
            EndGmBaseEntry();
        }

        return EVC_ADVANCE_CONTINUE;
    }

    if (!GmBaseEntryExists())
    {
        return EVC_ADVANCE_YIELD;
    }

    return EVC_STOP_YIELD;
}

//! FE8U = 0x0800C468
u8 Event9A_WmSetStoryNodeSilent(struct EventEngineProc * proc)
{
    struct WorldMapMainProc * worldMapProc;

    int nodeId = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    gGMData.nodes[nodeId].state |= 2;

    GM_ICON->nodeId = nodeId;
    GM_ICON->unk_32_1 = 1;

    if (EVENT_IS_SKIPPING(proc))
    {
        return EVC_ADVANCE_CONTINUE;
    }

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800C4C8
u8 Event9B_WmSetNextStoryNodeSilentNoFlag(struct EventEngineProc * proc)
{
    int nodeId = EVT_CMD_ARG32_LE(proc->pEventCurrent);
    gGMData.nodes[nodeId].state |= 2;

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C4E4
u8 Event9C_(struct EventEngineProc * proc)
{
    struct WorldMapMainProc * worldMapProc;

    int nodeId = WMLoc_GetNextLocId(gGMData.current_node);

    if (nodeId >= 0)
    {
        ResetGmStoryNode();

        gGMData.nodes[nodeId].state |= 2;

        GM_ICON->nodeId = nodeId;
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C528
u8 Event9D_(struct EventEngineProc * proc)
{
    int nodeId = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    gGMData.nodes[nodeId].state &= ~2;

    if (EVENT_IS_SKIPPING(proc))
    {
        return EVC_ADVANCE_CONTINUE;
    }

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800C55C
u8 Event9E_WmSetClassUnit(struct EventEngineProc * proc)
{
    u16 muId = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    u16 jid = EVT_CMD_ARGV(proc->pEventCurrent)[2];
    u16 allegiance = EVT_CMD_ARGV(proc->pEventCurrent)[3];
    u16 nodeId = EVT_CMD_ARGV(proc->pEventCurrent)[4];

    SetGmClassUnit(muId, jid, allegiance, nodeId);

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C574
u8 Event9F_WmSetCharUnit(struct EventEngineProc * proc)
{
    u16 muId = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    u16 pid = EVT_CMD_ARGV(proc->pEventCurrent)[2];
    u16 allegiance = EVT_CMD_ARGV(proc->pEventCurrent)[3];
    u16 nodeId = EVT_CMD_ARGV(proc->pEventCurrent)[4];

    SetGmCharUnit(muId, pid, allegiance, nodeId);

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C58C
u8 EventA0_WmRemoveUnit(struct EventEngineProc * proc)
{
    int muId = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    RemoveGmUnit(muId);
    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C59C
u8 EventA1_WmShowUnit(struct EventEngineProc * proc)
{
    int index = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    ShowGmUnit(index);
    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C5AC
u8 EventA2_WmHideUnit(struct EventEngineProc * proc)
{
    int index = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    HideGmUnit(index);
    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C5BC
u8 EventA3_WmShowUnitFaded(struct EventEngineProc * proc)
{
    struct WorldMapMainProc * worldMapProc;

    u16 index = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    s16 delay = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    if (EVENT_IS_SKIPPING(proc))
    {
        ShowGmUnit(index);
        return EVC_ADVANCE_CONTINUE;
    }
    GmMu_StartFadeIn(GM_MU, index, delay);
    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C5F8
u8 EventA4_WmHideUnitFaded(struct EventEngineProc * proc)
{
    struct WorldMapMainProc * worldMapProc;

    u16 index = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    s16 b = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    if (EVENT_IS_SKIPPING(proc))
    {
        HideGmUnit(index);
        return EVC_ADVANCE_CONTINUE;
    }

    GmMu_StartFadeOut(GM_MU, index, b);

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C634
u8 EventA5_WmUnitFadeWait(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        EndGmapUnitFade();
    }

    if (!GmUnitFadeExists())
    {
        return EVC_ADVANCE_YIELD;
    }

    return EVC_STOP_YIELD;
}

//! FE8U = 0x0800C65C
u8 EventA6_WmUnitSetOnNode(struct EventEngineProc * proc)
{
    struct WorldMapMainProc * worldMapProc;

    u16 unitId = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    u16 nodeId = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    gGMData.units[unitId].location = nodeId;

    GmMu_SetNode(GM_MU, unitId, nodeId);

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C68C
u8 EventA7_WmUnitSetPosition(struct EventEngineProc * proc)
{
    struct WorldMapMainProc * worldMapProc;

    s16 index = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    s16 x = EVT_CMD_ARGV(proc->pEventCurrent)[3];
    s16 y = EVT_CMD_ARGV(proc->pEventCurrent)[4];

    GmMu_SetPosition(GM_MU, index, x, y);

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C6C0
u8 EventA8_WmUnitMoveFree(struct EventEngineProc * proc)
{
    struct WorldMapMainProc * worldMapProc;
    struct Sub80C33D4 local;

    // Order needed to match
    u16 flag;
    u16 delay;
    u16 time;

    s16 index = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    u16 acceleration = EVT_CMD_ARGV(proc->pEventCurrent)[2];
    u16 x1 = EVT_CMD_ARGV(proc->pEventCurrent)[3];
    u16 y1 = EVT_CMD_ARGV(proc->pEventCurrent)[4];
    u16 x2 = EVT_CMD_ARGV(proc->pEventCurrent)[5];
    u16 y2 = EVT_CMD_ARGV(proc->pEventCurrent)[6];

    time = EVT_CMD_ARGV(proc->pEventCurrent)[7];
    flag = EVT_CMD_ARGV(proc->pEventCurrent)[8];
    delay = EVT_CMD_ARGV(proc->pEventCurrent)[9];

    if (EVENT_IS_SKIPPING(proc))
    {
        GmMu_SetPosition(GM_MU, index, x2, y2);

        if ((flag & 2) != 0)
        {
            HideGmUnit(index);
        }
    }
    else
    {
        local.wm_uid = index;
        local.unk_01 = acceleration;
        local.unk_02 = 0;
        local.x1 = x1;
        local.y1 = y1;
        local.x2 = x2;
        local.y2 = y2;
        local.speed = time;
        local.delay = delay;
        StartGmapAutoMu_Type1(&local, flag, NULL);
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C754
u8 EventA9_WmUnitMovePaths(struct EventEngineProc * proc)
{
    struct Sub80C3378 local;

    s16 wm_uid = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    u16 conf = EVT_CMD_ARGV(proc->pEventCurrent)[2];
    u16 node1 = EVT_CMD_ARGV(proc->pEventCurrent)[3];
    u16 node2 = EVT_CMD_ARGV(proc->pEventCurrent)[4];
    u16 speed = EVT_CMD_ARGV(proc->pEventCurrent)[5];
    u16 delay = EVT_CMD_ARGV(proc->pEventCurrent)[6];

    if (EVENT_IS_SKIPPING(proc))
    {
        gGMData.units[wm_uid].location = node2;

        if ((conf & 2) != 0)
        {
            HideGmUnit(wm_uid);
        }
    }
    else
    {
        local.wm_uid = wm_uid;
        local.unk_01 = 0;
        local.srcNode = node1;
        local.dstNode = node2;
        local.speed = speed;
        local.delay = delay;
        StartGmapAutoMu_Type0(&local, conf, NULL);
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C7B4
u8 EventAA_WmUnitPauseMove(struct EventEngineProc * proc)
{
    struct WorldMapMainProc * worldMapProc;

    s16 index = EVT_CMD_ARGV(proc->pEventCurrent)[1];

    if (!EVENT_IS_SKIPPING(proc))
    {
        GmMu_PauseMovement(GM_MU, index);
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C7E4
u8 EventAB_WmUnitResumeMove(struct EventEngineProc * proc)
{
    struct WorldMapMainProc * worldMapProc;

    s16 index = EVT_CMD_ARGV(proc->pEventCurrent)[1];

    if (!EVENT_IS_SKIPPING(proc))
    {
        GmMu_ResumeMovement(GM_MU, index);
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C814
u8 EventAC_WmUnitMoveWait(struct EventEngineProc * proc)
{
    s16 unitId = EVT_CMD_ARGV(proc->pEventCurrent)[1];

    if (EVENT_IS_SKIPPING(proc))
    {
        if (IsGmAutoMuActiveFor(unitId))
        {
            EndGmAutoMuFor(unitId);
        }

        return EVC_ADVANCE_CONTINUE;
    }

    if (!IsGmAutoMuActiveFor(unitId))
    {
        return EVC_ADVANCE_YIELD;
    }

    return EVC_STOP_YIELD;
}

//! FE8U = 0x0800C85C
u8 EventAD_WmFadeToDarker(struct EventEngineProc * proc)
{
    int a = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    if (EVENT_IS_SKIPPING(proc))
    {
        StartGmPalFade_(NULL, 0);
        return EVC_ADVANCE_CONTINUE;
    }

    StartGmPalFade_(NULL, a);
    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C884
u8 EventAE_WmFadeToDarkerWait(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        EndGmPalFade();
        return EVC_ADVANCE_CONTINUE;
    }

    if (!IsGmPalFadeActive())
    {
        return EVC_ADVANCE_YIELD;
    }

    return EVC_STOP_YIELD;
}

//! FE8U = 0x0800C8B0
u8 EventAF_WmShowTextBox(struct EventEngineProc * proc)
{
    u16 speed = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    u16 blend = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    if (!EVENT_IS_SKIPPING(proc))
    {
        GmMuEntryStartShow(speed, blend);
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C8D4
u8 EventB0_WmHideTextBox_Bugged(struct EventEngineProc * proc)
{
    u16 a = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    u16 b = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    if (!EVENT_IS_SKIPPING(proc))
    {
        GmMuEntryStartHide(a, b);
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C8F8
u8 EventB1_WmTextBoxWait(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        EndGmMuEntry();
        return EVC_ADVANCE_CONTINUE;
    }

    if (!GetGmMuEntryFlag())
    {
        return EVC_ADVANCE_YIELD;
    }

    return EVC_STOP_YIELD;
}

//! FE8U = 0x0800C924
u8 EventB2_WmFancyFade(struct EventEngineProc * proc)
{
    int a = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    StartGmapLineFade(a, NULL);

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800C938
u8 EventB3_WmFancyFadeWait(struct EventEngineProc * proc)
{
    if (!IsGmapLineFadeActive())
    {
        return EVC_ADVANCE_YIELD;
    }

    return EVC_STOP_YIELD;
}

//! FE8U = 0x0800C950
u8 EventB4_WmDisplayBigMap(struct EventEngineProc * proc)
{
    u16 x = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    u16 y = EVT_CMD_ARGV(proc->pEventCurrent)[2];
    int c = EVT_CMD_ARG32_LE(proc->pEventCurrent + 2);

    if (!EVENT_IS_SKIPPING(proc))
    {
        StartGmapRm((s16)x, (s16)y, c, NULL);
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C980
u8 EventB5_WmHideBigMap(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        GmapRm_EndAll();
        return EVC_ADVANCE_CONTINUE;
    }

    GmapRm_SetUnblocked();
    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C9A0
u8 EventB6_WmMoveBigMap(struct EventEngineProc * proc)
{
    u16 x1 = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    u16 y1 = EVT_CMD_ARGV(proc->pEventCurrent)[2];
    u16 x2 = EVT_CMD_ARGV(proc->pEventCurrent)[3];
    u16 y2 = EVT_CMD_ARGV(proc->pEventCurrent)[4];
    u16 speed = EVT_CMD_ARGV(proc->pEventCurrent)[5];
    u16 delay = EVT_CMD_ARGV(proc->pEventCurrent)[6];

    if (!EVENT_IS_SKIPPING(proc))
    {
        StartGmapRmUpdateExt((s16)x1, (s16)y1, (s16)x2, (s16)y2, (s16)speed, (s16)delay, NULL);
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C9F0
u8 EventB7_WmBigMapWait(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        GmapRm_EndAll();
        return EVC_ADVANCE_CONTINUE;
    }

    if (GmapRMExists())
    {
        return EVC_STOP_YIELD;
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800CA18
u8 EventB8_WmShowBigMapHighlight(struct EventEngineProc * proc)
{
    int nation = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    if (!EVENT_IS_SKIPPING(proc))
    {
        WmShowNationHighlightedMap(nation, NULL);
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800CA38
u8 EventB9_WmRemoveHighlightNationPart1(struct EventEngineProc * proc)
{
    int a = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    if (EVENT_IS_SKIPPING(proc))
    {
        EndGmapRmBorder1(-1);

        return EVC_ADVANCE_CONTINUE;
    }

    sub_80C2C10(a);

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800CA60
u8 EventBA_WmRemoveHighlightNationPart2(struct EventEngineProc * proc)
{
    int a = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    if (EVENT_IS_SKIPPING(proc))
    {
        if (sub_80C2BC4(a))
        {
            EndGmapRmBorder1(a);
        }

        return EVC_ADVANCE_CONTINUE;
    }

    if (!sub_80C2BC4(a))
    {
        return EVC_ADVANCE_YIELD;
    }

    return EVC_STOP_YIELD;
}

//! FE8U = 0x0800CA9C
u8 EventBB_(struct EventEngineProc * proc)
{
    s16 a = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    s16 b = EVT_CMD_ARGV(proc->pEventCurrent)[2];
    s16 c = EVT_CMD_ARGV(proc->pEventCurrent)[3];
    s16 d = EVT_CMD_ARGV(proc->pEventCurrent)[4];
    int e = EVT_CMD_ARG32_LE(proc->pEventCurrent + 4);

    if (!EVENT_IS_SKIPPING(proc))
    {
        StartWmPlaceDot(a, b, c, d, e, NULL);
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800CADC
u8 EventBC_MarkPoint(struct EventEngineProc * proc)
{
    s16 a = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    s16 pal = EVT_CMD_ARGV(proc->pEventCurrent)[2];
    s16 nodeId = EVT_CMD_ARGV(proc->pEventCurrent)[3];
    s16 eff = EVT_CMD_ARGV(proc->pEventCurrent)[4];

    if (!EVENT_IS_SKIPPING(proc))
    {
        s16 x;
        s16 y;
        *&x = nodeId[gWMNodeData].x;
        *&y = nodeId[gWMNodeData].y;
        StartWmPlaceDot(a, pal, x / 2, y / 2, eff, NULL);
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800CB48
u8 EventBD_(struct EventEngineProc * proc)
{
    int a = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    if (EVENT_IS_SKIPPING(proc))
    {
        EndWmPlaceDotByIndex(-1);

        return EVC_ADVANCE_CONTINUE;
    }

    SetWmPlaceDotFlagForIndex(a);

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800CB70
u8 EventBE_(struct EventEngineProc * proc)
{
    int a = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    if (EVENT_IS_SKIPPING(proc))
    {
        if (IsWmPlaceDotActiveAtIndex(a))
        {
            EndWmPlaceDotByIndex(a);
        }

        return EVC_ADVANCE_CONTINUE;
    }

    if (!IsWmPlaceDotActiveAtIndex(a))
    {
        return EVC_ADVANCE_YIELD;
    }

    return EVC_STOP_YIELD;
}

//! FE8U = 0x0800CBAC
u8 EventBF_(struct EventEngineProc * proc)
{
    sub_80B9FD4(GM_MAIN);
    sub_80B9810(GM_MAIN);
    Make6C_SaveMenuPostChapter(proc);

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800CBD8
u8 EventC0_(struct EventEngineProc * proc)
{
    sub_80B9154(GM_MAIN);
    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800CBF0
u8 EventC1_SKIPWM(struct EventEngineProc * proc)
{
    gGMData.state.bits.state_6 = 1;
    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800CC04
u8 EventC2_WmNoFade(struct EventEngineProc * proc)
{
    gGMData.state.bits.state_7 = 1;
    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800CC18
u8 EventC3_SpawnLord(struct EventEngineProc * proc)
{
    u16 unitId = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    u16 pid = EVT_CMD_ARGV(proc->pEventCurrent)[2];
    int nodeId = EVT_CMD_ARG32_LE(proc->pEventCurrent + 2);

    if (!(gGMData.units[unitId].state & 2))
    {
        if (gGMData.units[unitId].id == pid)
        {
            return EVC_ADVANCE_CONTINUE;
        }
    }
    else if (pid == 0)
    {
        return EVC_ADVANCE_CONTINUE;
    }

    SetGmCharUnit(unitId, pid, -1, nodeId);

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800CC5C
u8 EventCE_(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        return EVC_ADVANCE_CONTINUE;
    }

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800CC74
u8 EventCF_(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        return EVC_ADVANCE_CONTINUE;
    }

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800CC8C
u8 EventC4_WmShowPortrait(struct EventEngineProc * proc)
{
    s16 face_slot = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    s16 fid = EVT_CMD_ARGV(proc->pEventCurrent)[2];
    s16 config = EVT_CMD_ARGV(proc->pEventCurrent)[3];
    s16 delay = EVT_CMD_ARGV(proc->pEventCurrent)[4];

    if (EVENT_IS_SKIPPING(proc))
    {
        return EVC_ADVANCE_CONTINUE;
    }

    if (delay)
    {
        WmMergeFace(delay, 6, face_slot, fid, 0, 0, config);
    }
    else
    {
        WmDrawFace(face_slot, fid, config);
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800CCE8
void nop_800CCE8(void)
{
    return;
}

//! FE8U = 0x0800CCEC
void nullsub_32(void)
{
    return;
}

//! FE8U = 0x0800CCF0
u8 EventC5_WmClearPortrait(struct EventEngineProc * proc)
{

    u32 face_slot = (u16)EVT_CMD_ARGV(proc->pEventCurrent)[0];
    u32 config = (u16)EVT_CMD_ARGV(proc->pEventCurrent)[1];
    u16 delay = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    if (EVENT_IS_SKIPPING(proc))
    {
        EndFaceById(face_slot);
        return EVC_ADVANCE_CONTINUE;
    }

    if (delay)
    {
        WmMergeFace(delay, 7, face_slot, 0, 0, 0, config);
    }
    else
    {
        WmClearFace(face_slot, config);
    }

    return EVC_ADVANCE_CONTINUE;
}



//! FE8U = 0x0800CD38
void nop_800CD38(struct Proc8591C68 * proc)
{
    return;
}

//! FE8U = 0x0800CD3C
void nullsub_34(struct Proc8591C68 * proc)
{
    return;
}

//! FE8U = 0x0800CD40
void EventFaceDeamonDelete(struct Proc8591C68 * proc)
{
    EndFaceById(proc->faceSlot);
    return;
}

//! FE8U = 0x0800CD50
u8 EventC6_WmDisplayText(struct EventEngineProc * proc)
{
    u16 a;
    u16 b;

    if (EVENT_IS_SKIPPING(proc))
    {
        return EVC_ADVANCE_CONTINUE;
    }

    a = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    b = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    StartWmTextMsg(a | b);

    if (proc->evStateBits & EV_STATE_0020)
    {
        SetTalkFlag(TALK_FLAG_NOSKIP);
    }

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800CD88
u8 EventC7_(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        return EVC_ADVANCE_CONTINUE;
    }

    ShowWmText(1);

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800CDA8
u8 EventC8_(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        return EVC_ADVANCE_CONTINUE;
    }

    ShowWmText(0);

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800CDC8
u8 EventC9_RemoveWmText(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        HideWmText();
        return EVC_ADVANCE_CONTINUE;
    }

    HideWmText();

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800CDE8
void sub_800CDE8(void)
{
    return;
}

//! FE8U = 0x0800CDEC
void sub_800CDEC(void)
{
    return;
}

//! FE8U = 0x0800CDF0
u8 EventCA_(struct EventEngineProc * proc)
{
    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800CDF4
u8 EventCB_(struct EventEngineProc * proc)
{
    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800CDF8
u8 EventCC_(struct EventEngineProc * proc)
{
    s16 a = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    s16 b = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    s16 c = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    if (!EVENT_IS_SKIPPING(proc))
    {
        sub_80B8188(b, c, a);
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800CE28
u8 EventCD_(struct EventEngineProc * proc)
{
    if (!EVENT_IS_SKIPPING(proc))
    {
        nullsub_7();
    }

    return EVC_ADVANCE_CONTINUE;
}
