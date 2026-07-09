#pragma once

#include "global.h"

struct TileMapArr {
    u32 type : 8;
    u32 size : 24;
    u16 data[0x259]; /* todo */
};

enum interpolate_method {
    INTERPOLATE_LINEAR,
    INTERPOLATE_SQUARE,
    INTERPOLATE_CUBIC,
    INTERPOLATE_POW4,
    INTERPOLATE_RSQUARE,
    INTERPOLATE_RCUBIC,
};

int Interpolate(int method, int lo, int hi, int x, int x_max);

struct PalFadeSt {
    /* 00 */ u16 from_colors[0x10];
    /* 20 */ u16 const * to_colors;
    /* 24 */ u16 * pal;
    /* 28 */ u16 clock;
    /* 2A */ u16 clock_end;
    /* 2C */ u16 clock_stop;
};

extern struct PalFadeSt EWRAM_DATA sPalFadeSt[0x20];

struct PalFadeSt *GetPalFadeSt();
struct PalFadeSt *StartPalFade(u16 const *colors, int pal, int duration, ProcPtr parent);

#define RGB_16TIMES(r, g, b) \
    RGB(r, g, b), \
    RGB(r, g, b), \
    RGB(r, g, b), \
    RGB(r, g, b), \
    RGB(r, g, b), \
    RGB(r, g, b), \
    RGB(r, g, b), \
    RGB(r, g, b), \
    RGB(r, g, b), \
    RGB(r, g, b), \
    RGB(r, g, b), \
    RGB(r, g, b), \
    RGB(r, g, b), \
    RGB(r, g, b), \
    RGB(r, g, b), \
    RGB(r, g, b), \

extern CONST_DATA u16 Pal_AllBlack[];
extern CONST_DATA u16 Pal_AllWhite[];
extern CONST_DATA u16 Pal_AllRed[];
extern CONST_DATA u16 Pal_AllGreen[];
extern CONST_DATA u16 Pal_AllBlue[];
extern CONST_DATA u16 Pal_AllYellow[];

CONST_DATA extern struct ProcCmd ProcScr_SpacialSeTest[];
CONST_DATA extern struct ProcCmd ProcScr_PalFade[];
CONST_DATA extern struct ProcCmd ProcScr_FadeToBlack[];
CONST_DATA extern struct ProcCmd ProcScr_FadeFromBlack[];
CONST_DATA extern struct ProcCmd ProcScr_FadeToWhite[];
CONST_DATA extern struct ProcCmd ProcScr_FadeFromWhite[];
CONST_DATA extern struct ProcCmd ProcScr_FadeCore[];
CONST_DATA extern struct ProcCmd ProcScr_TemporaryLock[];
CONST_DATA extern struct ProcCmd ProcScr_PaletteAnimator[];
CONST_DATA extern struct ProcCmd ProcScr_CallDelayed[];
CONST_DATA extern struct ProcCmd ProcScr_CallDelayedArg[];

