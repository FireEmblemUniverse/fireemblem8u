#include "global.h"

#include "constants/items.h"

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
	/* 0E */ short lethalityProbability;

	/* 10 */ struct Unit* extraUnitA;
	/* 14 */ struct Unit* extraUnitB;
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
