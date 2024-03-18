#include "global.h"

#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"

#include "worldmap.h"

//! FE8U = 0x080C36E8
void WmMinimap_PutCursorIcon(struct GMapRadarProc * proc)
{
    int xTmp;
    int yTmp;
    int xOam1;
    int yOam0;

    int x = gGMData.ix >> 8;
    int y = gGMData.iy >> 8;

    xTmp = proc->unk_2f * 8 + ((x * 0x3f) / 0x1e0);
    yTmp = proc->unk_30 * 8 + ((y * 0x2b) / 0x140);

    xOam1 = xTmp - 1;
    yOam0 = yTmp + 7;

    if ((xTmp >= -0x1f) && (xTmp < 0x111) && (yOam0 >= -0x20) && (yOam0 < 0xc0))
    {
        PutSpriteExt(0, OAM1_X(xOam1), OAM0_Y(yOam0), gObject_8x8, OAM2_CHR(0xF6) + OAM2_PAL(4));
    }

    return;
}

//! FE8U = 0x080C3770
void WmMinimap_PutStoryNodeIcon(struct GMapRadarProc * proc)
{
    int x;
    int y;
    int xTmp;
    int yTmp;
    int xOam1;
    int yOam0;

    int nodeId = GetNextUnclearedNode(&gGMData);

    if (nodeId < 0)
    {
        return;
    }

    x = nodeId[gWMNodeData].x;
    y = nodeId[gWMNodeData].y;

    xTmp = proc->unk_2f * 8 + (x * 0x3f / 0x1e0);
    yTmp = proc->unk_30 * 8 + ((y * 0x2b) / 0x140);

    xOam1 = xTmp - 1;
    yOam0 = yTmp + 7;

    if ((xTmp >= -0x1f) && (xTmp < 0x111) && (yOam0 >= -0x20) && (yOam0 < 0xc0))
    {
        PutSpriteExt(0, OAM1_X(xOam1), OAM0_Y(yOam0), gObject_8x8, OAM2_CHR(0xF7) + OAM2_PAL(4));
    }

    return;
}

//! FE8U = 0x080C380C
void WmMinimap_PutLordIcon(struct GMapRadarProc * proc)
{
    int xTmp;
    int yTmp;
    int x;
    int y;
    int xOam1;
    int yOam0;
    s16 xPos;
    s16 yPos;

    if (!(gGMData.units[0].state & 1))
    {
        return;
    }

    GmMu_GetPosition(GM_MAIN->unk_54, 0, &xPos, &yPos);

    x = *&xPos;
    y = *&yPos;

    xTmp = proc->unk_2f * 8 + (x * 0x3f / 0x1e0);
    yTmp = proc->unk_30 * 8 + (y * 0x2b / 0x140);

    xOam1 = xTmp - 3;
    yOam0 = yTmp + 7;

    if ((xTmp >= -0x1d) && (xTmp < 0x113) && (yOam0 >= -0x20) && (yOam0 < 0xc0))
    {
        PutSpriteExt(0, OAM1_X(xOam1), OAM0_Y(yOam0), gObject_8x8, OAM2_CHR(0xF4) + OAM2_PAL(9));
    }

    return;
}

//! FE8U = 0x080C38BC
void WmMinimap_PutSkirmishIcons(struct GMapRadarProc * proc)
{
    int i;
    int j;
    int r9;
    s16 sl;
    struct Vec2 coords[3];
    s16 sp_1c;

    int r8 = 0;
    int sp_18 = 0;

    for (r9 = 4; r9 < 7; r9++)
    {
        int x;
        int y;
        int x2;
        int y2;

        if (!(gGMData.units[r9].state & 1))
        {
            continue;
        }

        GmMu_GetPosition(GM_MAIN->unk_54, r9, &sp_1c, &sl);

        x = sp_1c;
        y = sl;

        x2 = proc->unk_2f * 8 + (x * 0x3f / 0x1e0);
        y2 = proc->unk_30 * 8 + (y * 0x2b / 0x140);

        coords[r8].x = x2 - 3;
        coords[r8].y = y2 + 7;
        r8++;
        sp_18++;
    }

    for (i = 0; i < sp_18 - 1; i++)
    {
        for (j = i + 1; j < sp_18; j++)
        {
            if (coords[j].y < coords[i].y)
            {
                struct Vec2 coord;
                coord.x = coords[i].x;
                coord.y = coords[i].y;

                coords[i].x = coords[j].x;
                coords[i].y = coords[j].y;

                coords[j].x = coord.x;
                coords[j].y = coord.y;
            }
        }
    }

    for (i = 0; i < sp_18; i++)
    {
        if ((coords[i].x >= -0x20) && (coords[i].x < 0x110) && (coords[i].y >= -0x20) && (coords[i].y < 0xc0))
        {
            PutSpriteExt(0, OAM1_X(coords[i].x), OAM0_Y(coords[i].y), gObject_8x8, OAM2_CHR(0xF5) + OAM2_PAL(9));
        }
    }

    return;
}

