#include "global.h"

#include "constants/items.h"

#include "proc.h"
#include "hardware.h"
#include "icon.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "statscreen.h"

#include "bmitem.h"
#include "bmunit.h"

#include "m4a.h"
#include "soundwrapper.h"
#include "event.h"

enum
{
    // MAGIC CONSTANTS

    UNIT_PANEL_WIDTH = 6,

    ITEM_PANEL_WIDTH = 7,

    ITEM_PANEL_LEFT_X = 1,
    ITEM_PANEL_LEFT_Y = 8,

    ITEM_PANEL_RIGHT_X = 15,
    ITEM_PANEL_RIGHT_Y = 8,
};

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

    /* 34 */ s8 hasItem[2][UNIT_ITEM_COUNT + 1];

    /* 40 */ s8 hasTraded;

    /* 41 */ u8 hoverColumn;
    /* 42 */ u8 hoverRow;

    /* 43 */ u8 selectedColumn;
    /* 44 */ u8 selectedRow;

    /* 45 */ s8 extraCellEnabled;

    /* 46 */ u8 extraColumn;
    /* 47 */ u8 extraRow;

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

static void TradeMenu_TutorialHandCursor_Update(void);
static void TradeMenu_DoubleTutorialHandCursor_Update(void);

static void StartTradeMenuTutorialHandCursor(void);
static void StartDoubleTradeMenuTutorialHandCursor(void);
static void EndTradeMenuTutorialHandCursor(void);
static void EndDoubleTradeMenuTutorialHandCursor(void);
static void TradeMenu_TutorialWait_OnInit(struct TradeMenuProc* proc);
static void TradeMenu_TutorialWait_OnLoop(struct TradeMenuProc* proc);

static s8 TradeMenu_UpdateTutorial(struct TradeMenuProc* proc);

// ASMCs
void sub_802DEDC(struct Proc* ee);
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
extern struct TextHandle gTradeMenuText[2][UNIT_ITEM_COUNT];

EWRAM_DATA static struct TradeMenuProc* sTradeMenuProc = NULL;

CONST_DATA
static struct Vec2 sItemDisplayTileLocation[2][UNIT_ITEM_COUNT] = {
    [TRADEMENU_UNIT_LEFT] = {
        { ITEM_PANEL_LEFT_X + 1, ITEM_PANEL_LEFT_Y + 1 },
        { ITEM_PANEL_LEFT_X + 1, ITEM_PANEL_LEFT_Y + 3 },
        { ITEM_PANEL_LEFT_X + 1, ITEM_PANEL_LEFT_Y + 5 },
        { ITEM_PANEL_LEFT_X + 1, ITEM_PANEL_LEFT_Y + 7 },
        { ITEM_PANEL_LEFT_X + 1, ITEM_PANEL_LEFT_Y + 9 },
    },

    [TRADEMENU_UNIT_RIGHT] = {
        { ITEM_PANEL_RIGHT_X + 1, ITEM_PANEL_RIGHT_Y + 1 },
        { ITEM_PANEL_RIGHT_X + 1, ITEM_PANEL_RIGHT_Y + 3 },
        { ITEM_PANEL_RIGHT_X + 1, ITEM_PANEL_RIGHT_Y + 5 },
        { ITEM_PANEL_RIGHT_X + 1, ITEM_PANEL_RIGHT_Y + 7 },
        { ITEM_PANEL_RIGHT_X + 1, ITEM_PANEL_RIGHT_Y + 9 },
    }
};

CONST_DATA
static struct ProcCmd sProcScr_TradeMenu_HighlightUpdater[] = {
    PROC_CALL(TradeMenu_HighlightUpdater_OnInit),
    PROC_REPEAT(TradeMenu_HighlightUpdater_OnLoop),

    PROC_END
};

CONST_DATA
static struct ProcCmd sProcScr_TradeMenu[] = {
    PROC_CALL(AddSkipThread2),
    PROC_YIELD,

