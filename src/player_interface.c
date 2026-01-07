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

#include "player_interface.h"

#include "constants/event-flags.h"
#include "constants/msg.h"
#include "constants/terrains.h"

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

s8 CONST_DATA gUnitBurstMapUiTextXTable[6] =
{
    1, 1, 1, 1, 1, 1
};

s8 CONST_DATA gUnitBurstMapUiTextYTable[18] =
{
    1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1,
    3, 3, 3, 3, 3, 3
};

s8 CONST_DATA gUnitBurstMapUiXOffsetTable[6] =
{
    0, -1, -6, 0, -1, -6
};

s8 CONST_DATA gUnitBurstMapUiYOffsetTable[6] =
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

struct ProcCmd CONST_DATA gProcScr_UnitDisplay_Burst[] =
{
    PROC_NAME("UI2"),
    PROC_15,
    PROC_YIELD,

    PROC_CALL(BurstDisplay_Init),
    PROC_REPEAT(BurstDisplay_Loop_Display),

    PROC_END,
};

struct ProcCmd CONST_DATA gProcScr_SideWindowMaker[] =
{
    PROC_WHILE(DoesBMXFADEExist),
    PROC_CALL(InitPlayerPhaseInterface),
    PROC_END,
};

s8 CONST_DATA sGoalSlideInWidthLut[5] =
{
    1, 3, 4, 5, 6
};

s8 CONST_DATA sGoalSlideOutWidthLut[3] =
{
    3, 1, 0
};

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

//! FE8U = 0x0808BBAC
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

//! FE8U = 0x0808BBCC
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

    if ((x < (DISPLAY_WIDTH / 2) + 1) && (y < (DISPLAY_HEIGHT / 2) + 1))
    {
        return 0;
    }

    if ((x >= (DISPLAY_WIDTH / 2) + 1) && (y < (DISPLAY_HEIGHT / 2) + 1))
    {
        return 1;
    }

    if ((x < (DISPLAY_WIDTH / 2) + 1) && (y >= (DISPLAY_HEIGHT / 2) + 1))
    {
        return 2;
    }

    if ((x >= (DISPLAY_WIDTH / 2) + 1) && (y >= (DISPLAY_HEIGHT / 2) + 1))
    {
        return 3;
    }
}

//! FE8U = 0x0808BC10
void GetHpBarLeftTile(u16 * buffer, s16 hp, int tileBase)
{
    if (hp > 5)
        hp = 5;

    *buffer = hp + tileBase;

    return;
}

//! FE8U = 0x0808BC2C
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

//! FE8U = 0x0808BC68
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

//! FE8U = 0x0808BC94
void DrawHpBar(u16 * buffer, struct Unit * unit, int tileBase)
{
    s16 hpCurrent = 50 * GetUnitCurrentHp(unit);
    s16 hpPercent = Div(hpCurrent, GetUnitMaxHp(unit));

    GetHpBarLeftTile(buffer, hpPercent, tileBase);
    GetHpBarMidTiles(buffer + 1, hpPercent - 5, tileBase);
    GetHpBarRightTile(buffer + 6, hpPercent - 45, tileBase);

    return;
}

//! FE8U = 0x0808BCF8
void MMB_Loop_SlideIn(struct PlayerInterfaceProc * proc)
{
    int tmIndex;
    int width;

    int y = sPlayerInterfaceConfigLut[proc->cursorQuadrant].yMinimug < 0 ? 0 : 14;

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xMinimug < 0)
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

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xMinimug < 0)
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

        UnitMapUiUpdate(proc, GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]));
    }

    return;
}

//! FE8U = 0x0808BE70
void MMB_Loop_SlideOut(struct PlayerInterfaceProc * proc)
{
    int tmIndex;
    int width;

    int y = sPlayerInterfaceConfigLut[proc->cursorQuadrant].yMinimug < 0 ? 0 : 14;

    proc->hideContents = true;

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xMinimug < 0)
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

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xMinimug < 0)
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
        proc->windowQuadrant = -1;

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0808BFD4
void TerrainDisplay_Loop_SlideIn(struct PlayerInterfaceProc * proc)
{
    int width;

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xTerrain < 0)
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

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xTerrain < 0)
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

