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

#include "constants/terrains.h"

struct PlayerInterfaceProc {
    PROC_HEADER;

    struct TextHandle unk_2c[2];

    s8 unk_3c;
    s8 unk_3d;
    s8 unk_3e;
    s8 unk_3f;

    s16* unk_40;
    s16 unk_44;
    s16 unk_46;
    s16 unk_48;
    u8 unk_4a;
    u8 unk_4b;
    u8 xCursorPrev;
    u8 yCursorPrev;
    u8 xCursor;
    u8 yCursor;
    s8 unk_50;
    u8 unk_51;
    u8 unk_52;
    u8 unk_53;
    u8 unk_54;
    s8 unk_55;
    s8 isRetracting;
    s8 quadrant;
    int unk_58;
};

struct PlayerInterfaceConfigEntry {
    s8 xTerrain, yTerrain;
    s8 xMinimug, yMinimug;
    s8 xGoal, yGoal;
};

struct PlayerInterfaceConfigEntry sPlayerInterfaceConfigLut[4] = {
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

s8 gUnknown_08A01848[6] = {
    1, 1, 1, 1, 1, 1
};

s8 gUnknown_08A0184E[18] = {
    1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1,
    3, 3, 3, 3, 3, 3
};

s8 gUnknown_08A01860[6] = {
    0, -1, -6, 0, -1, -6
};

s8 gUnknown_08A01866[6] = {
    -6, -6, -6, 3, 3, 3
};

u16* gUnknown_08A0186C[6] = {
    gUnknown_08A175B4,
    gUnknown_08A175B4,
    gUnknown_08A175B4,
    gUnknown_08A175C8,
    gUnknown_08A175DC,
    gUnknown_08A175F0
};

u16* gUnknown_08A01884[6] = {
    gUnknown_08A1763C,
    gUnknown_08A17650,
    gUnknown_08A17664,
    gUnknown_08A17678,
    gUnknown_08A17678,
    gUnknown_08A17678
};

s8 sMMBSlideInWidthLut[4] = {
    5, 9, 11, 13
};

s8 sMMBSlideOutWidthLut[3] = {
    11, 7, 0
};

s8 sTerrainSlideInWidthLut[3] = {
    4, 5, 6
};

s8 sTerrainSlideOutWidthLut[6] = {
    5, 4, 0, 0, 0, 0
};

void TerrainDisplay_Init(struct PlayerInterfaceProc* proc);
void TerrainDisplay_Loop_OnSideChange(struct PlayerInterfaceProc* proc);
void TerrainDisplay_Loop_SlideIn(struct PlayerInterfaceProc* proc);
void TerrainDisplay_Loop_Display(struct PlayerInterfaceProc* proc);
void TerrainDisplay_Loop_SlideOut(struct PlayerInterfaceProc* proc);

struct ProcCmd CONST_DATA gProcScr_TerrainDisplay[] = {
    PROC_NAME("TI"),
    PROC_15,

    PROC_SLEEP(0),

    PROC_CALL(TerrainDisplay_Init),

PROC_LABEL(0),

    PROC_WHILE_EXISTS(gUnknown_0859A548),

    PROC_REPEAT(TerrainDisplay_Loop_OnSideChange),
    PROC_REPEAT(TerrainDisplay_Loop_SlideIn),
    PROC_REPEAT(TerrainDisplay_Loop_Display),
    PROC_REPEAT(TerrainDisplay_Loop_SlideOut),

    PROC_GOTO(0),

    PROC_END,
};

void MMB_Init(struct PlayerInterfaceProc* proc);
void MMB_Loop_OnSideChange(struct PlayerInterfaceProc* proc);
void MMB_Loop_SlideIn(struct PlayerInterfaceProc* proc);
void MMB_Loop_Display(struct PlayerInterfaceProc* proc);
void MMB_Loop_SlideOut(struct PlayerInterfaceProc* proc);
void MMB_CheckForUnit(struct PlayerInterfaceProc* proc);

struct ProcCmd CONST_DATA gProcScr_UnitDisplay_MinimugBox[] = {
    PROC_NAME("UI1"),
    PROC_15,

    PROC_SLEEP(0),

    PROC_CALL(MMB_Init),

PROC_LABEL(0),

    PROC_WHILE_EXISTS(gUnknown_0859A548),

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

void BurstDisplay_Init(struct PlayerInterfaceProc* proc);
void BurstDisplay_Loop_Display(struct PlayerInterfaceProc* proc);

struct ProcCmd CONST_DATA gProcScr_UnitDisplay_Burst[] = {
    PROC_NAME("UI2"),
    PROC_15,

    PROC_SLEEP(0),

    PROC_CALL(BurstDisplay_Init),

    PROC_REPEAT(BurstDisplay_Loop_Display),

    PROC_END,
};

void InitPlayerPhaseInterface(void);

struct ProcCmd CONST_DATA gProcScr_SideWindowMaker[] = {
    PROC_WHILE(DoesBMXFADEExist),

    PROC_CALL(InitPlayerPhaseInterface),

    PROC_END,
};

s8 sGoalSlideInWidthLut[5] = {
    1, 3, 4, 5, 6
};

s8 sGoalSlideOutWidthLut[3] = {
    3, 1, 0
};

void GoalDisplay_Init(struct PlayerInterfaceProc* proc);
void GoalDisplay_Loop_OnSideChange(struct PlayerInterfaceProc* proc);
void GoalDisplay_Loop_SlideIn(struct PlayerInterfaceProc* proc);
void GoalDisplay_Loop_Display(struct PlayerInterfaceProc* proc);
void GoalDisplay_Loop_SlideOut(struct PlayerInterfaceProc* proc);

struct ProcCmd CONST_DATA gProcScr_GoalDisplay[] = {
    PROC_NAME("PI"),
    PROC_15,

    PROC_SLEEP(0),

    PROC_CALL(GoalDisplay_Init),

PROC_LABEL(0),

    PROC_WHILE_EXISTS(gUnknown_0859A548),

    PROC_REPEAT(GoalDisplay_Loop_OnSideChange),
    PROC_REPEAT(GoalDisplay_Loop_SlideIn),
    PROC_REPEAT(GoalDisplay_Loop_Display),
    PROC_REPEAT(GoalDisplay_Loop_SlideOut),

    PROC_GOTO(0),

    PROC_END,
};

void MenuButtonDisp_Init(struct PlayerInterfaceProc* proc);
s8 IsAnyPlayerSideWindowRetracting(void);
void MenuButtonDisp_UpdateCursorPos(struct PlayerInterfaceProc* proc);
void MenuButtonDisp_Loop_OnSlideIn(struct PlayerInterfaceProc* proc);
void MenuButtonDisp_Loop_Display(struct PlayerInterfaceProc* proc);
void MenuButtonDisp_Loop_OnSlideOut(struct PlayerInterfaceProc* proc);

struct ProcCmd CONST_DATA gProcScr_PrepMap_MenuButtonDisplay[] = {
    PROC_15,

    PROC_SLEEP(0),

    PROC_CALL(MenuButtonDisp_Init),

PROC_LABEL(0),

    PROC_WHILE_EXISTS(gUnknown_0859A548),

    PROC_WHILE(IsAnyPlayerSideWindowRetracting),

    PROC_CALL(MenuButtonDisp_UpdateCursorPos),

    PROC_REPEAT(MenuButtonDisp_Loop_OnSlideIn),
    PROC_REPEAT(MenuButtonDisp_Loop_Display),
    PROC_REPEAT(MenuButtonDisp_Loop_OnSlideOut),

    PROC_GOTO(0),

