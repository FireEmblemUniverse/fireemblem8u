#ifndef GUARD_PLAYERPHASE_H
#define GUARD_PLAYERPHASE_H

struct MoveLimitViewProc
{
    /* 00 */ PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x4A);
    /* 4A */ s16 unk_4A;
    /* 4C */ s16 unk_4C;
};

enum
{
    PLAYER_SELECT_NOUNIT     = 0,
    PLAYER_SELECT_TURNENDED  = 1,
    PLAYER_SELECT_CONTROL    = 2,
    PLAYER_SELECT_NOCONTROL  = 3,
    PLAYER_SELECT_4          = 4,
};

enum
{
    LIMITVIEW_BLUE   = (1 << 0),
    LIMITVIEW_RED    = (1 << 1),
    LIMITVIEW_GREEN  = (1 << 2),
    // (1 << 3)
    LIMITVIEW_UNK    = (1 << 4),
};

void PlayerPhase_Suspend(void);
void HandlePlayerCursorMovement(void);
// s8 CanShowUnitStatScreen(struct Unit * unit);
void PlayerPhase_MainIdle(ProcPtr proc);
void DisplayUnitEffectRange(struct Unit * unit);
void PlayerPhase_InitUnitMovementSelect(void);
void DisplayActiveUnitEffectRange(ProcPtr proc);
void PlayerPhase_DisplayDangerZone(void);
void PlayerPhase_RangeDisplayIdle(ProcPtr proc);
// ??? PlayerPhase_CancelAction(???);
// ??? PlayerPhase_BackToMove(???);
s8 PlayerPhase_PrepareAction(ProcPtr proc);
// ??? TryMakeCantoUnit(???);
s8 RunPotentialWaitEvents(void);
s8 EnsureCameraOntoActiveUnitPosition(ProcPtr proc);
void PlayerPhase_FinishAction(ProcPtr proc);
// ??? sub_801D404(???);
// ??? sub_801D434(???);
void PlayerPhase_ApplyUnitMovement(ProcPtr proc);
int GetPlayerSelectKind(struct Unit * unit);
s8 CanMoveActiveUnitTo(int, int);
void PlayerPhase_DisplayUnitMovement(void);
void PlayerPhase_WaitForUnitMovement(ProcPtr proc);
void PlayerPhase_ResumeRangeDisplay(ProcPtr proc);
void PlayerPhase_ReReadGameSaveGfx(void);
void MakeMoveunitForActiveUnit(void);
void ClearActiveUnit(struct Unit * unit);
// ??? sub_801D7E8(???);
void PlayerPhase_RangeDisplayIdle_ForceAPress(ProcPtr);
// ??? sub_801D834(???);
void MoveLimitViewChange_OnInit(struct MoveLimitViewProc * proc);
void MoveLimitViewChange_OnLoop(struct MoveLimitViewProc * proc);
void MoveLimitView_OnInit(ProcPtr);
void MoveLimitView_OnLoop(struct MoveLimitViewProc * proc);
void MoveLimitView_OnEnd(struct MoveLimitViewProc * proc);
void DisplayMoveRangeGraphics(int flags);
void HideMoveRangeGraphics(void);
// ??? TrySetCursorOn(???);
void TrySwitchViewedUnit(int x, int y);
void PlayerPhase_HandleAutoEnd(ProcPtr);

extern const struct MenuDef gMapMenuDef;
extern const struct MenuDef gUnitActionMenuDef;

extern u16 gUnknown_08A02F34[];
extern u16 gUnknown_08A02F94[];
extern u16 gUnknown_08A02FF4[];

extern u8 gUnknown_08A02EB4[];

extern struct ProcCmd gProcScr_0859ACE8[];
extern struct ProcCmd gProcScr_PlayerPhase[];

#endif // GUARD_PLAYERPHASE_H
