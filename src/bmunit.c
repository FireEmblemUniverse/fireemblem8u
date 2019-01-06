#include "global.h"

#include <string.h>

#include "constants/items.h"

#include "bmitem.h"

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

#if NONMATCHING

struct Unit* GetNextFreePlayerUnitStruct(const u8* unk) {
	int i, max = 0x40;

	GetPlayerLeaderUnitId() + *unk; // ??

	for (i = 1; i < max; ++i) {
		struct Unit* unit = GetUnit(i);

		if (unit->pCharacterData == NULL)
			return unit;
	}

	return NULL;
}

#else // NONMATCHING

__attribute__((naked))
struct Unit* GetNextFreePlayerUnitStruct(const u8* unk) {
	asm(
		".syntax unified\n"

		"push {r4, r5, lr}\n"
		"movs r5, #0x40\n"
		"ldrb r4, [r0]\n" // ???????????????????
		"bl GetPlayerLeaderUnitId\n"
		"movs r2, #1\n"
		"ldr r4, _08017894  @ gUnknown_0859A5D0\n"
		"movs r3, #0xff\n"
	"_08017880:\n"
		"adds r0, r2, #0\n"
		"ands r0, r3\n"
		"lsls r0, r0, #2\n"
		"adds r0, r0, r4\n"
		"ldr r1, [r0]\n"
		"ldr r0, [r1]\n"
		"cmp r0, #0\n"
		"bne _08017898\n"
		"adds r0, r1, #0\n"
		"b _080178A0\n"
		".align 2, 0\n"
	"_08017894: .4byte gUnknown_0859A5D0\n"
	"_08017898:\n"
		"adds r2, #1\n"
		"cmp r2, r5\n"
		"blt _08017880\n"
		"movs r0, #0\n"
	"_080178A0:\n"
		"pop {r4, r5}\n"
		"pop {r1}\n"
		"bx r1\n"

		".syntax divided\n"
	);
}

#endif // !NONMATCHING

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
