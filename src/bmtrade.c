#include "global.h"

#include "constants/items.h"

#include "hardware.h"
#include "icon.h"
#include "fontgrp.h"

#include "bmitem.h"
#include "bmunit.h"

#include "m4a.h"
#include "soundwrapper.h"
#include "proc.h"
#include "event.h"

enum { ITEMS_PER_COLUMN = UNIT_ITEM_COUNT };
enum { UNIT_NAME_PANEL_TILE_WIDTH = 6 };
enum { ITEM_NAME_TILE_WIDTH = 7 };

enum
{
    TRADEMENU_UNIT_UNDEFINED = 0xFF,

    TRADEMENU_UNIT_LEFT  = 0,
    TRADEMENU_UNIT_RIGHT = 1,
};

struct TradeMenuProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Unit* units[2];

    /* 34 */ s8 hasItem[2][ITEMS_PER_COLUMN + 1];

    /* 40 */ s8 hasTraded;

    /* 41 */ u8 hoverColumn;
    /* 42 */ u8 hoverLine;

    /* 43 */ u8 selectedColumn;
    /* 44 */ u8 selectedLine;

    /* 45 */ s8 unk45;

    /* 46 */ u8 unk46;
    /* 47 */ u8 unk47;

    /* 48 */ u8 tradeTutorialState;

    /* 49 */ u8 pad[0x4C - 0x49];
    /* 4C */ short timer;
};

static void TradeMenu_InitUnitNameDisplay(struct TradeMenuProc* proc);

static void TradeMenu_HighlightUpdater_OnInit(struct TradeMenuProc* proc);
static void TradeMenu_HighlightUpdater_OnLoop(struct TradeMenuProc* proc);

static int  TradeMenu_GetAdjustedRow(struct TradeMenuProc* proc, int col, int row);
static void TradeMenu_InitItemText(struct TradeMenuProc* proc);
static void TradeMenu_RefreshItemText(struct TradeMenuProc* proc);
static void TradeMenu_RefreshSelectableCells(struct TradeMenuProc* proc);
static s8   TradeMenu_UpdateSelection(struct TradeMenuProc* proc);
static void TradeMenu_ApplyItemSwap(struct TradeMenuProc* proc);
static void TradeMenu_InitItemDisplay(struct TradeMenuProc* proc);
static void TradeMenu_OnInitUnselected(struct TradeMenuProc* proc);
static void TradeMenu_OnLoopUnselected(struct TradeMenuProc* proc);
static void TradeMenu_OnInitSelected(struct TradeMenuProc* proc);
static void TradeMenu_OnLoopSelected(struct TradeMenuProc* proc);
static void TradeMenu_OnEndSelected(struct TradeMenuProc* proc);
static s8   TradeMenu_LoadForcedInitialHover(struct TradeMenuProc* proc);
static void TradeMenu_ClearDisplay(struct TradeMenuProc* proc);

static void TradeMenu_HelpBox_OnInit(struct Proc* proc);
static void TradeMenu_HelpBox_OnLoop(struct Proc* proc);
static void TradeMenu_HelpBox_OnEnd(struct Proc* proc);

struct Proc* sub_802DD6C(struct Unit* lUnit, struct Unit* rUnit, int unused);

static void TradeMenu_TutorialHandCursor_Update(void);
static void TradeMenu_DoubleTutorialHandCursor_Update(void);

static void StartTradeMenuTutorialHandCursor(void);
static void StartDoubleTradeMenuTutorialHandCursor(void);
static void EndTradeMenuTutorialHandCursor(void);
static void EndDoubleTradeMenuTutorialHandCursor(void);
static void TradeMenu_TutorialWait_OnInit(struct TradeMenuProc* proc);
static void TradeMenu_TutorialWait_OnLoop(struct TradeMenuProc* proc);

void sub_802DEDC(struct Proc* ee);

static s8 TradeMenu_UpdateTutorial(struct TradeMenuProc* proc);

void sub_802E0A0(void);
void sub_802E0B0(void);
void sub_802E0C0(void);
void sub_802E0D0(void);
void sub_802E0E0(void);
void sub_802E0F0(void);
void sub_802E100(void);
static s8 AreKeysHeld(void);

