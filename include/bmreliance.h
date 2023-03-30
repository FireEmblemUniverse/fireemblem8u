#ifndef GUARD_BM_RELIANCE_H
#define GUARD_BM_RELIANCE_H

enum
{
    // Config

    MAX_SIMULTANEOUS_SUPPORT_COUNT = 5,
    SUPPORT_BONUSES_MAX_DISTANCE = 3,
};

enum
{
    SUPPORT_LEVEL_NONE,
    SUPPORT_LEVEL_C,
    SUPPORT_LEVEL_B,
    SUPPORT_LEVEL_A,
};

enum
{
    SUPPORT_EXP_C = 81,
    SUPPORT_EXP_B = 161,
    SUPPORT_EXP_A = 241,
};

struct SupportData
{
    /* 00 */ u8 characters[UNIT_SUPPORT_MAX_COUNT];
    /* 07 */ u8 supportExpBase[UNIT_SUPPORT_MAX_COUNT];
    /* 0E */ u8 supportExpGrowth[UNIT_SUPPORT_MAX_COUNT];
    /* 15 */ u8 supportCount;
};

struct SupportBonuses
{
    /* 00 */ u8 affinity;

    /* 01 */ u8 bonusAttack;
    /* 02 */ u8 bonusDefense;
    /* 03 */ u8 bonusHit;
    /* 04 */ u8 bonusAvoid;
    /* 05 */ u8 bonusCrit;
    /* 06 */ u8 bonusDodge;
};

extern struct SupportData CONST_DATA gSupportData[];
extern CONST_DATA struct SupportBonuses gAffinityBonuses[];

int GetUnitSupporterCount(struct Unit* unit);
u8 GetUnitSupporterCharacter(struct Unit* unit, int num);
struct Unit* GetUnitSupporterUnit(struct Unit* unit, int num);
int GetUnitSupportLevel(struct Unit* unit, int num);
int GetUnitTotalSupportLevel(struct Unit* unit);
void UnitGainSupportExp(struct Unit* unit, int num);
void UnitGainSupportLevel(struct Unit* unit, int num);
s8 CanUnitSupportNow(struct Unit* unit, int num);
int GetUnitSupporterInitialExp(struct Unit* unit, int num);
int GetUnitSupporterNum(struct Unit* unit, u8 charId);
void InitUnitsupports(struct Unit* unit);
void ProcessTurnSupportExp(void);
int GetUnitSupportBonuses(struct Unit* unit, struct SupportBonuses* bonuses);
int GetUnitAffinityIcon(struct Unit* unit);
int GetCharacterAffinityIcon(int characterId);
int GetSupportLevelUiChar(int level);
char* GetAffinityName(int affinity); // unused?
s8 HaveCharactersMaxSupport(u8 charA, u8 charB);
void SwapUnitStats(struct Unit* unitA, struct Unit* unitB);

#endif // GUARD_BM_RELIANCE_H