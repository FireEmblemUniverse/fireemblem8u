#ifndef BMSAVE_H
#define BMSAVE_H

enum save_chunk_index {
    SAVE_ID_GAME0,
    SAVE_ID_GAME1,
    SAVE_ID_GAME2,
    SAVE_ID_SUSPEND,
    SAVE_ID_SUSPEND_ALT,
    SAVE_ID_5,
    SAVE_ID_6,
    SAVE_ID_MAX
};

enum {
    SAVEBLOCK_KIND_GAME,
    SAVEBLOCK_KIND_SUSPEND,
    SAVEBLOCK_KIND_2,
    SAVEBLOCK_KIND_3,
    SAVEBLOCK_KIND_INVALID = -1
};

enum bmsave_magics_fe8 {
    SAVEMAGIC16      = 0x200A,
    SAVEMAGIC32      = 0x40624,
    SAVEMAGIC32_UNK5 = 0x20112,
    SAVEMAGIC32_UNK6 = 0x20223,
};

#define MAX_SAVED_GAME_CLEARS 12

struct GlobalSaveInfo {
    /* 00 */ char name[0x8];
    /* 08 */ u32 magic32;
    /* 0C */ u16 magic16;

    /* 0E */ u8 completed  : 1;
             u8 flag0E_1 : 1;
             u8 Eirk_mode_easy : 1;
             u8 Eirk_mode_norm : 1;
             u8 Eirk_mode_hard : 1;
             u8 Ephy_mode_easy : 1;
             u8 Ephy_mode_norm : 1;
             u8 Ephy_mode_hard : 1;

    /* 0F */ u8 game_end : 1;
             u8 unk0F_1 : 7;
    /* 10 */ u16 unk10;
    /* 10 */ u16 unk12;

    /* 14 */ u8 cleared_playthroughs[MAX_SAVED_GAME_CLEARS];
    /* 20 */ u8 SuppordRecord[0x40 - 0x20];
    /* 40 */ u8 charKnownFlags[0x60 - 0x40];

    /* 60 */ u16 checksum;
    /* 62 */ u8 last_game_save_id;
    /* 63 */ u8 last_suspend_slot;
};

#define GLOBALSIZEINFO_SIZE_FOR_CHECKSUM 0x50

struct SaveBlockInfo {
    /* 00 */ u32 magic32;
    /* 04 */ u16 magic16;
    /* 06 */ u8 kind;

    /* 07 */ s8 _pad_07;

    /* 08 */ u16 offset;
    /* 0A */ u16 size;
    /* 0C */ u32 checksum32;
};

struct SramHeader {
    struct GlobalSaveInfo meta;
    struct SaveBlockInfo chunks[0x7];
};

/* used in IsExtraBonusClaimEnabled */
struct bmsave_unkstruct0 {
    u8 unk[0x14];
};

struct GameRankSaveData {
    /* 00 */ u32 valid : 0x01;
             u32 unk00_01 : 0x03;
             u32 tacticsRank : 0x03;
             u32 survivalRank : 0x03;
             u32 fundsRank : 0x03;
             u32 expRank : 0x03;
             u32 combatRank : 0x03;

             u32 chapter_mode : 0x02;
             u32 chapter_stat : 0x01;
             u32 unk00_16 : 0x01;
             u32 unk00_17 : 0x08;
             u32 cuteguy : 0x08;

             u32 hours : 0x0A;
             u32 minutes : 0x06;
             u32 seconds : 0x06;
             u32 gold : 0x18;

    /* 08 */ u32 unk08_15 : 0x06;
             u32 unk08_1F : 0x01;

    /* 0C */ char tactician_name[0xB];

    /* 17 */ u8 luckydog;
};

struct GameRankSaveDataPacks {
    struct GameRankSaveData pack[0x6];
    u16 magic0;
    u16 unk92;
};

