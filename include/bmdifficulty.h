#ifndef GUARD_BMDIFFICULTY_H
#define GUARD_BMDIFFICULTY_H

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

int GetCurrentPromotedLevelBonus(void);
s8 CanUnitSeize(struct Unit* unit);
// ??? DungeonRecordUi_InitText(???);
void InitDungeon(u8 type);
// ??? UnlockPostgameAllyByEnemyCount(???);
// ??? UnlockPostgameAllyByClearCount(???);
// ??? sub_8037D58(???);
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
// ??? sub_80381F4(???);
void PushGlobalTimer(void);
void PopGlobalTimer(void);
void sub_8038230(void);
void SetupDungeonRecordUi(ProcPtr proc);
// ??? DrawDungeonRecordUiLabels(???);
// ??? DrawNumberText(???);
// ??? DrawNumberText_WithReset(???);
// ??? sub_8038668(???);
// ??? DrawTimeText(???);
// ??? DrawTimeText_WithReset(???);
void DrawDungeonRecordUiText(ProcPtr proc);
// ??? DungeonRecordUi_UpdateRunningTime(???);
void DungeonRecordUi_KeyListenerUpdatesTime(ProcPtr proc);
void DungeonRecordUi_KeyListener(ProcPtr proc);
void EndDungeonRecordUi(void);
// ??? sub_8038F78(???);
// ??? sub_803901C(???);
// ??? sub_80390D4(???);
// ??? DungeonRecordUi_SpawnUpdateValueProc(???);
// ??? GetCurrentDungeonValueByUiLabel(???);
// ??? GetRecordDungeonValueByUiLabel(???);
// ??? DungeonRecordUi_IsNewRecordForLabel(???);
// ??? sub_803943C(???);
// ??? sub_803948C(???);
// ??? sub_80394A8(???);
// ??? sub_8039554(???);
// ??? DungeonRecordUi_UpdateEnemiesDefeatedCount(???);
// ??? sub_803963C(???);
// ??? sub_8039660(???);
// ??? sub_8039668(???);
// ??? DungeonRecordUi_GotoNextLabel(???);

#endif  // GUARD_BMDIFFICULTY_H
