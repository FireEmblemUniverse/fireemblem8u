#include "global.h"

#include "constants/items.h"

#include "proc.h"
#include "hardware.h"
#include "icon.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "statscreen.h"
#include "face.h"
#include "sysutil.h"
#include "bm.h"
#include "bmitem.h"
#include "bmtrade.h"
#include "bmunit.h"
#include "bmmind.h"
#include "m4a.h"
#include "uimenu.h"
#include "helpbox.h"
#include "soundwrapper.h"
#include "event.h"
#include "eventinfo.h"
#include "eventscript.h"
#include "EAstdlib.h"

EWRAM_DATA struct TradeMenuProc * gpTradeMenuProc = NULL;

CONST_DATA struct Vec2 gTradeItemDisplayTileLocation[2][UNIT_ITEM_COUNT] = {
    [POS_L] = {
        { ITEM_PANEL_LEFT_X + 1, ITEM_PANEL_LEFT_Y + 1 },
        { ITEM_PANEL_LEFT_X + 1, ITEM_PANEL_LEFT_Y + 3 },
        { ITEM_PANEL_LEFT_X + 1, ITEM_PANEL_LEFT_Y + 5 },
        { ITEM_PANEL_LEFT_X + 1, ITEM_PANEL_LEFT_Y + 7 },
        { ITEM_PANEL_LEFT_X + 1, ITEM_PANEL_LEFT_Y + 9 },
    },

    [POS_R] = {
        { ITEM_PANEL_RIGHT_X + 1, ITEM_PANEL_RIGHT_Y + 1 },
        { ITEM_PANEL_RIGHT_X + 1, ITEM_PANEL_RIGHT_Y + 3 },
        { ITEM_PANEL_RIGHT_X + 1, ITEM_PANEL_RIGHT_Y + 5 },
        { ITEM_PANEL_RIGHT_X + 1, ITEM_PANEL_RIGHT_Y + 7 },
        { ITEM_PANEL_RIGHT_X + 1, ITEM_PANEL_RIGHT_Y + 9 },
    }
};