//! FE8U = 0x0808C100
void TerrainDisplay_Loop_SlideOut(struct PlayerInterfaceProc * proc)
{
    int width;

    proc->hideContents = true;

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xTerrain < 0)
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

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xTerrain < 0)
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

//! FE8U = 0x0808C234
void sub_808C234(struct PlayerInterfaceProc * proc)
{
    int x;
    int y;

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xMinimug < 0)
    {
        x = 0;
    }
    else
    {
        x = 18;
    }

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].yMinimug < 0)
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

//! FE8U = 0x0808C288
void sub_808C288(struct PlayerInterfaceProc * proc)
{
    int x;

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xTerrain < 0)
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

//! FE8U = 0x0808C2CC
void ApplyUnitMapUiFramePal(int faction, int palId)
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

//! FE8U = 0x0808C314
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

//! FE8U = 0x0808C33C
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

//! FE8U = 0x0808C360
void ClearUnitMapUiStatus(struct PlayerInterfaceProc * proc, u16 * buffer, struct Unit * unit)
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

//! FE8U = 0x0808C388
void PutUnitMapUiStatus(u16 * buffer, struct Unit * unit)
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

    CpuFastCopy(gGfx_StatusText + offset, BG_CHR_ADDR(0x16F), 5 * CHR_SIZE);

    buffer[0] = tileIdx++;
    buffer[1] = tileIdx++;
    buffer[2] = tileIdx++;
    buffer[3] = tileIdx++;
    buffer[4] = tileIdx++;
    buffer[5] = 0;
    buffer[6] = TILEREF(0x128 + unit->statusDuration, 1);

    return;
}

//! FE8U = 0x0808C45C
void UnitMapUiUpdate(struct PlayerInterfaceProc * proc, struct Unit * unit)
{
    s16 frameCount = proc->unitClock;

    if (unit->statusIndex == UNIT_STATUS_RECOVER)
    {
        frameCount = 0;
    }

    if ((frameCount & 63) == 0)
    {
        if ((frameCount & 64) != 0)
        {
            PutUnitMapUiStatus(proc->statusTm, unit);
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

            proc->hpCurHi = gNumberStr[6] - '0';
            proc->hpCurLo = gNumberStr[7] - '0';

            if (GetUnitMaxHp(unit) >= 100)
            {
                StoreNumberStringOrDashesToSmallBuffer(0xFF);
            }
            else
            {
                StoreNumberStringOrDashesToSmallBuffer(GetUnitMaxHp(unit));
            }

            proc->hpMaxHi = gNumberStr[6] - '0';
            proc->hpMaxLo = gNumberStr[7] - '0';

            ClearUnitMapUiStatus(proc, proc->statusTm, unit);
            BG_EnableSyncByMask(BG0_SYNC_BIT);
        }
    }

    if ((proc->hideContents == false) && ((frameCount & 64) == 0 || (unit->statusIndex == UNIT_STATUS_NONE)))
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

//! FE8U = 0x0808C5D0
void DrawUnitMapUi(struct PlayerInterfaceProc * proc, struct Unit * unit)
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

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].xMinimug < 0)
    {
        proc->xHp = 5;
    }
    else
    {
        proc->xHp = 23;
    }

    if (sPlayerInterfaceConfigLut[proc->cursorQuadrant].yMinimug < 0)
    {
        proc->yHp = 3;
    }
    else
    {
        proc->yHp = 17;
    }

    UnitMapUiUpdate(proc, unit);
    DrawHpBar(gUiTmScratchA + TILEMAP_INDEX(5, 4), unit, TILEREF(0x140, 1));

    CallARM_FillTileRect(gUiTmScratchB, gTSA_MinimugBox, TILEREF(0x0, 3));
    ApplyUnitMapUiFramePal(UNIT_FACTION(unit), 3);

    return;
}