static void TradeMenu_StartTutorialEventLock(struct TradeMenuProc* proc);
static void TradeMenu_InitTradeTutorial(struct TradeMenuProc* proc);
static void sub_802E168(struct TradeMenuProc* proc);
static void sub_802E188(struct TradeMenuProc* proc);
static void sub_802E1A8(struct TradeMenuProc* proc);

enum
{
    L_TRADEMENU_UNSELECTED = 0,
    L_TRADEMENU_SELECTED   = 1,
    L_TRADEMENU_END        = 2,

    L_TRADEMENU_LOADFORCED = 101,
};

// TODO: BM_OVERLAY_DATA?
extern struct TextHandle gUnknown_0200278C[2][ITEMS_PER_COLUMN];

EWRAM_DATA static struct TradeMenuProc* sTradeMenuProc = NULL;

CONST_DATA
static struct Vec2 sItemDisplayTileLocation[2][ITEMS_PER_COLUMN] = {
    // TODO: use more constants

    [TRADEMENU_UNIT_LEFT] = {
        {  2,  9 },
        {  2, 11 },
        {  2, 13 },
        {  2, 15 },
        {  2, 17 },
    },

    [TRADEMENU_UNIT_RIGHT] = {
        { 16,  9 },
        { 16, 11 },
        { 16, 13 },
        { 16, 15 },
        { 16, 17 },
    }
};

CONST_DATA
static struct ProcCmd sProcScr_TradeMenu_HighlightUpdater[] = {
    PROC_CALL_ROUTINE(TradeMenu_HighlightUpdater_OnInit),
    PROC_LOOP_ROUTINE(TradeMenu_HighlightUpdater_OnLoop),

    PROC_END
};

CONST_DATA
static struct ProcCmd sProcScr_TradeMenu[] = {
    PROC_CALL_ROUTINE(AddSkipThread2),
    PROC_YIELD,

    PROC_WHILE_EXISTS(gUnknown_0859A548),

    PROC_CALL_ROUTINE(TradeMenu_InitItemDisplay),
    PROC_CALL_ROUTINE(TradeMenu_InitUnitNameDisplay),

    PROC_NEW_CHILD(sProcScr_TradeMenu_HighlightUpdater),

PROC_LABEL(L_TRADEMENU_LOADFORCED),
    PROC_CALL_ROUTINE(TradeMenu_InitTradeTutorial),
    PROC_CALL_ROUTINE_2(TradeMenu_LoadForcedInitialHover),
    PROC_YIELD,

PROC_LABEL(L_TRADEMENU_UNSELECTED),
    PROC_CALL_ROUTINE(TradeMenu_OnInitUnselected),
    PROC_LOOP_ROUTINE(TradeMenu_OnLoopUnselected),

PROC_LABEL(L_TRADEMENU_SELECTED),
    PROC_CALL_ROUTINE(TradeMenu_OnInitSelected),
    PROC_LOOP_ROUTINE(TradeMenu_OnLoopSelected),

    PROC_CALL_ROUTINE(TradeMenu_OnEndSelected),

    PROC_GOTO(L_TRADEMENU_UNSELECTED),

PROC_LABEL(L_TRADEMENU_END),
    PROC_CALL_ROUTINE(TradeMenu_ClearDisplay),
    PROC_CALL_ROUTINE(ClearBG0BG1),

    PROC_CALL_ROUTINE(SubSkipThread2),

    PROC_END
};

CONST_DATA
static struct ProcCmd sProcScr_TradeMenu_HelpBox[] = {
    PROC_CALL_ROUTINE(TradeMenu_HelpBox_OnInit),
    PROC_LOOP_ROUTINE(TradeMenu_HelpBox_OnLoop),

    PROC_CALL_ROUTINE(TradeMenu_HelpBox_OnEnd),

    PROC_END
};

CONST_DATA
static struct ProcCmd sProcScr_TradeMenu_TutorialHandCursor[] = {
    PROC_SET_DESTRUCTOR(TradeMenu_TutorialHandCursor_Update),
    PROC_LOOP_ROUTINE(TradeMenu_TutorialHandCursor_Update),

    PROC_END
};

