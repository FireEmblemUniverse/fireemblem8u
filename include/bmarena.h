#ifndef GUARD_BMARENA_H
#define GUARD_BMARENA_H

#include "global.h"
#include "bmunit.h"

struct ArenaData
{
    /* 00 */ struct Unit * playerUnit;
    /* 04 */ struct Unit * opponentUnit;
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

void ArenaBeginInternal(struct Unit * unit);
void ArenaBegin(struct Unit * unit);
void ArenaResume(struct Unit * unit);
int GetUnitBestWRankType(struct Unit *);
int GetClassBestWRankType(const struct ClassData *);
int ArenaGenerateOpposingClassId(int);
s8 IsWeaponMagic(int);
int ArenaGetOpposingLevel(int);
int ArenaGetPowerRanking(struct Unit *, s8);
void ArenaGenerateOpponentUnit(void);
void ArenaGenerateBaseWeapons(void);
u16 ArenaGetUpgradedWeapon(u16 item);
s8 ArenaAdjustOpponentDamage(void);
s8 ArenaAdjustOpponentPowerRanking(void);
void ArenaGenerateMatchupGoldValue(void);
int ArenaGetMatchupGoldValue(void);
int ArenaGetResult(void);
void ArenaSetResult(int result);
void ArenaContinueBattle(void);
s8 ArenaIsUnitAllowed(struct Unit *);
void ArenaSetFallbackWeaponForUnit(struct Unit * unit, u16 * pItem);
void ArenaSetFallbackWeaponsMaybe(void);

extern struct ArenaData gArenaState;

#endif // GUARD_BMARENA_H
