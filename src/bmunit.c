#include "global.h"

#include "fontgrp.h"
#include "icon.h"
#include "chapterdata.h"

#include "items.h"

#define ITEM_INDEX(aItem) ((aItem) & 0xFF)
#define ITEM_USES(aItem) ((aItem) >> 8)

#define ITEM_WPN_RANK(aItem) (ITEM_INDEX(aItem)[gItemData].weaponRank)
#define ITEM_WPN_TYPE(aItem) (ITEM_INDEX(aItem)[gItemData].weaponType)

s8 sub_80174AC(struct Unit* unit, int item);
s8 CanUnitNotUseMagic(struct Unit* unit);

int GetPartyGoldAmount(void);

// Effectiveness lists
extern const u8 gUnknown_088ADF2A[];
extern const u8 gUnknown_088ADEF1[];
extern const u8 gUnknown_088ADF39[]; // Slayer effectiveness list

enum {
	WPN_EXP_0 = 0,
	WPN_EXP_E = 1,
	WPN_EXP_D = 31,
	WPN_EXP_C = 71,
	WPN_EXP_B = 121,
	WPN_EXP_A = 181,
	WPN_EXP_S = 251,
};

enum {
	WPN_LEVEL_0 = 0,
	WPN_LEVEL_E = 1,
	WPN_LEVEL_D = 2,
	WPN_LEVEL_C = 3,
	WPN_LEVEL_B = 4,
	WPN_LEVEL_A = 5,
	WPN_LEVEL_S = 6,
};

s8 CanUnitUseItem(struct Unit* unit, int item);

int GetUnitPower(struct Unit* unit);

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
	RANGE_BIT_NONE = 0,

	RANGE_BIT_RNG1 = (1 << 0),
	RANGE_BIT_RNG2 = (1 << 1),
	RANGE_BIT_RNG3 = (1 << 2),
	RANGE_BIT_TO10 = (1 << 3),
	RANGE_BIT_TO15 = (1 << 4),
	RANGE_BIT_MAG2 = (1 << 5),
};

enum { CONVOY_ITEM_COUNT = 100 };

u16* GetConvoyItemArray(void);

static inline void SetChapterUnk1C(int arg, u8 val) {
	gUnknown_0202BCF0.unk1C[arg] = val;
}

static inline int GetChapterUnk1C(int arg) {
	return gUnknown_0202BCF0.unk1C[arg];
}

// TODO: reorder and make public (to generate at the end of the file)

static inline const struct ItemData* GetItemData(int itemIndex) {
	return gItemData + itemIndex;
}

static inline int GetItemIndexStatic(int item) {
	return ITEM_INDEX(item);
}

static inline const char* GetItemNameStringStatic(int item) {
	const char* result;

	result = GetStringFromIndex(GetItemData(ITEM_INDEX(item))->nameTextId);
	result = FilterSomeTextFromStandardBuffer();

	return result;
}

static inline int GetItemAttributes(int item) {
	return GetItemData(ITEM_INDEX(item))->attributes;
}

static inline int GetItemUses(int item) {
	if (GetItemAttributes(item) & IA_UNBREAKABLE)
		return 0xFF;
	else
		return ITEM_USES(item);
}

static inline int GetItemMaxUses(int item) {
	if (GetItemAttributes(item) & IA_UNBREAKABLE)
		return 0xFF;
	else
		return GetItemData(ITEM_INDEX(item))->maxUses;
}

static inline int GetItemIconId(int item) {
	if (!item)
		return -1;

	return GetItemData(ITEM_INDEX(item))->iconId;
}

static inline int GetItemMinRange(int item) {
	return GetItemData(ITEM_INDEX(item))->encodedRange >> 4;
}

static inline int GetItemMaxRange(int item) {
	return GetItemData(ITEM_INDEX(item))->encodedRange & 0xF;
}

