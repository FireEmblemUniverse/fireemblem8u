#ifndef GUARD_ENDINGDETAILS_H
#define GUARD_ENDINGDETAILS_H

enum
{
    CHARACTER_ENDING_NONE   = 0,

    CHARACTER_ENDING_SOLO   = 1,
    CHARACTER_ENDING_PAIRED = 2,
};

enum
{
    DEFEAT_DIED                 = 0,
    DEFEAT_WOUNDED_PARTEDWAYS   = 1, // unused in FE8
    DEFEAT_WOUNDED_REMAINED     = 2,
    // 3?
    DEFEAT_TYPE_4               = 4,
    DEFEAT_TYPE_5               = 5,
};

#define DEFEAT_SKIRMISH_FLAG_BIT 15
#define DEFEAT_SKIRMISH_MASK (1 << DEFEAT_SKIRMISH_FLAG_BIT)

#define SetDefeatDetails(defeatLocation, defeatSkirmish) ((defeatLocation) | ((defeatSkirmish) << DEFEAT_SKIRMISH_FLAG_BIT))
#define GetDefeatLocation(defeatDetails) ((defeatDetails) & ~DEFEAT_SKIRMISH_MASK)
#define IsSkirmishDefeat(defeatDetails) ((defeatDetails) & DEFEAT_SKIRMISH_MASK)

struct EndingTitleEnt
{
    /* 00 */ u8 pid;
    /* 04 */ int titleTextId;
};

struct EndingDefeatEnt
{
    /* 00 */ u8 pid;
    /* 01 */ u8 defeatType;
};

struct CharacterEndingEnt
{
    /* 00 */ u8 type;
    /* 01 */ u8 pidA;
    /* 02 */ u8 pidB;
    /* 04 */ int textId;
};

struct CharacterEndingProc
{
    /* 00 */ PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x2E);
    /* 2E */ u16 unk_2e; // unused? Initialized and unreferenced after
    /* 30 */ struct CharacterEndingEnt * pCharacterEnding;
    /* 34 */ struct CharacterEndingEnt * pCharacterEndingBkp;
    /* 38 */ struct Unit * unitA;
    /* 3C */ struct Unit * unitB;
    /* 40 */ u32 pidShownFlags[8]; // flags for characters who have already been shown in an ending
};

struct EndingBattleDisplayProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ struct Unit * units[2];
    /* 34 */ int timer;
    /* 38 */ struct CharacterEndingEnt * pCharacterEnding;
    /* 3C */ u16 battleAmounts[2];
    /* 40 */ u16 winAmounts[2];
    /* 44 */ u16 lossAmounts[2];
};

struct EndingBattleTextProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ struct CharacterEndingEnt * pCharacterEnding;
    /* 30 */ struct Unit * unitA;
    /* 34 */ struct Unit * unitB;
    /* 38 */ STRUCT_PAD(0x38, 0x3C);
    /* 3C */ int pauseTimer;
    /* 40 */ int defaultPauseDelay;
    /* 44 */ const char * str;
    /* 48 */ struct Text * text;
};

struct FinScreenProc
{
    /* 00 */ PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ u16 blendTimer;
    /* 4E */ STRUCT_PAD(0x4E, 0x58);
    /* 58 */ int timer;
};

struct EndingTurnRecordProc
{
    /* 00 */ PROC_HEADER;

    /* 2C */ int chapterId;
    /* 30 */ int yPos;
    /* 34 */ int yScrollAmt;
    /* 38 */ u8 chapterStatsIdx;
    /* 39 */ u8 displayId;
    /* 3A */ STRUCT_PAD(0x3A, 0x4C);
    /* 4C */ s16 unk_4c;
};

struct UnkProc
{
    /* 00 */ PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x40);
    /* 40 */ u8 unk_40[12]; // size unknown
    /* 4C */ u16 unk_4c[5];
};

extern u16 gEndingDetailBuf[0x3D0];
extern u16 gEndingTmScratchA[];
extern u16 gEndingTmScratchB[];
extern u16 gEndingTmScratchC[];
extern u16 gEndingTmScratchD[];

extern char * CONST_DATA gpDefeatedEndingLocString;

// ??? PrepareUnitDefeatLocationString(???);
// ??? GetPidTitleTextId(???);
// ??? GetPidDefeatType(???);
// ??? GetPidDefeatedEndingString(???);
// ??? SetupCharacterEndingGfx(???);
// ??? sub_80B6810(???);
// ??? sub_80B689C(???);
// ??? InitCharacterEndingText(???);
// ??? CharacterEnding_Init(???);
// ??? CharacterEnding_80B69D4(???);
// ??? GetUnitForCharacterEnding(???);
// ??? GetUnitASupporterPid(???);
// ??? DoesUnitHavePairedEnding(???);
// ??? LoadNextCharacterEnding(???);
// ??? CharacterEnding_StartBattleDisplay(???);
// ??? CharacterEnding_StartBattleDisplayText(???);
// ??? CharacterEnding_End(???);
// ??? CharacterEnding_Unused_80B6C74(???);
void StartCharacterEndings(ProcPtr parent);
// ??? CharacterEnding_LoadUnitBattleStats(???);
// ??? SoloEndingBattleDisp_Init(???);
// ??? SoloEndingBattleDisp_Loop(???);
void StartSoloEndingBattleDisplay(struct CharacterEndingEnt *, struct Unit *, struct CharacterEndingProc *);
// ??? PairedEndingBattleDisp_Init(???);
// ??? PairedEndingBattleDisp_Loop_SlideIn(???);
// ??? PairedEndingBattleDisp_InitBlend(???);
// ??? PairedEndingBattleDisp_Loop_Blend(???);
void StartPairedEndingBattleDisplay(struct CharacterEndingEnt *, struct Unit *, struct Unit *, struct CharacterEndingProc *);
// ??? EndingBattleInitText(???);
// ??? EndingBattleText_Loop(???);
void StartEndingBattleText(struct CharacterEndingEnt *, struct Unit *, struct Unit *, struct CharacterEndingProc *);
void EndEndingBattleText(void);
// ??? SetupFinScreenGfx(???);
// ??? Fin_Init(???);
// ??? Fin_Loop_KeyListener(???);
// ??? sub_80B7500(???);
// ??? sub_80B7540(???);
// ??? Fin_End(???);
void StartFinScreen(ProcPtr);
// ??? sub_80B75AC(???);
// ??? sub_80B7614(???);
// ??? TurnRecord_Init(???);
// ??? TurnRecord_SetupText(???);
// ??? HandleTurnRecordText(???);
// ??? TurnRecord_Loop_Main(???);
// ??? sub_80B7BD8(???);
// ??? TurnRecord_SetupGfx(???);
// ??? TurnRecord_End(???);
void StartEndingTurnRecordScreen(ProcPtr parent);

#endif // GUARD_ENDINGDETAILS_H
