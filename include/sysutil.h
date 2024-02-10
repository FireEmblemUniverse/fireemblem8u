#pragma once

#include "global.h"
#include "proc.h"
#include "fontgrp.h"

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


struct SysBlackBoxProc {
    /* 00 */ PROC_HEADER;
    /* 2A */ s16 x[4];
    /* 32 */ s16 y[4];
    /* 3A */ s8 height[4];
    /* 3E */ s8 width[4];
    /* 42 */ u16 oam2[4];
    /* 4A */ u8 valid[4];
    /* 4E */ u16 chr;
};

extern struct ProcCmd ProcScr_SysBlackBox[];

void SysBlackBox_Init(struct SysBlackBoxProc * proc);
void SysBlackBox_Main(struct SysBlackBoxProc * proc);
ProcPtr NewSysBlackBoxHandler(ProcPtr);
void SysBlackBoxSetGfx(u32 obj_offset);
void EnableSysBlackBox(int index, int x, int y, int width, int height, u16 oam2);
void DisableSysBlackBox(int index);
void BlockAllSysBlackBoxs(void);
void UnblockAllSysBlackBoxs(void);
void EndSysBlackBoxs(void);

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

struct SysGrayBoxConf {
    bool valid;
    u8 layer;
    s16 x, y;
    u8 width, height;
    u16 chr;
} BITPACKED;

struct ProcSysGrayBox {
    PROC_HEADER;

    /* 2C */ struct SysGrayBoxConf priv[4];
    /* 5C */ int chr, pal;
};

extern struct ProcCmd ProcScr_SysGrayBox[];

void SysGrayBox_Init(struct ProcSysGrayBox * proc);
void SysGrayBox_Loop(struct ProcSysGrayBox * proc);
ProcPtr NewSysGrayBox(u32 vobj_offset, u32 pal, ProcPtr parent);
void EnableUnransportWindow(int index, int layer, int x, int y, int w, int h, u16 chr);
void DisableSysGrayBox(int index);
void EndSysGrayBoxs(void);

struct SysBrownBoxConf {
    bool valid;
    u8 frame;
    s16 x, y;
    s8 width, height;
};

struct ProcSysBrownBox {
    PROC_HEADER;

    /* 2C */ struct SysBrownBoxConf priv[4];
    /* 4C */ u16 oam2;
    /* 4E */ s16 y;
    /* 50 */ u8 layer;
};

extern struct ProcCmd ProcScr_SysBrownBox[];

void SysBrownBox_Init(struct ProcSysBrownBox * proc);
void SysBrownBox_Loop(struct ProcSysBrownBox * proc);
void StartSysBrownBox(int layer, u32 vobj_offset, int pal, u16 oam2, u16 y, ProcPtr parent);
void EnableSysBrownBox(int index, int x, int y, int frame);
void DisableSysBrownBox(int index);
void SetSysBrownBoxWidth(int index, u8 width);
void EndSysBrownBox(void);

struct ProcSysboxText {
    PROC_HEADER;
    /* 2C */ struct Font font;
    /* 44 */ struct Text texts[2];
    /* 54 */ const char * str;
    /* 58 */ u8 line, max_line;
    /* 5A */ u16 timer, delay, speed;
    /* 5E */
};

extern struct ProcCmd ProcScr_SysboxText[];

void SysboxTextMain(struct ProcSysboxText * proc);
void NewSysboxText(int vobj_offset, int pal, const char * str, int line, int delay, int speed, ProcPtr parent);

void EndAllProcChildren(ProcPtr proc);
void nop_80ADDF8(void);

/* Some objects scalling routine */
void sub_80ADDFC(u8 layer, s16 angle, s16, s16, s16, s16);
void sub_80ADE90(u8, s16, s16);
void sub_80ADEE0(u8, s16, s16, s16, s16);
void sub_80ADF48(u8 layer, int angle, int a, int b, int c, int d);
void sub_80ADFBC(u8 layer, int a, int b);
void sub_80ADFFC(u8 layer, int a, int b, int c, int d);

/* No idea, maybe some tile map or palette modication */
void sub_80AE044(int a, u16 * buf, int c, int d, int e, int f, int g, int h);
void sub_80AE0F0(int a, int b, int c, int d, int e, u16 f) ;
void SetBlankBgColor(int, int, int);