extern u16 gUnknown_08AA1930[];
extern u16 gUnknown_08AA1950[];

//! FE8U = 0x080C3A28
void WmMinimap_BlinkPalette(struct GMapRadarProc * proc)
{
    int colorIdx = GM_MAIN->unk_50->unk_34;

    u16 * pal = PAL_OBJ(9);

    pal[9] = *(gUnknown_08AA1930 + colorIdx);
    pal[7] = *(gUnknown_08AA1950 + colorIdx);

    EnablePaletteSync();

    return;
}

//! FE8U = 0x080C3A64
void PutWmMinimapSprites(struct GMapRadarProc * proc)
{
    WmMinimap_PutStoryNodeIcon(proc);
    WmMinimap_PutSkirmishIcons(proc);
    WmMinimap_PutLordIcon(proc);
    WmMinimap_PutCursorIcon(proc);

    WmMinimap_BlinkPalette(proc);

    return;
}

extern u16 gUnknown_0201B458[];

//! FE8U = 0x080C3A8C
void GMapRadar_80C3A8C(struct GMapRadarProc * unused)
{
    TileMap_FillRect(gUnknown_0201B458, 8, 8, 0);
    CallARM_FillTileRect(gUnknown_0201B458, gUnknown_08AA18AC, 0x000071E0);
    return;
}

// clang-format off

u8 const gUnknown_08206B70[] =
{
    3, 0, 0, 0, 0, 1, 3, 1, 1, 1,
    2, 2, 3, 2, 2, 3, 3, 3, 2, 3,
};

// clang-format on