struct bmsave_unkstruct1 {
    u32 unk[0x8];
    u16 magic1;
    u16 magic2;
};

struct bmsave_unkstruct2 {
    u32 unk[0x4];
    u16 magic1;
    u16 magic2;
};

struct GameSavePackedUnit {       /* Save Data */
    /* 00 */ u32 jid      : 7;
             u32 level      : 5;
             u32 exp        : 7;
             u32 xPos       : 6;
             u32 yPos       : 6;

             u32 flag       : 13;

             u32 max_hp     : 6;
             u32 pow        : 5;
             u32 skl        : 5;
             u32 spd        : 5;
             u32 def        : 5;
             u32 res        : 5;
             u32 lck        : 5;
             u32 con_bonus  : 5;
             u32 mov_bonus  : 5;
             u32 item1      : 14;
             u32 item2      : 14;
             u32 item3      : 14;
             u32 item4      : 14;
             u32 item5      : 14;
    
    /* 14 */ u8 pid;
    /* 15 */ u8 wpnRanks[0x8];
    /* 1D */ u8 supports[UNIT_SUPPORT_MAX_COUNT];
    /* 24 */
};

enum packed_unit_state_bits {
    PACKED_US_DEAD       = 1 << 0,
    PACKED_US_UNDEPLOYED = 1 << 1,
    PACKED_US_SOLO_ANIM1 = 1 << 2,
    PACKED_US_SOLO_ANIM2 = 1 << 3,
    PACKED_US_METIS_TOME = 1 << 4,
    PACKED_US_B4         = 1 << 5,
    PACKED_US_B5         = 1 << 6,
    PACKED_US_NEW_FRIEND = 1 << 7,
};

struct SuspendSavePackedUnit {     /* Suspend Data */
    /* 00 */ u8 pid;
    /* 01 */ u8 jid;
    /* 02 */ u8 ai1;
    /* 03 */ u8 rescue;
    /* 04 */ u32 state;

    /* 08 */ u16 item1;
    /* 0A */ u16 item2;
    /* 0C */ u16 item3;
    
    /* 0E */ s8 maxHP;
    /* 0F */ s8 curHP;
    /* 10 */ u8 exp;
    /* 11 */ u8 aiFlags;
    /* 12 */ u8 ranks[8];
    /* 1A */ u8 supports[UNIT_SUPPORT_MAX_COUNT];
    /* 21 */ u8 ai1data;
    /* 22 */ u8 ai2;
    /* 23 */ u8 ai2data;

    /* 24 */ u32 level      : 5;
             u32 xPos       : 6;
             u32 yPos       : 6;
             u32 pow        : 5;
             u32 skl        : 5;
             u32 spd        : 5;
    /* 28 */ u32 def        : 5;
             u32 res        : 5;
             u32 lck        : 5;
             u32 conBonus   : 5;

             u32 statusIndex_l      : 3;
             u32 statusDuration     : 3;
             u32 torchDuration      : 3;
             u32 barrierDuration    : 3;
    
    /* 2C */ u32 movBonus   : 4;
             u32 item4      : 14;
             u32 item5      : 14;
    
    /* 30 */ u8 ballistaIndex;
    
    /* 31 */ u8 _u46;
    /* 32 */ u16 ai3And4;
    /* 34 */
};

extern EWRAM_DATA bool gBoolSramWorking;
extern CONST_DATA u8 * gSram;