static inline int GetItemEncodedRange(int item) {
	return GetItemData(ITEM_INDEX(item))->encodedRange;
}

static inline int GetItemType(int item) {
	if (!item)
		return 0xFF;

	return GetItemData(ITEM_INDEX(item))->weaponType;
}

static inline int GetItemGoldValue(int item) {
	if (GetItemAttributes(item) & IA_UNBREAKABLE)
		return GetItemData(ITEM_INDEX(item))->costPerUse;
	else
		return GetItemData(ITEM_INDEX(item))->costPerUse * GetItemUses(item);
}

static inline int GetItemRequiredWExp(int item) {
	return GetItemData(ITEM_INDEX(item))->weaponRank;
}

static inline const u8* GetItemEffectivenessList(int item) {
	return GetItemData(ITEM_INDEX(item))->pEffectiveness;
}

static inline int GetItemUseEffect(int item) {
	return GetItemData(ITEM_INDEX(item))->useEffectId;
}

s8 CanUnitUseAsWeapon(struct Unit* unit, int item) {
	if (item == 0)
		return FALSE;

	if (!(GetItemAttributes(item) & IA_WEAPON))
		return FALSE;

	if (GetItemAttributes(item) & IA_LOCK_ANY) {
		// Check for item locks

		if ((GetItemAttributes(item) & IA_LOCK_1) && !(UNIT_ATTRIBUTES(unit) & CA_LOCK_1))
			return FALSE;

		if ((GetItemAttributes(item) & IA_LOCK_4) && !(UNIT_ATTRIBUTES(unit) & CA_LOCK_4))
			return FALSE;

		if ((GetItemAttributes(item) & IA_LOCK_5) && !(UNIT_ATTRIBUTES(unit) & CA_LOCK_5))
			return FALSE;

		if ((GetItemAttributes(item) & IA_LOCK_6) && !(UNIT_ATTRIBUTES(unit) & CA_LOCK_6))
			return FALSE;

		if ((GetItemAttributes(item) & IA_LOCK_7) && !(UNIT_ATTRIBUTES(unit) & CA_LOCK_7))
			return FALSE;

		if ((GetItemAttributes(item) & IA_LOCK_2) && !(UNIT_ATTRIBUTES(unit) & CA_LOCK_2))
			return FALSE;

		// Monster lock is special
		if (GetItemAttributes(item) & IA_LOCK_3) {
			if (!(UNIT_ATTRIBUTES(unit) & CA_LOCK_3))
				return FALSE;

			return TRUE;
		}

		if (GetItemAttributes(item) & IA_UNUSABLE)
			if (!(sub_80174AC(unit, item)))
				return FALSE;
	}

	if ((unit->statusIndex == UNIT_STATUS_SILENCED) && (GetItemAttributes(item) & IA_MAGIC))
		return FALSE;

	{
		int wRank = ITEM_WPN_RANK(item);
		int uRank = (unit->ranks[(item ? ITEM_WPN_TYPE(item) : 0xFF)]);

		return (uRank >= wRank) ? TRUE : FALSE;
	}
}

s8 CanUnitUseWeapon(struct Unit* unit, int item) {
	if (item == 0)
		return FALSE;

	if (!(GetItemAttributes(item) & IA_WEAPON))
		return FALSE;

	if ((GetItemAttributes(item) & IA_MAGIC) && CanUnitNotUseMagic(unit))
		return FALSE;

	return CanUnitUseAsWeapon(unit, item);
}

s8 CanUnitUseAsStaff(struct Unit* unit, int item) {
	if (item == 0)
		return FALSE;

	if (!(GetItemAttributes(item) & IA_STAFF))
		return FALSE;

	if (unit->statusIndex == UNIT_STATUS_SLEEP)
		return FALSE;

	if (unit->statusIndex == UNIT_STATUS_BERSERK)
		return FALSE;

	if (unit->statusIndex == UNIT_STATUS_SILENCED)
		return FALSE;

	{
		int wRank = ITEM_WPN_RANK(item);
		int uRank = unit->ranks[ITEM_WPN_TYPE(item)];

		return (uRank >= wRank) ? TRUE : FALSE;
	}
}

