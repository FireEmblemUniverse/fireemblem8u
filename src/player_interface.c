#include "global.h"

#include "fontgrp.h"
#include "bmunit.h"
#include "hardware.h"
#include "bmmap.h"
#include "ctc.h"
#include "bmtrick.h"
#include "icon.h"
#include "uiutils.h"
#include "uichapterstatus.h"
#include "chapterdata.h"
#include "face.h"
#include "bm.h"
#include "prepscreen.h"
#include "statscreen.h"
#include "bmlib.h"
#include "worldmap.h"

#include "constants/terrains.h"
#include "constants/msg.h"

struct PlayerInterfaceProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Text texts[2];

    /* 3C */ s8 xBurst;
    /* 3D */ s8 yBurst;
    /* 3E */ s8 wBurst;
    /* 3F */ s8 hBurst;

    /* 40 */ u16 * statusTm;
    /* 44 */ s16 unitClock;
    /* 46 */ s16 xHp;
    /* 48 */ s16 yHp;
    /* 4A */ u8 burstUnitIdPrev;
    /* 4B */ u8 burstUnitId;
    /* 4C */ u8 xCursorPrev;
    /* 4D */ u8 yCursorPrev;
    /* 4E */ u8 xCursor;
    /* 4F */ u8 yCursor;
    /* 50 */ s8 unk_50;
    /* 51 */ u8 hpCurHi;
    /* 52 */ u8 hpCurLo;
    /* 53 */ u8 hpMaxHi;
    /* 54 */ u8 hpMaxLo;
    /* 55 */ s8 hideContents;
    /* 56 */ s8 isRetracting;
    /* 57 */ s8 quadrant;
    /* 58 */ int showHideClock;
};

struct PlayerInterfaceConfigEntry
{
    /* 00 */ s8 xTerrain, yTerrain;
    /* 02 */ s8 xMinimug, yMinimug;
    /* 04 */ s8 xGoal, yGoal;
};

// clang-format off

struct PlayerInterfaceConfigEntry CONST_DATA sPlayerInterfaceConfigLut[4] =
{
    {
        +1, +1,
        -1, +1,
        +1, -1,
    },
    {
        -1, +1,
        -1, -1,
        +1, +1,
    },
    {
        +1, +1,
        -1, -1,
        +1, -1,
    },
    {
        -1, +1,
        -1, -1,
        +1, -1,
    }
};

s8 CONST_DATA gUnknown_08A01848[6] =
{
    1, 1, 1, 1, 1, 1
};

s8 CONST_DATA gUnknown_08A0184E[18] =
{
    1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1,
    3, 3, 3, 3, 3, 3
};

s8 CONST_DATA gUnknown_08A01860[6] =
{
    0, -1, -6, 0, -1, -6
};

s8 CONST_DATA gUnknown_08A01866[6] =
{
    -6, -6, -6, 3, 3, 3
};

u16 * CONST_DATA gUnknown_08A0186C[6] =
{
    gUnknown_08A175B4,
    gUnknown_08A175B4,
    gUnknown_08A175B4,
    gUnknown_08A175C8,
    gUnknown_08A175DC,
    gUnknown_08A175F0
};

u16 * CONST_DATA gUnknown_08A01884[6] =
{
    gUnknown_08A1763C,
    gUnknown_08A17650,
    gUnknown_08A17664,
    gUnknown_08A17678,
    gUnknown_08A17678,
    gUnknown_08A17678
};

s8 CONST_DATA sMMBSlideInWidthLut[4] =
{
    5, 9, 11, 13
};

s8 CONST_DATA sMMBSlideOutWidthLut[3] =
{
    11, 7, 0
};

s8 CONST_DATA sTerrainSlideInWidthLut[3] =
{
    4, 5, 6
};

s8 CONST_DATA sTerrainSlideOutWidthLut[6] =
{
    5, 4, 0, 0, 0, 0
};

// clang-format on

void TerrainDisplay_Init(struct PlayerInterfaceProc * proc);
void TerrainDisplay_Loop_OnSideChange(struct PlayerInterfaceProc * proc);
void TerrainDisplay_Loop_SlideIn(struct PlayerInterfaceProc * proc);
void TerrainDisplay_Loop_Display(struct PlayerInterfaceProc * proc);
void TerrainDisplay_Loop_SlideOut(struct PlayerInterfaceProc * proc);

// clang-format off

struct ProcCmd CONST_DATA gProcScr_TerrainDisplay[] =
{
    PROC_NAME("TI"),
    PROC_15,
    PROC_YIELD,

    PROC_CALL(TerrainDisplay_Init),

PROC_LABEL(0),

    PROC_WHILE_EXISTS(ProcScr_CamMove),

    PROC_REPEAT(TerrainDisplay_Loop_OnSideChange),
    PROC_REPEAT(TerrainDisplay_Loop_SlideIn),
    PROC_REPEAT(TerrainDisplay_Loop_Display),
    PROC_REPEAT(TerrainDisplay_Loop_SlideOut),

    PROC_GOTO(0),

    PROC_END,
};

// clang-format on

void MMB_Init(struct PlayerInterfaceProc * proc);
void MMB_Loop_OnSideChange(struct PlayerInterfaceProc * proc);
void MMB_Loop_SlideIn(struct PlayerInterfaceProc * proc);
void MMB_Loop_Display(struct PlayerInterfaceProc * proc);
void MMB_Loop_SlideOut(struct PlayerInterfaceProc * proc);
void MMB_CheckForUnit(struct PlayerInterfaceProc * proc);

// clang-format off

struct ProcCmd CONST_DATA gProcScr_UnitDisplay_MinimugBox[] =
{
    PROC_NAME("UI1"),
    PROC_15,
    PROC_YIELD,

    PROC_CALL(MMB_Init),

PROC_LABEL(0),

    PROC_WHILE_EXISTS(ProcScr_CamMove),

    PROC_REPEAT(MMB_Loop_OnSideChange),
    PROC_REPEAT(MMB_Loop_SlideIn),

    // fallthrough

PROC_LABEL(2),
    PROC_REPEAT(MMB_Loop_Display),

    // fallthrough

PROC_LABEL(3),
    PROC_REPEAT(MMB_Loop_SlideOut),

    PROC_GOTO(0),

PROC_LABEL(1),
    PROC_CALL(MMB_CheckForUnit),

    PROC_GOTO(2),

    PROC_END,
};

// clang-format on

void BurstDisplay_Init(struct PlayerInterfaceProc * proc);
void BurstDisplay_Loop_Display(struct PlayerInterfaceProc * proc);

// clang-format off

struct ProcCmd CONST_DATA gProcScr_UnitDisplay_Burst[] =
{
    PROC_NAME("UI2"),
    PROC_15,
    PROC_YIELD,

    PROC_CALL(BurstDisplay_Init),
    PROC_REPEAT(BurstDisplay_Loop_Display),

    PROC_END,
};

// clang-format on

void InitPlayerPhaseInterface(void);

// clang-format off

struct ProcCmd CONST_DATA gProcScr_SideWindowMaker[] =
{
    PROC_WHILE(DoesBMXFADEExist),
    PROC_CALL(InitPlayerPhaseInterface),
    PROC_END,
};

// clang-format on

s8 CONST_DATA sGoalSlideInWidthLut[5] =
{
    1, 3, 4, 5, 6
};

s8 CONST_DATA sGoalSlideOutWidthLut[3] =
{
    3, 1, 0
};

void GoalDisplay_Init(struct PlayerInterfaceProc * proc);
void GoalDisplay_Loop_OnSideChange(struct PlayerInterfaceProc * proc);
void GoalDisplay_Loop_SlideIn(struct PlayerInterfaceProc * proc);
void GoalDisplay_Loop_Display(struct PlayerInterfaceProc * proc);
void GoalDisplay_Loop_SlideOut(struct PlayerInterfaceProc * proc);

