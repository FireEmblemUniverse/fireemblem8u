#include "global.h"
#include "agb_sram.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmitem.h"
#include "hardware.h"
#include "bmsave.h"
#include "sram-layout.h"

EWRAM_DATA struct UnitUsageStats *gPidStatsSaveLoc = NULL;
EWRAM_DATA struct UnitUsageStats gPidStatsData[BWL_ARRAY_NUM] = {0};
EWRAM_DATA struct ChapterStats gChapterStats[WIN_ARRAY_NUM] = {0};

void ClearPidChStatsSaveData(void *sram_dest)
{
    int i, j;

    CpuFill16(0, gPidStatsData, sizeof(gPidStatsData));
    CpuFill16(0, gChapterStats, sizeof(gChapterStats));

    for (i = 0; i < BWL_ARRAY_NUM; i++) {
        gPidStatsData[i].favval = 0x2000;
        WriteAndVerifySramFast(gPidStatsData, sram_dest + GAMESAVE_OFFSET_PIDSTATS + i * sizeof(struct UnitUsageStats), sizeof(struct UnitUsageStats));
    }

    for (i = 0; i < WIN_ARRAY_NUM; i++)
        WriteAndVerifySramFast(gChapterStats, sram_dest + GAMESAVE_OFFSET_CHAPTERSTATS + i * sizeof(struct ChapterStats), sizeof(struct ChapterStats));

    gPidStatsSaveLoc = sram_dest + 0x084C;
}

void ClearPidStats_ret()
{
    gPlaySt.unk_2C_04 = 0;
    SetPartyGoldAmount(0);
    ClearPidStats();
}

void ClearPidStats()
{
    CpuFill16(0, gPidStatsData, sizeof(gPidStatsData));
    gPlaySt.unk_38_2 = 0;
    gPlaySt.unk_34_14 = 0;
    gPlaySt.unk_38_1 = 0;
    gPlaySt.unk_34_00 = 0;
    gPlaySt.total_gold = GetPartyTotalGoldValue();
}

void ReadPidStats(void *sram_src)
{
    ReadSramFast(sram_src, gPidStatsData, sizeof(gPidStatsData));
    gPidStatsSaveLoc = sram_src;
}

void ReadChapterStats(const void *sram_src)
{
    ReadSramFast(sram_src, gChapterStats, sizeof(gChapterStats));
}

void WritePidStats(void *sram_dest)
{
    WriteAndVerifySramFast(gPidStatsData, sram_dest, sizeof(gPidStatsData));
    gPidStatsSaveLoc = sram_dest;
}

void WriteChapterStats(void *sram_dest)
{
    WriteAndVerifySramFast(gChapterStats, sram_dest, sizeof(gChapterStats));
}

struct ChapterStats *GetChapterStats(int index)
{
    return &gChapterStats[index];
}

bool IsChapterStatsValid(struct ChapterStats *chapter_stats)
{
    return chapter_stats->chapter_turn > 0;
}

int GetNextChapterStatsSlot(void)
{
    struct ChapterStats *cur = GetChapterStats(0);
    int ret = 0;

    while (cur->chapter_turn) {
        ++ret;
        ++cur;
    }

    return ret;
}

int GetCurCompleteChapters()
{
    struct ChapterStats *cur = GetChapterStats(0);
    int ret;

    for (ret = 0; cur->chapter_turn; cur++) {
        if (IsChapterBelongCurGame(cur->chapter_index))
            ret++;
    }

    return ret;
}

int GetNextChapterStatsEntry()
{
    int index = GetNextChapterStatsSlot();

    if (0 == index)
        return -1;
    else
        return GetChapterStats(index - 1)->chapter_index;
}

void RegisterChapterTimeAndTurnCount(struct PlaySt* play_st)
{
    struct ChapterStats *chstat = GetChapterStats(GetNextChapterStatsSlot());
    int time, turn;
    
    time = (GetGameClock() - play_st->time_chapter_started) / (FRAMES_PER_SECOND * 3);
    if (time > 50 * 60 * 20)
        time = 50 * 60 * 20;

    turn = play_st->chapterTurnNumber;
    if (turn > 0x1F4)
        turn = 0x1F4;

    chstat->chapter_index = play_st->chapterIndex;
    chstat->chapter_turn = turn;
    chstat->chapter_time = time;
    
}

int GetGameTotalTime_unused()
{
    int time = 0;
    int index = GetNextChapterStatsSlot();
    int i = 0;

    if (time < index)
        for (; i < index; i++)
            time += GetChapterStats(i)->chapter_time * 180;

    return time;
}