CONST_DATA struct ProcCmd ProcScr_TradeMenu_HighlightUpdater[] = {
    PROC_CALL(TradeMenu_HighlightUpdater_OnInit),
    PROC_REPEAT(TradeMenu_HighlightUpdater_OnLoop),

    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_TradeMenu[] = {
    PROC_CALL(LockGame),
    PROC_YIELD,

    PROC_WHILE_EXISTS(gProcScr_CamMove),

    PROC_CALL(TradeMenu_InitItemDisplay),
    PROC_CALL(TradeMenu_InitUnitNameDisplay),

    PROC_START_CHILD(ProcScr_TradeMenu_HighlightUpdater),

PROC_LABEL(L_TRADEMENU_LOADFORCED),
    PROC_CALL(CallTradeTutEventStart),
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

    PROC_CALL(UnlockGame),

    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_TradeMenu_HelpBox[] = {
    PROC_CALL(TradeMenu_HelpBox_OnInit),
    PROC_REPEAT(TradeMenu_HelpBox_OnLoop),

    PROC_CALL(TradeMenu_HelpBox_OnEnd),

    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_TradeMenu_TutorialHandCursor[] = {
    PROC_SET_END_CB(TradeMenu_TutorialHandCursor_Update),
    PROC_REPEAT(TradeMenu_TutorialHandCursor_Update),

    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_TradeMenu_DoubleTutorialHandCursor[] = {
    PROC_SET_END_CB(TradeMenu_DoubleTutorialHandCursor_Update),
    PROC_REPEAT(TradeMenu_DoubleTutorialHandCursor_Update),

    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_TradeMenu_TutorialWait[] = {
    PROC_CALL(TradeMenu_TutorialWait_OnInit),
    PROC_REPEAT(TradeMenu_TutorialWait_OnLoop),

    PROC_END
};

CONST_DATA struct ProcCmd ProcScr_TradeMenu_TutorialEventLock[] = {
    PROC_WHILE(EventEngineExists),
    PROC_WHILE(AreKeysHeld),

    PROC_CALL(EndTradeMenuTutorialHandCursor),
    PROC_CALL(EndDoubleTradeMenuTutorialHandCursor),

    PROC_END
};

void TradeMenu_InitUnitNameDisplay(struct TradeMenuProc * proc)
{
    char* str;
    int xStart;

    // TODO: constants
    StartSysBrownBox(6, 0x4800, 0x08, 0x800, 0x400, (struct Proc *) (proc));

    EnableSysBrownBox(0, -40, -1, 1);
    EnableSysBrownBox(1, 184, -1, 0);

    // TODO: special effect constants
    SetBlendConfig(1, 12, 6, 0);

    // TODO: name functions
    SetBlendTargetA(FALSE, FALSE, FALSE, FALSE, FALSE);
    SetBlendTargetB(TRUE,  TRUE,  TRUE,  TRUE,  TRUE);

    // TODO: text color constants

    str = GetStringFromIndex(UNIT_NAME_ID(proc->units[0]));
    xStart = ((8 * UNIT_PANEL_WIDTH) - GetStringTextLen(str)) / 2;

    PutDrawText(NULL, gBG0TilemapBuffer + TILEMAP_INDEX(0, 0), 0, xStart, UNIT_PANEL_WIDTH, str);

    str = GetStringFromIndex(UNIT_NAME_ID(proc->units[1]));
    xStart = ((8 * UNIT_PANEL_WIDTH) - GetStringTextLen(str)) / 2;

    PutDrawText(NULL, gBG0TilemapBuffer + TILEMAP_INDEX(24, 0), 0, xStart, UNIT_PANEL_WIDTH, str);

    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

void TradeMenu_HighlightUpdater_OnInit(struct TradeMenuProc * proc)
{
    proc->hoverColumn = (u8)POS_INVALID;
}

void TradeMenu_HighlightUpdater_OnLoop(struct TradeMenuProc * proc)
{
    struct TradeMenuProc * tradeMenu = proc->proc_parent;

    if (proc->hoverColumn == tradeMenu->hoverColumn && proc->hoverRow == tradeMenu->hoverRow)
        return;

    if (proc->hoverColumn != (u8)POS_INVALID)
    {
        ClearUiItemHover(
            gTradeItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].x,
            gTradeItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].y,
            12);
    }

    DrawUiItemHover(
        gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
        gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y,
        12);

    proc->hoverColumn = tradeMenu->hoverColumn;
    proc->hoverRow = tradeMenu->hoverRow;
}

int TradeMenu_GetAdjustedRow(struct TradeMenuProc * proc, int col, int row)
{
    while (proc->hasItem[col][row] == 0 && row >= 0)
        row--;

    return row;
}

void TradeMenu_InitItemText(struct TradeMenuProc * proc)
{
    int col, row;

    for (col = 0; col < 2; ++col)
    {
        for (row = 0; row < UNIT_ITEM_COUNT; ++row)
        {
            InitTextDb(&gTradeMenuText[col][row], ITEM_PANEL_WIDTH);
        }
    }
}

void TradeMenu_RefreshItemText(struct TradeMenuProc * proc)
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

            ClearText(&gTradeMenuText[col][row]);

            if (item)
            {
                DrawItemMenuLine(&gTradeMenuText[col][row], item, IsItemDisplayUsable(proc->units[col], item),
                    gBG0TilemapBuffer + TILEMAP_INDEX(xLookup[col] + 1, yLookup[col] + row * 2 + 1));
            }
        }
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

void TradeMenu_RefreshSelectableCells(struct TradeMenuProc * proc)
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

s8 TradeMenu_UpdateSelection(struct TradeMenuProc * proc)
{
    s8 changedSelection = FALSE;
    int newSelectedRow;

    if ((gKeyStatusPtr->repeatedKeys & DPAD_LEFT) && proc->hoverColumn == POS_R)
    {
        newSelectedRow = TradeMenu_GetAdjustedRow(proc, POS_L, proc->hoverRow);

        if (newSelectedRow < 0)
            goto end;

        proc->hoverColumn = POS_L;
        proc->hoverRow = newSelectedRow;

        changedSelection = TRUE;

        // TODO: SONG IDS
        PlaySoundEffect(0x67);
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) && proc->hoverColumn == POS_L)
    {
        newSelectedRow = TradeMenu_GetAdjustedRow(proc, POS_R, proc->hoverRow);

        if (newSelectedRow < 0)
            goto end;

        proc->hoverColumn = POS_R;
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

void TradeMenu_ApplyItemSwap(struct TradeMenuProc * proc)
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

void TradeMenu_InitItemDisplay(struct TradeMenuProc * proc)
{
    DrawUiFrame2(1,  8, 14, 12, 0);
    DrawUiFrame2(15, 8, 14, 12, 0);

    ResetTextFont();

    ResetIconGraphics();
    LoadIconPalettes(4); // TODO: palette id constant

    TradeMenu_InitItemText(proc);
    TradeMenu_RefreshItemText(proc);

    // TODO: face display type (arg 5) constants
    StartFace(0, GetUnitPortraitId(proc->units[0]), 64,  -4, 3);
    StartFace(1, GetUnitPortraitId(proc->units[1]), 176, -4, 2);

    SetFaceBlinkControlById(0, 5);
    SetFaceBlinkControlById(1, 5);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);
}

void TradeMenu_OnInitUnselected(struct TradeMenuProc * proc)
{
    TradeMenu_RefreshSelectableCells(proc);
    proc->extraCellEnabled = FALSE;
}

void TradeMenu_OnLoopUnselected(struct TradeMenuProc * proc)
{
    if (TradeMenu_UpdateTutorial(proc))
    {
        DisplayUiHand(
            8 * gTradeItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].x,
            8 * gTradeItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].y);
    }
    else
    {
        TradeMenu_UpdateSelection(proc);

        DisplayUiHand(
            8 * gTradeItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].x,
            8 * gTradeItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].y);

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
            Proc_StartBlocking(ProcScr_TradeMenu_HelpBox, proc);
        }
    }
}