// clang-format off

struct ProcCmd CONST_DATA gProcScr_GoalDisplay[] =
{
    PROC_NAME("PI"),
    PROC_15,
    PROC_YIELD,

    PROC_CALL(GoalDisplay_Init),

PROC_LABEL(0),

    PROC_WHILE_EXISTS(ProcScr_CamMove),

    PROC_REPEAT(GoalDisplay_Loop_OnSideChange),
    PROC_REPEAT(GoalDisplay_Loop_SlideIn),
    PROC_REPEAT(GoalDisplay_Loop_Display),
    PROC_REPEAT(GoalDisplay_Loop_SlideOut),

    PROC_GOTO(0),

    PROC_END,
};

// clang-format on

void MenuButtonDisp_Init(struct PlayerInterfaceProc * proc);
s8 IsAnyPlayerSideWindowRetracting(void);
void MenuButtonDisp_UpdateCursorPos(struct PlayerInterfaceProc * proc);
void MenuButtonDisp_Loop_OnSlideIn(struct PlayerInterfaceProc * proc);
void MenuButtonDisp_Loop_Display(struct PlayerInterfaceProc * proc);
void MenuButtonDisp_Loop_OnSlideOut(struct PlayerInterfaceProc * proc);

// clang-format off

struct ProcCmd CONST_DATA gProcScr_PrepMap_MenuButtonDisplay[] =
{
    PROC_15,
    PROC_YIELD,

    PROC_CALL(MenuButtonDisp_Init),

PROC_LABEL(0),

    PROC_WHILE_EXISTS(ProcScr_CamMove),

    PROC_WHILE(IsAnyPlayerSideWindowRetracting),

    PROC_CALL(MenuButtonDisp_UpdateCursorPos),

    PROC_REPEAT(MenuButtonDisp_Loop_OnSlideIn),
    PROC_REPEAT(MenuButtonDisp_Loop_Display),
    PROC_REPEAT(MenuButtonDisp_Loop_OnSlideOut),

    PROC_GOTO(0),

    PROC_END,
};

// clang-format on

void DrawUnitDisplayHpOrStatus(struct PlayerInterfaceProc *, struct Unit *);

int GetWindowQuadrant(int x, int y)
{
    if (x < 0)
    {
        if (y < 0)
        {
            return 0;
        }
        else
        {
            return 1;
        }
    }
    else if (y < 0)
    {
        return 2;
    }
    else
    {
        return 3;
    }
}

int GetCursorQuadrant(void)
{
    int cursorX;
    int camX;
    int cursorY;
    int camY;

    int x;
    int y;

    cursorX = (gBmSt.playerCursor.x * 16);
    camX = (gBmSt.camera.x - 8);

    x = cursorX - camX;

    cursorY = (gBmSt.playerCursor.y * 16);
    camY = (gBmSt.camera.y - 8);

    y = cursorY - camY;

    if ((x < 0x79) && (y < 0x51))
    {
        return 0;
    }

    if ((x >= 0x79) && (y < 0x51))
    {
        return 1;
    }

    if ((x < 0x79) && (y >= 0x51))
    {
        return 2;
    }

    if ((x >= 0x79) && (y >= 0x51))
    {
        return 3;
    }
}

void GetHpBarLeftTile(u16 * buffer, s16 hp, int tileBase)
{
    if (hp > 5)
        hp = 5;

    *buffer = hp + tileBase;

    return;
}

void GetHpBarMidTiles(u16 * buffer, s16 hp, int tileBase)
{
    int i;

    int hpEighth = hp >> 3;
    int eighthTileIdx = hp & 7;

    for (i = 0; i < 5; i++)
    {
        int fullTileIdx = tileBase + 14;
        int emptyTileIdx = tileBase + 6;

        if (i < hpEighth) // full
            *buffer = fullTileIdx;
        else if (i == hpEighth) // partial
            *buffer = emptyTileIdx + eighthTileIdx;
        else // empty
            *buffer = emptyTileIdx;

        buffer++;
    }

    return;
}

void GetHpBarRightTile(u16 * buffer, s16 hp, int tileBase)
{
    int base;

    if (hp >= 5)
        hp = 5;

    if (hp < 0)
        hp = 0;

    base = tileBase + 15;

    *buffer = hp + base;

    return;
}

void DrawHpBar(u16 * buffer, struct Unit * unit, int tileBase)
{
    s16 hpCurrent = 50 * GetUnitCurrentHp(unit);
    s16 hpPercent = Div(hpCurrent, GetUnitMaxHp(unit));

    GetHpBarLeftTile(buffer, hpPercent, tileBase);
    GetHpBarMidTiles(buffer + 1, hpPercent - 5, tileBase);
    GetHpBarRightTile(buffer + 6, hpPercent - 45, tileBase);

    return;
}

void MMB_Loop_SlideIn(struct PlayerInterfaceProc * proc)
{
    int tmIndex;
    int width;

    int y = sPlayerInterfaceConfigLut[proc->unk_50].yMinimug < 0 ? 0 : 14;

    if (sPlayerInterfaceConfigLut[proc->unk_50].xMinimug < 0)
    {
        tmIndex = TILEMAP_INDEX(0, y);

        TileMap_FillRect(gBG0TilemapBuffer + tmIndex, 13, 6, 0);
        TileMap_FillRect(gBG1TilemapBuffer + tmIndex, 13, 6, 0);
    }
    else
    {
        tmIndex = TILEMAP_INDEX(0, y);

        TileMap_FillRect(gBG0TilemapBuffer + TILEMAP_INDEX(17, 0) + tmIndex, 13, 6, 0);
        TileMap_FillRect(gBG1TilemapBuffer + TILEMAP_INDEX(17, 0) + tmIndex, 13, 6, 0);
    }

    tmIndex = TILEMAP_INDEX(0, y);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    width = sMMBSlideInWidthLut[proc->showHideClock];

    if (sPlayerInterfaceConfigLut[proc->unk_50].xMinimug < 0)
    {
        TileMap_CopyRect(gUiTmScratchA + (13 - width), gBG0TilemapBuffer + tmIndex, width, 6);
        TileMap_CopyRect(gUiTmScratchB + (13 - width), gBG1TilemapBuffer + tmIndex, width, 6);
    }
    else
    {
        TileMap_CopyRect(gUiTmScratchA, gBG0TilemapBuffer + TILEMAP_INDEX(30 - width, y), width, 6);
        TileMap_CopyRect(gUiTmScratchB, gBG1TilemapBuffer + TILEMAP_INDEX(30 - width, y), width, 6);
    }

    proc->showHideClock++;

    if (proc->showHideClock == 4)
    {
        proc->hideContents = false;
        proc->showHideClock = 0;

        Proc_Break(proc);

        DrawUnitDisplayHpOrStatus(proc, GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]));
    }

    return;
}