    PROC_END,
};

void DrawUnitDisplayHpOrStatus(struct PlayerInterfaceProc*, struct Unit*);

int GetWindowQuadrant(int x, int y) {

    if (x < 0) {
        if (y < 0) {
            return 0;
        } else {
            return 1;
        }
    } else if (y < 0) {
        return 2;
    } else {
        return 3;
    }

}

int GetCursorQuadrant() {
    int cursorX;
    int camX;
    int cursorY;
    int camY;

    int x;
    int y;

    cursorX = (gUnknown_0202BCB0.playerCursor.x * 16);
    camX = (gUnknown_0202BCB0.camera.x - 8);

    x = cursorX - camX;

    cursorY = (gUnknown_0202BCB0.playerCursor.y * 16);
    camY = (gUnknown_0202BCB0.camera.y - 8);

    y = cursorY - camY;

    if ((x < 0x79) && (y < 0x51)) {
        return 0;
    }

    if ((x >= 0x79) && (y < 0x51)) {
        return 1;
    }

    if ((x < 0x79) && (y >= 0x51)) {
        return 2;
    }

    if ((x >= 0x79) && (y >= 0x51)) {
        return 3;
    }
}

void GetHpBarLeftTile(s16* buffer, s16 hp, int tileBase) {
    if (hp > 5) {
        hp = 5;
    }

    *buffer = hp + tileBase;

    return;
}

void GetHpBarMidTiles(s16* buffer, s16 hp, int tileBase) {
    int i;

    int hpEighth = hp >> 3;

    int eighthTileIdx = hp & 7;

    for (i = 0; i < 5; i++) {
        int fullTileIdx = tileBase + 14;
        int emptyTileIdx = tileBase + 6;

        if (i < hpEighth) {
            *buffer = fullTileIdx;
        } else if (i == hpEighth) {
            *buffer = emptyTileIdx + eighthTileIdx;
        } else {
            *buffer = emptyTileIdx;
        }

        buffer++;
    }

    return;
}

void GetHpBarRightTile(s16* buffer, s16 hp, int tileBase) {
    int base;

    if (hp >= 5) {
        hp = 5;
    }

    if (hp < 0) {
        hp = 0;
    }

    base = tileBase + 15;

    *buffer = hp + base;

    return;
}

void DrawHpBar(s16* buffer, struct Unit* unit, int tileBase) {
    s16 hpCurrent = 50 * GetUnitCurrentHp(unit);

    s16 hpPercent = Div(hpCurrent, GetUnitMaxHp(unit));

    GetHpBarLeftTile(buffer, hpPercent, tileBase);

    GetHpBarMidTiles(buffer + 1, hpPercent - 5, tileBase);

    GetHpBarRightTile(buffer + 6, hpPercent - 45, tileBase);

    return;
}

void MMB_Loop_SlideIn(struct PlayerInterfaceProc* proc) {

    int tmIndex;
    int width;

    int y = sPlayerInterfaceConfigLut[proc->unk_50].yMinimug < 0 ? 0 : 14;

    if (sPlayerInterfaceConfigLut[proc->unk_50].xMinimug < 0) {
        tmIndex = TILEMAP_INDEX(0, y);

        TileMap_FillRect(gBG0TilemapBuffer + tmIndex, 13, 6, 0);
        TileMap_FillRect(gBG1TilemapBuffer + tmIndex, 13, 6, 0);

    } else {
        tmIndex = TILEMAP_INDEX(0, y);

        TileMap_FillRect(gBG0TilemapBuffer + 0x11 + tmIndex, 13, 6, 0);
        TileMap_FillRect(gBG1TilemapBuffer + 0x11 + tmIndex, 13, 6, 0);
    }

    tmIndex = TILEMAP_INDEX(0, y);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    width = sMMBSlideInWidthLut[proc->unk_58];

    if (sPlayerInterfaceConfigLut[proc->unk_50].xMinimug < 0) {
        TileMap_CopyRect(gBmFrameTmap0 + (13 - width), gBG0TilemapBuffer + tmIndex, width, 6);
        TileMap_CopyRect(gUnknown_0200422C + (13 - width), gBG1TilemapBuffer + tmIndex, width, 6);
    } else {
        TileMap_CopyRect(gBmFrameTmap0, gBG0TilemapBuffer + TILEMAP_INDEX(30 - width, y), width, 6);
        TileMap_CopyRect(gUnknown_0200422C, gBG1TilemapBuffer + TILEMAP_INDEX(30 - width, y), width, 6);
    }

    proc->unk_58++;

    if (proc->unk_58 == 4) {
        proc->unk_55 = 0;
        proc->unk_58 = 0;

        Proc_Break(proc);

        DrawUnitDisplayHpOrStatus(proc, GetUnit(gBmMapUnit[gUnknown_0202BCB0.playerCursor.y][gUnknown_0202BCB0.playerCursor.x]));
    }

    return;
}

void MMB_Loop_SlideOut(struct PlayerInterfaceProc* proc) {

    int tmIndex;
    int width;

    int y = sPlayerInterfaceConfigLut[proc->unk_50].yMinimug < 0 ? 0 : 14;

    proc->unk_55 = 1;

    if (sPlayerInterfaceConfigLut[proc->unk_50].xMinimug < 0) {
        tmIndex = TILEMAP_INDEX(0, y);

        TileMap_FillRect(gBG0TilemapBuffer + tmIndex, 13, 6, 0);
        TileMap_FillRect(gBG1TilemapBuffer + tmIndex, 13, 6, 0);
    } else {
        tmIndex = TILEMAP_INDEX(0, y);

        TileMap_FillRect(gBG0TilemapBuffer + 0x11 + tmIndex, 13, 6, 0);
        TileMap_FillRect(gBG1TilemapBuffer + 0x11 + tmIndex, 13, 6, 0);
    }

    tmIndex = TILEMAP_INDEX(0, y);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    width = sMMBSlideOutWidthLut[proc->unk_58];

    if (sPlayerInterfaceConfigLut[proc->unk_50].xMinimug < 0) {
        TileMap_CopyRect(gBmFrameTmap0 + (13 - width), gBG0TilemapBuffer + tmIndex, width, 6);
        TileMap_CopyRect(gUnknown_0200422C + (13 - width), gBG1TilemapBuffer + tmIndex, width, 6);
    } else {
        TileMap_CopyRect(gBmFrameTmap0, gBG0TilemapBuffer + TILEMAP_INDEX(30 - width, y), width, 6);
        TileMap_CopyRect(gUnknown_0200422C, gBG1TilemapBuffer + TILEMAP_INDEX(30 - width, y), width, 6);
    }

    proc->unk_58++;

    if (proc->unk_58 == 3) {
        proc->isRetracting = 0;
        proc->unk_58 = 0;
        proc->quadrant = -1;

        Proc_Break(proc);
    }

    return;
}

void TerrainDisplay_Loop_SlideIn(struct PlayerInterfaceProc* proc) {

    int width;

    if (sPlayerInterfaceConfigLut[proc->unk_50].xTerrain < 0) {
        TileMap_FillRect(gBG0TilemapBuffer + 0x1A0, 7, 7, 0);
        TileMap_FillRect(gBG1TilemapBuffer + 0x1A0, 7, 7, 0);
    } else {
        TileMap_FillRect(gBG0TilemapBuffer + 0x1B7, 7, 7, 0);
        TileMap_FillRect(gBG1TilemapBuffer + 0x1B7, 7, 7, 0);
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    width = sTerrainSlideInWidthLut[proc->unk_58] + 1;

    if (sPlayerInterfaceConfigLut[proc->unk_50].xTerrain < 0) {
        TileMap_CopyRect(gBmFrameTmap0 + (327 - width), gBG0TilemapBuffer + 0x1A0, width, 7);
        TileMap_CopyRect(gUnknown_0200422C + (327 - width), gBG1TilemapBuffer + 0x1A0, width, 7);
    } else {
        TileMap_CopyRect(gUnknown_02003FAC, gBG0TilemapBuffer + (446 - width), width, 7);
        TileMap_CopyRect(gUnknown_020044AC, gBG1TilemapBuffer + (446 - width), width, 7);
    }

    proc->unk_58++;

    if (proc->unk_58 == 3) {
        proc->unk_58 = 0;
        proc->unk_55 = 0;

        Proc_Break(proc);
    }

    return;
}

void TerrainDisplay_Loop_SlideOut(struct PlayerInterfaceProc* proc) {

    int width;

    proc->unk_55 = 1;

    if (sPlayerInterfaceConfigLut[proc->unk_50].xTerrain < 0) {
        TileMap_FillRect(gBG0TilemapBuffer + 0x1A0, 7, 7, 0);
        TileMap_FillRect(gBG1TilemapBuffer + 0x1A0, 7, 7, 0);
    } else {
        TileMap_FillRect(gBG0TilemapBuffer + 0x1B7, 7, 7, 0);
        TileMap_FillRect(gBG1TilemapBuffer + 0x1B7, 7, 7, 0);
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    width = sTerrainSlideOutWidthLut[proc->unk_58];

    if (sPlayerInterfaceConfigLut[proc->unk_50].xTerrain < 0) {
        TileMap_CopyRect(gBmFrameTmap0 + (326 - width), gBG0TilemapBuffer + 0x1A0, width, 7);
        TileMap_CopyRect(gUnknown_0200422C + (326 - width), gBG1TilemapBuffer + 0x1A0, width, 7);
    } else {
        TileMap_CopyRect(gUnknown_02003FAC, gBG0TilemapBuffer + (446 - width), width, 7);
        TileMap_CopyRect(gUnknown_020044AC, gBG1TilemapBuffer + (446 - width), width, 7);
    }

    proc->unk_58++;

    if (proc->unk_58 == 3) {
        proc->unk_58 = 0;
        proc->unk_55 = 0;
        proc->isRetracting = 0;

        Proc_Break(proc);
    }

    return;
}

void sub_808C234(struct PlayerInterfaceProc* proc) {

    int x, y;

    if (sPlayerInterfaceConfigLut[proc->unk_50].xMinimug < 0) {
        x = 0;
    } else {
        x = 18;
    }

    if (sPlayerInterfaceConfigLut[proc->unk_50].yMinimug < 0) {
        y = 0;
    } else {
        y = 14;
    }

    TileMap_CopyRect(gBmFrameTmap0, gBG0TilemapBuffer + TILEMAP_INDEX(x, y), 13, 6);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    return;
}

void sub_808C288(struct PlayerInterfaceProc* proc) {

    int x;

    if (sPlayerInterfaceConfigLut[proc->unk_50].xTerrain < 0) {
        x = 0;
    } else {
        x = 23;
    }

    TileMap_CopyRect(gUnknown_02003FAC, gBG0TilemapBuffer + 0x1A0 + x, 7, 7);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    return;
}

void GetMinimugFactionPalette(int faction, int palId) {

    u16* pal = NULL;

    switch (faction) {
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

    CopyToPaletteBuffer(pal, palId * 0x20, 0x20);

    return;
}

int sub_808C314() {

    if (((gUnknown_0202BCB0.playerCursor.x * 16) - gUnknown_0202BCB0.camera.x) < 0x70) {
        return 1;
    } else {
        return -1;
    }
}

int sub_808C33C() {

    if (((gUnknown_0202BCB0.playerCursor.x * 16) - gUnknown_0202BCB0.camera.x) > 0x70) {
        return -1;
    } else {
        return 1;
    }
}

void sub_808C360(struct PlayerInterfaceProc* proc, s16* buffer, struct Unit* unit) {

    buffer[0] = 0x2120;
    buffer[1] = 0x2121;
    buffer[2] = 0;
    buffer[3] = 0;
    buffer[4] = 0x2121 + 0x1D;
    buffer[5] = 0;
    buffer[6] = 0;

    return;
}

void MMB_DrawStatusText(s16* buffer, struct Unit* unit) {
    int offset;

    int tileIdx = 0x16F;

    if (!unit) {
        return;
    }

    switch (unit->statusIndex) {
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

    CpuFastSet(gGfx_StatusText + offset, (void*)(VRAM + 0x2DE0), 0x28);

    buffer[0] = tileIdx++;
    buffer[1] = tileIdx++;
    buffer[2] = tileIdx++;
    buffer[3] = tileIdx++;
    buffer[4] = tileIdx++;
    buffer[5] = 0;
    buffer[6] = unit->statusDuration + 0x1128;

    return;
}

void DrawUnitDisplayHpOrStatus(struct PlayerInterfaceProc* proc, struct Unit* unit) {
    s16 frameCount = proc->unk_44;

    if (unit->statusIndex == UNIT_STATUS_RECOVER) {
        frameCount = 0;
    }

    if ((frameCount & 0x3F) == 0) {
        if ((frameCount & 0x40) != 0) {
            MMB_DrawStatusText(proc->unk_40, unit);

            BG_EnableSyncByMask(BG0_SYNC_BIT);
        } else {
            if (GetUnitCurrentHp(unit) >= 100) {
                StoreNumberStringOrDashesToSmallBuffer(0xFF);
            } else {
                StoreNumberStringOrDashesToSmallBuffer(GetUnitCurrentHp(unit));
            }

            proc->unk_51 = gUnknown_02028E44[6] - 0x30;
            proc->unk_52 = gUnknown_02028E44[7] - 0x30;

            if (GetUnitMaxHp(unit) >= 100) {
                StoreNumberStringOrDashesToSmallBuffer(0xFF);
            } else {
                StoreNumberStringOrDashesToSmallBuffer(GetUnitMaxHp(unit));
            }

            proc->unk_53 = gUnknown_02028E44[6] - 0x30;
            proc->unk_54 = gUnknown_02028E44[7] - 0x30;

            sub_808C360(proc, proc->unk_40, unit);

            BG_EnableSyncByMask(BG0_SYNC_BIT);
        }
    }

    if ((proc->unk_55 == 0) && ((frameCount & 0x40) == 0 || (unit->statusIndex == UNIT_STATUS_NONE))) {
        int x;
        int y;

        int x2;

        x = proc->unk_46 * 8;
        x2 = x + 0x11;

        y = proc->unk_48 * 8;

        if (proc->unk_51 != 0xF0) {
            CallARM_PushToSecondaryOAM(x2, y, gObject_8x8, proc->unk_51 + 0x82E0);
        }

        CallARM_PushToSecondaryOAM(x + 0x18, y, gObject_8x8, proc->unk_52 + 0x82E0);

        if (proc->unk_53 != 0xF0) {
            CallARM_PushToSecondaryOAM(x + 0x29, y, gObject_8x8, proc->unk_53 + 0x82E0);
        }

        CallARM_PushToSecondaryOAM(x + 0x30, y, gObject_8x8, proc->unk_54 + 0x82E0);
    }

    return;
}

void InitMinimugBoxMaybe(struct PlayerInterfaceProc* proc, struct Unit* unit) {
    char* str;
    int pos;
    int faceId;

    CpuFastFill(0, gBmFrameTmap0, 0x180);

    str = GetStringFromIndex(unit->pCharacterData->nameTextId);
    pos = GetStringTextCenteredPos(0x38, str);

    Text_Clear(proc->unk_2c);
    Text_SetParameters(proc->unk_2c, pos, 5);
    Text_AppendString(proc->unk_2c, str);
    Text_Draw(proc->unk_2c, gBmFrameTmap0 + 0x25);

    faceId = GetUnitMiniPortraitId(unit);

    if (unit->state & US_BIT23) {
        faceId = faceId + 1;
    }

    sub_8005988(faceId, gBmFrameTmap0 + 0x21, 0xF0, 4, 0);

    proc->unk_40 = gBmFrameTmap0 + 0x65;

    proc->unk_44 = 0;

    if (sPlayerInterfaceConfigLut[proc->unk_50].xMinimug < 0) {
        proc->unk_46 = 5;
    } else {
        proc->unk_46 = 23;
    }

    if (sPlayerInterfaceConfigLut[proc->unk_50].yMinimug < 0) {
        proc->unk_48 = 3;
    } else {
        proc->unk_48 = 17;
    }

    DrawUnitDisplayHpOrStatus(proc, unit);

    DrawHpBar(gUnknown_02003E36, unit, 0x1140);

    CallARM_FillTileRect(gUnknown_0200422C, gTSA_MinimugBox, 0x3000);

    GetMinimugFactionPalette(UNIT_FACTION(unit), 3);

    return;
}

int sub_808C710(int x, int y) {
    int cursorQuadrant = GetCursorQuadrant();

    int ret = 1;

    if ((y < 6) || ((y < 12) && (sPlayerInterfaceConfigLut[cursorQuadrant].yGoal < 0))) {
        ret = 4;
    }

    if (x < 2) {
        ret = ret - 1;
    }

    if (x > 22) {
        ret = ret + 1;
    }

    return ret;
}

void sub_808C750(struct PlayerInterfaceProc* proc, struct Unit* unit) {
    int x;
    int y;
    int unk;
    char* nameStr;
    int pos;

    int tmp = unit->xPos * 16 - gUnknown_0202BCB0.camera.x;

    if (tmp < 0) {
        tmp += 7;
    }

    x = tmp >> 3;

    tmp = unit->yPos * 16 - gUnknown_0202BCB0.camera.y;

    if (tmp < 0) {
        tmp += 7;
    }

    y = tmp >> 3;

    unk = sub_808C710(x, y);

    x = x + gUnknown_08A01860[unk];
    y = y + gUnknown_08A01866[unk];

    proc->unk_3c = x;
    proc->unk_3d = y;

    proc->unk_3e = 8;
    proc->unk_3f = 5;

    nameStr = GetStringFromIndex(unit->pCharacterData->nameTextId);
    pos = GetStringTextCenteredPos(0x38, nameStr);

    Text_Clear(proc->unk_2c);

    Text_SetParameters(proc->unk_2c, pos, 5);

    Text_AppendString(proc->unk_2c, nameStr);

    Text_Draw(
        proc->unk_2c,
        gBG0TilemapBuffer + TILEMAP_INDEX(x + gUnknown_08A01848[unk], y + gUnknown_08A0184E[unk])
    );

    proc->unk_40 = gBG0TilemapBuffer + TILEMAP_INDEX(x + 1, (y + 3));

    proc->unk_44 = 0;

    proc->unk_46 = x + 1;
    proc->unk_48 = y + 3;

    DrawUnitDisplayHpOrStatus(proc, unit);

    CallARM_FillTileRect(gBG1TilemapBuffer + TILEMAP_INDEX(x, y), gUnknown_08A0186C[unk], 0x3100);

    CallARM_FillTileRect(gBG1TilemapBuffer + TILEMAP_INDEX(x, (y + 1)), gUnknown_08A17604, 0x3100);

    CallARM_FillTileRect(gBG1TilemapBuffer + TILEMAP_INDEX(x, (y + 4)), gUnknown_08A01884[unk], 0x3100);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    GetMinimugFactionPalette(UNIT_FACTION(unit), 3);

    return;
}

void sub_808C8EC(struct PlayerInterfaceProc* proc) {
    if (proc->unk_3e == 8 && proc->unk_3f == 5) {

        TileMap_FillRect(gBG0TilemapBuffer + TILEMAP_INDEX(proc->unk_3c, proc->unk_3d), proc->unk_3e, proc->unk_3f, 0);

        TileMap_FillRect(gBG1TilemapBuffer + TILEMAP_INDEX(proc->unk_3c, proc->unk_3d), proc->unk_3e, proc->unk_3f, 0);

        BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

        proc->unk_3e = 0;
        proc->unk_3f = 0;
    }

    return;
}

void DrawTerrainDisplayWindow(struct PlayerInterfaceProc* proc) {
    char* str;
    int num;

    int terrainId = gBmMapTerrain[gUnknown_0202BCB0.playerCursor.y][gUnknown_0202BCB0.playerCursor.x];

    TileMap_FillRect(gUnknown_02003FAC, 14, 7, 0);
    TileMap_FillRect(gUnknown_020044AC, 14, 7, 0);

    str = GetTerrainName(terrainId);

    num = GetStringTextCenteredPos(0x28, str);

    Text_Clear(proc->unk_2c);
    Text_SetParameters(proc->unk_2c, num, 0);
    Text_AppendString(proc->unk_2c, str);
    Text_Draw(proc->unk_2c, gUnknown_02003FAC + 0x41);

    CallARM_FillTileRect(gUnknown_02003FAC + 0x81, gTSA_TerrainBox_Something, 0x2100);

    if (gUnknown_0880B90C[terrainId] > 0) {
        StoreNumberStringToSmallBuffer(gUnknown_0880C4BA[terrainId]);
        sub_8013138(gUnknown_02003FAC + 0x85, gUnknown_02028E44+7, 0x2128, 2);

        StoreNumberStringToSmallBuffer(gUnknown_0880C479[terrainId]);
        sub_8013138(gUnknown_02003FAC + 0xA5, gUnknown_02028E44+7, 0x2128, 2);
    }

    switch (terrainId) {
        case TERRAIN_SNAG:
        case TERRAIN_WALL_1B:
            CallARM_FillTileRect(gUnknown_020040AE, gTSA_TerrainBox_Destructable, 0x2100);

            num = GetObstacleHpAt(gUnknown_0202BCB0.playerCursor.x, gUnknown_0202BCB0.playerCursor.y);

            if (num == 100) {
                CallARM_FillTileRect(gUnknown_020040AE + 0x23,gUnknown_08A176B4, 0x100);
            } else {
                StoreNumberStringToSmallBuffer(num);
                sub_8013138(gUnknown_020040AE + 0x24, gUnknown_02028E44+7, 0x2128, 2);
            }

            break;

        case TERRAIN_BALLISTA_REGULAR:
        case TERRAIN_BALLISTA_LONG:
        case TERRAIN_BALLISTA_KILLER:
            CallARM_FillTileRect(gUnknown_02003FAC + 0x81, gTSA_TerrainBox_Ballistae, 0x100);

            StoreNumberStringToSmallBuffer(GetObstacleHpAt(gUnknown_0202BCB0.playerCursor.x, gUnknown_0202BCB0.playerCursor.y));
            sub_8013138(gUnknown_02003FAC + 0x85, gUnknown_02028E44+7, 0x2128, 2);

            break;

    }

    CallARM_FillTileRect(gUnknown_020044EC, gTSA_TerrainBox, 0x1000);

    return;
}

void TerrainDisplay_Init(struct PlayerInterfaceProc* proc) {
    proc->quadrant = -1;
    proc->isRetracting = 0;
    proc->unk_58 = 0;
    proc->unk_50 = 1;

    Text_Allocate(proc->unk_2c, 5);

    return;
}

void TerrainDisplay_Loop_OnSideChange(struct PlayerInterfaceProc* proc) {
    int quadrant;
    struct PlayerInterfaceProc* ui1Proc;
    struct PlayerInterfaceProc* piProc;

    proc->unk_55 = 1;

    proc->unk_50 = GetCursorQuadrant();

    quadrant = GetWindowQuadrant(sPlayerInterfaceConfigLut[proc->unk_50].xTerrain, sPlayerInterfaceConfigLut[proc->unk_50].yTerrain);

    ui1Proc = Proc_Find(gProcScr_UnitDisplay_MinimugBox);

    if ((ui1Proc) && (ui1Proc->quadrant > -1) && (ui1Proc->quadrant == quadrant)) {
        return;
    }

    piProc = Proc_Find(gProcScr_GoalDisplay);

    // BUG?
    if ((ui1Proc) && (piProc->quadrant > -1) && (piProc->quadrant == quadrant)) {
        return;
    }

    proc->quadrant = quadrant;

    DrawTerrainDisplayWindow(proc);

    proc->xCursor = gUnknown_0202BCB0.playerCursor.x;
    proc->yCursor = gUnknown_0202BCB0.playerCursor.y;

    Proc_Break(proc);

    return;
}

void TerrainDisplay_Loop_Display(struct PlayerInterfaceProc* proc) {

    proc->xCursorPrev = proc->xCursor;
    proc->yCursorPrev = proc->yCursor;

    proc->xCursor = gUnknown_0202BCB0.playerCursor.x;
    proc->yCursor = gUnknown_0202BCB0.playerCursor.y;

    if ((proc->xCursor == proc->xCursorPrev) && (proc->yCursor == proc->yCursorPrev)) {
        return;
    }

    if (!Proc_Find(gUnknown_0859A548)) {
        int cursorQuadrant = GetCursorQuadrant();

        if ((cursorQuadrant == proc->unk_50) || ((sPlayerInterfaceConfigLut[cursorQuadrant].xTerrain == sPlayerInterfaceConfigLut[proc->unk_50].xTerrain) && (sPlayerInterfaceConfigLut[cursorQuadrant].yTerrain == sPlayerInterfaceConfigLut[proc->unk_50].yTerrain))) {
            DrawTerrainDisplayWindow(proc);
            sub_808C288(proc);
            return;

        }
    }

    proc->isRetracting = 1;

    Proc_Break(proc);

    return;
}

void MMB_Init(struct PlayerInterfaceProc* proc) {
    proc->quadrant = -1;
    Text_Allocate(proc->unk_2c, 7);
    proc->unk_58 = 0;
    proc->isRetracting = 0;

    return;
}

void MMB_Loop_OnSideChange(struct PlayerInterfaceProc* proc) {
    int quadrant;
    struct PlayerInterfaceProc* tiProc;

    struct Unit* unit = GetUnit(gBmMapUnit[gUnknown_0202BCB0.playerCursor.y][gUnknown_0202BCB0.playerCursor.x]);

    if (!unit) {
        return;
    }

    proc->unk_55 = 1;

    proc->unk_50 = GetCursorQuadrant();

    quadrant = GetWindowQuadrant(sPlayerInterfaceConfigLut[proc->unk_50].xMinimug, sPlayerInterfaceConfigLut[proc->unk_50].yMinimug);

    tiProc = Proc_Find(gProcScr_TerrainDisplay);

    if ((tiProc) && (tiProc->quadrant > -1) && (tiProc->quadrant == quadrant)) {
        return;
    }

    proc->quadrant = quadrant;

    proc->xCursor = gUnknown_0202BCB0.playerCursor.x;
    proc->yCursor = gUnknown_0202BCB0.playerCursor.y;

    InitMinimugBoxMaybe(proc, unit);

    Proc_Break(proc);

    return;
}

void MMB_Loop_Display(struct PlayerInterfaceProc* proc) {

    struct Unit* unit = GetUnit(gBmMapUnit[gUnknown_0202BCB0.playerCursor.y][gUnknown_0202BCB0.playerCursor.x]);

    proc->unk_44++;

    DrawUnitDisplayHpOrStatus(proc, unit);

    if ((proc->unk_44 & 0x3F) == 0) {
        sub_808C234(proc);
    }

    proc->xCursorPrev = proc->xCursor;
    proc->yCursorPrev = proc->yCursor;

    proc->xCursor = gUnknown_0202BCB0.playerCursor.x;
    proc->yCursor = gUnknown_0202BCB0.playerCursor.y;

    if ((proc->xCursor == proc->xCursorPrev) && (proc->yCursor == proc->yCursorPrev)) {
        return;
    }

    if (unit && !Proc_Find(gUnknown_0859A548)) {
        int cursorQuadrant = GetCursorQuadrant();

        if ((cursorQuadrant == proc->unk_50) || ((sPlayerInterfaceConfigLut[cursorQuadrant].xMinimug == sPlayerInterfaceConfigLut[proc->unk_50].xMinimug) && (sPlayerInterfaceConfigLut[cursorQuadrant].yMinimug == sPlayerInterfaceConfigLut[proc->unk_50].yMinimug))) {
            Proc_Goto(proc, 1);
            return;
        }
    }

    proc->isRetracting = 1;

    Proc_Break(proc);

    return;
}

void MMB_CheckForUnit(struct PlayerInterfaceProc* proc) {

    struct Unit* unit = GetUnit(gBmMapUnit[gUnknown_0202BCB0.playerCursor.y][gUnknown_0202BCB0.playerCursor.x]);

    if (!unit) {
        Proc_Goto(proc, 3);
    } else {
        InitMinimugBoxMaybe(proc, unit);
        sub_808C234(proc);
    }

    return;
}

void BurstDisplay_Init(struct PlayerInterfaceProc* proc) {

    Text_Allocate(proc->unk_2c, 7);
    proc->unk_4b = 0;
    proc->unk_55 = 0;
    proc->unk_58 = 0;
    proc->unk_3e = 0;
    proc->unk_3f = 0;
    proc->isRetracting = 0;

    return;
}

void BurstDisplay_Loop_Display(struct PlayerInterfaceProc* proc) {
    struct PlayerInterfaceProc* tiProc;
    struct PlayerInterfaceProc* piProc;

    proc->unk_4a = proc->unk_4b;

    proc->unk_4b = gBmMapUnit[gUnknown_0202BCB0.playerCursor.y][gUnknown_0202BCB0.playerCursor.x];

    if ((proc->unk_4a != proc->unk_4b) && (proc->unk_4a != 0)) {
        sub_808C8EC(proc);
        proc->unk_58 = 0;

        return;
    }

    if ((proc->unk_4b == 0) || (Proc_Find(gUnknown_0859A548) != 0)) {
        return;
    }

    tiProc = Proc_Find(gProcScr_TerrainDisplay);

    if ((tiProc) && (tiProc->unk_55 != 0)) {
        if (proc->unk_58 < 4) {
            proc->unk_58++;
        }
        return;
    }

    piProc = Proc_Find(gProcScr_GoalDisplay);

    if ((piProc) && (piProc->unk_55 != 0)) {

        if (proc->unk_58 < 4) {
            proc->unk_58++;
        }
        return;
    }

    proc->unk_58++;

    if (proc->unk_58 <= 7) {
        return;
    }

    if (proc->unk_58 == 8) {
        sub_808C750(proc, GetUnit(proc->unk_4b));
    } else {

        proc->unk_44++;

        if (tiProc) {
            proc->unk_55 = tiProc->unk_55;
        } else {
            proc->unk_55 = 0;
        }

        DrawUnitDisplayHpOrStatus(proc, GetUnit(proc->unk_4b));
    }

    return;
}

void InitPlayerPhaseInterface() {

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 0;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.wincnt.wout_enableBg0 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg1 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg2 = 1;
    gLCDControlBuffer.wincnt.wout_enableBg3 = 1;
    gLCDControlBuffer.wincnt.wout_enableObj = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);
    BG_SetPosition(2, 0, 0);

    SetSpecialColorEffectsParameters(1, 0xD, 3, 0);

    sub_8001ED0(0, 1, 0, 0, 0);

    sub_8001F48(0);

    sub_8001F0C(0, 0, 1, 1, 1);

    CopyDataWithPossibleUncomp(gGfx_PlayerInterfaceFontTiles, (void*)(VRAM + 0x2000));
    CopyDataWithPossibleUncomp(gGfx_PlayerInterfaceNumbers, (void*)(VRAM + 0x15C00));

    CpuFastSet((void*)(VRAM + 0x2EA0), (void*)(VRAM + 0x15D40), 8);

    CopyToPaletteBuffer(gPaletteBuffer, 0x300, 0x20);

    LoadIconPalette(1, 2);

    sub_8003D20();

    if (gRAMChapterData.cfgDisableTerrainDisplay == 0) {
        Proc_Start(gProcScr_TerrainDisplay, PROC_TREE_3);
    }

    if (gUnknown_0202BCB0.gameStateBits & 0x10) {
        Proc_Start(gProcScr_PrepMap_MenuButtonDisplay, PROC_TREE_3);
    } else {
        if ((gRAMChapterData.cfgDisableGoalDisplay == 0) && (CheckEventId(0x66) == 0)) {
            Proc_Start(gProcScr_GoalDisplay, PROC_TREE_3);
        }
    }

    if (gRAMChapterData.cfgUnitDisplayType == 0) {
        Proc_Start(gProcScr_UnitDisplay_MinimugBox, PROC_TREE_3);
    }

    if (gRAMChapterData.cfgUnitDisplayType == 1) {
        Proc_Start(gProcScr_UnitDisplay_Burst, PROC_TREE_3);
    }

    return;
}

void StartPlayerPhaseSideWindows() {
    Proc_Start(gProcScr_SideWindowMaker, PROC_TREE_3);
    return;
}

void EndPlayerPhaseSideWindows() {

    Proc_EndEach(gProcScr_UnitDisplay_MinimugBox);
    Proc_EndEach(gProcScr_UnitDisplay_Burst);
    Proc_EndEach(gProcScr_TerrainDisplay);
    Proc_EndEach(gProcScr_GoalDisplay);
    Proc_EndEach(gProcScr_PrepMap_MenuButtonDisplay);

    SetDefaultColorEffects();

    ClearBg0Bg1();

    return;
}

s8 sub_808D190() {

    if (((gUnknown_0202BCB0.playerCursor.y * 16) - gUnknown_0202BCB0.camera.y) > 0x40) {
        return 1;
    }

    return 0;
}

int sub_808D1B4() {

    if (sub_808D190() != 0) {
        if (sub_808C314() == -1) {
            return 2;
        }

        if (sub_808C314() == 1) {
            return 1;
        }
    } else {
        if (sub_808C33C() == -1) {
            return 4;
        }

        if (sub_808C33C() == 1) {
            return 3;
        }
    }

    return 0;
}

void sub_808D200(struct PlayerInterfaceProc* proc) {

    TileMap_FillRect(gUnknown_020044D4, 11, 9, 0);

    TileMap_FillRect(gUnknown_02004054, 11, 9, 0);

    if (proc->unk_44 == 0) {
        CallARM_FillTileRect(gUnknown_020044D4, gTSA_GoalBox_OneLine, 0x1000);
        Text_Draw(proc->unk_2c, gUnknown_02004054 + 0x21);
    }

    if (proc->unk_44 == 1) {
        CallARM_FillTileRect(gUnknown_020044D4, gTSA_GoalBox_TwoLines, 0x1000);
        Text_Draw(&proc->unk_2c[0], gUnknown_02004054 + 0x21);
        Text_Draw(&proc->unk_2c[1], gUnknown_02004054 + 0x61);
    }

    return;
}

void GoalDisplay_Init(struct PlayerInterfaceProc* proc) {
    int goalTextId;
    int goalWindowType;
    int turnNumber;
    int lastTurnNumber;
    char* str;
    struct TextHandle* th;

    proc->unk_58 = 0;
    proc->isRetracting = 0;
    proc->unk_50 = 0;
    proc->quadrant = -1;

    Text_Init(&proc->unk_2c[0], 8);
    Text_Init(&proc->unk_2c[1], 8);

    NewGreenTextColorManager((struct Proc*)proc);

    Text_Clear(&proc->unk_2c[0]);
    Text_Clear(&proc->unk_2c[1]);

    if (GetChapterThing() != 2) {
        goalTextId = GetROMChapterStruct(gRAMChapterData.chapterIndex)->goalWindowTextId;
    } else {
        goalTextId = 0x19E; // TODO: msgid "Defeat enemy"
    }

    str = GetStringFromIndex(goalTextId);
    Text_InsertString(&proc->unk_2c[0], GetStringTextCenteredPos(0x40, str), 0, str);

    if (GetChapterThing() != 2) {
        goalWindowType = GetROMChapterStruct(gRAMChapterData.chapterIndex)->goalWindowDataType;
    } else {
        goalWindowType = 1;
    }

    switch (goalWindowType) {
        case 0:
        case 3:
        case 4:
            proc->unk_44 = 0;

            return;

        case 1:
            Text_InsertString(&proc->unk_2c[1], 0x10, 0, GetStringFromIndex(0x1C1)); // TODO: msgid "Left"

            if (gRAMChapterData.chapterVisionRange != 0) {
                Text_InsertString(&proc->unk_2c[1], 0x28, 1, GetStringFromIndex(0x535));
            } else {
                Text_InsertNumberOr2Dashes(&proc->unk_2c[1], 0x30, 2, CountUnitsByFaction(FACTION_RED));
            }

            break;

        case 2:
            turnNumber = gRAMChapterData.chapterTurnNumber;

            if (GetChapterThing() != 2) {

                if (turnNumber >= (GetROMChapterStruct(gRAMChapterData.chapterIndex)->goalWindowEndTurnNumber - 1)) {
                    goto _0808D3DC;
                }
            } else {
                if (turnNumber >= -1) {
            _0808D3DC:
                    str = GetStringFromIndex(0x1C3); // TODO: msgid "Last Turn[.]"
                    Text_InsertString(&proc->unk_2c[1], GetStringTextCenteredPos(0x40, str), 4, str);

                    break;
                }
            }

            Text_InsertNumberOr2Dashes(&proc->unk_2c[1], 0xA, 2, gRAMChapterData.chapterTurnNumber);

            Text_InsertString(&proc->unk_2c[1], 0x12, 0, GetStringFromIndex(0x539)); // TODO: msgid "/[.]"

            th = &proc->unk_2c[1];

            if (GetChapterThing() != 2) {
                lastTurnNumber = GetROMChapterStruct(gRAMChapterData.chapterIndex)->goalWindowEndTurnNumber - 1;
            } else {
                lastTurnNumber = -1;
            }

            Text_InsertNumberOr2Dashes(th, 0x22, 2, lastTurnNumber);

            Text_InsertString(&proc->unk_2c[1], 0x2A, 0, GetStringFromIndex(0x1C2)); // TODO: msgid "Turn"

            break;
        default:
            return;
    }

    proc->unk_44 = 1;

    return;
}

void GoalDisplay_Loop_OnSideChange(struct PlayerInterfaceProc* proc) {

    int quadrant;
    struct PlayerInterfaceProc* tiProc;

    proc->unk_58 = 0;
    proc->unk_55 = 1;

    proc->unk_50 = GetCursorQuadrant();

    quadrant = GetWindowQuadrant(sPlayerInterfaceConfigLut[proc->unk_50].xGoal, sPlayerInterfaceConfigLut[proc->unk_50].yGoal);

    tiProc = Proc_Find(gProcScr_TerrainDisplay);

    if ((tiProc) && (tiProc->quadrant > -1) && (tiProc->quadrant == quadrant)) {
        return;
    }

    proc->quadrant = quadrant;

    sub_808D200(proc);

    proc->xCursor = gUnknown_0202BCB0.playerCursor.x;
    proc->yCursor = gUnknown_0202BCB0.playerCursor.y;

    proc->xCursorPrev = proc->xCursor;
    proc->yCursorPrev = proc->yCursor;

    Proc_Break(proc);

    return;
}

#if NONMATCHING

void sub_808D514(int param_1, int param_2, int param_3) {

    int x = sPlayerInterfaceConfigLut[param_1].xGoal;
    int y = sPlayerInterfaceConfigLut[param_1].yGoal;

    if ((x < 0) && (y < 0)) {
        TileMap_FillRect(gBG1TilemapBuffer, 12, 6, 0);
        TileMap_FillRect(gBG0TilemapBuffer, 12, 6, 0);

        TileMap_CopyRect(gUnknown_02004254 + TILEMAP_INDEX(1, (16 - param_2)), gBG1TilemapBuffer, 12, param_2);
        TileMap_CopyRect(gUnknown_02003D54 + TILEMAP_INDEX(1, (18 - param_2)), gBG0TilemapBuffer, 12, param_2);
    }

    if ((x > 0) && (y < 0)) {
        TileMap_FillRect(gBG1TilemapBuffer + 0x13, 12, 6, 0);
        TileMap_FillRect(gBG0TilemapBuffer + 0x13, 12, 6, 0);

        TileMap_CopyRect(gUnknown_02004254 + TILEMAP_INDEX(1, (16 - param_2)), gBG1TilemapBuffer + 0x13, 12, param_2);
        TileMap_CopyRect(gUnknown_02003D54 + TILEMAP_INDEX(1, (18 - param_2)), gBG0TilemapBuffer + 0x13, 12, param_2);
    }

    if ((x < 0) && (y > 0)) {
        TileMap_FillRect(gBG1TilemapBuffer + 0x1C0, 12, 6, 0);
        TileMap_FillRect(gBG0TilemapBuffer + 0x1C0, 12, 6, 0);

        TileMap_CopyRect(gUnknown_020044D4, gBG1TilemapBuffer + 0x1C0 + TILEMAP_INDEX((1 - param_3), (20 - param_2)) - 0x1C0, 12, param_2);
        TileMap_CopyRect(gUnknown_02004054, gBG0TilemapBuffer + 0x1C0 + TILEMAP_INDEX((1 - param_3), (20 - param_2)) - 0x1C0, 12, param_2);
    }

    if ((x > 0) && (y > 0)) {
        TileMap_FillRect(gBG1TilemapBuffer + 0x1D3, 12, 6, 0);
        TileMap_FillRect(gBG0TilemapBuffer + 0x1D3, 12, 6, 0);

        TileMap_CopyRect(gUnknown_020044D4, gBG1TilemapBuffer + 0x1D3 + TILEMAP_INDEX((1 - param_3), (20 - param_2)) - 0x1C0, 12, param_2);
        TileMap_CopyRect(gUnknown_02004054, gBG0TilemapBuffer + 0x1D3 + TILEMAP_INDEX((1 - param_3), (20 - param_2)) - 0x1C0, 12, param_2);
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    return;
}

#else // if !NONMATCHING

__attribute__((naked))
void sub_808D514(int param_1, int param_2, int param_3) {
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        adds r7, r1, #0\n\
        mov sl, r2\n\
        ldr r1, _0808D69C  @ sPlayerInterfaceConfigLut\n\
        lsls r0, r0, #3\n\
        adds r0, r0, r1\n\
        movs r1, #4\n\
        ldrsb r1, [r0, r1]\n\
        mov r8, r1\n\
        ldrb r0, [r0, #5]\n\
        lsls r0, r0, #0x18\n\
        asrs r0, r0, #0x18\n\
        mov r9, r0\n\
        cmp r1, #0\n\
        bge _0808D582\n\
        cmp r0, #0\n\
        bge _0808D582\n\
        ldr r4, _0808D6A0  @ gBG1TilemapBuffer\n\
        adds r0, r4, #0\n\
        movs r1, #0xc\n\
        movs r2, #6\n\
        movs r3, #0\n\
        bl TileMap_FillRect\n\
        ldr r5, _0808D6A4  @ gBG0TilemapBuffer\n\
        adds r0, r5, #0\n\
        movs r1, #0xc\n\
        movs r2, #6\n\
        movs r3, #0\n\
        bl TileMap_FillRect\n\
        movs r0, #0x10\n\
        subs r0, r0, r7\n\
        lsls r0, r0, #6\n\
        ldr r1, _0808D6A8  @ gUnknown_02004254\n\
        adds r0, r0, r1\n\
        adds r1, r4, #0\n\
        movs r2, #0xc\n\
        adds r3, r7, #0\n\
        bl TileMap_CopyRect\n\
        movs r0, #0x12\n\
        subs r0, r0, r7\n\
        lsls r0, r0, #6\n\
        ldr r1, _0808D6AC  @ gUnknown_02003D54\n\
        adds r0, r0, r1\n\
        adds r1, r5, #0\n\
        movs r2, #0xc\n\
        adds r3, r7, #0\n\
        bl TileMap_CopyRect\n\
    _0808D582:\n\
        mov r0, r8\n\
        cmp r0, #0\n\
        ble _0808D5D2\n\
        mov r1, r9\n\
        cmp r1, #0\n\
        bge _0808D5D2\n\
        ldr r4, _0808D6B0  @ gUnknown_020234CE\n\
        adds r0, r4, #0\n\
        movs r1, #0xc\n\
        movs r2, #6\n\
        movs r3, #0\n\
        bl TileMap_FillRect\n\
        ldr r5, _0808D6B4  @ gUnknown_02022CCE\n\
        adds r0, r5, #0\n\
        movs r1, #0xc\n\
        movs r2, #6\n\
        movs r3, #0\n\
        bl TileMap_FillRect\n\
        movs r0, #0x10\n\
        subs r0, r0, r7\n\
        lsls r0, r0, #6\n\
        ldr r1, _0808D6A8  @ gUnknown_02004254\n\
        adds r0, r0, r1\n\
        adds r1, r4, #0\n\
        movs r2, #0xc\n\
        adds r3, r7, #0\n\
        bl TileMap_CopyRect\n\
        movs r0, #0x12\n\
        subs r0, r0, r7\n\
        lsls r0, r0, #6\n\
        ldr r1, _0808D6AC  @ gUnknown_02003D54\n\
        adds r0, r0, r1\n\
        adds r1, r5, #0\n\
        movs r2, #0xc\n\
        adds r3, r7, #0\n\
        bl TileMap_CopyRect\n\
    _0808D5D2:\n\
        mov r0, r8\n\
        cmp r0, #0\n\
        bge _0808D62C\n\
        mov r1, r9\n\
        cmp r1, #0\n\
        ble _0808D62C\n\
        ldr r5, _0808D6B8  @ gUnknown_02023828\n\
        adds r0, r5, #0\n\
        movs r1, #0xc\n\
        movs r2, #6\n\
        movs r3, #0\n\
        bl TileMap_FillRect\n\
        ldr r6, _0808D6BC  @ gUnknown_02023028\n\
        adds r0, r6, #0\n\
        movs r1, #0xc\n\
        movs r2, #6\n\
        movs r3, #0\n\
        bl TileMap_FillRect\n\
        ldr r0, _0808D6C0  @ gUnknown_020044D4\n\
        movs r4, #1\n\
        mov r1, sl\n\
        subs r4, r4, r1\n\
        lsls r4, r4, #1\n\
        adds r4, #0x14\n\
        subs r4, r4, r7\n\
        lsls r4, r4, #6\n\
        ldr r1, _0808D6C4  @ 0xFFFFFC80\n\
        adds r5, r5, r1\n\
        adds r5, r4, r5\n\
        adds r1, r5, #0\n\
        movs r2, #0xc\n\
        adds r3, r7, #0\n\
        bl TileMap_CopyRect\n\
        ldr r0, _0808D6C8  @ gUnknown_02004054\n\
        ldr r1, _0808D6C4  @ 0xFFFFFC80\n\
        adds r6, r6, r1\n\
        adds r4, r4, r6\n\
        adds r1, r4, #0\n\
        movs r2, #0xc\n\
        adds r3, r7, #0\n\
        bl TileMap_CopyRect\n\
    _0808D62C:\n\
        mov r0, r8\n\
        cmp r0, #0\n\
        ble _0808D686\n\
        mov r1, r9\n\
        cmp r1, #0\n\
        ble _0808D686\n\
        ldr r5, _0808D6CC  @ gUnknown_0202384E\n\
        adds r0, r5, #0\n\
        movs r1, #0xc\n\
        movs r2, #6\n\
        movs r3, #0\n\
        bl TileMap_FillRect\n\
        ldr r6, _0808D6D0  @ gUnknown_0202304E\n\
        adds r0, r6, #0\n\
        movs r1, #0xc\n\
        movs r2, #6\n\
        movs r3, #0\n\
        bl TileMap_FillRect\n\
        ldr r0, _0808D6C0  @ gUnknown_020044D4\n\
        movs r4, #1\n\
        mov r1, sl\n\
        subs r4, r4, r1\n\
        lsls r4, r4, #1\n\
        adds r4, #0x14\n\
        subs r4, r4, r7\n\
        lsls r4, r4, #6\n\
        ldr r1, _0808D6C4  @ 0xFFFFFC80\n\
        adds r5, r5, r1\n\
        adds r5, r4, r5\n\
        adds r1, r5, #0\n\
        movs r2, #0xc\n\
        adds r3, r7, #0\n\
        bl TileMap_CopyRect\n\
        ldr r0, _0808D6C8  @ gUnknown_02004054\n\
        ldr r1, _0808D6C4  @ 0xFFFFFC80\n\
        adds r6, r6, r1\n\
        adds r4, r4, r6\n\
        adds r1, r4, #0\n\
        movs r2, #0xc\n\
        adds r3, r7, #0\n\
        bl TileMap_CopyRect\n\
    _0808D686:\n\
        movs r0, #3\n\
        bl BG_EnableSyncByMask\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _0808D69C: .4byte sPlayerInterfaceConfigLut\n\
    _0808D6A0: .4byte gBG1TilemapBuffer\n\
    _0808D6A4: .4byte gBG0TilemapBuffer\n\
    _0808D6A8: .4byte gUnknown_02004254\n\
    _0808D6AC: .4byte gUnknown_02003D54\n\
    _0808D6B0: .4byte gUnknown_020234CE\n\
    _0808D6B4: .4byte gUnknown_02022CCE\n\
    _0808D6B8: .4byte gUnknown_02023828\n\
    _0808D6BC: .4byte gUnknown_02023028\n\
    _0808D6C0: .4byte gUnknown_020044D4\n\
    _0808D6C4: .4byte 0xFFFFFC80\n\
    _0808D6C8: .4byte gUnknown_02004054\n\
    _0808D6CC: .4byte gUnknown_0202384E\n\
    _0808D6D0: .4byte gUnknown_0202304E\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCHING

void GoalDisplay_Loop_SlideIn(struct PlayerInterfaceProc* proc) {
    int unk = sGoalSlideInWidthLut[proc->unk_58];

    sub_808D514(proc->unk_50, unk, proc->unk_44);

    proc->unk_58++;

    if (proc->unk_58 == 5) {
        proc->unk_58 = 0;
        proc->unk_55 = 0;

        Proc_Break(proc);
    }

    return;
}

void GoalDisplay_Loop_SlideOut(struct PlayerInterfaceProc* proc) {
    int unk;

    proc->unk_55 = 1;

    unk = sGoalSlideOutWidthLut[proc->unk_58];

    sub_808D514(proc->unk_50, unk, proc->unk_44);

    proc->unk_58++;

    if (proc->unk_58 == 3) {
        proc->unk_58 = 0;
        proc->unk_55 = 0;
        proc->isRetracting = 0;
        proc->quadrant = -1;

        Proc_Break(proc);
    }

    return;
}

void sub_808D778() {
    return;
}

void __malloc_unlock_0() {
    return;
}

void sub_808D780() {
    return;
}

void GoalDisplay_Loop_Display(struct PlayerInterfaceProc* proc) {

    proc->xCursorPrev = proc->xCursor;
    proc->yCursorPrev = proc->yCursor;

    proc->xCursor = gUnknown_0202BCB0.playerCursor.x;
    proc->yCursor = gUnknown_0202BCB0.playerCursor.y;

    if (proc->xCursor == proc->xCursorPrev && proc->yCursor == proc->yCursorPrev) {
        return;
    }

    if (!Proc_Find(gUnknown_0859A548)) {

        int cursorQuadrant = GetCursorQuadrant();
        int quadrant = proc->unk_50;

        if (cursorQuadrant == quadrant) {
            return;
        }

        if ((sPlayerInterfaceConfigLut[cursorQuadrant].xGoal == sPlayerInterfaceConfigLut[quadrant].xGoal) && (sPlayerInterfaceConfigLut[cursorQuadrant].yGoal == sPlayerInterfaceConfigLut[quadrant].yGoal)) {
            return;
        }
    }

    proc->isRetracting = 1;

    Proc_Break(proc);

    return;
}

s8 IsAnyPlayerSideWindowRetracting() {
    struct PlayerInterfaceProc* proc;

    proc = Proc_Find(gProcScr_UnitDisplay_MinimugBox);

    if ((proc) && (proc->isRetracting != 0)) {
        return 1;
    }

    proc = Proc_Find(gProcScr_TerrainDisplay);

    if ((proc) && (proc->isRetracting != 0)) {
        return 1;
    }

    proc = Proc_Find(gProcScr_GoalDisplay);

    if ((proc) && (proc->isRetracting != 0)) {
        return 1;
    }

    return 0;
}

void MenuButtonDisp_Init(struct PlayerInterfaceProc* proc) {
    CopyDataWithPossibleUncomp(gUnknown_08A199C8, OBJ_VRAM1 + 0x1000);

    proc->unk_46 = 136;
    proc->unk_48 = 140;
    proc->isRetracting = 0;

    return;
}

void sub_808D8A0(struct PlayerInterfaceProc* proc, int param_2, int param_3) {
    int x = sPlayerInterfaceConfigLut[param_2].xGoal;
    int y = sPlayerInterfaceConfigLut[param_2].yGoal;

    if ((x < 0) && (y < 0)) {
        proc->unk_46 = 8;
        proc->unk_48 = param_3 - 20;
    }

    if ((x > 0) && (y < 0)) {
        proc->unk_46 = 172;
        proc->unk_48 = param_3 - 20;
    }

    if ((x < 0) && (y > 0)) {
        proc->unk_46 = 8;
        proc->unk_48 = 164 - param_3;
    }

    if ((x > 0) && (y > 0)) {
        proc->unk_46 = 172;
        proc->unk_48 = 164 - param_3;
    }

    return;
}

void sub_808D924(int param_1, int param_2) {
    PutSprite(4, param_1 & 0x1FF, param_2 & 0xFF, gObject_32x16, 0x2280);
    PutSprite(4, (param_1 + 0x20) & 0x1FF, param_2 & 0xFF, gObject_32x16, 0x2284);

    return;
}

void MenuButtonDisp_UpdateCursorPos(struct PlayerInterfaceProc* proc) {

    proc->unk_50 = GetCursorQuadrant();

    sub_808D8A0(proc, proc->unk_50, proc->unk_58);

    proc->unk_58 = 0;

    proc->xCursor = gUnknown_0202BCB0.playerCursor.x;
    proc->yCursor = gUnknown_0202BCB0.playerCursor.y;

    return;
}

void MenuButtonDisp_Loop_OnSlideIn(struct PlayerInterfaceProc* proc) {

    proc->unk_58 += 4;

    sub_808D8A0(proc, proc->unk_50, proc->unk_58);
    sub_808D924(proc->unk_46, proc->unk_48);

    if (proc->unk_58 == 24) {
        Proc_Break(proc);
        proc->isRetracting = 0;
    }

    return;
}

void MenuButtonDisp_Loop_Display(struct PlayerInterfaceProc* proc) {

    sub_808D924(proc->unk_46, proc->unk_48);

    proc->xCursorPrev = proc->xCursor;
    proc->yCursorPrev = proc->yCursor;

    proc->xCursor = gUnknown_0202BCB0.playerCursor.x;
    proc->yCursor = gUnknown_0202BCB0.playerCursor.y;

    if (proc->xCursor == proc->xCursorPrev && proc->yCursor == proc->yCursorPrev) {
        return;
    }

    if (!Proc_Find(gUnknown_0859A548)) {
        int cursorQuadrant = GetCursorQuadrant();
        int quadrant = proc->unk_50;

        if (cursorQuadrant == quadrant) {
            return;
        }

        if ((sPlayerInterfaceConfigLut[cursorQuadrant].xGoal == sPlayerInterfaceConfigLut[quadrant].xGoal) && (sPlayerInterfaceConfigLut[cursorQuadrant].yGoal == sPlayerInterfaceConfigLut[quadrant].yGoal)) {
            return;
        }
    }

    proc->isRetracting = 1;

    Proc_Break(proc);

    return;
}

void MenuButtonDisp_Loop_OnSlideOut(struct PlayerInterfaceProc* proc) {

    proc->unk_58 -= 4;

    sub_808D8A0(proc, proc->unk_50, proc->unk_58);

    sub_808D924(proc->unk_46, proc->unk_48);

    if (proc->unk_58 == 0) {
        proc->isRetracting = 0;

        Proc_Break(proc);
    }

    return;
}