void Nop_Bmlib_0(void);
bool StringCompare(const char *str1, const char *str2);
void CopyString(char *, const char *);
void UnpackRaw(const void *src, void *dst);
void DecompressViaGenericBuf(const void *src, void *dst);
void Decompress(const void* src, void* dst);
int GetDataSize(const void* data);
// ??? GfxLoadCursor_Init(???);
// ??? GfxLoadCursor_Decompress(???);
// ??? GfxLoadCursor_Skip(???);
void Register2dChrMove(const void* source, void* target, int width, int height);
void Copy2dChr(const void* src, void* dst, int tileWidth, int tileHeight);
void ApplyBitmap(const void* src, void* dst, int width, int height);
void ApplyBitmapLine(const void *src, void *dst, int width);
void ApplyBitmapTile(const u8 *src, u32 *dst, int width);
void PutAppliedBitmap(u16*, int, int, int);
void PutDigits(u16 *tm, const u8 *src, int tileref, int len);
void PutNumberTilesRightAligned(u16 *dst, u8* src, int a3, int a4, int a5);
// ??? Bmlib_SetCounter(???);
// ??? Bmlib_IncrementCounter(???);
// ??? Bmlib_DecrementCounter(???);
void InitWindowScanlineBounds(s16*);
void RasterizeWindowEdge(s16*, int, int, int, int);
struct Vec2 * MakeCircleWindowBounds(int);
// ??? DarkenPals(???);
// ??? Nop_Bmlib_1(???);
// ??? Bmlib_DeadRecursiveStub(???);
void SetPalFadeStClkEnd(int _2a, int _5a, int _8a);
void SetPalFadeStClkEnd1(int a);
void SetPalFadeStClkEnd2(int a);
void SetPalFadeStClkEnd3(int a);
int GetPalFadeStClkEnd1();
int GetPalFadeStClkEnd2();
int GetPalFadeStClkEnd3();
void ArchiveCurrentPalettes();
void ArchivePalette(int index);
void WriteFadedPaletteFromArchive(int red, int green, int blue, u32 mask);
// ??? MapPaletteBrightnessFade_Init(???);
// ??? MapPaletteBrightnessFade_Loop(???);
void StartMapPaletteBrightnessFade(int a, int b, int c, int d, int e, int f, int g, int h, ProcPtr parent);
bool MapPaletteBrightnessFadeExists(void);
// ??? SpacialSeTest_OnInit(???);
// ??? SpacialSeTest_OnLoop(???);
void StartSpacialSeTest(void);
void Nop_Bmlib_2(void);
void StartPalFadeToBlack(int palid, int duration, ProcPtr parent); // StartPalFadeToBlack
void StartPalFadeToWhite(int palid, int duration, ProcPtr parent);
struct PalFadeSt * StartPalFade(u16 const *colors, int pal, int duration, ProcPtr parent);
void EndPalFade(void);
void SetPalFadeStop(struct PalFadeSt * st, int val);
// ??? PalFade_OnLoop(???);
void SetBlackPal(int palid);
void SetWhitePal(int palid);
void SetAllBlackPals(void);
void SetAllWhitePals(void);
void FadeToBlack_OnInit(struct Proc * proc);
void FadeToCommon_OnLoop(struct Proc *proc);
void FadeFromBlack_OnInit(struct Proc * proc);
void FadeFromCommon_OnLoop(struct Proc * proc);
void FadeToWhite_OnInit(struct Proc * proc);
void FadeFromWhite_OnInit(struct Proc * proc);
bool FadeExists(void);
void StartFadeToBlack(int q4_speed);
void StartFadeFromBlack(int q4_speed);
void StartLockingFadeToBlack(int speed, ProcPtr parent);
void StartLockingFadeFromBlack(int q4_speed, ProcPtr parent);
void StartLockingFadeToWhite(int q4_speed, ProcPtr parent);
void StartLockingFadeFromWhite(int q4_speed, ProcPtr parent);
void StartMidFadeToBlack(void);
void StartSlowFadeToBlack(void);
void StartFastFadeToBlack(void);
void StartMidFadeFromBlack(void);
void StartSlowFadeFromBlack(void);
void StartFastFadeFromBlack(void);
void StartMidLockingFadeToBlack(ProcPtr parent);
void StartSlowLockingFadeToBlack(ProcPtr parent);
void StartFastLockingFadeToBlack(ProcPtr parent);
void StartMidLockingFadeFromBlack(ProcPtr parent);
void StartSlowLockingFadeFromBlack(ProcPtr parent);
void StartFastLockingFadeFromBlack(ProcPtr parent);
void StartSlowLockingFadeToWhite(ProcPtr parent);
void StartSlowLockingFadeFromWhite(ProcPtr parent);

struct FadeCoreProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ void (*on_end)(void);
    /* 50 */ STRUCT_PAD(0x50, 0x54);
    /* 54 */ int speed;
    /* 58 */ int looper;
    /* 5C */ int counter;
};

void FadeOutBlackSpeed04(ProcPtr parent);
void FadeOutBlackSpeed08(ProcPtr parent);
void FadeOutBlackSpeed10(ProcPtr parent);
void FadeOutBlackSpeed20(ProcPtr parent);
void FadeOutBlackSpeed40(ProcPtr parent);
void FadeInBlackSpeed08NonLocking(ProcPtr parent);
void FadeInBlackSpeed10NonLocking(ProcPtr parent);
void FadeInBlackSpeed20NonLocking(ProcPtr parent);
void FadeInBlackSpeed40NonLocking(ProcPtr parent);
void FadeOutBlackSpeed04Locking(ProcPtr parent);
void FadeOutBlackSpeed08Locking(ProcPtr parent);
void FadeOutBlackSpeed10Locking(ProcPtr parent);
void FadeOutBlackSpeed20Locking(ProcPtr);
void FadeOutBlackSpeed40Locking(ProcPtr);
void FadeInBlackSpeed04(ProcPtr parent);
void FadeInBlackSpeed08(ProcPtr parent);
void FadeInBlackSpeed08Unk(ProcPtr parent);
void FadeInBlackSpeed10(ProcPtr parent);
void FadeInBlackSpeed20(ProcPtr);
void FadeInBlackSpeed40(ProcPtr);
void FadeInWhiteSpeed10Locking(ProcPtr parent);
void FadeOutWhiteSpeed10Locking(ProcPtr parent);
void FadeInWhiteSpeed08Locking(ProcPtr parent);
void FadeInWhiteSpeed04(ProcPtr parent);
void FadeInWhiteSpeed08(ProcPtr parent);
void FadeOutWhiteSpeed08Locking(ProcPtr parent);
void WaitForFade(ProcPtr);
void FadeOutBlackSpeed40LockingWithCallback(ProcPtr parent, void * func);
void StartFadeCore(int kind, int speed, ProcPtr parent, void * callback);
void FadeCoreEndEach(void);
void FadeCore_Init(struct FadeCoreProc * proc);
void FadeCore_Loop(struct FadeCoreProc * proc);
bool FadeCore_Tick(struct FadeCoreProc * proc);
void FadeCore_StopObjPalFade(void);
void StopFadeComponents(int a, int b);
void ClearFadeCoreCallback(void);
void ForceScreenToBlack(void);
void ForceScreenToWhite(void);
void StartTemporaryLock(ProcPtr proc, int duration);
void TemporaryLock_OnLoop(struct Proc * proc);