// unused?
s8 CanUnitUseStaff(struct Unit* unit, int item) {
	if (item == 0)
		return FALSE;

	if (!(GetItemAttributes(item) & IA_STAFF))
		return FALSE;

	if (CanUnitNotUseMagic(unit))
		return FALSE;

	return CanUnitUseAsStaff(unit, item);
}

// TODO: text color codes
// TODO: special character codes

void DrawItemMenuCommand(struct TextHandle* text, int item, s8 isGrayed, u16* mapOut) {
	Text_SetParameters(text, 0, (isGrayed ? 0 : 1));
	Text_AppendString(text, GetItemNameStringStatic(item));

	Text_Draw(text, mapOut + 2);

	DrawDecNumber(mapOut + 11, isGrayed ? 2 : 1, GetItemUses(item));

	DrawIcon(mapOut, GetItemIconId(item), 0x4000);
}

void sub_80168E0(struct TextHandle* text, int item, s8 isGrayed, u16* mapOut) {
	Text_SetParameters(text, 0, (isGrayed ? 0 : 1));
	Text_AppendString(text, GetItemNameStringStatic(item));

	Text_Draw(text, mapOut + 2);

	DrawDecNumber(mapOut + 10, isGrayed ? 2 : 1, GetItemUses(item));
	DrawDecNumber(mapOut + 13, isGrayed ? 2 : 1, GetItemMaxUses(item));
	sub_8004B0C(mapOut + 11, isGrayed ? 0 : 1, 0x16); // draw special character?

	DrawIcon(mapOut, GetItemIconId(item), 0x4000);
}

void DrawTextAndIconForItem(struct TextHandle* text, int item, u16* mapOut) {
	Text_SetXCursor(text, 0);
	Text_AppendString(text, GetItemNameStringStatic(item));

	Text_Draw(text, mapOut + 2);

	DrawDecNumber(mapOut + 11, Text_GetColorId(text), GetItemUses(item));

	DrawIcon(mapOut, GetItemIconId(item), 0x4000);
}

void sub_8016A2C(struct TextHandle* text, int item, int nameColor, u16* mapOut) {
	int color;

	Text_Clear(text);

	color = nameColor;
	Text_SetColorId(text, color);

	Text_AppendString(text, GetItemNameStringStatic(item));

	color = (nameColor == 1) ? 1 : 0;
	sub_8004B0C(mapOut + 12, color, 0x16);

	color = (nameColor != 1) ? 2 : 1;
	DrawDecNumber(mapOut + 11, color, GetItemUses(item));
	DrawDecNumber(mapOut + 14, color, GetItemMaxUses(item));

	Text_Draw(text, mapOut + 2);

	DrawIcon(mapOut, GetItemIconId(item), 0x4000);
}

u16 ValidateItem(int item) {
	if (GetItemAttributes(item) & IA_UNBREAKABLE)
		return item; // unbreakable items don't loose uses!

	item -= (1 << 8); // lose one use

	if (item < (1 << 8))
		return 0; // return no item if uses < 0

	return item; // return used item
}

int GetUnitEquippedWeapon(struct Unit* unit) {
	int i;

	// TODO: UNIT_ITEM_COUNT
	for (i = 0; i < 5; ++i)
		if (CanUnitUseAsWeapon(unit, unit->items[i]) == TRUE)
			return unit->items[i];

	return 0;
}

int GetUnitEquippedWeaponSlot(struct Unit* unit) {
	int i;

	// TODO: UNIT_ITEM_COUNT
	for (i = 0; i < 5; ++i)
		if (CanUnitUseWeapon(unit, unit->items[i]) == TRUE)
			return i;

	return -1;
}