int GetGameTotalTurnCount()
{
    int ret = 0;
    int index = GetNextChapterStatsSlot();
    int i = 0;

    if (ret < index)
        for (; i < index; i++)
            ret += GetChapterStats(i)->chapter_turn;

    return ret;
}

bool IsChapterBelongCurGame(u32 ch_index)
{
    switch (gPlaySt.chapterModeIndex) {
    case CHAPTER_MODE_COMMON:
        if (ch_index < 10)
            return true;
        break;

    case CHAPTER_MODE_EIRIKA:
        if (ch_index >= 10 && ch_index <= 21)
            return true;
        break;

    case CHAPTER_MODE_EPHRAIM:
        if (ch_index <= 34 && ch_index >= 23)
            return true;
        break;
    }
    return false;
}

int GetGameTotalTime()
{
    int time = 0;
    int ch_index = GetNextChapterStatsSlot();
    int i = 0;
    struct ChapterStats *cur;

    for(; i < ch_index; i++) {
        cur = GetChapterStats(i);

        if (IsChapterBelongCurGame(cur->chapter_index))
            time += cur->chapter_time * 180;
    }

    return time;
}

int GetGameTotalTurnCount2()
{
    int count = 0;
    int ch_index = GetNextChapterStatsSlot();
    int i = 0;
    struct ChapterStats *cur;

    for(; i < ch_index; i++) {
        cur = GetChapterStats(i);

        if (IsChapterBelongCurGame(cur->chapter_index))
            count += cur->chapter_turn;
    }

    return count;
}

inline struct UnitUsageStats *GetPidStats(u8 pid)
{
    if (pid >= BWL_ARRAY_NUM)
        return 0;
    else if (0 == GetCharacterData(pid)->affinity)
        return 0;
    else
        return &gBWLDataArray[pid];  
}

void PidStatsAddBattleAmt(struct Unit* unit)
{
    u32 pid;
    struct UnitUsageStats *bwl;
    
    if (FACTION_BLUE != UNIT_FACTION(unit))
        return;

    pid = UNIT_CHAR_ID(unit);
    
    bwl = GetPidStats(pid);
    if (NULL == bwl)
        return;

    if (bwl->battleAmt < 4000)
        bwl->battleAmt++;

    PidStatsAddFavval(UNIT_CHAR_ID(unit), 4);
}

void PidStatsAddWinAmt(u8 pid)
{
    struct UnitUsageStats *bwl = GetPidStats(pid);
    if (NULL == bwl)
        return;

    if (bwl->winAmt < 0x3E8)
        bwl->winAmt++;

    PidStatsAddFavval(pid, 0x10);
}

void PidStatsRecordLoseData(u8 pid)
{
    struct SaveBlockInfo buf;
    int chunk_index;
    
    if (IsSramWorking()) {

        struct UnitUsageStats *bwl = GetPidStats(pid);
        if (NULL == bwl)
            return;
    
        if (true == gBmSt.just_resumed)
            return;

        if (PLAY_FLAG_TUTORIAL & gPlaySt.chapterStateBits)
            return;
    
        if (BM_FLAG_LINKARENA & gBmSt.gameStateBits)
            return;
    
        if (BM_FLAG_5 & gBmSt.gameStateBits)
            return;
    
        if (PLAY_FLAG_7 & gPlaySt.chapterStateBits)
            return;
    
        if (bwl->lossAmt >= 200)
            return;
        
        bwl->lossAmt++;
    
        PidStatsAddFavval(pid, -0x80);
    
        chunk_index = GetLastSuspendSaveId() + SAVE_ID_SUSPEND;
    
        WriteAndVerifySramFast(bwl, GetSaveWriteAddr(chunk_index) + 0x19E4 + pid * sizeof(struct UnitUsageStats), 1);
    
        ReadSaveBlockInfo(&buf, chunk_index);
        WriteSaveBlockInfo(&buf, chunk_index);
    
        WriteAndVerifySramFast(bwl, GetSaveWriteAddr(gPlaySt.gameSaveSlot) + 0x083C + pid * sizeof(struct UnitUsageStats), 3);
    
        ReadSaveBlockInfo(&buf, gPlaySt.gameSaveSlot);
        WriteSaveBlockInfo(&buf, gPlaySt.gameSaveSlot);
    }
}

