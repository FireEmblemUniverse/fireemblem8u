#ifndef GUARD_MUCTRL_H
#define GUARD_MUCTRL_H

struct REDA {
    u32 x : 6;
    u32 y : 6;
    u32 flags : 6;
    u8 a;
    u16 b;
    u16 delayFrames;
};

struct REDABuffer
{
    u8 usedBuffers;
    struct REDA buf[4][0x10];
};

struct MuCtrlProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct Unit * unit;
    /* 30 */ struct MuProc * muProc;
    /* 34 */ const struct REDA * redas;
    /* 38 */ u16 redaCount;
    /* 3A */ u16 timer;
    /* 3C */ s16 delayFrames;
    /* 3E */ u16 flags;
    /* 40 */ s8 x, y;
    /* 42 */ s8 unk_42;
    /* 43 */ s8 unk_43;
    /* 44 */ struct REDA reda_cur;
};

// ??? CopyEventMoveREDAs(???);
// ??? ClearEventMoveBuffer(???);
void MuCtr_StartDefinedMove(struct Unit * unit, const struct REDA * redas, s16 count, u16 flags);
void MuCtr_StartMoveTowards(struct Unit *, s8, s8, u8, u16);
void MuCtr_InitDefinedMove(struct MuCtrlProc * proc, struct Unit * unit, const struct REDA * redas, s16 count, u16 flags);
s8 MuCtrExists(void);
void SetMuMaxWalkSpeed_(void);
void MoveUnitExt(struct Unit* unit, const struct REDA * redas, s16 count, u16 flags);
void MoveUnit_(struct Unit *, s8, s8, u16);
void GenUnitDefinitionFinalPosition(const struct UnitDefinition* uDef, s8* xOut, s8* yOut, s8 findNearest);
// ??? MuCtr_DelayMoveLoop(???);
// ??? MuCtr_WaitForMoveLoop(???);
// ??? MuCtr_OnEnd(???);
s8 MuCtr_CheckMoveDependency(u8 pid, u16 b);
void MuCtr_FindMovingUnit(struct MuCtrlProc *);
void MuCtr_CheckUnitPassedStep(struct MuCtrlProc *);
void MuCtr_ExecREDA_0(struct MuCtrlProc *);
void AdjustNewUnitPosition(struct Unit *, struct Vec2 *, u16);
u8 * MuCtr_GenMoveScript(struct Unit * unit, struct Vec2 * pos, s8 flag);

extern struct REDABuffer gEventREDAs;
extern s8 gUnk_52;
extern u8 gUnk_53;
extern u16 gUnk_54;

extern struct ProcCmd ProcScr_MuCtrl[];

#endif // GUARD_MUCTRL_H