s8 IsItemCoveringRange(int item, int range) {
	int min = GetItemMinRange(item);
	int max = GetItemMaxRange(item);

	if ((min <= range) && (range <= max))
		return TRUE;

	return FALSE;
}

void EquipUnitItemByIndex(struct Unit* unit, int itemSlot) {
	int item, i;

	item = unit->items[itemSlot];

	for (i = itemSlot; i != 0; --i)
		unit->items[i] = unit->items[i - 1];

	unit->items[0] = item;
}

s8 IsWeaponEffective(u16 item, struct Unit* unit) {
	if (unit->pClassData) {
		int classId = unit->pClassData->number;
		const u8* effList = GetItemEffectivenessList(item);

		if (!effList)
			return FALSE;

		for (; *effList; ++effList)
			if (*effList == classId)
				goto check_flying_effectiveness_negation;

		return FALSE;

		check_flying_effectiveness_negation: { 
			u32 attributes;
			int i;

			if (GetItemEffectivenessList(item) != gUnknown_088ADF2A)
				if (GetItemEffectivenessList(item) != gUnknown_088ADEF1)
					return TRUE;

			attributes = 0;

			// TODO: UNIT_ITEM_COUNT
			for (i = 0; i < 5; ++i)
				attributes = attributes | GetItemAttributes(unit->items[i]);

			if (!(attributes & IA_NEGATE_FLYING))
				return TRUE;
			else
				return FALSE;
		}
	}

	return FALSE;
}

s8 IsSlayerApplied(struct Unit* actor, struct Unit* target) {
	int actorClass = actor->pClassData->number;
	int targetClass = target->pClassData->number;

	const u8* effList = NULL;

	switch (actorClass) {

	case 0x2B:
	case 0x2C:
		effList = gUnknown_088ADF39;
		break;

	} // switch (actorClass)

	if (!effList)
		return FALSE;

	for (; *effList; ++effList)
		if (*effList == targetClass)
			goto is_effective;

	return FALSE;

	is_effective:
		return TRUE;
}

char* sub_8016CC0(int item) {
	int rangeTextIdLookup[10] = {
		// TODO: TEXT ID CONSTANTS
		0x522, 0x523, 0x524, 0x525, 0x526, // 0-Mag/2, 1, 1-2, 1-3, 2
		0x527, 0x528, 0x529, 0x52A, 0x52B, // 2-3, 3-10, 3-15, Total, --
	};

	// TODO: use those maybe?
	enum {
		ITEM_RANGE_MAG2 = 0x10,
		ITEM_RANGE_1 = 0x11,
		ITEM_RANGE_1_2 = 0x12,
		ITEM_RANGE_1_3 = 0x13,
		ITEM_RANGE_2 = 0x22,
		ITEM_RANGE_2_3 = 0x23,
		ITEM_RANGE_3_10 = 0x3A,
		ITEM_RANGE_3_15 = 0x3F,
		ITEM_RANGE_TOTAL = 0xFF,
	};

	switch (GetItemEncodedRange(item)) {

	case 0x10: // 1-mag/2
		return GetStringFromIndex(rangeTextIdLookup[0]);

	case 0x11: // 1-1
		return GetStringFromIndex(rangeTextIdLookup[1]);

	case 0x12: // 1-2
		return GetStringFromIndex(rangeTextIdLookup[2]);

	case 0x13: // 1-3
		return GetStringFromIndex(rangeTextIdLookup[3]);

	case 0x22: // 2-2
		return GetStringFromIndex(rangeTextIdLookup[4]);

	case 0x23: // 2-3
		return GetStringFromIndex(rangeTextIdLookup[5]);

	case 0x3A: // 3-10
		return GetStringFromIndex(rangeTextIdLookup[6]);

	case 0x3F: // 3-15
		return GetStringFromIndex(rangeTextIdLookup[7]);

	case 0xFF: // total
		return GetStringFromIndex(rangeTextIdLookup[8]);

	default: // bad
		return GetStringFromIndex(rangeTextIdLookup[9]);

	} // switch (GetItemEncodedRange(item))
}