//! FE8U = 0x0808C710
int GetUnitBurstMapUiOrientationAt(int x, int y)
{
    int cursorQuadrant = GetCursorQuadrant();

    int result = 1;

    if ((y < 6) || ((y < 12) && (sPlayerInterfaceConfigLut[cursorQuadrant].yGoal < 0)))
    {
        result = 4;
    }

    if (x < 2)
    {
        result = result - 1;
    }

    if (x > 22)
    {
        result = result + 1;
    }

    return result;
}

//! FE8U = 0x0808C750
void DrawUnitBurstMapUi(struct PlayerInterfaceProc * proc, struct Unit * unit)
{
    int x;
    int y;
    int orientation;
    char * nameStr;
    int pos;

    x = (unit->xPos * 16 - gBmSt.camera.x) / 8;
    y = (unit->yPos * 16 - gBmSt.camera.y) / 8;

    orientation = GetUnitBurstMapUiOrientationAt(x, y);

    x = x + gUnitBurstMapUiXOffsetTable[orientation];
    y = y + gUnitBurstMapUiYOffsetTable[orientation];

    proc->xBurst = x;
    proc->yBurst = y;

    proc->wBurst = 8;
    proc->hBurst = 5;

    nameStr = GetStringFromIndex(unit->pCharacterData->nameTextId);
    pos = GetStringTextCenteredPos(56, nameStr);

    ClearText(proc->texts);

    Text_SetParams(proc->texts, pos, TEXT_COLOR_SYSTEM_BLACK);
    Text_DrawString(proc->texts, nameStr);

    PutText(proc->texts, gBG0TilemapBuffer + TILEMAP_INDEX(
        x + gUnitBurstMapUiTextXTable[orientation],
        y + gUnitBurstMapUiTextYTable[orientation]));

    proc->statusTm = gBG0TilemapBuffer + TILEMAP_INDEX(x + 1, y + 3);

    proc->unitClock = 0;

    proc->xHp = x + 1;
    proc->yHp = y + 3;

    UnitMapUiUpdate(proc, unit);

    CallARM_FillTileRect(gBG1TilemapBuffer + TILEMAP_INDEX(x, y), gUnknown_08A0186C[orientation], TILEREF(0x100, 3));
    CallARM_FillTileRect(gBG1TilemapBuffer + TILEMAP_INDEX(x, y + 1), gUnknown_08A17604, TILEREF(0x100, 3));
    CallARM_FillTileRect(gBG1TilemapBuffer + TILEMAP_INDEX(x, y + 4), gUnknown_08A01884[orientation], TILEREF(0x100, 3));

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    ApplyUnitMapUiFramePal(UNIT_FACTION(unit), 3);

    return;
}

//! FE8U = 0x0808C8EC
void ClearUnitBurstMapUi(struct PlayerInterfaceProc * proc)
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

