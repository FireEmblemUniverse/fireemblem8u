#include "global.h"

#include "chapterdata.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmsave.h"

u16 GetGameDeathCount(void);
u16 GetGameWinPerc(void);
u16 GetChapterDeathCount(void);

//! FE8U = 0x080B5D74
int GetGameTacticsRank(void) {
    int gameTotalTurns;
    int nextIndex;
    int i;
    int rankThresholds[4];

    gameTotalTurns = GetGameTotalTurnCount2();

    for (i = 0; i < 4; i++) {
        rankThresholds[i] = 0;
    }

    nextIndex = GetNextChapterStatsSlot();

    for (i = 0; i < nextIndex; i++) {
        struct ChapterStats* ent = GetChapterStats(i);

        if (IsChapterBelongCurGame(ent->chapter_index) != 0) {
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
int GetGameSurvivalRank(void) {
    int deathCount;
    u8 i;

    u8 rankThresholds[4] = {
        6,
        4,
        2,
        1,
    };

    deathCount = GetGameDeathCount();

    for (i = 0; i < 4; i++) {
        if (deathCount >= rankThresholds[i]) {
            return i;
        }
    }

    return i;
}

//! FE8U = 0x080B5EA4
int GetGameExpRank(void) {
    int nextIndex;
    int i;
    int rankThresholds[4];

    int totalExp = PidStatsGetTotalExpGain();

    for (i = 0; i < 4; i++) {
        rankThresholds[i] = 0;
    }

    nextIndex = GetNextChapterStatsSlot();

    for (i = 0; i < nextIndex; i++) {
        struct ChapterStats* ent = GetChapterStats(i);

        if (IsChapterBelongCurGame(ent->chapter_index)) {
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
int GetGameCombatRank(void) {
    int winPercentage;
    int i;

    u8 rankThresholds[4] = {
        15,
        25,
        35,
        40,
    };

    winPercentage = GetGameWinPerc();

    for (i = 0; i < 4; i++) {
        if (winPercentage < rankThresholds[i]) {
            return i;
        }
    }

    return i;

}

//! FE8U = 0x080B5FD0
int GetGameFundsRank(void) {
    u32 totalGoldComp;
    int i;

    int totalGold = GetPartyTotalGoldValue();
    int overallFundsRequirement = 0;

    int nextIndex = GetNextChapterStatsSlot();

    for (i = 0; i < nextIndex; i++) {
        struct ChapterStats* ent = GetChapterStats(i);

        if (IsChapterBelongCurGame(ent->chapter_index) != 0) {
            overallFundsRequirement += gChapterDataTable[ent->chapter_index].goldForFundsRankInEliwoodStory[IsDifficultMode()];
        }
    }

    totalGoldComp = totalGold * 100;

    if (totalGoldComp >= (overallFundsRequirement * 80)) {
        return 4;
    } else if (totalGoldComp >= (overallFundsRequirement * 60)) {
        return 3;
    } else if (totalGoldComp >= (overallFundsRequirement * 40)) {
        return 2;
    } else if (totalGoldComp >= (overallFundsRequirement * 20)) {
        return 1;
    } else {
        return 0;
    }
}

u8 CONST_DATA gOverallRankWeightLookup[5][5] = {
    {
        [0] = 40,
        [1] = 80,
        [2] = 120,
        [3] = 160,
        [4] = 200,
    },
    {
        [0] = 15,
        [1] = 35,
        [2] = 55,
        [3] = 75,
        [4] = 100,
    },
    {
        [0] = 0,
        [1] = 20,
        [2] = 40,
        [3] = 60,
        [4] = 80,
    },
    {
        [0] = 0,
        [1] = 20,
        [2] = 40,
        [3] = 60,
        [4] = 80,
    },
    {
        [0] = 10,
        [1] = 30,
        [2] = 50,
        [3] = 70,
        [4] = 90,
    },
};

u16 CONST_DATA gOverallRankLookup[] = {
    [0] = 100,
    [1] = 200,
    [2] = 300,
    [3] = 450,
    [4] = 550,
    [5] = 550,
};

//! FE8U = 0x080B6070
int GetOverallRank(int tacticsRank, int survivalRank, int fundsRank, int combatRank, int expRank) {
    int i;

    u16 tmp = gOverallRankWeightLookup[0][tacticsRank];
    tmp += gOverallRankWeightLookup[1][survivalRank];
    tmp += gOverallRankWeightLookup[2][fundsRank];
    tmp += gOverallRankWeightLookup[3][combatRank];
    tmp += gOverallRankWeightLookup[4][expRank];

    for (i = 0; i < 5; i++) {
        if (tmp < gOverallRankLookup[i]) {
            return i;
        }
    }

    return i;
}

u8 CONST_DATA gUnknown_08A3CB2A[3][5] = {
    {
        [0] = 40,
        [1] = 80,
        [2] = 120,
        [3] = 160,
        [4] = 200,
    },
    {
        [0] = 15,
        [1] = 35,
        [2] = 55,
        [3] = 75,
        [4] = 100,
    },
    {
        [0] = 10,
        [1] = 30,
        [2] = 50,
        [3] = 70,
        [4] = 90,
    },
};

u16 CONST_DATA gUnknown_08A3CB3A[] = {
    [0] = 65,
    [1] = 125,
    [2] = 225,
    [3] = 305,
    [4] = 390,
    [5] = 390,
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
    return GetOverallRank(
        GetGameTacticsRank(),
        GetGameSurvivalRank(),
        GetGameFundsRank(),
        GetGameExpRank(),
        GetGameCombatRank()
    );
}

//! FE8U = 0x080B6144
int GetChapterTacticsRank(void) {
    int i;
    int rankThresholds[4];

    u16 turn = gPlaySt.chapterTurnNumber;
    struct ROMChapterData* chapter = &gChapterDataTable[gPlaySt.chapterIndex];

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
int GetChapterSurvivalRank(void) {
    int deathCount;
    u8 i;

    u8 gUnknown_08205F24[4] = {
        4,
        3,
        2,
        1,
    };

    deathCount = GetChapterDeathCount();

    for (i = 0; i < 4; i++) {
        if (deathCount >= gUnknown_08205F24[i]) {
            return i;
        }
    }

    return i;
}

u8 CONST_DATA gUnknown_08A3CB46[2][5] = {
    {
        [0] = 10,
        [1] = 20,
        [2] = 30,
        [3] = 40,
        [4] = 50,
    },
    {
        [0] = 10,
        [1] = 30,
        [2] = 60,
        [3] = 90,
        [4] = 150,
    },
};

u16 CONST_DATA gUnknown_08A3CB50[] = {
    [0] = 60,
    [1] = 80,
    [2] = 120,
    [3] = 150,
    [4] = 200,
    [5] = 200,
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
u16 GetGameDeathCount(void) {
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
u16 GetGameWinPerc(void) {
    int battles = PidStatsGetTotalBattleAmt();
    int wins = PidStatsGetTotalWinAmt() * 100;

    return wins / battles;
}

//! FE8U = 0x080B6284
u16 GetChapterDeathCount(void) {
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

        bwl = GetPidStats(unit->pCharacterData->number);

        if (bwl->deathLoc != gPlaySt.chapterIndex) {
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
int GetChapterFundsRank(void) {
    struct ChapterStats* ent;
#if NONMATCHING
    int goldInChapter;
#else // if !NONMATCHING
    register int goldInChapter asm("r5"); // :(
#endif // NONMATCHING
    int goldForFundsRank;

    int totalGold = GetPartyTotalGoldValue();

    goldInChapter = gPlaySt.total_gold;
    goldInChapter = totalGold - goldInChapter;

    gPlaySt.total_gold = totalGold;

    ent = GetChapterStats(GetNextChapterStatsSlot() - 1);

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
int GetChapterWinPerc(void) {
    int chapterTotalBattles;
    int percentage;
    int num;
    int a;
    int b;

    int totalBattles = PidStatsGetTotalBattleAmt();
    int totalWins = PidStatsGetTotalWinAmt();

    if (totalBattles > 0xFFFFF) {
        totalBattles = 0xFFFFF;
    }

    if (totalWins > 0xFFFFF) {
        totalWins = 0xFFFFF;
    }

    chapterTotalBattles = gPlaySt.unk_34_00;

    if (totalBattles == chapterTotalBattles) {
        return 40;
    }

    a = gPlaySt.unk_34_14;
    b = gPlaySt.unk_38_1 << 12;
    num = (totalWins - (b | a)) * 100;

    percentage = num / (totalBattles - chapterTotalBattles);

    if (percentage > 100) {
        percentage = 100;
    }

    gPlaySt.unk_34_00 = totalBattles;
    gPlaySt.unk_34_14 = (totalWins & 0x00000FFF);
    gPlaySt.unk_38_1 = ((u32)totalWins >> 12);

    return percentage;
}

//! FE8U = 0x080B63F0
int GetChapterCombatRank(void) {
    int winPercentage;
    int i;

    u8 rankThresholds[4] = {
        15,
        25,
        35,
        40,
    };

    winPercentage = GetChapterWinPerc();

    for (i = 0; i < 4; i++) {
        if (winPercentage < rankThresholds[i]) {
            return i;
        }
    }

    return i;
}

//! FE8U = 0x080B6424
int GetChapterExpRank(void) {
    int totalExp;
    int i;
    struct ChapterStats* ent;
    int expInChapter;
    int rankThresholds[4];

    for (i = 0; i < 4; i++) {
        rankThresholds[i] = 0;
    }

    totalExp = PidStatsGetTotalExpGain();

    if (totalExp > 0xFFFFF) {
        totalExp = 0xFFFFF;
    }

    expInChapter = totalExp - gPlaySt.unk_38_2;
    gPlaySt.unk_38_2 = totalExp;

    ent = GetChapterStats(GetNextChapterStatsSlot() - 1);

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
    int overallRank;
    int newRank;

    if (GetNextChapterStatsSlot() > 0) {

        switch (gPlaySt.chapterModeIndex) {
            case CHAPTER_MODE_COMMON:
            case CHAPTER_MODE_EIRIKA:
            case CHAPTER_MODE_EPHRAIM:
                gPlaySt.tacticsRank = GetChapterTacticsRank();
                gPlaySt.survivalRank = GetChapterSurvivalRank();
                gPlaySt.fundsRank = GetChapterFundsRank();
                gPlaySt.combatRank = GetChapterCombatRank();
                gPlaySt.expRank = GetChapterExpRank();
        }

        overallRank = GetOverallRank(
            gPlaySt.tacticsRank,
            gPlaySt.survivalRank,
            gPlaySt.fundsRank,
            gPlaySt.expRank,
            gPlaySt.combatRank
        );

        newRank = gPlaySt.unk_2C_04 + overallRank;

        if (newRank > 0xff) {
            newRank = 0xff;
        }

        gPlaySt.unk_2C_04 = newRank;
    }

    return;
}
