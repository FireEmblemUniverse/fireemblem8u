#include "global.h"

#include "constants/items.h"
#include "constants/classes.h"

#include "rng.h"
#include "bmitem.h"
#include "bmunit.h"

struct BattleStats {
	/* 00 */ u16 config;

	/* 02 */ u8 range;
	/* 04 */ short damage;
	/* 06 */ short attack;
	/* 08 */ short defense;
	/* 0A */ short hit;
	/* 0C */ short crit;
	/* 0E */ short silencerRate;

	/* 10 */ struct Unit* taUnitA;
	/* 14 */ struct Unit* taUnitB;
};

enum {
	// For use with BattleStats:config

	BATTLE_CONFIG_BIT0 = (1 << 0),
	BATTLE_CONFIG_SIMULATE = (1 << 1),
	BATTLE_CONFIG_BIT2 = (1 << 2),
	BATTLE_CONFIG_BALLISTA = (1 << 3),
	BATTLE_CONFIG_BIT4 = (1 << 4),
	BATTLE_CONFIG_ARENA = (1 << 5),
	BATTLE_CONFIG_REFRESH = (1 << 6),
	BATTLE_CONFIG_MAPANIMS = (1 << 7),
	BATTLE_CONFIG_PROMOTION = (1 << 8),
	BATTLE_CONFIG_DANCERING = (1 << 9),
};

enum {
	BU_ISLOT_5              = UNIT_ITEM_COUNT + 0,
	BU_ISLOT_ARENA_PLAYER   = UNIT_ITEM_COUNT + 1,
	BU_ISLOT_ARENA_OPPONENT = UNIT_ITEM_COUNT + 2,
	BU_ISLOT_BALLISTA       = UNIT_ITEM_COUNT + 3,
};

EWRAM_DATA struct BattleStats gUnknown_0203A4D4 = {};

EWRAM_DATA struct BattleUnit gBattleActor = {};
EWRAM_DATA struct BattleUnit gBattleTarget = {};

void SetupBattleBallistaWeaponData(struct BattleUnit* bu);
void SetupBattleWeaponData(struct BattleUnit* bu, int itemSlot);
void DoSomeBattleWeaponStuff(void);
void BattleApplyWeaponTriangle(struct BattleUnit* actor, struct BattleUnit* target);
void BattleSomethingTrapChangeTerrain(void);
void BattleSetupTerrainData(struct BattleUnit* bu);
void sub_802A398(struct Unit* actor, struct Unit* target);
void NullAllLightRunesTerrain(void);
void sub_802C740(struct BattleUnit* bu);
void sub_802C6EC(struct BattleUnit* bu);
void sub_802B92C(void);
void sub_80A4AA4(void);
void sub_80A44C8(struct Unit* unit);
void SaveUnitsFromBattle(void);
void UpdateBallistaUsesFromBattle(void);
void nullsub_11(struct BattleUnit* actor, struct BattleUnit* target);
void sub_802CAFC(void);
void FillPreBattleStats(struct BattleUnit* attacker, struct BattleUnit* defender);
void FillBattleStats(struct BattleUnit* attacker, struct BattleUnit* defender);
void FillSnagBattleStats(void);
void sub_802CF4C(void);
void MakeBattle(void);
void WriteBattleStructTerrainBonuses(struct BattleUnit* bu, int terrain);
void BattleLoadDefense(struct BattleUnit* attacker, struct BattleUnit* defender);
void BattleLoadAttack(struct BattleUnit* attacker, struct BattleUnit* defender);
void BattleLoadAS(struct BattleUnit* bu);
void BattleLoadHit(struct BattleUnit* bu);
void BattleLoadAvoid(struct BattleUnit* bu);
void BattleLoadCrit(struct BattleUnit* bu);
void BattleLoadDodge(struct BattleUnit* bu);
void BattleApplyMiscBonuses(struct BattleUnit* attacker, struct BattleUnit* defender);
void BattleApplySRankBonuses(struct BattleUnit* bu);
void BattleComputeBuffStatus(struct BattleUnit* bu);
void ComputeHit(struct BattleUnit* attacker, struct BattleUnit* defender);
void ComputeCrit(struct BattleUnit* attacker, struct BattleUnit* defender);
void ComputeLethalityChance(struct BattleUnit* attacker, struct BattleUnit* defender);
void ComputeSpecialWeapons(struct BattleUnit* attacker, struct BattleUnit* defender);

void sub_802A13C(struct Unit* actor, struct Unit* target, int x, int y, int actorWpnSlot) {
	CopyUnitToBattleStruct(&gBattleActor, actor);
	CopyUnitToBattleStruct(&gBattleTarget, target);

	gBattleActor.unit.xPos = x;
	gBattleActor.unit.yPos = y;

	gUnknown_0203A4D4.range = RECT_DISTANCE(
		gBattleActor.unit.xPos, gBattleActor.unit.yPos,
		gBattleTarget.unit.xPos, gBattleTarget.unit.yPos
	);

	if (gUnknown_0203A4D4.config & BATTLE_CONFIG_BALLISTA)
		SetupBattleBallistaWeaponData(&gBattleActor);
	else
		SetupBattleWeaponData(&gBattleActor, actorWpnSlot);

	SetupBattleWeaponData(&gBattleTarget, -1);

	DoSomeBattleWeaponStuff();
	BattleApplyWeaponTriangle(&gBattleActor, &gBattleTarget);

	BattleSomethingTrapChangeTerrain();
	BattleSetupTerrainData(&gBattleActor);
	BattleSetupTerrainData(&gBattleTarget);

	sub_802A398(actor, target);

	NullAllLightRunesTerrain();
}

