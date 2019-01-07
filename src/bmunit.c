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

	/* 04 */ u16 xPosition  : 6; /* 04:0 to 04:5 */
	/* 04 */ u16 yPosition  : 6; /* 04:6 to 05:3 */
	/* 05 */ u16 genMonster : 1; /* 05:4 */
	/* 05 */ u16 itemDrop   : 1; /* 05:5 */
	/* 05 */ u16 sumFlag    : 1; /* 05:6 */
	/* 05 */ u16 extraData  : 9; /* 05:7 to 06:7 */
	/* 07 */ u16 redaCount  : 8;

	/* 08 */ const void* redas;

	/* 0C */ u8  items[4];

	struct {
		/* 10 */ u8 ai1;
		/* 11 */ u8 ai2;
		/* 12 */ u8 ai3 : 8;
	} ai;
};

int GetPlayerLeaderUnitId(void);

struct Unit* LoadUnit(const struct UnitDefinition* uDef);

int GenerateMonsterClass(u8 baseClassId);
int GenerateMonsterLevel(u8 baseLevel);
u32 GenerateMonsterItems(u8 monsterClassId);

void StoreNewUnitFromCode(struct Unit* unit, const struct UnitDefinition* uDef);
void LoadUnitStats(struct Unit* unit, const struct CharacterData* character);
void HideIfUnderRoof(struct Unit* unit);
void AutolevelRealistic(struct Unit* unit);
void AutolevelUnitWeaponRanks(struct Unit* unit, const struct UnitDefinition* uDef);
void AutolevelUnit(struct Unit* unit);
void FixROMUnitStructPtr(struct Unit* unit);
void LoadUnitSupports(struct Unit* unit);
void CheckForStatCaps(struct Unit* unit);

void GetPreferredPositionForUNIT(const struct UnitDefinition* uDef, u8* xOut, u8* yOut, s8 findNearest);
void CharStoreAI(struct Unit* unit, const struct UnitDefinition* uDef);

int GetROMUnitSupportCount(struct Unit* unit);
int GetUnitStartingSupportValue(struct Unit* unit, int supportIndex);

int GetAutoleveledStat(int growth, int levelCount);

int GetCurrentPromotedLevelBonus(void);

void CopyUnitToBattleStruct(struct BattleUnit* bUnit, struct Unit* unit);
void SaveUnitFromBattle(struct Unit* unit, struct BattleUnit* bUnit);
void CheckForLevelUp(struct BattleUnit* bUnit);

// TODO: debate on which to use
extern inline int GetUnitFaction(const struct Unit* unit) { return (unit->index & 0xC0); }
#define UNIT_FACTION(aUnit) ((aUnit)->index & 0xC0)

enum {
	FACTION_BLUE   = 0x00, // player units
	FACTION_GREEN  = 0x40, // ally npc units
	FACTION_RED    = 0x80, // enemy units
	FACTION_PURPLE = 0xC0, // link arena 4th team
};

enum { UNIT_EXP_DISABLED = 0xFF };
enum { UNIT_LEVEL_MAX = 20 };

#define IS_GORGON_EGG(aUnit) (((aUnit)->pClassData->number == CLASS_GORGONEGG) || ((aUnit)->pClassData->number == CLASS_GORGONEGG2))

extern struct Unit* gUnknown_0859A5D0[]; // unit lookup

extern const struct ClassData gUnknown_08807164[]; // gClassData
extern const struct CharacterData gUnknown_08803D64[]; // gCharacterData

// TODO: public!
static inline struct Unit* GetUnit(int id) {
	return gUnknown_0859A5D0[id & 0xFF];
}

// TODO: public!
static inline const struct ClassData* GetClassData(int classId) {
	if (classId < 1)
		return NULL;

	return gUnknown_08807164 + (classId - 1);
}

// TODO: public!
static inline const struct CharacterData* GetCharacterData(int charId) {
	if (charId < 1)
		return NULL;

	return gUnknown_08803D64 + (charId - 1);
}

// TODO: public!
static inline int GetMaxHp(struct Unit* unit) {
	return unit->maxHP + GetItemHpBonus(GetUnitEquippedWeapon(unit));
}

