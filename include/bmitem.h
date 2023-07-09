#ifndef GUARD_ITEMS_H
#define GUARD_ITEMS_H

#include "fontgrp.h"

struct ItemStatBonuses
{
    /* 00 */ s8 hpBonus;
    /* 01 */ s8 powBonus;
    /* 02 */ s8 sklBonus;
    /* 03 */ s8 spdBonus;
    /* 04 */ s8 defBonus;
    /* 05 */ s8 resBonus;
    /* 06 */ s8 lckBonus;
    /* 07 */ s8 movBonus;
    /* 08 */ s8 conBonus;
};

struct ItemData
{
    /* 00 */ u16 nameTextId;
    /* 02 */ u16 descTextId;
    /* 04 */ u16 useDescTextId;

    /* 06 */ u8  number;
    /* 07 */ u8  weaponType;

    /* 08 */ u32 attributes;

    /* 0C */ const struct ItemStatBonuses* pStatBonuses;
    /* 10 */ const u8* pEffectiveness;

    /* 14 */ u8  maxUses;

    /* 15 */ u8  might;
    /* 16 */ u8  hit;
    /* 17 */ u8  weight;
    /* 18 */ u8  crit;

    /* 19 */ u8 encodedRange;

    /* 1A */ u16 costPerUse;
    /* 1C */ u8  weaponRank;
    /* 1D */ u8  iconId;
    /* 1E */ u8  useEffectId;
    /* 1F */ u8  weaponEffectId;
    /* 20 */ u8  weaponExp;
};

enum {
    // Item attributes

    IA_NONE           = 0,

    IA_WEAPON         = (1 << 0),
    IA_MAGIC          = (1 << 1),
    IA_STAFF          = (1 << 2),
    IA_UNBREAKABLE    = (1 << 3),
    IA_UNSELLABLE     = (1 << 4),
    IA_BRAVE          = (1 << 5),
    IA_MAGICDAMAGE    = (1 << 6),
    IA_UNCOUNTERABLE  = (1 << 7),
    IA_REVERTTRIANGLE = (1 << 8),
    IA_HAMMERNE       = (1 << 9), // Defined as Hammerne effect in FE6 Nightmare module, but as ??? in FE7 & FE8.
    IA_LOCK_3         = (1 << 10), // Dragons or Monster depending of game
    IA_LOCK_1         = (1 << 11),
    IA_LOCK_2         = (1 << 12),
    IA_LOCK_0         = (1 << 13), // King in FE6
    IA_NEGATE_FLYING  = (1 << 14),
    IA_NEGATE_CRIT    = (1 << 15),
    IA_UNUSABLE       = (1 << 16),
    IA_NEGATE_DEFENSE = (1 << 17),
    IA_LOCK_4         = (1 << 18),
    IA_LOCK_5         = (1 << 19),
    IA_LOCK_6         = (1 << 20),
    IA_LOCK_7         = (1 << 21),

    // Helpers
    IA_REQUIRES_WEXP = (IA_WEAPON | IA_STAFF),
    IA_LOCK_ANY = (IA_LOCK_0 | IA_LOCK_1 | IA_LOCK_2 | IA_LOCK_3 | IA_LOCK_4 | IA_LOCK_5 | IA_LOCK_6 | IA_LOCK_7 | IA_UNUSABLE)
};

enum {
    ITYPE_SWORD = 0,
    ITYPE_LANCE = 1,
    ITYPE_AXE   = 2,
    ITYPE_BOW   = 3,
    ITYPE_STAFF = 4,
    ITYPE_ANIMA = 5,
    ITYPE_LIGHT = 6,
    ITYPE_DARK  = 7,
    ITYPE_BLLST = 8,
    ITYPE_ITEM  = 9,
    ITYPE_DRAGN = 10,

    ITYPE_11    = 11,
    ITYPE_12    = 12,
};

enum {
    WPN_EFFECT_NONE    = 0,
    WPN_EFFECT_POISON  = 1,
    WPN_EFFECT_HPDRAIN = 2,
    WPN_EFFECT_HPHALVE = 3,
    WPN_EFFECT_DEVIL   = 4,
    WPN_EFFECT_PETRIFY = 5,
};

enum {
    // Unit ranges are a (sometimes) weirdly hardcoded.
    // A flagset value is used to represent the combined ranges of a unit's usable items
    // That's what those "reaches" bits are for.

    REACH_NONE   = 0,

    REACH_RANGE1 = (1 << 0),
    REACH_RANGE2 = (1 << 1),
    REACH_RANGE3 = (1 << 2),
    REACH_TO10   = (1 << 3),
    REACH_TO15   = (1 << 4),
    REACH_MAGBY2 = (1 << 5),
};