int GetWeaponRankLevel(int wexp) {
	if (wexp < WPN_EXP_E)
		return WPN_LEVEL_0;

	if (wexp < WPN_EXP_D)
		return WPN_LEVEL_E;

	if (wexp < WPN_EXP_C)
		return WPN_LEVEL_D;

	if (wexp < WPN_EXP_B)
		return WPN_LEVEL_C;

	if (wexp < WPN_EXP_A)
		return WPN_LEVEL_B;

	if (wexp < WPN_EXP_S)
		return WPN_LEVEL_A;

	return WPN_LEVEL_S;
}

char* GetWRankTextBuffer(int item) {
	int rankTextIdLookup[] = {
		// TODO: TEXT ID CONSTANTS
		0x52C, 0x52D, 0x52E, 0x52F, // --, E, D, C
		0x530, 0x531, 0x532, 0x533, // B, A, S, Prf
	};

	// reuse of the same variable for different purposes :/
	int var = GetItemRequiredWExp(item);

	if ((GetItemAttributes(item) & IA_LOCK_ANY) && GetWeaponRankLevel(var) == WPN_LEVEL_0)
		var = 7;
	else
		var = GetWeaponRankLevel(var);

	return GetStringFromIndex(rankTextIdLookup[var]);
}

int GetWRankText(int item) {
	u8 rankTextIdLookup[] = {
		// TODO: TEXT ID CONSTANTS
		0x14, 0x1D, 0x1C, 0x1B, 0x1A, 0x19, 0x18
	};

	return rankTextIdLookup[GetWeaponRankLevel(item)];
}

char* GetWTypeTextInStandardBuffer(int wpnType) {
	int wtypeTextIdLookup[] = {
		// TODO: TEXT ID CONSTANTS
		0x505, 0x506, 0x507, 0x508, // Sword, Lance, Axe, Box
		0x509, 0x50A, 0x50B, 0x50C, // Staff, Anima, Light, Dark
		0x50D, 0x50E, 0x50F,        // Item, Bllsta, Dragon
	};

	return GetStringFromIndex(wtypeTextIdLookup[wpnType]);
}

void GetWRankBarData(int wexp, int* outValue, int* outMax) {
	switch (GetWeaponRankLevel(wexp)) {

	case WPN_LEVEL_0:
		*outValue = 0;
		*outMax = 0;
		return;

	case WPN_LEVEL_E:
		*outValue = wexp      - WPN_EXP_E;
		*outMax   = WPN_EXP_D - WPN_EXP_E;
		return;

	case WPN_LEVEL_D:
		*outValue = wexp      - WPN_EXP_D;
		*outMax   = WPN_EXP_C - WPN_EXP_D;
		return;

	case WPN_LEVEL_C:
		*outValue = wexp      - WPN_EXP_C;
		*outMax   = WPN_EXP_B - WPN_EXP_C;
		return;

	case WPN_LEVEL_B:
		*outValue = wexp      - WPN_EXP_B;
		*outMax   = WPN_EXP_A - WPN_EXP_B;
		return;

	case WPN_LEVEL_A:
		*outValue = wexp      - WPN_EXP_A;
		*outMax   = WPN_EXP_S - WPN_EXP_A;
		return;

	case WPN_LEVEL_S:
		*outValue = 0;
		*outMax = 0;
		return;

	} // switch (GetWeaponRankLevel(wexp))
}

s8 IsItemDanceRing(int item) {
	switch (GetItemIndexStatic(item)) {

	case ITEM_HOPLON_SHIELD: // ????????
	case ITEM_FILLAS_MIGHT:
	case ITEM_NINISS_GRACE:
	case ITEM_THORS_IRE:
	case ITEM_SETS_LITANY:
		return TRUE;

	default:
		return FALSE;

	} // switch (GetItemIndex(item))
}