//! FE8U = 0x0808C964
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

    CallARM_FillTileRect(gUiTmScratchA + TILEMAP_INDEX(1, 14), Tsa_TerrainMapUi_Labels, TILEREF(0x100, 2));

    if (TerrainTable_MovCost_BerserkerNormal[terrainId] > 0)
    {
        StoreNumberStringToSmallBuffer(TerrainTable_Def_Common[terrainId]);
        PutDigits(gUiTmScratchA + TILEMAP_INDEX(5, 14), gNumberStr + 7, TILEREF(0x128, 2), 2);

        StoreNumberStringToSmallBuffer(TerrainTable_Avo_Common[terrainId]);
        PutDigits(gUiTmScratchA + TILEMAP_INDEX(5, 15), gNumberStr + 7, TILEREF(0x128, 2), 2);
    }

    switch (terrainId)
    {
    case TERRAIN_SNAG:
    case TERRAIN_WALL_DAMAGED:
        CallARM_FillTileRect(gUiTmScratchA + TILEMAP_INDEX(1, 14), Tsa_TerrainMapUi_ObstacleLabels, TILEREF(0x100, 2));

        num = GetObstacleHpAt(gBmSt.playerCursor.x, gBmSt.playerCursor.y);

        if (num == 100)
        {
            CallARM_FillTileRect(gUiTmScratchA + TILEMAP_INDEX(4, 15), Tsa_TerrainMapUi_ObstacleFullHp, TILEREF(0x100, 0));
        }
        else
        {
            StoreNumberStringToSmallBuffer(num);
            PutDigits(gUiTmScratchA + TILEMAP_INDEX(5, 15), gNumberStr + 7, TILEREF(0x128, 2), 2);
        }

        break;

    case TERRAIN_BALLISTA_REGULAR:
    case TERRAIN_BALLISTA_LONG:
    case TERRAIN_BALLISTA_KILLER:
        CallARM_FillTileRect(gUiTmScratchA + TILEMAP_INDEX(1, 14), gTSA_TerrainBox_Ballistae, TILEREF(0x100, 0));

        StoreNumberStringToSmallBuffer(GetObstacleHpAt(gBmSt.playerCursor.x, gBmSt.playerCursor.y));
        PutDigits(gUiTmScratchA + TILEMAP_INDEX(5, 14), gNumberStr + 7, TILEREF(0x128, 2), 2);

        break;
    }

    CallARM_FillTileRect(gUiTmScratchB + TILEMAP_INDEX(0, 11), gTSA_TerrainBox, TILEREF(0x0, 1));
}

//! FE8U = 0x0808CB34
void TerrainDisplay_Init(struct PlayerInterfaceProc * proc)
{
    proc->windowQuadrant = -1;
    proc->isRetracting = false;
    proc->showHideClock = 0;
    proc->cursorQuadrant = 1;

    InitTextDb(proc->texts, 5);

    return;
}

//! FE8U = 0x0808CB5C
void TerrainDisplay_Loop_OnSideChange(struct PlayerInterfaceProc * proc)
{
    int quadrant;
    struct PlayerInterfaceProc * ui1Proc;
    struct PlayerInterfaceProc * piProc;

    proc->hideContents = true;

    proc->cursorQuadrant = GetCursorQuadrant();

    quadrant = GetWindowQuadrant(
        sPlayerInterfaceConfigLut[proc->cursorQuadrant].xTerrain,
        sPlayerInterfaceConfigLut[proc->cursorQuadrant].yTerrain);

    ui1Proc = Proc_Find(gProcScr_UnitDisplay_MinimugBox);

    if (ui1Proc != NULL)
    {
        if ((ui1Proc->windowQuadrant > -1) && (ui1Proc->windowQuadrant == quadrant))
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
        if ((piProc->windowQuadrant > -1) && (piProc->windowQuadrant == quadrant))
        {
            return;
        }
    }

    proc->windowQuadrant = quadrant;

    DrawTerrainDisplayWindow(proc);

    proc->xCursor = gBmSt.playerCursor.x;
    proc->yCursor = gBmSt.playerCursor.y;

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0808CC00
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

        if ((cursorQuadrant == proc->cursorQuadrant) ||
            ((sPlayerInterfaceConfigLut[cursorQuadrant].xTerrain ==
              sPlayerInterfaceConfigLut[proc->cursorQuadrant].xTerrain) &&
             (sPlayerInterfaceConfigLut[cursorQuadrant].yTerrain ==
              sPlayerInterfaceConfigLut[proc->cursorQuadrant].yTerrain)))
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

//! FE8U = 0x0808CCA0
void MMB_Init(struct PlayerInterfaceProc * proc)
{
    proc->windowQuadrant = -1;
    InitTextDb(proc->texts, 7);
    proc->showHideClock = 0;
    proc->isRetracting = false;

    return;
}

//! FE8U = 0x0808CCC8
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

    proc->cursorQuadrant = GetCursorQuadrant();

    quadrant = GetWindowQuadrant(
        sPlayerInterfaceConfigLut[proc->cursorQuadrant].xMinimug,
        sPlayerInterfaceConfigLut[proc->cursorQuadrant].yMinimug);

    tiProc = Proc_Find(gProcScr_TerrainDisplay);

    if (tiProc != NULL)
    {
        if ((tiProc->windowQuadrant > -1) && (tiProc->windowQuadrant == quadrant))
        {
            return;
        }
    }

    proc->windowQuadrant = quadrant;

    proc->xCursor = gBmSt.playerCursor.x;
    proc->yCursor = gBmSt.playerCursor.y;

    DrawUnitMapUi(proc, unit);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0808CD74
void MMB_Loop_Display(struct PlayerInterfaceProc * proc)
{
    struct Unit * unit = GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]);

    proc->unitClock++;

    UnitMapUiUpdate(proc, unit);

    if ((proc->unitClock & 63) == 0)
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

        if ((cursorQuadrant == proc->cursorQuadrant) ||
            ((sPlayerInterfaceConfigLut[cursorQuadrant].xMinimug ==
              sPlayerInterfaceConfigLut[proc->cursorQuadrant].xMinimug) &&
             (sPlayerInterfaceConfigLut[cursorQuadrant].yMinimug ==
              sPlayerInterfaceConfigLut[proc->cursorQuadrant].yMinimug)))
        {
            Proc_Goto(proc, 1);
            return;
        }
    }

    proc->isRetracting = true;

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0808CE50
void MMB_CheckForUnit(struct PlayerInterfaceProc * proc)
{
    struct Unit * unit = GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]);

    if (unit == NULL)
    {
        Proc_Goto(proc, 3);
    }
    else
    {
        DrawUnitMapUi(proc, unit);
        sub_808C234(proc);
    }

    return;
}