void TradeMenu_OnInitSelected(struct TradeMenuProc * proc)
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

void TradeMenu_OnLoopSelected(struct TradeMenuProc * proc)
{
    if (TradeMenu_UpdateTutorial(proc))
    {
        DisplayUiHand(
            8 * gTradeItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].x,
            8 * gTradeItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].y);

        DisplayFrozenUiHand(
            8 * gTradeItemDisplayTileLocation[proc->selectedColumn][proc->selectedRow].x,
            8 * gTradeItemDisplayTileLocation[proc->selectedColumn][proc->selectedRow].y);
    }
    else
    {
        TradeMenu_UpdateSelection(proc);

        DisplayUiHand(
            8 * gTradeItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].x,
            8 * gTradeItemDisplayTileLocation[proc->hoverColumn][proc->hoverRow].y);

        DisplayFrozenUiHand(
            8 * gTradeItemDisplayTileLocation[proc->selectedColumn][proc->selectedRow].x,
            8 * gTradeItemDisplayTileLocation[proc->selectedColumn][proc->selectedRow].y);

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
            Proc_StartBlocking(ProcScr_TradeMenu_HelpBox, proc);
        }
    }
}

void TradeMenu_OnEndSelected(struct TradeMenuProc * proc)
{
    proc->hoverColumn = proc->selectedColumn;
    proc->hoverRow = proc->selectedRow;

    TradeMenu_RefreshSelectableCells(proc);

    if (!proc->hasItem[proc->hoverColumn][0])
        proc->hoverColumn = proc->hoverColumn ^ 1;

    proc->hoverRow = TradeMenu_GetAdjustedRow(proc, proc->hoverColumn, proc->hoverRow);
}

s8 TradeMenu_LoadForcedInitialHover(struct TradeMenuProc * proc)
{
    if (gBmSt.unk3F < 0)
        return TRUE;

    proc->hoverColumn = gBmSt.unk3F / UNIT_ITEM_COUNT;
    proc->hoverRow   = gBmSt.unk3F % UNIT_ITEM_COUNT;

    TradeMenu_RefreshSelectableCells(proc);
    Proc_Goto(proc, L_TRADEMENU_SELECTED);

    return FALSE;
}

