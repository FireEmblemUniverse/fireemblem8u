#ifndef GUARD_ENDINGDETAILS_H
#define GUARD_ENDINGDETAILS_H

enum {
    CHARACTER_ENDING_NONE   = 0,

    CHARACTER_ENDING_SOLO   = 1,
    CHARACTER_ENDING_PAIRED = 2,
};

enum {
    DEFEAT_DIED                 = 0,
    DEFEAT_WOUNDED_PARTEDWAYS   = 1, // unused in FE8
    DEFEAT_WOUNDED_REMAINED     = 2,
    // 3?
    DEFEAT_TYPE_4               = 4,
    DEFEAT_TYPE_5               = 5,
};

struct EndingTitleEnt {
    /* 00 */ u8 pid;
    /* 04 */ int titleTextId;
};

struct EndingDefeatEnt {
    /* 00 */ u8 pid;
    /* 01 */ u8 defeatType;
};

struct CharacterEndingEnt {
    /* 00 */ u8 type;
    /* 01 */ u8 pidA;
    /* 02 */ u8 pidB;
    /* 04 */ int textId;
};

struct CharacterEndingProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 _pad[0x2E - 0x29];
    /* 2E */ u16 unk_2e;
    /* 30 */ struct CharacterEndingEnt* unk_30;
    /* 34 */ struct CharacterEndingEnt* unk_34;
    /* 38 */ struct Unit* unitA;
    /* 3C */ struct Unit* unitB;
    /* 40 */ u32 unk_40[8]; // flags for characters who have already been shown in an ending
};

struct EndingBattleDisplayProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Unit* units[2];
    /* 34 */ int unk_34;
    /* 38 */ struct CharacterEndingEnt* pCharacterEnding;
    /* 3C */ u16 battleAmounts[2];
    /* 40 */ u16 winAmounts[2];
    /* 44 */ u16 lossAmounts[2];
};

struct EndingBattleTextProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ struct CharacterEndingEnt* pCharacterEnding;
    /* 30 */ struct Unit* unitA;
    /* 34 */ struct Unit* unitB;
    /* 38 */ u32 unk_38;
    /* 3C */ int pauseTimer;
    /* 40 */ int defaultPauseDelay;
    /* 44 */ const char* str;
    /* 48 */ struct Text* Text;
};

struct FinScreenProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 _pad[0x4c-0x29];
    /* 4C */ u16 unk_4c;
    /* 4E */ u8 _pad2[0x58-0x4e];
    /* 58 */ int unk_58;
};

struct EndingTurnRecordProc {
    /* 00 */ PROC_HEADER;

    /* 2C */ int unk_2c;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ u8 unk_38;
    /* 39 */ u8 unk_39;
    /* 3A */ u8 _pad[0x4c-0x3a];
    /* 4C */ s16 unk_4c;
};

struct UnkProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 _pad[0x40-0x29];
    /* 40 */ u8 unk_40[12]; // size unknown
    /* 4C */ u16 unk_4c[5];
};

extern char Pal_020007A0[];

// ??? PrepareUnitDefeatLocationString(???);
// ??? GetPidTitleTextId(???);
// ??? GetPidDefeatType(???);
// ??? GetPidDefeatedEndingString(???);
// ??? SetupCharacterEndingGfx(???);
// ??? sub_80B6810(???);
// ??? sub_80B689C(???);
// ??? sub_80B6920(???);
// ??? CharacterEnding_Init(???);
// ??? sub_80B69D4(???);
// ??? sub_80B6A10(???);
// ??? GetUnitASupporterPid(???);
// ??? DoesUnitHavePairedEnding(???);
// ??? LoadNextCharacterEnding(???);
// ??? CharacterEnding_StartBattleDisplay(???);
// ??? CharacterEnding_StartBattleDisplayText(???);
// ??? CharacterEnding_End(???);
// ??? CharacterEnding_Unused_80B6C74(???);
void StartCharacterEndings(ProcPtr parent);
// ??? sub_80B6CA8(???);
// ??? SoloEndingBattleDisp_Init(???);
// ??? SoloEndingBattleDisp_Loop(???);
// ??? StartSoloEndingBattleDisplay(???);
// ??? sub_80B6F34(???);
// ??? sub_80B71DC(???);
// ??? sub_80B723C(???);
// ??? sub_80B7274(???);
// ??? StartPairedEndingBattleDisplay(???);
// ??? EndingBattleInitText(???);
// ??? EndingBattleText_Loop(???);
// ??? StartEndingBattleText(???);
// ??? EndEndingBattleText(???);
// ??? SetupFinScreenGfx(???);
// ??? Fin_Init(???);
// ??? Fin_Loop_KeyListener(???);
// ??? sub_80B7500(???);
// ??? sub_80B7540(???);
// ??? Fin_End(???);
void StartFinScreen(ProcPtr);
// ??? sub_80B75AC(???);
// ??? sub_80B7614(???);
// ??? sub_80B7648(???);
// ??? sub_80B770C(???);
// ??? sub_80B7800(???);
// ??? sub_80B7B30(???);
// ??? sub_80B7BD8(???);
// ??? sub_80B8014(???);
// ??? sub_80B8168(???);
void StartEndingTurnRecordScreen(ProcPtr parent);

#endif // GUARD_ENDINGDETAILS_H
