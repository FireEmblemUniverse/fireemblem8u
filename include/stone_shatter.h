#ifndef GUARD_STONE_SHATTER_H
#define GUARD_STONE_SHATTER_H

struct Unknown08592628
{
    /* 00 */ u8 unk_00;
    /* 04 */ void * unk_04;
    /* 08 */ u16 unk_08;
    /* 0A */ u8 unk_0a;
    /* 0B */ STRUCT_PAD(0x0b, 0x0c);
};

typedef s8 Unk58Func(ProcPtr);

struct StoneShatterProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ struct Unknown08592628 * unk_2c;
    /* 30 */ u16 unk_30;
    /* 32 */ u16 unk_32;
    /* 34 */ u8 unk_34;
    /* 35 */ u8 unk_35;
    /* 36 */ s8 unk_36;
    /* 37 */ u8 unk_37;
    /* 38 */ u8 unk_38;
    /* 39 */ u8 unk_39;
    /* 3A */ s8 unk_3a;
    /* 3B */ STRUCT_PAD(0x3b, 0x3c);
    /* 3C */ int unk_3c;
    /* 40 */ u32 unk_40;
    /* 44 */ int unk_44;
    /* 48 */ u32 unk_48;
    /* 4C */ int unk_4c;
    /* 50 */ int unk_50;
    /* 54 */ int unk_54;
    /* 58 */ Unk58Func * unk_58;
};

void StoneShatterAnim_Init(struct StoneShatterProc * proc);
void StoneShatterAnim_Loop(struct StoneShatterProc * proc);
void StoneShatterAnim_Finish(struct StoneShatterProc * proc);
s8 IsStoneShatterAnimActive(void);
void sub_80AE76C(void);
void EndStoneShatterAnim(void);
void sub_80AE7A4(u8);
void StartStoneShatterAnimCore(struct Unknown08592628 * input, int bg, int x, int y, int e, int f, int g, void * func, ProcPtr parent);

extern struct ProcCmd gProcScr_StoneShatterAnimFx[];

#endif // GUARD_STONE_SHATTER_H
