#pragma once

#include "global.h"
#include "proc.h"

typedef void ParallelWorkerFunc(ProcPtr);

struct ParallelFiniteLoopProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ int maxCount;
    /* 30 */ int count;
    /* 34 */ ParallelWorkerFunc * func;
};

extern struct ProcCmd ProcScr_ParallelFiniteLoop[];
void ParallelFiniteLoop_Init(struct ParallelFiniteLoopProc * proc);
void ParallelFiniteLoop_Loop(struct ParallelFiniteLoopProc * proc);
void StartParallelFiniteLoop(void * func, int count, ProcPtr parent);


// extern ??? ProcScr_UntransBox
// extern ??? ProcScr_SysBrownBox
// extern ??? gUnknown_08A20D8C
extern struct ProcCmd CONST_DATA gUnknown_08A20DA4[];
extern struct ProcCmd CONST_DATA gUnknown_08A20DCC[];

struct SemiTransBoxProc {
    /* 00 */ PROC_HEADER;
    /* 2A */ s16 x[4];
    /* 32 */ s16 y[4];
    /* 3A */ s8 height[4];
    /* 3E */ s8 width[4];
    /* 42 */ u16 oam2[4];
    /* 4A */ u8 valid[4];
    /* 4E */ u16 chr;
};

extern struct ProcCmd ProcScr_SysSemiTransBox[];

void SemiTransBox_Init(struct SemiTransBoxProc * proc);
void SemiTransBox_Main(struct SemiTransBoxProc * proc);
ProcPtr NewSemiTransBoxHandler(ProcPtr);
void SemiTransBoxSetGfx(u32 obj_offset);
void EnableSemiTransBox(int index, int x, int y, int width, int height, u16 oam2);
void DisableSemiTransBox(int index);
void BlockAllSemiTransBoxs(void);
void UnblockAllSemiTransBoxs(void);
void EndSemiTransBoxs(void);

struct ParallelWorkerProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ ParallelWorkerFunc * func;
};

void ParallelWorker_OnLoop(struct ParallelWorkerProc * proc);
ProcPtr StartParallelWorker(void *, ProcPtr);
void EndAllParallelWorkers(void);
ProcPtr GetParallelWorker(void *);

struct SysHandCursorProc {
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x2C);
    /* 2C */ int x, y;
    /* 34 */ bool enable_bmshadow, enable_sysshadow;
    /* 36 */ u16 chr;
    /* 38 */ u16 shadow_len;
    /* 3A */ u16 pal_bank;
    /* 3C */ u16 chr2;
};

extern struct ProcCmd ProcScr_SysHandCtrl[];

void DisplayExtendedSysHand(struct SysHandCursorProc * proc);
void SysHandCursor_Init(struct SysHandCursorProc * proc);
void SysHandCursor_Loop(struct SysHandCursorProc * proc);
ProcPtr ResetSysHandCursor(ProcPtr parent);
void DisplaySysHandCursorTextShadow(u32 vobj_offset, u32 pal);
void SetSysHandCursorXPos(int x);
void SetSysHandCursorYPos(int y);
void ShowSysHandCursor(int x, int y, int shadow_len, u16 chr);
void HideSysHandCursor(void);
void EndSysHandCursor(void);
void ConfigSysHandCursorShadowEnabled(u8 enabled);

void DisableAllGfx(void);
void EnableAllGfx(void);

struct SysUntransBoxConf {
    bool valid;
    u8 layer;
    s16 x, y;
    u8 width, height;
    u16 chr;
} BITPACKED;

struct ProcSysUntransBox {
    PROC_HEADER;

    /* 2C */ struct SysUntransBoxConf priv[4];
    /* 5C */ int chr, pal;
};

void UntransBox_Init(struct ProcSysUntransBox * proc);
void UntransBox_Loop(struct ProcSysUntransBox * proc);
ProcPtr NewUntransBox(u32 vobj_offset, u32 pal, ProcPtr parent);
void EnableUnransportWindow(int index, int layer, int x, int y, int w, int h, u16 chr);
void DisableUntransBox(int index);
void EndUntransBoxs(void);

struct SysBrownBoxConf {
    bool valid;
    u8 layer;
    s16 x, y;
    u8 width, height;
};

struct ProcSysBrownBox {
    PROC_HEADER;

    /* 2C */ struct SysBrownBoxConf priv[4];
};

void SysBrownBox_Init(struct ProcSysBrownBox * proc);
void SysBrownBox_Loop(struct ProcSysBrownBox * proc);
void StartSysBrownBox(int objNode, int tileOffset, int palIndex, int oam2base, int unk, ProcPtr parent);
void SmallBrownNameBoxDoSomeConfig(int a, int b, int c, int d);
// ??? sub_80ADC44(???);
// ??? sub_80ADC68(???);
void EndSysBrownBox(void);
// ??? sub_80ADCA4(???);
void sub_80ADD24(int, int, const char*, int, int, int, ProcPtr);
void EndAllProcChildren(ProcPtr p);
// ??? sub_80ADDF8(???);
void sub_80ADDFC(int, int, int, int, int, int);
void sub_80ADE90(int, s16, s16);
void sub_80ADEE0(int, int, int, int, int);
// ??? sub_80ADF48(???);
// ??? sub_80ADFBC(???);
// ??? sub_80ADFFC(???);
// ??? sub_80AE044(???);
// ??? sub_80AE0F0(???);
void sub_80AE168(int, int, int);
// ??? FadeInOut_Init(???);
// ??? FadeIn_Loop(???);
// ??? FadeOut_Loop(???);
// ??? FadeInOut_DisableGfx(???);
void FadeInExists(ProcPtr);
void FadeOutExists(ProcPtr);
void NewFadeIn(int, ProcPtr);
void NewFadeOut(int, ProcPtr);
// ??? sub_80AE318(???);
// ??? sub_80AE33C(???);
// ??? sub_80AE360(???);
// ??? sub_80AE388(???);
// ??? sub_80AE3B0(???);
// ??? sub_80AE3D4(???);
// ??? sub_80AE3F8(???);
// ??? sub_80AE41C(???);
// ??? sub_80AE440(???);
// ??? sub_80AE468(???);
// ??? sub_80AE490(???);
// ??? sub_80AE4B4(???);
