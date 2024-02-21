#ifndef GUARD_COLORFADE_H
#define GUARD_COLORFADE_H

struct ColFadeProc
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4E);

    /* 4E */ u16 current;

    /* 50 */ STRUCT_PAD(0x50, 0x58);

    /* 58 */ int color;
    /* 5C */ int start;
    /* 60 */ int amount;
    /* 64 */ u16 speed;
};

// ??? ColFadeOut_Init(???);
// ??? ColFadeIn_Init_Null(???);
// ??? ColFadeOut_Loop(???);
// ??? ColFadeIn_Loop(???);
void NewColFadeOut(int, int, int, ProcPtr);
void NewColFadeIn(int, int, int, ProcPtr);

extern u16 gUnknown_02014EF4[];

// extern ??? ProcScr_ColFadeOut
// extern ??? ProcScr_ColFadeIn

#endif // GUARD_COLORFADE_H
