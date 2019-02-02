#ifndef GUARD_BMBATTLE_H
#define GUARD_BMBATTLE_H

enum {
	// Battle-related magic constants

	// Maximum amount of hits that can happen in a battle (-1, because of the terminating "hit")
	BATTLE_HIT_MAX = 7,

	// Followup attack (double attack) attack speed difference threshold
	BATTLE_FOLLOWUP_SPEED_THRESHOLD = 4,

	// Maximum battle damage
	BATTLE_MAX_DAMAGE = 127,
};

struct BattleUnit {
    /* 00 */ struct Unit unit;

    /* 48 */ u16 weaponAfter;
    /* 4A */ u16 weaponBefore;
    /* 4C */ u32 weaponAttributes;
    /* 50 */ u8 weaponType;
    /* 51 */ u8 weaponSlotIndex;

    /* 52 */ s8 canCounter;

    /* 53 */ s8 WTHitModifier;
    /* 54 */ s8 WTAtkModifier;

    /* 55 */ u8 terrainIndex;
    /* 56 */ s8 terrainDefense;
    /* 57 */ s8 terrainAvoid;
    /* 58 */ s8 terrainResistance;
    /* 59 */ /* pad */

    /* 5A */ short battleAttack;
    /* 5C */ short battleDefense;
    /* 5E */ short battleAttackSpeed;
    /* 60 */ short battleHit;
    /* 62 */ short battleAvoid;
    /* 64 */ short battleEffectiveHit;
    /* 66 */ short battleCrit;
    /* 68 */ short battleDodge;
    /* 6A */ short battleEffectiveCrit;
    /* 6C */ short battleSilencerRate;

    /* 6E */ s8 expGain;
    /* 6F */ s8 statusOut;
    /* 70 */ u8 levelPrevious;
    /* 71 */ u8 expPrevious;

    /* 72 */ u8 currentHP;

    /* 73 */ s8 changeHP;
    /* 74 */ s8 changePow;
    /* 75 */ s8 changeSkl;
    /* 76 */ s8 changeSpd;
    /* 77 */ s8 changeDef;
    /* 78 */ s8 changeRes;
    /* 79 */ s8 changeLck;
    /* 7A */ s8 changeCon;

    /* 7B */ s8 wexpMultiplier;
    /* 7C */ s8 nonZeroDamage;
    /* 7D */ s8 weaponBroke;

    /* 7E */ s8 unk7E; // isStaffTarget?
    /* 7F */ /* pad */
};

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

struct BattleHit {
	/* 00:18 */ unsigned attributes : 19;
	/* 19:23 */ unsigned info       : 5;
	/* 24:31 */ signed   hpChange   : 8;
};

enum {
	BATTLE_HIT_ATTR_CRIT      = (1 << 0),
	BATTLE_HIT_ATTR_MISS      = (1 << 1),
	BATTLE_HIT_ATTR_FOLLOWUP  = (1 << 2),
	BATTLE_HIT_ATTR_RETALIATE = (1 << 3),
	BATTLE_HIT_ATTR_BRAVE     = (1 << 4),
	BATTLE_HIT_ATTR_5         = (1 << 5), // unused?
	BATTLE_HIT_ATTR_POISON    = (1 << 6),
	BATTLE_HIT_ATTR_DEVIL     = (1 << 7),
	BATTLE_HIT_ATTR_HPSTEAL   = (1 << 8),
	BATTLE_HIT_ATTR_HPHALVE   = (1 << 9),
	BATTLE_HIT_ATTR_TATTACK   = (1 << 10), // triangle attack!
	BATTLE_HIT_ATTR_SILENCER  = (1 << 11),
	BATTLE_HIT_ATTR_12        = (1 << 12), // unused?
	BATTLE_HIT_ATTR_PETRIFY   = (1 << 13),
	BATTLE_HIT_ATTR_SURESHOT  = (1 << 14),
	BATTLE_HIT_ATTR_GREATSHLD = (1 << 15),
	BATTLE_HIT_ATTR_PIERCE    = (1 << 16),
	BATTLE_HIT_ATTR_17        = (1 << 17), // unused?
	BATTLE_HIT_ATTR_18        = (1 << 18), // unused?
};