void TradeMenu_ClearDisplay(struct TradeMenuProc * proc)
{
    EndFaceById(0);
    EndFaceById(1);
}

void TradeMenu_HelpBox_OnInit(struct Proc * proc)
{
    struct TradeMenuProc * tradeMenu = proc->proc_parent;

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

    LoadHelpBoxGfx(NULL, -1);

    StartItemHelpBox(
        8 * gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
        8 * gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y,
        item);

    gKeyStatusPtr->newKeys = gKeyStatusPtr->newKeys &~ (B_BUTTON | R_BUTTON);
}

void TradeMenu_HelpBox_OnLoop(struct Proc * proc)
{
    struct TradeMenuProc * tradeMenu = (struct TradeMenuProc *) proc->proc_parent;

    s8 changedSelection = TradeMenu_UpdateSelection(tradeMenu);
    int item = tradeMenu->units[tradeMenu->hoverColumn]->items[tradeMenu->hoverRow];

    if (changedSelection)
    {
        StartItemHelpBox(
            8 * gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
            8 * gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y,
            item);
    }

    if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON))
    {
        Proc_Break(proc);
    }

    DisplayUiHand(
        8 * gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
        8 * gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y);

    if (tradeMenu->extraCellEnabled)
    {
        DisplayFrozenUiHand(
            8 * gTradeItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedRow].x,
            8 * gTradeItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedRow].y);
    }
}

void TradeMenu_HelpBox_OnEnd(struct Proc * proc)
{
    struct TradeMenuProc * tradeMenu = (struct TradeMenuProc *) proc->proc_parent;

    if (tradeMenu->extraCellEnabled)
    {
        tradeMenu->hasItem[tradeMenu->extraColumn][tradeMenu->extraRow] = TRUE;
    }

    CloseHelpBox();

    DisplayUiHand(
        8 * gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
        8 * gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y);

    if (tradeMenu->extraCellEnabled)
    {
        DisplayFrozenUiHand(
            8 * gTradeItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedRow].x,
            8 * gTradeItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedRow].y);
    }
}

struct Proc * StartTradeMenu(struct Unit* lUnit, struct Unit* rUnit, int unused)
{
    int itemCount;

    struct TradeMenuProc * proc = Proc_Start(ProcScr_TradeMenu, PROC_TREE_3);

    proc->units[0] = lUnit;
    proc->units[1] = rUnit;

    proc->hasTraded = FALSE;

    proc->hoverColumn = POS_L;
    proc->hoverRow = 0;

    proc->tradeTutorialState = TRADE_TUT_NONE;

    gpTradeMenuProc = proc;

    if (CheckTradeTutorial())
    {
        SetKeyStatus_IgnoreMask(A_BUTTON | START_BUTTON | DPAD_DOWN | DPAD_UP);
        proc->tradeTutorialState = TRADE_TUT_INIT;
    }

    if (GetUnitItemCount(lUnit) == 0)
    {
        proc->hoverColumn = POS_R;
    }
}

void TradeMenu_TutorialHandCursor_Update(void)
{
    struct TradeMenuProc * tradeMenu = gpTradeMenuProc;

    DisplayFrozenUiHand(
        8 * gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
        8 * gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y);
}

void TradeMenu_DoubleTutorialHandCursor_Update(void)
{
    struct TradeMenuProc * tradeMenu = gpTradeMenuProc;

    DisplayFrozenUiHand(
        8 * gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].x,
        8 * gTradeItemDisplayTileLocation[tradeMenu->hoverColumn][tradeMenu->hoverRow].y);

    DisplayFrozenUiHand(
        8 * gTradeItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedRow].x,
        8 * gTradeItemDisplayTileLocation[tradeMenu->selectedColumn][tradeMenu->selectedRow].y);
}

void StartTradeMenuTutorialHandCursor(void)
{
    Proc_Start(ProcScr_TradeMenu_TutorialHandCursor, PROC_TREE_3);
}

void StartDoubleTradeMenuTutorialHandCursor(void)
{
    Proc_Start(ProcScr_TradeMenu_DoubleTutorialHandCursor, PROC_TREE_3);
}