void sub_802A20C(struct Unit* actor, struct Unit* target) {
	CopyUnitToBattleStruct(&gBattleActor, actor);
	CopyUnitToBattleStruct(&gBattleTarget, target);

	gUnknown_0203A4D4.range = RECT_DISTANCE(
		gBattleActor.unit.xPos, gBattleActor.unit.yPos,
		gBattleTarget.unit.xPos, gBattleTarget.unit.yPos
	);

	if (gUnknown_0203A4D4.config & BATTLE_CONFIG_BALLISTA)
		SetupBattleBallistaWeaponData(&gBattleActor);
	else
		SetupBattleWeaponData(&gBattleActor, -1);

	SetupBattleWeaponData(&gBattleTarget, -1);

	DoSomeBattleWeaponStuff();
	BattleApplyWeaponTriangle(&gBattleActor, &gBattleTarget);

	BattleSomethingTrapChangeTerrain();
	BattleSetupTerrainData(&gBattleActor);
	BattleSetupTerrainData(&gBattleTarget);

	sub_802A398(actor, target);

	NullAllLightRunesTerrain();

	sub_802C740(&gBattleTarget);
	sub_802C6EC(&gBattleTarget);

	if (gBattleTarget.unit.index) {
		sub_802B92C();
		sub_80A4AA4();

		sub_80A44C8(actor);
		sub_80A44C8(target);
	}
}

void BATTLE_SaveFromBattle(void) {
	SaveUnitsFromBattle();
	UpdateBallistaUsesFromBattle();
	nullsub_11(&gBattleActor, &gBattleTarget);
	sub_802CAFC();
}

void sub_802A318(struct Unit* actor, struct Unit* target, int x, int y, int actorWpnSlot) {
	if (x < 0 && y < 0) {
		x = actor->xPos;
		y = actor->yPos;
	}

	gUnknown_0203A4D4.config = BATTLE_CONFIG_SIMULATE;
	sub_802A13C(actor, target, x, y, actorWpnSlot);
}

void sub_802A350(struct Unit* actor, struct Unit* target) {
	gUnknown_0203A4D4.config = BATTLE_CONFIG_BIT0;
	sub_802A20C(actor, target);
}

void sub_802A364(struct Unit* actor, struct Unit* target, int x, int y) {
	gUnknown_0203A4D4.config = BATTLE_CONFIG_SIMULATE | BATTLE_CONFIG_BALLISTA;
	sub_802A13C(actor, target, x, y, 0);
}

void sub_802A384(struct Unit* actor, struct Unit* target) {
	gUnknown_0203A4D4.config = BATTLE_CONFIG_BIT0 | BATTLE_CONFIG_BALLISTA;
	sub_802A20C(actor, target);
}

void sub_802A398(struct Unit* actor, struct Unit* target) {
	FillPreBattleStats(&gBattleActor, &gBattleTarget);
	FillPreBattleStats(&gBattleTarget, &gBattleActor);

	FillBattleStats(&gBattleActor, &gBattleTarget);
	FillBattleStats(&gBattleTarget, &gBattleActor);

	if (target == NULL)
		FillSnagBattleStats();

	if ((gUnknown_0203A4D4.config & BATTLE_CONFIG_BIT0) && (gUnknown_0203A958.unk18))
		sub_802CF4C();
	else
		MakeBattle();
}

void SetupBattleStructFromUnitAndWeapon(struct Unit* unit, s8 itemSlot) {
	gUnknown_0203A4D4.config = BATTLE_CONFIG_BIT2;

	gBattleTarget.weaponAfter = 0;
	gBattleTarget.weaponAttributes = IA_NONE;
	gBattleTarget.weaponType = 0xFF;

	gBattleTarget.unit.pClassData = NULL;

	gBattleActor.WTHitModifier = 0;
	gBattleActor.WTAtkModifier = 0;

	if ((itemSlot >= 0) && (itemSlot < UNIT_ITEM_COUNT)) {
		struct Unit tmpUnit = *unit;

		EquipUnitItemSlot(&tmpUnit, itemSlot);
		itemSlot = 0;

		CopyUnitToBattleStruct(&gBattleActor, &tmpUnit);
	} else
		CopyUnitToBattleStruct(&gBattleActor, unit);

	if (gUnknown_03005280.state & GMAP_STATE_BIT0)
		WriteBattleStructTerrainBonuses(&gBattleActor, 0); // TODO: TERRAIN ID DEFINITIONS
	else
		BattleSetupTerrainData(&gBattleActor);

	SetupBattleWeaponData(&gBattleActor, itemSlot);
	FillPreBattleStats(&gBattleActor, &gBattleTarget);

	if (GetItemIndex(gBattleActor.weaponAfter) == ITEM_SWORD_RUNESWORD) {
		gBattleActor.battleAttack -= gBattleActor.unit.pow / 2;

		gBattleActor.battleCrit = 0;
		gBattleActor.battleEffectiveCrit = 0;
	}

	if (!gBattleActor.weaponAfter) {
		gBattleActor.battleAttack = 0xFF;
		gBattleActor.battleHit = 0xFF;
		gBattleActor.battleCrit = 0xFF;
	}

	if (GetItemWeaponEffect(gBattleActor.weaponAfter) == 3) // TODO: WEAPON EFFECT CONSTANTS
		gBattleActor.battleAttack = 0xFF;

	if (GetItemIndex(gBattleActor.weaponAfter) == ITEM_MONSTER_STONE) {
		gBattleActor.battleAttack = 0xFF;
		gBattleActor.battleCrit = 0xFF;
	}
}