    PROC_WHILE_EXISTS(gUnknown_0859A548),

    PROC_CALL(TradeMenu_InitItemDisplay),
    PROC_CALL(TradeMenu_InitUnitNameDisplay),

    PROC_START_CHILD(sProcScr_TradeMenu_HighlightUpdater),

PROC_LABEL(L_TRADEMENU_LOADFORCED),
    PROC_CALL(TradeMenu_InitTradeTutorial),
    PROC_CALL_2(TradeMenu_LoadForcedInitialHover),
    PROC_YIELD,

PROC_LABEL(L_TRADEMENU_UNSELECTED),
    PROC_CALL(TradeMenu_OnInitUnselected),
    PROC_REPEAT(TradeMenu_OnLoopUnselected),

PROC_LABEL(L_TRADEMENU_SELECTED),
    PROC_CALL(TradeMenu_OnInitSelected),
    PROC_REPEAT(TradeMenu_OnLoopSelected),

    PROC_CALL(TradeMenu_OnEndSelected),

    PROC_GOTO(L_TRADEMENU_UNSELECTED),

PROC_LABEL(L_TRADEMENU_END),
    PROC_CALL(TradeMenu_ClearDisplay),
    PROC_CALL(ClearBg0Bg1),

    PROC_CALL(SubSkipThread2),

    PROC_END
};

CONST_DATA
static struct ProcCmd sProcScr_TradeMenu_HelpBox[] = {
    PROC_CALL(TradeMenu_HelpBox_OnInit),
    PROC_REPEAT(TradeMenu_HelpBox_OnLoop),

    PROC_CALL(TradeMenu_HelpBox_OnEnd),

    PROC_END
};

CONST_DATA
static struct ProcCmd sProcScr_TradeMenu_TutorialHandCursor[] = {
    PROC_SET_END_CB(TradeMenu_TutorialHandCursor_Update),
    PROC_REPEAT(TradeMenu_TutorialHandCursor_Update),

    PROC_END
};

CONST_DATA
static struct ProcCmd sProcScr_TradeMenu_DoubleTutorialHandCursor[] = {
    PROC_SET_END_CB(TradeMenu_DoubleTutorialHandCursor_Update),
    PROC_REPEAT(TradeMenu_DoubleTutorialHandCursor_Update),

    PROC_END
};

CONST_DATA
static struct ProcCmd sProcScr_TradeMenu_TutorialWait[] = {
    PROC_CALL(TradeMenu_TutorialWait_OnInit),
    PROC_REPEAT(TradeMenu_TutorialWait_OnLoop),

    PROC_END
};

CONST_DATA
static struct ProcCmd sProcScr_TradeMenu_TutorialEventLock[] = {
    PROC_WHILE(EventEngineExists),
    PROC_WHILE(AreKeysHeld),

    PROC_CALL(EndTradeMenuTutorialHandCursor),
    PROC_CALL(EndDoubleTradeMenuTutorialHandCursor),

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

    // TODO: special effect constants
    SetSpecialColorEffectsParameters(1, 12, 6, 0);

    // TODO: name functions
    sub_8001ED0(FALSE, FALSE, FALSE, FALSE, FALSE);
    sub_8001F0C(TRUE,  TRUE,  TRUE,  TRUE,  TRUE);

    // TODO: text color constants

    str = GetStringFromIndex(UNIT_NAME_ID(proc->units[0]));
    xStart = ((8 * UNIT_PANEL_WIDTH) - GetStringTextWidth(str)) / 2;

    DrawTextInline(NULL, gBG0TilemapBuffer + TILEMAP_INDEX(0, 0), 0, xStart, UNIT_PANEL_WIDTH, str);

    str = GetStringFromIndex(UNIT_NAME_ID(proc->units[1]));
    xStart = ((8 * UNIT_PANEL_WIDTH) - GetStringTextWidth(str)) / 2;

