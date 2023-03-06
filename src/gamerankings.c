#include "global.h"

#include "chapterdata.h"
#include "bmitem.h"
#include "bmunit.h"

// bmsave.h
int GetGameTotalTurnCount2(void);
int BWL_GetTotalExpGained(void);
struct ChapterWinData *GetChapterWinDataEntry(int index);
int GetNextChapterWinDataEntryIndex(void);
int BWL_GetTotalWins(void);
int BWL_GetTotalBattles(void);

u16 sub_80B622C(void);
u16 sub_80B6264(void);
u16 sub_80B6284(void);

//! FE8U = 0x080B5D74
int sub_80B5D74(void) {
    int gameTotalTurns;
    int nextIndex;
    int i;
    int rankThresholds[4];

    gameTotalTurns = GetGameTotalTurnCount2();

    for (i = 0; i < 4; i++) {
        rankThresholds[i] = 0;
    }

    nextIndex = GetNextChapterWinDataEntryIndex();

    for (i = 0; i < nextIndex; i++) {
        struct ChapterWinData* ent = GetChapterWinDataEntry(i);

        if (DoesThisChapterCount(ent->chapter_index) != 0) {
            rankThresholds[0] += gChapterDataTable[ent->chapter_index].turnsForTacticsRankDInEliwoodStory[IsDifficultMode()];

            rankThresholds[1] += gChapterDataTable[ent->chapter_index].turnsForTacticsRankCInEliwoodStory[IsDifficultMode()];

            rankThresholds[2] += gChapterDataTable[ent->chapter_index].turnsForTacticsRankBInEliwoodStory[IsDifficultMode()];

            rankThresholds[3] += gChapterDataTable[ent->chapter_index].turnsForTacticsRankAInEliwoodStory[IsDifficultMode()];
        }
    }

    for (i = 0; i < 4; i++) {
        if (gameTotalTurns > rankThresholds[i]) {
            return i;
        }
    }

    return i;
}

//! FE8U = 0x080B5E6C
int sub_80B5E6C(void) {
    int unk;
    u8 i;

    u8 gUnknown_08205F1C[4] = {
        6,
        4,
        2,
        1,
    };

    unk = sub_80B622C();

    for (i = 0; i < 4; i++) {
        if (unk >= gUnknown_08205F1C[i]) {
            return i;
        }
    }

    return i;
}

//! FE8U = 0x080B5EA4
int sub_80B5EA4(void) {
    int nextIndex;
    int i;
    int rankThresholds[4];

    int totalExp = BWL_GetTotalExpGained();

    for (i = 0; i < 4; i++) {
        rankThresholds[i] = 0;
    }

    nextIndex = GetNextChapterWinDataEntryIndex();

    for (i = 0; i < nextIndex; i++) {
        struct ChapterWinData* ent = GetChapterWinDataEntry(i);

        if (DoesThisChapterCount(ent->chapter_index)) {
            rankThresholds[0] += gChapterDataTable[ent->chapter_index].gainedExpForExpRankDInEliwoodStory[IsDifficultMode()];

            rankThresholds[1] += gChapterDataTable[ent->chapter_index].gainedExpForExpRankCInEliwoodStory[IsDifficultMode()];

            rankThresholds[2] += gChapterDataTable[ent->chapter_index].gainedExpForExpRankBInEliwoodStory[IsDifficultMode()];

            rankThresholds[3] += gChapterDataTable[ent->chapter_index].gainedExpForExpRankAInEliwoodStory[IsDifficultMode()];
        }
    }

    for (i = 0; i < 4; i++) {
        if (totalExp < rankThresholds[i]) {
            return i;
        }
    }

    return i;
}

//! FE8U = 0x080B5F9C
int sub_80B5F9C(void) {
    int unk;
    int i;

    u8 gUnknown_08205F20[4] = {
        0x0F,
        0x19,
        0x23,
        0x28,
    };

    unk = sub_80B6264();
    for (i = 0; i < 4; i++) {
        if (unk < gUnknown_08205F20[i]) {
            return i;
        }
    }

    return i;

}

