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
    /* 30 */ struct MUProc * muProc;
    /* 34 */ const struct REDA * redas;
    /* 38 */ u16 redaCount;
    /* 3A */ u16 unk_3a;
    /* 3C */ s16 delayFrames;
    /* 3E */ u16 flags;
    /* 40 */ s8 unk_40;
    /* 41 */ s8 unk_41;
    /* 42 */ s8 unk_42;
    /* 43 */ s8 unk_43;
    /* 44 */ struct REDA unk_44;
};

// ??? CopyEventMoveToBuffer(???);
// ??? ClearEventMoveBuffer(???);
void MuCtr_StartDefinedMove(struct Unit * unit, const struct REDA * redas, s16 count, u16 flags);
void MuCtr_StartMoveTowards(struct Unit *, s8, s8, u8, u16);
void MuCtr_InitDefinedMove(struct MuCtrlProc * proc, struct Unit * unit, const struct REDA * redas, s16 count, u16 flags);
s8 MuCtrExists(void);
void MU_AllForceSetMaxMoveSpeed_(void);
void sub_8079FA8(struct Unit* unit, const struct REDA * redas, s16 count, u16 flags);
void MoveUnit_(struct Unit *, s8, s8, u16);
void GenUnitDefinitionFinalPosition(const struct UnitDefinition* uDef, u8* xOut, u8* yOut, s8 findNearest);
// ??? sub_807A0E4(???);
// ??? sub_807A194(???);
// ??? MuCtr_OnEnd(???);
s8 sub_807A294(u8 pid, u16 b);
void sub_807A300(struct MuCtrlProc *);
void sub_807A324(struct MuCtrlProc *);
void MuCtr_ExecREDA_807A358(struct MuCtrlProc *);
void AdjustNewUnitPosition(struct Unit *, struct Vec2 *, u16);
u8 * sub_807A644(struct Unit * unit, struct Vec2 * pos, s8 flag);

extern struct REDABuffer gUnknown_03001A30;
extern s8 gUnknown_03001C34;
extern u8 gUnknown_03001C35;
extern u16 gUnknown_03001C36;

extern struct ProcCmd gProcScr_MuCtrl[];

#endif // GUARD_MUCTRL_H