    DrawTextInline(NULL, gBG0TilemapBuffer + TILEMAP_INDEX(24, 0), 0, xStart, UNIT_PANEL_WIDTH, str);

    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

void TradeMenu_HighlightUpdater_OnInit(struct TradeMenuProc* proc)
{
    proc->hoverColumn = TRADEMENU_UNIT_UNDEFINED;
}

void TradeMenu_HighlightUpdater_OnLoop(struct TradeMenuProc* proc)
{
    struct TradeMenuProc* tradeMenu = proc->proc_parent;

    if (proc->hoverColumn == tradeMenu->hoverColumn && proc->hoverRow == tradeMenu->hoverRow)
        return;

    if (proc->hoverColumn != TRADEMENU_UNIT_UNDEFINED)
    {
        ClearUiItemHover(
            sItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].x,
            sItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].y,
            12);
    }

    DrawUiItemHover(
        sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
        sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y,
        12);

    proc->hoverColumn = tradeMenu->hoverColumn;
    proc->hoverRow = tradeMenu->hoverRow;
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
        for (row = 0; row < UNIT_ITEM_COUNT; ++row)
        {
            Text_Allocate(&gTradeMenuText[col][row], ITEM_PANEL_WIDTH);
        }
    }
}

void TradeMenu_RefreshItemText(struct TradeMenuProc* proc)
{
    u8 xLookup[] = { ITEM_PANEL_LEFT_X, ITEM_PANEL_RIGHT_X };
    u8 yLookup[] = { ITEM_PANEL_LEFT_Y, ITEM_PANEL_RIGHT_Y };

    int col, row;

    CpuFastFill(0, gBG0TilemapBuffer + TILEMAP_INDEX(0, 9), 11 * 0x20 * sizeof(u16));

    for (col = 0; col < 2; ++col)
    {
        for (row = 0; row < UNIT_ITEM_COUNT; ++row)
        {
            int item = proc->units[col]->items[row];

            Text_Clear(&gTradeMenuText[col][row]);

            if (item)
            {
                DrawItemMenuLine(&gTradeMenuText[col][row], item, IsItemDisplayUsable(proc->units[col], item),
                    gBG0TilemapBuffer + TILEMAP_INDEX(xLookup[col] + 1, yLookup[col] + row * 2 + 1));
            }
        }
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

void TradeMenu_RefreshSelectableCells(struct TradeMenuProc* proc)
{
    int col, row;

    for (col = 0; col < 2; ++col)
    {
        for (row = 0; row < UNIT_ITEM_COUNT; ++row)
        {
            u16 item = proc->units[col]->items[row];
            proc->hasItem[col][row] = (item ? TRUE : FALSE);
        }
    }

    proc->hasItem[0][UNIT_ITEM_COUNT] = 0;
    proc->hasItem[1][UNIT_ITEM_COUNT] = 0;
}

s8 TradeMenu_UpdateSelection(struct TradeMenuProc* proc)
{
    s8 changedSelection = FALSE;
    int newSelectedRow;

    if ((gKeyStatusPtr->repeatedKeys & DPAD_LEFT) && proc->hoverColumn == TRADEMENU_UNIT_RIGHT)
    {
        newSelectedRow = TradeMenu_GetAdjustedRow(proc, TRADEMENU_UNIT_LEFT, proc->hoverRow);

        if (newSelectedRow < 0)
            goto end;

        proc->hoverColumn = TRADEMENU_UNIT_LEFT;
        proc->hoverRow = newSelectedRow;

        changedSelection = TRUE;

        // TODO: SONG IDS
        PlaySoundEffect(0x67);
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) && proc->hoverColumn == TRADEMENU_UNIT_LEFT)
    {
        newSelectedRow = TradeMenu_GetAdjustedRow(proc, TRADEMENU_UNIT_RIGHT, proc->hoverRow);

        if (newSelectedRow < 0)
            goto end;

        proc->hoverColumn = TRADEMENU_UNIT_RIGHT;
        proc->hoverRow = newSelectedRow;

        changedSelection = TRUE;

        // TODO: SONG IDS
        PlaySoundEffect(0x67);
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_UP))
    {
        if (proc->hoverRow == 0)
        {
            if (gKeyStatusPtr->repeatedKeys != gKeyStatusPtr->newKeys)
                goto end;

            proc->hoverRow = TradeMenu_GetAdjustedRow(proc, proc->hoverColumn, UNIT_ITEM_COUNT - 1) + 1;
        }

        proc->hoverRow--;

        changedSelection = TRUE;

        // TODO: SONG IDS
        PlaySoundEffect(0x66);
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_DOWN))
    {
        if (!proc->hasItem[proc->hoverColumn][proc->hoverRow + 1])
        {
            if (gKeyStatusPtr->repeatedKeys != gKeyStatusPtr->newKeys)
                goto end;

            proc->hoverRow = -1;
        }

        proc->hoverRow++;

        changedSelection = TRUE;

        // TODO: SONG IDS
        PlaySoundEffect(0x66);
    }

