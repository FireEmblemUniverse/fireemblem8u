#ifndef GUARD_SERIF_H
#define GUARD_SERIF_H

#include "fontgrp.h"

struct Unknown0203E82C
{
    struct Font unk_00;
    struct Text unk_18[6];
    u32 unk_48_00 : 5;
    u32 unk_48_05 : 5;
    u32 unk_48_10 : 22;
    u16 unk_4c;
    u16 unk_4e;
} BITPACKED;

struct SerifProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ const char * unk_2c;
    /* 30 */ struct Font * unk_30;
    /* 34 */ struct Text * unk_34[6];
    /* 4C */ int * unk_4c; // Vram?
    /* 50 */ u16 unk_50; // pal ID?
    /* 52 */ s8 unk_52; // display speed
    /* 53 */ s8 unk_53; // number of visible characters?
    /* 54 */ s8 unk_54; // current text index
    /* 55 */ s8 unk_55; // pause timer
    /* 56 */ u8 unk_56; // blend something
    /* 57 */ u8 unk_57; // x
    /* 58 */ u8 unk_58; // y
    /* 59 */ u8 unk_59; // text width (num chars)
    /* 5A */ u8 unk_5a; // text height (num lines)
    /* 5B */ s8 unk_5b; // box width?
    /* 5C */ s8 unk_5c; // box height?
    /* 5D */ s8 unk_5d; // ? pad?
    /* 5E */ u8 unk_5e; // color? whether togglered is active
    /* 5F */ u8 unk_5f;
};

struct ProcA01E64
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

void sub_808E9D8(int flags);
void sub_808E9F0(int flag);
void sub_808EA1C(int flag);
u32 sub_808EA3C(void);
void sub_808EA48(u16 a, u16 b);
u16 sub_808EA68(void);
void sub_808EA74(u16 a, u16 b);
u16 sub_808EA8C(void);
void sub_808EA98(void);
void sub_808EB0C(struct SerifProc * proc);
void sub_808EBD4(struct SerifProc * proc);
void sub_808EF64(struct SerifProc * proc);
void sub_808EF6C(struct SerifProc * proc);
void sub_808EFA8(struct SerifProc * proc);
void sub_808F008(struct SerifProc * proc);
void sub_808F04C(struct SerifProc * proc);
void sub_808F084(struct SerifProc * proc);
void sub_808F0C4(struct SerifProc * proc);
void sub_808F0EC(struct SerifProc * proc);
void sub_808F128(int x, int y, int widthMaybe, int heightMaybe, int stringId, void * vram, int pal, ProcPtr parent);
void sub_808F270(void);
s8 SomeTalkProcExists(void);
void sub_808F2A0(void);
void sub_808F2BC(struct SerifProc * proc);
void sub_808F30C(struct SerifProc * proc);
void sub_808F358(const char * str, u8 * wOut, u8 * hOut);
void sub_808F3D8(struct SerifProc * proc);
void sub_808F428(const char * str, int * wOut, int * hOut);
s8 sub_808F5A0(const char * str);
void sub_808F5C8(struct SerifProc * proc);
s8 sub_808F824(int textCode);
void sub_808F8B4(struct ProcA01E64 * proc);
void sub_808FEA4(int * src, int x, int y);
void sub_808FF10(struct ProcA01E64 * proc);
void sub_808FF18(struct ProcA01E64 * proc);
void sub_808FF9C(struct ProcA01E64 * proc);
void sub_808FFC4(struct SerifProc * parent);
void sub_808FFE8(void);
s8 sub_808FFFC(void);
void sub_8090014(struct YesNoChoiceProc * proc);
void sub_80900EC(int * choiceTextIds, struct Text * th, int x, int y, int color, int defaultChoice, ProcPtr parent);

#endif  // GUARD_SERIF_H