enum {
	BATTLE_HIT_INFO_BEGIN        = (1 << 0),
	BATTLE_HIT_INFO_FINISHES     = (1 << 1),
	BATTLE_HIT_INFO_KILLS_TARGET = (1 << 2),
	BATTLE_HIT_INFO_RETALIATION  = (1 << 3),
	BATTLE_HIT_INFO_END          = (1 << 4),
};

enum {
	// Special item slot identifiers understood by SetBattleUnitWeapon and other functions

	BU_ISLOT_AUTO           = -1,
	BU_ISLOT_5              = UNIT_ITEM_COUNT + 0,
	BU_ISLOT_ARENA_PLAYER   = UNIT_ITEM_COUNT + 1,
	BU_ISLOT_ARENA_OPPONENT = UNIT_ITEM_COUNT + 2,
	BU_ISLOT_BALLISTA       = UNIT_ITEM_COUNT + 3,
};

extern struct BattleStats gBattleStats;

extern struct BattleUnit gBattleActor;
extern struct BattleUnit gBattleTarget;

extern struct BattleHit gBattleHitArray[BATTLE_HIT_MAX];
extern struct BattleHit* gBattleHitIterator;

// ??? BattleGenerateSimulationInternal(???);
// ??? BattleGenerateRealInternal(???);
// ??? BattleApplyGameStateUpdates(???);
// ??? BattleGenerateSimulation(???);
// ??? BattleGenerateReal(???);
// ??? BattleGenerateBallistaSimulation(???);
// ??? BattleGenerateBallistaReal(???);
void BattleGenerate(struct Unit* actor, struct Unit* target);
// ??? BattleGenerateUiStats(???);
// ??? BattleRoll1RN(???);
// ??? BattleRoll2RN(???);
void InitBattleUnit(struct BattleUnit* bUnit, struct Unit* unit);
// ??? InitBattleUnitWithoutBonuses(???);
void SetBattleUnitTerrainBonuses(struct BattleUnit* bu, int terrain);
void SetBattleUnitTerrainBonusesAuto(struct BattleUnit* bu);
void SetBattleUnitWeapon(struct BattleUnit* bu, int itemSlot);
void SetBattleUnitWeaponBallista(struct BattleUnit* bu);
// ??? sub_802A958(???);
void ComputeBattleUnitStats(struct BattleUnit* attacker, struct BattleUnit* defender);
void ComputeBattleUnitEffectiveStats(struct BattleUnit* attacker, struct BattleUnit* defender);
void ComputeBattleUnitSupportBonuses(struct BattleUnit* attacker, struct BattleUnit* defender);
void ComputeBattleUnitDefense(struct BattleUnit* attacker, struct BattleUnit* defender);
// ??? ComputeBattleUnitBaseDefense(???);
void ComputeBattleUnitAttack(struct BattleUnit* attacker, struct BattleUnit* defender);
void ComputeBattleUnitSpeed(struct BattleUnit* bu);
void ComputeBattleUnitHitRate(struct BattleUnit* bu);
void ComputeBattleUnitAvoidRate(struct BattleUnit* bu);
void ComputeBattleUnitCritRate(struct BattleUnit* bu);
void ComputeBattleUnitDodgeRate(struct BattleUnit* bu);
void ComputeBattleUnitEffectiveHitRate(struct BattleUnit* attacker, struct BattleUnit* defender);
void ComputeBattleUnitEffectiveCritRate(struct BattleUnit* attacker, struct BattleUnit* defender);
void ComputeBattleUnitSilencerRate(struct BattleUnit* attacker, struct BattleUnit* defender);
void ComputeBattleUnitWeaponRankBonuses(struct BattleUnit* bu);
void ComputeBattleUnitStatusBonuses(struct BattleUnit* bu);
void ComputeBattleUnitSpecialWeaponStats(struct BattleUnit* attacker, struct BattleUnit* defender);
// ??? ClearBattleHits(???);
void BattleUnwind(void);
void BattleGetBattleUnitOrder(struct BattleUnit** outAttacker, struct BattleUnit** outDefender);
s8 BattleGetFollowUpOrder(struct BattleUnit** outAttacker, struct BattleUnit** outDefender);
s8 BattleGenerateRoundHits(struct BattleUnit* attacker, struct BattleUnit* defender);
int GetBattleUnitHitCount(struct BattleUnit* attacker);
int BattleCheckBraveEffect(struct BattleUnit* bu);
// ??? BattleCheckTriangleAttack(???);
// ??? BattleUpdateBattleStats(???);
// ??? BattleCheckSureShot(???);
// ??? BattleCheckPierce(???);
// ??? BattleCheckGreatShield(???);
// ??? BattleCheckSilencer(???);
// ??? BattleCheckPetrify(???);
// ??? BattleGenerateHitAttributes(???);
// ??? BattleCheckTriangleAttack(???);
// ??? BattleGenerateHitEffects(???);
s8 BattleGenerateHit(struct BattleUnit* attacker, struct BattleUnit* defender);
void BattleApplyExpGains(void);
// ??? GetStatIncrease(???);
int GetAutoleveledStatIncrease(int growth, int levelCount);
// ??? CanBattleUnitGainLevels(???);
void CheckBattleUnitLevelUp(struct BattleUnit* bu);
// ??? ApplyUnitDefaultPromotion(???);
// ??? ApplyUnitPromotion(???);
// ??? GenerateBattleUnitStatGainsComparatively(???);
void CheckBattleUnitStatCaps(struct Unit* unit, struct BattleUnit* bu);
void BattleApplyUnitUpdates(void);
// ??? sub_802C0B0(???);
// ??? GetBattleUnitUpdatedWeaponExp(???);
// ??? HasBattleUnitGainedWeaponLevel(???);
void UpdateUnitFromBattle(struct Unit* unit, struct BattleUnit* bUnit);
// ??? UpdateUnitDuringBattle(???);
void BattleApplyBallistaUpdates(void);
void sub_802C334(void);
// ??? GetUnitExpLevel(???);
// ??? GetUnitRoundExp(???);
// ??? GetUnitPowerLevel(???);
// ??? GetUnitClassKillExpBonus(???);
// ??? GetUnitExpMultiplier(???);
// ??? GetUnitKillExpBonus(???);
// ??? ModifyUnitSpecialExp(???);
int GetBattleUnitExpGain(struct BattleUnit* actor, struct BattleUnit* target);
// ??? BattleApplyItemExpGains(???);
int GetBattleUnitStaffExp(struct BattleUnit* bu);
// ??? BattleApplyMiscActionExpGains(???);
void BattleUnitTargetSetEquippedWeapon(struct BattleUnit* bu);
void BattleUnitTargetCheckCanCounter(struct BattleUnit* bu);
// ??? BattleApplyReaverEffect(???);
void BattleApplyWeaponTriangleEffect(struct BattleUnit* actor, struct BattleUnit* target);
void BattleInitTargetCanCounter(void);
// ??? InitObstacleBattleUnit(???);
void ComputeBattleObstacleStats(void);
void UpdateObstacleFromBattle(struct BattleUnit* bu);
void BeginBattleAnimations(void);
// ??? GetUnitSoloBattleAnimType(???);
// ??? GetBattleAnimType(???);
void BattlePrintDebugUnitInfo(struct BattleUnit* actor, struct BattleUnit* target);
void BattlePrintDebugHitInfo(void);
// ??? BattleInitItemEffect(???);
// ??? BattleInitItemEffectTarget(???);
void UpdateActorFromBattle(void);
// ??? BattleApplyMiscAction(???);
// ??? BattleApplyItemEffect(???);
// ??? GetOffensiveStaffAccuracy(???);
void BattleGenerateArena(struct Unit* unit);
// ??? BattleIsTriangleAttack(???);
// ??? DidBattleUnitBreakWeapon(???);
// ??? SetScriptedBattle(???);
// ??? BattleGenerateHitScriptedDamage(???);
void BattleUnwindScripted(void);
// ??? UnitLevelUp(???);
// ??? BattleHitAdvance(???);
// ??? BattleHitTerminate(???);

#endif // GUARD_BMBATTLE_H