enum {
    // Weapon level identifiers

    WPN_LEVEL_0 = 0,
    WPN_LEVEL_E = 1,
    WPN_LEVEL_D = 2,
    WPN_LEVEL_C = 3,
    WPN_LEVEL_B = 4,
    WPN_LEVEL_A = 5,
    WPN_LEVEL_S = 6,
};

enum {
    // Weapon exp needed to have a given weapon level

    WPN_EXP_0 = 0,
    WPN_EXP_E = 1,
    WPN_EXP_D = 31,
    WPN_EXP_C = 71,
    WPN_EXP_B = 121,
    WPN_EXP_A = 181,
    WPN_EXP_S = 251,
};

#define ITEM_INDEX(aItem) ((aItem) & 0xFF)
#define ITEM_USES(aItem) ((aItem) >> 8)

extern const struct ItemData gItemData[];

char* GetItemNameWithArticle(int item, s8 capitalize);

int GetItemHpBonus(int item);
int GetItemPowBonus(int item);
int GetItemSklBonus(int item);
int GetItemSpdBonus(int item);
int GetItemDefBonus(int item);
int GetItemResBonus(int item);
int GetItemLckBonus(int item);
int MakeNewItem(int item);
s8 CanUnitUseWeapon(struct Unit* unit, int item);
s8 CanUnitUseWeaponNow(struct Unit* unit, int item);
s8 CanUnitUseStaff(struct Unit* unit, int item);
s8 CanUnitUseStaffNow(struct Unit* unit, int item);
void DrawItemMenuLine(struct Text* text, int item, s8 isGrayed, u16* mapOut);
void DrawItemMenuLineLong(struct Text* text, int item, s8 isGrayed, u16* mapOut);
void DrawItemMenuLineNoColor(struct Text* text, int item, u16* mapOut);
void DrawItemStatScreenLine(struct Text* text, int item, int nameColor, u16* mapOut);
u16 GetItemAfterUse(int item);
u32 GetUnitEquippedWeapon(struct Unit* unit);
int GetUnitEquippedWeaponSlot(struct Unit* unit);
s8 IsItemCoveringRange(int item, int range);
void EquipUnitItemSlot(struct Unit* unit, int itemSlot);
s8 IsItemEffectiveAgainst(u16 item, struct Unit* unit);
s8 IsUnitEffectiveAgainst(struct Unit* actor, struct Unit* target);
char* GetItemDisplayRangeString(int item);
int GetWeaponLevelFromExp(int wexp);
char* GetItemDisplayRankString(int item);
int GetDisplayRankStringFromExp(int wexp);
char* GetWeaponTypeDisplayString(int wpnType);
void GetWeaponExpProgressState(int wexp, int* outValue, int* outMax);
s8 IsItemDanceRing(int item);
s8 IsItemDisplayUsable(struct Unit* unit, int item);
s8 CanUnitUse_unused(struct Unit* unit, int item);
int GetUnitItemHealAmount(struct Unit* unit, int item);
int GetUnitItemSlot(struct Unit* unit, int itemIndex);
s8 IsItemStealable(int item);
s8 IsItemHammernable(int item);
int GetItemReachBits(int item);
int GetUnitWeaponReachBits(struct Unit* unit, int itemSlot);
int GetUnitItemUseReachBits(struct Unit* unit, int itemSlot);
int GetUnitStaffReachBits(struct Unit* unit);
int GetConvoyItemCostSum(void);
int GetUnitItemCostSum(void);
int GetPartyTotalGoldValue(void);
void SetItemUnsealedForCharacter(int item, u8 unk);
s8 IsItemUnsealedForUnit(struct Unit* unit, int item);
int GetItemIndex(int item);
char* GetItemName(int item);
int GetItemDescId(int item);
int GetItemUseDescId(int item);
int GetItemType(int item);
int GetItemAttributes(int item);
int GetItemUses(int item);
int GetItemMaxUses(int item);
int GetItemMight(int item);
int GetItemHit(int item);
int GetItemWeight(int item);
int GetItemCrit(int item);
int GetItemCost(int item);
int GetItemMinRange(int item);
int GetItemMaxRange(int item);
int GetItemEncodedRange(int item);
int GetItemRequiredExp(int item);
const u8* GetItemEffectiveness(int item);
const struct ItemStatBonuses* GetItemStatBonuses(int item);
int GetItemIconId(int item);
int GetItemWeaponEffect(int item);
int GetItemUseEffect(int item);
int GetItemCostPerUse(int item);
int GetItemMaxCost(int item);
int GetItemAwardedExp(int item);
const struct ItemData* GetItemData(int item);

#endif // GUARD_ITEMS_H