end:
    return changedSelection;
}

void TradeMenu_ApplyItemSwap(struct TradeMenuProc* proc)
{
    u16* pItemA = &proc->units[proc->hoverColumn]->items[proc->hoverRow];
    u16* pItemB = &proc->units[proc->selectedColumn]->items[proc->selectedRow];

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
    DrawUiFrame2(1,  8, 14, 12, 0);
    DrawUiFrame2(15, 8, 14, 12, 0);

    sub_8003D20();

    ResetIconGraphics();
    LoadIconPalettes(4); // TODO: palette id constant

    TradeMenu_InitItemText(proc);
    TradeMenu_RefreshItemText(proc);

    // TODO: face display type (arg 5) constants
    NewFace(0, GetUnitPortraitId(proc->units[0]), 64,  -4, 3);
    NewFace(1, GetUnitPortraitId(proc->units[1]), 176, -4, 2);

    sub_8006458(0, 5);
    sub_8006458(1, 5);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

void TradeMenu_OnInitUnselected(struct TradeMenuProc* proc)
{
    TradeMenu_RefreshSelectableCells(proc);
    proc->extraCellEnabled = FALSE;
}

void TradeMenu_OnLoopUnselected(struct TradeMenuProc* proc)
{
    if (TradeMenu_UpdateTutorial(proc))
    {
        DisplayUiHand(
            8 * sItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].x,
            8 * sItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].y);
    }
    else
    {
        TradeMenu_UpdateSelection(proc);

        DisplayUiHand(
            8 * sItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].x,
            8 * sItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].y);

        if (gKeyStatusPtr->newKeys & A_BUTTON)
        {
            Proc_Goto(proc, L_TRADEMENU_SELECTED);
            PlaySoundEffect(0x6A); // TODO: SONG ID DEFINITIONS
        }
        else if (gKeyStatusPtr->newKeys & B_BUTTON)
        {
            Proc_Goto(proc, L_TRADEMENU_END);
            PlaySoundEffect(0x6B); // TODO: SONG ID DEFINITIONS
        }
        else if (gKeyStatusPtr->newKeys & R_BUTTON)
        {
            Proc_StartBlocking(sProcScr_TradeMenu_HelpBox, proc);
        }
    }
}

void TradeMenu_OnInitSelected(struct TradeMenuProc* proc)
{
    int lastRow;

    proc->selectedColumn = proc->hoverColumn;
    proc->selectedRow = proc->hoverRow;

    proc->hoverColumn = proc->hoverColumn ^ 1;

    lastRow = TradeMenu_GetAdjustedRow(proc, proc->hoverColumn, (UNIT_ITEM_COUNT - 1));

    if (lastRow != (UNIT_ITEM_COUNT - 1))
    {
        proc->hoverRow = lastRow + 1;
        proc->hasItem[proc->hoverColumn][proc->hoverRow] = TRUE;

        proc->extraCellEnabled = TRUE;

        proc->extraColumn = proc->hoverColumn;
        proc->extraRow = proc->hoverRow;
    }
}

