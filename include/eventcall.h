#pragma once

#include "global.h"
#include "proc.h"
#include "event.h"

struct UnkProc80855A0 {
    PROC_HEADER;
    /* 29 */ u8 _pad_29[0x4D - 0x29];
    /* 4D */ u8 unk4D;
};

struct Proc8085618 {
    PROC_HEADER;
    /* 29 */ u8 _pad_29[0x4C - 0x29];
    /* 4C */ s8 unk4C;
};

struct Proc89EE068 {
    PROC_HEADER;
    /* 29 */ u8 _pad_29[0x54 - 0x29];
    /* 54 */ ProcPtr unk_proc;
};

struct Proc89EE088 {
    PROC_HEADER;
    /* 29 */ u8 _pad_29[0x2C - 0x29];
    /* 2C */ u32 count;
};

struct Proc89EE9E0 {
    PROC_HEADER;
    /* 29 */ u8 _pad_29[0x4C - 0x29];
    /* 4C */ s16 timer;
    /* 4E */ u8 _pad_4E[0x52 - 0x4E];
    /* 52 */ u16 count;
    /* 54 */ u8 _pad_54[0x64 - 0x54];
    /* 64 */ s16 mode;
};

struct Proc89EEA28 {
    PROC_HEADER;
    /* 29 */ u8 _pad_29[0x4C - 0x29];
    /* 4C */ s16 timer;
    /* 4E */ u8 _pad_4E[0x52 - 0x4E];
    /* 52 */ u16 count;
    /* 54 */ u8 _pad_54[0x64 - 0x54];
    /* 64 */ s16 mode;
};

void EventCallGameOverExt(ProcPtr proc);
void GameOver_FadeOutCurrentBgm(ProcPtr proc);
void SkilGameOverForToturialExtraMap(ProcPtr proc);
void PostGameOverHandler(ProcPtr proc);
int CheckWaitAction_unused(void);
void UnsetKeyIgnoreMask(void);
void AsnycKeyStatus_ButtonB(void);
void NewForceAsyncButtonB(ProcPtr proc);
void HideAllAlliesExceptLeader(void);
void ResetAllPlayerUnitState(void);
// ??? TryLockParentProc(???);
// ??? TryUnlockParentProc(???);
// ??? ResetAllBG(???);
// ??? SwapUnitStatsChar100(???);
// ??? sub_8085550(???);
// ??? sub_8085578(???);
// ??? sub_80855A0(???);
// ??? sub_80855D4(???);
// ??? sub_80855F8(???);
void sub_8085618(struct Proc * proc);
void sub_8085670(struct Proc * proc);
// ??? sub_80856D0(???);
// ??? sub_8085728(???);
// ??? sub_808576C(???);
// ??? sub_80857B0(???);
// ??? sub_80857F4(???);
// ??? sub_808581C(???);
// ??? sub_8085844(???);
// ??? sub_808586C(???);
void sub_8085894(struct Proc * proc);
void sub_808589C(struct Proc * proc);
// ??? sub_808591C(???);
// ??? sub_8085948(???);
void SetEventId_0x84(ProcPtr);
void UnsetEventId_0x84(ProcPtr);
void sub_8085988(struct EventEngineProc * proc);
void sub_8085990(struct EventEngineProc * proc);
void sub_80859D0(ProcPtr proc, ProcPtr parent);
void nullsub_20(ProcPtr);
void sub_80859EC(struct Proc89EE088 * proc);
void sub_8085ACC(struct Proc89EE088 * proc);
void sub_8085B30(struct Proc89EE088 * proc);
void sub_8085B58(struct Proc89EE088 * proc);
// ??? sub_8085BB4(???);
// ??? sub_8085BFC(???);
// ??? sub_8085C10(???);
// ??? sub_8085C24(???);
// ??? sub_8085C38(???);
// ??? sub_8085C4C(???);
// ??? sub_8085C58(???);
// ??? sub_8085C64(???);
// ??? sub_8085C70(???);
void sub_8085C7C(ProcPtr, int);
void sub_8085DCC(int, int);
// ??? sub_8085E08(???);
// ??? sub_8085E48(???);
// ??? sub_8085E94(???);
// ??? nullsub_30(???);
// ??? sub_8085F88(???);
// ??? sub_808609C(???);
// ??? sub_8086100(???);
// ??? sub_8086134(???);
// ??? sub_808613C(???);
// ??? sub_808622C(???);
// ??? sub_80862C4(???);
// ??? sub_808635C(???);
// ??? HandleCh5xUnits_Start(???);
// ??? HandleCh5xUnits_End(???);
// ??? CallRouteSplitMenu(???);
// ??? MenuCommand_DrawRouteSplit(???);
// ??? Command_EirikaMode(???);
// ??? Command_EphraimMode(???);
void AutolevelSecondaryLord();
