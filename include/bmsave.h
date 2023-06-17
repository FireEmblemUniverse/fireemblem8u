#ifndef BMSAVE_H
#define BMSAVE_H

#include "global.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmtrick.h"
#include "bmdifficulty.h"
#include "bonusclaim.h"

enum {
    UNIT_SAVE_AMOUNT_BLUE = 51,
    UNIT_SAVE_AMOUNT_RED = 50,
    UNIT_SAVE_AMOUNT_GREEN = 10,
};

enum save_chunk_index {
    SAVE_ID_GAME0,
    SAVE_ID_GAME1,
    SAVE_ID_GAME2,
    SAVE_ID_SUSPEND,
    SAVE_ID_SUSPEND_ALT,
    SAVE_ID_ARENA,
    SAVE_ID_XMAP,
    SAVE_ID_MAX
};

enum {
    SAVEBLOCK_KIND_GAME,
    SAVEBLOCK_KIND_SUSPEND,
    SAVEBLOCK_KIND_ARENA,
    SAVEBLOCK_KIND_XMAP,
    SAVEBLOCK_KIND_INVALID = -1
};

enum bmsave_magics_fe8 {
    SAVEMAGIC16       = 0x200A,
    SAVEMAGIC32       = 0x40624,
    SAVEMAGIC32_ARENA = 0x20112,
    SAVEMAGIC32_XMAP  = 0x20223,
};

#define XMAP_MAGIC 0x50414D58 // 'XMAP'

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

struct bmsave_unkstruct3 {
    struct BonusClaimEnt unk0[0x10];
    u32 unk140;
};

enum
{
    DEFEAT_CAUSE_0,
    DEFEAT_CAUSE_1,
    DEFEAT_CAUSE_COMBAT,
    DEFEAT_CAUSE_TRAP,
    DEFEAT_CAUSE_POISON,
    DEFEAT_CAUSE_5,
    DEFEAT_CAUSE_ARENA,
    DEFEAT_CAUSE_7,
};

struct UnitUsageStats {
	/* 000 */ unsigned lossAmt     : 8;
	/* 008 */ unsigned favval      : 16;
	/* 024 */ unsigned actAmt      : 8;
	/* 032 */ unsigned statViewAmt : 8;
	/* 040 */ unsigned deathLoc    : 6;
	/* 046 */ unsigned deathTurn   : 10;
	/* 056 */ unsigned deployAmt   : 6;
	/* 062 */ unsigned moveAmt     : 10;
	/* 072 */ unsigned deathCause  : 4;
	/* 076 */ unsigned expGained   : 12;
	/* 088 */ unsigned winAmt      : 10;
	/* 098 */ unsigned battleAmt   : 12;
	/* 110 */ unsigned killerPid   : 9;
	/* 119 */ unsigned deathSkirm  : 1;
	/* 120 */ /* 8bit pad */
};

#define BWL_ARRAY_NUM 0x46

struct ChapterStats {
    /* 00 */ u16 chapter_index : 0x07;
             u16 chapter_turn  : 0x09;
             u16 chapter_time  : 0x10;
};

#define WIN_ARRAY_NUM 0x30

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

/* link arena */

enum {
    MULTIARENA_CONFIG_SHOWUNITS    = 1 << 0,
    MULTIARENA_CONFIG_SURVIVALMODE = 1 << 1,
    MULTIARENA_CONFIG_AUTOEQUIPOFF = 1 << 2,
    MULTIARENA_CONFIG_3            = 1 << 3,
};

#define MULTIARENA_TEAMNAME_SIZE 14
#define MULTIARENA_UNITS_PER_TEAM 5
#define MULTIARENA_MAX_TEAMS 10
#define MULTIARENA_MAX_RANKINGS 10

struct MultiArenaRankingEnt {
    /* 00 */ u32 ranking : 2;
    /*    */ u32 player_count : 2;
    /*    */ u32 mode : 1;
    /*    */ u32 points : 27;
    /* 04 */ char name[MULTIARENA_TEAMNAME_SIZE + 1];
};

struct MultiArenaSaveTeam {
    /* 00 */ char name[MULTIARENA_TEAMNAME_SIZE + 1];
    /* 10 */ struct GameSavePackedUnit units[MULTIARENA_UNITS_PER_TEAM];
};