void TradeMenu_OnLoopSelected(struct TradeMenuProc* proc)
{
    if (TradeMenu_UpdateTutorial(proc))
    {
        DisplayUiHand(
            8 * sItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].x,
            8 * sItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].y);

        DisplayFrozenUiHand(
            8 * sItemDisplayTileLocation[proc->selectedColumn][proc->selectedRow].x,
            8 * sItemDisplayTileLocation[proc->selectedColumn][proc->selectedRow].y);
    }
    else
    {
        TradeMenu_UpdateSelection(proc);

        DisplayUiHand(
            8 * sItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].x,
            8 * sItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].y);

        DisplayFrozenUiHand(
            8 * sItemDisplayTileLocation[proc->selectedColumn][proc->selectedRow].x,
            8 * sItemDisplayTileLocation[proc->selectedColumn][proc->selectedRow].y);

        if (gKeyStatusPtr->newKeys & A_BUTTON)
        {
            TradeMenu_ApplyItemSwap(proc);

            PlaySoundEffect(0x6A); // TODO: SONG ID DEFINITIONS
            Proc_Break(proc);
        }
        else if (gKeyStatusPtr->newKeys & B_BUTTON)
        {
            PlaySoundEffect(0x6B); // TODO: SONG ID DEFINITIONS
            Proc_Break(proc);
        }
        else if (gKeyStatusPtr->newKeys & R_BUTTON)
        {
            Proc_StartBlocking(sProcScr_TradeMenu_HelpBox, proc);
        }
    }
}

void TradeMenu_OnEndSelected(struct TradeMenuProc* proc)
{
    proc->hoverColumn = proc->selectedColumn;
    proc->hoverRow = proc->selectedRow;

    TradeMenu_RefreshSelectableCells(proc);

    if (!proc->hasItem[proc->hoverColumn][0])
        proc->hoverColumn = proc->hoverColumn ^ 1;

    proc->hoverRow = TradeMenu_GetAdjustedRow(proc, proc->hoverColumn, proc->hoverRow);
}

s8 TradeMenu_LoadForcedInitialHover(struct TradeMenuProc* proc)
{
    if (gUnknown_0202BCB0.unk3F < 0)
        return TRUE;

    proc->hoverColumn = gUnknown_0202BCB0.unk3F / UNIT_ITEM_COUNT;
    proc->hoverRow   = gUnknown_0202BCB0.unk3F % UNIT_ITEM_COUNT;

    TradeMenu_RefreshSelectableCells(proc);
    Proc_Goto(proc, L_TRADEMENU_SELECTED);

    return FALSE;
}

void TradeMenu_ClearDisplay(struct TradeMenuProc* proc)
{
    DeleteFaceByIndex(0);
    DeleteFaceByIndex(1);
}

void TradeMenu_HelpBox_OnInit(struct Proc* proc)
{
    struct TradeMenuProc* tradeMenu = proc->proc_parent;

    int item = tradeMenu->units[tradeMenu->hoverColumn]->items[tradeMenu->hoverRow];

    if (!item)
    {
        Proc_End(proc);
        return;
    }

    if (tradeMenu->extraCellEnabled)
    {
        tradeMenu->hasItem[tradeMenu->extraColumn][tradeMenu->extraRow] = FALSE;
    }

    LoadDialogueBoxGfx(NULL, -1);

    StartItemHelpBox(
        8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
        8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y,
        item);

    gKeyStatusPtr->newKeys = gKeyStatusPtr->newKeys &~ (B_BUTTON | R_BUTTON);
}

