#include "global.h"

#include "bmunit.h"

#define UNIT_SUPPORT_DATA(aUnit) ((aUnit)->pCharacterData->pSupportData)

enum {
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

extern const int gUnknown_0859B9A8[4];

extern const struct SupportBonuses gUnknown_088B05F8[];

s8 CanUnitsStillSupportThisChapter(struct Unit* unit, int num);

int GetROMUnitSupportCount(struct Unit* unit)
{
    if (!UNIT_SUPPORT_DATA(unit))
        return 0;

    return UNIT_SUPPORT_DATA(unit)->supportCount;
}

u8 GetROMUnitSupportingId(struct Unit* unit, int num)
{
    if (!UNIT_SUPPORT_DATA(unit))
        return 0;

    return UNIT_SUPPORT_DATA(unit)->characters[num];
}

struct Unit* GetUnitSupportingUnit(struct Unit* unit, int num)
{
    u8 charId = GetROMUnitSupportingId(unit, num);

    int i, last;

    for (i = UNIT_FACTION(unit) + 1, last = UNIT_FACTION(unit) + 0x40; i < last; ++i)
    {
        unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->pCharacterData->number == charId)
            return unit;
    }

    return NULL;
}

int GetSupportLevelBySupportIndex(struct Unit* unit, int num)
{
    int supportExp = unit->supports[num];

    if (supportExp > 240)
        return SUPPORT_LEVEL_A;

    if (supportExp > 160)
        return SUPPORT_LEVEL_B;

    if (supportExp > 80)
        return SUPPORT_LEVEL_C;

    return SUPPORT_LEVEL_NONE;
}

int GetUnitTotalSupportLevels(struct Unit* unit)
{
    int i, count, result;

    count = GetROMUnitSupportCount(unit);

    for (i = 0, result = 0; i < count; ++i)
    {
        result += GetSupportLevelBySupportIndex(unit, i);
    }

    return result;
}

void AddSupportPoints(struct Unit* unit, int num)
{
    if (UNIT_SUPPORT_DATA(unit))
    {
        int gain = UNIT_SUPPORT_DATA(unit)->supportExpGrowth[num];
        int currentExp = unit->supports[num];
        int maxExp = gUnknown_0859B9A8[GetSupportLevelBySupportIndex(unit, num)];

        if (currentExp + gain > maxExp)
            gain = maxExp - currentExp;

        unit->supports[num] = currentExp + gain;
        gUnknown_0202BCF0.chapterTotalSupportGain += gain;
    }
}

void sub_80282DC(struct Unit* unit, int num)
{
    unit->supports[num]++;
    gUnknown_0202BCF0.chapterTotalSupportGain++;

    sub_802873C(unit->pCharacterData->number, GetROMUnitSupportingId(unit, num));
}

s8 CanUnitSupportCommandWith(struct Unit* unit, int num)
{
    int exp, maxExp;

    if (gUnknown_0202BCF0.chapterStateBits & CHAPTER_FLAG_7)
        return FALSE;

    if (gUnknown_0202BCF0.chapterStateBits & CHAPTER_FLAG_3)
        return FALSE;

    if (CanUnitsStillSupportThisChapter(unit, num))
        return FALSE;

    if (GetUnitTotalSupportLevels(unit) >= MAX_SIMULTANEOUS_SUPPORT_COUNT)
        return FALSE;

    if (GetUnitTotalSupportLevels(GetUnitSupportingUnit(unit, num)) >= MAX_SIMULTANEOUS_SUPPORT_COUNT)
        return FALSE;

    exp    = unit->supports[num];
    maxExp = gUnknown_0859B9A8[GetSupportLevelBySupportIndex(unit, num)];

    if (exp == SUPPORT_EXP_A)
        return FALSE;

    return (exp == maxExp) ? TRUE : FALSE;
}

int GetUnitStartingSupportValue(struct Unit* unit, int num)
{
    if (!UNIT_SUPPORT_DATA(unit))
        return -1;

    return UNIT_SUPPORT_DATA(unit)->supportExpBase[num];
}

