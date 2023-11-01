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

struct SemiTransportWindowProc {
    /* 00 */ PROC_HEADER;
    /* 2A */ s16 x[4];
    /* 32 */ s16 y[4];
    /* 3A */ s8 height[4];
    /* 3E */ s8 width[4];
    /* 42 */ u16 oam2[4];
    /* 4A */ u8 valid[4];
    /* 4E */ u16 chr;
};

extern struct ProcCmd ProcScr_PrepSemiTransportWindow[];

void SemiTransportWindow_Init(struct SemiTransportWindowProc * proc);
void SemiTransportWindow_Main(struct SemiTransportWindowProc * proc);
ProcPtr NewSemiTransportWindowHandler(ProcPtr);
void SemiTransportWindowSetGfx(u32 obj_offset);
void EnableSemiTransportWindow(int index, int x, int y, int width, int height, u16 oam2);
void DisableSemiTransportWindow(int index);
void BlockAllSemiTransportWindows(void);
void UnblockAllSemiTransportWindows(void);
void EndSemiTransportWindows(void);

struct ParallelWorkerProc {
    /* 00 */ PROC_HEADER;
    /* 2C */ ParallelWorkerFunc * func;
};

extern struct ProcCmd ProcScr_ParallelWorker[];

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
void configSysHandCursorShadowEnabled(u8 enabled);

void sub_80AD5B4(void);
void EnableAllGfx(void);
// ??? sub_80AD5F8(???);
// ??? sub_80AD610(???);
// ??? sub_80AD950(???);
// ??? sub_80AD998(???);
// ??? sub_80AD9E8(???);
// ??? sub_80ADA10(???);
// ??? sub_80ADA24(???);
// ??? sub_80ADA3C(???);
void StartSmallBrownNameBoxes(int objNode, int tileOffset, int palIndex, int oam2base, int unk, ProcPtr parent);
void SmallBrownNameBoxDoSomeConfig(int a, int b, int c, int d);
// ??? sub_80ADC44(???);
// ??? sub_80ADC68(???);
void EndSmallBrownNameBoxes(void);
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
// ??? sub_80AE4D8(???);
// ??? sub_80AE518(???);
// ??? sub_80AE71C(???);
// ??? sub_80AE750(???);
// ??? sub_80AE76C(???);
// ??? sub_80AE790(???);
// ??? sub_80AE7A4(???);
// ??? sub_80AE7C4(???);
// ??? sub_80AE86C(???);
// ??? sub_80AE930(???);
// ??? sub_80AE938(???);
// ??? sub_80AE964(???);
// ??? sub_80AE99C(???);
// ??? sub_80AE9B0(???);
int sub_80AEA24(int);
// ??? sub_80AEA70(???);
char* sub_80AEABC(const char*, char*); // AppendTextBuffer_080aeabc
char* sub_80AEADC(int, char*);
// ??? sub_80AEAE8(???);
// ??? sub_80AEB1C(???);
// ??? sub_80AEB28(???);
// ??? sub_80AEB44(???);
// ??? sub_80AEB60(???);
// ??? sub_80AEB8C(???);
void sub_80AEBCC(int, int, int, ProcPtr);
int sub_80AEBEC(int number);
// ??? sub_80AEC04(???);
// ??? sub_80AEC54(???);
// ??? sub_80AEC68(???);
// ??? sub_80AEC7C(???);
// ??? sub_80AEC90(???);
int sub_80AEC94(void);
// ??? sub_80AECB4(???);
// ??? sub_80AECEC(???);
// ??? sub_80AED10(???);
// ??? sub_80AED64(???);
// ??? sub_80AEEC0(???);
// ??? sub_80AEEC4(???);
// ??? sub_80AEEE8(???);
// ??? sub_80AEF24(???);
// ??? sub_80AEF64(???);
// ??? sub_80AF0E0(???);
// ??? sub_80AF140(???);
// ??? sub_80AF1A0(???);
// ??? sub_80AF1D8(???);
// ??? sub_80AF220(???);
// ??? nullsub_65(???);
// ??? sub_80AF22C(???);
// ??? sub_80AF338(???);
// ??? sub_80AF350(???);
// ??? sub_80AF378(???);
// ??? sub_80AF3C8(???);
// ??? sub_80AF4D0(???);
// ??? sub_80AF510(???);
