#include "global.h"

#include <string.h>

#include "constants/items.h"
#include "bmitem.h"

#include "bmunit.h"

EWRAM_DATA u8 gUnknown_0202BE44 = 0;
EWRAM_DATA struct { short x, y; } gUnknown_0202BE48 = {}; // TODO: struct Vec2?

EWRAM_DATA struct Unit gUnknown_0202BE4C[62] = {}; // Player units
EWRAM_DATA struct Unit gUnknown_0202CFBC[50] = {}; // Red units
EWRAM_DATA struct Unit gUnknown_0202DDCC[20] = {}; // Green units
EWRAM_DATA struct Unit gUnknown_0202E36C[5]  = {}; // Purple units

CONST_DATA int gUnknown_0859A598[] = {
	[UNIT_STATUS_NONE]     = 0x536,
	[UNIT_STATUS_POISON]   = 0x514,
	[UNIT_STATUS_SLEEP]    = 0x515,
	[UNIT_STATUS_SILENCED] = 0x516,
	[UNIT_STATUS_BERSERK]  = 0x517,

	// TODO: more status constants
	0x51B, 0x51C, 0x51D, 0x51E, 0x518, 0x519, 0x51A, 0, 0x51A
};

struct Unit* CONST_DATA gUnknown_0859A5D0[0x100] = { // unit lookup
	[FACTION_BLUE + 0x01] = gUnknown_0202BE4C + 0,
	[FACTION_BLUE + 0x02] = gUnknown_0202BE4C + 1,
	[FACTION_BLUE + 0x03] = gUnknown_0202BE4C + 2,
	[FACTION_BLUE + 0x04] = gUnknown_0202BE4C + 3,
	[FACTION_BLUE + 0x05] = gUnknown_0202BE4C + 4,
	[FACTION_BLUE + 0x06] = gUnknown_0202BE4C + 5,
	[FACTION_BLUE + 0x07] = gUnknown_0202BE4C + 6,
	[FACTION_BLUE + 0x08] = gUnknown_0202BE4C + 7,
	[FACTION_BLUE + 0x09] = gUnknown_0202BE4C + 8,
	[FACTION_BLUE + 0x0A] = gUnknown_0202BE4C + 9,
	[FACTION_BLUE + 0x0B] = gUnknown_0202BE4C + 10,
	[FACTION_BLUE + 0x0C] = gUnknown_0202BE4C + 11,
	[FACTION_BLUE + 0x0D] = gUnknown_0202BE4C + 12,
	[FACTION_BLUE + 0x0E] = gUnknown_0202BE4C + 13,
	[FACTION_BLUE + 0x0F] = gUnknown_0202BE4C + 14,
	[FACTION_BLUE + 0x10] = gUnknown_0202BE4C + 15,
	[FACTION_BLUE + 0x11] = gUnknown_0202BE4C + 16,
	[FACTION_BLUE + 0x12] = gUnknown_0202BE4C + 17,
	[FACTION_BLUE + 0x13] = gUnknown_0202BE4C + 18,
	[FACTION_BLUE + 0x14] = gUnknown_0202BE4C + 19,
	[FACTION_BLUE + 0x15] = gUnknown_0202BE4C + 20,
	[FACTION_BLUE + 0x16] = gUnknown_0202BE4C + 21,
	[FACTION_BLUE + 0x17] = gUnknown_0202BE4C + 22,
	[FACTION_BLUE + 0x18] = gUnknown_0202BE4C + 23,
	[FACTION_BLUE + 0x19] = gUnknown_0202BE4C + 24,
	[FACTION_BLUE + 0x1A] = gUnknown_0202BE4C + 25,
	[FACTION_BLUE + 0x1B] = gUnknown_0202BE4C + 26,
	[FACTION_BLUE + 0x1C] = gUnknown_0202BE4C + 27,
	[FACTION_BLUE + 0x1D] = gUnknown_0202BE4C + 28,
	[FACTION_BLUE + 0x1E] = gUnknown_0202BE4C + 29,
	[FACTION_BLUE + 0x1F] = gUnknown_0202BE4C + 30,
	[FACTION_BLUE + 0x20] = gUnknown_0202BE4C + 31,
	[FACTION_BLUE + 0x21] = gUnknown_0202BE4C + 32,
	[FACTION_BLUE + 0x22] = gUnknown_0202BE4C + 33,
	[FACTION_BLUE + 0x23] = gUnknown_0202BE4C + 34,
	[FACTION_BLUE + 0x24] = gUnknown_0202BE4C + 35,
	[FACTION_BLUE + 0x25] = gUnknown_0202BE4C + 36,
	[FACTION_BLUE + 0x26] = gUnknown_0202BE4C + 37,
	[FACTION_BLUE + 0x27] = gUnknown_0202BE4C + 38,
	[FACTION_BLUE + 0x28] = gUnknown_0202BE4C + 39,
	[FACTION_BLUE + 0x29] = gUnknown_0202BE4C + 40,
	[FACTION_BLUE + 0x2A] = gUnknown_0202BE4C + 41,
	[FACTION_BLUE + 0x2B] = gUnknown_0202BE4C + 42,
	[FACTION_BLUE + 0x2C] = gUnknown_0202BE4C + 43,
	[FACTION_BLUE + 0x2D] = gUnknown_0202BE4C + 44,
	[FACTION_BLUE + 0x2E] = gUnknown_0202BE4C + 45,
	[FACTION_BLUE + 0x2F] = gUnknown_0202BE4C + 46,
	[FACTION_BLUE + 0x30] = gUnknown_0202BE4C + 47,
	[FACTION_BLUE + 0x31] = gUnknown_0202BE4C + 48,
	[FACTION_BLUE + 0x32] = gUnknown_0202BE4C + 49,
	[FACTION_BLUE + 0x33] = gUnknown_0202BE4C + 50,
	[FACTION_BLUE + 0x34] = gUnknown_0202BE4C + 51,
	[FACTION_BLUE + 0x35] = gUnknown_0202BE4C + 52,
	[FACTION_BLUE + 0x36] = gUnknown_0202BE4C + 53,
	[FACTION_BLUE + 0x37] = gUnknown_0202BE4C + 54,
	[FACTION_BLUE + 0x38] = gUnknown_0202BE4C + 55,
	[FACTION_BLUE + 0x39] = gUnknown_0202BE4C + 56,
	[FACTION_BLUE + 0x3A] = gUnknown_0202BE4C + 57,
	[FACTION_BLUE + 0x3B] = gUnknown_0202BE4C + 58,
	[FACTION_BLUE + 0x3C] = gUnknown_0202BE4C + 59,
	[FACTION_BLUE + 0x3D] = gUnknown_0202BE4C + 60,
	[FACTION_BLUE + 0x3E] = gUnknown_0202BE4C + 61,