int GetSupportDataIdForOtherUnit(struct Unit* unit, u8 charId)
{
    int i, count = GetROMUnitSupportCount(unit);

    for (i = 0; i < count; ++i)
    {
        if (GetROMUnitSupportingId(unit, i) == charId)
            return i;
    }

    return -1;
}

void UnitClearSupports(struct Unit* unit)
{
    int i, count = GetROMUnitSupportCount(unit);

    for (i = 0; i < count; ++i)
    {
        struct Unit* other = GetUnitSupportingUnit(unit, i);

        if (!other)
            continue;

        other->supports[GetSupportDataIdForOtherUnit(other, unit->pCharacterData->number)] = 0;
        unit->supports[i] = 0;
    }
}

void HandleSupportGains(void)
{
    int i, j, jMax;

    if (gUnknown_0202BCF0.chapterTurnNumber == 1)
        return;

    if (gUnknown_0202BCF0.chapterStateBits & CHAPTER_FLAG_7)
        return;

    for (i = 1; i < 0x40; ++i)
    {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (unit->state & US_UNAVAILABLE)
            continue;

        if (GetUnitTotalSupportLevels(unit) >= MAX_SIMULTANEOUS_SUPPORT_COUNT)
            continue;

        jMax = GetROMUnitSupportCount(unit);

        for (j = 0; j < jMax; ++j)
        {
            struct Unit* other = GetUnitSupportingUnit(unit, j);

            if (!other)
                continue;

            if (other->state & US_UNAVAILABLE)
                continue;

            if (UNIT_FACTION(other) != FACTION_BLUE)
                continue;

            switch (RECT_DISTANCE(unit->xPos, unit->yPos, other->xPos, other->yPos))
            {

            case 0:
                if (!(unit->rescueOtherUnit == other->index))
                    break;

                goto add_support_points;

            case 1:
                if ((unit->state & US_RESCUED) || (other->state & US_RESCUED))
                    break;

            add_support_points:
                if (GetUnitTotalSupportLevels(other) < MAX_SIMULTANEOUS_SUPPORT_COUNT)
                    AddSupportPoints(unit, j);

                break;

            }
        }
    }
}

const struct SupportBonuses* GetSupportBonusEntryPtr(int affinity)
{
    const struct SupportBonuses* it;

    for (it = gUnknown_088B05F8; it->affinity; ++it)
    {
        if (it->affinity == affinity)
            return it;
    }

    // return NULL; // BUG?
}

void StoreAddedAffinityBonusesForSupportLevel(struct SupportBonuses* bonuses, int affinity, int level)
{
    const struct SupportBonuses* added = GetSupportBonusEntryPtr(affinity);

    bonuses->bonusAttack  += level * added->bonusAttack;
    bonuses->bonusDefense += level * added->bonusDefense;
    bonuses->bonusHit     += level * added->bonusHit;
    bonuses->bonusAvoid   += level * added->bonusAvoid;
    bonuses->bonusCrit    += level * added->bonusCrit;
    bonuses->bonusDodge   += level * added->bonusDodge;
}

void sub_80285A0(struct SupportBonuses* bonuses)
{
    bonuses->bonusAttack  = 0;
    bonuses->bonusDefense = 0;
    bonuses->bonusHit     = 0;
    bonuses->bonusAvoid   = 0;
    bonuses->bonusCrit    = 0;
    bonuses->bonusDodge   = 0;
}