s8 RollRNIfBattleStarted(u16 threshold, s8 simResult) {
	if (gUnknown_0203A4D4.config & BATTLE_CONFIG_SIMULATE)
		return simResult;

	return Roll1RN(threshold);
}

s8 Roll2RNIfBattleStarted(u16 threshold, s8 simResult) {
	if (gUnknown_0203A4D4.config & BATTLE_CONFIG_SIMULATE)
		return simResult;

	return Roll2RN(threshold);
}

void CopyUnitToBattleStruct(struct BattleUnit* bu, struct Unit* unit) {
	if (!unit)
		return;

	bu->unit = *unit;

	bu->unit.maxHP = GetUnitMaxHp(unit);
	bu->unit.pow = GetUnitPower(unit);
	bu->unit.skl = GetUnitSkill(unit);
	bu->unit.spd = GetUnitSpeed(unit);
	bu->unit.def = GetUnitDefense(unit);
	bu->unit.lck = GetUnitLuck(unit);
	bu->unit.res = GetUnitResistance(unit);
	bu->unit.conBonus = UNIT_CON(unit);
	bu->unit.movBonus = UNIT_MOV(unit);

	bu->levelPrevious = bu->unit.level;
	bu->expPrevious = bu->unit.exp;

	bu->currentHP = bu->unit.curHP;
	bu->statusOut = 0xFF;

	bu->changeHP = 0;
	bu->changePow = 0;
	bu->changeSkl = 0;
	bu->changeSpd = 0;
	bu->changeDef = 0;
	bu->changeRes = 0;
	bu->changeLck = 0;
	bu->changeCon = 0;

	gBattleActor.wexpMultiplier = 0;
	gBattleTarget.wexpMultiplier = 0;

	bu->WTHitModifier = 0;
	bu->WTAtkModifier = 0;

	bu->nonZeroDamage = FALSE;

	gBattleActor.weaponBroke = FALSE;
	gBattleTarget.weaponBroke = FALSE;

	gBattleActor.expGain = 0;
	gBattleTarget.expGain = 0;
}

void CopyUnitToBattleStructRawStats(struct BattleUnit* bu, struct Unit* unit) {
	CopyUnitToBattleStruct(bu, unit);

	bu->unit.maxHP = unit->maxHP;
	bu->unit.pow = unit->pow;
	bu->unit.skl = unit->skl;
	bu->unit.spd = unit->spd;
	bu->unit.def = unit->def;
	bu->unit.lck = unit->lck;
	bu->unit.res = unit->res;

	bu->unit.conBonus = UNIT_CON_BASE(unit);
}

void WriteBattleStructTerrainBonuses(struct BattleUnit* bu, int terrain) {
	bu->terrainIndex = terrain;

	bu->terrainAvoid      = bu->unit.pClassData->pTerrainAvoidLookup[bu->terrainIndex];
	bu->terrainDefense    = bu->unit.pClassData->pTerrainDefenseLookup[bu->terrainIndex];
	bu->terrainResistance = bu->unit.pClassData->pTerrainResistanceLookup[bu->terrainIndex];
}

void BattleSetupTerrainData(struct BattleUnit* bu) {
	bu->terrainIndex = gUnknown_0202E4DC[bu->unit.yPos][bu->unit.xPos];

	bu->terrainAvoid      = bu->unit.pClassData->pTerrainAvoidLookup[bu->terrainIndex];
	bu->terrainDefense    = bu->unit.pClassData->pTerrainDefenseLookup[bu->terrainIndex];
	bu->terrainResistance = bu->unit.pClassData->pTerrainResistanceLookup[bu->terrainIndex];
}

