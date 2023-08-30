#ifndef GUARD_PLAYERPHASE_H
#define GUARD_PLAYERPHASE_H

// ??? PlayerPhase_Suspend(???);
void HandlePlayerCursorMovement(void);
int CanShowUnitStatScreen(struct Unit* unit);
// ??? PlayerPhase_MainIdle(???);
void DisplayUnitEffectRange(struct Unit* unit);
// ??? PlayerPhase_InitUnitMovementSelect(???);
void DisplayActiveUnitEffectRange(ProcPtr proc);
// ??? PlayerPhase_DisplayDangerZone(???);
// ??? PlayerPhase_RangeDisplayIdle(???);
// ??? PlayerPhase_CancelAction(???);
// ??? PlayerPhase_BackToMove(???);
// ??? PlayerPhase_PrepareAction(???);
// ??? TryMakeCantoUnit(???);
s8 RunPotentialWaitEvents(void);
// ??? EnsureCameraOntoActiveUnitPosition(???);
// ??? PlayerPhase_FinishAction(???);
// ??? sub_801D404(???);
// ??? sub_801D434(???);
// ??? PlayerPhase_ApplyUnitMovement(???);
int GetUnitSelectionValueThing(struct Unit* unit);
// ??? CanMoveActiveUnitTo(???);
// ??? PlayerPhase_DisplayUnitMovement(???);
// ??? PlayerPhase_WaitForUnitMovement(???);
// ??? PlayerPhase_ResumeRangeDisplay(???);
// ??? PlayerPhase_ReReadGameSaveGfx(???);
// ??? MakeMoveunitForActiveUnit(???);
void ClearActiveUnit(struct Unit *);
// ??? sub_801D7E8(???);
// ??? PlayerPhase_RangeDisplayIdle_ForceAPress(???);
// ??? sub_801D834(???);
// ??? MoveLimitViewChange_OnInit(???);
// ??? MoveLimitViewChange_OnLoop(???);
// ??? MoveLimitView_OnInit(???);
// ??? MoveLimitView_OnLoop(???);
// ??? MoveLimitView_OnEnd(???);
void DisplayMoveRangeGraphics(int flags);
void HideMoveRangeGraphics(void);
// ??? TrySetCursorOn(???);
void TrySwitchViewedUnit(int x, int y);
// ??? PlayerPhase_HandleAutoEnd(???);

struct MoveLimitViewProc {
    PROC_HEADER;
    
    /* 29 */ u8 pad[0x4A-0x29];
    /* 4A */ s16 unk_4A;
    /* 4C */ s16 unk_4C;
};

extern const struct MenuDef gMapMenuDef;
extern const struct MenuDef gUnitActionMenuDef;

extern u16 gUnknown_08A02F34[];
extern u16 gUnknown_08A02F94[];
extern u16 gUnknown_08A02FF4[];

extern u8 gUnknown_08A02EB4[];

void TrySwitchViewedUnit(int, int);
int GetUnitSelectionValueThing(struct Unit* unit);
void DisplayMoveRangeGraphics(int config);
s8 CanMoveActiveUnitTo(int, int);

// code.s
void PidStatsAddActAmt(u8);

extern struct ProcCmd gProcScr_0859ACE8[];

void PlayerPhase_Suspend(void);
void PlayerPhase_MainIdle(ProcPtr proc);
void PlayerPhase_InitUnitMovementSelect(void);
void PlayerPhase_DisplayDangerZone(void);
void PlayerPhase_RangeDisplayIdle(ProcPtr proc);
s8 PlayerPhase_PrepareAction(ProcPtr proc);
s8 EnsureCameraOntoActiveUnitPosition(ProcPtr proc);
void PlayerPhase_FinishAction(ProcPtr proc);
void PlayerPhase_ApplyUnitMovement(ProcPtr proc);
void PlayerPhase_DisplayUnitMovement(void);
void PlayerPhase_WaitForUnitMovement(ProcPtr proc);
void PlayerPhase_ResumeRangeDisplay(ProcPtr proc);
void PlayerPhase_ReReadGameSaveGfx(void);
void PlayerPhase_RangeDisplayIdle_ForceAPress(ProcPtr);
void PlayerPhase_HandleAutoEnd(ProcPtr);

void MakeMoveunitForActiveUnit(void);
void MoveLimitViewChange_OnInit(struct MoveLimitViewProc* proc);
void MoveLimitViewChange_OnLoop(struct MoveLimitViewProc* proc);
void MoveLimitView_OnEnd(struct MoveLimitViewProc* proc);
void MoveLimitView_OnInit(ProcPtr);
void MoveLimitView_OnLoop(struct MoveLimitViewProc* proc);

extern struct ProcCmd gProcScr_PlayerPhase[];

#endif  // GUARD_PLAYERPHASE_H
