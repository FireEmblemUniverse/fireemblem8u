#ifndef GUARD_BMARENA_H
#define GUARD_BMARENA_H

#include "global.h"

struct ArenaData
{
    /* 00 */ struct Unit* playerUnit;
    /* 04 */ struct Unit* opponentUnit;
    /* 08 */ short matchupGoldValue;
    /* 0A */ u8 result;
    /* 0B */ u8 unk0B;
    /* 0C */ u8 range;
    /* 0D */ u8 playerWpnType;
    /* 0E */ u8 opponentWpnType;
    /* 0F */ u8 playerClassId;
    /* 10 */ u8 opponentClassId;
    /* 11 */ u8 playerLevel;
    /* 12 */ u8 opponentLevel;
    /* 13 */ s8 playerIsMagic;
    /* 14 */ s8 opponentIsMagic;
    /* 16 */ u16 playerPowerWeight;
    /* 18 */ u16 opponentPowerWeight;
    /* 1A */ u16 playerWeapon;
    /* 1C */ u16 opponentWeapon;
};

// ??? ArenaBeginInternal(???);
void ArenaBegin(struct Unit* unit);
void ArenaResume(struct Unit* unit);
// ??? GetUnitBestWRankType(???);
// ??? GetClassBestWRankType(???);
// ??? ArenaGenerateOpposingClassId(???);
// ??? IsWeaponMagic(???);
// ??? ArenaGetOpposingLevel(???);
// ??? ArenaGetPowerRanking(???);
// ??? ArenaGenerateOpponentUnit(???);
// ??? ArenaGenerateBaseWeapons(???);
// ??? ArenaGetUpgradedWeapon(???);
// ??? ArenaAdjustOpponentDamage(???);
// ??? ArenaAdjustOpponentPowerRanking(???);
// ??? ArenaGenerateMatchupGoldValue(???);
int ArenaGetMatchupGoldValue(void);
int ArenaGetResult(void);
void ArenaSetResult(int result);
void ArenaContinueBattle(void);
s8 ArenaIsUnitAllowed(struct Unit*);
// ??? ArenaSetFallbackWeaponForUnit(???);
// ??? ArenaSetFallbackWeaponsMaybe(???);

extern struct ArenaData gArenaState;

#endif // GUARD_BMARENA_H
