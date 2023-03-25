#include "global.h"
#include "bmunit.h"
#include "agb_sram.h"
#include "bmsave.h"

struct MultiArenaSaveTeam EWRAM_DATA gMultiArenaSaveTeamBufA = {0};
struct MultiArenaSaveTeam EWRAM_DATA gMultiArenaSaveTeamBufB = {0};

int CONST_DATA sArenaCpTeamNameLut[] = {
    0x2BF,      /* Lord */
    0x2CC,      /* Sniper */
    0x2E1,      /* Shaman */
    0x2C1,      /* Cavalier */
    0x2DC,      /* Fighter */
    0x2DD,      /* Warrior */
    0x2C3,      /* Knight */
    0x2C4,      /* General */
    0x2CB,      /* Archer */
    0x2E2,      /* Druid */
};

void WriteNewMultiArenaSave(void)
{
    int i, j;
    char rank_name[MULTIARENA_TEAMNAME_SIZE + 4];
    struct SaveBlockInfo block_info;
    struct GameSavePackedUnit save_unit;
    char team_name[MULTIARENA_TEAMNAME_SIZE + 2];
    struct MultiArenaRankingEnt ranking_ent;
    u16 config;

    struct MultiArenaSaveBlock * dst = GetSaveWriteAddr(SAVE_ID_ARENA);

    CpuFill16(0, &save_unit, sizeof(save_unit));
    CpuFill16(0, team_name, MULTIARENA_TEAMNAME_SIZE + 1);

    for (i = 0; i < MULTIARENA_MAX_TEAMS; i++) {
        for (j = 0; j < MULTIARENA_UNITS_PER_TEAM; j++)
            WriteAndVerifySramFast(&save_unit, &dst->teams[i].units[j], sizeof(save_unit));

        WriteAndVerifySramFast(team_name, dst->teams[i].name, sizeof(dst->teams[i].name));
    }

    config = MULTIARENA_CONFIG_SHOWUNITS | MULTIARENA_CONFIG_SURVIVALMODE | MULTIARENA_CONFIG_AUTOEQUIPOFF;
    WriteAndVerifySramFast(&config, &dst->config, sizeof(config));

    for (i = 0; i < MULTIARENA_MAX_RANKINGS; i++) {
        ranking_ent.ranking = gInitialMultiArenaRankings[i].ranking;
        ranking_ent.player_count = gInitialMultiArenaRankings[i].player_count;
        ranking_ent.mode = gInitialMultiArenaRankings[i].mode;
        ranking_ent.points = gInitialMultiArenaRankings[i].points;

        GetStringFromIndexInBuffer(sArenaCpTeamNameLut[i], rank_name);
        sub_8042DC8(rank_name, ranking_ent.name);
        WriteAndVerifySramFast(&ranking_ent, &dst->rankings[i], sizeof(ranking_ent));
    }

    block_info.magic32 = SAVEMAGIC32_ARENA;
    block_info.kind = SAVEBLOCK_KIND_ARENA;
    WriteSaveBlockInfo(&block_info, SAVE_ID_ARENA);
}

bool ReadMultiArenaSaveTeamRaw(int team, struct MultiArenaSaveTeam *dst)
{
    struct MultiArenaSaveBlock const * src_sram = GetSaveReadAddr(SAVE_ID_ARENA);

    ReadSramFast(&src_sram->teams[team], dst, sizeof(struct MultiArenaSaveTeam));

    if (dst->name[0] == 0)
        return FALSE;

    return TRUE;
}

bool ReadMultiArenaSaveTeamName(int team, char *dst)
{
    struct MultiArenaSaveBlock const * src_sram = GetSaveReadAddr(SAVE_ID_ARENA);

    ReadSramFast(&src_sram->teams[team], &gMultiArenaSaveTeamBufA, sizeof(struct MultiArenaSaveTeam));

    if (gMultiArenaSaveTeamBufA.name[0] == 0)
        return FALSE;

    sub_8042DC8(gMultiArenaSaveTeamBufA.name, dst);

    return TRUE;
}

void WriteMultiArenaSaveTeamName(int team, char *name)
{
    struct SaveBlockInfo block_info;

    struct MultiArenaSaveBlock * dst_sram = GetSaveWriteAddr(SAVE_ID_ARENA);

    WriteAndVerifySramFast(name, dst_sram->teams[team].name, MULTIARENA_TEAMNAME_SIZE + 1);

    block_info.magic32 = SAVEMAGIC32_ARENA;
    block_info.kind = SAVEBLOCK_KIND_ARENA;
    WriteSaveBlockInfo(&block_info, SAVE_ID_ARENA);
}

void WipeMultiArenaSaveTeam(int team)
{
    struct SaveBlockInfo block_info;

    struct MultiArenaSaveBlock * dst_sram = GetSaveWriteAddr(SAVE_ID_ARENA);

    CpuFill16(0, &gMultiArenaSaveTeamBufA, sizeof(struct MultiArenaSaveTeam));
    WriteAndVerifySramFast(&gMultiArenaSaveTeamBufA, &dst_sram->teams[team], sizeof(struct MultiArenaSaveTeam));

    block_info.magic32 = SAVEMAGIC32_ARENA;
    block_info.kind = SAVEBLOCK_KIND_ARENA;
    WriteSaveBlockInfo(&block_info, SAVE_ID_ARENA);
}

