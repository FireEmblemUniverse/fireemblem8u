#include "global.h"

#include "hardware.h"
#include "bm.h"
#include "chapterdata.h"
#include "bmmap.h"
#include "bmudisp.h"
#include "bmtrick.h"
#include "bksel.h"
#include "bmunit.h"
#include "prepscreen.h"
#include "ekrbattle.h"
#include "bmlib.h"
#include "worldmap.h"
#include "face.h"
#include "scene.h"
#include "savemenu.h"

#include "event.h"

void GetWMCenteredCameraPosition(s16, s16, s16 *, s16 *);

// TODO: In "worldmap_scrollmanage.c", the signature returns a ProcPtr instead of s8/bool
s8 FindGmScrollManage(void);

//! FE8U = 0x0800B910
void sub_800B910(u8 bg1, u8 bg2, u8 c)
{
    CpuFastCopy(
        (void *)(0x6000000 + GetBackgroundTileDataOffset(bg1)),
        (void *)(0x6000000 + GetBackgroundTileDataOffset(bg2)), c * 0x800);
    return;
}

//! FE8U = 0x0800B954
void sub_800B954(u8 a, u8 bg, u8 c)
{
    u16 * gUnknown_080D792C[4] = {
        gBG0TilemapBuffer,
        gBG1TilemapBuffer,
        gBG2TilemapBuffer,
        gBG3TilemapBuffer,
    };

    CpuFastCopy(gUnknown_080D792C[a], gUnknown_080D792C[bg], c * 0x800);
    BG_EnableSyncByMask(1 << bg);

    return;
}

//! FE8U = 0x0800B994
void sub_800B994(u8 a, u8 b, u8 c)
{
    CpuFastCopy(a * 0x10 + gPaletteBuffer, b * 0x10 + gPaletteBuffer, c * 0x20);
    EnablePaletteSync();

    return;
}

//! FE8U = 0x0800B9B8
void sub_800B9B8(u8 bg, u8 b)
{
    u16 i;

    u16 * buf = BG_GetMapBuffer(bg);

    for (i = 0; i < 0x400; i++)
    {
        int tmp = *buf;
        u8 a = (tmp >> 0xc);
        a += b;

        *buf &= 0xfff;
        *buf |= ((a) << 0xc);
        buf++;
    }

    BG_EnableSyncByMask(1 << bg);

    return;
}

//! FE8U = 0x0800BA04
void sub_800BA04(u8 a, u8 b)
{
    u16 * palPtr = gPaletteBuffer + a * 0x10;

    u16 * ptr = (void *)gLoadUnitBuffer;
    *ptr++ = a;
    *ptr++ = b;

    CpuFastCopy(palPtr, (u16 *)gLoadUnitBuffer + 2, b * 0x20);
}

//! FE8U = 0x0800BA34
void sub_800BA34(void)
{
    u16 * ptr = (void *)gLoadUnitBuffer;

    int b = *ptr++;
    int c = *ptr++;

    CpuFastCopy(ptr, gPaletteBuffer + b * 0x10, c * 0x20);
    EnablePaletteSync();
    return;
}

//! FE8U = 0x0800BA5C
void SetSomeRealCamPos(int x, int y, s8 unk)
{
    int xOut;
    int yOut;

    if (unk == 1)
    {
        StoreAdjustedCameraPositions(x, y, &xOut, &yOut);
        gBmSt.camera.x = xOut * 16;
        gBmSt.camera.y = yOut * 16;
    }
    else
    {
        gBmSt.camera.x = GetCameraAdjustedX(x * 16);
        gBmSt.camera.y = GetCameraAdjustedY(y * 16);
    }

    return;
}

//! FE8U = 0x0800BAA8
void EventSetFogVisionExt(s16 visionRange, s8 flag, ProcPtr parent)
{
    if (visionRange < 0)
    {
        visionRange = GetROMChapterStruct(gPlaySt.chapterIndex)->initialFogLevel;
    }

    if (flag == 1)
    {
        RenderBmMapOnBg2();
    }

    gPlaySt.chapterVisionRange = visionRange;

    RefreshEntityBmMaps();
    RefreshUnitSprites();
    RenderBmMap();

    if (flag == 1)
    {
        MakeNew6CBMXFADE2(1, parent);
    }

    return;
}