int GetUnitSupportBonuses(struct Unit* unit, struct SupportBonuses* bonuses)
{
    int i, count;
    int result = 0;

    sub_80285A0(bonuses);

    count = GetROMUnitSupportCount(unit);

    for (i = 0; i < count; ++i)
    {
        struct Unit* other;
        int level1, level2;

        result = result >> 1;
        other = GetUnitSupportingUnit(unit, i);

        if (!other)
            continue;

        // TODO: gameStateBits constants
        if (!(gUnknown_0202BCB0.gameStateBits & 0x40))
        {
            if (RECT_DISTANCE(unit->xPos, unit->yPos, other->xPos, other->yPos) > SUPPORT_BONUSES_MAX_DISTANCE)
                continue;
        }

        if (other->state & (US_UNAVAILABLE | US_RESCUED))
            continue;

        level1 = GetSupportLevelBySupportIndex(other, GetSupportDataIdForOtherUnit(other, unit->pCharacterData->number));
        StoreAddedAffinityBonusesForSupportLevel(bonuses, other->pCharacterData->affinity, level1);

        level2 = GetSupportLevelBySupportIndex(unit, i);
        StoreAddedAffinityBonusesForSupportLevel(bonuses, unit->pCharacterData->affinity, level2);

        if (level1 != 0 && level2 != 0)
            result += 1 << (count - 1);
    }

    bonuses->bonusAttack  /= 2;
    bonuses->bonusDefense /= 2;
    bonuses->bonusHit     /= 2;
    bonuses->bonusAvoid   /= 2;
    bonuses->bonusCrit    /= 2;
    bonuses->bonusDodge   /= 2;

    return result;
}

int sub_80286BC(struct Unit* unit)
{
    int affinity = unit->pCharacterData->affinity;

    if (!affinity)
        return -1;

    return 0x79 + affinity; // TODO: ICON CONSTANTS
}

int sub_80286D4(int characterId)
{
    int affinity = GetCharacterData(characterId)->affinity;

    if (!affinity)
        return -1;

    return 0x79 + affinity; // TODO: ICON CONSTANTS
}

int sub_80286EC(int level)
{
    u8 chars[4] = {
        // TODO: special char constant definitions
        0x14, 0x1B, 0x1A, 0x19
    };

    return chars[level];
}

char* sub_8028710(int affinity)
{
    int textIdLookup[] = {
        // TODO: text ids
        0x534, 0x510, 0x511, 0x512, 0x513, 0x50C, 0x50B, 0x50A
    };

    return GetStringFromIndex(textIdLookup[affinity]);
}

void sub_802873C(u8 charId1, u8 charId2)
{
    struct Unit* unit = GetUnitFromCharId(charId1);
    int num = GetSupportDataIdForOtherUnit(unit, charId2);

    unit->supportBits |= (1 << num);

    unit = GetUnitFromCharId(charId2);
    num = GetSupportDataIdForOtherUnit(unit, charId1);

    unit->supportBits |= (1 << num);
}

s8 CanUnitsStillSupportThisChapter(struct Unit* unit, int num)
{
    s8 result = unit->supportBits & (1 << num);
    return result ? TRUE : FALSE;
}

s8 sub_80287A4(u8 charA, u8 charB)
{
    struct Unit* unit = GetUnitFromCharId(charA);

    if (GetSupportLevelBySupportIndex(unit, GetSupportDataIdForOtherUnit(unit, charB)) > 2)
        return TRUE;

    return FALSE;
}

void sub_80287D4(struct Unit* unitA, struct Unit* unitB)
{
    if (unitA && unitB)
    {
        #define SWAP(aType, aLValueA, aLValueB) \
        do { \
            aType tmp; \
            tmp = (aLValueA); \
            (aLValueA) = (aLValueB); \
            (aLValueB) = tmp; \
        } while (0)

        SWAP(u8, unitA->level, unitB->level);
        SWAP(u8, unitA->exp, unitB->exp);

        SWAP(u8, unitA->maxHP, unitB->maxHP);
        SWAP(u8, unitA->curHP, unitB->curHP);
        SWAP(u8, unitA->pow, unitB->pow);
        SWAP(u8, unitA->skl, unitB->skl);
        SWAP(u8, unitA->spd, unitB->spd);
        SWAP(u8, unitA->def, unitB->def);
        SWAP(u8, unitA->res, unitB->res);
        SWAP(u8, unitA->lck, unitB->lck);
        SWAP(u8, unitA->conBonus, unitB->conBonus);
        SWAP(u8, unitA->movBonus, unitB->movBonus);

        SWAP(u16, unitA->items[0], unitB->items[0]);
        SWAP(u16, unitA->items[1], unitB->items[1]);
        SWAP(u16, unitA->items[2], unitB->items[2]);
        SWAP(u16, unitA->items[3], unitB->items[3]);
        SWAP(u16, unitA->items[4], unitB->items[4]);

        #undef SWAP
    }
}
