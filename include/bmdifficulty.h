#ifndef GUARD_BMDIFFICULTY_H
#define GUARD_BMDIFFICULTY_H

#include "global.h"
#include "fontgrp.h"
#include "bmunit.h"

#define BGPAL_BMDIFFICULTY_UNK_0 0
#define OBPAL_BMDIFFICULTY_UNK_5 5

struct Dungeon {
    /* 00 */ u32 expEarned:16;

    /* 02 */ u32 unitsUsed:8;

    /* 03 */ u32 turnCount:9;
    /* 04 */ u32 mapTime:18;

    /* 06 */ u32 enemiesDefeated:16;

    /* 08 */ u32 clearCount:7;
    /* 09 */ u32 postgameEnemiesDefeated:10;
    /* 0A */ u32 postgameClearCount:4;
    /* 0B */ u32 unk_0B_0:4; // ??
    /* 0B */ u32 unk_0B_4:4; // ??
};

struct Struct030017A0 {
    /* 00 */ struct Dungeon current;
    /* 0C */ struct Dungeon dungeon[2];
    /* 24 */ u8 type; // tower = 0, ruins = 1
};

extern struct Struct030017A0 gDungeonState;

struct Struct020038C8 {
    struct Text text[5][8];
};

extern struct Struct020038C8 gBmdifficulty_3[2];

enum {
    DUNGEONRECORD_LABEL_MONSTERS,
    DUNGEONRECORD_LABEL_EXP,
    DUNGEONRECORD_LABEL_UNITS,
    DUNGEONRECORD_LABEL_TURNS,
    DUNGEONRECORD_LABEL_TIME,
};

struct BMDifficultyProc {
    PROC_HEADER;

    /* 2C */ int labelIndex;
    /* 30 */ int unk_30;
    /* 34 */ int unk_34;
    /* 38 */ int unk_38;
    /* 3C */ int unk_3c;
};

extern int gBmdifficulty_2;

struct Struct080D7FD0 {
    s8 x;
    s8 y;
    u16 _pad;
    u8 numDigits;
};

struct Outer080D7FD0 {
    struct Struct080D7FD0 current[4];
    s8 x;
    s8 y;
    struct Struct080D7FD0 record[4];
    s8 x2;
    s8 y2;
};
extern const struct Outer080D7FD0 gBmdifficulty_6;

int GetCurrentPromotedLevelBonus(void);
s8 CanUnitSeize(struct Unit * unit);
void DungeonRecordUi_InitText(void);
void InitDungeon(u8 type);
void UnlockPostgameAllyByEnemyCount(void);
void UnlockPostgameAllyByClearCount(void);
void StartRetreatProcessing(void);
s8 PrepScreenProc_AddPostgameUnits(ProcPtr proc);
s8 TryAddPostgameUnit(ProcPtr, const struct UnitDefinition*);
void SaveDungeonState(struct Dungeon* savedDungeon);
void LoadDungeonState(struct Dungeon* savedDungeon);
void SaveDungeonRecords(struct Dungeon* savedDungeon);
void LoadDungeonRecords(struct Dungeon* savedDungeon);
int UpdateDungeonMapTime(struct Dungeon* dungeon);
void UpdateDungeonStats(struct Dungeon*);
void UpdateDungeonRecordStats(void);
void UpdateDungeonEnemiesDefeated(void);
void StartDungeonRecordProcFromMenu(ProcPtr proc);
void RecordDisplayAfterTowerCleared(ProcPtr proc);
void PushGlobalTimer(void);
void PopGlobalTimer(void);
void DungeonRecordUi_StartBgm(void);
void SetupDungeonRecordUi(ProcPtr proc);
void DrawDungeonRecordUiLabels(struct Text * th);
struct Text * DrawNumberText(struct Text * th, u16 number, u8 places, s8 x, s8 y, u8 colorId);
struct Text * DrawNumberText_WithReset(struct Text * th, u16 number, u8 numTiles, s8 x, s8 y, u8 colorId);
void DungeonRecordUi_ClearTexts(struct Text * th, u8 count);
struct Text * DrawTimeText(struct Text* th, int time, s8 xBase, s8 yBase, u8 colorId);
struct Text * DrawTimeText_WithReset(struct Text* th, int time, s8 xBase, s8 yBase, u8 colorId, s8 drawPunctuation);
void DrawDungeonRecordUiText(ProcPtr proc);
void DungeonRecordUi_UpdateRunningTime(void);
void DungeonRecordUi_KeyListenerUpdatesTime(ProcPtr proc);
void DungeonRecordUi_KeyListener(ProcPtr proc);
void EndDungeonRecordUi(void);
void DungeonRecordUi_CopyDigitsToObjVram(struct Text * th);
void DungeonRecordUi_UpdateValueAnim_Init(struct BMDifficultyProc* proc);
void DungeonRecordUi_UpdateValueAnim_Loop(struct BMDifficultyProc* proc);
struct BMDifficultyProc * DungeonRecordUi_SpawnUpdateValueProc(int label, int value, ProcPtr parent);
u32 GetCurrentDungeonValueByUiLabel(u32 label);
u32 GetRecordDungeonValueByUiLabel(u32 label);
s8 DungeonRecordUi_IsNewRecordForLabel(u32 label);
void DungeonRecordUi_ClearCountAnim_Init(struct BMDifficultyProc* proc);
void DungeonRecordUi_ClearCountClearText(ProcPtr proc);
void DungeonRecordUi_ClearCountAnim_Loop(struct BMDifficultyProc* proc);
void DungeonRecordUi_EnemiesDefeatedTally_Init(struct BMDifficultyProc* proc);
void DungeonRecordUi_UpdateEnemiesDefeatedCount(struct BMDifficultyProc* proc);
void DungeonRecordUi_StopTallySound(struct BMDifficultyProc* proc);
void DungeonRecordUi_SetLabelToExp(struct BMDifficultyProc* proc);
void DungeonRecordUi_UpdateLabelIfNewRecord(struct BMDifficultyProc* proc);
void DungeonRecordUi_GotoNextLabel(struct BMDifficultyProc* proc);

extern struct Struct02003BE8 gBmdifficultyEwram_1;
extern u16 gBmdifficulty_5[];
extern int gBmdifficultyEwram_0[];
extern u16 gBmdifficulty_0[];
extern struct Font gBmdifficulty_1;
extern struct Text gBmdifficulty_4[8];

extern struct ProcCmd CONST_DATA sProcScr_DisplayDungeonRecord_FromMenu[];
extern struct ProcCmd CONST_DATA sProcScr_DisplayDungeonRecord_AfterDungeonClear[];
extern const u16 CONST_DATA obj_0[];
extern u16 CONST_DATA gBmdifficulty_7[];
extern int CONST_DATA gBmdifficulty_8[];
extern struct ProcCmd CONST_DATA sProcScr_DungeonRecord_UpdateNewRecordValues[];

#endif  // GUARD_BMDIFFICULTY_H