	[FACTION_RED + 0x01] = gUnknown_0202CFBC + 0,
	[FACTION_RED + 0x02] = gUnknown_0202CFBC + 1,
	[FACTION_RED + 0x03] = gUnknown_0202CFBC + 2,
	[FACTION_RED + 0x04] = gUnknown_0202CFBC + 3,
	[FACTION_RED + 0x05] = gUnknown_0202CFBC + 4,
	[FACTION_RED + 0x06] = gUnknown_0202CFBC + 5,
	[FACTION_RED + 0x07] = gUnknown_0202CFBC + 6,
	[FACTION_RED + 0x08] = gUnknown_0202CFBC + 7,
	[FACTION_RED + 0x09] = gUnknown_0202CFBC + 8,
	[FACTION_RED + 0x0A] = gUnknown_0202CFBC + 9,
	[FACTION_RED + 0x0B] = gUnknown_0202CFBC + 10,
	[FACTION_RED + 0x0C] = gUnknown_0202CFBC + 11,
	[FACTION_RED + 0x0D] = gUnknown_0202CFBC + 12,
	[FACTION_RED + 0x0E] = gUnknown_0202CFBC + 13,
	[FACTION_RED + 0x0F] = gUnknown_0202CFBC + 14,
	[FACTION_RED + 0x10] = gUnknown_0202CFBC + 15,
	[FACTION_RED + 0x11] = gUnknown_0202CFBC + 16,
	[FACTION_RED + 0x12] = gUnknown_0202CFBC + 17,
	[FACTION_RED + 0x13] = gUnknown_0202CFBC + 18,
	[FACTION_RED + 0x14] = gUnknown_0202CFBC + 19,
	[FACTION_RED + 0x15] = gUnknown_0202CFBC + 20,
	[FACTION_RED + 0x16] = gUnknown_0202CFBC + 21,
	[FACTION_RED + 0x17] = gUnknown_0202CFBC + 22,
	[FACTION_RED + 0x18] = gUnknown_0202CFBC + 23,
	[FACTION_RED + 0x19] = gUnknown_0202CFBC + 24,
	[FACTION_RED + 0x1A] = gUnknown_0202CFBC + 25,
	[FACTION_RED + 0x1B] = gUnknown_0202CFBC + 26,
	[FACTION_RED + 0x1C] = gUnknown_0202CFBC + 27,
	[FACTION_RED + 0x1D] = gUnknown_0202CFBC + 28,
	[FACTION_RED + 0x1E] = gUnknown_0202CFBC + 29,
	[FACTION_RED + 0x1F] = gUnknown_0202CFBC + 30,
	[FACTION_RED + 0x20] = gUnknown_0202CFBC + 31,
	[FACTION_RED + 0x21] = gUnknown_0202CFBC + 32,
	[FACTION_RED + 0x22] = gUnknown_0202CFBC + 33,
	[FACTION_RED + 0x23] = gUnknown_0202CFBC + 34,
	[FACTION_RED + 0x24] = gUnknown_0202CFBC + 35,
	[FACTION_RED + 0x25] = gUnknown_0202CFBC + 36,
	[FACTION_RED + 0x26] = gUnknown_0202CFBC + 37,
	[FACTION_RED + 0x27] = gUnknown_0202CFBC + 38,
	[FACTION_RED + 0x28] = gUnknown_0202CFBC + 39,
	[FACTION_RED + 0x29] = gUnknown_0202CFBC + 40,
	[FACTION_RED + 0x2A] = gUnknown_0202CFBC + 41,
	[FACTION_RED + 0x2B] = gUnknown_0202CFBC + 42,
	[FACTION_RED + 0x2C] = gUnknown_0202CFBC + 43,
	[FACTION_RED + 0x2D] = gUnknown_0202CFBC + 44,
	[FACTION_RED + 0x2E] = gUnknown_0202CFBC + 45,
	[FACTION_RED + 0x2F] = gUnknown_0202CFBC + 46,
	[FACTION_RED + 0x30] = gUnknown_0202CFBC + 47,
	[FACTION_RED + 0x31] = gUnknown_0202CFBC + 48,
	[FACTION_RED + 0x32] = gUnknown_0202CFBC + 49,

	[FACTION_GREEN + 0x01] = gUnknown_0202DDCC + 0,
	[FACTION_GREEN + 0x02] = gUnknown_0202DDCC + 1,
	[FACTION_GREEN + 0x03] = gUnknown_0202DDCC + 2,
	[FACTION_GREEN + 0x04] = gUnknown_0202DDCC + 3,
	[FACTION_GREEN + 0x05] = gUnknown_0202DDCC + 4,
	[FACTION_GREEN + 0x06] = gUnknown_0202DDCC + 5,
	[FACTION_GREEN + 0x07] = gUnknown_0202DDCC + 6,
	[FACTION_GREEN + 0x08] = gUnknown_0202DDCC + 7,
	[FACTION_GREEN + 0x09] = gUnknown_0202DDCC + 8,
	[FACTION_GREEN + 0x0A] = gUnknown_0202DDCC + 9,
	[FACTION_GREEN + 0x0B] = gUnknown_0202DDCC + 10,
	[FACTION_GREEN + 0x0C] = gUnknown_0202DDCC + 11,
	[FACTION_GREEN + 0x0D] = gUnknown_0202DDCC + 12,
	[FACTION_GREEN + 0x0E] = gUnknown_0202DDCC + 13,
	[FACTION_GREEN + 0x0F] = gUnknown_0202DDCC + 14,
	[FACTION_GREEN + 0x10] = gUnknown_0202DDCC + 15,
	[FACTION_GREEN + 0x11] = gUnknown_0202DDCC + 16,
	[FACTION_GREEN + 0x12] = gUnknown_0202DDCC + 17,
	[FACTION_GREEN + 0x13] = gUnknown_0202DDCC + 18,
	[FACTION_GREEN + 0x14] = gUnknown_0202DDCC + 19,

	[FACTION_PURPLE + 0x01] = gUnknown_0202E36C + 0,
	[FACTION_PURPLE + 0x02] = gUnknown_0202E36C + 1,
	[FACTION_PURPLE + 0x03] = gUnknown_0202E36C + 2,
	[FACTION_PURPLE + 0x04] = gUnknown_0202E36C + 3,
	[FACTION_PURPLE + 0x05] = gUnknown_0202E36C + 4,
};

inline struct Unit* GetUnitStruct(int id) {
	return gUnknown_0859A5D0[id & 0xFF];
}

inline const struct ClassData* GetROMClassStruct(int classId) {
	if (classId < 1)
		return NULL;

	return gUnknown_08807164 + (classId - 1);
}