CONST_DATA
static struct ProcCmd sProcScr_TradeMenu_DoubleTutorialHandCursor[] = {
    PROC_SET_DESTRUCTOR(TradeMenu_DoubleTutorialHandCursor_Update),
    PROC_LOOP_ROUTINE(TradeMenu_DoubleTutorialHandCursor_Update),

    PROC_END
};

CONST_DATA
static struct ProcCmd sProcScr_TradeMenu_TutorialWait[] = {
    PROC_CALL_ROUTINE(TradeMenu_TutorialWait_OnInit),
    PROC_LOOP_ROUTINE(TradeMenu_TutorialWait_OnLoop),

    PROC_END
};

CONST_DATA
static struct ProcCmd sProcScr_TradeMenu_TutorialEventLock[] = {
    PROC_WHILE_ROUTINE(EventEngineExists),
    PROC_WHILE_ROUTINE(AreKeysHeld),

    PROC_CALL_ROUTINE(EndTradeMenuTutorialHandCursor),
    PROC_CALL_ROUTINE(EndDoubleTradeMenuTutorialHandCursor),

    PROC_END
};

// TODO: actual events!
extern const u16 gUnknown_0859BC64[];
extern const u16 gUnknown_0859BCA8[];
extern const u16 gUnknown_0859BCF4[];
extern const u16 gUnknown_0859BD40[];

void TradeMenu_InitUnitNameDisplay(struct TradeMenuProc* proc)
{
    char* str;
    int xStart;

    // TODO: constants
    sub_80ADB7C(6, 0x4800, 0x08, 0x800, 0x400, (struct Proc*) (proc));

    sub_80ADBFC(0, -40, -1, 1);
    sub_80ADBFC(1, 184, -1, 0);

    SetSpecialColorEffectsParameters(1, 12, 6, 0);

    // TODO: name functions
    sub_8001ED0(FALSE, FALSE, FALSE, FALSE, FALSE);
    sub_8001F0C(TRUE,  TRUE,  TRUE,  TRUE,  TRUE);

    str = GetStringFromIndex(UNIT_NAME_ID(proc->units[0]));
    xStart = ((8 * UNIT_NAME_PANEL_TILE_WIDTH) - GetStringTextWidth(str)) / 2;

    // TODO: tile location macro
    DrawTextInline(NULL, gBG0TilemapBuffer + 0x00, 0, xStart, UNIT_NAME_PANEL_TILE_WIDTH, str);

    str = GetStringFromIndex(UNIT_NAME_ID(proc->units[1]));
    xStart = ((8 * UNIT_NAME_PANEL_TILE_WIDTH) - GetStringTextWidth(str)) / 2;

    // TODO: tile location macro
    DrawTextInline(NULL, gBG0TilemapBuffer + 0x18, 0, xStart, UNIT_NAME_PANEL_TILE_WIDTH, str);

    // TODO: bg mask definitions
    BG_EnableSyncByMask(1);
}

void TradeMenu_HighlightUpdater_OnInit(struct TradeMenuProc* proc)
{
    proc->hoverColumn = TRADEMENU_UNIT_UNDEFINED;
}

void TradeMenu_HighlightUpdater_OnLoop(struct TradeMenuProc* proc)
{
    struct TradeMenuProc* tradeMenu = (struct TradeMenuProc*) proc->parent;

    if (proc->hoverColumn == tradeMenu->hoverColumn && proc->hoverLine == tradeMenu->hoverLine)
        return;

    if (proc->hoverColumn != TRADEMENU_UNIT_UNDEFINED)
    {
        sub_804E90C(
            sItemDisplayTileLocation[proc->hoverColumn][proc->hoverLine].x,
            sItemDisplayTileLocation[proc->hoverColumn][proc->hoverLine].y,
            12);
    }

    sub_804E8A8(
        sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverLine].x,
        sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverLine].y,
        12);

    proc->hoverColumn = tradeMenu->hoverColumn;
    proc->hoverLine = tradeMenu->hoverLine;
}

int TradeMenu_GetAdjustedRow(struct TradeMenuProc* proc, int col, int row)
{
    while (proc->hasItem[col][row] == 0 && row >= 0)
        row--;

    return row;
}

