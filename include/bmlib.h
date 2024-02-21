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

void sub_8012E94(void);
bool StringCompare(const char *str1, const char *str2);
void CopyString(char *, const char *);
void UnpackRaw(const void *src, void *dst);
void DecompressViaGenericBuf(const void *src, void *dst);
void Decompress(const void* src, void* dst);
int GetDataSize(const void* data);
// ??? sub_8012F98(???);
// ??? sub_8012FB0(???);
// ??? sub_8012FE0(???);
void Register2dChrMove(const void* source, void* target, int width, int height);
void Copy2dChr(const void* src, void* dst, int tileWidth, int tileHeight);
void ApplyBitmap(const void* src, void* dst, int width, int height);
void ApplyBitmapLine(const void *src, void *dst, int width);
void ApplyBitmapTile(const u8 *src, u32 *dst, int width);
void PutAppliedBitmap(u16*, int, int, int);
void PutDigits(u16 *tm, const u8 *src, int tileref, int len);
void sub_8013168(u16 *dst, u8* src, int a3, int a4, int a5);
// ??? sub_80131A8(???);
// ??? sub_80131B0(???);
// ??? sub_80131C4(???);
void sub_80131D0(s16*);
void sub_80131F0(s16*, int, int, int, int);
// ??? sub_8013278(???);
// ??? DarkenPals(???);
// ??? sub_8013428(???);
// ??? sub_801342C(???);
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
// ??? sub_801378C(???);
// ??? sub_8013794(???);
void sub_8013800(int a, int b, int c, int d, int e, int f, int g, int h, ProcPtr parent);
bool sub_8013844(void);
// ??? SpacialSeTest_OnInit(???);
// ??? SpacialSeTest_OnLoop(???);
void StartSpacialSeTest(void);
void sub_80138EC(void);
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

void sub_8013E30(ProcPtr parent);
void sub_8013E48(ProcPtr parent);
void sub_8013E60(ProcPtr parent);
void sub_8013E78(ProcPtr parent);
void sub_8013E90(ProcPtr parent);
void sub_8013EA8(ProcPtr parent);
void sub_8013EBC(ProcPtr parent);
void sub_8013ED0(ProcPtr parent);
void sub_8013EE4(ProcPtr parent);
void sub_8013EF8(ProcPtr parent);
void sub_8013F10(ProcPtr parent);
void sub_8013F28(ProcPtr parent);
void sub_8013F40(ProcPtr);
void sub_8013F58(ProcPtr);
void FadeInBlackSpeed04(ProcPtr parent);
void FadeInBlackSpeed08(ProcPtr parent);
void FadeInBlackSpeed08Unk(ProcPtr parent);
void FadeInBlackSpeed10(ProcPtr parent);
void FadeInBlackSpeed20(ProcPtr);
void FadeInBlackSpeed40(ProcPtr);
void sub_8013FEC(ProcPtr parent);
void sub_8014000(ProcPtr parent);
void sub_8014014(ProcPtr parent);
void sub_8014028(ProcPtr parent);
void sub_801403C(ProcPtr parent);
void sub_8014050(ProcPtr parent);
void WaitForFade(ProcPtr);
void sub_8014084(ProcPtr parent, void * func);
void StartFadeCore(int kind, int speed, ProcPtr parent, void * callback);
void FadeCoreEndEach(void);
void FadeCore_Init(struct FadeCoreProc * proc);
void FadeCore_Loop(struct FadeCoreProc * proc);
bool FadeCore_Tick(struct FadeCoreProc * proc);
void sub_8014170(void);
void sub_8014184(int a, int b);
void sub_8014194(void);
void sub_80141B0(void);
void sub_801420C(void);
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

void sub_8014560(u16 * tm, int x, int y, u16 tileref, int width, int height);
void sub_80146A0(u16 * tm, int x, int y, u16 tileref, int width, int height, u16 const * src, int arg_7);
void sub_80146A0(u16 * tm, int x, int y, u16 tileref, int width, int height, u16 const * src, int arg_7);
void sub_801474C(u16 * tm, int x, int y, u16 tileref, int width, int height, u8 const * src, int arg_7);
void sub_8014804(u16 * tm, int x, int y, u32 const * arg_3, u16 tileref);

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
void sub_8014904(u8 * out, int size);
void sub_801491C(u8 * out, int size, int value);
void sub_8014930(u16 * out, int size, int value);
void StartPartialGameLock(ProcPtr);
void PartialGameLock_OnLoop(struct Proc * proc);
void VramCopy(u8 const * src, u8 * dst, int size);
void VramCopyInRaw(u8 const * src, u8 * dst, int width, int height);
void PutTmLinear(u16 const * src, u16 * dst, int size, u16 tileref);
u16 * GetTmOffsetById(int bgid, int x, int y);
void sub_8014A78(void);
int Screen2Pan(int);
void PlaySeSpacial(int song, int x);
void PlaySeDelayed(int, int);
void PlaySeFunc(int song);
void _StartBgm(short song);
void _FadeBgmOut(short speed);
void sub_8014BE0(int palid);
void MemCpy(const void * src, void * dst, int size);
void PutDrawTextCentered(struct Text * text, int x, int y, char const * str, int width);
int sub_8014CA4(int, int, int, int);
// ??? sub_8014CC4(???);
void sub_8014DA8(void*);
void sub_8014E3C(void);
// ??? sub_8014E74(???);
// ??? sub_8014EA8(???);
void sub_8014EC4(int, int);
// ??? sub_8014EDC(???);
void sub_8014EF4(int);
// ??? sub_8014F10(???);
// ??? sub_8014F30(???);
void VecMulMat(int const * vec, int const * mat, int * ovec);
void MatMulMat(int const * lmat, int const * rmat, int * omat);
void MatIdent(int * mat);
void MatCopy(int const * src, int * dst);
void MatRotA(int * mat, short angle);
void MatRotB(int * mat, short angle);
void MatRotC(int * mat, short angle);
// ??? sub_801523C(???);
int VecDotVec(int const * lvec, int const * rvec);
void VecCrossVec(int const * lvec, int const * rvec, int * ovec);
int sub_801529C(int arg_0, int arg_1, int arg_2, int arg_3);