void SramInit(void);
bool IsSramWorking(void);
void WipeSram(void);
u16 Checksum16(void const * data, int size);
bool ReadGlobalSaveInfo(struct GlobalSaveInfo *buf);
void WriteGlobalSaveInfo(struct GlobalSaveInfo *header);
void WriteGlobalSaveInfoNoChecksum(struct GlobalSaveInfo *header);
void InitGlobalSaveInfodata(void);
void EraseBonusContentData(void);
void *SramOffsetToAddr(u16 off);
u16 SramAddrToOffset(void * addr);
bool ReadSaveBlockInfo(struct SaveBlockInfo *buf, int index);
void WriteSaveBlockInfo(struct SaveBlockInfo *buf, int index);
void EraseSaveBlockInfo(int index);
void *GetSaveWriteAddr(int index);
void *GetSaveReadAddr(int index);
void WriteChapterFlags(void *sram_dest);
void WritePermanentFlags(void *sram_dest);
void ReadChapterFlags(void *ewram_dest);
void ReadPermanentFlags(void *ewram_dest);
void ReadPermanentFlags_ret(void *sram_src, void *ewram_dest);
void WriteSupplyItems(void *sram_dest);
void ReadSupplyItems(const void *sram_src);
bool null_true(void);
bool IsExtraLinkArenaEnabled(int);
bool IsExtraSoundRoomEnabled(void);
bool IsExtraSupportViewerEnabled(void);
// ??? sub_80A3348(???);
// ??? sub_80A33C4(???);
bool IsExtraFreeMapEnabled(void);
bool IsExtraBonusClaimEnabled(void);
int sub_80A3468(const int val0, const int val1);
int sub_80A34CC(void);
int sub_80A3500(struct GlobalSaveInfo *buf);
int sub_80A3544(void);
int sub_80A3584(int param0, int param1, struct GlobalSaveInfo *buf);
void sub_80A35EC(int unitId, u8* data, struct GlobalSaveInfo* buf);
bool sub_80A3724(int unitA, int unitB, int supportRank);
void SGM_SetCharacterKnown(s32 charId, struct GlobalSaveInfo* buf);
bool GGM_IsCharacterKnown(int index, struct GlobalSaveInfo *buf);
int GGM_IsAnyCharacterKnown(struct GlobalSaveInfo *buf);
void sub_80A3868(void);
void __malloc_unlock_3(void);
int IsGamePlayedThrough(void);
bool LoadAndVerfyRankData(void *buf);
bool LoadBonusContentData(void *buf);
void SaveBonusContentData(void *buf);
void SaveRankings(void *buf);
void sub_80A39B4(void);
int GetNextChapterMode(void);
int sub_80A39E4(void *buf, int chapter_mode, int difficulty);
void SaveNewRankData(void *buf, int chapter_mode, int difficulty);
u8 JudgeGameRankSaveData(struct GameRankSaveData *old, struct GameRankSaveData *new);
void GenerateGameRankSaveData(struct GameRankSaveData *buf, int chapter_mode, int difficulty);
void SaveEndgameRankings(void);
void sub_80A3E28(void);
u8 sub_80A3E4C(void *buf);
void sub_80A3EA4(void *);
int sub_80A3ED0(void *buf, int val);
void sub_80A3F84(void);
u8 sub_80A3FA8(void *buf);
void sub_80A4000(struct bmsave_unkstruct2 *buf);
int sub_80A402C(void *buf, int val);
int sub_80A402C(void *buf, int val);
void sub_80A40A8(void);
void ClearPidChStatsSaveData(void *sram_dest);
void ClearPidStats_ret(void);
void ClearPidStats(void);
void ReadPidStats(void *sram_src);
void ReadChapterStats(const void *sram_src);
void WritePidStats(void *sram_dest);
void WriteChapterStats(void *sram_dest);
struct ChapterStats *GetChapterStats(int index);
bool IsChapterStatsValid(struct ChapterStats *chapter_stats);
int GetNextChapterStatsSlot(void);
void sub_80A3F08(struct bmsave_unkstruct1 *buf, int val);
int GetCurCompleteChapters(void);
int GetNextChapterStatsEntry(void);
void RegisterChapterTimeAndTurnCount(struct PlaySt* chData);
int GetGameTotalTime_unused(void);
int GetGameTotalTurnCount(void);
bool IsChapterBelongCurGame(u32 ch_index);
int GetGameTotalTime(void);
int GetGameTotalTurnCount2(void);
void PidStatsAddBattleAmt(struct Unit* unit);
void PidStatsAddWinAmt(u8 pid);
void PidStatsRecordLoseData(u8 pid);
void PidStatsRecordDefeatInfo(u8 pid, u8 killerPid, int deathCause);
void PidStatsAddActAmt(u8 pid);
void PidStatsAddStatViewAmt(u8 pid);
void PidStatsAddDeployAmt(u8 pid);
void PidStatsAddSquaresMoved(u8 pid, int amount);
void PidStatsAddExpGained(u8 pid, int expGain);
void PidStatsSubFavval08(u8 pid);
void PidStatsSubFavval100(u8 pid);
int PidStatsGetTotalBattleAmt(void);
int PidStatsGetTotalWinAmt(void);
int PidStatsGetTotalLossAmt(void);
int PidStatsGetTotalLevel(void);
int PidStatsGetTotalExpGain(void);
int PidStatsGetExpGain(u8 pid);
int PidStatsGetFavval(u8 pid);
void PidStatsAddFavval(u8 pid, int);
void PidStatsRecordBattleRes(void);
bool IsPlaythroughIdUnique(int index);
int GetNewPlaythroughId(void);
int GetGlobalCompletionCntByInfo(struct GlobalSaveInfo *sec_head);
int GetGlobalCompletionCount(void);
bool RegisterCompletedPlaythrough(struct GlobalSaveInfo *sec_head, int index);
int GetCurerentGameMode(void);
void SavePlayThroughData(void);
void SetGameEndFlag(void);
void SetGameEndFlag(void);
struct UnitUsageStats* GetPidStats(u8 pid);
u32 GetBonusContentClaimFlags(void);
void SetBonusContentClaimFlags(u32 num);
void WriteBonusContentClaimFlags(void *sram_dest);
void ReadBonusContentClaimFlags(const void *sram_src);
void WriteLastGameSaveId(int num);
int ReadLastGameSaveId(void);
void InvalidateGameSave(int);
void CopyGameSave(int index_src, int index_dest);
void WriteNewGameSave(int index, int isDifficult, int mode, int isTutorial);
void WriteGameSave(int slot);
void ReadGameSave(int slot);
bool IsSaveValid(int);
void ReadGameSavePlaySt(int, struct PlaySt*);
u32 LoadSavedBonusClaimFlags(int slot);
void LoadSavedWMStuff(int slot, void *dest);
s8 LoadSavedEid8A(int slot);
bool IsGameNotFirstChapter(struct PlaySt *chapter_data);
bool IsGameSaveNotFirstChapter(int);
bool IsGameSaveComplete(int);
void WriteGameSavePackedUnit(struct Unit *unit, void *sram_dest);
void LoadSavedUnit(const void *sram_src, struct Unit *unit);
void WriteGMMonsterRnState(void *sram_dest);
void ReadGMMonsterRnState(const void *sram_src);
void InvalidateSuspendSave(int);
void WriteSuspendSave(int saveBlockId);
void ReadSuspendSave(int slot);
u8 IsValidSuspendSave(int);
void ReadSuspendSavePlaySt(int index, struct PlaySt *buf);
void EncodeSuspendSavePackedUnit(struct Unit *unit, void *buf);
void ReadSuspendSavePackedUnit(const void *sram_src, struct Unit *unit);
void WriteTraps(void *sram_dest);
void ReadTraps(void *sram_dest); /* ReadTraps */
int GetLastSuspendSaveId(void);
int GetNextSuspendSaveId(void);
void WriteSwappedSuspendSaveId(void);
int SramChecksum32(void *sram_src, int size);
bool VerifySaveBlockChecksum(struct SaveBlockInfo *buf);
void PopulateSaveBlockChecksum(struct SaveBlockInfo* buf);
u16 GetGameStateChecksum_Unused(void);

#endif /* BMSAVE_H */