void TradeMenu_InitItemText(struct TradeMenuProc* proc)
{
    int col, row;

    for (col = 0; col < 2; ++col)
    {
        for (row = 0; row < ITEMS_PER_COLUMN; ++row)
        {
            Text_Allocate(&gUnknown_0200278C[col][row], ITEM_NAME_TILE_WIDTH);
        }
    }
}

void TradeMenu_RefreshItemText(struct TradeMenuProc* proc)
{
    u8 xLookup[] = {  1, 15 };
    u8 yLookup[] = {  8,  8 };

    int col, row;

    CpuFastFill(0, gBG0TilemapBuffer + 0x120, 0x2C0);

    for (col = 0; col < 2; ++col)
    {
        for (row = 0; row < ITEMS_PER_COLUMN; ++row)
        {
            int item = proc->units[col]->items[row];

            Text_Clear(&gUnknown_0200278C[col][row]);

            if (item)
            {
                DrawItemMenuLine(&gUnknown_0200278C[col][row], item, IsItemDisplayUsable(proc->units[col], item),
                    ((yLookup[col] + row * 2 + 1)) * 0x20 + (1 + xLookup[col]) + gBG0TilemapBuffer);
            }
        }
    }

    BG_EnableSyncByMask(1);
}

void TradeMenu_RefreshSelectableCells(struct TradeMenuProc* proc)
{
    int col, row;

    for (col = 0; col < 2; ++col)
    {
        for (row = 0; row < ITEMS_PER_COLUMN; ++row)
        {
            u16 item = proc->units[col]->items[row];
            proc->hasItem[col][row] = (item ? TRUE : FALSE);
        }
    }

    proc->hasItem[0][ITEMS_PER_COLUMN] = 0;
    proc->hasItem[1][ITEMS_PER_COLUMN] = 0;
}

s8 TradeMenu_UpdateSelection(struct TradeMenuProc* proc)
{
    s8 changedSelection = FALSE;
    int newSelectedRow;

    if ((gKeyStatusPtr->repeatedKeys & DPAD_LEFT) && proc->hoverColumn == TRADEMENU_UNIT_RIGHT)
    {
        newSelectedRow = TradeMenu_GetAdjustedRow(proc, TRADEMENU_UNIT_LEFT, proc->hoverLine);

        if (newSelectedRow < 0)
            goto end;

        proc->hoverColumn = TRADEMENU_UNIT_LEFT;
        proc->hoverLine = newSelectedRow;

        changedSelection = TRUE;

        // TODO: SONG IDS
        PlaySoundEffect(0x67);
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) && proc->hoverColumn == TRADEMENU_UNIT_LEFT)
    {
        newSelectedRow = TradeMenu_GetAdjustedRow(proc, TRADEMENU_UNIT_RIGHT, proc->hoverLine);

        if (newSelectedRow < 0)
            goto end;

        proc->hoverColumn = TRADEMENU_UNIT_RIGHT;
        proc->hoverLine = newSelectedRow;

        changedSelection = TRUE;

        // TODO: SONG IDS
        PlaySoundEffect(0x67);
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_UP))
    {
        if (proc->hoverLine == 0)
        {
            if (gKeyStatusPtr->repeatedKeys != gKeyStatusPtr->newKeys)
                goto end;

            proc->hoverLine = TradeMenu_GetAdjustedRow(proc, proc->hoverColumn, ITEMS_PER_COLUMN - 1) + 1;
        }

        proc->hoverLine--;

        changedSelection = TRUE;

        // TODO: SONG IDS
        PlaySoundEffect(0x66);
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_DOWN))
    {
        if (!proc->hasItem[proc->hoverColumn][proc->hoverLine + 1])
        {
            if (gKeyStatusPtr->repeatedKeys != gKeyStatusPtr->newKeys)
                goto end;

            proc->hoverLine = -1;
        }

        proc->hoverLine++;

        changedSelection = TRUE;

        // TODO: SONG IDS
        PlaySoundEffect(0x66);
    }

end:
    return changedSelection;
}

