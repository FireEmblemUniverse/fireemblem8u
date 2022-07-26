#ifndef GUARD_SALLYCURSOR_H
#define GUARD_SALLYCURSOR_H

struct UnknownSALLYCURSORProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ int unk_2C;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ int unk_3C;
    /* 40 */ int unk_40;

    /* 44 */ u8 _pad44[0x49-0x44];

    /* 4A */ s16 unk_4A;
    /* 4C */ short unk_4C;

    /* 4E */ u8 _pad4E[0x53-0x4E];

    /* 54 */ struct APHandle* unk_54;

    /* 58 */ u32 unk_58;
};

int GetPlayerLeaderUnitId(void);
void sub_80332D0(void);
void sub_803334C(void);
void sub_8033358(struct UnknownSALLYCURSORProc*);
void sub_803336C(struct UnknownSALLYCURSORProc*);
bool8 sub_80333A4(ProcPtr);
bool8 sub_80333C4(ProcPtr);
void SALLYCURSOR_DeploySupplyUnit(void);
void sub_803341C(struct UnknownSALLYCURSORProc*);
void SALLYCURSOR_RemoveSupplyUnit(void);
void sub_8033458(struct UnknownSALLYCURSORProc*);
void sub_8033468(struct UnknownSALLYCURSORProc*);
void sub_803348C(ProcPtr);
void sub_80334BC(struct UnknownSALLYCURSORProc*);
void sub_80334CC(void);
void sub_80334E8(int);
void sub_8033514(int);
void sub_8033548(ProcPtr);
void sub_8033574(void);
void sub_8033608(void);
void sub_8033620(ProcPtr);
void sub_8033634(void);
void sub_8033648(struct UnknownSALLYCURSORProc*);
bool8 CanCharacterBePrepMoved(int);
void sub_8033770(struct UnknownSALLYCURSORProc*);
void sub_8033798(struct UnknownSALLYCURSORProc*);
void sub_80337B4(struct UnknownSALLYCURSORProc*);
void sub_80337D4(struct UnknownSALLYCURSORProc*);
void sub_80337F0(struct UnknownSALLYCURSORProc*);
void InitPrepScreenUnitsAndCamera(void);
void sub_80338C0(void);
void sub_8033940(struct UnknownSALLYCURSORProc*);
void sub_8033978(ProcPtr);
int sub_8033BF8(void);
void SALLYCURSOR6C_StartUnitSwap(struct UnknownSALLYCURSORProc*);
void sub_8033C90(struct UnknownSALLYCURSORProc*);
void sub_8033DD8(ProcPtr);
void sub_8033E08(ProcPtr);
void sub_8033E8C(void);
void sub_8033EA4(void);
void sub_8033EC0(ProcPtr);
void CallCursorShop(ProcPtr);
void sub_8033F34(ProcPtr);
void sub_8034078(ProcPtr);
void sub_8034090(ProcPtr);
void sub_803410C(ProcPtr);
void sub_8034168(void);
void sub_8034194(void);
void sub_80341D0(void);
void sub_8034200(void);
void ShrinkPlayerUnits(void);
void sub_8034278(void);
bool8 sub_80342FC(void);

extern struct ProcCmd gProcScr_SALLYCURSOR[];

#endif  // GUARD_SALLYCURSOR_H