void SetupBattleWeaponData(struct BattleUnit* bu, int itemSlot) {
	if (itemSlot == -1)
		itemSlot = GetUnitEquippedWeaponSlot(&bu->unit);

	if (bu->unit.state & US_IN_BALLISTA)
		itemSlot = BU_ISLOT_BALLISTA;

	bu->canCounter = TRUE;

	switch (itemSlot) {

	case 0:
	case 1:
	case 2:
	case 3:
	case 4:
		// regular item slots

		bu->weaponSlotIndex = itemSlot;
		bu->weaponAfter = bu->unit.items[bu->weaponSlotIndex];

		break;

	case BU_ISLOT_5:
		// borrowed item?

		bu->weaponSlotIndex = 0xFF;
		bu->weaponAfter = gUnknown_0202BCB0.itemUnk2C;

		break;

	case BU_ISLOT_ARENA_PLAYER:
		// arena player weapon

		bu->weaponSlotIndex = 0;

		bu->weaponAfter = gUnknown_0203A8F0.playerWeapon;
		bu->canCounter = FALSE;

		break;

	case BU_ISLOT_ARENA_OPPONENT:
		// arena opponent weapon

		bu->weaponSlotIndex = 0;

		bu->weaponAfter = gUnknown_0203A8F0.opponentWeapon;
		bu->canCounter = FALSE;

		break;

	case BU_ISLOT_BALLISTA:
		// riding ballista

		bu->weaponSlotIndex = 0xFF;

		bu->weaponAfter = GetBallistaItemAt(bu->unit.xPos, bu->unit.yPos);
		bu->canCounter = FALSE;

		break;

	default:
		bu->weaponSlotIndex = 0xFF;

		bu->weaponAfter = 0;
		bu->canCounter = FALSE;

		break;

	} // switch (itemSlot)

	bu->weaponBefore = bu->weaponAfter;
	bu->weaponAttributes = GetItemAttributes(bu->weaponAfter);
	bu->weaponType = GetItemType(bu->weaponAfter);

	if (!(gUnknown_0203A4D4.config & BATTLE_CONFIG_BIT2)) {
		if (bu->weaponAttributes & IA_MAGICDAMAGE) {
			switch (GetItemIndex(bu->weaponAfter)) {

			case ITEM_SWORD_WINDSWORD:
				if (gUnknown_0203A4D4.range == 2)
					bu->weaponType = ITYPE_ANIMA;
				else
					bu->weaponAttributes = bu->weaponAttributes &~ IA_MAGICDAMAGE;

				break;

			case ITEM_SWORD_LIGHTBRAND:
				if (gUnknown_0203A4D4.range == 2)
					bu->weaponType = ITYPE_LIGHT;
				else
					bu->weaponAttributes = bu->weaponAttributes &~ IA_MAGICDAMAGE;

				break;

			case ITEM_SWORD_RUNESWORD:
				bu->weaponType = ITYPE_DARK;
				break;

			} // switch (GetItemIndex(bu->weaponAfter))
		} // if (bu->weaponAttributes & IA_MAGICDAMAGE)

		if (!IsItemCoveringRange(bu->weaponAfter, gUnknown_0203A4D4.range) || bu->weaponSlotIndex == 0xFF) {
			bu->weaponAfter = 0;
			bu->canCounter = FALSE;
		}

		switch (bu->unit.statusIndex) {

		case UNIT_STATUS_SLEEP:
		case UNIT_STATUS_PETRIFY:
		case UNIT_STATUS_13:
			bu->weaponAfter = 0;
			bu->canCounter = FALSE;

			break;

		} // switch (bu->unit.statusIndex)
	}
}

void SetupBattleBallistaWeaponData(struct BattleUnit* bu) {
	bu->weaponAfter = GetBallistaItemAt(bu->unit.xPos, bu->unit.yPos);

	bu->weaponBefore = bu->weaponAfter;
	bu->weaponAttributes = GetItemAttributes(bu->weaponAfter);
	bu->weaponType = GetItemType(bu->weaponAfter);

	bu->canCounter = FALSE;
}

void sub_802A958(void) {} // unused

void FillPreBattleStats(struct BattleUnit* attacker, struct BattleUnit* defender) {
	BattleLoadDefense(attacker, defender);
	BattleLoadAttack(attacker, defender);
	BattleLoadAS(attacker);
	BattleLoadHit(attacker);
	BattleLoadAvoid(attacker);
	BattleLoadCrit(attacker);
	BattleLoadDodge(attacker);
	BattleApplyMiscBonuses(attacker, defender);
	BattleApplySRankBonuses(attacker);
	BattleComputeBuffStatus(attacker);
}

void FillBattleStats(struct BattleUnit* attacker, struct BattleUnit* defender) {
	ComputeHit(attacker, defender);
	ComputeCrit(attacker, defender);
	ComputeLethalityChance(attacker, defender);
	ComputeSpecialWeapons(attacker, defender);
}

void BattleApplyMiscBonuses(struct BattleUnit* attacker, struct BattleUnit* defender) {
	if (!(gUnknown_0203A4D4.config & BATTLE_CONFIG_ARENA) || gUnknown_0202BCF0.chapterWeatherId) {
		struct SupportBonuses tmpBonuses;

		GetUnitSupportBonuses(&attacker->unit, &tmpBonuses);

		attacker->battleAttack  += tmpBonuses.bonusAttack;
		attacker->battleDefense += tmpBonuses.bonusDefense;
		attacker->battleHit     += tmpBonuses.bonusHit;
		attacker->battleAvoid   += tmpBonuses.bonusAvoid;
		attacker->battleCrit    += tmpBonuses.bonusCrit;
		attacker->battleDodge   += tmpBonuses.bonusDodge;
	}
}

void BattleLoadDefense(struct BattleUnit* attacker, struct BattleUnit* defender) {
	if (GetItemAttributes(defender->weaponAfter) & IA_MAGICDAMAGE)
		attacker->battleDefense = attacker->terrainResistance + attacker->unit.res;
	else if (GetItemAttributes(defender->weaponAfter) & IA_MAGIC)
		attacker->battleDefense = attacker->terrainResistance + attacker->unit.res;
	else
		attacker->battleDefense = attacker->terrainDefense + attacker->unit.def;
}