void TradeMenu_ApplyItemSwap(struct TradeMenuProc* proc)
{
    u16* pItemA = &proc->units[proc->hoverColumn]->items[proc->hoverLine];
    u16* pItemB = &proc->units[proc->selectedColumn]->items[proc->selectedLine];

    u16 swp = *pItemA;
    *pItemA = *pItemB;
    *pItemB = swp;

    proc->hasTraded = TRUE;

    gActionData.unitActionType = UNIT_ACTION_TRADED;

    UnitRemoveInvalidItems(proc->units[0]);
    UnitRemoveInvalidItems(proc->units[1]);

    TradeMenu_RefreshItemText(proc);
}

void TradeMenu_InitItemDisplay(struct TradeMenuProc* proc)
{
    MakeUIWindowTileMap_BG0BG1(1,  8, 14, 12, 0);
    MakeUIWindowTileMap_BG0BG1(15, 8, 14, 12, 0);

    sub_8003D20();

    ResetIconGraphics();
    LoadIconPalettes(4); // TODO: palette id constant

    TradeMenu_InitItemText(proc);
    TradeMenu_RefreshItemText(proc);

    NewFace(0, GetUnitPortraitId(proc->units[0]), 64,  -4, 3);
    NewFace(1, GetUnitPortraitId(proc->units[1]), 176, -4, 2);

    sub_8006458(0, 5);
    sub_8006458(1, 5);

    BG_EnableSyncByMask(1 | 2); // TODO: bg bits
}

void TradeMenu_OnInitUnselected(struct TradeMenuProc* proc)
{
    TradeMenu_RefreshSelectableCells(proc);
    proc->unk45 = FALSE;
}

void TradeMenu_OnLoopUnselected(struct TradeMenuProc* proc)
{
    if (TradeMenu_UpdateTutorial(proc))
    {
        sub_804E79C(
            8 * sItemDisplayTileLocation[proc->hoverColumn][proc->hoverLine].x,
            8 * sItemDisplayTileLocation[proc->hoverColumn][proc->hoverLine].y);
    }
    else
    {
        TradeMenu_UpdateSelection(proc);

        sub_804E79C(
            8 * sItemDisplayTileLocation[proc->hoverColumn][proc->hoverLine].x,
            8 * sItemDisplayTileLocation[proc->hoverColumn][proc->hoverLine].y);

        if (gKeyStatusPtr->newKeys & A_BUTTON)
        {
            Proc_GotoLabel((struct Proc*) (proc), L_TRADEMENU_SELECTED);
            PlaySoundEffect(0x6A); // TODO: SONG ID DEFINITIONS
        }
        else if (gKeyStatusPtr->newKeys & B_BUTTON)
        {
            Proc_GotoLabel((struct Proc*) (proc), L_TRADEMENU_END);
            PlaySoundEffect(0x6B); // TODO: SONG ID DEFINITIONS
        }
        else if (gKeyStatusPtr->newKeys & R_BUTTON)
        {
            Proc_CreateBlockingChild(sProcScr_TradeMenu_HelpBox, (struct Proc*) (proc));
        }
    }
}

void TradeMenu_OnInitSelected(struct TradeMenuProc* proc)
{
    int lastRow;

    proc->selectedColumn = proc->hoverColumn;
    proc->selectedLine = proc->hoverLine;

    proc->hoverColumn = proc->hoverColumn ^ 1;

    lastRow = TradeMenu_GetAdjustedRow(proc, proc->hoverColumn, (ITEMS_PER_COLUMN - 1));

    if (lastRow != (ITEMS_PER_COLUMN - 1))
    {
        proc->hoverLine = lastRow + 1;
        proc->hasItem[proc->hoverColumn][proc->hoverLine] = TRUE;

        proc->unk45 = TRUE;

        proc->unk46 = proc->hoverColumn;
        proc->unk47 = proc->hoverLine;
    }
}