//! FE8U = 0x0808CE9C
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

//! FE8U = 0x0808CEC8
void BurstDisplay_Loop_Display(struct PlayerInterfaceProc * proc)
{
    struct PlayerInterfaceProc * tiProc;
    struct PlayerInterfaceProc * piProc;

    proc->burstUnitIdPrev = proc->burstUnitId;

    proc->burstUnitId = gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x];

    if ((proc->burstUnitIdPrev != proc->burstUnitId) && (proc->burstUnitIdPrev != 0))
    {
        ClearUnitBurstMapUi(proc);
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
        DrawUnitBurstMapUi(proc, GetUnit(proc->burstUnitId));
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

        UnitMapUiUpdate(proc, GetUnit(proc->burstUnitId));
    }

    return;
}

//! FE8U = 0x0808CFC4
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

    Decompress(gGfx_PlayerInterfaceFontTiles, BG_CHR_ADDR(0x100));
    Decompress(gGfx_PlayerInterfaceNumbers, OBJ_CHR_ADDR(0x2E0));

    CpuFastCopy(BG_CHR_ADDR(0x175), OBJ_CHR_ADDR(0x2EA), CHR_SIZE);

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
        if ((gPlaySt.config.disableGoalDisplay == 0) && (CheckFlag(EVFLAG_OBJWINDOW_DISABLE) == 0))
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

//! FE8U = 0x0808D13C
void StartPlayerPhaseSideWindows(void)
{
    Proc_Start(gProcScr_SideWindowMaker, PROC_TREE_3);
    return;
}

//! FE8U = 0x0808D150
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

//! FE8U = 0x0808D190
bool sub_808D190(void)
{
    if (((gBmSt.playerCursor.y * 16) - gBmSt.camera.y) > 64)
    {
        return true;
    }

    return false;
}