//! FE8U = 0x080B5FD0
int sub_80B5FD0(void) {
    u32 uVar8;
    int i;

    int totalGold = GetPartyTotalGoldValue();
    int iVar10 = 0;

    int nextIndex = GetNextChapterWinDataEntryIndex();

    for (i = 0; i < nextIndex; i++) {
        struct ChapterWinData* ent = GetChapterWinDataEntry(i);

        if (DoesThisChapterCount(ent->chapter_index) != 0) {
            iVar10 += gChapterDataTable[ent->chapter_index].goldForFundsRankInEliwoodStory[IsDifficultMode()];
        }
    }

    uVar8 = totalGold * 100;

    if (uVar8 >= (iVar10 * 80)) {
        return 4;
    } else if (uVar8 >= (iVar10 * 60)) {
        return 3;
    } else if (uVar8 >= (iVar10 * 40)) {
        return 2;
    } else if (uVar8 >= (iVar10 * 20)) {
        return 1;
    } else {
        return 0;
    }
}

u8 CONST_DATA gUnknown_08A3CB04[5][5] = {
    {
        [0] = 0x28,
        [1] = 0x50,
        [2] = 0x78,
        [3] = 0xA0,
        [4] = 0xC8,
    },
    {
        [0] = 0x0F,
        [1] = 0x23,
        [2] = 0x37,
        [3] = 0x4B,
        [4] = 0x64,
    },
    {
        [0] = 0x00,
        [1] = 0x14,
        [2] = 0x28,
        [3] = 0x3C,
        [4] = 0x50,
    },
    {
        [0] = 0x00,
        [1] = 0x14,
        [2] = 0x28,
        [3] = 0x3C,
        [4] = 0x50,
    },
    {
        [0] = 0x0A,
        [1] = 0x1E,
        [2] = 0x32,
        [3] = 0x46,
        [4] = 0x5A,
    },
};

u16 CONST_DATA gUnknown_08A3CB1E[] = {
    [0] = 0x0064,
    [1] = 0x00C8,
    [2] = 0x012C,
    [3] = 0x01C2,
    [4] = 0x0226,
    [5] = 0x0226,
};

//! FE8U = 0x080B6070
int sub_80B6070(int param_1, int param_2, int param_3, int param_4, int param_5) {
    int i;

    u16 tmp = gUnknown_08A3CB04[0][param_1];
    tmp += gUnknown_08A3CB04[1][param_2];
    tmp += gUnknown_08A3CB04[2][param_3];
    tmp += gUnknown_08A3CB04[3][param_4];
    tmp += gUnknown_08A3CB04[4][param_5];

    for (i = 0; i < 5; i++) {
        if (tmp < gUnknown_08A3CB1E[i]) {
            return i;
        }
    }

    return i;
}

u8 CONST_DATA gUnknown_08A3CB2A[3][5] = {
    {
        [0] = 0x28,
        [1] = 0x50,
        [2] = 0x78,
        [3] = 0xA0,
        [4] = 0xC8,
    },
    {
        [0] = 0x0F,
        [1] = 0x23,
        [2] = 0x37,
        [3] = 0x4B,
        [4] = 0x64,
    },
    {
        [0] = 0x0A,
        [1] = 0x1E,
        [2] = 0x32,
        [3] = 0x46,
        [4] = 0x5A,
    },
};

u16 CONST_DATA gUnknown_08A3CB3A[] = {
    [0] = 0x0041,
    [1] = 0x007D,
    [2] = 0x00E1,
    [3] = 0x0131,
    [4] = 0x0186,
    [5] = 0x0186,
};

//! FE8U = 0x080B60C8
int sub_80B60C8(int param_1, int param_2, int param_3) {
    int i;

    u16 tmp = gUnknown_08A3CB2A[0][param_1];
    tmp += gUnknown_08A3CB2A[1][param_2];
    tmp += gUnknown_08A3CB2A[2][param_3];

    for (i = 0; i < 5; i++) {
        if (tmp < gUnknown_08A3CB3A[i]) {
            return i;
        }
    }

    return i;
}

//! FE8U = 0x080B6104
int sub_80B6104(void) {
    return sub_80B6070(
        sub_80B5D74(),
        sub_80B5E6C(),
        sub_80B5FD0(),
        sub_80B5EA4(),
        sub_80B5F9C()
    );
}