inline const struct CharacterData* GetROMCharStruct(int charId) {
	if (charId < 1)
		return NULL;

	return gUnknown_08803D64 + (charId - 1);
}

void ClearUnits(void) {
	int i;

	for (i = 0; i < 0x100; ++i) {
		struct Unit* unit = GetUnitStruct(i);

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

struct Unit* GetNextFreeUnitStructPtr(int faction) {
	int i, last = (faction + 0x40);

	for (i = faction + 1; i < last; ++i) {
		struct Unit* unit = GetUnitStruct(i);

		if (unit->pCharacterData == NULL)
			return unit;
	}

	return NULL;
}

struct Unit* GetNextFreePlayerUnitStruct(const struct UnitDefinition* uDef) {
	int i, max = 0x40;

	// This is ?? and is completely useless but it's required to produce matching asm
	if (uDef->charIndex == GetPlayerLeaderUnitId())
		++i;

	for (i = 1; i < max; ++i) {
		struct Unit* unit = GetUnitStruct(i);

		if (unit->pCharacterData == NULL)
			return unit;
	}

	return NULL;
}

inline int GetUnitMaxHP(struct Unit* unit) {
	return unit->maxHP + GetItemHpBonus(GetUnitEquippedWeapon(unit));
}

inline int GetUnitCurrentHP(struct Unit* unit) {
	if (unit->curHP > GetUnitMaxHP(unit))
		unit->curHP = GetUnitMaxHP(unit);

	return unit->curHP;
}

inline int GetUnitPower(struct Unit* unit) {
	return unit->pow + GetItemPowBonus(GetUnitEquippedWeapon(unit));
}

inline int GetUnitSkill(struct Unit* unit) {
	int item = GetUnitEquippedWeapon(unit);

	if (unit->state & US_RESCUING)
		return unit->skl / 2 + GetItemSklBonus(item);

	return unit->skl + GetItemSklBonus(item);
}

inline int GetUnitSpeed(struct Unit* unit) {
	int item = GetUnitEquippedWeapon(unit);

	if (unit->state & US_RESCUING)
		return unit->spd / 2 + GetItemSpdBonus(item);

	return unit->spd + GetItemSpdBonus(item);
}

inline int GetUnitDefense(struct Unit* unit) {
	return unit->def + GetItemDefBonus(GetUnitEquippedWeapon(unit));
}

inline int GetUnitResistance(struct Unit* unit) {
	return unit->res + GetItemResBonus(GetUnitEquippedWeapon(unit)) + unit->barrierDuration;
}

inline int GetUnitLuck(struct Unit* unit) {
	return unit->lck + GetItemLckBonus(GetUnitEquippedWeapon(unit));
}

inline int GetUnitPortraitId(struct Unit* unit) {
	if (unit->pCharacterData->portraitId) {
		// TODO: PORTRAIT_LYON?
		if (gUnknown_0202BCF0.chapterIndex == 0x22 && unit->pCharacterData->portraitId == 0x4A)
			return 0x46;

		return unit->pCharacterData->portraitId;
	}

	if (unit->pClassData->defaultPortraitId)
		return unit->pClassData->defaultPortraitId;

	return 0;
}

inline int GetUnitMiniPortraitId(struct Unit* unit) {
	if (unit->pCharacterData->miniPortrait)
		return 0x7F00 + unit->pCharacterData->miniPortrait;

	return GetUnitPortraitId(unit);
}

inline int GetUnitLeader(struct Unit* unit) {
	if (!(unit->index & 0xC0))
		return 0;

	return unit->unitLeader;
}

inline void sub_8019360(struct Unit* unit, int charId) {
	unit->unitLeader = charId;
}

inline void SetUnitHP(struct Unit* unit, int value) {
	unit->curHP = value;

	if (unit->curHP > GetUnitMaxHP(unit))
		unit->curHP = GetUnitMaxHP(unit);
}

inline void UnitTryHeal(struct Unit* unit, int amount) {
	int hp = unit->curHP;

	hp += amount;

	if (hp > GetUnitMaxHP(unit))
		hp = GetUnitMaxHP(unit);

	if (hp < 0)
		hp = 0;

	unit->curHP = hp;
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

inline char* WriteStatusTextToRAM(struct Unit* unit) {
	return GetStringFromIndex(gUnknown_0859A598[unit->statusIndex]);
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

inline void UnitRemoveItem(struct Unit* unit, int slot) {
	unit->items[slot] = 0;
	RemoveUnitBlankItems(unit);
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

	for (i = (UNIT_ITEM_COUNT - 1); i >= 0; --i)
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

int LoadUnits(const struct UnitDefinition* uDef) {
	int count = 0;

	while (uDef->charIndex) {
		LoadUnit(uDef);

		uDef++;
		count++;
	}

	return count;
}

void sub_8017A54(struct Unit* unit) { // unused
	if (unit->pow >= 4)
		unit->pow /= 2;

	if (unit->def >= 4)
		unit->def /= 2;

	if (unit->res >= 4)
		unit->res /= 2;
}

s8 HasClassWRank(u8 classId, u8 wpnType) {
	if (GetROMClassStruct(classId)->baseRanks[wpnType])
		return TRUE;
	else
		return FALSE;
}

struct Unit* LoadUnit(const struct UnitDefinition* uDef) {
	struct UnitDefinition buf;

	struct Unit* unit = NULL;

	if (uDef->genMonster) {
		u16 monsterClass = GenerateMonsterClass(uDef->classIndex);

		buf = *uDef;

		buf.autolevel = TRUE;
		buf.classIndex = monsterClass;
		buf.level = GenerateMonsterLevel(uDef->level);

		{
			u32 packedItems = GenerateMonsterItems(monsterClass);

			// ew
			u16 item1 = packedItems >> 16;
			u16 item2 = packedItems & 0xFFFF;

			buf.items[0] = item1;
			buf.items[1] = item2;
			buf.items[2] = 0;
			buf.items[3] = 0;

			if ((GetItemWeaponEffect(item1) == 1) || !item2)
				buf.itemDrop = FALSE;
			else
				buf.itemDrop = TRUE;

			if (item1 == ITEM_MONSTER_SHADOWSHT || item1 == ITEM_MONSTER_STONE) {
				// Add another weapon item if weapon is either Shadowshot or Stone

				buf.items[2] = buf.items[1];

				switch (monsterClass) {

				case CLASS_MOGALL:
					buf.items[1] = ITEM_MONSTER_EVILEYE;
					break;

				case CLASS_ARCHMOGALL:
					buf.items[1] = ITEM_MONSTER_CRIMSNEYE;
					break;

				case CLASS_GORGON:
					buf.items[1] = ITEM_MONSTER_DEMONSURG;

				} // switch (monsterClass)
			}
		}

		if (HasClassWRank(monsterClass, ITYPE_BOW) == TRUE) {
			// TODO: AI BIT DEFINITIONS
			buf.ai.ai3 = buf.ai.ai3 & (1 | 2 | 4);
			buf.ai.ai3 = buf.ai.ai3 | (8 | 32);
		}

		uDef = &buf;
	} // (uDef->genMonster)

	switch (uDef->allegiance) {

		// TODO: unit definition faction constants

	case 0:
		unit = GetNextFreePlayerUnitStruct(uDef);
		break;

	case 2:
		unit = GetNextFreeUnitStructPtr(0x80);
		break;

	case 1:
		unit = GetNextFreeUnitStructPtr(0x40);
		break;

	} // switch (uDef->allegiance)

	if (!unit)
		return NULL;

	ClearUnitStruct(unit);

	StoreNewUnitFromCode(unit, uDef);
	LoadUnitStats(unit, unit->pCharacterData);
	HideIfUnderRoof(unit);

	if (UNIT_IS_GORGON_EGG(unit))
		SetUnitNewStatus(unit, UNIT_STATUS_10);

	if (uDef->autolevel) {
		if (UNIT_FACTION(unit) == FACTION_BLUE) {
			AutolevelRealistic(unit);
			AutolevelUnitWeaponRanks(unit, uDef);
		} else {
			if ((UNIT_ATTRIBUTES(unit) & CA_BOSS) || (unit->pCharacterData->number < 0x40)) {
				struct Unit* unit2 = GetNextFreeUnitStructPtr(0);

				CopyUnitStruct(unit, unit2);

				unit2->exp = 0;
				AutolevelRealistic(unit2);

				ClearUnitStruct(unit);
				CopyUnitStruct(unit2, unit);

				ClearUnitStruct(unit2);

				unit->exp   = UNIT_EXP_DISABLED;
				unit->level = uDef->level;
			} else
				AutolevelUnit(unit);

			AutolevelUnitWeaponRanks(unit, uDef);
			unit->unitLeader = uDef->leaderCharIndex;
		}

		if (UNIT_IS_GORGON_EGG(unit))
			unit->maxHP = (unit->level + 1) * 5;
	} // if (uDef->autolevel)

	FixROMUnitStructPtr(unit);
	LoadUnitSupports(unit);

	if (uDef->itemDrop)
		unit->state |= US_DROP_ITEM;

	CheckForStatCaps(unit);

	unit->curHP = GetUnitMaxHP(unit);

	if (UNIT_IS_GORGON_EGG(unit))
		SetUnitHP(unit, 5);

	return unit;
}

void StoreNewUnitFromCode(struct Unit* unit, const struct UnitDefinition* uDef) {
	unit->pCharacterData = GetROMCharStruct(uDef->charIndex);

	if (uDef->classIndex)
		unit->pClassData = GetROMClassStruct(uDef->classIndex);
	else // such an overlooked feature
		unit->pClassData = GetROMClassStruct(unit->pCharacterData->defaultClass);

	unit->level = uDef->level;

	GetPreferredPositionForUNIT(uDef, &unit->xPos, &unit->yPos, FALSE);

	if (UNIT_IS_GORGON_EGG(unit)) {
		int i;

		// For gorgon eggs, set first item to zero
		// And store the other item ids in slots 1 through 4 for later initialization

		unit->items[0] = 0;

		for (i = 0; i < UNIT_DEFINITION_ITEM_COUNT; ++i)
			unit->items[i + 1] = uDef->items[i];
	} else {
		int i;

		for (i = 0; (i < UNIT_DEFINITION_ITEM_COUNT) && (uDef->items[i]); ++i)
			UnitAddItem(unit, MakeNewItem(uDef->items[i]));
	}

	CharStoreAI(unit, uDef);
}

void CharFillInventoryFromCode(struct Unit* unit, const struct UnitDefinition* uDef) {
	int i;

	UnitClearInventory(unit);

	for (i = 0; (i < UNIT_DEFINITION_ITEM_COUNT) && (uDef->items[i]); ++i)
		UnitAddItem(unit, MakeNewItem(uDef->items[i]));
}

void LoadUnitStats(struct Unit* unit, const struct CharacterData* character) {
	int i;

	unit->maxHP = character->baseHP + unit->pClassData->baseHP;
	unit->pow   = character->basePow + unit->pClassData->basePow;
	unit->skl   = character->baseSkl + unit->pClassData->baseSkl;
	unit->spd   = character->baseSpd + unit->pClassData->baseSpd;
	unit->def   = character->baseDef + unit->pClassData->baseDef;
	unit->res   = character->baseRes + unit->pClassData->baseRes;
	unit->lck   = character->baseLck;

	unit->conBonus = 0;

	for (i = 0; i < 8; ++i) {
		unit->ranks[i] = unit->pClassData->baseRanks[i];

		if (unit->pCharacterData->baseRanks[i])
			unit->ranks[i] = unit->pCharacterData->baseRanks[i];
	}

	if (UNIT_FACTION(unit) == FACTION_BLUE && (unit->level != UNIT_LEVEL_MAX))
		unit->exp = 0;
	else
		unit->exp = UNIT_EXP_DISABLED;
}

void FixROMUnitStructPtr(struct Unit* unit) {
	// TODO: investigate why

	if (UNIT_ATTRIBUTES(unit) & CA_BIT_23)
		unit->pCharacterData = GetROMCharStruct(unit->pCharacterData->number - 1);
}

void LoadUnitSupports(struct Unit* unit) {
	int i, count = GetROMUnitSupportCount(unit);

	for (i = 0; i < count; ++i)
		unit->supports[i] = GetUnitStartingSupportValue(unit, i);
}

void AutolevelUnitWeaponRanks(struct Unit* unit, const struct UnitDefinition* uDef) {
	if (uDef->autolevel) {
		int i;

		for (i = 0; i < GetUnitItemCount(unit); ++i) {
			int wType, item = unit->items[i];

			if (!(GetItemAttributes(item) & IA_REQUIRES_WEXP))
				continue;

			if (GetItemAttributes(item) & IA_WEAPON)
				if (CanUnitUseWeapon(unit, item))
					continue;

			if (GetItemAttributes(item) & IA_STAFF)
				if (CanUnitUseStaff(unit, item))
					continue;

			if (GetItemAttributes(item) & IA_LOCK_ANY)
				continue;

			wType = GetItemType(item);

			if (unit->ranks[wType] == 0)
				item = 0;

			unit->ranks[wType] = GetItemRequiredExp(item);
		}
	}
}

void IncreaseUnitStatsByLevelCount(struct Unit* unit, u8 classId, int levelCount) {
	if (levelCount) {
		unit->maxHP += GetAutoleveledStat(unit->pClassData->growthHP,  levelCount);
		unit->pow   += GetAutoleveledStat(unit->pClassData->growthPow, levelCount);
		unit->skl   += GetAutoleveledStat(unit->pClassData->growthSkl, levelCount);
		unit->spd   += GetAutoleveledStat(unit->pClassData->growthSpd, levelCount);
		unit->def   += GetAutoleveledStat(unit->pClassData->growthDef, levelCount);
		unit->res   += GetAutoleveledStat(unit->pClassData->growthRes, levelCount);
		unit->lck   += GetAutoleveledStat(unit->pClassData->growthLck, levelCount);
	}
}

void StoreUnitStats(struct Unit* unit, u8 classId, int levelCount) {
	int level = unit->level;

	if (levelCount && level > unit->pCharacterData->baseLevel) {
		levelCount = level - levelCount;

		unit->maxHP = unit->pCharacterData->baseHP  + unit->pClassData->baseHP;
		unit->pow   = unit->pCharacterData->basePow + unit->pClassData->basePow;
		unit->skl   = unit->pCharacterData->baseSkl + unit->pClassData->baseSkl;
		unit->spd   = unit->pCharacterData->baseSpd + unit->pClassData->baseSpd;
		unit->def   = unit->pCharacterData->baseDef + unit->pClassData->baseDef;
		unit->res   = unit->pCharacterData->baseRes + unit->pClassData->baseRes;
		unit->lck   = unit->pCharacterData->baseLck;

		if (levelCount > unit->pCharacterData->baseLevel) {
			unit->level = levelCount;
			AutolevelUnit(unit);
			unit->level = level;
		}
	}
}

void sub_80180CC(struct Unit* unit, int levelCount) {
	if (levelCount && !UNIT_IS_GORGON_EGG(unit)) {
		if (levelCount > 0)
			IncreaseUnitStatsByLevelCount(unit, unit->pClassData->number, levelCount);
		else if (levelCount < 0)
			StoreUnitStats(unit, unit->pClassData->number, -levelCount);

		CheckForStatCaps(unit);

		unit->curHP = GetUnitMaxHP(unit);
	}
}

void AutolevelUnit(struct Unit* unit) {
	if (UNIT_ATTRIBUTES(unit) & CA_PROMOTED)
		IncreaseUnitStatsByLevelCount(unit, unit->pClassData->promotion, GetCurrentPromotedLevelBonus());

	IncreaseUnitStatsByLevelCount(unit, unit->pClassData->number, unit->level - 1);
}

void AutolevelRealistic(struct Unit* unit) {
	struct BattleUnit tmpBattleUnit;
	short levelsLeft;

	tmpBattleUnit.expGain = 0;

	levelsLeft = (unit->level - unit->pCharacterData->baseLevel);

	if (levelsLeft) {
		for (unit->level -= levelsLeft; levelsLeft > 0; --levelsLeft) {
			CopyUnitToBattleStruct(&tmpBattleUnit, unit);

			tmpBattleUnit.unit.exp += 100;
			CheckForLevelUp(&tmpBattleUnit);

			SaveUnitFromBattle(unit, &tmpBattleUnit);
		}
	}
}

void CheckForStatCaps(struct Unit* unit) {
	if (unit->maxHP > UNIT_MHP_MAX(unit))
		unit->maxHP = UNIT_MHP_MAX(unit);

	if (unit->pow > UNIT_POW_MAX(unit))
		unit->pow = UNIT_POW_MAX(unit);

	if (unit->skl > UNIT_SKL_MAX(unit))
		unit->skl = UNIT_SKL_MAX(unit);

	if (unit->spd > UNIT_SPD_MAX(unit))
		unit->spd = UNIT_SPD_MAX(unit);

	if (unit->def > UNIT_DEF_MAX(unit))
		unit->def = UNIT_DEF_MAX(unit);

	if (unit->res > UNIT_RES_MAX(unit))
		unit->res = UNIT_RES_MAX(unit);

	if (unit->lck > UNIT_LCK_MAX(unit))
		unit->lck = UNIT_LCK_MAX(unit);

	if (unit->conBonus > (UNIT_CON_MAX(unit) - UNIT_CON_BASE(unit)))
		unit->conBonus = (UNIT_CON_MAX(unit) - UNIT_CON_BASE(unit));

	if (unit->movBonus > (UNIT_MOV_MAX(unit) - UNIT_MOV_BASE(unit)))
		unit->movBonus = (UNIT_MOV_MAX(unit) - UNIT_MOV_BASE(unit));
}

struct Unit* GetUnitByCharId(int charId) {
	int i;

	for (i = 1; i < 0x100; ++i) {
		struct Unit* unit = GetUnitStruct(i);

		if (UNIT_IS_VALID(unit) && unit->pCharacterData->number == charId)
			return unit;
	}

	return NULL;
}

struct Unit* GetNonAllyUnitStructById(int charId, int faction) {
	int i, last = faction + 0x40;

	for (i = faction + 1; i < last; ++i) {
		struct Unit* unit = GetUnitStruct(i);

		if (UNIT_IS_VALID(unit) && unit->pCharacterData->number == charId)
			return unit;
	}

	return NULL;
}

s8 CanUnitRescue(struct Unit* actor, struct Unit* target) {
	int actorAid  = GetUnitAid(actor);
	int targetCon = UNIT_CON(target);

	return (actorAid >= targetCon) ? TRUE : FALSE;
}

void UnitRescue(struct Unit* actor, struct Unit* target) {
	actor->state  |= US_RESCUING;
	target->state |= US_RESCUED | US_HIDDEN;

	actor->rescueOtherUnit = target->index;
	target->rescueOtherUnit = actor->index;

	target->xPos = actor->xPos;
	target->yPos = actor->yPos;
}

void UpdateRescuingData(struct Unit* actor, int xTarget, int yTarget) {
	struct Unit* target = GetUnitStruct(actor->rescueOtherUnit);

	actor->state = actor->state &~ (US_RESCUING | US_RESCUED);
	target->state = target->state &~ (US_RESCUING | US_RESCUED | US_HIDDEN);

	if (UNIT_FACTION(target) == gUnknown_0202BCF0.chapterPhaseIndex)
		target->state |= US_UNSELECTABLE; // TODO: US_GRAYED

	actor->rescueOtherUnit = 0;
	target->rescueOtherUnit = 0;

	target->xPos = xTarget;
	target->yPos = yTarget;
}

s8 UpdateRescueData(struct Unit* actor, struct Unit* target) {
	struct Unit* rescuee = GetUnitStruct(actor->rescueOtherUnit);

	// no used be needed to match etc
	int couldGive = CanUnitRescue(target, rescuee);

	UpdateRescuingData(actor, 0, 0);
	UnitRescue(target, rescuee);

	// return couldGive; // devs probably forgot to add this
}

inline char* GetRescuingUnitNameId(struct Unit* unit) {
	if (!unit->rescueOtherUnit)
		return GetStringFromIndex(gUnknown_0859A598[0]);

	return GetStringFromIndex(GetUnitStruct(unit->rescueOtherUnit)->pCharacterData->nameTextId);
}

void sub_80183FC(struct Unit* unit) {
	if (UNIT_FACTION(unit) == FACTION_BLUE) {
		if (UNIT_IS_PHANTOM(unit))
			unit->pCharacterData = NULL;
		else {
			unit->state |= US_DEAD | US_HIDDEN;
			sub_80283E0(unit);
		}
	} else
		unit->pCharacterData = NULL;
}

void HandleAllegianceChange(struct Unit* unit, int faction) {
	struct Unit* newUnit = GetNextFreeUnitStructPtr(faction);

	if (gUnknown_03004E50 == unit)
		gUnknown_03004E50 = newUnit;

	CopyUnitStruct(unit, newUnit);
	ClearUnitStruct(unit);

	if (newUnit->exp == UNIT_EXP_DISABLED) {
		if ((faction == FACTION_BLUE) && (newUnit->level != UNIT_LEVEL_MAX))
			newUnit->exp = 0;
		else
			newUnit->exp = UNIT_EXP_DISABLED;
	}

	newUnit->state = newUnit->state &~ US_DROP_ITEM;

	if (newUnit->rescueOtherUnit)
		GetUnitStruct(newUnit->rescueOtherUnit)->rescueOtherUnit = newUnit->index;
}

inline s8 CanUnitCrossTerrain(struct Unit* unit, int terrain) {
	const s8* lookup = GetMovCostTablePtr(unit);
	return (lookup[terrain] > 0) ? TRUE : FALSE;
}

void ApplyUnitMovement(struct Unit* unit) {
	if (unit->state & US_RESCUING) {
		struct Unit* rescuee = GetUnitStruct(unit->rescueOtherUnit);

		rescuee->xPos = unit->xPos;
		rescuee->yPos = unit->yPos;
	}

	if (unit->state & US_IN_BALLISTA) {
		struct Trap* trap = GetTrap(unit->ballistaIndex);

		trap->xPos = unit->xPos;
		trap->yPos = unit->yPos;
	}
}

void sub_80184E0(struct Unit* unit, int* xOut, int* yOut) {
	int iy, ix, minDistance = 9999;
	struct Unit* rescuee = GetUnitStruct(unit->rescueOtherUnit);

	// Fill the movement map
	FillMovementMapSomehow(unit->xPos, unit->yPos, gUnknown_0880BB96);

	// Put the active unit on the unit map (kinda, just marking its spot)
	gUnknown_0202E4D8[gUnknown_03004E50->yPos][gUnknown_03004E50->xPos] = 0xFF;

	// Remove the actor unit from the unit map (why?)
	gUnknown_0202E4D8[unit->yPos][unit->xPos] = 0;

	for (iy = gUnknown_0202E4D4.height - 1; iy >= 0; --iy) {
		for (ix = gUnknown_0202E4D4.width - 1; ix >= 0; --ix) {
			int distance;

			if (gUnknown_0202E4E0[iy][ix] > MAP_MOVEMENT_MAX)
				continue;

			if (gUnknown_0202E4D8[iy][ix] != 0)
				continue;

			if (gUnknown_0202E4EC[iy][ix] & HIDDEN_BIT_UNIT)
				continue;

			if (!CanUnitCrossTerrain(rescuee, gUnknown_0202E4DC[iy][ix]))
				continue;

			distance = RECT_DISTANCE(ix, iy, unit->xPos, unit->yPos);

			if (minDistance >= distance) {
				minDistance = distance;

				*xOut = ix;
				*yOut = iy;
			}
		}
	}

	// Remove the active unit from the unit map again
	gUnknown_0202E4D8[gUnknown_03004E50->yPos][gUnknown_03004E50->xPos] = 0;
}

void SetupActiveUnit(struct Unit* unit) {
	gUnknown_03004E50 = unit;
	gUnknown_0202BE44 = unit->index;

	gUnknown_0202BE48.x = unit->xPos;
	gUnknown_0202BE48.y = unit->yPos;

	gUnknown_0203A958.subjectIndex = unit->index;
	gUnknown_0203A958.unitActionType = 0;
	gUnknown_0203A958.moveCount = 0;

	gUnknown_0202BCB0.unk3D = 0;
	gUnknown_0202BCB0.unk3F = 0xFF;

	NullSomeStuff();

	gUnknown_03004E50->state |= US_HIDDEN;
	gUnknown_0202E4D8[unit->yPos][unit->xPos] = 0;
}

void SetActiveUnit(struct Unit* unit) {
	gUnknown_03004E50 = unit;
	gUnknown_0202BE44 = unit->index;

	gUnknown_0202BE48.x = unit->xPos;
	gUnknown_0202BE48.y = unit->yPos;

	gUnknown_0203A958.unitActionType = 0;

	gUnknown_0202BCB0.unk3D = 0;

	NullSomeStuff();

	gUnknown_03004E50->state |= US_HIDDEN;
	gUnknown_0202E4D8[unit->yPos][unit->xPos] = 0;
}

void MoveActiveUnit(int x, int y) {
	gUnknown_03004E50->xPos = x;
	gUnknown_03004E50->yPos = y;

	gUnknown_03004E50->state |= US_UNSELECTABLE;

	BWL_AddTilesMoved(gUnknown_03004E50->pCharacterData->number, gUnknown_0203A958.moveCount);

	if (GetUnitCurrentHP(gUnknown_03004E50) != 0)
		gUnknown_03004E50->state = gUnknown_03004E50->state &~ US_HIDDEN;

	ApplyUnitMovement(gUnknown_03004E50);
}

void sub_80187C0(void) {
	int i;

	if (gUnknown_0202BCF0.chapterPhaseIndex == FACTION_BLUE) {
		int i;

		for (i = 1; i < 0x40; ++i) {
			struct Unit* unit = GetUnitStruct(i);

			if (!UNIT_IS_VALID(unit))
				continue;

			if (UNIT_ATTRIBUTES(unit) & CA_SUPPLY)
				continue;

			if (unit->state & (US_UNAVAILABLE | US_UNSELECTABLE))
				continue;

			StoreSomeUnitSetFlags(unit->pCharacterData->number);
		}
	}

	for (i = gUnknown_0202BCF0.chapterPhaseIndex + 1; i < gUnknown_0202BCF0.chapterPhaseIndex + 0x40; ++i) {
		struct Unit* unit = GetUnitStruct(i);

		if (UNIT_IS_VALID(unit))
			unit->state = unit->state &~ (US_UNSELECTABLE | US_HAS_MOVED | US_HAS_MOVED_AI);
	}
}

void sub_8018858(void) {
	int i, displayMapChange = FALSE;

	InitTargets(0, 0);

	for (i = gUnknown_0202BCF0.chapterPhaseIndex + 1; i < gUnknown_0202BCF0.chapterPhaseIndex + 0x40; ++i) {
		struct Unit* unit = GetUnitStruct(i);

		if (!UNIT_IS_VALID(unit))
			continue;

		if (unit->state & (US_UNAVAILABLE | US_RESCUED))
			continue;

		if (unit->barrierDuration != 0)
			unit->barrierDuration--;

		if (unit->torchDuration != 0) {
			unit->torchDuration--;
			displayMapChange = TRUE;
		}

		if (unit->statusDuration != 0) {
			if (unit->statusIndex != UNIT_STATUS_10)
				unit->statusDuration--;

			if (unit->statusDuration == 0)
				AddTarget(unit->xPos, unit->yPos, unit->index, 0);
		}
	}

	if (displayMapChange) {
		sub_8019CBC();
		RefreshFogAndUnitMaps();
		UpdateGameTilesGraphics();
		NewBMXFADE(TRUE);
		SMS_UpdateFromGameData();
	}
}

void SetAllUnitNotBackSprite(void) {
	int i;

	for (i = 1; i < 0xC0; ++i) {
		struct Unit* unit = GetUnitStruct(i);

		if (UNIT_IS_VALID(unit))
			unit->state = unit->state &~ US_BIT8;
	}
}

void ValidateUnitItem(struct Unit* unit, int itemSlot) {
	if (unit->items[itemSlot]) {
		unit->items[itemSlot] = GetItemAfterUse(unit->items[itemSlot]);
		RemoveUnitBlankItems(unit);
	}
}

int GetUnitAid(struct Unit* unit) {
	if (!(UNIT_ATTRIBUTES(unit) & CA_MOUNTEDAID))
		return UNIT_CON(unit) - 1;

	if (UNIT_ATTRIBUTES(unit) & CA_FEMALE)
		return 20 - UNIT_CON(unit);
	else
		return 25 - UNIT_CON(unit);
}

int GetUnitMagBy2Range(struct Unit* unit) {
	if (unit->pCharacterData->number == 0xBE) { // TODO: CHAR_FOMORTIIS
		return GetItemMaxRange(ITEM_NIGHTMARE);
	} else {
		int result = GetUnitPower(unit) / 2;

		if (result < 5)
			result = 5;

		return result;
	}
}

s8 UnitHasMagicRank(struct Unit* unit) {
	u8 combinedRanks = 0; 

	combinedRanks |= unit->ranks[ITYPE_STAFF];
	combinedRanks |= unit->ranks[ITYPE_ANIMA];
	combinedRanks |= unit->ranks[ITYPE_LIGHT];
	combinedRanks |= unit->ranks[ITYPE_DARK];

	return combinedRanks ? TRUE : FALSE;
}

void sub_8018A7C(struct Unit* unit, int x, int y) {
	if (!(unit->state & US_UNDER_A_ROOF)) {
		unit->state = unit->state &~ (US_HIDDEN | US_NOT_DEPLOYED);

		unit->xPos = x;
		unit->yPos = y;
	}
}

int sub_8018A9C(struct Unit* unit, int terrain) {
	int slot, item = 0;

	if (UNIT_ATTRIBUTES(unit) & CA_LOCKPICK) {
		int slot = GetUnitItemSlot(unit, ITEM_LOCKPICK);

		if (slot >= 0)
			return slot;
	}

	switch (terrain) {

		// TODO: terrain id constants

	case 0x21:
		slot = GetUnitItemSlot(unit, ITEM_CHESTKEY);

		if (slot < 0)
			slot = GetUnitItemSlot(unit, ITEM_CHESTKEY_BUNDLE);

		return slot;

	case 0x1E:
		item = ITEM_DOORKEY;
		break;

	} // switch (terrain)

	return GetUnitItemSlot(unit, item);
}

int sub_8018AF0(u32 attributes) {
	// TODO: figure out what kind of return value this is, and use constants

	if (attributes & CA_MOUNTED)
		return 0x81;

	if (attributes & CA_PEGASUS)
		return 0x82;

	if (attributes & CA_WYVERN)
		return 0x83;

	return (-1);
}

int GetUnitUseFlags(struct Unit* unit) {
	int i, item, result = 0;

	for (i = 0; (i < UNIT_ITEM_COUNT) && (item = unit->items[i]); ++i) {
		if ((GetItemAttributes(item) & IA_WEAPON) && CanUnitUseWeapon(unit, item))
			result |= UNIT_USEBIT_WEAPON;

		if ((GetItemAttributes(item) & IA_STAFF) && CanUnitUseStaff(unit, item))
			result |= UNIT_USEBIT_STAFF;
	}

	return result;
}

int sub_8018BA0(void) {
	int i, result = 0;

	for (i = 0x81; i < 0xC0; ++i) {
		struct Unit* unit = GetUnitStruct(i);

		if (UNIT_IS_VALID(unit))
			result |= GetUnitUseFlags(unit);
	}

	return result;
}

s8 CanUnitMove(void) {
	s8 adjLookup[4 * 2] = {
		-1, 0,
		0, -1,
		+1, 0,
		0, +1,
	};

	int move = UNIT_MOV(gUnknown_03004E50) - gUnknown_0203A958.moveCount;

	int xUnit = gUnknown_03004E50->xPos;
	int yUnit = gUnknown_03004E50->yPos;

	int i;

	for (i = 0; i < 4; ++i) {
		int xLocal = xUnit + adjLookup[i*2 + 0];
		int yLocal = yUnit + adjLookup[i*2 + 1];

		int cost;

		if (gUnknown_0202E4D8[yLocal][xLocal] & FACTION_RED)
			continue;

		cost = GetMovCostTablePtr(gUnknown_03004E50)[gUnknown_0202E4DC[yLocal][xLocal]];

		if ((cost < 0) || (cost > move))
			continue;

		return TRUE;
	}

	return FALSE;
}

s8 IsPosMagicSealed(int x, int y) {
	int i;

	for (i = 0x81; i < 0xC0; ++i) {
		struct Unit* unit = GetUnitStruct(i);

		if (!UNIT_IS_VALID(unit))
			continue;

		if (!(UNIT_ATTRIBUTES(unit) & CA_MAGICSEAL))
			continue;

		if (RECT_DISTANCE(unit->xPos, unit->yPos, x, y) <= 10)
			return TRUE;
	}

	return FALSE;
}

s8 CanUnitNotUseMagic(struct Unit* unit) {
	if (unit->statusIndex == UNIT_STATUS_SILENCED)
		return TRUE;

	if (IsPosMagicSealed(unit->xPos, unit->yPos))
		return TRUE;

	return FALSE;
}

int GetUnitLastItem(struct Unit* unit) {
	return unit->items[GetUnitItemCount(unit) - 1];
}

const s8* GetMovCostTablePtr(struct Unit* unit) {
	if (unit->state & US_IN_BALLISTA)
		return gUnknown_0880BC18;

	switch (gUnknown_0202BCF0.chapterWeatherId) {

	case WEATHER_RAIN:
		return unit->pClassData->pMovCostTable[1];

	case WEATHER_SNOW:
	case WEATHER_SNOWSTORM:
		return unit->pClassData->pMovCostTable[2];

	default:
		return unit->pClassData->pMovCostTable[0];

	} // switch (gUnknown_0202BCF0.chapterWeatherId)
}

int GetClassStandingMapSpriteId(int classId) {
	return GetROMClassStruct(classId)->SMSId;
}

void UpdatePrevDeployStates(void) {
	int i;

	for (i = 1; i < 0x40; ++i) {
		struct Unit* unit = GetUnitStruct(i);

		if (!UNIT_IS_VALID(unit))
			continue;

		if (unit->state & US_NOT_DEPLOYED)
			unit->state = unit->state | US_BIT21;
		else
			unit->state = unit->state &~ US_BIT21;

		if (unit->state & US_BIT16)
			unit->state = unit->state | US_BIT26;
		else
			unit->state = unit->state &~ US_BIT26;
	}

	if (gUnknown_0202BCF0.chapterStateBits & CHAPTER_FLAG_PREPSCREEN)
		StoreUnitWordStructs();

	ResetAllPlayerUnitState();
}

void LoadUnitPrepScreenPositions(void) {
	int i;

	ResetAllPlayerUnitState();
	ClearCutsceneUnits();

	for (i = 1; i < 0x40; ++i) {
		struct Unit* unit = GetUnitStruct(i);

		if (!UNIT_IS_VALID(unit))
			continue;

		if (unit->state & US_BIT21)
			unit->state = unit->state | US_NOT_DEPLOYED;
		else
			unit->state = unit->state &~ US_NOT_DEPLOYED;

		if (unit->state & US_BIT26)
			unit->state = unit->state | US_BIT16;
		else
			unit->state = unit->state &~ US_BIT16;

		unit->state |= US_HIDDEN;
	}

	if (gUnknown_0202BCF0.chapterStateBits & CHAPTER_FLAG_PREPSCREEN)
		LoadUnitWordStructs();
}

void sub_8018EB8(void) {
	int i;

	// player units
	for (i = 1; i < 0x40; ++i) {
		struct Unit* unit = GetUnitStruct(i);

		if (!UNIT_IS_VALID(unit))
			continue;

		unit->state |= US_HIDDEN;

		if (UNIT_IS_PHANTOM(unit))
			ClearUnitStruct(unit);
	}

	// red units
	for (i = 0x81; i < 0xC0; ++i) {
		struct Unit* unit = GetUnitStruct(i);

		if (UNIT_IS_VALID(unit))
			ClearUnitStruct(unit);
	}

	// green units
	for (i = 0x41; i < 0x80; ++i) {
		struct Unit* unit = GetUnitStruct(i);

		if (UNIT_IS_VALID(unit))
			ClearUnitStruct(unit);
	}

	RefreshFogAndUnitMaps();
	SMS_UpdateFromGameData();
}

s8 IsUnitSlotAvailable(int faction) {
	int i;

	for (i = faction + 1; i < faction + 0x40; ++i)
		if (GetUnitStruct(i)->pCharacterData == NULL)
			return TRUE;

	return FALSE;
}

void sub_8018F80(void) {
	int i;

	for (i = 1; i < 0x40; ++i) {
		struct Unit* unit = GetUnitStruct(i);

		if (!UNIT_IS_VALID(unit))
			continue;

		if (unit->state & US_DEAD)
			continue;

		unit->state |= US_HIDDEN;
	}
}

void sub_8018FC0(void) {
	int i;

	for (i = 0x41; i < 0xC0; ++i) {
		struct Unit* unit = GetUnitStruct(i);

		if (!UNIT_IS_VALID(unit))
			continue;

		ClearUnitStruct(unit);
	}
}

int sub_8018FF0(void) {
	int i;

	u16 result = 0;

	for (i = 1; i < 0x40; ++i) {
		struct Unit* unit = GetUnitStruct(i);

		if (!UNIT_IS_VALID(unit))
			continue;

		if (unit->state & US_UNAVAILABLE)
			continue;

		++result;
	}

	return result;
}

int sub_8019034(void) {
	int i;

	u16 result = 0;

	for (i = 0x81; i < 0xC0; ++i) {
		struct Unit* unit = GetUnitStruct(i);

		if (!UNIT_IS_VALID(unit))
			continue;

		if (unit->state & US_DEAD)
			continue;

		++result;
	}

	return result;
}

int sub_8019074(void) {
	int i;

	u16 result = 0;

	for (i = 0x41; i < 0x80; ++i) {
		struct Unit* unit = GetUnitStruct(i);

		if (!UNIT_IS_VALID(unit))
			continue;

		if (unit->state & US_DEAD)
			continue;

		++result;
	}

	return result;
}

void ClearCutsceneUnits(void) {
	int i;

	for (i = 1; i < 0x40; ++i) {
		struct Unit* unit = GetUnitStruct(i);

		if (!UNIT_IS_VALID(unit))
			continue;

		if (unit->state & US_BIT22) {
			if (unit->state & US_DEAD)
				unit->state = unit->state &~ US_BIT22;
			else
				ClearUnitStruct(unit);
		}
	}
}

void sub_8019108(void) {
	int i;

	for (i = 1; i < 0x40; ++i) {
		struct Unit* unit = GetUnitStruct(i);

		if (!UNIT_IS_VALID(unit))
			continue;

		unit->state = unit->state &~ (US_UNSELECTABLE | US_RESCUING | US_RESCUED);
		unit->rescueOtherUnit = 0;

		SetUnitNewStatus(unit, 0);
	}

	RefreshFogAndUnitMaps();
	SMS_UpdateFromGameData();
}
