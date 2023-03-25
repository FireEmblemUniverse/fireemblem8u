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

/* https://decomp.me/scratch/jY7DZ */
#if NONMATCHING

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

#else
__attribute__((naked))
void WriteNewMultiArenaSave(void)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #0x80\n\
        movs r0, #5\n\
        bl GetSaveWriteAddr\n\
        mov r9, r0\n\
        add r0, sp, #0x6c\n\
        movs r4, #0\n\
        strh r4, [r0]\n\
        add r5, sp, #0x24\n\
        ldr r2, _080A66A8\n\
        adds r1, r5, #0\n\
        bl CpuSet\n\
        mov r0, sp\n\
        adds r0, #0x6e\n\
        strh r4, [r0]\n\
        add r4, sp, #0x48\n\
        ldr r2, _080A66AC\n\
        adds r1, r4, #0\n\
        bl CpuSet\n\
        movs r7, #0\n\
        mov r8, r5\n\
        add r0, sp, #0x70\n\
        mov sl, r0\n\
        mov r1, sp\n\
        adds r1, #0x58\n\
        str r1, [sp, #0x78]\n\
        mov r3, sp\n\
        adds r3, #0x5c\n\
        str r3, [sp, #0x7c]\n\
        mov r5, sp\n\
        adds r5, #0x14\n\
        str r5, [sp, #0x74]\n\
        mov r6, r9\n\
    _080A65B0:\n\
        movs r0, #0xc4\n\
        muls r0, r7, r0\n\
        adds r0, #0x10\n\
        mov r1, r9\n\
        adds r4, r1, r0\n\
        movs r5, #4\n\
    _080A65BC:\n\
        mov r0, r8\n\
        adds r1, r4, #0\n\
        movs r2, #0x24\n\
        bl WriteAndVerifySramFast\n\
        adds r4, #0x24\n\
        subs r5, #1\n\
        cmp r5, #0\n\
        bge _080A65BC\n\
        add r0, sp, #0x48\n\
        adds r1, r6, #0\n\
        movs r2, #0xf\n\
        bl WriteAndVerifySramFast\n\
        adds r6, #0xc4\n\
        adds r7, #1\n\
        cmp r7, #9\n\
        ble _080A65B0\n\
        movs r0, #7\n\
        mov r3, sl\n\
        strh r0, [r3]\n\
        movs r1, #0xf5\n\
        lsls r1, r1, #3\n\
        add r1, r9\n\
        mov r0, sl\n\
        movs r2, #2\n\
        bl WriteAndVerifySramFast\n\
        movs r7, #0\n\
        ldr r5, [sp, #0x78]\n\
        mov r8, r5\n\
        movs r0, #3\n\
        mov sl, r0\n\
        ldr r6, _080A66B0\n\
        add r6, r9\n\
        movs r1, #0\n\
        mov r9, r1\n\
    _080A6606:\n\
        ldr r4, _080A66B4\n\
        lsls r3, r7, #2\n\
        mov ip, r3\n\
        add r4, r9\n\
        ldrb r3, [r4]\n\
        lsls r1, r3, #0x1e\n\
        lsrs r1, r1, #0x1e\n\
        mov r5, sl\n\
        ands r1, r5\n\
        mov r0, r8\n\
        ldrb r2, [r0]\n\
        movs r5, #4\n\
        negs r5, r5\n\
        adds r0, r5, #0\n\
        ands r2, r0\n\
        orrs r2, r1\n\
        lsls r0, r3, #0x1c\n\
        lsrs r0, r0, #0x1e\n\
        mov r1, sl\n\
        ands r0, r1\n\
        lsls r0, r0, #2\n\
        subs r5, #9\n\
        adds r1, r5, #0\n\
        ands r2, r1\n\
        orrs r2, r0\n\
        movs r1, #0x10\n\
        ands r1, r3\n\
        movs r3, #0x11\n\
        negs r3, r3\n\
        adds r0, r3, #0\n\
        ands r2, r0\n\
        orrs r2, r1\n\
        mov r5, r8\n\
        strb r2, [r5]\n\
        ldr r2, [r4]\n\
        lsrs r2, r2, #5\n\
        lsls r2, r2, #5\n\
        ldr r0, [sp, #0x58]\n\
        movs r1, #0x1f\n\
        ands r0, r1\n\
        orrs r0, r2\n\
        str r0, [sp, #0x58]\n\
        ldr r0, _080A66B8\n\
        mov r1, ip\n\
        adds r5, r1, r0\n\
        ldr r0, [r5]\n\
        mov r1, sp\n\
        bl GetStringFromIndexInBuffer\n\
        mov r0, sp\n\
        ldr r1, [sp, #0x7c]\n\
        bl sub_8042DC8\n\
        mov r0, r8\n\
        adds r1, r6, #0\n\
        movs r2, #0x14\n\
        bl WriteAndVerifySramFast\n\
        adds r6, #0x14\n\
        movs r3, #0x14\n\
        add r9, r3\n\
        adds r7, #1\n\
        cmp r7, #9\n\
        ble _080A6606\n\
        ldr r0, _080A66BC\n\
        str r0, [sp, #0x14]\n\
        movs r0, #2\n\
        ldr r5, [sp, #0x74]\n\
        strb r0, [r5, #6]\n\
        ldr r0, [sp, #0x74]\n\
        movs r1, #5\n\
        bl WriteSaveBlockInfo\n\
        add sp, #0x80\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _080A66A8: .4byte 0x01000012\n\
    _080A66AC: .4byte 0x01000007\n\
    _080A66B0: .4byte 0x000007AC\n\
    _080A66B4: .4byte gInitialMultiArenaRankings\n\
    _080A66B8: .4byte sArenaCpTeamNameLut\n\
    _080A66BC: .4byte 0x00020112\n\
        .syntax divided\n\
    ");
}

#endif /* NONMATCHING */

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