extern char CONST_DATA SJisZero[];
extern char CONST_DATA SJisDash[];
extern char CONST_DATA AsciiZero;
extern char CONST_DATA AsciiDash;

int NumberToStringSJis(int number, char* buf);
int NumberToStringAscii(int number, char * buf);
struct Text * PutStringCentered(u16 * tm, int color, int width, char const * str);
struct Text * PutString(u16 * tm, int color, char const * str);

struct ProcPaletteAnimator {
    /* 00 */ PROC_HEADER;

    /* 2C */ u16 const * colors;
    /* 30 */ u16 palOffset;
    /* 32 */ u16 colorCount;
    /* 34 */ u16 clock_end;
    /* 36 */ u16 clock;
    /* 38 */ u16 counter;
    /* 3A */ u16 reverseOrder;
};

void DeleteAllPaletteAnimator(void);
ProcPtr StartPaletteAnimatorExt(u16 const * colors, int pal_offset, int pal_size, int interval, ProcPtr parent);
void StartPaletteAnimatorReverse(const u16 * pal, int off, int len, int unk, ProcPtr proc);
void StartPaletteAnimatorNormal(const u16 * pal, int off, int len, int unk, ProcPtr proc);
void PaletteAnimator_Loop(struct ProcPaletteAnimator * proc);

void PutTmRectSequential(u16 * tm, int x, int y, u16 tileref, int width, int height);
void PutTmAnimFrame(u16 * tm, int x, int y, u16 tileref, int width, int height, u16 const * src, int arg_7);
void PutTmAnimFrame(u16 * tm, int x, int y, u16 tileref, int width, int height, u16 const * src, int arg_7);
void PutTmAnimFrameFromTsa(u16 * tm, int x, int y, u16 tileref, int width, int height, u8 const * src, int arg_7);
void PutTmSized(u16 * tm, int x, int y, u32 const * arg_3, u16 tileref);

struct CallDelayedProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ void (* func)();
    /* 30 */ int arg;
    /* 34 */ int clock;
};
void CallDelayed_OnLoop(struct CallDelayedProc * proc);
void CallDelayedArg_OnLoop(struct CallDelayedProc * proc);
void CallDelayed(void (* func)(void), int delay);
void CallDelayedArg(void (* func)(int), int arg, int delay);
void Bzero(u8 * out, int size);
void Memset8(u8 * out, int size, int value);
void Memset16(u16 * out, int size, int value);
void StartPartialGameLock(ProcPtr);
void PartialGameLock_OnLoop(struct Proc * proc);
void VramCopy(u8 const * src, u8 * dst, int size);
void VramCopyInRaw(u8 const * src, u8 * dst, int width, int height);
void PutTmLinear(u16 const * src, u16 * dst, int size, u16 tileref);
u16 * GetTmOffsetById(int bgid, int x, int y);
void ClearBlankBgTiles(void);
int Screen2Pan(int);
void PlaySeSpacial(int song, int x);
void PlaySeDelayed(int, int);
void PlaySeFunc(int song);
void _StartBgm(short song);
void _FadeBgmOut(short speed);
void DarkenPalette(int palid);
void MemCpy(const void * src, void * dst, int size);
void PutDrawTextCentered(struct Text * text, int x, int y, char const * str, int width);
int GetEasedProgress(int, int, int, int);

struct BgVerticalScrollSt {
    /* 000 */ u16 buf[3 * 320];
    /* 780 */ u16 * src[3];
    /* 78C */ u16 * dst[3];
    /* 798 */ u8 unk_798[3];
    /* 79B */ u8 frame_flip;
    /* 79C */ u8 frame;
    /* 79D */ bool updating;
    /* 79E */ bool scroll_en;
};

extern struct BgVerticalScrollSt * gpBgVerticalScrollSt;

void HBlank_BgVerticalScroll(void);
void StartBgVerticalScroll(struct BgVerticalScrollSt * buf);
void EndBgVerticalScroll(void);
u16 * GetBgVerticalScrollBuffer(int, int);
void FlipBgVerticalScroll(void);
void SetBgVerticalScrollPosition(int index,void * pr_offset);
// ??? ResetBgVerticalScrollPosition(???);
void ClearBgVerticalScrollChannelFlags(int);
// ??? SetBgVerticalScrollChannelFlag1(???);
// ??? SetBgVerticalScrollChannelFlag2(???);
void VecMulMat(int const * vec, int const * mat, int * ovec);
void MatMulMat(int const * lmat, int const * rmat, int * omat);
void MatIdent(int * mat);
void MatCopy(int const * src, int * dst);
void MatRotA(int * mat, short angle);
void MatRotB(int * mat, short angle);
void MatRotC(int * mat, short angle);
// ??? MathNullStub(???);
int VecDotVec(int const * lvec, int const * rvec);
void VecCrossVec(int const * lvec, int const * rvec, int * ovec);
int Vec2CrossVec2(int arg_0, int arg_1, int arg_2, int arg_3);