void LoadRawDefense(struct BattleUnit* bu) {
	bu->battleDefense = bu->terrainDefense + bu->unit.def;
}

void BattleLoadAttack(struct BattleUnit* attacker, struct BattleUnit* defender) {
	short attack;

	attacker->battleAttack = GetItemMight(attacker->weaponAfter) + attacker->WTAtkModifier;
	attack = attacker->battleAttack;

	if (IsUnitEffectiveAgainst(&attacker->unit, &defender->unit) == TRUE)
		attack = attacker->battleAttack * 3;

	if (IsItemEffectiveAgainst(attacker->weaponAfter, &defender->unit) == TRUE) {
		attack = attacker->battleAttack;

		switch (GetItemIndex(attacker->weaponAfter)) {

		case ITEM_SWORD_AUDHULMA:
		case ITEM_LANCE_VIDOFNIR:
		case ITEM_AXE_GARM:
		case ITEM_BOW_NIDHOGG:
		case ITEM_ANIMA_EXCALIBUR:
		case ITEM_LIGHT_IVALDI:
		case ITEM_SWORD_SIEGLINDE:
		case ITEM_LANCE_SIEGMUND:
			attack *= 2;
			break;

		default:
			attack *= 3;
			break;

		} // switch (GetItemIndex(attacker->weaponAfter))
	}

	attacker->battleAttack = attack;
	attacker->battleAttack += attacker->unit.pow;

	if (GetItemIndex(attacker->weaponAfter) == ITEM_MONSTER_STONE)
		attacker->battleAttack = 0;
}

void BattleLoadAS(struct BattleUnit* bu) {
	int effWt = GetItemWeight(bu->weaponBefore);

	effWt -= bu->unit.conBonus;

	if (effWt < 0)
		effWt = 0;

	bu->battleAttackSpeed = bu->unit.spd - effWt;

	if (bu->battleAttackSpeed < 0)
		bu->battleAttackSpeed = 0;
}

void BattleLoadHit(struct BattleUnit* bu) {
	bu->battleHit = (bu->unit.skl * 2) + GetItemHit(bu->weaponAfter) + (bu->unit.lck / 2) + bu->WTHitModifier;
}

void BattleLoadAvoid(struct BattleUnit* bu) {
	bu->battleAvoid = (bu->battleAttackSpeed * 2) + bu->terrainAvoid + (bu->unit.lck);

	if (bu->battleAvoid < 0)
		bu->battleAvoid = 0;
}

void BattleLoadCrit(struct BattleUnit* bu) {
	bu->battleCrit = GetItemCrit(bu->weaponAfter) + (bu->unit.skl / 2);

	if (UNIT_CATTRIBUTES(&bu->unit) & CA_CRITBONUS)
		bu->battleCrit += 15;
}

void BattleLoadDodge(struct BattleUnit* bu) {
	bu->battleDodge = bu->unit.lck;
}

void ComputeHit(struct BattleUnit* attacker, struct BattleUnit* defender) {
	attacker->battleEffectiveHit = attacker->battleHit - defender->battleAvoid;

	if (attacker->battleEffectiveHit > 100)
		attacker->battleEffectiveHit = 100;

	if (attacker->battleEffectiveHit < 0)
		attacker->battleEffectiveHit = 0;
}

void ComputeCrit(struct BattleUnit* attacker, struct BattleUnit* defender) {
	int item, i;

	attacker->battleEffectiveCrit = attacker->battleCrit - defender->battleDodge;

	if (GetItemIndex(attacker->weaponAfter) == ITEM_MONSTER_STONE)
		attacker->battleEffectiveCrit = 0;

	if (attacker->battleEffectiveCrit < 0)
		attacker->battleEffectiveCrit = 0;

	for (i = 0; (i < UNIT_ITEM_COUNT) && (item = defender->unit.items[i]); ++i) {
		if (GetItemAttributes(item) & IA_NEGATE_CRIT) {
			attacker->battleEffectiveCrit = 0;
			break;
		}
	}
}

void ComputeLethalityChance(struct BattleUnit* attacker, struct BattleUnit* defender) {
	if (!(UNIT_CATTRIBUTES(&attacker->unit) & CA_LETHALITY))
		attacker->battleSilencerRate = 0;
	else {
		attacker->battleSilencerRate = 50;

		if (UNIT_CATTRIBUTES(&defender->unit) & CA_BOSS)
			attacker->battleSilencerRate = 25;

		if (UNIT_CATTRIBUTES(&defender->unit) & CA_NEGATE_LETHALITY)
			attacker->battleSilencerRate = 0;
	}
}

void BattleApplySRankBonuses(struct BattleUnit* bu) {
	if (bu->weaponAfter) {
		int wType = GetItemType(bu->weaponAfter);

		if (wType < 8 && bu->unit.ranks[wType] >= WPN_EXP_S) {
			bu->battleHit += 5;
			bu->battleCrit += 5;
		}
	}
}

void BattleComputeBuffStatus(struct BattleUnit* bu) {
	switch (bu->unit.statusIndex) {

	case UNIT_STATUS_ATTACK:
		bu->battleAttack += 10;
		break;

	case UNIT_STATUS_DEFENSE:
		bu->battleDefense += 10;
		break;

	case UNIT_STATUS_CRIT:
		bu->battleCrit += 10;
		break;

	case UNIT_STATUS_AVOID:
		bu->battleAvoid += 10;
		break;

	} // switch (bu->unit.statusIndex)
}

