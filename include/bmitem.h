#ifndef GUARD_ITEMS_H
#define GUARD_ITEMS_H

#include "fontgrp.h" // for TextHandle struct definition

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

char* GetItemNameWithArticle(int item, s8 capitalize);
int GetItemHPBonus(int item);
int GetItemPowBonus(int item);
int GetItemSklBonus(int item);
int GetItemSpdBonus(int item);
int GetItemDefBonus(int item);
int GetItemResBonus(int item);
int GetItemLckBonus(int item);
int MakeItemShort(int item);
s8 CanUnitUseAsWeapon(struct Unit* unit, int item);
s8 CanUnitUseWeapon(struct Unit* unit, int item);
s8 CanUnitUseAsStaff(struct Unit* unit, int item);
s8 CanUnitUseStaff(struct Unit* unit, int item);
void DrawItemMenuCommand(struct TextHandle* text, int item, s8 isGrayed, u16* mapOut);
void sub_80168E0(struct TextHandle* text, int item, s8 isGrayed, u16* mapOut);
void DrawTextAndIconForItem(struct TextHandle* text, int item, u16* mapOut);
void sub_8016A2C(struct TextHandle* text, int item, int nameColor, u16* mapOut);
u16 ValidateItem(int item);
int GetUnitEquippedWeapon(struct Unit* unit);
int GetUnitEquippedWeaponSlot(struct Unit* unit);
s8 IsItemCoveringRange(int item, int range);
void EquipUnitItemByIndex(struct Unit* unit, int itemSlot);
s8 IsWeaponEffective(u16 item, struct Unit* unit);
s8 IsSlayerApplied(struct Unit* actor, struct Unit* target);
char* sub_8016CC0(int item);
int GetWeaponRankLevel(int wexp);
char* GetWRankTextBuffer(int item);
int GetWRankText(int item);
char* GetWTypeTextInStandardBuffer(int wpnType);
void GetWRankBarData(int wexp, int* outValue, int* outMax);
s8 IsItemDanceRing(int item);
s8 IsItemUsable(struct Unit* unit, int item);
s8 CanUnitUse(struct Unit* unit, int item);
int GetItemHealAmount(struct Unit* unit, int item);
int GetUnitItemSlot(struct Unit* unit, int itemIndex);
s8 IsItemStealable(int item);
s8 IsItemHammernable(int item);
int GetWeaponRangeMask(int item);
int GetUnitRangeMask(struct Unit* unit, int itemSlot);
int GetUnitStaffRangeMask_0(struct Unit* unit, int itemSlot);
int GetUnitStaffRangeMask(struct Unit* unit);
int GetConvoyTotalGoldValue(void);
int sub_80173D0(void);
int sub_8017450(void);
void sub_8017478(int item, u8 unk);
s8 sub_80174AC(struct Unit* unit, int item);
int GetItemIndex(int item);
char* GetItemNameString(int item);
int GetItemDescId(int item);
int GetItemUseDescId(int item);
int GetItemWType(int item);
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
int GetItemRange(int item);
int GetItemWRank(int item);
const u8* GetItemEffectivenessPtr(int item);
const struct ItemStatBonuses* GetItemStatBonusesPtr(int item);
int GetItemIconId(int item);
int GetItemWeaponEffect(int item);
int GetItemUseEffect(int item);
int GetItemCostPerUse(int item);
int GetItemMaxCost(int item);
int GetItemWExp(int item);
const struct ItemData* GetROMItemStructPtr(int item);

#endif // GUARD_ITEMS_H