struct MultiArenaSaveBlock {
    /* 000 */ struct MultiArenaSaveTeam teams[MULTIARENA_MAX_TEAMS];
    /* 870 */ u16 config;
    /* 874 */ struct MultiArenaRankingEnt rankings[MULTIARENA_MAX_RANKINGS];
};

struct ExtraMapSaveHead {
    /* 00 */ u32 xmap_magic;
    /* 04 */ u16 xmap_size;
    /* 06 */ u16 xmap_checksum;
    /* 08 */ u32 save_magic32;
    /* 0C */ u8 _pad_0C[0xF - 0xC];
    /* 0F */ u8 unk0F;
    /* 10 */ void const * map_sram;
    /* 14 */ s16 map_size;
    /* 16 */ s16 info_size;
    /* 18 */ void const * info_sram;
};

struct ExtraMapInfo {
    /* 00 */ struct ROMChapterData const * chapter_info;
    /* 04 */ struct MapChangeInfo const * map_change_info;
    /* 08 */ struct ChapterEventGroup const * event_info;
    /* 0C */ char const * chapter_title;
    /* 10 */ char const * msg_10;
    /* 14 */ char const * msg_14;
    /* 18 */ struct PlaySt * play_st;
    /* 1C */ struct BmSt * bm_st;
    /* 20 */ struct Unit ** active_unit;
    /* 24 */ struct Unit * const * unit_lut;
    /* 28 */ struct BattleUnit * bu_a;
    /* 2C */ struct BattleUnit * bu_b;
    /* 30 */ struct BattleHit * battle_hits;
    /* 34 */ struct Trap * traps;
    /* 38 */ u8 * permanent_flags;
    /* 3C */ u8 * chapter_frags;
};

#define EWRAM_XMAP_SIZE 0x1000u

struct GMapSaveInfo {
    /* 00 */ u8 nodes[8];
    /* 08 */ u8 paths[4];
    /* 0C */ u16 units[7];
    /* 1A */ u8 xCursor;
    /* 1B */ u8 yCursor;
    /* 1C */ u8 unk_1c_1 : 1;
    /* 1C */ u8 unk_1c_2 : 1;
    /* 1C */ u8 unk_1c_3 : 2;
    /* 1D */ u8 skirmishes[3];
    /* 20 */ u8 skirmishState;
};

struct GameSaveBlock {
    struct PlaySt playSt;
    struct GameSavePackedUnit units[UNIT_SAVE_AMOUNT_BLUE];
    struct GameSavePackedUnit gmUnit;
    u16 supplyItems[0xB0 / 2];
    struct UnitUsageStats pidStats[BWL_ARRAY_NUM];
    struct ChapterStats chapterStats[WIN_ARRAY_NUM];
    u8 permanentFlags[0x19];
    u32 bonusClaimFlags;
    struct GMapSaveInfo wmStuff;
    struct Dungeon dungeons[2];
}; /* size = 0xDC8 */

struct SuspendSaveBlock {
    struct PlaySt playSt;
    struct ActionData action;
    struct SuspendSavePackedUnit blueUnits[UNIT_SAVE_AMOUNT_BLUE];
    struct SuspendSavePackedUnit wmMonsterUnit; // TODO: update this to `struct Dungeon dungeons[2]; u8 filler[0x1C];`?
    struct SuspendSavePackedUnit redUnits[UNIT_SAVE_AMOUNT_RED];
    struct SuspendSavePackedUnit greenUnits[UNIT_SAVE_AMOUNT_GREEN];
    struct Trap traps[TRAP_MAX_COUNT];
    u16 supplyItems[0xB0 / 2];
    struct UnitUsageStats pidStats[BWL_ARRAY_NUM];
    struct ChapterStats chapterStats[WIN_ARRAY_NUM];
    u8 menuOverride[0x10];
    u8 permanentFlags[0x19];
    u8 chapterFlags[7];
    struct GMapSaveInfo wmStuff;
    struct Dungeon dungeon;
    int eventSlotCnt;
}; /* size = 0x1F78 */

