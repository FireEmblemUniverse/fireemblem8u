#include "global.h"

#include "fontgrp.h"
#include "icon.h"

#include "items.h"

#define ITEM_INDEX(aItem) ((aItem) & 0xFF)
#define ITEM_USES(aItem) ((aItem) >> 8)

#define ITEM_NAME_TXTID(aItem) (ITEM_INDEX(aItem)[gItemData].nameTextId)
#define ITEM_WPN_RANK(aItem) (ITEM_INDEX(aItem)[gItemData].weaponRank)
#define ITEM_WPN_TYPE(aItem) (ITEM_INDEX(aItem)[gItemData].weaponType)

u8 sub_80174AC(struct Unit* unit, int item);
u8 CanUnitNotUseMagic(struct Unit* unit);

static inline const struct ItemData* GetItemData(int itemIndex) {
	return gItemData + itemIndex;
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

static inline int GetItemIconId(int item) {
	if (!item)
		return -1;

	return GetItemData(ITEM_INDEX(item))->iconId;
}

u8 CanUnitUseAsWeapon(struct Unit* unit, int item) {
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

u8 CanUnitUseAsStaff(struct Unit* unit, int item) {
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

void DrawItemMenuCommand(struct TextHandle* text, int item, s8 isGrayed, u16* mapOut) {
	Text_SetParameters(text, 0, (isGrayed ? 0 : 1));

	GetStringFromIndex(ITEM_NAME_TXTID(item));
	Text_AppendString(text, FilterSomeTextFromStandardBuffer());

	Text_Draw(text, mapOut + 2);

	DrawDecNumber(mapOut + 11, isGrayed ? 2 : 1, GetItemDisplayUses(item));

	DrawIcon(mapOut, GetItemIconId(item), 0x4000);
}