s8 IsItemUsable(struct Unit* unit, int item) {
	if (GetItemAttributes(item) & IA_WEAPON)
		return CanUnitUseAsWeapon(unit, item);

	if (GetItemAttributes(item) & IA_STAFF)
		return CanUnitUseAsStaff(unit, item);

	if (GetItemUseEffect(item)) {
		if (unit->statusIndex == UNIT_STATUS_SLEEP)
			return FALSE;

		if (unit->statusIndex == UNIT_STATUS_BERSERK)
			return FALSE;

		if (!(UNIT_ATTRIBUTES(unit) & CA_LOCKPICK) && GetItemIndexStatic(item) == ITEM_LOCKPICK)
			return FALSE;

		if (!(UNIT_ATTRIBUTES(unit) & CA_REFRESHER) && IsItemDanceRing(item))
			return FALSE;
	}

	return TRUE;
}

s8 CanUnitUse(struct Unit* unit, int item) {
	if (GetItemAttributes(item) & IA_WEAPON)
		return CanUnitUseAsWeapon(unit, item);
	else
		return CanUnitUseItem(unit, item);
}

int GetItemHealAmount(struct Unit* unit, int item) {
	int result = 0;

	switch (GetItemIndexStatic(item)) {

	case ITEM_STAFF_HEAL:
	case ITEM_STAFF_PHYSIC:
	case ITEM_STAFF_FORTIFY:
	case ITEM_VULNERARY:
	case ITEM_VULNERARY_2:
		result = 10;
		break;

	case ITEM_STAFF_MEND:
		result = 20;
		break;

	case ITEM_STAFF_RECOVER:
	case ITEM_ELIXIR:
		result = 80;
		break;

	} // switch (GetItemIndexStatic(item))

	if (GetItemAttributes(item) & IA_STAFF) {
		result += GetUnitPower(unit);

		if (result > 80)
			result = 80;
	}

	return result;
}

int GetUnitItemSlot(struct Unit* unit, int itemIndex) {
	int i;

	// TODO: UNIT_ITEM_COUNT
	for (i = 0; i < 5; ++i)
		if (GetItemIndexStatic(unit->items[i]) == itemIndex)
			return i;

	return (-1);
}

s8 IsItemStealable(int item) {
	return (GetItemType(item) == ITYPE_ITEM);
}

s8 IsItemHammernable(int item) {
	if (!item)
		return FALSE;

	if (!(GetItemAttributes(item) & (IA_WEAPON | IA_STAFF)))
		return FALSE;

	if (GetItemAttributes(item) & (IA_UNBREAKABLE | IA_HAMMERNE | IA_LOCK_3))
		return FALSE;

	if (GetItemUses(item) == GetItemMaxUses(item))
		return FALSE;

	return TRUE;
}

int GetWeaponRangeMask(int item) {
	switch (GetItemEncodedRange(item)) {

	case 0x11:
		return RANGE_BIT_RNG1;

	case 0x12:
		return RANGE_BIT_RNG1 | RANGE_BIT_RNG2;

	case 0x13:
		return RANGE_BIT_RNG1 | RANGE_BIT_RNG2 | RANGE_BIT_RNG3;

	case 0x14:
		return RANGE_BIT_RNG1 | RANGE_BIT_TO10;

	case 0x22:
		return RANGE_BIT_RNG2;

	case 0x23:
		return RANGE_BIT_RNG2 | RANGE_BIT_RNG3;

	case 0x33:
		return RANGE_BIT_RNG3;

	case 0x3A:
		return RANGE_BIT_RNG3 | RANGE_BIT_TO10;

	case 0x3F:
		return RANGE_BIT_RNG3 | RANGE_BIT_TO15;

	default:
		return RANGE_BIT_NONE;

	} // switch (GetItemEncodedRange(item))
}