struct SaveBlocks {
    /* 0x0000 */ struct GlobalSaveInfo globalSaveInfo;
    /* 0x0064 */ struct SaveBlockInfo saveBlockInfo[SAVE_ID_MAX];
    /* 0x00D4 */ struct SuspendSaveBlock suspendSaveBlocks[2];
    /* 0x3FC4 */ struct GameSaveBlock gameSaveBlocks[3];
    /* 0x691C */ u8 offset_5[0x874];
    /* 0x7190 */ struct GameRankSaveDataPacks gameRankSave;
    /* 0x7224 */ struct bmsave_unkstruct1 unkstruct1;
    /* 0x7248 */ struct bmsave_unkstruct2 unkstruct2;
    /* 0x725C */ struct bmsave_unkstruct3 unkstruct3;
    /* 0x73A0 */ u8 unk_73A0[4];
    /* 0x73A4 */ u8 unk_73A4[0x5C];
    /* 0x7400 */ struct ExtraMapSaveHead offset_6; // see bmsave-xmap.c
};

// TODO: figure out how these structs work
struct GameSaveBlockEwram {
    struct PlaySt playSt;
    u8 unk_4C[0xC];
    u8 buffer_58[0xD1C];
    u32 buffer_D74[0xC];
}; /* size = 0xDA4 */

struct SuspendSaveBlockEwram {
    struct PlaySt playSt;
    u8 unk_4C[0xC];
    u8 buffer_58[0x1EC4];
    u32 buffer_1F1C[0xF];
}; /* size = 0x1F58 */

struct SaveBlocksEwram {
    /* 0x0000 */ struct GlobalSaveInfo globalSaveInfo;
    /* 0x0064 */ struct SaveBlockInfo saveBlockInfo[SAVE_ID_MAX];
    /* 0x00D4 */ struct SuspendSaveBlockEwram suspendSaveBlocks[2];
    /* 0x3F84 */ struct GameSaveBlockEwram gameSaveBlocks[3];
    /* 0x6870 */ u8 offset_5[0x874];
    /* 0x70E4 */ struct GameRankSaveDataPacks gameRankSave;
    /* 0x7178 */ struct bmsave_unkstruct1 unkstruct1;
    /* 0x719C */ struct bmsave_unkstruct2 unkstruct2;
    /* 0x71B0 */ struct bmsave_unkstruct3 unkstruct3;
};

extern struct UnitUsageStats *gPidStatsSaveLoc;
extern struct UnitUsageStats gPidStatsData[BWL_ARRAY_NUM];
#define gBWLDataArray (&gPidStatsData[-1])
extern struct ChapterStats gChapterStats[WIN_ARRAY_NUM];

extern struct MultiArenaRankingEnt const gInitialMultiArenaRankings[MULTIARENA_MAX_RANKINGS];
extern struct MultiArenaSaveTeam EWRAM_DATA gMultiArenaSaveTeamBufA;
extern struct MultiArenaSaveTeam EWRAM_DATA gMultiArenaSaveTeamBufB;