struct ProcFadeInOut {
    PROC_HEADER;

    /* 29 */ bool white_out;
    /* 2C */ int timer;
    /* 30 */ int speed;
    /* 34 */ int mask;
};

extern struct ProcCmd CONST_DATA ProcScr_BmFadeIN[];
extern struct ProcCmd CONST_DATA ProcScr_BmFadeOUT[];

void FadeInOut_Init(struct ProcFadeInOut * proc);
void FadeIn_Loop(struct ProcFadeInOut * proc);
void FadeOut_Loop(struct ProcFadeInOut * proc);
void FadeInOut_DisableGfx(struct ProcFadeInOut * proc);
bool FadeInExists(void);
bool FadeOutExists(void);
void NewFadeIn(int, ProcPtr);
void NewFadeOut(int, ProcPtr);
void NewFadeIn(int speed, ProcPtr parent);
void NewFadeOut(int speed, ProcPtr parent);
void NewBlockedFadeIn(int speed, ProcPtr parent);
void NewBlockedFadeOut(int speed, ProcPtr parent);
void NewFadeIn2(int speed, ProcPtr parent);
void NewFadeOut2(int speed, ProcPtr parent);
void NewFadeInWhite(int speed, ProcPtr parent);
void NewFadeOutWhite(int speed, ProcPtr parent);
void NewBlockedFadeInWhite(int speed, ProcPtr parent);
void NewBlockedFadeOutWhite(int speed, ProcPtr parent);
void NewFadeInWhite2(int speed, ProcPtr parent);
void NewFadeOutWhite2(int speed, ProcPtr parent);
void WipeAllPalette(void);
void EndFadeInOut(void);

struct BmBgxConf
{
    /* 00 */ u8 type;
    /* 04 */ void * data;
    /* 08 */ u16 size;
    /* 0A */ u8 duration;
    /* 0B */ STRUCT_PAD(0x0b, 0x0c);
};

enum BmBgxConf_type {
    BMFX_CONFT_IMG = 0,  /* Uncomprsssed image */ 
    BMFX_CONFT_ZIMG = 1, /* Compresssed  image */
    BMFX_CONFT_TSA = 2,
    BMFX_CONFT_PAL = 3,
    BMFX_CONFT_LOOP_START = 4,
    BMFX_CONFT_LOOP = 5,
    BMFX_CONFT_BLOCKING = 6,
    BMFX_CONFT_7,
    BMFX_CONFT_CALL_IDLE = 8,
    BMFX_CONFT_BREAK = 9,
    BMFX_CONFT_END = 10
};

typedef s8 bmfx_idle(ProcPtr);

struct ProcBmBgfx {
    /* 00 */ PROC_HEADER;
    /* 2C */ struct BmBgxConf * conf;
    /* 30 */ u16 x;
    /* 32 */ u16 y;
    /* 34 */ u8 bg;
    /* 35 */ u8 pal_bank;
    /* 36 */ s8 counter; /* counter for loop */
    /* 37 */ u8 flip; /* 1 --> 0 --> 1 --> 0 */
    /* 38 */ u8 timer;
    /* 39 */ u8 func_call_type; /* 0 = idle, 1 = cmd call */
    /* 3A */ bool loop_en;
    /* 3B */ STRUCT_PAD(0x3b, 0x3c);
    /* 3C */ int vram_base;
    /* 40 */ u32 vram_base_offset;
    /* 44 */ int vram_free_space;
    /* 48 */ u32 size_per_fx; /* Size of each frame usage in VRAM */
    /* 4C */ int total_duration;
    /* 50 */ int counter_procloop;
    /* 54 */ int counter_functioncall;
    /* 58 */ s8 (* callback)(ProcPtr);
};

void BmBgfx_Init(struct ProcBmBgfx * proc);
void BmBgfx_Loop(struct ProcBmBgfx * proc);
void BmBgfx_End(struct ProcBmBgfx * proc);
s8 CheckBmBgfxDone(void);
void BmBgfxAdvance(void);
void EndBmBgfx(void);
void BmBgfxSetLoopEN(u8);
void StartBmBgfx(struct BmBgxConf * input, int bg, int x, int y, int e, int f, int g, void * func, ProcPtr parent);

extern struct ProcCmd ProcScr_BmBgfx[];