void ComputeSpecialWeapons(struct BattleUnit* attacker, struct BattleUnit* defender) {
	if (attacker->weaponAttributes & IA_MAGICDAMAGE) {
		switch (GetItemIndex(attacker->weaponAfter)) {

		case ITEM_SWORD_LIGHTBRAND:
		case ITEM_SWORD_RUNESWORD:
		case ITEM_SWORD_WINDSWORD:
			attacker->battleAttack -= attacker->unit.pow / 2;

			attacker->battleCrit = 0;
			attacker->battleEffectiveCrit = 0;

			break;

		} // switch (GetItemIndex(attacker->weaponAfter))
	} else {
		if (GetItemWeaponEffect(attacker->weaponBefore) == 3) { // TODO: WEAPON EFFECT CONSTANTS
			attacker->battleAttack = (defender->unit.curHP + 1) >> 1;

			if (attacker->battleAttack == 0)
				attacker->battleAttack = 1;

			defender->battleDefense = 0;

			attacker->battleCrit = 0;
			attacker->battleEffectiveCrit = 0;
		}

		if (attacker->weaponAttributes & IA_NEGATE_DEFENSE)
			defender->battleDefense = 0;

		if (defender->unit.statusIndex == UNIT_STATUS_PETRIFY || defender->unit.statusIndex == UNIT_STATUS_13) {
			attacker->battleEffectiveHit = 100;

			attacker->battleEffectiveCrit += 30;

			if (attacker->battleEffectiveCrit > 100)
				attacker->battleEffectiveCrit = 100;
		}
	}
}

// maybe file split here?
// maybe not, who knows

void GetBattleUnitPointers(struct BattleUnit** outAttacker, struct BattleUnit** outDefender);
s8 MakeBattleRound(struct BattleUnit* attacker, struct BattleUnit* defender);
s8 BattleCheckDoubling(struct BattleUnit** outAttacker, struct BattleUnit** outDefender);
int GetBattleHitCount(struct BattleUnit* attacker);
s8 MakeNextBattleHitRound(struct BattleUnit* attacker, struct BattleUnit* defender);
int BattleCheckBrave(struct BattleUnit* bu);

enum { BATTLE_HIT_MAX = 7 };

enum { BATTLE_FOLLOWUP_SPEED_THRESHOLD = 4 };

struct BattleHit {
	/* 00   */ unsigned unk00b   : 19;
	/* 02+3 */ unsigned unk19b   : 5;
	/* 03   */ unsigned hpChange : 8;
};

extern struct BattleHit gUnknown_0203A5EC[BATTLE_HIT_MAX];
extern struct BattleHit* gUnknown_0203A608;

void ClearRounds(void) {
	int i;

	for (i = 0; i < BATTLE_HIT_MAX; ++i) {
		gUnknown_0203A5EC[i].unk00b = 0;
		gUnknown_0203A5EC[i].unk19b = 0;
		gUnknown_0203A5EC[i].hpChange = 0;
	}

	gUnknown_0203A608 = gUnknown_0203A5EC;
}

void MakeBattle(void) {
	ClearRounds();

	// this do { ... } while (0); is required for match
	// which is kind of neat because it implies plans for supporting some accost kind of thing

	do {
		struct BattleUnit* attacker;
		struct BattleUnit* defender;

		GetBattleUnitPointers(&attacker, &defender);

		gUnknown_0203A608->unk19b |= 1; // TODO: BATTLE HIT BITS

		if (!MakeBattleRound(attacker, defender)) {
			gUnknown_0203A608->unk00b |= 8; // TODO: BATTLE HIT BITS

			if (!MakeBattleRound(defender, attacker) && BattleCheckDoubling(&attacker, &defender)) {
				gUnknown_0203A608->unk00b = 4; // TODO: BATTLE HIT BITS

				MakeBattleRound(attacker, defender);
			}
		}
	} while (FALSE);

	gUnknown_0203A608->unk19b |= 0x10; // TODO: BATTLE HIT BITS
}

void GetBattleUnitPointers(struct BattleUnit** outAttacker, struct BattleUnit** outDefender) {
	*outAttacker = &gBattleActor;
	*outDefender = &gBattleTarget;
}

s8 BattleCheckDoubling(struct BattleUnit** outAttacker, struct BattleUnit** outDefender) {
	if (gBattleTarget.battleAttackSpeed > 250)
		return FALSE;

	if (ABS(gBattleActor.battleAttackSpeed - gBattleTarget.battleAttackSpeed) < BATTLE_FOLLOWUP_SPEED_THRESHOLD)
		return FALSE;

	if (gBattleActor.battleAttackSpeed > gBattleTarget.battleAttackSpeed) {
		*outAttacker = &gBattleActor;
		*outDefender = &gBattleTarget;
	} else {
		*outAttacker = &gBattleTarget;
		*outDefender = &gBattleActor;
	}

	if (GetItemWeaponEffect((*outAttacker)->weaponBefore) == 3) // TODO: WEAPON EFFECT IDS
		return FALSE;

	if (GetItemIndex((*outAttacker)->weaponAfter) == ITEM_MONSTER_STONE)
		return FALSE;

	return TRUE;
}