//! FE8U = 0x080B6144
int sub_80B6144(void) {
    int i;
    int rankThresholds[4];

    u16 turn = gRAMChapterData.chapterTurnNumber;
    struct ROMChapterData* chapter = &gChapterDataTable[gRAMChapterData.chapterIndex];

    rankThresholds[0] = chapter->turnsForTacticsRankDInEliwoodStory[IsDifficultMode()];

    rankThresholds[1] = chapter->turnsForTacticsRankCInEliwoodStory[IsDifficultMode()];

    rankThresholds[2] = chapter->turnsForTacticsRankBInEliwoodStory[IsDifficultMode()];

    rankThresholds[3] = chapter->turnsForTacticsRankAInEliwoodStory[IsDifficultMode()];

    for (i = 0; i < 4; i++) {
        if (turn > rankThresholds[i]) {
            return i;
        }
    }

    return i;
}

//! FE8U = 0x080B61C4
int sub_80B61C4(void) {
    int unk;
    u8 i;

    u8 gUnknown_08205F24[4] = {
        4,
        3,
        2,
        1,
    };

    unk = sub_80B6284();

    for (i = 0; i < 4; i++) {
        if (unk >= gUnknown_08205F24[i]) {
            return i;
        }
    }

    return i;
}

u8 CONST_DATA gUnknown_08A3CB46[2][5] = {
    {
        [0] = 0x0A,
        [1] = 0x14,
        [2] = 0x1E,
        [3] = 0x28,
        [4] = 0x32,
    },
    {
        [0] = 0x0A,
        [1] = 0x1E,
        [2] = 0x3C,
        [3] = 0x5A,
        [4] = 0x96,
    },
};

u16 CONST_DATA gUnknown_08A3CB50[] = {
    [0] = 0x003C,
    [1] = 0x0050,
    [2] = 0x0078,
    [3] = 0x0096,
    [4] = 0x00C8,
    [5] = 0x00C8,
};

//! FE8U = 0x080B61FC
int sub_80B61FC(int param_1, int param_2) {
    int i;

    u16 tmp = gUnknown_08A3CB46[0][param_1];
    tmp += gUnknown_08A3CB46[1][param_2];

    for (i = 0; i < 5; i++) {
        if (tmp < gUnknown_08A3CB50[i]) {
            return i;
        }
    }

    return i;
}

//! FE8U = 0x080B622C
u16 sub_80B622C(void) {
    int i;

    int count = 0;

    for (i = 1; i < 0x40; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if ((unit->state & (US_DEAD | US_BIT16)) == US_DEAD) {
            count++;
        }
    }

    return count;
}

//! FE8U = 0x080B6264
u16 sub_80B6264(void) {
    int battles = BWL_GetTotalBattles();
    int wins = BWL_GetTotalWins() * 100;

    return wins / battles;
}

//! FE8U = 0x080B6284
u16 sub_80B6284(void) {
    int i;

    int count = 0;

    for (i = 1; i < 0x40; i++) {
        struct UnitUsageStats* bwl;

        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if ((unit->state & (US_DEAD | US_BIT16)) != US_DEAD) {
            continue;
        }

        bwl = BWL_GetEntry(unit->pCharacterData->number);

        if (bwl->deathLoc != gRAMChapterData.chapterIndex) {
            continue;
        }

        count++;
    }

    return count;
}

//! FE8U = 0x080B62D8
void sub_80B62D8(void) {
    return;
}

//! FE8U = 0x080B62DC
int sub_80B62DC(void) {
    struct ChapterWinData* ent;
#if NONMATCHING
    int goldInChapter;
#else // if !NONMATCHING
    register int goldInChapter asm("r5"); // :(
#endif // NONMATCHING
    int goldForFundsRank;

    int totalGold = GetPartyTotalGoldValue();

    goldInChapter = gRAMChapterData.total_gold;
    goldInChapter = totalGold - goldInChapter;

    gRAMChapterData.total_gold = totalGold;

    ent = GetChapterWinDataEntry(GetNextChapterWinDataEntryIndex() - 1);

    goldForFundsRank = gChapterDataTable[ent->chapter_index].goldForFundsRankInEliwoodStory[IsDifficultMode()];

    goldInChapter = (goldInChapter) * 100;

    if (goldInChapter >= (goldForFundsRank * 80)) {
        return 4;
    } else if (goldInChapter >= (goldForFundsRank * 60)) {
        return 3;
    } else if (goldInChapter >= (goldForFundsRank * 40)) {
        return 2;
    } else if (goldInChapter >= (goldForFundsRank * 20)) {
        return 1;
    } else {
        return 0;
    }
}