// TODO: public!
static inline void SetHp(struct Unit* unit, int value) {
	unit->curHP = value;

	if (unit->curHP > GetMaxHp(unit))
		unit->curHP = GetMaxHp(unit);
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

struct Unit* GetNextFreeUnitStructPtr(int faction) {
	int i, last = (faction + 0x40);

	for (i = faction + 1; i < last; ++i) {
		struct Unit* unit = GetUnit(i);

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
		struct Unit* unit = GetUnit(i);

		if (unit->pCharacterData == NULL)
			return unit;
	}

	return NULL;
}

// Unit stat getters here in proto

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
	if (GetClassData(classId)->baseRanks[wpnType])
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

	if (IS_GORGON_EGG(unit))
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

		if (IS_GORGON_EGG(unit))
			unit->maxHP = (unit->level + 1) * 5;
	} // if (uDef->autolevel)

	FixROMUnitStructPtr(unit);
	LoadUnitSupports(unit);

	if (uDef->itemDrop)
		unit->state |= US_DROP_ITEM;

	CheckForStatCaps(unit);

	unit->curHP = GetMaxHp(unit);

	if (IS_GORGON_EGG(unit))
		SetHp(unit, 5);

	return unit;
}

void StoreNewUnitFromCode(struct Unit* unit, const struct UnitDefinition* uDef) {
	unit->pCharacterData = GetCharacterData(uDef->charIndex);

	if (uDef->classIndex)
		unit->pClassData = GetClassData(uDef->classIndex);
	else // such an overlooked feature
		unit->pClassData = GetClassData(unit->pCharacterData->defaultClass);

	unit->level = uDef->level;

	GetPreferredPositionForUNIT(uDef, &unit->xPos, &unit->yPos, FALSE);

	if (IS_GORGON_EGG(unit)) {
		int i;

		// For gorgon eggs, set first item to zero
		// And store the other item ids in slots 1 through 4 for later initialization

		unit->items[0] = 0;

		for (i = 0; i < 4; ++i)
			unit->items[i + 1] = uDef->items[i];
	} else {
		int i;

		for (i = 0; (i < 4) && (uDef->items[i]); ++i)
			UnitAddItem(unit, MakeNewItem(uDef->items[i]));
	}

	CharStoreAI(unit, uDef);
}

void CharFillInventoryFromCode(struct Unit* unit, const struct UnitDefinition* uDef) {
	int i;

	UnitClearInventory(unit);

	for (i = 0; (i < 4) && (uDef->items[i]); ++i)
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
		unit->pCharacterData = GetCharacterData(unit->pCharacterData->number - 1);
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
	if (levelCount && !IS_GORGON_EGG(unit)) {
		if (levelCount > 0)
			IncreaseUnitStatsByLevelCount(unit, unit->pClassData->number, levelCount);
		else if (levelCount < 0)
			StoreUnitStats(unit, unit->pClassData->number, -levelCount);

		CheckForStatCaps(unit);

		unit->curHP = GetMaxHp(unit);
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

/*
#define UNIT_BASE_CON(aUnit) ((aUnit)->pClassData->baseCon + (aUnit)->pCharacterData->baseCon)

enum { UNIT_MOV_MAX = 15 };

void CheckForStatCaps(struct Unit* unit) {
	if (UNIT_FACTION(unit) == FACTION_RED ? (unit->maxHP > 120) : (unit->maxHP > 60))
		unit->maxHP = UNIT_FACTION(unit) == FACTION_RED ? 120 : 60;

	if (unit->pow > unit->pClassData->maxPow)
		unit->pow = unit->pClassData->maxPow;

	if (unit->skl > unit->pClassData->maxSkl)
		unit->skl = unit->pClassData->maxSkl;

	if (unit->spd > unit->pClassData->maxSpd)
		unit->spd = unit->pClassData->maxSpd;

	if (unit->def > unit->pClassData->maxDef)
		unit->def = unit->pClassData->maxDef;

	if (unit->res > unit->pClassData->maxRes)
		unit->res = unit->pClassData->maxRes;

	if (unit->lck > 30)
		unit->lck = 30;

	if (unit->conBonus > (unit->pClassData->maxCon - UNIT_BASE_CON(unit)))
		unit->conBonus = (unit->pClassData->maxCon - UNIT_BASE_CON(unit));

	if (unit->movBonus > (UNIT_MOV_MAX - unit->pClassData->baseMov))
		unit->movBonus = (UNIT_MOV_MAX - unit->pClassData->baseMov);
}
// */