s8 MakeBattleRound(struct BattleUnit* attacker, struct BattleUnit* defender) {
	int i, count;
	u16 unk;

	if (!attacker->weaponAfter)
		return FALSE;

	unk = gUnknown_0203A608->unk00b;
	count = GetBattleHitCount(attacker);

	for (i = 0; i < count; ++i) {
		gUnknown_0203A608->unk00b |= unk;

		if (MakeNextBattleHitRound(attacker, defender))
			return TRUE;
	}

	return FALSE;
}

int GetBattleHitCount(struct BattleUnit* attacker) {
	int result = 1;

	result <<= BattleCheckBrave(attacker);

	return result;
}

int BattleCheckBrave(struct BattleUnit* attacker) {
	if (!(attacker->weaponAttributes & IA_BRAVE))
		return FALSE;

	gUnknown_0203A608->unk00b |= 0x10; // TODO: BATTLE HIT BITS
	return TRUE;
}

s8 CheckForTriangleAttack(struct BattleUnit* attacker, struct BattleUnit* defender) {
	s8 adjacentLookup[] = {
		-1, 0,
		0, -1,
		+1, 0,
		0, +1
	};

	int i, count = 0;

	int triangleAttackAttr = CA_TRIANGLEATTACK_ANY & UNIT_CATTRIBUTES(&attacker->unit);

	int x = defender->unit.xPos;
	int y = defender->unit.yPos;

	int faction = UNIT_FACTION(&attacker->unit);

	gUnknown_0203A4D4.taUnitA = NULL;
	gUnknown_0203A4D4.taUnitB = NULL;

	for (i = 0; i < 4; ++i) {
		int uId = gUnknown_0202E4D8[adjacentLookup[i*2 + 1] + y][adjacentLookup[i*2 + 0] + x];
		struct Unit* unit;

		if (!uId)
			continue;

		unit = GetUnit(uId);

		if ((uId & 0xC0) != faction)
			continue;

		if (unit->statusIndex == UNIT_STATUS_SLEEP)
			continue;

		if (unit->statusIndex == UNIT_STATUS_PETRIFY)
			continue;

		if (unit->statusIndex == UNIT_STATUS_13)
			continue;

		if (unit->pClassData->number == CLASS_WYVERN_KNIGHT_F)
			continue;

		if (UNIT_CATTRIBUTES(unit) & triangleAttackAttr) {
			++count;

			if (!gUnknown_0203A4D4.taUnitA)
				gUnknown_0203A4D4.taUnitA = unit;
			else if (!gUnknown_0203A4D4.taUnitB)
				gUnknown_0203A4D4.taUnitB = unit;
		}
	}

	return count >= 2 ? TRUE : FALSE;
}

void UpdateBattleStats(struct BattleUnit* attacker, struct BattleUnit* defender) {
	gUnknown_0203A4D4.attack = attacker->battleAttack;
	gUnknown_0203A4D4.defense = defender->battleDefense;
	gUnknown_0203A4D4.hit = attacker->battleEffectiveHit;
	gUnknown_0203A4D4.crit = attacker->battleEffectiveCrit;
	gUnknown_0203A4D4.silencerRate = attacker->battleSilencerRate;
}

void RollForSureShot(struct BattleUnit* attacker) {
	if (gUnknown_0203A608->unk00b & 0x4000) // TODO: BATTLE HIT BITS
		return;

	if (gUnknown_0203A608->unk00b & 0x10000) // TODO: BATTLE HIT BITS
		return;

	if (gUnknown_0203A608->unk00b & 0x8000) // TODO: BATTLE HIT BITS
		return;

	switch (attacker->unit.pClassData->number) {

	case CLASS_SNIPER:
	case CLASS_SNIPER_F:
		switch (GetItemIndex(attacker->weaponAfter)) {

		case ITEM_BALLISTA_REGULAR:
		case ITEM_BALLISTA_LONG:
		case ITEM_BALLISTA_KILLER:
			break;

		default:
			if (RollRNIfBattleStarted(attacker->unit.level, FALSE) == TRUE)
				gUnknown_0203A608->unk00b |= 0x4000; // TODO: BATTLE HIT BITS

			break;

		} // switch (GetItemIndex(attacker->weaponAfter))

		break;

	} // switch (attacker->unit.pClassData->number)
}

void RollForPierce(struct BattleUnit* attacker, struct BattleUnit* defender) {
	if (gUnknown_0203A608->unk00b & 0x4000) // TODO: BATTLE HIT BITS
		return;

	if (gUnknown_0203A608->unk00b & 0x10000) // TODO: BATTLE HIT BITS
		return;

	if (gUnknown_0203A608->unk00b & 0x8000) // TODO: BATTLE HIT BITS
		return;

	switch (attacker->unit.pClassData->number) {

	case CLASS_WYVERN_KNIGHT:
	case CLASS_WYVERN_KNIGHT_F:
		if (RollRNIfBattleStarted(attacker->unit.level, FALSE) == TRUE)
			gUnknown_0203A608->unk00b |= 0x10000; // TODO: BATTLE HIT BITS

		break;

	} // switch (attacker->unit.pClassData->number)
}

