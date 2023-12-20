#pragma once

#include "global.h"
#include "proc.h"
#include "bmunit.h"
#include "event.h"

enum trade_menu_rect {
    // MAGIC CONSTANTS

    UNIT_PANEL_WIDTH = 6,

    ITEM_PANEL_WIDTH = 7,

    ITEM_PANEL_LEFT_X = 1,
    ITEM_PANEL_LEFT_Y = 8,

    ITEM_PANEL_RIGHT_X = 15,
    ITEM_PANEL_RIGHT_Y = 8,
};

enum trade_menu_proc_label_idx {
    L_TRADEMENU_UNSELECTED = 0,
    L_TRADEMENU_SELECTED   = 1,
    L_TRADEMENU_END        = 2,

    L_TRADEMENU_LOADFORCED = 101,
};

struct TradeMenuProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Unit * units[2];

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

/* TradeMenuProc:tradeTutorialState */
enum trade_menu_tutorial_status_idx {
    TRADE_TUT_NONE = 0,
    TRADE_TUT_INIT = 1,
};

extern struct Text gTradeMenuText[2][UNIT_ITEM_COUNT];
extern struct TradeMenuProc * gpTradeMenuProc;
extern struct Vec2 gTradeItemDisplayTileLocation[2][UNIT_ITEM_COUNT];
extern struct ProcCmd ProcScr_TradeMenu_HighlightUpdater[];
extern struct ProcCmd ProcScr_TradeMenu[];
extern struct ProcCmd ProcScr_TradeMenu_TutorialHandCursor[];
extern struct ProcCmd ProcScr_TradeMenu_DoubleTutorialHandCursor[];
extern struct ProcCmd ProcScr_TradeMenu_TutorialWait[];
extern struct ProcCmd ProcScr_TradeMenu_TutorialEventLock[];
extern struct ProcCmd ProcScr_TradeMenu[];
extern struct ProcCmd ProcScr_TradeMenu[];
extern struct ProcCmd ProcScr_TradeMenu[];
extern struct ProcCmd ProcScr_TradeMenu[];
extern struct ProcCmd ProcScr_TradeMenu[];

extern EventScr EventScr_TradeTutStart[];
extern EventScr EventScr_TradeTut_SelectItem[];
extern EventScr EventScr_TradeTut_PressAtoGetItem[];
extern EventScr EventScr_TradeTutDone[];

void StartTradeMenuTutorialHandCursor(void);
void TradeMenu_InitUnitNameDisplay(struct TradeMenuProc * proc);
void TradeMenu_HighlightUpdater_OnInit(struct TradeMenuProc * proc);
void TradeMenu_HighlightUpdater_OnLoop(struct TradeMenuProc * proc);
int  TradeMenu_GetAdjustedRow(struct TradeMenuProc * proc, int col, int row);
void TradeMenu_InitItemText(struct TradeMenuProc * proc);
void TradeMenu_RefreshItemText(struct TradeMenuProc * proc);
void TradeMenu_RefreshSelectableCells(struct TradeMenuProc * proc);
s8   TradeMenu_UpdateSelection(struct TradeMenuProc * proc);
void TradeMenu_ApplyItemSwap(struct TradeMenuProc * proc);
void TradeMenu_InitItemDisplay(struct TradeMenuProc * proc);
void TradeMenu_OnInitUnselected(struct TradeMenuProc * proc);
void TradeMenu_OnLoopUnselected(struct TradeMenuProc * proc);
void TradeMenu_OnInitSelected(struct TradeMenuProc * proc);
void TradeMenu_OnLoopSelected(struct TradeMenuProc * proc);
void TradeMenu_OnEndSelected(struct TradeMenuProc * proc);
s8   TradeMenu_LoadForcedInitialHover(struct TradeMenuProc * proc);
void TradeMenu_ClearDisplay(struct TradeMenuProc * proc);
void TradeMenu_HelpBox_OnInit(struct Proc * proc);
void TradeMenu_HelpBox_OnLoop(struct Proc * proc);
void TradeMenu_HelpBox_OnEnd(struct Proc * proc);
void TradeMenu_TutorialHandCursor_Update(void);
void TradeMenu_DoubleTutorialHandCursor_Update(void);
void StartDoubleTradeMenuTutorialHandCursor(void);
void EndTradeMenuTutorialHandCursor(void);
void EndDoubleTradeMenuTutorialHandCursor(void);
void TradeMenu_TutorialWait_OnInit(struct TradeMenuProc * proc);
void TradeMenu_TutorialWait_OnLoop(struct TradeMenuProc * proc);
s8 TradeMenu_UpdateTutorial(struct TradeMenuProc * proc);

void TradeMenuHandSTAL(struct Proc * ee);
void SetTradeMenuTutStatus2(void);
void SetTradeMenuTutStatus3(void);
void SetTradeMenuTutStatus4(void);
void SetTradeMenuTutStatus5(void);
void SetTradeMenuTutStatus6(void);
void SetTradeMenuTutStatus7(void);
void SetTradeMenuTutStatus8(void);

void TradeMenu_StartTutorialEventLock(struct TradeMenuProc * proc);
void CallTradeTutEventStart(struct TradeMenuProc * proc);
void CallTradeTutEventSlectItem(struct TradeMenuProc * proc);
void CallTradeTutEventPressAtoGetItem(struct TradeMenuProc * proc);
void CallTradeTutEventDone(struct TradeMenuProc * proc);
s8 AreKeysHeld(void);