//! FE8U = 0x0808D1B4
int sub_808D1B4(void)
{
    if (sub_808D190())
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

//! FE8U = 0x0808D200
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

//! FE8U = 0x0808D288
void GoalDisplay_Init(struct PlayerInterfaceProc * proc)
{
    int goalTextId;
    int goalWindowType;
    int turnNumber;
    int lastTurnNumber;
    char * str;
    struct Text * text;

    proc->showHideClock = 0;
    proc->isRetracting = false;
    proc->cursorQuadrant = 0;
    proc->windowQuadrant = -1;

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
        goalTextId = MSG_19E; // "Defeat enemy"
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
            &proc->texts[1], 16, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(MSG_1C1)); // "Left"

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
                str = GetStringFromIndex(MSG_1C3); // "Last Turn[.]"
                Text_InsertDrawString(
                    &proc->texts[1], GetStringTextCenteredPos(64, str), TEXT_COLOR_SYSTEM_GREEN, str);

                break;
            }
        }

        Text_InsertDrawNumberOrBlank(&proc->texts[1], 10, TEXT_COLOR_SYSTEM_BLUE, gPlaySt.chapterTurnNumber);
        Text_InsertDrawString(
            &proc->texts[1], 18, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(MSG_539)); // "/[.]"

        text = &proc->texts[1];

        if (GetBattleMapKind() != BATTLEMAP_KIND_SKIRMISH)
        {
            lastTurnNumber = GetROMChapterStruct(gPlaySt.chapterIndex)->goalWindowEndTurnNumber - 1;
        }
        else
        {
            lastTurnNumber = -1;
        }

        Text_InsertDrawNumberOrBlank(text, 34, TEXT_COLOR_SYSTEM_BLUE, lastTurnNumber);
        Text_InsertDrawString(
            &proc->texts[1], 42, TEXT_COLOR_SYSTEM_WHITE, GetStringFromIndex(MSG_1C2)); // "Turn"

        break;

    default:
        return;
    }

    proc->unitClock = 1;

    return;
}