void TradeMenu_OnLoopSelected(struct TradeMenuProc* proc)
{
    if (TradeMenu_UpdateTutorial(proc))
    {
        sub_804E79C(
            8 * sItemDisplayTileLocation[proc->hoverColumn][proc->hoverLine].x,
            8 * sItemDisplayTileLocation[proc->hoverColumn][proc->hoverLine].y);

        sub_804E848(
            8 * sItemDisplayTileLocation[proc->selectedColumn][proc->selectedLine].x,
            8 * sItemDisplayTileLocation[proc->selectedColumn][proc->selectedLine].y);
    }
    else
    {
        TradeMenu_UpdateSelection(proc);

        sub_804E79C(
            8 * sItemDisplayTileLocation[proc->hoverColumn][proc->hoverLine].x,
            8 * sItemDisplayTileLocation[proc->hoverColumn][proc->hoverLine].y);

        sub_804E848(
            8 * sItemDisplayTileLocation[proc->selectedColumn][proc->selectedLine].x,
            8 * sItemDisplayTileLocation[proc->selectedColumn][proc->selectedLine].y);

        if (gKeyStatusPtr->newKeys & A_BUTTON)
        {
            TradeMenu_ApplyItemSwap(proc);

            PlaySoundEffect(0x6A); // TODO: SONG ID DEFINITIONS
            Proc_ClearNativeCallback((struct Proc*) (proc));
        }
        else if (gKeyStatusPtr->newKeys & B_BUTTON)
        {
            PlaySoundEffect(0x6B); // TODO: SONG ID DEFINITIONS
            Proc_ClearNativeCallback((struct Proc*) (proc));
        }
        else if (gKeyStatusPtr->newKeys & R_BUTTON)
        {
            Proc_CreateBlockingChild(sProcScr_TradeMenu_HelpBox, (struct Proc*) (proc));
        }
    }
}

void TradeMenu_OnEndSelected(struct TradeMenuProc* proc)
{
    proc->hoverColumn = proc->selectedColumn;
    proc->hoverLine = proc->selectedLine;

    TradeMenu_RefreshSelectableCells(proc);

    if (!proc->hasItem[proc->hoverColumn][0])
        proc->hoverColumn = proc->hoverColumn ^ 1;

    proc->hoverLine = TradeMenu_GetAdjustedRow(proc, proc->hoverColumn, proc->hoverLine);
}

s8 TradeMenu_LoadForcedInitialHover(struct TradeMenuProc* proc)
{
    if (gUnknown_0202BCB0.unk3F < 0)
        return TRUE;

    proc->hoverColumn = gUnknown_0202BCB0.unk3F / ITEMS_PER_COLUMN;
    proc->hoverLine   = gUnknown_0202BCB0.unk3F % ITEMS_PER_COLUMN;

    TradeMenu_RefreshSelectableCells(proc);
    Proc_GotoLabel((struct Proc*) (proc), L_TRADEMENU_SELECTED);

    return FALSE;
}

void TradeMenu_ClearDisplay(struct TradeMenuProc* proc)
{
    DeleteFaceByIndex(0);
    DeleteFaceByIndex(1);
}

void TradeMenu_HelpBox_OnInit(struct Proc* proc)
{
    struct TradeMenuProc* tradeMenu = (struct TradeMenuProc*) proc->parent;

    int item = tradeMenu->units[tradeMenu->hoverColumn]->items[tradeMenu->hoverLine];

    if (!item)
    {
        Proc_Delete(proc);
        return;
    }

    if (tradeMenu->unk45)
    {
        tradeMenu->hasItem[tradeMenu->unk46][tradeMenu->unk47] = FALSE;
    }

    LoadDialogueBoxGfx(NULL, -1);

    sub_8088E60(
        8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverLine].x,
        8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverLine].y,
        item);

    gKeyStatusPtr->newKeys = gKeyStatusPtr->newKeys &~ (B_BUTTON | R_BUTTON);
}

void TradeMenu_HelpBox_OnLoop(struct Proc* proc)
{
    struct TradeMenuProc* tradeMenu = (struct TradeMenuProc*) proc->parent;

    s8 changedSelection = TradeMenu_UpdateSelection(tradeMenu);
    int item = tradeMenu->units[tradeMenu->hoverColumn]->items[tradeMenu->hoverLine];

    if (changedSelection)
    {
        sub_8088E60(
            8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverLine].x,
            8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverLine].y,
            item);
    }

    if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON))
    {
        Proc_ClearNativeCallback(proc);
    }

    sub_804E79C(
        8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverLine].x,
        8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverLine].y);

    if (tradeMenu->unk45)
    {
        sub_804E848(
            8 * sItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedLine].x,
            8 * sItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedLine].y);
    }
}