void RollForGreatShield(struct BattleUnit* attacker, struct BattleUnit* defender) {
	if (gUnknown_0203A608->unk00b & 2) // TODO: BATTLE HIT BITS
		return;

	if (gUnknown_0203A608->unk00b & 0x4000) // TODO: BATTLE HIT BITS
		return;

	if (gUnknown_0203A608->unk00b & 0x10000) // TODO: BATTLE HIT BITS
		return;

	if (gUnknown_0203A608->unk00b & 0x8000) // TODO: BATTLE HIT BITS
		return;

	if (GetItemWeaponEffect(attacker->weaponAfter) == 1) // TODO: WEAPON EFFECT DEFINITIONS
		return;

	if (gUnknown_0203A608->unk00b & 2) // TODO: BATTLE HIT BITS
		return;

	switch (defender->unit.pClassData->number) {

	case CLASS_GENERAL:
	case CLASS_GENERAL_F:
		if (RollRNIfBattleStarted(attacker->unit.level, FALSE) == TRUE)
			gUnknown_0203A608->unk00b |= 0x8000; // TODO: BATTLE HIT BITS

		break;

	} // switch (defender->unit.pClassData->number)
}

s8 RollForLethality(struct BattleUnit* attacker, struct BattleUnit* defender) {
	switch (defender->unit.pClassData->number) {

	case CLASS_DEMON_KING:
		return FALSE;

	case CLASS_NECROMANCER:
		if (gUnknown_0202BCF0.chapterIndex == 0x15) // TODO: CHAPTER ID CONSTANTS
			return FALSE;

		if (gUnknown_0202BCF0.chapterIndex == 0x22) // TODO: CHAPTER ID CONSTANTS
			return FALSE;

	} // switch (defender->unit.pClassData->number)

	if (RollRNIfBattleStarted(gUnknown_0203A4D4.silencerRate, FALSE) == TRUE)
		return TRUE;

	return FALSE;
}

void NullifyBattleDamageIfUsingStone(struct BattleUnit* attacker, struct BattleUnit* defender) {
	if (GetItemIndex(attacker->weaponAfter) == ITEM_MONSTER_STONE)
		gUnknown_0203A4D4.damage = 0;
}

void GenerateCurrentRoundData(struct BattleUnit* attacker, struct BattleUnit* defender) {
	short attack, defense;

	gUnknown_0203A4D4.damage = 0;

	RollForSureShot(attacker);

	if (!(gUnknown_0203A608->unk00b & 0x4000)) { // TODO: BATTLE HIT BITS
		if (!Roll2RNIfBattleStarted(gUnknown_0203A4D4.hit, TRUE)) {
			gUnknown_0203A608->unk00b |= 2; // TODO: BATTLE HIT BITS
			return;
		}
	}

	attack = gUnknown_0203A4D4.attack;
	defense = gUnknown_0203A4D4.defense;

	RollForGreatShield(attacker, defender);

	if (!(gUnknown_0203A608->unk00b & 0x8000)) // TODO: BATTLE HIT BITS
		RollForPierce(attacker, defender);

	if (gUnknown_0203A608->unk00b & 0x10000) // TODO: BATTLE HIT BITS
		defense = 0;

	gUnknown_0203A4D4.damage = attack - defense;

	if (gUnknown_0203A608->unk00b & 0x8000) // TODO: BATTLE HIT BITS
		gUnknown_0203A4D4.damage = 0;

	if (RollRNIfBattleStarted(gUnknown_0203A4D4.crit, FALSE) == TRUE) {
		if (RollForLethality(attacker, defender)) {
			gUnknown_0203A608->unk00b |= 0x800; // TODO: BATTLE HIT BITS

			gUnknown_0203A4D4.damage = 127;

			gUnknown_0203A608->unk00b = gUnknown_0203A608->unk00b &~ 0x8000; // TODO: BATTLE HIT BITS
		} else {
			gUnknown_0203A608->unk00b = gUnknown_0203A608->unk00b | 1; // TODO: BATTLE HIT BITS
			gUnknown_0203A4D4.damage = gUnknown_0203A4D4.damage * 3;
		}
	}

	if (gUnknown_0203A4D4.damage > 127)
		gUnknown_0203A4D4.damage = 127;

	if (gUnknown_0203A4D4.damage < 0)
		gUnknown_0203A4D4.damage = 0;

	NullifyBattleDamageIfUsingStone(attacker, defender);

	if (gUnknown_0203A4D4.damage != 0)
		attacker->nonZeroDamage = TRUE;
}

void UpdateBattleTriangleAttackData(struct BattleUnit* attacker, struct BattleUnit* defender) {
	if (!(UNIT_CATTRIBUTES(&attacker->unit) & CA_TRIANGLEATTACK_ANY))
		return;

	if (gUnknown_0203A4D4.range != 1)
		return;

	if (!(gUnknown_0203A608->unk19b & 1)) // TODO: BATTLE HIT BITS
		return;

	if (attacker->unit.statusIndex == UNIT_STATUS_BERSERK)
		return;

	if (gUnknown_0203A4D4.config & BATTLE_CONFIG_ARENA)
		return;

	if (!CheckForTriangleAttack(attacker, defender))
		return;

	gUnknown_0203A608->unk00b |= 0x400;

	gUnknown_0203A4D4.crit = 100;
	gUnknown_0203A4D4.hit  = 100;
}