void PidStatsRecordDefeatInfo(u8 pid, u8 killerPid, int deathCause)
{
    int type;
    struct UnitUsageStats *bwl = GetPidStats(pid);
    if (NULL == bwl)
        return;

    type = GetChapterThing();
    switch (type) {
    case 2:
        bwl->deathSkirm = true;
        bwl->deathLoc = gGMData.unk10[0].location;
        break;


    case 0:
    case 1:
    default:
        bwl->deathSkirm = false;
        bwl->deathLoc = gPlaySt.chapterIndex;
        break;
    }

    bwl->deathTurn = gPlaySt.chapterTurnNumber;
    bwl->killerPid = killerPid;
    bwl->deathCause = deathCause;
}

void PidStatsAddActAmt(u8 pid)
{
    struct UnitUsageStats *bwl = GetPidStats(pid);
    if (NULL == bwl)
        return;

    if (bwl->actAmt < 200)
        bwl->actAmt++;

    PidStatsAddFavval(pid, 2);
}

void PidStatsAddStatViewAmt(u8 pid)
{
    struct UnitUsageStats *bwl = GetPidStats(pid);
    if (NULL == bwl)
        return;

    if (bwl->statViewAmt < 200)
        bwl->statViewAmt++;
    
    PidStatsAddFavval(pid, 2);
}

void PidStatsAddDeployAmt(u8 pid)
{
    struct UnitUsageStats *bwl = GetPidStats(pid);
    if (NULL == bwl)
        return;

    if (bwl->deployAmt < 60)
        bwl->deployAmt++;
    
    PidStatsAddFavval(pid, 0x40);
}

void PidStatsAddSquaresMoved(u8 pid, int amount)
{
    int move_count;
    struct UnitUsageStats *bwl = GetPidStats(pid);
    if (NULL == bwl)
        return;

    move_count = bwl->moveAmt + amount;
    if (move_count > 1000)
        move_count = 1000;

    bwl->moveAmt = move_count;
    
    PidStatsAddFavval(pid, 2);
}

void PidStatsAddExpGained(u8 pid, int expGain)
{
    int exp;
    struct UnitUsageStats *bwl = GetPidStats(pid);
    if (NULL == bwl)
        return;

    exp = bwl->expGained + expGain;
    if (exp > 4000)
        exp = 4000;

    bwl->expGained = exp;
    
    PidStatsAddFavval(pid, expGain);
}

void PidStatsSubFavval08(u8 pid)
{
    PidStatsAddFavval(pid, -0x08);
}

void PidStatsSubFavval100(u8 pid)
{
    PidStatsAddFavval(pid, -0x100);
}

int PidStatsGetTotalBattleAmt(void)
{
    int i, ret = 0;

    for (i = 0; i < BWL_ARRAY_NUM; i++)
        ret += gPidStatsData[i].battleAmt;

    return ret;
}

int PidStatsGetTotalWinAmt(void)
{
    int i, ret = 0;

    for (i = 0; i < BWL_ARRAY_NUM; i++)
        ret += gPidStatsData[i].winAmt;

    return ret;
}

int PidStatsGetTotalLossAmt(void)
{
    int i, ret = 0;

    for (i = 0; i < BWL_ARRAY_NUM; i++)
        ret += gPidStatsData[i].lossAmt;

    return ret;
}

int PidStatsGetTotalLevel(void)
{
    int i, ret = 0;

    for (i = 0; i < BWL_ARRAY_NUM; i++)
        ret += gPidStatsData[i].expGained / 100;

    return ret;
}

int PidStatsGetTotalExpGain(void)
{
    int i, ret = 0;

    for (i = 0; i < BWL_ARRAY_NUM; i++)
        ret += gPidStatsData[i].expGained;

    return ret;
}

int PidStatsGetExpGain(u8 pid)
{
    struct UnitUsageStats *bwl = GetPidStats(pid);
    if (NULL == bwl)
        return 0;
    else
        return bwl->expGained;
}

int PidStatsGetFavval(u8 pid)
{
    struct UnitUsageStats *bwl = GetPidStats(pid);
    if (NULL == bwl)
        return 0x2000;
    else
        return bwl->favval >> 6;
}

void PidStatsAddFavval(u8 pid, int val)
{
    int cur;
    
    struct UnitUsageStats *bwl = GetPidStats(pid);
    if (NULL == bwl)
        return;

    cur = bwl->favval + val;
    
    if (cur > 0x4000)
        bwl->favval = 0x4000;
    else if (cur < 0)
        bwl->favval = 0;
    else
        bwl->favval = cur;
}

