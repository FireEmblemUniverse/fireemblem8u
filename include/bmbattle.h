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
	// Special item slot identifiers understood by SetupBattleWeaponData and other functions

	BU_ISLOT_AUTO           = -1,
	BU_ISLOT_5              = UNIT_ITEM_COUNT + 0,
	BU_ISLOT_ARENA_PLAYER   = UNIT_ITEM_COUNT + 1,
	BU_ISLOT_ARENA_OPPONENT = UNIT_ITEM_COUNT + 2,
	BU_ISLOT_BALLISTA       = UNIT_ITEM_COUNT + 3,
};

extern struct BattleHit gUnknown_0203A5EC[BATTLE_HIT_MAX];
extern struct BattleHit* gUnknown_0203A608;

// ??? sub_802A13C(???);
// ??? sub_802A20C(???);
// ??? BATTLE_SaveFromBattle(???);
// ??? sub_802A318(???);
// ??? sub_802A350(???);
// ??? sub_802A364(???);
// ??? sub_802A384(???);
void sub_802A398(struct Unit* actor, struct Unit* target);
// ??? SetupBattleStructFromUnitAndWeapon(???);
// ??? RollRNIfBattleStarted(???);
// ??? Roll2RNIfBattleStarted(???);
void CopyUnitToBattleStruct(struct BattleUnit* bUnit, struct Unit* unit);
// ??? CopyUnitToBattleStructRawStats(???);
void WriteBattleStructTerrainBonuses(struct BattleUnit* bu, int terrain);
void BattleSetupTerrainData(struct BattleUnit* bu);
void SetupBattleWeaponData(struct BattleUnit* bu, int itemSlot);
void SetupBattleBallistaWeaponData(struct BattleUnit* bu);
// ??? sub_802A958(???);
void FillPreBattleStats(struct BattleUnit* attacker, struct BattleUnit* defender);
void FillBattleStats(struct BattleUnit* attacker, struct BattleUnit* defender);
void BattleApplyMiscBonuses(struct BattleUnit* attacker, struct BattleUnit* defender);
void BattleLoadDefense(struct BattleUnit* attacker, struct BattleUnit* defender);
// ??? LoadRawDefense(???);
void BattleLoadAttack(struct BattleUnit* attacker, struct BattleUnit* defender);
void BattleLoadAS(struct BattleUnit* bu);
void BattleLoadHit(struct BattleUnit* bu);
void BattleLoadAvoid(struct BattleUnit* bu);
void BattleLoadCrit(struct BattleUnit* bu);
void BattleLoadDodge(struct BattleUnit* bu);
void ComputeHit(struct BattleUnit* attacker, struct BattleUnit* defender);
void ComputeCrit(struct BattleUnit* attacker, struct BattleUnit* defender);
void ComputeLethalityChance(struct BattleUnit* attacker, struct BattleUnit* defender);
void BattleApplySRankBonuses(struct BattleUnit* bu);
void BattleComputeBuffStatus(struct BattleUnit* bu);
void ComputeSpecialWeapons(struct BattleUnit* attacker, struct BattleUnit* defender);
// ??? ClearRounds(???);
void MakeBattle(void);
void GetBattleUnitPointers(struct BattleUnit** outAttacker, struct BattleUnit** outDefender);
s8 BattleCheckDoubling(struct BattleUnit** outAttacker, struct BattleUnit** outDefender);
s8 MakeBattleRound(struct BattleUnit* attacker, struct BattleUnit* defender);
int GetBattleHitCount(struct BattleUnit* attacker);
int BattleCheckBrave(struct BattleUnit* bu);
// ??? CheckForTriangleAttack(???);
// ??? UpdateBattleStats(???);
// ??? RollForSureShot(???);
// ??? RollForPierce(???);
// ??? RollForGreatShield(???);
// ??? RollForLethality(???);
// ??? NullifyBattleDamageIfUsingStone(???);
// ??? GenerateCurrentRoundData(???);
// ??? UpdateBattleTriangleAttackData(???);
// ??? CurrentRound_ComputeWeaponEffects(???);
s8 MakeNextBattleHitRound(struct BattleUnit* attacker, struct BattleUnit* defender);
void sub_802B92C(void);
// ??? GetStatIncrease(???);
int GetAutoleveledStat(int growth, int levelCount);
// ??? CanUnitNotLevelUp(???);
void CheckForLevelUp(struct BattleUnit* bu);
// ??? sub_802BC00(???);
// ??? sub_802BD50(???);
// ??? sub_802BEA0(???);
void CheckForLevelUpCaps(struct Unit* unit, struct BattleUnit* bu);
void SaveUnitsFromBattle(void);
// ??? sub_802C0B0(???);
// ??? GetBattleNewWExp(???);
// ??? BattleUnit_DidWRankGoUp(???);
void SaveUnitFromBattle(struct Unit* unit, struct BattleUnit* bUnit);
// ??? sub_802C2D4(???);
void UpdateBallistaUsesFromBattle(void);
void NullSomeStuff(void);
// ??? sub_802C344(???);
// ??? sub_802C368(???);
// ??? sub_802C398(???);
// ??? sub_802C3D8(???);
// ??? sub_802C40C(???);
// ??? sub_802C450(???);
// ??? sub_802C4F0(???);
int sub_802C534(struct BattleUnit* actor, struct BattleUnit* target);
// ??? HandleSomeExp(???);
int GetBattleUnitStaffExp(struct BattleUnit* bu);
// ??? InstigatorAdd10Exp(???);
void sub_802C6EC(struct BattleUnit* bu);
void sub_802C740(struct BattleUnit* bu);
// ??? BattleReverseWTriangeEffect(???);
void BattleApplyWeaponTriangle(struct BattleUnit* actor, struct BattleUnit* target);
void DoSomeBattleWeaponStuff(void);
// ??? MakeSnagBattleTarget(???);
void FillSnagBattleStats(void);
// ??? SaveSnagWallFromBattle(???);
void BeginBattleAnimations(void);
// ??? sub_802CA70(???);
// ??? sub_802CA98(???);
void nullsub_11(struct BattleUnit* actor, struct BattleUnit* target);
void sub_802CAFC(void);
// ??? sub_802CB24(???);
// ??? sub_802CBC8(???);
void SaveInstigatorFromBattle(void);
// ??? SaveInstigatorWith10ExtraExp(???);
// ??? sub_802CC54(???);
// ??? GetStaffAccuracy(???);
void sub_802CD64(struct Unit* unit);
// ??? IsCurrentBattleTriangleAttack(???);
// ??? DidWeaponBreak(???);
// ??? sub_802CEBC(???);
// ??? CurrentRound_ComputeDamage(???);
void sub_802CF4C(void);
// ??? sub_802D0BC(???);
// ??? sub_802D2B4(???);
// ??? sub_802D2C4(???);

#endif // GUARD_BMBATTLE_H