void EndTradeMenuTutorialHandCursor(void)
{
    Proc_EndEach(ProcScr_TradeMenu_TutorialHandCursor);
}

void EndDoubleTradeMenuTutorialHandCursor(void)
{
    Proc_EndEach(ProcScr_TradeMenu_DoubleTutorialHandCursor);
}

void TradeMenu_TutorialWait_OnInit(struct TradeMenuProc * proc)
{
    proc->timer = 20;
}

void TradeMenu_TutorialWait_OnLoop(struct TradeMenuProc * proc)
{
    proc->timer--;

    if (proc->timer < 0)
        Proc_Break(proc);
}

void TradeMenuHandSTAL(struct Proc * ee)
{
    if (gpTradeMenuProc->tradeTutorialState != 3 && gpTradeMenuProc->tradeTutorialState != 5 && gpTradeMenuProc->tradeTutorialState != 8)
    {
        Proc_StartBlocking(ProcScr_TradeMenu_TutorialWait, ee);
    }
}

s8 TradeMenu_UpdateTutorial(struct TradeMenuProc * proc)
{
    if (proc->tradeTutorialState != 4 && (gKeyStatusPtr->newKeys == 0))
        return FALSE;

    switch (gpTradeMenuProc->tradeTutorialState) {
    case 2:
        if (gKeyStatusPtr->newKeys & DPAD_RIGHT)
        {
            SetKeyStatus_IgnoreMask(START_BUTTON | DPAD_UP | DPAD_DOWN);
            CallTradeTutEventSlectItem(proc);

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
                    SetTradeMenuTutStatus4();

                    return FALSE;
                }
            }
        }

        PlaySoundEffect(0x6C); // TODO: SONG ID DEFINITIONS

        CallTradeTutEventSlectItem(proc);

        return TRUE;

    case 5:
        if (gKeyStatusPtr->newKeys & A_BUTTON)
        {
            CallTradeTutEventDone(proc);

            return FALSE;
        }

        PlaySoundEffect(0x6C); // TODO: SONG ID DEFINITIONS

        CallTradeTutEventPressAtoGetItem(proc);

        return TRUE;

    case 4:
        CallTradeTutEventPressAtoGetItem(proc);

        return TRUE;

    case 8:
        if (gKeyStatusPtr->newKeys & B_BUTTON)
        {
            SetKeyStatus_IgnoreMask(0);
            ClearFlag(0x87); // TODO: EID/FLAG DEFINTIONS

            return FALSE;
        }

        PlaySoundEffect(0x6C); // TODO: SONG ID DEFINITIONS

        CallTradeTutEventDone(proc);

        return TRUE;

    default:
        return FALSE;

    } // switch (gpTradeMenuProc->tradeTutorialState)
}

void SetTradeMenuTutStatus2(void)
{
    gpTradeMenuProc->tradeTutorialState = 2;
}

void SetTradeMenuTutStatus3(void)
{
    gpTradeMenuProc->tradeTutorialState = 3;
}

void SetTradeMenuTutStatus4(void)
{
    gpTradeMenuProc->tradeTutorialState = 4;
}

void SetTradeMenuTutStatus5(void)
{
    gpTradeMenuProc->tradeTutorialState = 5;
}

void SetTradeMenuTutStatus6(void)
{
    gpTradeMenuProc->tradeTutorialState = 6;
}

void SetTradeMenuTutStatus7(void)
{
    gpTradeMenuProc->tradeTutorialState = 7;
}

void SetTradeMenuTutStatus8(void)
{
    gpTradeMenuProc->tradeTutorialState = 8;
}

s8 AreKeysHeld(void)
{
    if (!gKeyStatusPtr->heldKeys)
        return FALSE;

    return TRUE;
}

void TradeMenu_StartTutorialEventLock(struct TradeMenuProc * proc)
{
    Proc_StartBlocking(ProcScr_TradeMenu_TutorialEventLock, proc);
}

