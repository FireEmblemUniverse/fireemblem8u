#include "global.h"

#include "fontgrp.h"
#include "icon.h"

#include "items.h"

#define ITEM_INDEX(aItem) ((aItem) & 0xFF)
#define ITEM_USES(aItem) ((aItem) >> 8)

#define ITEM_WPN_RANK(aItem) (ITEM_INDEX(aItem)[gItemData].weaponRank)
#define ITEM_WPN_TYPE(aItem) (ITEM_INDEX(aItem)[gItemData].weaponType)

u8 sub_80174AC(struct Unit* unit, int item);
u8 CanUnitNotUseMagic(struct Unit* unit);

// Effectiveness lists
extern const u8 gUnknown_088ADF2A[];
extern const u8 gUnknown_088ADEF1[];
extern const u8 gUnknown_088ADF39[]; // Slayer effectiveness list

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

static inline int GetItemDisplayUses(int item) {
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

static inline const u8* GetItemEffectivenessList(int item) {
	return GetItemData(ITEM_INDEX(item))->pEffectiveness;
}

s8 CanUnitUseAsWeapon(struct Unit* unit, int item) {
	if (item == 0)
		return FALSE;

	if (!(GetItemAttributes(item) & IA_WEAPON))
		return FALSE;

	if (GetItemAttributes(item) & (IA_LOCK_0 | IA_LOCK_1 | IA_LOCK_2 | IA_LOCK_3 | IA_LOCK_4 | IA_LOCK_5 | IA_LOCK_6 | IA_LOCK_7 | IA_UNUSABLE)) {
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

	DrawDecNumber(mapOut + 11, isGrayed ? 2 : 1, GetItemDisplayUses(item));

	DrawIcon(mapOut, GetItemIconId(item), 0x4000);
}

void sub_80168E0(struct TextHandle* text, int item, s8 isGrayed, u16* mapOut) {
	Text_SetParameters(text, 0, (isGrayed ? 0 : 1));
	Text_AppendString(text, GetItemNameStringStatic(item));

	Text_Draw(text, mapOut + 2);

	DrawDecNumber(mapOut + 10, isGrayed ? 2 : 1, GetItemDisplayUses(item));
	DrawDecNumber(mapOut + 13, isGrayed ? 2 : 1, GetItemMaxUses(item));
	sub_8004B0C(mapOut + 11, isGrayed ? 0 : 1, 0x16); // draw special character?

	DrawIcon(mapOut, GetItemIconId(item), 0x4000);
}

void DrawTextAndIconForItem(struct TextHandle* text, int item, u16* mapOut) {
	Text_SetXCursor(text, 0);
	Text_AppendString(text, GetItemNameStringStatic(item));

	Text_Draw(text, mapOut + 2);

	DrawDecNumber(mapOut + 11, Text_GetColorId(text), GetItemDisplayUses(item));

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
	DrawDecNumber(mapOut + 11, color, GetItemDisplayUses(item));
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

	}

	if (!effList)
		return FALSE;

	for (; *effList; ++effList)
		if (*effList == targetClass)
			goto is_effective;

	return FALSE;

	is_effective:
		return TRUE;
}