void MMB_Loop_SlideOut(struct PlayerInterfaceProc * proc)
{
    int tmIndex;
    int width;

    int y = sPlayerInterfaceConfigLut[proc->unk_50].yMinimug < 0 ? 0 : 14;

    proc->hideContents = true;

    if (sPlayerInterfaceConfigLut[proc->unk_50].xMinimug < 0)
    {
        tmIndex = TILEMAP_INDEX(0, y);

        TileMap_FillRect(gBG0TilemapBuffer + tmIndex, 13, 6, 0);
        TileMap_FillRect(gBG1TilemapBuffer + tmIndex, 13, 6, 0);
    }
    else
    {
        tmIndex = TILEMAP_INDEX(0, y);

        TileMap_FillRect(gBG0TilemapBuffer + TILEMAP_INDEX(17, 0) + tmIndex, 13, 6, 0);
        TileMap_FillRect(gBG1TilemapBuffer + TILEMAP_INDEX(17, 0) + tmIndex, 13, 6, 0);
    }

    tmIndex = TILEMAP_INDEX(0, y);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    width = sMMBSlideOutWidthLut[proc->showHideClock];

    if (sPlayerInterfaceConfigLut[proc->unk_50].xMinimug < 0)
    {
        TileMap_CopyRect(gUiTmScratchA + (13 - width), gBG0TilemapBuffer + tmIndex, width, 6);
        TileMap_CopyRect(gUiTmScratchB + (13 - width), gBG1TilemapBuffer + tmIndex, width, 6);
    }
    else
    {
        TileMap_CopyRect(gUiTmScratchA, gBG0TilemapBuffer + TILEMAP_INDEX(30 - width, y), width, 6);
        TileMap_CopyRect(gUiTmScratchB, gBG1TilemapBuffer + TILEMAP_INDEX(30 - width, y), width, 6);
    }

    proc->showHideClock++;

    if (proc->showHideClock == 3)
    {
        proc->isRetracting = false;
        proc->showHideClock = 0;
        proc->quadrant = -1;

        Proc_Break(proc);
    }

    return;
}

