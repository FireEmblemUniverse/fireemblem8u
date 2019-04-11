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

int GetROMUnitSupportCount(struct Unit* unit);
u8 GetROMUnitSupportingId(struct Unit* unit, int num);
struct Unit* GetUnitSupportingUnit(struct Unit* unit, int num);
int GetSupportLevelBySupportIndex(struct Unit* unit, int num);
int GetUnitTotalSupportLevels(struct Unit* unit);
void AddSupportPoints(struct Unit* unit, int num);
void sub_80282DC(struct Unit* unit, int num);
s8 CanUnitSupportCommandWith(struct Unit* unit, int num);
int GetUnitStartingSupportValue(struct Unit* unit, int num);
int GetSupportDataIdForOtherUnit(struct Unit* unit, u8 charId);
void UnitClearSupports(struct Unit* unit);
void HandleSupportGains(void);
const struct SupportBonuses* GetSupportBonusEntryPtr(int affinity);
void StoreAddedAffinityBonusesForSupportLevel(struct SupportBonuses* bonuses, int affinity, int level);
void sub_80285A0(struct SupportBonuses* bonuses);
int GetUnitSupportBonuses(struct Unit* unit, struct SupportBonuses* bonuses);
int sub_80286BC(struct Unit* unit);
int sub_80286D4(int characterId);
int sub_80286EC(int level);
char* sub_8028710(int affinity);
void sub_802873C(u8 charA, u8 charB);
s8 CanUnitsStillSupportThisChapter(struct Unit* unit, int num);
s8 sub_80287A4(u8 charA, u8 charB);
void sub_80287D4(struct Unit* unitA, struct Unit* unitB);

#endif // GUARD_BM_RELIANCE_H