//! FE8U = 0x080B6358
int sub_80B6358(void) {
    int uVar5;
    int iVar6;
    int num;
    int a;
    int b;

    int totalBattles = BWL_GetTotalBattles();
    int totalWins = BWL_GetTotalWins();

    if (totalBattles > 0x000FFFFF) {
        totalBattles = 0x000FFFFF;
    }

    if (totalWins > 0x000FFFFF) {
        totalWins = 0x000FFFFF;
    }

    uVar5 = gRAMChapterData.unk_34_00;

    if (totalBattles == uVar5) {
        return 40;
    }

    a = gRAMChapterData.unk_34_14;
    b = gRAMChapterData.unk_38_1 << 12;
    num = (totalWins - (b | a)) * 100;

    iVar6 = num / (totalBattles - uVar5);

    if (iVar6 > 100) {
        iVar6 = 100;
    }

    gRAMChapterData.unk_34_00 = totalBattles;
    gRAMChapterData.unk_34_14 = (totalWins & 0x00000FFF);
    gRAMChapterData.unk_38_1 = ((u32)totalWins >> 0xc);

    return iVar6;
}

//extern u8 gUnknown_08205F20[];

//! FE8U = 0x080B63F0
int sub_80B63F0(void) {
    int unk;
    int i;

    u8 gUnknown_08205F20[4] = {
        0x0F,
        0x19,
        0x23,
        0x28,
    };

    unk = sub_80B6358();

    for (i = 0; i < 4; i++) {
        if (unk < gUnknown_08205F20[i]) {
            return i;
        }
    }

    return i;
}

//! FE8U = 0x080B6424
int sub_80B6424(void) {
    int totalExp;
    int i;
    struct ChapterWinData* ent;
    int expInChapter;
    int rankThresholds[4];

    for (i = 0; i < 4; i++) {
        rankThresholds[i] = 0;
    }

    totalExp = BWL_GetTotalExpGained();

    if (totalExp > 0x000FFFFF) {
        totalExp = 0x000FFFFF;
    }

    expInChapter = totalExp - gRAMChapterData.unk_38_2;
    gRAMChapterData.unk_38_2 = totalExp;

    ent = GetChapterWinDataEntry(GetNextChapterWinDataEntryIndex() - 1);

    rankThresholds[0] = gChapterDataTable[ent->chapter_index].gainedExpForExpRankDInEliwoodStory[IsDifficultMode()];

    rankThresholds[1] = gChapterDataTable[ent->chapter_index].gainedExpForExpRankCInEliwoodStory[IsDifficultMode()];

    rankThresholds[2] = gChapterDataTable[ent->chapter_index].gainedExpForExpRankBInEliwoodStory[IsDifficultMode()];

    rankThresholds[3] = gChapterDataTable[ent->chapter_index].gainedExpForExpRankAInEliwoodStory[IsDifficultMode()];

    for (i = 0; i < 4; i++) {
        if (expInChapter < rankThresholds[i]) {
            return i;
        }
    }

    return i;
}

//! FE8U = 0x080B6504
void ComputeChapterRankings(void) {
    int iVar3;
    int uVar4;

    if (GetNextChapterWinDataEntryIndex() > 0) {

        switch (gRAMChapterData.chapterModeIndex) {
            case 1:
            case 2:
            case 3:
                gRAMChapterData.unk_3E_02 = sub_80B6144();
                gRAMChapterData.unk_3E_05 = sub_80B61C4();
                gRAMChapterData.unk_3D_07 = sub_80B62DC();
                gRAMChapterData.unk_3C_06 = sub_80B63F0();
                gRAMChapterData.unk_3D_01 = sub_80B6424();
        }

        iVar3 = sub_80B6070(
            gRAMChapterData.unk_3E_02,
            gRAMChapterData.unk_3E_05,
            gRAMChapterData.unk_3D_07,
            gRAMChapterData.unk_3D_01,
            gRAMChapterData.unk_3C_06
        );

        uVar4 = gRAMChapterData.unk_2C_04 + iVar3;

        if (uVar4 > 0xff) {
            uVar4 = 0xff;
        }

        gRAMChapterData.unk_2C_04 = uVar4;
    }

    return;
}