void TradeMenu_HelpBox_OnEnd(struct Proc* proc)
{
    struct TradeMenuProc* tradeMenu = (struct TradeMenuProc*) proc->parent;

    if (tradeMenu->unk45)
    {
        tradeMenu->hasItem[tradeMenu->unk46][tradeMenu->unk47] = TRUE;
    }

    sub_8089018();

    sub_804E79C(
        8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverLine].x,
        8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverLine].y);

    if (tradeMenu->unk45)
    {
        sub_804E848(
            8 * sItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedLine].x,
            8 * sItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedLine].y);
    }
}

struct Proc* sub_802DD6C(struct Unit* lUnit, struct Unit* rUnit, int unused)
{
    int itemCount;

    struct TradeMenuProc* proc = (struct TradeMenuProc*) Proc_Create(sProcScr_TradeMenu, ROOT_PROC_3);

    proc->units[0] = lUnit;
    proc->units[1] = rUnit;

    proc->hasTraded = FALSE;

    proc->hoverColumn = TRADEMENU_UNIT_LEFT;
    proc->hoverLine = 0;

    proc->tradeTutorialState = 0;

    sTradeMenuProc = proc;

    if (sub_80837F8())
    {
        SetKeyStatus_IgnoreMask(A_BUTTON | START_BUTTON | DPAD_DOWN | DPAD_UP);
        proc->tradeTutorialState = 1;
    }

    if (GetUnitItemCount(lUnit) == 0)
    {
        proc->hoverColumn = TRADEMENU_UNIT_RIGHT;
    }
}

void TradeMenu_TutorialHandCursor_Update(void)
{
    struct TradeMenuProc* tradeMenu = sTradeMenuProc;

    sub_804E848(
        8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverLine].x,
        8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverLine].y);
}

void TradeMenu_DoubleTutorialHandCursor_Update(void)
{
    struct TradeMenuProc* tradeMenu = sTradeMenuProc;

    sub_804E848(
        8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverLine].x,
        8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverLine].y);

    sub_804E848(
        8 * sItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedLine].x,
        8 * sItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedLine].y);
}

void StartTradeMenuTutorialHandCursor(void)
{
    Proc_Create(sProcScr_TradeMenu_TutorialHandCursor, ROOT_PROC_3);
}

void StartDoubleTradeMenuTutorialHandCursor(void)
{
    Proc_Create(sProcScr_TradeMenu_DoubleTutorialHandCursor, ROOT_PROC_3);
}

void EndTradeMenuTutorialHandCursor(void)
{
    Proc_DeleteAllWithScript(sProcScr_TradeMenu_TutorialHandCursor);
}

void EndDoubleTradeMenuTutorialHandCursor(void)
{
    Proc_DeleteAllWithScript(sProcScr_TradeMenu_DoubleTutorialHandCursor);
}

void TradeMenu_TutorialWait_OnInit(struct TradeMenuProc* proc)
{
    proc->timer = 20;
}

void TradeMenu_TutorialWait_OnLoop(struct TradeMenuProc* proc)
{
    proc->timer--;

    if (proc->timer < 0)
        Proc_ClearNativeCallback((struct Proc*) (proc));
}

void sub_802DEDC(struct Proc* ee)
{
    if (sTradeMenuProc->tradeTutorialState != 3 && sTradeMenuProc->tradeTutorialState != 5 && sTradeMenuProc->tradeTutorialState != 8)
    {
        Proc_CreateBlockingChild(sProcScr_TradeMenu_TutorialWait, ee);
    }
}