//! FE8U = 0x0808D47C
void GoalDisplay_Loop_OnSideChange(struct PlayerInterfaceProc * proc)
{
    int quadrant;
    struct PlayerInterfaceProc * tiProc;

    proc->showHideClock = 0;
    proc->hideContents = true;

    proc->cursorQuadrant = GetCursorQuadrant();

    quadrant = GetWindowQuadrant(
        sPlayerInterfaceConfigLut[proc->cursorQuadrant].xGoal, sPlayerInterfaceConfigLut[proc->cursorQuadrant].yGoal);

    tiProc = Proc_Find(gProcScr_TerrainDisplay);

    if (tiProc != NULL)
    {
        if ((tiProc->windowQuadrant > -1) && (tiProc->windowQuadrant == quadrant))
        {
            return;
        }
    }

    proc->windowQuadrant = quadrant;

    sub_808D200(proc);

    proc->xCursor = gBmSt.playerCursor.x;
    proc->yCursor = gBmSt.playerCursor.y;

    proc->xCursorPrev = proc->xCursor;
    proc->yCursorPrev = proc->yCursor;

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0808D514
void sub_808D514(int quadrant, int param_2, int param_3)
{
    int x = sPlayerInterfaceConfigLut[quadrant].xGoal;
    int y = sPlayerInterfaceConfigLut[quadrant].yGoal;

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

//! FE8U = 0x0808D6D4
void GoalDisplay_Loop_SlideIn(struct PlayerInterfaceProc * proc)
{
    int unk = sGoalSlideInWidthLut[proc->showHideClock];

    sub_808D514(proc->cursorQuadrant, unk, proc->unitClock);

    proc->showHideClock++;

    if (proc->showHideClock == 5)
    {
        proc->showHideClock = 0;
        proc->hideContents = false;

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0808D71C
void GoalDisplay_Loop_SlideOut(struct PlayerInterfaceProc * proc)
{
    int unk;

    proc->hideContents = true;

    unk = sGoalSlideOutWidthLut[proc->showHideClock];

    sub_808D514(proc->cursorQuadrant, unk, proc->unitClock);

    proc->showHideClock++;

    if (proc->showHideClock == 3)
    {
        proc->showHideClock = 0;
        proc->hideContents = false;
        proc->isRetracting = false;
        proc->windowQuadrant = -1;

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0808D778
void sub_808D778(void)
{
    return;
}

//! FE8U = 0x0808D77C
void __malloc_unlock_0(void)
{
    return;
}

//! FE8U = 0x0808D780
void sub_808D780(void)
{
    return;
}

//! FE8U = 0x0808D784
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
        int quadrant = proc->cursorQuadrant;

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

//! FE8U = 0x0808D814
bool IsAnyPlayerSideWindowRetracting(void)
{
    struct PlayerInterfaceProc * proc;

    proc = Proc_Find(gProcScr_UnitDisplay_MinimugBox);

    if (proc != NULL && proc->isRetracting)
    {
        return true;
    }

    proc = Proc_Find(gProcScr_TerrainDisplay);

    if (proc != NULL && proc->isRetracting)
    {
        return true;
    }

    proc = Proc_Find(gProcScr_GoalDisplay);

    if (proc != NULL && proc->isRetracting)
    {
        return true;
    }

    return false;
}

//! FE8U = 0x0808D870
void MenuButtonDisp_Init(struct PlayerInterfaceProc * proc)
{
    Decompress(Img_PrepHelpButtonSprites, OBJ_CHR_ADDR(0x280));

    proc->xHp = 136;
    proc->yHp = 140;
    proc->isRetracting = false;

    return;
}

//! FE8U = 0x0808D8A0
void UpdateMenuButtonPos(struct PlayerInterfaceProc * proc, int quadrant, int offset)
{
    int x = sPlayerInterfaceConfigLut[quadrant].xGoal;
    int y = sPlayerInterfaceConfigLut[quadrant].yGoal;

    if ((x < 0) && (y < 0))
    {
        proc->xHp = 8;
        proc->yHp = offset - 20;
    }

    if ((x > 0) && (y < 0))
    {
        proc->xHp = 172;
        proc->yHp = offset - 20;
    }

    if ((x < 0) && (y > 0))
    {
        proc->xHp = 8;
        proc->yHp = 164 - offset;
    }

    if ((x > 0) && (y > 0))
    {
        proc->xHp = 172;
        proc->yHp = 164 - offset;
    }

    return;
}

//! FE8U = 0x0808D924
void DrawMenuButtonAt(int x, int y)
{
    PutSprite(4, OAM1_X(x + 0), OAM0_Y(y), gObject_32x16, OAM2_CHR(0x280) + OAM2_PAL(2));
    PutSprite(4, OAM1_X(x + 32), OAM0_Y(y), gObject_32x16, OAM2_CHR(0x284) + OAM2_PAL(2));

    return;
}

//! FE8U = 0x0808D97C
void MenuButtonDisp_UpdateCursorPos(struct PlayerInterfaceProc * proc)
{
    proc->cursorQuadrant = GetCursorQuadrant();

    UpdateMenuButtonPos(proc, proc->cursorQuadrant, proc->showHideClock);

    proc->showHideClock = 0;

    proc->xCursor = gBmSt.playerCursor.x;
    proc->yCursor = gBmSt.playerCursor.y;

    return;
}

//! FE8U = 0x0808D9B8
void MenuButtonDisp_Loop_OnSlideIn(struct PlayerInterfaceProc * proc)
{
    proc->showHideClock += 4;

    UpdateMenuButtonPos(proc, proc->cursorQuadrant, proc->showHideClock);
    DrawMenuButtonAt(proc->xHp, proc->yHp);

    if (proc->showHideClock == 24)
    {
        Proc_Break(proc);
        proc->isRetracting = false;
    }

    return;
}

//! FE8U = 0x0808D9FC
void MenuButtonDisp_Loop_Display(struct PlayerInterfaceProc * proc)
{
    DrawMenuButtonAt(proc->xHp, proc->yHp);

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
        int quadrant = proc->cursorQuadrant;

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

//! FE8U = 0x0808DAA0
void MenuButtonDisp_Loop_OnSlideOut(struct PlayerInterfaceProc * proc)
{
    proc->showHideClock -= 4;

    UpdateMenuButtonPos(proc, proc->cursorQuadrant, proc->showHideClock);
    DrawMenuButtonAt(proc->xHp, proc->yHp);

    if (proc->showHideClock == 0)
    {
        proc->isRetracting = false;
        Proc_Break(proc);
    }

    return;
}