void TerrainDisplay_Loop_SlideIn(struct PlayerInterfaceProc * proc)
{
    int width;

    if (sPlayerInterfaceConfigLut[proc->unk_50].xTerrain < 0)
    {
        TileMap_FillRect(gBG0TilemapBuffer + TILEMAP_INDEX(0, 13), 7, 7, 0);
        TileMap_FillRect(gBG1TilemapBuffer + TILEMAP_INDEX(0, 13), 7, 7, 0);
    }
    else
    {
        TileMap_FillRect(gBG0TilemapBuffer + TILEMAP_INDEX(23, 13), 7, 7, 0);
        TileMap_FillRect(gBG1TilemapBuffer + TILEMAP_INDEX(23, 13), 7, 7, 0);
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    width = sTerrainSlideInWidthLut[proc->showHideClock] + 1;

    if (sPlayerInterfaceConfigLut[proc->unk_50].xTerrain < 0)
    {
        TileMap_CopyRect(
            gUiTmScratchA + TILEMAP_INDEX(7 - width, 10), gBG0TilemapBuffer + TILEMAP_INDEX(0, 13), width, 7);
        TileMap_CopyRect(
            gUiTmScratchB + TILEMAP_INDEX(7 - width, 10), gBG1TilemapBuffer + TILEMAP_INDEX(0, 13), width, 7);
    }
    else
    {
        TileMap_CopyRect(
            gUiTmScratchA + TILEMAP_INDEX(0, 10), gBG0TilemapBuffer + TILEMAP_INDEX(30 - width, 13), width, 7);
        TileMap_CopyRect(
            gUiTmScratchB + TILEMAP_INDEX(0, 10), gBG1TilemapBuffer + TILEMAP_INDEX(30 - width, 13), width, 7);
    }

    proc->showHideClock++;

    if (proc->showHideClock == 3)
    {
        proc->showHideClock = 0;
        proc->hideContents = false;

        Proc_Break(proc);
    }

    return;
}

void TerrainDisplay_Loop_SlideOut(struct PlayerInterfaceProc * proc)
{
    int width;

    proc->hideContents = true;

    if (sPlayerInterfaceConfigLut[proc->unk_50].xTerrain < 0)
    {
        TileMap_FillRect(gBG0TilemapBuffer + TILEMAP_INDEX(0, 13), 7, 7, 0);
        TileMap_FillRect(gBG1TilemapBuffer + TILEMAP_INDEX(0, 13), 7, 7, 0);
    }
    else
    {
        TileMap_FillRect(gBG0TilemapBuffer + TILEMAP_INDEX(23, 13), 7, 7, 0);
        TileMap_FillRect(gBG1TilemapBuffer + TILEMAP_INDEX(23, 13), 7, 7, 0);
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    width = sTerrainSlideOutWidthLut[proc->showHideClock];

    if (sPlayerInterfaceConfigLut[proc->unk_50].xTerrain < 0)
    {
        TileMap_CopyRect(
            gUiTmScratchA + TILEMAP_INDEX(6 - width, 10), gBG0TilemapBuffer + TILEMAP_INDEX(0, 13), width, 7);
        TileMap_CopyRect(
            gUiTmScratchB + TILEMAP_INDEX(6 - width, 10), gBG1TilemapBuffer + TILEMAP_INDEX(0, 13), width, 7);
    }
    else
    {
        TileMap_CopyRect(
            gUiTmScratchA + TILEMAP_INDEX(0, 10), gBG0TilemapBuffer + TILEMAP_INDEX(30 - width, 13), width, 7);
        TileMap_CopyRect(
            gUiTmScratchB + TILEMAP_INDEX(0, 10), gBG1TilemapBuffer + TILEMAP_INDEX(30 - width, 13), width, 7);
    }

    proc->showHideClock++;

    if (proc->showHideClock == 3)
    {
        proc->showHideClock = 0;
        proc->hideContents = false;
        proc->isRetracting = false;

        Proc_Break(proc);
    }

    return;
}

void sub_808C234(struct PlayerInterfaceProc * proc)
{
    int x;
    int y;

    if (sPlayerInterfaceConfigLut[proc->unk_50].xMinimug < 0)
    {
        x = 0;
    }
    else
    {
        x = 18;
    }

    if (sPlayerInterfaceConfigLut[proc->unk_50].yMinimug < 0)
    {
        y = 0;
    }
    else
    {
        y = 14;
    }

    TileMap_CopyRect(gUiTmScratchA, gBG0TilemapBuffer + TILEMAP_INDEX(x, y), 13, 6);
    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    return;
}

void sub_808C288(struct PlayerInterfaceProc * proc)
{

    int x;

    if (sPlayerInterfaceConfigLut[proc->unk_50].xTerrain < 0)
    {
        x = 0;
    }
    else
    {
        x = 23;
    }

    TileMap_CopyRect(gUiTmScratchA + TILEMAP_INDEX(0, 10), gBG0TilemapBuffer + TILEMAP_INDEX(x, 13), 7, 7);
    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    return;
}

void GetMinimugFactionPalette(int faction, int palId)
{
    u16 * pal = NULL;

    switch (faction)
    {
        case FACTION_BLUE:
            pal = gPal_PlayerInterface_Blue;
            break;

        case FACTION_RED:
            pal = gPal_PlayerInterface_Red;
            break;

        case FACTION_GREEN:
            pal = gPal_PlayerInterface_Green;
            break;

        default:
            nullsub_8();
            break;
    }

    ApplyPalette(pal, palId);

    return;
}

int sub_808C314(void)
{
    if (((gBmSt.playerCursor.x * 16) - gBmSt.camera.x) < DISPLAY_WIDTH / 2 - 8)
    {
        return +1;
    }
    else
    {
        return -1;
    }
}

int sub_808C33C(void)
{
    if (((gBmSt.playerCursor.x * 16) - gBmSt.camera.x) > DISPLAY_WIDTH / 2 - 8)
    {
        return -1;
    }
    else
    {
        return +1;
    }
}

void sub_808C360(struct PlayerInterfaceProc * proc, u16 * buffer, struct Unit * unit)
{
    buffer[0] = TILEREF(0x120, 2);
    buffer[1] = TILEREF(0x121, 2);
    buffer[2] = 0;
    buffer[3] = 0;
    buffer[4] = TILEREF(0x13E, 2);
    buffer[5] = 0;
    buffer[6] = 0;

    return;
}

void MMB_DrawStatusText(u16 * buffer, struct Unit * unit)
{
    int offset;

    int tileIdx = TILEREF(0x16F, 0);

    if (unit == NULL)
    {
        return;
    }

    switch (unit->statusIndex)
    {
        case UNIT_STATUS_POISON:
            offset = 0;
            break;

        case UNIT_STATUS_SLEEP:
            offset = 0xA0;
            break;

        case UNIT_STATUS_SILENCED:
            offset = 0x140;
            break;

        case UNIT_STATUS_BERSERK:
            offset = 0x1E0;
            break;

        case UNIT_STATUS_ATTACK:
            offset = 0x280;
            break;

        case UNIT_STATUS_DEFENSE:
            offset = 0x320;
            break;

        case UNIT_STATUS_CRIT:
            offset = 0x3C0;
            break;

        case UNIT_STATUS_AVOID:
            offset = 0x460;
            break;

        case UNIT_STATUS_PETRIFY:
        case UNIT_STATUS_13:
            offset = 0x500;
            break;

        case UNIT_STATUS_NONE:
        case UNIT_STATUS_SICK:
        case UNIT_STATUS_RECOVER:
            return;

        case UNIT_STATUS_12:
            break;
    }

    CpuFastCopy(gGfx_StatusText + offset, (void *)(VRAM + 0x2DE0), 5 * CHR_SIZE);

    buffer[0] = tileIdx++;
    buffer[1] = tileIdx++;
    buffer[2] = tileIdx++;
    buffer[3] = tileIdx++;
    buffer[4] = tileIdx++;
    buffer[5] = 0;
    buffer[6] = TILEREF(0x128 + unit->statusDuration, 1);

    return;
}

void DrawUnitDisplayHpOrStatus(struct PlayerInterfaceProc * proc, struct Unit * unit)
{
    s16 frameCount = proc->unitClock;

    if (unit->statusIndex == UNIT_STATUS_RECOVER)
    {
        frameCount = 0;
    }

    if ((frameCount & 0x3F) == 0)
    {
        if ((frameCount & 0x40) != 0)
        {
            MMB_DrawStatusText(proc->statusTm, unit);
            BG_EnableSyncByMask(BG0_SYNC_BIT);
        }
        else
        {
            if (GetUnitCurrentHp(unit) >= 100)
            {
                StoreNumberStringOrDashesToSmallBuffer(0xFF);
            }
            else
            {
                StoreNumberStringOrDashesToSmallBuffer(GetUnitCurrentHp(unit));
            }

            proc->hpCurHi = gUnknown_02028E44[6] - '0';
            proc->hpCurLo = gUnknown_02028E44[7] - '0';

            if (GetUnitMaxHp(unit) >= 100)
            {
                StoreNumberStringOrDashesToSmallBuffer(0xFF);
            }
            else
            {
                StoreNumberStringOrDashesToSmallBuffer(GetUnitMaxHp(unit));
            }

            proc->hpMaxHi = gUnknown_02028E44[6] - '0';
            proc->hpMaxLo = gUnknown_02028E44[7] - '0';

            sub_808C360(proc, proc->statusTm, unit);
            BG_EnableSyncByMask(BG0_SYNC_BIT);
        }
    }

    if ((proc->hideContents == false) && ((frameCount & 0x40) == 0 || (unit->statusIndex == UNIT_STATUS_NONE)))
    {
        int xDigits;
        int yDigits;

        int xDigit1;

        xDigits = proc->xHp * 8;
        xDigit1 = xDigits + 17;

        yDigits = proc->yHp * 8;

        if (proc->hpCurHi != (u8)(' ' - '0'))
        {
            CallARM_PushToSecondaryOAM(xDigit1, yDigits, gObject_8x8, proc->hpCurHi + OAM2_CHR(0x2E0) + OAM2_PAL(8));
        }

        CallARM_PushToSecondaryOAM(xDigits + 24, yDigits, gObject_8x8, proc->hpCurLo + OAM2_CHR(0x2E0) + OAM2_PAL(8));

        if (proc->hpMaxHi != (u8)(' ' - '0'))
        {
            CallARM_PushToSecondaryOAM(
                xDigits + 41, yDigits, gObject_8x8, proc->hpMaxHi + OAM2_CHR(0x2E0) + OAM2_PAL(8));
        }

        CallARM_PushToSecondaryOAM(xDigits + 48, yDigits, gObject_8x8, proc->hpMaxLo + OAM2_CHR(0x2E0) + OAM2_PAL(8));
    }

    return;
}

void InitMinimugBoxMaybe(struct PlayerInterfaceProc * proc, struct Unit * unit)
{
    char * str;
    int pos;
    int faceId;

    CpuFastFill(0, gUiTmScratchA, 6 * CHR_SIZE * sizeof(u16));

    str = GetStringFromIndex(unit->pCharacterData->nameTextId);
    pos = GetStringTextCenteredPos(56, str);

    ClearText(proc->texts);
    Text_SetParams(proc->texts, pos, TEXT_COLOR_SYSTEM_BLACK);
    Text_DrawString(proc->texts, str);
    PutText(proc->texts, gUiTmScratchA + TILEMAP_INDEX(5, 1));

    faceId = GetUnitMiniPortraitId(unit);

    if (unit->state & US_BIT23)
    {
        faceId = faceId + 1;
    }

    PutFaceChibi(faceId, gUiTmScratchA + TILEMAP_INDEX(1, 1), 0xF0, 4, 0);

    proc->statusTm = gUiTmScratchA + TILEMAP_INDEX(5, 3);
    proc->unitClock = 0;

    if (sPlayerInterfaceConfigLut[proc->unk_50].xMinimug < 0)
    {
        proc->xHp = 5;
    }
    else
    {
        proc->xHp = 23;
    }

    if (sPlayerInterfaceConfigLut[proc->unk_50].yMinimug < 0)
    {
        proc->yHp = 3;
    }
    else
    {
        proc->yHp = 17;
    }

    DrawUnitDisplayHpOrStatus(proc, unit);
    DrawHpBar(gUiTmScratchA + TILEMAP_INDEX(5, 4), unit, TILEREF(0x140, 1));

    CallARM_FillTileRect(gUiTmScratchB, gTSA_MinimugBox, TILEREF(0x0, 3));
    GetMinimugFactionPalette(UNIT_FACTION(unit), 3);

    return;
}

int sub_808C710(int x, int y)
{
    int cursorQuadrant = GetCursorQuadrant();

    int ret = 1;

    if ((y < 6) || ((y < 12) && (sPlayerInterfaceConfigLut[cursorQuadrant].yGoal < 0)))
    {
        ret = 4;
    }

    if (x < 2)
    {
        ret = ret - 1;
    }

    if (x > 22)
    {
        ret = ret + 1;
    }

    return ret;
}

void sub_808C750(struct PlayerInterfaceProc * proc, struct Unit * unit)
{
    int x;
    int y;
    int unk;
    char * nameStr;
    int pos;

    int tmp = unit->xPos * 16 - gBmSt.camera.x;

    if (tmp < 0)
    {
        tmp += 7;
    }

    x = tmp >> 3;

    tmp = unit->yPos * 16 - gBmSt.camera.y;

    if (tmp < 0)
    {
        tmp += 7;
    }

    y = tmp >> 3;

    unk = sub_808C710(x, y);

    x = x + gUnknown_08A01860[unk];
    y = y + gUnknown_08A01866[unk];

    proc->xBurst = x;
    proc->yBurst = y;

    proc->wBurst = 8;
    proc->hBurst = 5;

    nameStr = GetStringFromIndex(unit->pCharacterData->nameTextId);
    pos = GetStringTextCenteredPos(56, nameStr);

    ClearText(proc->texts);

    Text_SetParams(proc->texts, pos, TEXT_COLOR_SYSTEM_BLACK);
    Text_DrawString(proc->texts, nameStr);

    PutText(proc->texts, gBG0TilemapBuffer + TILEMAP_INDEX(x + gUnknown_08A01848[unk], y + gUnknown_08A0184E[unk]));

    proc->statusTm = gBG0TilemapBuffer + TILEMAP_INDEX(x + 1, y + 3);

    proc->unitClock = 0;

    proc->xHp = x + 1;
    proc->yHp = y + 3;

    DrawUnitDisplayHpOrStatus(proc, unit);

    CallARM_FillTileRect(gBG1TilemapBuffer + TILEMAP_INDEX(x, y), gUnknown_08A0186C[unk], TILEREF(0x100, 3));
    CallARM_FillTileRect(gBG1TilemapBuffer + TILEMAP_INDEX(x, y + 1), gUnknown_08A17604, TILEREF(0x100, 3));
    CallARM_FillTileRect(gBG1TilemapBuffer + TILEMAP_INDEX(x, y + 4), gUnknown_08A01884[unk], TILEREF(0x100, 3));

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    GetMinimugFactionPalette(UNIT_FACTION(unit), 3);

    return;
}

void sub_808C8EC(struct PlayerInterfaceProc * proc)
{
    if (proc->wBurst == 8 && proc->hBurst == 5)
    {
        TileMap_FillRect(gBG0TilemapBuffer + TILEMAP_INDEX(proc->xBurst, proc->yBurst), proc->wBurst, proc->hBurst, 0);
        TileMap_FillRect(gBG1TilemapBuffer + TILEMAP_INDEX(proc->xBurst, proc->yBurst), proc->wBurst, proc->hBurst, 0);

        BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

        proc->wBurst = 0;
        proc->hBurst = 0;
    }

    return;
}

void DrawTerrainDisplayWindow(struct PlayerInterfaceProc * proc)
{
    char * str;
    int num;

    int terrainId = gBmMapTerrain[gBmSt.playerCursor.y][gBmSt.playerCursor.x];

    TileMap_FillRect(gUiTmScratchA + TILEMAP_INDEX(0, 10), 14, 7, 0);
    TileMap_FillRect(gUiTmScratchB + TILEMAP_INDEX(0, 10), 14, 7, 0);

    str = GetTerrainName(terrainId);

    num = GetStringTextCenteredPos(40, str);

    ClearText(proc->texts);
    Text_SetParams(proc->texts, num, TEXT_COLOR_SYSTEM_WHITE);
    Text_DrawString(proc->texts, str);
    PutText(proc->texts, gUiTmScratchA + TILEMAP_INDEX(1, 12));

    CallARM_FillTileRect(gUiTmScratchA + TILEMAP_INDEX(1, 14), gTSA_TerrainBox_Something, TILEREF(0x100, 2));

    if (TerrainTable_MovCost_BerserkerNormal[terrainId] > 0)
    {
        StoreNumberStringToSmallBuffer(TerrainTable_Def_Common[terrainId]);
        PutDigits(gUiTmScratchA + TILEMAP_INDEX(5, 14), gUnknown_02028E44 + 7, TILEREF(0x128, 2), 2);

        StoreNumberStringToSmallBuffer(TerrainTable_Avo_Common[terrainId]);
        PutDigits(gUiTmScratchA + TILEMAP_INDEX(5, 15), gUnknown_02028E44 + 7, TILEREF(0x128, 2), 2);
    }

    switch (terrainId)
    {
        case TERRAIN_SNAG:
        case TERRAIN_WALL_1B:
            CallARM_FillTileRect(gUiTmScratchA + TILEMAP_INDEX(1, 14), gTSA_TerrainBox_Destructable, TILEREF(0x100, 2));

            num = GetObstacleHpAt(gBmSt.playerCursor.x, gBmSt.playerCursor.y);

            if (num == 100)
            {
                CallARM_FillTileRect(gUiTmScratchA + TILEMAP_INDEX(4, 15), gUnknown_08A176B4, TILEREF(0x100, 0));
            }
            else
            {
                StoreNumberStringToSmallBuffer(num);
                PutDigits(gUiTmScratchA + TILEMAP_INDEX(5, 15), gUnknown_02028E44 + 7, TILEREF(0x128, 2), 2);
            }

            break;

        case TERRAIN_BALLISTA_REGULAR:
        case TERRAIN_BALLISTA_LONG:
        case TERRAIN_BALLISTA_KILLER:
            CallARM_FillTileRect(gUiTmScratchA + TILEMAP_INDEX(1, 14), gTSA_TerrainBox_Ballistae, TILEREF(0x100, 0));

            StoreNumberStringToSmallBuffer(GetObstacleHpAt(gBmSt.playerCursor.x, gBmSt.playerCursor.y));
            PutDigits(gUiTmScratchA + TILEMAP_INDEX(5, 14), gUnknown_02028E44 + 7, TILEREF(0x128, 2), 2);

            break;
    }

    CallARM_FillTileRect(gUiTmScratchB + TILEMAP_INDEX(0, 11), gTSA_TerrainBox, TILEREF(0x0, 1));
}

void TerrainDisplay_Init(struct PlayerInterfaceProc * proc)
{
    proc->quadrant = -1;
    proc->isRetracting = false;
    proc->showHideClock = 0;
    proc->unk_50 = 1;

    InitTextDb(proc->texts, 5);

    return;
}

void TerrainDisplay_Loop_OnSideChange(struct PlayerInterfaceProc * proc)
{
    int quadrant;
    struct PlayerInterfaceProc * ui1Proc;
    struct PlayerInterfaceProc * piProc;

    proc->hideContents = true;

    proc->unk_50 = GetCursorQuadrant();

    quadrant = GetWindowQuadrant(
        sPlayerInterfaceConfigLut[proc->unk_50].xTerrain, sPlayerInterfaceConfigLut[proc->unk_50].yTerrain);

    ui1Proc = Proc_Find(gProcScr_UnitDisplay_MinimugBox);

    if (ui1Proc != NULL)
    {
        if ((ui1Proc->quadrant > -1) && (ui1Proc->quadrant == quadrant))
        {
            return;
        }
    }

    piProc = Proc_Find(gProcScr_GoalDisplay);

#if BUGFIX
    if (piProc != NULL)
#else
    if (ui1Proc != NULL)
#endif // BUGFIX
    {
        if ((piProc->quadrant > -1) && (piProc->quadrant == quadrant))
        {
            return;
        }
    }

    proc->quadrant = quadrant;

    DrawTerrainDisplayWindow(proc);

    proc->xCursor = gBmSt.playerCursor.x;
    proc->yCursor = gBmSt.playerCursor.y;

    Proc_Break(proc);

    return;
}

void TerrainDisplay_Loop_Display(struct PlayerInterfaceProc * proc)
{
    proc->xCursorPrev = proc->xCursor;
    proc->yCursorPrev = proc->yCursor;

    proc->xCursor = gBmSt.playerCursor.x;
    proc->yCursor = gBmSt.playerCursor.y;

    if ((proc->xCursor == proc->xCursorPrev) && (proc->yCursor == proc->yCursorPrev))
    {
        return;
    }

    if (Proc_Find(ProcScr_CamMove) == NULL)
    {
        int cursorQuadrant = GetCursorQuadrant();

        if ((cursorQuadrant == proc->unk_50) ||
            ((sPlayerInterfaceConfigLut[cursorQuadrant].xTerrain == sPlayerInterfaceConfigLut[proc->unk_50].xTerrain) &&
             (sPlayerInterfaceConfigLut[cursorQuadrant].yTerrain == sPlayerInterfaceConfigLut[proc->unk_50].yTerrain)))
        {
            DrawTerrainDisplayWindow(proc);
            sub_808C288(proc);
            return;
        }
    }

    proc->isRetracting = true;

    Proc_Break(proc);

    return;
}

void MMB_Init(struct PlayerInterfaceProc * proc)
{
    proc->quadrant = -1;
    InitTextDb(proc->texts, 7);
    proc->showHideClock = 0;
    proc->isRetracting = false;

    return;
}

void MMB_Loop_OnSideChange(struct PlayerInterfaceProc * proc)
{
    int quadrant;
    struct PlayerInterfaceProc * tiProc;

    struct Unit * unit = GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]);

    if (unit == NULL)
    {
        return;
    }

    proc->hideContents = true;

    proc->unk_50 = GetCursorQuadrant();

    quadrant = GetWindowQuadrant(
        sPlayerInterfaceConfigLut[proc->unk_50].xMinimug, sPlayerInterfaceConfigLut[proc->unk_50].yMinimug);

    tiProc = Proc_Find(gProcScr_TerrainDisplay);

    if (tiProc != NULL)
    {
        if ((tiProc->quadrant > -1) && (tiProc->quadrant == quadrant))
        {
            return;
        }
    }

    proc->quadrant = quadrant;

    proc->xCursor = gBmSt.playerCursor.x;
    proc->yCursor = gBmSt.playerCursor.y;

    InitMinimugBoxMaybe(proc, unit);

    Proc_Break(proc);

    return;
}

