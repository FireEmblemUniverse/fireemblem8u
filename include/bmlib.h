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

int Interpolate(int method, int ymin, int ymax, int xcur, int xmax);

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

struct FadeCoreProc {
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ void (*on_end)(void);
    /* 50 */ STRUCT_PAD(0x50, 0x54);
    /* 54 */ int unk_54;
    /* 58 */ int unk_58;
    /* 5C */ int unk_5C;
};

CONST_DATA extern struct ProcCmd ProcScr_SpacialSeTest[];
CONST_DATA extern struct ProcCmd ProcScr_PalFade[];
CONST_DATA extern struct ProcCmd ProcScr_FadeToBlack[];
CONST_DATA extern struct ProcCmd ProcScr_FadeFromBlack[];
CONST_DATA extern struct ProcCmd ProcScr_FadeToWhite[];
CONST_DATA extern struct ProcCmd ProcScr_FadeFromWhite[];
CONST_DATA extern struct ProcCmd ProcScr_FadeCore[];
// extern ??? gUnknown_0859A0D4
// extern ??? gUnknown_0859A0EC
// extern ??? gUnknown_0859A0F0
// extern ??? gUnknown_0859A0F3
// extern ??? gUnknown_0859A0F4
// extern ??? gUnknown_0859A0F8
// extern ??? gUnknown_0859A100
// extern ??? gUnknown_0859A110
extern const u16 Pal_AllBlack[];
extern const u16 Pal_AllWhite[];
extern const u16 gUnknown_0859A160[];
extern const u16 gUnknown_0859A180[];
extern const u16 gUnknown_0859A1A0[];
extern const u16 gUnknown_0859A1C0[];

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
// ??? FadeToBlack_OnInit(???);
// ??? FadeToCommon_OnLoop(???);
// ??? FadeFromBlack_OnInit(???);
// ??? FadeFromCommon_OnLoop(???);
// ??? FadeToWhite_OnInit(???);
// ??? FadeFromWhite_OnInit(???);
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
void sub_8013F70(ProcPtr parent);
void sub_8013F84(ProcPtr parent);
void sub_8013F98(ProcPtr parent);
void sub_8013FB0(ProcPtr parent);
void sub_8013FC4(ProcPtr);
void sub_8013FD8(ProcPtr);
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
void sub_80140F4(struct FadeCoreProc * proc);
void sub_8014100(struct FadeCoreProc * proc);
bool sub_8014124(struct FadeCoreProc * proc);
void sub_8014170(void);
// ??? sub_8014184(???);
// ??? sub_8014194(???);
void sub_80141B0(void);
void sub_801420C(void);
void NewBlockingTimer(ProcPtr p, u32 maybeTime);
// ??? Timer6C_Countdown(???);
int sub_8014270(int number, char* buf);
int String_FromNumber(u32 num, char* str);
void PutStringCentered(u16* tilemap, int arg1, int arg2, const char* cstring);
void PutString(u16* tilemap, int color, const char* cstring);