void CopyMultiArenaSaveTeam(int team_src, int team_dst)
{
    struct SaveBlockInfo block_info;

    struct MultiArenaSaveBlock const * src_sram = GetSaveReadAddr(SAVE_ID_ARENA);
    struct MultiArenaSaveBlock * dst_sram = GetSaveWriteAddr(SAVE_ID_ARENA);

    ReadSramFast(&src_sram->teams[team_src], &gMultiArenaSaveTeamBufA, sizeof(struct MultiArenaSaveTeam));
    WriteAndVerifySramFast(&gMultiArenaSaveTeamBufA, &dst_sram->teams[team_dst], sizeof(struct MultiArenaSaveTeam));

    block_info.magic32 = SAVEMAGIC32_ARENA;
    block_info.kind = SAVEBLOCK_KIND_ARENA;
    WriteSaveBlockInfo(&block_info, SAVE_ID_ARENA);
}

void SwapMultiArenaSaveTeams(int team_a, int team_b)
{
    struct SaveBlockInfo block_info;

    struct MultiArenaSaveBlock const * src_sram = GetSaveReadAddr(SAVE_ID_ARENA);
    struct MultiArenaSaveBlock * dst_sram = GetSaveWriteAddr(SAVE_ID_ARENA);

    ReadSramFast(&src_sram->teams[team_a], &gMultiArenaSaveTeamBufA, sizeof(struct MultiArenaSaveTeam));
    ReadSramFast(&src_sram->teams[team_b], &gMultiArenaSaveTeamBufB, sizeof(struct MultiArenaSaveTeam));

    WriteAndVerifySramFast(&gMultiArenaSaveTeamBufA, &dst_sram->teams[team_b], sizeof(struct MultiArenaSaveTeam));
    WriteAndVerifySramFast(&gMultiArenaSaveTeamBufB, &dst_sram->teams[team_a], sizeof(struct MultiArenaSaveTeam));

    block_info.magic32 = SAVEMAGIC32_ARENA;
    block_info.kind = SAVEBLOCK_KIND_ARENA;
    WriteSaveBlockInfo(&block_info, SAVE_ID_ARENA);
}

void WriteMultiArenaSaveTeam(int team, struct Unit *units_src, char const *name_src)
{
    struct SaveBlockInfo block_info;
    int i;

    struct MultiArenaSaveBlock * dst_sram = GetSaveWriteAddr(SAVE_ID_ARENA);

    WriteAndVerifySramFast(name_src, dst_sram->teams[team].name, sizeof(dst_sram->teams[team].name));

    for (i = 0; i < MULTIARENA_UNITS_PER_TEAM; i++)
        WriteGameSavePackedUnit(&units_src[i], &dst_sram->teams[team].units[i]);

    block_info.magic32 = SAVEMAGIC32_ARENA;
    block_info.kind = SAVEBLOCK_KIND_ARENA;
    WriteSaveBlockInfo(&block_info, SAVE_ID_ARENA);
}

bool ReadMultiArenaSaveTeam(int team, struct Unit *units_dst, char *name_dst)
{
    int i;

    struct MultiArenaSaveBlock const * src_sram = GetSaveReadAddr(SAVE_ID_ARENA);

    ReadSramFast(src_sram->teams[team].name, name_dst, sizeof(src_sram->teams[team].name));

    for (i = 0; i < MULTIARENA_UNITS_PER_TEAM; i++)
        LoadSavedUnit(&src_sram->teams[team].units[i], &units_dst[i]);

    // I've been told that reading from sram directly is bad and that one shouldn't do it

#if BUGFIX
    if (name_dst[0] == 0)
        return FALSE;
#else
    if (src_sram->teams[team].name[0] == 0)
        return FALSE;
#endif

    return TRUE;
}

void WriteMultiArenaSaveRankings(struct MultiArenaRankingEnt const *src)
{
    struct SaveBlockInfo block_info;

    struct MultiArenaSaveBlock * dst_sram = GetSaveWriteAddr(SAVE_ID_ARENA);

    WriteAndVerifySramFast(src, dst_sram->rankings, sizeof(dst_sram->rankings));

    block_info.magic32 = SAVEMAGIC32_ARENA;
    block_info.kind = SAVEBLOCK_KIND_ARENA;
    WriteSaveBlockInfo(&block_info, SAVE_ID_ARENA);
}

void ReadMultiArenaSaveRankings(struct MultiArenaRankingEnt *dst)
{
    struct MultiArenaSaveBlock * src_sram = GetSaveReadAddr(SAVE_ID_ARENA);
    ReadSramFast(src_sram->rankings, dst, sizeof(src_sram->rankings));
}

void WriteMultiArenaSaveConfig(u16 const *config_src)
{
    struct SaveBlockInfo block_info;

    struct MultiArenaSaveBlock * dst_sram = GetSaveWriteAddr(SAVE_ID_ARENA);

    WriteAndVerifySramFast(config_src, &dst_sram->config, sizeof(u16));

    block_info.magic32 = SAVEMAGIC32_ARENA;
    block_info.kind = SAVEBLOCK_KIND_ARENA;
    WriteSaveBlockInfo(&block_info, SAVE_ID_ARENA);
}

void ReadMultiArenaSaveConfig(u16 *config_dst)
{
    struct MultiArenaSaveBlock * src_sram = GetSaveReadAddr(SAVE_ID_ARENA);
    ReadSramFast(&src_sram->config, config_dst, sizeof(u16));
}

bool IsMultiArenaSaveReady(void)
{
    char buf[MULTIARENA_TEAMNAME_SIZE + 1];
    int i;

    if (!IsMultiArenaSaveValid(SAVE_ID_ARENA))
        return FALSE;

    for (i = 0; i < MULTIARENA_MAX_TEAMS; i++)
    {
        if (ReadMultiArenaSaveTeamName(i, buf) == TRUE)
            return TRUE;
    }

    return FALSE;
}