//! FE8U = 0x0800BAF8
void TriggerMapChanges(u16 id, s8 flag, ProcPtr parent)
{
    if (IsMapChangeEnabled(id))
    {
        return;
    }

    if (flag == 1)
    {
        RenderBmMapOnBg2();
    }

    ApplyMapChangesById(id);
    EnableMapChange(id);

    RefreshTerrainBmMap();
    UpdateRoofedUnits();
    RenderBmMap();

    if (flag == 1)
    {
        MakeNew6CBMXFADE2(1, parent);
    }

    return;
}

//! FE8U = 0x0800BB48
void UntriggerMapChange(u16 id, s8 flag, ProcPtr parent)
{
    if (IsMapChangeEnabled(id) != 1)
    {
        return;
    }
    if (flag == 1)
    {
        RenderBmMapOnBg2();
    }

    RevertMapChange(id);
    DisableMapChange(id);

    RefreshTerrainBmMap();
    UpdateRoofedUnits();
    RenderBmMap();

    if (flag == 1)
    {
        MakeNew6CBMXFADE2(1, parent);
    }

    return;
}

//! FE8U = 0x0800BB98
void sub_800BB98(void)
{
    s8 found = Proc_Find(gProcScr_BKSEL) != NULL;

    if (found)
    {
        InitBattleForecastFramePalettes();
    }

    return;
}

//! FE8U = 0x0800BBB4
s8 sub_800BBB4(u16 pid)
{
    int i;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        if (unit->pCharacterData->number != pid)
        {
            continue;
        }

        return 1;
    }

    return 0;
}

//! FE8U = 0x0800BBE4
u16 sub_800BBE4(void)
{
    int i;

    u16 count = 0;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        if (unit->state & US_DEAD)
        {
            continue;
        }

        count++;
    }

    return count;
}

//! FE8U = 0x0800BC1C
void HideAllUnits(void)
{
    int i;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        if (unit->state & US_DEAD)
        {
            continue;
        }

        unit->state |= US_HIDDEN;
    }

    return;
}

//! FE8U = 0x0800BC50
struct Unit * GetUnitStructFromEventParameter(s16 pid)
{
    if (pid < -3)
    {
        return NULL;
    }

    switch (pid)
    {
        case -3:
            pid = (u16)gEventSlots[2];
            break;

        case -2:
            if (gBmMapUnit[((u16 *)(gEventSlots + 0xB))[1]][((u16 *)(gEventSlots + 0xB))[0]] != 0)
            {
                return GetUnit(gBmMapUnit[((u16 *)(gEventSlots + 0xB))[1]][((u16 *)(gEventSlots + 0xB))[0]]);
            }
            else
            {
                #ifndef NONMATCHING
                asm(""); // :/
                #endif
                return NULL;
            }

        case -1:
            return gActiveUnit;

        case 0:
            pid = GetPlayerLeaderUnitId();
            break;
    }

    return GetUnitFromCharId(pid);
}

extern u16 unit_icon_pal_npc[];
extern u16 gPal_MapSpriteSepia[];
extern u16 unit_icon_pal_enemy[];
extern u16 gPal_MapSprite[];

//! FE8U = 0x0800BCDC
void sub_800BCDC(u16 palId)
{
    if (IsBattleDeamonActive())
    {
        return;
    }

    SetupMapSpritesPalettes();

    switch (palId & 0xf)
    {
        case 2:
            ApplyPalette(unit_icon_pal_enemy, 0x1C);
            break;

        case 3:
            ApplyPalette(unit_icon_pal_npc, 0x1C);
            break;

        case 4:
            ApplyPalette(gPal_MapSpriteSepia, 0x1C);
            break;
    }

    switch ((palId >> 4) & 0xf)
    {
        case 1:
            ApplyPalette(gPal_MapSprite, 0x1D);
            break;

        case 3:
            ApplyPalette(unit_icon_pal_npc, 0x1D);
            break;

        case 4:
            ApplyPalette(gPal_MapSpriteSepia, 0x1D);
            break;
    }

    switch ((palId >> 8) & 0xf)
    {
        case 1:
            ApplyPalette(gPal_MapSprite, 0x1E);
            break;

        case 2:
            ApplyPalette(unit_icon_pal_enemy, 0x1E);
            break;

        case 4:
            ApplyPalette(gPal_MapSpriteSepia, 0x1E);
            break;
    }

    return;
}