int GetUnitRangeMask(struct Unit* unit, int itemSlot) {
	int i, item, result = 0;

	if (itemSlot >= 0)
		return GetWeaponRangeMask(unit->items[itemSlot]);

	// TODO: UNIT_ITEM_COUNT
	for (i = 0; (i < 5) && (item = unit->items[i]); ++i)
		if (CanUnitUseAsWeapon(unit, item))
			result |= GetWeaponRangeMask(item);

	return result;
}

int GetUnitStaffRangeMask_0(struct Unit* unit, int itemSlot) {
	int i, tmp, range = 0;

	if (itemSlot >= 0) {
		tmp = unit->items[itemSlot];

		if (!CanUnitUseItem(unit, tmp))
			return RANGE_BIT_NONE;

		range = GetItemMaxRange(tmp);

		if (range == 0)
			range = 99;
	} else {
		// TODO: UNIT_ITEM_COUNT
		for (i = 0; (i < 5) && (tmp = unit->items[i]); ++i) {
			if (CanUnitUseItem(unit, tmp)) {
				tmp = GetItemMaxRange(tmp);

				if (tmp == 0)
					tmp = 99;

				if (range < tmp)
					range = tmp;
			}
		}
	}

	switch (range) {

	case 1:
		return RANGE_BIT_RNG1;

	case 2:
		return RANGE_BIT_RNG1 | RANGE_BIT_RNG2;

	case 99:
		return RANGE_BIT_MAG2;

	default:
		return RANGE_BIT_NONE;

	} // switch (range)
}

int GetUnitStaffRangeMask(struct Unit* unit) {
	int i, tmp, range = 0;

	// TODO: UNIT_ITEM_COUNT
	for (i = 0; (i < 5) && (tmp = unit->items[i]); ++i) {
		if (CanUnitUseAsStaff(unit, tmp)) {
			if (GetItemIndexStatic(tmp) == ITEM_NIGHTMARE) {
				tmp = 99;
			} else {
				tmp = GetItemMaxRange(tmp);

				if (tmp == 0)
					tmp = 99;
			}

			if (range < tmp)
				range = tmp;
		}
	}

	switch (range) {

	case 1:
		return RANGE_BIT_RNG1;

	case 2:
		return RANGE_BIT_RNG1 | RANGE_BIT_RNG2;

	case 99:
		return RANGE_BIT_MAG2;

	default:
		return RANGE_BIT_NONE;

	} // switch (range)
}

int GetConvoyTotalGoldValue(void) {
	int i, result = 0;

	const u16* convoy = GetConvoyItemArray();

	for (i = 0; (i < CONVOY_ITEM_COUNT) && (*convoy); ++i) {
		result += GetItemGoldValue(*convoy);
		convoy++;
	}

	return result;
}

int sub_80173D0(void) {
	int i, j, item, result = 0;

	for (i = 1; i < 0x40; ++i) {
		struct Unit* unit = GetUnitStruct(i);

		if (!unit)
			continue;

		if (!unit->pCharacterData)
			continue;

		if (unit->state & (US_DEAD | US_BIT16))
			continue;

		// TODO: UNIT_ITEM_COUNT
		for (j = 0; (j < 5) && (item = unit->items[j]); ++j)
			result += GetItemGoldValue(item);
	}

	return result;
}

int sub_8017450(void) {
	int result = 0;

	result += GetConvoyTotalGoldValue();
	result += sub_80173D0();
	result += GetPartyGoldAmount();

	if (result > 9999999) // TODO: use a constant?
		result = 9999999;

	return result;
}

void sub_8017478(int item, u8 unk) {
	SetChapterUnk1C(GetItemType(item), unk);
}

s8 sub_80174AC(struct Unit* unit, int item) {
	return (GetChapterUnk1C(GetItemType(item)) == unit->pCharacterData->number) ? TRUE : FALSE;
}