void TradeMenu_HelpBox_OnLoop(struct Proc* proc)
{
    struct TradeMenuProc* tradeMenu = (struct TradeMenuProc*) proc->proc_parent;

    s8 changedSelection = TradeMenu_UpdateSelection(tradeMenu);
    int item = tradeMenu->units[tradeMenu->hoverColumn]->items[tradeMenu->hoverRow];

    if (changedSelection)
    {
        StartItemHelpBox(
            8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
            8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y,
            item);
    }

    if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON))
    {
        Proc_Break(proc);
    }

    DisplayUiHand(
        8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
        8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y);

    if (tradeMenu->extraCellEnabled)
    {
        DisplayFrozenUiHand(
            8 * sItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedRow].x,
            8 * sItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedRow].y);
    }
}

void TradeMenu_HelpBox_OnEnd(struct Proc* proc)
{
    struct TradeMenuProc* tradeMenu = (struct TradeMenuProc*) proc->proc_parent;

    if (tradeMenu->extraCellEnabled)
    {
        tradeMenu->hasItem[tradeMenu->extraColumn][tradeMenu->extraRow] = TRUE;
    }

    CloseHelpBox();

    DisplayUiHand(
        8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
        8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y);

    if (tradeMenu->extraCellEnabled)
    {
        DisplayFrozenUiHand(
            8 * sItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedRow].x,
            8 * sItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedRow].y);
    }
}

struct Proc* StartTradeMenu(struct Unit* lUnit, struct Unit* rUnit, int unused)
{
    int itemCount;

    struct TradeMenuProc* proc = Proc_Start(sProcScr_TradeMenu, PROC_TREE_3);

    proc->units[0] = lUnit;
    proc->units[1] = rUnit;

    proc->hasTraded = FALSE;

    proc->hoverColumn = TRADEMENU_UNIT_LEFT;
    proc->hoverRow = 0;

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

    DisplayFrozenUiHand(
        8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
        8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y);
}

void TradeMenu_DoubleTutorialHandCursor_Update(void)
{
    struct TradeMenuProc* tradeMenu = sTradeMenuProc;

    DisplayFrozenUiHand(
        8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
        8 * sItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y);

    DisplayFrozenUiHand(
        8 * sItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedRow].x,
        8 * sItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedRow].y);
}

void StartTradeMenuTutorialHandCursor(void)
{
    Proc_Start(sProcScr_TradeMenu_TutorialHandCursor, PROC_TREE_3);
}

void StartDoubleTradeMenuTutorialHandCursor(void)
{
    Proc_Start(sProcScr_TradeMenu_DoubleTutorialHandCursor, PROC_TREE_3);
}

void EndTradeMenuTutorialHandCursor(void)
{
    Proc_EndEach(sProcScr_TradeMenu_TutorialHandCursor);
}

void EndDoubleTradeMenuTutorialHandCursor(void)
{
    Proc_EndEach(sProcScr_TradeMenu_DoubleTutorialHandCursor);
}

void TradeMenu_TutorialWait_OnInit(struct TradeMenuProc* proc)
{
    proc->timer = 20;
}

void TradeMenu_TutorialWait_OnLoop(struct TradeMenuProc* proc)
{
    proc->timer--;

    if (proc->timer < 0)
        Proc_Break(proc);
}

void sub_802DEDC(struct Proc* ee)
{
    if (sTradeMenuProc->tradeTutorialState != 3 && sTradeMenuProc->tradeTutorialState != 5 && sTradeMenuProc->tradeTutorialState != 8)
    {
        Proc_StartBlocking(sProcScr_TradeMenu_TutorialWait, ee);
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

        Proc_Goto(proc, L_TRADEMENU_LOADFORCED);

        return TRUE;

    case 3:
        if (!(gKeyStatusPtr->newKeys & (B_BUTTON | DPAD_LEFT | R_BUTTON)))
        {
            if (!(gKeyStatusPtr->newKeys & A_BUTTON))
                return FALSE;

            if (!(gKeyStatusPtr->newKeys & (DPAD_UP | DPAD_DOWN)))
            {
                if (GetItemIndex(proc->units[proc->hoverColumn]->items[proc->hoverRow]) == ITEM_VULNERARY)
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
    Proc_StartBlocking(sProcScr_TradeMenu_TutorialEventLock, proc);
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