//! FE8U = 0x0800BDCC
u8 Event80_WmSkip_Unsure(struct EventEngineProc * proc)
{
    int a = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    sub_80BA008(a);
    nullsub_5(a);

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

    gGMData.unk08 = x << 8;
    gGMData.unk0C = y << 8;

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

    worldMapProc = Proc_Find(gProcScr_WorldMapMain);
    worldMapProc->unk_44->unk_4c->flags |= 3;

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C198
u8 Event92_WmRemovePath(struct EventEngineProc * proc)
{
    struct WorldMapMainProc * worldMapProc;

    int pathId = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    RemoveGmPath(&gGMData, &gGMData.openPaths, pathId);

    worldMapProc = Proc_Find(gProcScr_WorldMapMain);
    worldMapProc->unk_44->unk_4c->flags |= 3;

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

    int nodeId = WMLoc_GetNextLocId(gGMData.unk_c8);

    if (nodeId < 0)
    {
        return EVC_ADVANCE_CONTINUE;
    }

    if (EVENT_IS_SKIPPING(proc))
    {
        sub_80BCFB4();
        gGMData.nodes[nodeId].state |= 1;
        gGMData.nodes[nodeId].state |= 2;

        worldMapProc = Proc_Find(gProcScr_WorldMapMain);
        worldMapProc->unk_48->nodeId = nodeId;

        worldMapProc = Proc_Find(gProcScr_WorldMapMain);
        worldMapProc->unk_48->unk_32_1 = 1;
    }
    else
    {
        if (!(gGMData.nodes[nodeId].state & 1))
        {
            StartGmBaseEntry(nodeId, 0, NULL);
            sub_80BCFB4();
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

        worldMapProc = Proc_Find(gProcScr_WorldMapMain);
        worldMapProc->unk_48->nodeId = nodeId;

        worldMapProc = Proc_Find(gProcScr_WorldMapMain);
        worldMapProc->unk_48->unk_32_1 = 1;
    }
    else
    {
        StartGmBaseEntry(nodeId, 0, NULL);
        sub_80BCFB4();
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

    worldMapProc = Proc_Find(gProcScr_WorldMapMain);
    worldMapProc->unk_48->nodeId = nodeId;

    worldMapProc = Proc_Find(gProcScr_WorldMapMain);
    worldMapProc->unk_48->unk_32_1 = 1;

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

    int nodeId = WMLoc_GetNextLocId(gGMData.unk_c8);

    if (nodeId >= 0)
    {
        sub_80BCFB4();

        gGMData.nodes[nodeId].state |= 2;

        worldMapProc = Proc_Find(gProcScr_WorldMapMain);
        worldMapProc->unk_48->nodeId = nodeId;
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
    s16 b = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    if (EVENT_IS_SKIPPING(proc))
    {
        ShowGmUnit(index);
        return EVC_ADVANCE_CONTINUE;
    }

    worldMapProc = Proc_Find(gProcScr_WorldMapMain);
    GmMu_StartFadeIn(worldMapProc->unk_54, index, b);

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

    worldMapProc = Proc_Find(gProcScr_WorldMapMain);
    GmMu_StartFadeOut(worldMapProc->unk_54, index, b);

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

    worldMapProc = Proc_Find(gProcScr_WorldMapMain);
    GmMu_SetNode(worldMapProc->unk_54, unitId, nodeId);

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C68C
u8 EventA7_WmUnitSetPosition(struct EventEngineProc * proc)
{
    struct WorldMapMainProc * worldMapProc;

    s16 index = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    s16 x = EVT_CMD_ARGV(proc->pEventCurrent)[3];
    s16 y = EVT_CMD_ARGV(proc->pEventCurrent)[4];

    worldMapProc = Proc_Find(gProcScr_WorldMapMain);
    GmMu_SetPosition(worldMapProc->unk_54, index, x, y);

    return EVC_ADVANCE_CONTINUE;
}

struct Sub80C33D4
{
    /* 00 */ u8 unk_00;
    /* 01 */ u8 unk_01;
    /* 02 */ u8 unk_02;
    /* 04 */ u16 unk_04;
    /* 06 */ u16 unk_06;
    /* 08 */ u16 unk_08;
    /* 0A */ u16 unk_0a;
    /* 0C */ u16 unk_0c;
    /* 0E */ u16 unk_0e;
    /* 10 */ int unk_10;
};

//! FE8U = 0x0800C6C0
u8 EventA8_WmUnitMoveFree(struct EventEngineProc * proc)
{
    struct WorldMapMainProc * worldMapProc;
    struct Sub80C33D4 local;

    // Order needed to match
    u16 r4;
    u16 r8;
    u16 r9;

    s16 index = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    u16 r2 = EVT_CMD_ARGV(proc->pEventCurrent)[2];
    u16 r3 = EVT_CMD_ARGV(proc->pEventCurrent)[3];
    u16 ip = EVT_CMD_ARGV(proc->pEventCurrent)[4];
    u16 x = EVT_CMD_ARGV(proc->pEventCurrent)[5];
    u16 y = EVT_CMD_ARGV(proc->pEventCurrent)[6];

    r9 = EVT_CMD_ARGV(proc->pEventCurrent)[7];
    r4 = EVT_CMD_ARGV(proc->pEventCurrent)[8];
    r8 = EVT_CMD_ARGV(proc->pEventCurrent)[9];

    if (EVENT_IS_SKIPPING(proc))
    {
        worldMapProc = Proc_Find(gProcScr_WorldMapMain);
        GmMu_SetPosition(worldMapProc->unk_54, index, x, y);

        if ((r4 & 2) != 0)
        {
            HideGmUnit(index);
        }
    }
    else
    {
        local.unk_00 = index;
        local.unk_01 = r2;
        local.unk_02 = 0;
        local.unk_06 = r3;
        local.unk_08 = ip;
        local.unk_0a = x;
        local.unk_0c = y;
        local.unk_10 = r9;
        local.unk_0e = r8;
        sub_80C33D4(&local, r4, 0);
    }

    return EVC_ADVANCE_CONTINUE;
}

struct Sub80C3378
{
    /* 00 */ u8 unk_00;
    /* 01 */ u8 unk_01;
    /* 02 */ u8 unk_02;
    /* 04 */ u16 unk_04;
    /* 06 */ u16 unk_06;
    /* 08 */ u16 unk_08;
    /* 0A */ u16 unk_0a;
    /* 0C */ int unk_0c;
};

//! FE8U = 0x0800C754
u8 EventA9_WmUnitMovePaths(struct EventEngineProc * proc)
{
    struct Sub80C3378 local;

    s16 r3 = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    u16 r2 = EVT_CMD_ARGV(proc->pEventCurrent)[2];
    u16 r5 = EVT_CMD_ARGV(proc->pEventCurrent)[3];
    u16 r4 = EVT_CMD_ARGV(proc->pEventCurrent)[4];
    u16 r6 = EVT_CMD_ARGV(proc->pEventCurrent)[5];
    u16 r7 = EVT_CMD_ARGV(proc->pEventCurrent)[6];

    if (EVENT_IS_SKIPPING(proc))
    {
        gGMData.units[r3].location = r4;

        if ((r2 & 2) != 0)
        {
            HideGmUnit(r3);
        }
    }
    else
    {
        local.unk_00 = r3;
        local.unk_01 = 0;
        local.unk_06 = r5;
        local.unk_08 = r4;
        local.unk_0c = r6;
        local.unk_0a = r7;
        sub_80C3378(&local, r2, 0);
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
        worldMapProc = Proc_Find(gProcScr_WorldMapMain);
        GmMu_PauseMovement(worldMapProc->unk_54, index);
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
        worldMapProc = Proc_Find(gProcScr_WorldMapMain);
        GmMu_ResumeMovement(worldMapProc->unk_54, index);
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C814
u8 EventAC_WmUnitMoveWait(struct EventEngineProc * proc)
{
    s16 a = EVT_CMD_ARGV(proc->pEventCurrent)[1];

    if (EVENT_IS_SKIPPING(proc))
    {
        if (sub_80C3484(a))
        {
            sub_80C343C(a);
        }

        return EVC_ADVANCE_CONTINUE;
    }

    if (!sub_80C3484(a))
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
    u16 a = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    u16 b = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    if (!EVENT_IS_SKIPPING(proc))
    {
        GmMuEntryStartShow(a, b);
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
    u16 a = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    u16 b = EVT_CMD_ARGV(proc->pEventCurrent)[2];
    int c = EVT_CMD_ARG32_LE(proc->pEventCurrent + 2);

    if (!EVENT_IS_SKIPPING(proc))
    {
        Make6C_Gmap_RM(a, b, c, 0);
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C980
u8 EventB5_WmHideBigMap(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        sub_80C24F8();
        return EVC_ADVANCE_CONTINUE;
    }

    sub_80C24D8();
    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C9A0
u8 EventB6_WmMoveBigMap(struct EventEngineProc * proc)
{
    u16 r1 = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    u16 r2 = EVT_CMD_ARGV(proc->pEventCurrent)[2];
    u16 r3 = EVT_CMD_ARGV(proc->pEventCurrent)[3];
    u16 r4 = EVT_CMD_ARGV(proc->pEventCurrent)[4];
    u16 r6 = EVT_CMD_ARGV(proc->pEventCurrent)[5];
    u16 r7 = EVT_CMD_ARGV(proc->pEventCurrent)[6];

    if (!EVENT_IS_SKIPPING(proc))
    {
        sub_80C1F18(r1, r2, r3, r4, r6, r7, 0);
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800C9F0
u8 EventB7_WmBigMapWait(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        sub_80C24F8();
        return EVC_ADVANCE_CONTINUE;
    }

    if (sub_80C2470())
    {
        return EVC_STOP_YIELD;
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800CA18
u8 EventB8_WmShowBigMapHighlight(struct EventEngineProc * proc)
{
    int a = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    if (!EVENT_IS_SKIPPING(proc))
    {
        sub_80C2AD4(a, 0);
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800CA38
u8 EventB9_(struct EventEngineProc * proc)
{
    int a = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    if (EVENT_IS_SKIPPING(proc))
    {
        sub_80C2B7C(-1);

        return EVC_ADVANCE_CONTINUE;
    }

    sub_80C2C10(a);

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800CA60
u8 EventBA_(struct EventEngineProc * proc)
{
    int a = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    if (EVENT_IS_SKIPPING(proc))
    {
        if (sub_80C2BC4(a))
        {
            sub_80C2B7C(a);
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
    u16 a = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    u16 b = EVT_CMD_ARGV(proc->pEventCurrent)[2];
    u16 c = EVT_CMD_ARGV(proc->pEventCurrent)[3];
    u16 d = EVT_CMD_ARGV(proc->pEventCurrent)[4];
    int e = EVT_CMD_ARG32_LE(proc->pEventCurrent + 4);

    if (!EVENT_IS_SKIPPING(proc))
    {
        sub_80C2FC0(a, b, c, d, e, 0);
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800CADC
u8 EventBC_(struct EventEngineProc * proc)
{
    u16 a = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    u16 b = EVT_CMD_ARGV(proc->pEventCurrent)[2];
    s16 nodeId = EVT_CMD_ARGV(proc->pEventCurrent)[3];
    s16 d = EVT_CMD_ARGV(proc->pEventCurrent)[4];

    if (!EVENT_IS_SKIPPING(proc))
    {
        s16 x;
        s16 y;
        *&x = nodeId[gWMNodeData].x;
        *&y = nodeId[gWMNodeData].y;
        sub_80C2FC0(a, b, x / 2, y / 2, d, 0);
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800CB48
u8 EventBD_(struct EventEngineProc * proc)
{
    int a = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    if (EVENT_IS_SKIPPING(proc))
    {
        sub_80C304C(-1);

        return EVC_ADVANCE_CONTINUE;
    }

    sub_80C30E0(a);

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800CB70
u8 EventBE_(struct EventEngineProc * proc)
{
    int a = EVT_CMD_ARG32_LE(proc->pEventCurrent);

    if (EVENT_IS_SKIPPING(proc))
    {
        if (sub_80C3094(a))
        {
            sub_80C304C(a);
        }

        return EVC_ADVANCE_CONTINUE;
    }

    if (!sub_80C3094(a))
    {
        return EVC_ADVANCE_YIELD;
    }

    return EVC_STOP_YIELD;
}

//! FE8U = 0x0800CBAC
u8 EventBF_(struct EventEngineProc * proc)
{
    sub_80B9FD4(Proc_Find(gProcScr_WorldMapMain));
    sub_80B9810(Proc_Find(gProcScr_WorldMapMain));
    Make6C_SaveMenuPostChapter(proc);

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800CBD8
u8 EventC0_(struct EventEngineProc * proc)
{
    sub_80B9154(Proc_Find(gProcScr_WorldMapMain));
    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800CBF0
u8 EventC1_SKIPWM(struct EventEngineProc * proc)
{
    gGMData.state.bits.state_6 = 1;
    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800CC04
u8 EventC2_(struct EventEngineProc * proc)
{
    gGMData.state.bits.state_7 = 1;
    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800CC18
u8 EventC3_(struct EventEngineProc * proc)
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
u8 EventC4_(struct EventEngineProc * proc)
{
    s16 a = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    s16 b = EVT_CMD_ARGV(proc->pEventCurrent)[2];
    s16 c = EVT_CMD_ARGV(proc->pEventCurrent)[3];
    s16 d = EVT_CMD_ARGV(proc->pEventCurrent)[4];

    if (EVENT_IS_SKIPPING(proc))
    {
        return EVC_ADVANCE_CONTINUE;
    }

    if (d)
    {
        sub_80BA0B4(d, 6, a, b, 0, 0, c);
    }
    else
    {
        sub_80B86CC(a, b, c);
    }

    return EVC_ADVANCE_CONTINUE;
}

//! FE8U = 0x0800CCE8
void sub_800CCE8(void)
{
    return;
}

//! FE8U = 0x0800CCEC
void nullsub_32(void)
{
    return;
}

//! FE8U = 0x0800CCF0
u8 EventC5_(struct EventEngineProc * proc)
{

    u32 a = (u16)EVT_CMD_ARGV(proc->pEventCurrent)[0];
    u32 b = (u16)EVT_CMD_ARGV(proc->pEventCurrent)[1];
    u16 c = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    if (EVENT_IS_SKIPPING(proc))
    {
        EndFaceById(a);
        return EVC_ADVANCE_CONTINUE;
    }

    if (c)
    {
        sub_80BA0B4(c, 7, a, 0, 0, 0, b);
    }
    else
    {
        sub_80B8844(a, b);
    }

    return EVC_ADVANCE_CONTINUE;
}

struct Proc8591C68
{
    /* 00 */ PROC_HEADER;
    /* 2A */ s16 faceSlot;
};

//! FE8U = 0x0800CD38
void sub_800CD38(struct Proc8591C68 * proc)
{
    return;
}

//! FE8U = 0x0800CD3C
void nullsub_34(struct Proc8591C68 * proc)
{
    return;
}

//! FE8U = 0x0800CD40
void sub_800CD40(struct Proc8591C68 * proc)
{
    EndFaceById(proc->faceSlot);
    return;
}

//! FE8U = 0x0800CD50
u8 EventC6_(struct EventEngineProc * proc)
{
    u16 a;
    u16 b;

    if (EVENT_IS_SKIPPING(proc))
    {
        return EVC_ADVANCE_CONTINUE;
    }

    a = EVT_CMD_ARGV(proc->pEventCurrent)[1];
    b = EVT_CMD_ARGV(proc->pEventCurrent)[2];

    sub_80C36A0(a | b);

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

    sub_80C3624(1);

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800CDA8
u8 EventC8_(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        return EVC_ADVANCE_CONTINUE;
    }

    sub_80C3624(0);

    return EVC_ADVANCE_YIELD;
}

//! FE8U = 0x0800CDC8
u8 EventC9_(struct EventEngineProc * proc)
{
    if (EVENT_IS_SKIPPING(proc))
    {
        sub_80C3660();
        return EVC_ADVANCE_CONTINUE;
    }

    sub_80C3660();

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