//! FE8U = 0x080C3AB8
void GMapRadar_80C3AB8(struct GMapRadarProc * proc)
{
    int state;

    if ((gGMData.state.bits.state_2) != 0)
    {
        proc->unk_34 = 0;
        proc->unk_2a = sub_80C089C(0x20, 0x20, 0x30, 0x30);

        state = ((gUnknown_08206B70[proc->unk_2a + (gGMData.state.bits.state_4_5) * 5] & 3) << 4);
        gGMData.state.bits.state_4_5 = 0;
        gGMData.state.raw |= state;

        GMapRadar_80C3A8C(proc);

        *&proc->unk_2d = gGMData.ix >> 8;
        *&proc->unk_2e = gGMData.iy >> 8;

        proc->unk_2b = proc->unk_2d;
        proc->unk_2c = proc->unk_2e;

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080C3B40
void GMapRadar_80C3B40(struct GMapRadarProc * proc)
{
    int var;

    PutWmMinimapSprites(proc);

    proc->unk_2b = proc->unk_2d;
    proc->unk_2c = proc->unk_2e;

    proc->unk_2d = gGMData.ix >> 8;
    proc->unk_2e = gGMData.iy >> 8;

    if ((gGMData.state.bits.state_2) != 0)
    {
        if ((s8)gGMData.unk01 < 1)
        {
            return;
        }

        if ((proc->unk_2d == proc->unk_2b) && (proc->unk_2e == proc->unk_2c))
        {
            return;
        }

        var = sub_80C089C(0x20, 0x20, 0x30, 0x30);

        if (var == proc->unk_2a)
        {
            return;
        }

        if (gGMData.state.bits.state_4_5 == gUnknown_08206B70[var + gGMData.state.bits.state_4_5 * 5])
        {
            return;
        }
    }

    proc->unk_29 = 1;
    Proc_Break(proc);

    return;
}

extern u16 gUnknown_0201B430[];
extern u16 gUnknown_0201B458[];

//! FE8U = 0x080C3BE4
void PutWmMinimapGfx(struct GMapRadarProc * proc, int b)
{
    switch (gUnknown_08206B70[proc->unk_2a + gGMData.state.bits.state_4_5 * 5])
    {
        case 0:
            TileMap_FillRect(gBG0TilemapBuffer, 8, 8, 0);
            TileMap_CopyRect(gUnknown_0201B430 + (0x1c - b), gBG0TilemapBuffer, b, 8);
            proc->unk_2f = b - 8;
            proc->unk_30 = 0;

            break;

        case 1:
            TileMap_FillRect(gBG0TilemapBuffer + 0x16, 8, 8, 0);
            TileMap_CopyRect(gUnknown_0201B458, gBG0TilemapBuffer + (0x1e - b), b, 8);
            proc->unk_2f = 30 - b;
            proc->unk_30 = 0;

            break;

        case 2:
            TileMap_FillRect(gBG0TilemapBuffer + 0x180, 8, 8, 0);
            TileMap_CopyRect(gUnknown_0201B430 + (0x1c - b), gBG0TilemapBuffer + 0x180, b, 8);
            proc->unk_2f = b - 8;
            proc->unk_30 = 12;

            break;

        case 3:
            TileMap_FillRect(gBG0TilemapBuffer + 0x196, 8, 8, 0);
            TileMap_CopyRect(gUnknown_0201B458, gBG0TilemapBuffer + (0x19e - b), b, 12);
            proc->unk_2f = 30 - b;
            proc->unk_30 = 12;

            break;
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}

s8 CONST_DATA gUnknown_08A3EE6C[] =
{
    1, 2, 5, 8,
};

//! FE8U = 0x080C3D24
void GMapRadar_SlideIn(struct GMapRadarProc * proc)
{
    PutWmMinimapGfx(proc, gUnknown_08A3EE6C[proc->unk_34]);
    PutWmMinimapSprites(proc);

    proc->unk_34++;

    if (proc->unk_34 == 4)
    {
        proc->unk_34 = 0;
        Proc_Break(proc);
    }

    return;
}

s8 CONST_DATA gUnknown_08A3EE70[] =
{
    5, 2, 1, 0,
};

//! FE8U = 0x080C3D5C
void GMapRadar_SlideOut(struct GMapRadarProc * proc)
{
    PutWmMinimapGfx(proc, gUnknown_08A3EE70[proc->unk_34]);
    PutWmMinimapSprites(proc);

    proc->unk_34++;

    if (proc->unk_34 == 4)
    {
        proc->unk_34 = 0;
        proc->unk_29 = 0;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080C3D9C
void GMapRadar_Init(struct GMapRadarProc * proc)
{
    proc->unk_34 = 0;
    proc->unk_29 = 0;
    proc->unk_2a = 0;
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_GmapRader[] =
{
    PROC_NAME("Gmap Rader"),
    PROC_MARK(PROC_MARK_8),

    PROC_15,
    PROC_YIELD,

    PROC_CALL(GMapRadar_Init),

PROC_LABEL(0),
    PROC_REPEAT(GMapRadar_80C3AB8),
    PROC_REPEAT(GMapRadar_SlideIn),
    PROC_REPEAT(GMapRadar_80C3B40),
    PROC_REPEAT(GMapRadar_SlideOut),

    PROC_GOTO(0),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080C3DAC
void StartWorldMapMinimapCore(struct Proc * proc)
{
    SetWinEnable(0, 0, 0);
    SetWOutLayers(1, 1, 1, 1, 1);
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_2, 0, 0);

    SetBlendAlpha(14, 3);

    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 1);
    SetBlendBackdropA(0);

    Decompress(Img_WorldmapMinimap, (void *)0x06003C00);

    ApplyPalette(Pal_WorldmapMinimap, 7);
    ApplyPalette(gPal_GMapPI_ShopIcons, 0x19);
    EnablePaletteSync();

    Proc_Start(ProcScr_GmapRader, proc->proc_parent);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_WorldmapMinimapWrapper[] =
{
    PROC_MARK(PROC_MARK_8),
    PROC_CALL(StartWorldMapMinimapCore),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080C3E80
ProcPtr StartWorldmapMinimap(ProcPtr parent)
{
    return Proc_Start(ProcScr_WorldmapMinimapWrapper, parent);
}

//! FE8U = 0x080C3E94
void EndWorldmapMinimap(void)
{
    Proc_EndEach(ProcScr_GmapRader);
    Proc_EndEach(ProcScr_WorldmapMinimapWrapper);

    SetDefaultColorEffects();

    BG_Fill(gBG1TilemapBuffer, 0);
    BG_EnableSyncByMask(BG1_SYNC_BIT);

    return;
}
