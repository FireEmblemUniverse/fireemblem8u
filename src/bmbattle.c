#include "global.h"

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

extern struct BattleUnit gUnknown_0203A4EC;
extern struct BattleUnit gUnknown_0203A56C;

extern struct BattleStats gUnknown_0203A4D4;

void SetupBattleBallistaWeaponData(struct BattleUnit* bu);
void SetupBattleWeaponData(struct BattleUnit* bu, int itemSlot);
void DoSomeBattleWeaponStuff(void);
void BattleApplyWeaponTriangle(struct BattleUnit* actor, struct BattleUnit* target);
void BattleSomethingTrapChangeTerrain(void);
void BattleSetupTerrainData(struct BattleUnit* bu);
void sub_802A398(struct Unit* actor, struct Unit* target);
void NullAllLightRunesTerrain(void);

void sub_802A13C(struct Unit* actor, struct Unit* target, int x, int y, int actorWpnSlot) {
	CopyUnitToBattleStruct(&gUnknown_0203A4EC, actor);
	CopyUnitToBattleStruct(&gUnknown_0203A56C, target);

	gUnknown_0203A4EC.unit.xPos = x;
	gUnknown_0203A4EC.unit.yPos = y;

	gUnknown_0203A4D4.range = RECT_DISTANCE(
		gUnknown_0203A4EC.unit.xPos, gUnknown_0203A4EC.unit.yPos,
		gUnknown_0203A56C.unit.xPos, gUnknown_0203A56C.unit.yPos
	);

	if (gUnknown_0203A4D4.config & BATTLE_CONFIG_BALLISTA)
		SetupBattleBallistaWeaponData(&gUnknown_0203A4EC);
	else
		SetupBattleWeaponData(&gUnknown_0203A4EC, actorWpnSlot);

	SetupBattleWeaponData(&gUnknown_0203A56C, -1);

	DoSomeBattleWeaponStuff();
	BattleApplyWeaponTriangle(&gUnknown_0203A4EC, &gUnknown_0203A56C);

	BattleSomethingTrapChangeTerrain();
	BattleSetupTerrainData(&gUnknown_0203A4EC);
	BattleSetupTerrainData(&gUnknown_0203A56C);

	sub_802A398(actor, target);

	NullAllLightRunesTerrain();
}
