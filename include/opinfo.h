#ifndef GUARD_OP_INFO_H
#define GUARD_OP_INFO_H

enum ClassReelScrOpCode {
    CLASS_REEL_OP_0,
    CLASS_REEL_OP_1,
    CLASS_REEL_OP_2,
    CLASS_REEL_OP_3,
    CLASS_REEL_OP_4,
    CLASS_REEL_OP_5,
    CLASS_REEL_OP_6,
    CLASS_REEL_OP_7,
    CLASS_REEL_OP_8,
};

struct ClassReelAnimScr {
    u16 opCode : 8;
    u16 extra  : 8;
} __attribute__((packed));

struct ClassReelEnt {
    /* 00 */ u32 descTextId;

    /* 04 */ s8 paletteId;
    /* 05 */ u8 classId;
    /* 06 */ u8 unk_06;
    /* 07 */ u8 banimId;
    /* 08 */ u8 magicFx;
    /* 09 */ u8 unk_09;
    /* 0A */ u8 unk_0A;
    /* 0B */ u8 unk_0B;
    /* 0C */ u8 unk_0C;
    /* 0D */ u8 unk_0D; // terrain L
    /* 0E */ u8 unk_0E; // terrain R
    /* 0F */ u8 unk_0F;

    /* 10 */ struct ClassReelAnimScr* script;
};

struct OpInfoProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 unk_29;
    /* 2A */ u8 unk_2a;
    /* 2B */ u8 unk_2b;
    /* 2C */ u8 mode;
    /* 2D */ u8 unk_2d;
    /* 2E */ u8 unk_2e;
    /* 2F */ u8 unk_2f;
    /* 30 */ u16 unk_30;

    /* 32 */ s8 unk_32;
    /* 33 */ u8 classSet;
    /* 34 */ u8 index;

    /* 38 */ int unk_38;
    /* 3C */ int unk_3c;

    /* 40 */ u8 _pad[0x4C-0x40];

    /* 4C */ struct ClassReelEnt* classReelEnt;
};

struct OpInfoEnterProc {
    /* 00 */ PROC_HEADER;

    /* 2A */ u16 timer;
    /* 2C */ u16 unk_2c;
    /* 2E */ u8 classNameLength;

    /* 2F */ u8 _pad1[0x34-0x2F];

    /* 34 */ ProcPtr** letterProcsPtr;
    /* 38 */ ProcPtr iconProc;
    /* 3C */ ProcPtr parentProc;
    /* 40 */ struct ClassReelEnt* classReelEnt;
};

struct OpInfoViewProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 unk_29;
    /* 2A */ u16 timer;

    /* 2C */ u8 charIndex;

    /* 2E */ s16 unk_2e;

    /* 30 */ s16 unk_30;
};

struct OpInfoIconProc {
    /* 00 */ PROC_HEADER;

    /* 2A */ u16 timer;

    /* 2C */ u8 classId;
    /* 2D */ u8 numIcons;
    /* 2E */ u8 unk_2e;
};

struct OpInfoFlareProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 _pad[0x4C-0x29];

    /* 4C */ s16 unk_4c;
    /* 4E */ s16 unk_4e;
};

struct OpInfoBurstProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 _pad[0x4C-0x29];

    /* 4C */ s16 unk_4c;

    /* 4E */ u8 _pad2[0x64-0x4E];

    /* 64 */ s16 unk_64;
    /* 66 */ s16 unk_66;
    /* 68 */ s16 unk_68;
};

struct OpInfoClassDisplayProc {
    /* 00 */ PROC_HEADER;

    /* 2A */ u16 unk_2a;
    /* 2C */ u16 unk_2c;

    /* 30 */ ProcPtr unk_30;
    /* 34 */ struct ClassReelEnt* classReelEnt;
    /* 38 */ struct ClassReelAnimScr* script;
    /* 3C */ ProcPtr unk_3c;
    /* 40 */ u8 unk_40[6];
    /* 46 */ u8 unk_46;
};

struct OpInfoGaugeDrawProc {
    /* 00 */ PROC_HEADER;

    /* 2A */ u16 unk_2a;
    /* 2C */ u16 unk_2c;
    /* 30 */ struct OpInfoClassDisplayProc* unk_30;
    /* 34 */ u8 unk_34;
    /* 35 */ u8 unk_35;
};

extern struct AnimBuffer gOpInfoData;
extern struct AnimMagicFxBuffer gUnknown_0200A2D8;
extern struct BanimUnkStructComm gUnk_Opinfo_0201DB00;

// ??? ClassReel_Init(???);
// ??? ClassReel_ButtonPress_GoToTitle(???);
// ??? sub_80B2904(???);
// ??? sub_80B2988(???);
// ??? SetClassReelMode(???);
// ??? ClassReel_FadeOutBGM(???);
// ??? ClassReel_OnEnd(???);
void StartClassReel(u8 classSet, ProcPtr parent);
// ??? sub_80B2A14(???);
// ??? ClassIntro_Init(???);
// ??? sub_80B2DF0(???);
// ??? ClassIntro_LoopIn(???);
// ??? ClassIntro_LoopOut(???);
// ??? ClassIntro_DisableAllExceptBg1(???);
// ??? ClassIntro_OnEnd(???);
// ??? StartClassNameIntro(???);
// ??? ClassIntroLetter_Init(???);
// ??? ClassIntroLetter_LoopFadeIn(???);
// ??? ClassIntroLetter_LoopDisplay(???);
// ??? ClassIntroLetter_LoopFadeOut(???);
// ??? StartClassNameIntroLetter(???);
// ??? sub_80B307C(???);
// ??? ClassIntroIcon_Init(???);
// ??? sub_80B30FC(???);
// ??? ClassIntroIcon_LoopFadeIn(???);
// ??? ClassIntroIcon_LoopDisplay(???);
// ??? ClassIntroIcon_LoopFadeOut(???);
// ??? StartClassNameIntroIcon(???);
// ??? ClassIntroFlare_Init(???);
// ??? ClassIntroFlare_Loop(???);
// ??? ClassIntroBurst_Init(???);
// ??? PutClassIntroBurstSprites(???);
// ??? ClassIntroBurst_Loop(???);
// ??? sub_80B369C(???);
// ??? sub_80B36E0(???);
// ??? sub_80B3740(???);
// ??? ClassInfoDisplay_Init(???);
// ??? sub_80B3C14(???);
// ??? ClassInfoDisplay_LoopWindowIn(???);
// ??? ClassInfoDisplay_ExecScript(???);
// ??? ClassInfoDisplay_LoopScript(???);
// ??? ClassInfoDisplay_OnEnd(???);
// ??? StartClassAnimDisplay(???);
// ??? ClassStatsDisplay_Init(???);
// ??? ClassStatsDisplay_Loop(???);
// ??? StartClassStatsDisplay(???);
// ??? sub_80B40E4(???);
// ??? GetClassReelEntry(???);

#endif // GUARD_OP_INFO_H