void PidStatsRecordBattleRes(void)
{
    struct BattleUnit *buA = NULL, *buB = NULL;

    if (0 == GetUnitCurrentHp(&gBattleActor.unit)) {
        buA = &gBattleActor;
        buB = &gBattleTarget;
    }

    if (0 == GetUnitCurrentHp(&gBattleTarget.unit)) {
        buA = &gBattleTarget;
        buB = &gBattleActor;
    }

    if (NULL != buA) {
        if (NULL != buB && FACTION_BLUE == UNIT_FACTION(&buB->unit)) {
            PidStatsAddWinAmt(UNIT_CHAR_ID(&buB->unit));
            gPlaySt.unk48++;
        }

        if (NULL != buA && FACTION_BLUE == UNIT_FACTION(&buA->unit))
            PidStatsRecordLoseData(UNIT_CHAR_ID(&buA->unit));
    }
}

bool IsPlaythroughIdUnique(int index)
{
    int i;
    struct GlobalSaveInfo info;
    struct PlaySt ram_ch;

    ReadGlobalSaveInfo(&info);

    for (i = 0; i < 0xC; i++)
        if (info.cleared_playthroughs[i] == index)
            return 0;

    for (i = 0; i < 3; i++) {
        if (!IsSaveValid(i))
            continue;

        ReadGameSavePlaySt(i, &ram_ch);

        if (ram_ch.playthroughIdentifier == index)
            return 0;
    }
    
    return 1;
}

int GetNewPlaythroughId(void)
{
    int i;
    for (i = 1; i < 0x100; i++)
        if (IsPlaythroughIdUnique(i))
            return i;
}

int GetGlobalCompletionCntByInfo(struct GlobalSaveInfo *info)
{
    int i, ret = 0;

    for (i = 0; i < 0xC; i++)
        if (0 != info->cleared_playthroughs[i])
            ret++;

    return ret;
}

int GetGlobalCompletionCount(void)
{
    struct GlobalSaveInfo info;

    if (!ReadGlobalSaveInfo(&info))
        return 0;
    else
        return GetGlobalCompletionCntByInfo(&info);
}

bool RegisterCompletedPlaythrough(struct GlobalSaveInfo *info, int index)
{
    int i;
    for (i = 0; i < MAX_SAVED_GAME_CLEARS; i++)
        if (info->cleared_playthroughs[i] == index)
            return false;

    for(i = 0; i < MAX_SAVED_GAME_CLEARS; i++)
        if (0 == info->cleared_playthroughs[i]) {
            info->cleared_playthroughs[i] = index;
            return true;
        }

    return false;    
}

int GetCurerentGameMode(void)
{
    return gPlaySt.chapterModeIndex;
}

void SavePlayThroughData(void)
{
    struct GlobalSaveInfo info;
    int mode, difficult, isTutorial;
    
    mode = GetCurerentGameMode();

    /* Maybe flag definition should be modified? */
    difficult = !!(gPlaySt.chapterStateBits & PLAY_FLAG_HARD);

    isTutorial = gPlaySt.cfgController;

    if (!ReadGlobalSaveInfo(&info)) {
        InitGlobalSaveInfodata();
        ReadGlobalSaveInfo(&info);
    }

    RegisterCompletedPlaythrough(&info, gPlaySt.playthroughIdentifier);
    info.completed  = true;

    switch (mode) {
    case CHAPTER_MODE_EIRIKA:
        if (!isTutorial)
            info.Eirk_mode_easy = true;
        else if (difficult)
            info.Eirk_mode_hard = true;
        else
            info.Eirk_mode_norm = true;
        break;
    
    case CHAPTER_MODE_EPHRAIM:
        if (!isTutorial)
            info.Ephy_mode_easy = true;
        else if (difficult)
            info.Ephy_mode_hard = true;
        else
            info.Ephy_mode_norm = true;
        break;

        
    case CHAPTER_MODE_COMMON:
    default:
        break;
    }

    WriteGlobalSaveInfo(&info);
}

int CheckGameEndFlag()
{
    struct GlobalSaveInfo info;

    if (ReadGlobalSaveInfo(&info))
        return info.game_end;
    else
        return 0;
}

void SetGameEndFlag()
{
    struct GlobalSaveInfo info;

    if (ReadGlobalSaveInfo(&info)) {
        info.game_end = 1;
        WriteGlobalSaveInfo(&info);
    }
}
