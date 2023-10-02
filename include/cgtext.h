#ifndef GUARD_CG_TEXT_H
#define GUARD_CG_TEXT_H

#include "fontgrp.h"

struct CgTextSt
{
    /* 00 */ struct Font font;
    /* 18 */ struct Text texts[6];
    /* 48 */ u32 unk_48_00 : 5;
    /* 48 */ u32 unk_48_05 : 5;
    /* 49 */ u32 flags : 22;
    /* 4C */ u16 bldCnt;
    /* 4E */ u16 bldAlpha;
} BITPACKED;

enum
{
    CG_TEXT_FLAG_0 = (1 << 0),
    CG_TEXT_FLAG_1 = (1 << 1),
    CG_TEXT_FLAG_2 = (1 << 2), // Blocks parent proc after end of string [X]
    CG_TEXT_FLAG_3 = (1 << 3), // Fill text area with 0 after [2NL]
    CG_TEXT_FLAG_4 = (1 << 4), // Disable sound?
    CG_TEXT_FLAG_5 = (1 << 5), // Instantly show all text
    CG_TEXT_FLAG_6 = (1 << 6), // Prevent skipping?
    CG_TEXT_FLAG_7 = (1 << 7),
    CG_TEXT_FLAG_8 = (1 << 8),
    CG_TEXT_FLAG_9 = (1 << 9), // If set, use "Ask/Exit" when using [Yes] or [No] ("Yes/No" if unset)
    CG_TEXT_FLAG_10 = (1 << 10),
    // (1 << 11) // used for text speed?
    // (1 << 12) // used for text speed?
    // (1 << 13) // used for text speed?
    // (1 << 14) // used for BGs
    // (1 << 15) // used for BGs
    CG_TEXT_FLAG_16 = (1 << 16), // Set when using [SetName]
    CG_TEXT_FLAG_17 = (1 << 17), // Face fade out
    CG_TEXT_FLAG_18 = (1 << 18), // Talk bubble tail "kind"; 5 if set, 2 or 3 if unset (depending on flag 1)
    CG_TEXT_FLAG_19 = (1 << 19), // Run HBlank
    // (1 << 20)
    // (1 << 21)
};

#define CG_TEXT_BG(bg) (((bg) & 3) << 14)
#define CG_TEXT_BG_MASK CG_TEXT_BG(-1)
#define GetCgTextBg(flags) (((flags) & CG_TEXT_BG_MASK) >> 14)

struct CgTextMainProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ const char * str;
    /* 30 */ struct Font * pFont;
    /* 34 */ struct Text * pTexts[6];
    /* 4C */ u32 * vram;
    /* 50 */ u16 palId;
    /* 52 */ s8 displaySpeed;
    /* 53 */ s8 numCharsVisible;
    /* 54 */ s8 thIndex; // Index into array of Text structs
    /* 55 */ s8 pauseTimer;
    /* 56 */ u8 blendAmt;
    /* 57 */ u8 x;
    /* 58 */ u8 y;
    /* 59 */ u8 textWidth; // Character width
    /* 5A */ u8 textHeight; // Number of lines
    /* 5B */ s8 boxWidth;
    /* 5C */ s8 boxHeight;
    /* 5D */ s8 unk_5d; // ? pad?
    /* 5E */ u8 unk_5e; // Whether [ToggleRed] is active
    /* 5F */ u8 unk_5f;
};

struct CgTextInterpreterProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);

    /* 4C */ s16 unk_4c;
};

struct YesNoChoiceProc
{
    /* 00 */ PROC_HEADER;
    /* 2A */ s16 currentChoice;
    /* 2C */ s16 x;
    /* 2E */ s16 y;
};

void SetCgTextFlags(int flags);
void SetCgTextFlag(int flag);
void ClearCgTextFlag(int flag);
u32 GetCgTextFlags(void);
void SetCgTextBlendControl(u16 a, u16 b);
u16 GetCgTextBlendControl(void);
void SetCgTextBlendAlpha(u16 a, u16 b);
u16 GetCgTextBlendAlpha(void);
void CgText_OnHBlank(void);
void sub_808EB0C(struct CgTextMainProc * proc);
void CgText_Init(struct CgTextMainProc * proc);
void CgText_InitBlendAmt(struct CgTextMainProc * proc);
void CgText_LoopFadeIn(struct CgTextMainProc * proc);
void CgText_InitFadeOut(struct CgTextMainProc * proc);
void CgText_LoopFadeOut(struct CgTextMainProc * proc);
void CgText_808F04C(struct CgTextMainProc * proc);
void CgText_808F084(struct CgTextMainProc * proc);
void CgText_OnEnd(struct CgTextMainProc * proc);
void CgText_808F0EC(struct CgTextMainProc * proc);
void StartCgText(int x, int y, int widthMaybe, int heightMaybe, int stringId, void * vram, int pal, ProcPtr parent);
void EndCgText(void);
s8 CgTextExists(void);
void sub_808F2A0(void);
void CgText_ClearSpriteText(struct CgTextMainProc * proc);
void sub_808F30C(struct CgTextMainProc * proc);
void GetCgTextDimensions(const char * str, u8 * wOut, u8 * hOut);
void sub_808F3D8(struct CgTextMainProc * proc);
void GetCgTextBoxDimensions(const char * str, int * wOut, int * hOut);
s8 DoesStringContainTact(const char * str);
void sub_808F5C8(struct CgTextMainProc * proc);
s8 sub_808F824(int textCode);
void CgTextInterpreter_Loop_Main(struct CgTextInterpreterProc * proc);
void sub_808FEA4(int * src, int x, int y);
void CgTextInterpreter_808FF10(struct CgTextInterpreterProc * proc);
void CgTextInterpreter_808FF18(struct CgTextInterpreterProc * proc);
void CgTextInterpreter_808FF9C(struct CgTextInterpreterProc * proc);
void RestartCgTextInterpreter(struct CgTextMainProc * parent);
void EndCgTextInterpreter(void);
s8 sub_808FFFC(void);
void YesNoChoice_Loop_KeyHandler(struct YesNoChoiceProc * proc);
void StartYesNoChoice(int * choiceTextIds, struct Text * th, int x, int y, int color, int defaultChoice, ProcPtr parent);

#endif // GUARD_CG_TEXT_H
