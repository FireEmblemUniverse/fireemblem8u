#include "global.h"

#include <string.h>

#include "constants/items.h"

#include "bmitem.h"

// TODO: move elsewhere?
struct UnitDefinition {
	/* 00 */ u8  charIndex;
	/* 01 */ u8  classIndex;
	/* 02 */ u8  leaderCharIndex;

	/* 03 */ u8  autolevel  : 1;
	/* 03 */ u8  allegiance : 2;
	/* 03 */ u8  level      : 5;

	/* 04 */ u16 xPosition : 6; /* 04:0 to 04:5 */
	/* 04 */ u16 yPosition : 6; /* 04:6 to 05:3 */
	/* 05 */ u16 unk       : 2; /* 05:4 to 05:5 */
	/* 05 */ u16 sumFlag   : 1; /* 05:6 */
	/* 05 */ u16 extraData : 9; /* 05:7 to 06:7 */
	/* 07 */ u16 redaCount : 8;

	const void* redas;

	u8  items[4];
	u8  ai[4];
};

int GetPlayerLeaderUnitId(void);

extern struct Unit* gUnknown_0859A5D0[]; // unit lookup

// TODO: public!
static inline struct Unit* GetUnit(int id) {
	return gUnknown_0859A5D0[id & 0xFF];
}

void ClearUnits(void) {
	int i;

	for (i = 0; i < 0x100; ++i) {
		struct Unit* unit = GetUnit(i);

		if (unit) {
			ClearUnitStruct(unit);
			unit->index = i;
		}
	}
}

void ClearUnitStruct(struct Unit* unit) {
	u8 id = unit->index;
	CpuFill16(0, unit, sizeof(struct Unit));
	unit->index = id;
}

void CopyUnitStruct(struct Unit* from, struct Unit* to) {
	u8 id = to->index;
	memcpy(to, from, sizeof(struct Unit));
	to->index = id;
}


/* 
static inline struct Unit* GetUnusedUnit(int start, int end) {
	int i;

	for (i = start + 1; i < end; ++i) {
		struct Unit* unit = GetUnit(i);

		if (unit->pCharacterData == NULL)
			return unit;
	}

	return NULL;
}

struct Unit* GetNextFreeUnitStructPtr(int faction) {
	return GetUnusedUnit(faction, faction + 0x40);
}
// */

struct Unit* GetNextFreeUnitStructPtr(int faction) {
	int i, last = (faction + 0x40);

	for (i = faction + 1; i < last; ++i) {
		struct Unit* unit = GetUnit(i);

		if (unit->pCharacterData == NULL)
			return unit;
	}

	return NULL;
}

struct Unit* GetNextFreePlayerUnitStruct(struct UnitDefinition* uDef) {
	int i, max = 0x40;

	// This is ?? and is completely useless but it's required to produce matching asm
	if (uDef->charIndex == GetPlayerLeaderUnitId())
		++i;

	for (i = 1; i < max; ++i) {
		struct Unit* unit = GetUnit(i);

		if (unit->pCharacterData == NULL)
			return unit;
	}

	return NULL;
}

int GetUnitFogViewRange(struct Unit* unit) {
	int result = gUnknown_0202BCF0.chapterVisionRange;

	if (UNIT_ATTRIBUTES(unit) & CA_LOCKPICK)
		result += 5;

	return result + unit->torchDuration;
}

void SetUnitNewStatus(struct Unit* unit, int status) {
	if (status == 0) {
		unit->statusIndex    = 0;
		unit->statusDuration = 0;
	} else {
		unit->statusIndex    = status;
		unit->statusDuration = 5;
	}
}

void WriteUnitStatusDuration(struct Unit* unit, int status, int duration) {
	unit->statusIndex    = status;
	unit->statusDuration = duration;
}

int GetUnitSMSIndex(struct Unit* unit) {
	if (!(unit->state & US_IN_BALLISTA))
		return unit->pClassData->SMSId;

	switch (GetTrap(unit->ballistaIndex)->data[TRAP_EXTDATA_BLST_ITEMID]) {

		// TODO: SMS id definitions

	case ITEM_BALLISTA_REGULAR:
		return 0x58;

	case ITEM_BALLISTA_LONG:
		return 0x59;

	case ITEM_BALLISTA_KILLER:
		return 0x5A;

	default:
		return 0;

	} // switch (GetTrap(unit->ballistaIndex)->data[TRAP_EXTDATA_BLST_ITEMID])
}

s8 UnitAddItem(struct Unit* unit, int item) {
	int i;

	for (i = 0; i < UNIT_ITEM_COUNT; ++i) {
		if (unit->items[i] == 0) {
			unit->items[i] = item;
			return TRUE;
		}
	}

	return FALSE;
}

void UnitClearInventory(struct Unit* unit) {
	int i;

	for (i = 0; i < UNIT_ITEM_COUNT; ++i)
		unit->items[i] = 0;
}

void RemoveUnitBlankItems(struct Unit* unit) {
	u16 items[UNIT_ITEM_COUNT + 1], i;
	u16* it = items;

	// Build item buffer by iterating through unit's items and skipping blanks

	for (i = 0; i < UNIT_ITEM_COUNT; ++i) {
		if (unit->items[i])
			*it++ = unit->items[i];

		unit->items[i] = 0; // Null the item from the unit
	}

	*it = 0; // null-terminate buffer

	// Write buffered items

	for (i = 0; i < UNIT_ITEM_COUNT; ++i) {
		if (!items[i])
			return; // Stop now if we reached end of buffer

		unit->items[i] = items[i];
	}
}

int GetUnitItemCount(struct Unit* unit) {
	int i;

	for (i = UNIT_ITEM_COUNT - 1; i >= 0; --i)
		if (unit->items[i])
			return i + 1;

	return 0;
}

s8 UnitHasItem(struct Unit* unit, int item) {
	int i;

	item = GetItemIndex(item);

	for (i = 0; (i < UNIT_ITEM_COUNT) && unit->items[i]; ++i)
		if (GetItemIndex(unit->items[i]) == item)
			return TRUE;

	return FALSE;
}
