#ifndef GUARD_PLAYER_INTERFACE_H
#define GUARD_PLAYER_INTERFACE_H

#include "fontgrp.h"

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
    /* 50 */ s8 cursorQuadrant;
    /* 51 */ u8 hpCurHi;
    /* 52 */ u8 hpCurLo;
    /* 53 */ u8 hpMaxHi;
    /* 54 */ u8 hpMaxLo;
    /* 55 */ s8 hideContents;
    /* 56 */ s8 isRetracting;
    /* 57 */ s8 windowQuadrant;
    /* 58 */ int showHideClock;
};

struct PlayerInterfaceConfigEntry
{
    /* 00 */ s8 xTerrain, yTerrain;
    /* 02 */ s8 xMinimug, yMinimug;
    /* 04 */ s8 xGoal, yGoal;
    STRUCT_PAD(0x06, 0x08);
};

int GetWindowQuadrant(int x, int y);
int GetCursorQuadrant(void);
void GetHpBarLeftTile(u16 * buffer, s16 hp, int tileBase);
void GetHpBarMidTiles(u16 * buffer, s16 hp, int tileBase);
void GetHpBarRightTile(u16 * buffer, s16 hp, int tileBase);
void DrawHpBar(u16 * buffer, struct Unit * unit, int tileBase);
void MMB_Loop_SlideIn(struct PlayerInterfaceProc * proc);
void MMB_Loop_SlideOut(struct PlayerInterfaceProc * proc);
void TerrainDisplay_Loop_SlideIn(struct PlayerInterfaceProc * proc);
void TerrainDisplay_Loop_SlideOut(struct PlayerInterfaceProc * proc);
void PutUnitMapUiWindow(struct PlayerInterfaceProc * proc);
void PutTerrainDisplayWindow(struct PlayerInterfaceProc * proc);
void ApplyUnitMapUiFramePal(int faction, int palId);
int GetCursorScreenSideX(void);
int GetCursorScreenSideXAlt(void);
void ClearUnitMapUiStatus(struct PlayerInterfaceProc * proc, u16 * buffer, struct Unit * unit);
void PutUnitMapUiStatus(u16 * buffer, struct Unit * unit);
void UnitMapUiUpdate(struct PlayerInterfaceProc * proc, struct Unit * unit);
void DrawUnitMapUi(struct PlayerInterfaceProc * proc, struct Unit * unit);
int GetUnitBurstMapUiOrientationAt(int x, int y);
void DrawUnitBurstMapUi(struct PlayerInterfaceProc * proc, struct Unit * unit);
void ClearUnitBurstMapUi(struct PlayerInterfaceProc * proc);
void DrawTerrainDisplayWindow(struct PlayerInterfaceProc * proc);
void TerrainDisplay_Init(struct PlayerInterfaceProc * proc);
void TerrainDisplay_Loop_OnSideChange(struct PlayerInterfaceProc * proc);
void TerrainDisplay_Loop_Display(struct PlayerInterfaceProc * proc);
void MMB_Init(struct PlayerInterfaceProc * proc);
void MMB_Loop_OnSideChange(struct PlayerInterfaceProc * proc);
void MMB_Loop_Display(struct PlayerInterfaceProc * proc);
void MMB_CheckForUnit(struct PlayerInterfaceProc * proc);
void BurstDisplay_Init(struct PlayerInterfaceProc * proc);
void BurstDisplay_Loop_Display(struct PlayerInterfaceProc * proc);
void InitPlayerPhaseInterface(void);
void StartPlayerPhaseSideWindows(void);
void EndPlayerPhaseSideWindows(void);
s8 IsCursorInLowerScreenHalf(void);
int GetCursorScreenQuadrant(void);
void DrawGoalDisplayWindow(struct PlayerInterfaceProc * proc);
void GoalDisplay_Init(struct PlayerInterfaceProc * proc);
void GoalDisplay_Loop_OnSideChange(struct PlayerInterfaceProc * proc);
void PutGoalDisplayWindow(int quadrant, int param_2, int param_3);
void GoalDisplay_Loop_SlideIn(struct PlayerInterfaceProc * proc);
void GoalDisplay_Loop_SlideOut(struct PlayerInterfaceProc * proc);
void Nop_PlayerInterface_0(void);
void __malloc_unlock_0(void);
void Nop_PlayerInterface_1(void);
void GoalDisplay_Loop_Display(struct PlayerInterfaceProc * proc);
bool IsAnyPlayerSideWindowRetracting(void);
void MenuButtonDisp_Init(struct PlayerInterfaceProc * proc);
void UpdateMenuButtonPos(struct PlayerInterfaceProc * proc, int quadrant, int offset);
void DrawMenuButtonAt(int x, int y);
void MenuButtonDisp_UpdateCursorPos(struct PlayerInterfaceProc * proc);
void MenuButtonDisp_Loop_OnSlideIn(struct PlayerInterfaceProc * proc);
void MenuButtonDisp_Loop_Display(struct PlayerInterfaceProc * proc);
void MenuButtonDisp_Loop_OnSlideOut(struct PlayerInterfaceProc * proc);

extern struct PlayerInterfaceConfigEntry sPlayerInterfaceConfigLut[4];

extern s8 gUnitBurstMapUiTextXTable[6];
extern s8 gUnitBurstMapUiTextYTable[18];

extern s8 gUnitBurstMapUiXOffsetTable[6];
extern s8 gUnitBurstMapUiYOffsetTable[6];

extern u16 * gPlayerInterface_0[6];
extern u16 * gPlayerInterface_1[6];

extern s8 sMMBSlideInWidthLut[4];
extern s8 sMMBSlideOutWidthLut[3];

extern s8 sTerrainSlideInWidthLut[3];
extern s8 sTerrainSlideOutWidthLut[6];

extern struct ProcCmd gProcScr_TerrainDisplay[];
extern struct ProcCmd gProcScr_UnitDisplay_MinimugBox[];
extern struct ProcCmd gProcScr_UnitDisplay_Burst[];
extern struct ProcCmd gProcScr_SideWindowMaker[];

extern s8 sGoalSlideInWidthLut[5];
extern s8 sGoalSlideOutWidthLut[3];

extern struct ProcCmd gProcScr_GoalDisplay[];
extern struct ProcCmd gProcScr_PrepMap_MenuButtonDisplay[];

#endif  // GUARD_PLAYER_INTERFACE_H