s8 TradeMenu_UpdateTutorial(struct TradeMenuProc* proc)
{
    if (proc->tradeTutorialState != 4 && (gKeyStatusPtr->newKeys == 0))
        return FALSE;

    switch (sTradeMenuProc->tradeTutorialState)
    {

    case 2:
        if (gKeyStatusPtr->newKeys & DPAD_RIGHT)
        {
            SetKeyStatus_IgnoreMask(START_BUTTON | DPAD_UP | DPAD_DOWN);
            sub_802E168(proc);

            return FALSE;
        }

        PlaySoundEffect(0x6C); // TODO: SONG ID DEFINITIONS

        Proc_GotoLabel((struct Proc*) (proc), L_TRADEMENU_LOADFORCED);

        return TRUE;

    case 3:
        if (!(gKeyStatusPtr->newKeys & (B_BUTTON | DPAD_LEFT | R_BUTTON)))
        {
            if (!(gKeyStatusPtr->newKeys & A_BUTTON))
                return FALSE;

            if (!(gKeyStatusPtr->newKeys & (DPAD_UP | DPAD_DOWN)))
            {
                if (GetItemIndex(proc->units[proc->hoverColumn]->items[proc->hoverLine]) == ITEM_VULNERARY)
                {
                    SetKeyStatus_IgnoreMask(START_BUTTON | DPAD_UP | DPAD_DOWN);
                    sub_802E0C0();

                    return FALSE;
                }
            }
        }

        PlaySoundEffect(0x6C); // TODO: SONG ID DEFINITIONS

        sub_802E168(proc);

        return TRUE;

    case 5:
        if (gKeyStatusPtr->newKeys & A_BUTTON)
        {
            sub_802E1A8(proc);

            return FALSE;
        }

        PlaySoundEffect(0x6C); // TODO: SONG ID DEFINITIONS

        sub_802E188(proc);

        return TRUE;

    case 4:
        sub_802E188(proc);

        return TRUE;

    case 8:
        if (gKeyStatusPtr->newKeys & B_BUTTON)
        {
            SetKeyStatus_IgnoreMask(0);
            UnsetEventId(0x87); // TODO: EID/FLAG DEFINTIONS

            return FALSE;
        }

        PlaySoundEffect(0x6C); // TODO: SONG ID DEFINITIONS

        sub_802E1A8(proc);

        return TRUE;

    default:
        return FALSE;

    } // switch (sTradeMenuProc->tradeTutorialState)
}

void sub_802E0A0(void)
{
    sTradeMenuProc->tradeTutorialState = 2;
}

void sub_802E0B0(void)
{
    sTradeMenuProc->tradeTutorialState = 3;
}

void sub_802E0C0(void)
{
    sTradeMenuProc->tradeTutorialState = 4;
}

void sub_802E0D0(void)
{
    sTradeMenuProc->tradeTutorialState = 5;
}

void sub_802E0E0(void)
{
    sTradeMenuProc->tradeTutorialState = 6;
}

void sub_802E0F0(void)
{
    sTradeMenuProc->tradeTutorialState = 7;
}

void sub_802E100(void)
{
    sTradeMenuProc->tradeTutorialState = 8;
}

s8 AreKeysHeld(void)
{
    if (!gKeyStatusPtr->heldKeys)
        return FALSE;

    return TRUE;
}

void TradeMenu_StartTutorialEventLock(struct TradeMenuProc* proc)
{
    Proc_CreateBlockingChild(sProcScr_TradeMenu_TutorialEventLock, (struct Proc*) (proc));
}

void TradeMenu_InitTradeTutorial(struct TradeMenuProc* proc)
{
    if (proc->tradeTutorialState)
    {
        CallEvent(gUnknown_0859BC64, EV_EXEC_QUIET);
        TradeMenu_StartTutorialEventLock(proc);

        StartTradeMenuTutorialHandCursor();
    }
}

void sub_802E168(struct TradeMenuProc* proc)
{
    CallEvent(gUnknown_0859BCA8, EV_EXEC_QUIET);
    TradeMenu_StartTutorialEventLock(proc);

    StartTradeMenuTutorialHandCursor();
}

void sub_802E188(struct TradeMenuProc* proc)
{
    CallEvent(gUnknown_0859BCF4, EV_EXEC_QUIET);
    TradeMenu_StartTutorialEventLock(proc);

    StartDoubleTradeMenuTutorialHandCursor();
}

void sub_802E1A8(struct TradeMenuProc* proc)
{
    CallEvent(gUnknown_0859BD40, EV_EXEC_QUIET);
    TradeMenu_StartTutorialEventLock(proc);

    StartTradeMenuTutorialHandCursor();
}