void MMB_Loop_Display(struct PlayerInterfaceProc * proc)
{
    struct Unit * unit = GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]);

    proc->unitClock++;

    DrawUnitDisplayHpOrStatus(proc, unit);

    if ((proc->unitClock & 0x3F) == 0)
    {
        sub_808C234(proc);
    }

    proc->xCursorPrev = proc->xCursor;
    proc->yCursorPrev = proc->yCursor;

    proc->xCursor = gBmSt.playerCursor.x;
    proc->yCursor = gBmSt.playerCursor.y;

    if ((proc->xCursor == proc->xCursorPrev) && (proc->yCursor == proc->yCursorPrev))
    {
        return;
    }

    if (unit != NULL && Proc_Find(ProcScr_CamMove) == NULL)
    {
        int cursorQuadrant = GetCursorQuadrant();

        if ((cursorQuadrant == proc->unk_50) ||
            ((sPlayerInterfaceConfigLut[cursorQuadrant].xMinimug == sPlayerInterfaceConfigLut[proc->unk_50].xMinimug) &&
             (sPlayerInterfaceConfigLut[cursorQuadrant].yMinimug == sPlayerInterfaceConfigLut[proc->unk_50].yMinimug)))
        {
            Proc_Goto(proc, 1);
            return;
        }
    }

    proc->isRetracting = true;

    Proc_Break(proc);

    return;
}