CONST_DATA EventScr EventScr_TradeTutStart[] = {
    EVBIT_MODIFY(3)
    NoFade

    IGNORE_KEYS(0)
    ASMC(FreezeMenu)
    STAL(8)

    /**
     * Here are the items Gilliam and Franz are carrying.
     * Move the cursor to Franz's items on the right side.
     * Press right on the + Control Pad.
     */
    _1A25
    SVAL(EVT_SLOT_B, _EvtParams2(-1, -1))
    TEXTSHOW(0x949)
    TEXTEND

    ASMC(ResumeMenu)
    IGNORE_KEYS(R_BUTTON | DPAD_DOWN | DPAD_UP | START_BUTTON | B_BUTTON)
    ASMC(SetTradeMenuTutStatus2)
    ENDA
};

void CallTradeTutEventStart(struct TradeMenuProc * proc)
{
    if (proc->tradeTutorialState != TRADE_TUT_NONE)
    {
        CallEvent((void *)EventScr_TradeTutStart, EV_EXEC_QUIET);
        TradeMenu_StartTutorialEventLock(proc);

        StartTradeMenuTutorialHandCursor();
    }
}

CONST_DATA EventScr EventScr_TradeTut_SelectItem[] = {
    EVBIT_MODIFY(3)
    NoFade

    ASMC(TradeMenuHandSTAL)

    IGNORE_KEYS(0)
    ASMC(FreezeMenu)
    STAL(8)

    /**
     * Use the + Control Pad
     * to select a vulnerary and press the  A Button.
     */
    _1A25
    SVAL(EVT_SLOT_B, _EvtParams2(-1, -1))
    TEXTSHOW(0x94A)
    TEXTEND

    ASMC(ResumeMenu)
    IGNORE_KEYS(START_BUTTON)
    ASMC(SetTradeMenuTutStatus3)
    ENDA
};

void CallTradeTutEventSlectItem(struct TradeMenuProc * proc)
{
    CallEvent((void *)EventScr_TradeTut_SelectItem, EV_EXEC_QUIET);
    TradeMenu_StartTutorialEventLock(proc);

    StartTradeMenuTutorialHandCursor();
}

CONST_DATA EventScr EventScr_TradeTut_PressAtoGetItem[] = {
    EVBIT_MODIFY(3)
    NoFade

    ASMC(TradeMenuHandSTAL)

    IGNORE_KEYS(0)
    ASMC(FreezeMenu)
    STAL(8)

    /**
     * Press the A Button now to accept the vulnerary from Franz.
     */
    _1A25
    SVAL(EVT_SLOT_B, _EvtParams2(-1, -1))
    TEXTSHOW(0x94B)
    TEXTEND

    ASMC(ResumeMenu)
    IGNORE_KEYS(START_BUTTON)
    ASMC(SetTradeMenuTutStatus5)
    ENDA
};

void CallTradeTutEventPressAtoGetItem(struct TradeMenuProc * proc)
{
    CallEvent((void *)EventScr_TradeTut_PressAtoGetItem, EV_EXEC_QUIET);
    TradeMenu_StartTutorialEventLock(proc);

    StartDoubleTradeMenuTutorialHandCursor();
}

CONST_DATA EventScr EventScr_TradeTutDone[] = {
    EVBIT_MODIFY(3)
    NoFade

    ASMC(SetTradeMenuTutStatus7)
    ASMC(StartTradeMenuTutorialHandCursor)
    ASMC(TradeMenuHandSTAL)

    IGNORE_KEYS(0)
    ASMC(FreezeMenu)
    STAL(8)

    /**
     * The item has successfully been traded.
     * Press the B Button to finish your transaction.
     */
    _1A25
    SVAL(EVT_SLOT_B, _EvtParams2(-1, -1))
    TEXTSHOW(0x94C)
    TEXTEND

    ASMC(ResumeMenu)
    IGNORE_KEYS(START_BUTTON | A_BUTTON)
    DISABLEOPTIONS(~EVENT_MENUOVERRIDE_ITEM)
    ASMC(SetTradeMenuTutStatus8)
    ENDA
};

void CallTradeTutEventDone(struct TradeMenuProc * proc)
{
    CallEvent((void *)EventScr_TradeTutDone, EV_EXEC_QUIET);
    TradeMenu_StartTutorialEventLock(proc);

    StartTradeMenuTutorialHandCursor();
}