extern EWRAM_DATA bool gBoolSramWorking;
extern CONST_DATA struct SaveBlocks *gSram;
extern u32 gBonusContentClaimFlags;
extern u8 gSuspendSaveIdOffset;    /* gSaveSuBaseSlot */
extern CONST_DATA struct ExtraMapInfo *gExtraMapInfo;
extern CONST_DATA u8 *gpSramExtraData;
extern EWRAM_DATA struct ExtraMapSaveHead gExtraMapSaveHead;

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
void ReadPermanentFlags_ret(const void *sram_src, void *ewram_dest);
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
int GetUnitsAverageSupportValue(const int val0, const int val1);
int GetTotalAverageSupportValue(void);
int GetTotalGlobalSupportValue(struct GlobalSaveInfo *buf);
int GetTotalSupportCollection(void);
int GetGlobalBestSupport(int unitA, int unitB, struct GlobalSaveInfo *info);
void GetGlobalSupportListFromSave(int unitId, u8* data, struct GlobalSaveInfo* buf);
bool UpdateBestGlobalSupportValue(int unitA, int unitB, int supportRank);
void SGM_SetCharacterKnown(s32 charId, struct GlobalSaveInfo* buf);
bool GGM_IsCharacterKnown(int index, struct GlobalSaveInfo *buf);
int GGM_IsAnyCharacterKnown(struct GlobalSaveInfo *buf);
void sub_80A3868(void);
void __malloc_unlock_3(void);
int IsGamePlayedThrough(void);
bool LoadAndVerfyRankData(void *buf);
// bool LoadBonusContentData(void *buf); // Cannot be declared due to a non-match in "bonusclaim.c"
void SaveBonusContentData(void *buf);
void SaveRankings(void *buf);
void EraseSaveRankData(void);
int GetNextChapterMode(void);
int sub_80A39E4(void *buf, int chapter_mode, int difficulty);
void SaveNewRankData(void *buf, int chapter_mode, int difficulty);
u8 JudgeGameRankSaveData(struct GameRankSaveData *old, struct GameRankSaveData *new);
void GenerateGameRankSaveData(struct GameRankSaveData *buf, int chapter_mode, int difficulty);
void SaveEndgameRankings(void);
void sub_80A3E28(void);
bool sub_80A3E4C(void *buf);
void sub_80A3EA4(void *);
int sub_80A3ED0(void *buf, int val);
void sub_80A3F84(void);
bool sub_80A3FA8(void *buf);
void sub_80A4000(struct bmsave_unkstruct2 *buf);
int sub_80A402C(void *buf, int val);
int sub_80A402C(void *buf, int val);
void LoadAndVerifySramSaveData(void);
void ClearPidChStatsSaveData(struct GameSaveBlock *sram_dest);
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
s8 CheckGameEndFlag(void);
void SetGameEndFlag(void);
struct UnitUsageStats* GetPidStats(u8 pid);
u32 GetBonusContentClaimFlags(void);
void SetBonusContentClaimFlags(u32 num);
void WriteBonusContentClaimFlags(struct GameSaveBlock *sram_dest);
void ReadBonusContentClaimFlags(const struct GameSaveBlock *sram_src);
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
void LoadSavedWMStuff(int slot, struct GMapData *dest);
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
bool IsMultiArenaSaveValid(int index);
void WriteNewMultiArenaSave(void);
bool ReadMultiArenaSaveTeamRaw(int team, struct MultiArenaSaveTeam *dst);
bool ReadMultiArenaSaveTeamName(int team, char *dst);
void WriteMultiArenaSaveTeamName(int team, char *name);
void WipeMultiArenaSaveTeam(int team);
void CopyMultiArenaSaveTeam(int team_src, int team_dst);
void SwapMultiArenaSaveTeams(int team_a, int team_b);
void WriteMultiArenaSaveTeam(int team, struct Unit *units_src, char const *name_src);
bool ReadMultiArenaSaveTeam(int team, struct Unit *units_dst, char *name_dst);
void WriteMultiArenaSaveRankings(struct MultiArenaRankingEnt const *src);
void ReadMultiArenaSaveRankings(struct MultiArenaRankingEnt *dst);
void WriteMultiArenaSaveConfig(u16 const *config_src);
void ReadMultiArenaSaveConfig(u16 *config_dst);
bool IsMultiArenaSaveReady();
void LoadAndVerfySuspendSave();
// ??? ReadExtraMapSaveHead(???);
void const * GetExtraMapMapReadAddr(void);
unsigned  GetExtraMapMapSize(void);
// ??? GetExtraMapInfoReadAddr(???);
// ??? GetExtraMapInfoSize(???);
// ??? ExtraMapChecksum(???);
bool IsExtraMapAvailable();
void ReadExtraMapInfo(void);
// ??? sub_80A6D1C(???);
// ??? sub_80A6D24(???);
// ??? bmsave_null_false1(???);
// ??? bmsave_null_false2(???);
void NullBmMapHidden_(void);
// ??? sub_80A6D4C(???);
// ??? WriteWorldMapNodes(???);
// ??? ReadWorldMapNodes(???);
// ??? WriteWorldMapPaths(???);
// ??? ReadWorldMapPaths(???);
// ??? WriteWorldMapUnits(???);
// ??? ReadWorldMapUnits(???);
// ??? WriteWorldMapSkirmishes(???);
// ??? ReadWorldMapSkirmishes(???);
void ClearWorldMapStuff(void *ptr);
void WriteWorldMapStuff(void *sram_dest, void *src);
void ReadWorldMapStuff(const void *sram_src, void *dst);
void sub_80A71E4(void*);
void sub_80A71F8(void*);
// ??? sub_80A720C(???);
// ??? sub_80A723C(???);
// ??? sub_80A7258(???);
// ??? sub_80A7298(???);
// ??? sub_80A72B0(???);
// ??? sub_80A72EC(???);
// ??? sub_80A7328(???);
// ??? sub_80A733C(???);
// ??? sub_80A734C(???);
// ??? sub_80A7360(???);
void sub_80A7374();

#endif /* BMSAVE_H */