void MMB_CheckForUnit(struct PlayerInterfaceProc * proc)
{
    struct Unit * unit = GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]);

    if (unit == NULL)
    {
        Proc_Goto(proc, 3);
    }
    else
    {
        InitMinimugBoxMaybe(proc, unit);
        sub_808C234(proc);
    }

    return;
}

void BurstDisplay_Init(struct PlayerInterfaceProc * proc)
{
    InitTextDb(proc->texts, 7);
    proc->burstUnitId = 0;
    proc->hideContents = false;
    proc->showHideClock = 0;
    proc->wBurst = 0;
    proc->hBurst = 0;
    proc->isRetracting = false;

    return;
}

void BurstDisplay_Loop_Display(struct PlayerInterfaceProc * proc)
{
    struct PlayerInterfaceProc * tiProc;
    struct PlayerInterfaceProc * piProc;

    proc->burstUnitIdPrev = proc->burstUnitId;

    proc->burstUnitId = gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x];

    if ((proc->burstUnitIdPrev != proc->burstUnitId) && (proc->burstUnitIdPrev != 0))
    {
        sub_808C8EC(proc);
        proc->showHideClock = 0;

        return;
    }

    if ((proc->burstUnitId == 0) || (Proc_Find(ProcScr_CamMove) != 0))
    {
        return;
    }

    tiProc = Proc_Find(gProcScr_TerrainDisplay);

    if (tiProc != NULL)
    {
        if (tiProc->hideContents)
        {
            if (proc->showHideClock < 4)
            {
                proc->showHideClock++;
            }

            return;
        }
    }

    piProc = Proc_Find(gProcScr_GoalDisplay);

    if (piProc != NULL)
    {
        if (piProc->hideContents)
        {
            if (proc->showHideClock < 4)
            {
                proc->showHideClock++;
            }

            return;
        }
    }

    proc->showHideClock++;

    if (proc->showHideClock < 8)
    {
        return;
    }

    if (proc->showHideClock == 8)
    {
        sub_808C750(proc, GetUnit(proc->burstUnitId));
    }
    else
    {

        proc->unitClock++;

        if (tiProc)
        {
            proc->hideContents = tiProc->hideContents;
        }
        else
        {
            proc->hideContents = false;
        }

        DrawUnitDisplayHpOrStatus(proc, GetUnit(proc->burstUnitId));
    }

    return;
}

void InitPlayerPhaseInterface(void)
{
    SetWinEnable(0, 0, 0);
    SetWOutLayers(1, 1, 1, 1, 1);
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_2, 0, 0);

    SetBlendAlpha(13, 3);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendBackdropA(0);
    SetBlendTargetB(0, 0, 1, 1, 1);

    Decompress(gGfx_PlayerInterfaceFontTiles, (void *)(VRAM + 0x2000));
    Decompress(gGfx_PlayerInterfaceNumbers, (void *)(VRAM + 0x15C00));

    CpuFastCopy((void *)(VRAM + 0x2EA0), (void *)(VRAM + 0x15D40), 0x20);

    ApplyPalette(gPaletteBuffer, 0x18);

    LoadIconPalette(1, 2);

    ResetTextFont();

    if (gPlaySt.config.disableTerrainDisplay == 0)
    {
        Proc_Start(gProcScr_TerrainDisplay, PROC_TREE_3);
    }

    if (gBmSt.gameStateBits & BM_FLAG_PREPSCREEN)
    {
        Proc_Start(gProcScr_PrepMap_MenuButtonDisplay, PROC_TREE_3);
    }
    else
    {
        if ((gPlaySt.config.disableGoalDisplay == 0) && (CheckFlag(0x66) == 0))
        {
            Proc_Start(gProcScr_GoalDisplay, PROC_TREE_3);
        }
    }

    if (gPlaySt.config.unitDisplayType == 0)
    {
        Proc_Start(gProcScr_UnitDisplay_MinimugBox, PROC_TREE_3);
    }

    if (gPlaySt.config.unitDisplayType == 1)
    {
        Proc_Start(gProcScr_UnitDisplay_Burst, PROC_TREE_3);
    }

    return;
}

void StartPlayerPhaseSideWindows(void)
{
    Proc_Start(gProcScr_SideWindowMaker, PROC_TREE_3);
    return;
}

void EndPlayerPhaseSideWindows(void)
{
    Proc_EndEach(gProcScr_UnitDisplay_MinimugBox);
    Proc_EndEach(gProcScr_UnitDisplay_Burst);
    Proc_EndEach(gProcScr_TerrainDisplay);
    Proc_EndEach(gProcScr_GoalDisplay);
    Proc_EndEach(gProcScr_PrepMap_MenuButtonDisplay);

    SetDefaultColorEffects();

    ClearBg0Bg1();

    return;
}

s8 sub_808D190(void)
{
    if (((gBmSt.playerCursor.y * 16) - gBmSt.camera.y) > 64)
    {
        return 1;
    }

    return 0;
}

int sub_808D1B4(void)
{
    if (sub_808D190() != 0)
    {
        if (sub_808C314() == -1)
        {
            return 2;
        }

        if (sub_808C314() == +1)
        {
            return 1;
        }
    }
    else
    {
        if (sub_808C33C() == -1)
        {
            return 4;
        }

        if (sub_808C33C() == +1)
        {
            return 3;
        }
    }

    return 0;
}

void sub_808D200(struct PlayerInterfaceProc * proc)
{
    TileMap_FillRect(gUiTmScratchB + TILEMAP_INDEX(20, 10), 11, 9, 0);
    TileMap_FillRect(gUiTmScratchA + TILEMAP_INDEX(20, 12), 11, 9, 0);

    if (proc->unitClock == 0)
    {
        CallARM_FillTileRect(gUiTmScratchB + TILEMAP_INDEX(20, 10), gTSA_GoalBox_OneLine, TILEREF(0x0, 1));
        PutText(proc->texts, gUiTmScratchA + TILEMAP_INDEX(21, 13));
    }

    if (proc->unitClock == 1)
    {
        CallARM_FillTileRect(gUiTmScratchB + TILEMAP_INDEX(20, 10), gTSA_GoalBox_TwoLines, TILEREF(0x0, 1));
        PutText(&proc->texts[0], gUiTmScratchA + TILEMAP_INDEX(21, 13));
        PutText(&proc->texts[1], gUiTmScratchA + TILEMAP_INDEX(21, 15));
    }
}

void GoalDisplay_Init(struct PlayerInterfaceProc * proc)
{
    int goalTextId;
    int goalWindowType;
    int turnNumber;
    int lastTurnNumber;
    char * str;
    struct Text * th;

    proc->showHideClock = 0;
    proc->isRetracting = false;
    proc->unk_50 = 0;
    proc->quadrant = -1;

    InitText(&proc->texts[0], 8);
    InitText(&proc->texts[1], 8);

    StartGreenText(proc);

    ClearText(&proc->texts[0]);
    ClearText(&proc->texts[1]);

    if (GetBattleMapKind() != BATTLEMAP_KIND_SKIRMISH)
    {
        goalTextId = GetROMChapterStruct(gPlaySt.chapterIndex)->goalWindowTextId;
    }
    else
    {
        goalTextId = MSG_19E; // TODO: msgid "Defeat enemy"
    }

    str = GetStringFromIndex(goalTextId);
    Text_InsertDrawString(&proc->texts[0], GetStringTextCenteredPos(64, str), TEXT_COLOR_SYSTEM_WHITE, str);

    if (GetBattleMapKind() != BATTLEMAP_KIND_SKIRMISH)
    {
        goalWindowType = GetROMChapterStruct(gPlaySt.chapterIndex)->goalWindowDataType;
    }
    else
    {
        goalWindowType = GOAL_TYPE_DEFEAT_ALL;
    }

    switch (goalWindowType)
    {
        case GOAL_TYPE_SEIZE:
        case GOAL_TYPE_DEFEAT_BOSS:
        case GOAL_TYPE_SPECIAL:
            proc->unitClock = 0;

            return;

        case GOAL_TYPE_DEFEAT_ALL:
            Text_InsertDrawString(
                &proc->texts[1], 16, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(MSG_1C1)); // TODO: msgid "Left"

            if (gPlaySt.chapterVisionRange != 0)
            {
                Text_InsertDrawString(&proc->texts[1], 40, TEXT_COLOR_SYSTEM_GRAY, GetStringFromIndex(MSG_535));
            }
            else
            {
                Text_InsertDrawNumberOrBlank(
                    &proc->texts[1], 48, TEXT_COLOR_SYSTEM_BLUE, CountUnitsByFaction(FACTION_RED));
            }

            break;

        case GOAL_TYPE_DEFENSE:
            turnNumber = gPlaySt.chapterTurnNumber;

            if (GetBattleMapKind() != BATTLEMAP_KIND_SKIRMISH)
            {

                if (turnNumber >= (GetROMChapterStruct(gPlaySt.chapterIndex)->goalWindowEndTurnNumber - 1))
                {
                    goto _0808D3DC;
                }
            }
            else
            {
                if (turnNumber >= -1)
                {
                _0808D3DC:
                    str = GetStringFromIndex(MSG_1C3); // TODO: msgid "Last Turn[.]"
                    Text_InsertDrawString(
                        &proc->texts[1], GetStringTextCenteredPos(64, str), TEXT_COLOR_SYSTEM_GREEN, str);

                    break;
                }
            }

            Text_InsertDrawNumberOrBlank(&proc->texts[1], 10, TEXT_COLOR_SYSTEM_BLUE, gPlaySt.chapterTurnNumber);
            Text_InsertDrawString(
                &proc->texts[1], 18, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(MSG_539)); // TODO: msgid "/[.]"

            th = &proc->texts[1];

            if (GetBattleMapKind() != BATTLEMAP_KIND_SKIRMISH)
            {
                lastTurnNumber = GetROMChapterStruct(gPlaySt.chapterIndex)->goalWindowEndTurnNumber - 1;
            }
            else
            {
                lastTurnNumber = -1;
            }

            Text_InsertDrawNumberOrBlank(th, 34, TEXT_COLOR_SYSTEM_BLUE, lastTurnNumber);
            Text_InsertDrawString(
                &proc->texts[1], 42, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(MSG_1C2)); // TODO: msgid "Turn"

            break;

        default:
            return;
    }

    proc->unitClock = 1;

    return;
}

void GoalDisplay_Loop_OnSideChange(struct PlayerInterfaceProc * proc)
{
    int quadrant;
    struct PlayerInterfaceProc * tiProc;

    proc->showHideClock = 0;
    proc->hideContents = true;

    proc->unk_50 = GetCursorQuadrant();

    quadrant =
        GetWindowQuadrant(sPlayerInterfaceConfigLut[proc->unk_50].xGoal, sPlayerInterfaceConfigLut[proc->unk_50].yGoal);

    tiProc = Proc_Find(gProcScr_TerrainDisplay);

    if (tiProc != NULL)
    {
        if ((tiProc->quadrant > -1) && (tiProc->quadrant == quadrant))
        {
            return;
        }
    }

    proc->quadrant = quadrant;

    sub_808D200(proc);

    proc->xCursor = gBmSt.playerCursor.x;
    proc->yCursor = gBmSt.playerCursor.y;

    proc->xCursorPrev = proc->xCursor;
    proc->yCursorPrev = proc->yCursor;

    Proc_Break(proc);

    return;
}

void sub_808D514(int param_1, int param_2, int param_3)
{
    int x = sPlayerInterfaceConfigLut[param_1].xGoal;
    int y = sPlayerInterfaceConfigLut[param_1].yGoal;

    if ((x < 0) && (y < 0))
    {
        TileMap_FillRect(gBG1TilemapBuffer, 12, 6, 0);
        TileMap_FillRect(gBG0TilemapBuffer, 12, 6, 0);

        TileMap_CopyRect(gUiTmScratchB + TILEMAP_INDEX(20, (16 - param_2)), gBG1TilemapBuffer, 12, param_2);
        TileMap_CopyRect(gUiTmScratchA + TILEMAP_INDEX(20, (18 - param_2)), gBG0TilemapBuffer, 12, param_2);
    }

    if ((x > 0) && (y < 0))
    {
        TileMap_FillRect(gBG1TilemapBuffer + TILEMAP_INDEX(19, 0), 12, 6, 0);
        TileMap_FillRect(gBG0TilemapBuffer + TILEMAP_INDEX(19, 0), 12, 6, 0);

        TileMap_CopyRect(
            gUiTmScratchB + TILEMAP_INDEX(20, (16 - param_2)), gBG1TilemapBuffer + TILEMAP_INDEX(19, 0), 12, param_2);
        TileMap_CopyRect(
            gUiTmScratchA + TILEMAP_INDEX(20, (18 - param_2)), gBG0TilemapBuffer + TILEMAP_INDEX(19, 0), 12, param_2);
    }

    if ((x < 0) && (y > 0))
    {
        TileMap_FillRect(gBG1TilemapBuffer + TILEMAP_INDEX(0, 14), 12, 6, 0);
        TileMap_FillRect(gBG0TilemapBuffer + TILEMAP_INDEX(0, 14), 12, 6, 0);

        TileMap_CopyRect(
            gUiTmScratchB + TILEMAP_INDEX(20, 10),
            gBG1TilemapBuffer + 0x1C0 + 0x20 * (({ (1 - param_3) * 2 + 20; }) - param_2) - 0x1C0, 12, param_2);
        TileMap_CopyRect(
            gUiTmScratchA + TILEMAP_INDEX(20, 12),
            gBG0TilemapBuffer + 0x1C0 + 0x20 * (({ (1 - param_3) * 2 + 20; }) - param_2) - 0x1C0, 12, param_2);
    }

    if ((x > 0) && (y > 0))
    {
        TileMap_FillRect(gBG1TilemapBuffer + TILEMAP_INDEX(19, 14), 12, 6, 0);
        TileMap_FillRect(gBG0TilemapBuffer + TILEMAP_INDEX(19, 14), 12, 6, 0);

        TileMap_CopyRect(
            gUiTmScratchB + TILEMAP_INDEX(20, 10),
            gBG1TilemapBuffer + 0x1D3 + 0x20 * (({ (1 - param_3) * 2 + 20; }) - param_2) - 0x1C0, 12, param_2);
        TileMap_CopyRect(
            gUiTmScratchA + TILEMAP_INDEX(20, 12),
            gBG0TilemapBuffer + 0x1D3 + 0x20 * (({ (1 - param_3) * 2 + 20; }) - param_2) - 0x1C0, 12, param_2);
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    return;
}

void GoalDisplay_Loop_SlideIn(struct PlayerInterfaceProc * proc)
{
    int unk = sGoalSlideInWidthLut[proc->showHideClock];

    sub_808D514(proc->unk_50, unk, proc->unitClock);

    proc->showHideClock++;

    if (proc->showHideClock == 5)
    {
        proc->showHideClock = 0;
        proc->hideContents = false;

        Proc_Break(proc);
    }

    return;
}

void GoalDisplay_Loop_SlideOut(struct PlayerInterfaceProc * proc)
{
    int unk;

    proc->hideContents = true;

    unk = sGoalSlideOutWidthLut[proc->showHideClock];

    sub_808D514(proc->unk_50, unk, proc->unitClock);

    proc->showHideClock++;

    if (proc->showHideClock == 3)
    {
        proc->showHideClock = 0;
        proc->hideContents = false;
        proc->isRetracting = false;
        proc->quadrant = -1;

        Proc_Break(proc);
    }

    return;
}

void sub_808D778(void)
{
    return;
}

void __malloc_unlock_0(void)
{
    return;
}

void sub_808D780(void)
{
    return;
}

void GoalDisplay_Loop_Display(struct PlayerInterfaceProc * proc)
{
    proc->xCursorPrev = proc->xCursor;
    proc->yCursorPrev = proc->yCursor;

    proc->xCursor = gBmSt.playerCursor.x;
    proc->yCursor = gBmSt.playerCursor.y;

    if (proc->xCursor == proc->xCursorPrev && proc->yCursor == proc->yCursorPrev)
    {
        return;
    }

    if (Proc_Find(ProcScr_CamMove) == NULL)
    {
        int cursorQuadrant = GetCursorQuadrant();
        int quadrant = proc->unk_50;

        if (cursorQuadrant == quadrant)
        {
            return;
        }

        if ((sPlayerInterfaceConfigLut[cursorQuadrant].xGoal == sPlayerInterfaceConfigLut[quadrant].xGoal) &&
            (sPlayerInterfaceConfigLut[cursorQuadrant].yGoal == sPlayerInterfaceConfigLut[quadrant].yGoal))
        {
            return;
        }
    }

    proc->isRetracting = true;

    Proc_Break(proc);

    return;
}

s8 IsAnyPlayerSideWindowRetracting(void)
{
    struct PlayerInterfaceProc * proc;

    proc = Proc_Find(gProcScr_UnitDisplay_MinimugBox);

    if (proc != NULL && proc->isRetracting)
    {
        return 1;
    }

    proc = Proc_Find(gProcScr_TerrainDisplay);

    if (proc != NULL && proc->isRetracting)
    {
        return 1;
    }

    proc = Proc_Find(gProcScr_GoalDisplay);

    if (proc != NULL && proc->isRetracting)
    {
        return 1;
    }

    return 0;
}

void MenuButtonDisp_Init(struct PlayerInterfaceProc * proc)
{
    Decompress(Img_PrepHelpButtonSprites, OBJ_VRAM1 + 0x1000);

    proc->xHp = 136;
    proc->yHp = 140;
    proc->isRetracting = false;

    return;
}

void sub_808D8A0(struct PlayerInterfaceProc * proc, int param_2, int param_3)
{
    int x = sPlayerInterfaceConfigLut[param_2].xGoal;
    int y = sPlayerInterfaceConfigLut[param_2].yGoal;

    if ((x < 0) && (y < 0))
    {
        proc->xHp = 8;
        proc->yHp = param_3 - 20;
    }

    if ((x > 0) && (y < 0))
    {
        proc->xHp = 172;
        proc->yHp = param_3 - 20;
    }

    if ((x < 0) && (y > 0))
    {
        proc->xHp = 8;
        proc->yHp = 164 - param_3;
    }

    if ((x > 0) && (y > 0))
    {
        proc->xHp = 172;
        proc->yHp = 164 - param_3;
    }

    return;
}

void sub_808D924(int x, int y)
{
    PutSprite(4, OAM1_X(x + 0x00), OAM0_Y(y), gObject_32x16, OAM2_CHR(0x280) + OAM2_PAL(2));
    PutSprite(4, OAM1_X(x + 0x20), OAM0_Y(y), gObject_32x16, OAM2_CHR(0x284) + OAM2_PAL(2));

    return;
}

void MenuButtonDisp_UpdateCursorPos(struct PlayerInterfaceProc * proc)
{
    proc->unk_50 = GetCursorQuadrant();

    sub_808D8A0(proc, proc->unk_50, proc->showHideClock);

    proc->showHideClock = 0;

    proc->xCursor = gBmSt.playerCursor.x;
    proc->yCursor = gBmSt.playerCursor.y;

    return;
}

void MenuButtonDisp_Loop_OnSlideIn(struct PlayerInterfaceProc * proc)
{
    proc->showHideClock += 4;

    sub_808D8A0(proc, proc->unk_50, proc->showHideClock);
    sub_808D924(proc->xHp, proc->yHp);

    if (proc->showHideClock == 24)
    {
        Proc_Break(proc);
        proc->isRetracting = false;
    }

    return;
}

void MenuButtonDisp_Loop_Display(struct PlayerInterfaceProc * proc)
{
    sub_808D924(proc->xHp, proc->yHp);

    proc->xCursorPrev = proc->xCursor;
    proc->yCursorPrev = proc->yCursor;

    proc->xCursor = gBmSt.playerCursor.x;
    proc->yCursor = gBmSt.playerCursor.y;

    if (proc->xCursor == proc->xCursorPrev && proc->yCursor == proc->yCursorPrev)
    {
        return;
    }

    if (!Proc_Find(ProcScr_CamMove))
    {
        int cursorQuadrant = GetCursorQuadrant();
        int quadrant = proc->unk_50;

        if (cursorQuadrant == quadrant)
        {
            return;
        }

        if ((sPlayerInterfaceConfigLut[cursorQuadrant].xGoal == sPlayerInterfaceConfigLut[quadrant].xGoal) &&
            (sPlayerInterfaceConfigLut[cursorQuadrant].yGoal == sPlayerInterfaceConfigLut[quadrant].yGoal))
        {
            return;
        }
    }

    proc->isRetracting = true;

    Proc_Break(proc);

    return;
}

void MenuButtonDisp_Loop_OnSlideOut(struct PlayerInterfaceProc * proc)
{
    proc->showHideClock -= 4;

    sub_808D8A0(proc, proc->unk_50, proc->showHideClock);

    sub_808D924(proc->xHp, proc->yHp);

    if (proc->showHideClock == 0)
    {
        proc->isRetracting = false;
        Proc_Break(proc);
    }

    return;
}
