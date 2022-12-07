#include "global.h"

#include "bmunit.h"
#include "rng.h"
#include "bmitem.h"
#include "bmbattle.h"
#include "bmarena.h"

#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/items.h"

int GetUnitBestWRankType(struct Unit*);
int GetClassBestWRankType(const struct ClassData*);
int ArenaGenerateOpposingClassId(int);
s8 IsWeaponMagic(int);
int ArenaGetOpposingLevel(int);
int ArenaGetPowerRanking(struct Unit*, s8);
void ArenaGenerateOpponentUnit(void);
void ArenaGenerateBaseWeapons(void);
s8 ArenaAdjustOpponentDamage(void);
s8 ArenaAdjustOpponentPowerRanking(void);
void ArenaGenerateMatchupGoldValue(void);
void ArenaSetResult(int);
void ArenaSetFallbackWeaponsMaybe(void);

struct ArenaData EWRAM_DATA gArenaState = {};
struct Unit EWRAM_DATA gArenaOpponent = {};

void ArenaBeginInternal(struct Unit* unit) {
    int i;

    gArenaState.playerUnit = unit;
    gArenaState.opponentUnit = &gArenaOpponent;

    gUnknown_03003060 = UNIT_ARENA_LEVEL(unit);

    gArenaState.playerClassId = unit->pClassData->number;
    gArenaState.playerWpnType = GetUnitBestWRankType(unit);

    gArenaState.opponentClassId = ArenaGenerateOpposingClassId(gArenaState.playerWpnType);
    gArenaState.opponentWpnType = GetClassBestWRankType(GetClassData(gArenaState.opponentClassId));

    gArenaState.playerIsMagic = IsWeaponMagic(gArenaState.playerWpnType);
    gArenaState.opponentIsMagic = IsWeaponMagic(gArenaState.opponentWpnType);

    gArenaState.playerLevel = unit->level;

    if (UNIT_ARENA_LEVEL(unit) < 5) {
        gArenaState.oppenentLevel = ArenaGetOpposingLevel(gArenaState.playerLevel);
    } else {
        gArenaState.oppenentLevel = ArenaGetOpposingLevel(gArenaState.playerLevel) + 7;
    }

    ArenaGenerateOpponentUnit();
    ArenaGenerateBaseWeapons();

    for (i = 0; i < 10; i++) {
        if (!ArenaAdjustOpponentPowerRanking()) {
            break;
        }
    }

    for (i = 0; i < 5; i++) {
        if (!ArenaAdjustOpponentDamage()) {
            break;
        }
    }

    gArenaState.playerPowerWeight = ArenaGetPowerRanking(gArenaState.playerUnit, gArenaState.opponentIsMagic);

    gArenaState.opponentPowerWeight = ArenaGetPowerRanking(gArenaState.opponentUnit, gArenaState.playerIsMagic);

    ArenaGenerateMatchupGoldValue();

    gArenaState.unk0B = 1;

    ArenaSetResult(0);

    ArenaSetFallbackWeaponsMaybe();

    return;
}

void ArenaBegin(struct Unit* unit) {
    StoreRNState(&gActionData.item);
    ArenaBeginInternal(unit);

    return;
}

void ArenaResume(struct Unit* unit) {
    LoadRNState(&gActionData.item);
    ArenaBeginInternal(unit);
    LoadRNState(gActionData._u00);

    return;
}

int GetUnitBestWRankType(struct Unit* unit) {
    int i;

    int wexp = 0;
    int type = -1;

    for (i = 0; i < 8; i++) {

        if (i == ITYPE_STAFF) {
            continue;
        }

        if (wexp < unit->ranks[i]) {
            wexp = unit->ranks[i];
            type = i;
        }
    }

    return type;
}

int GetClassBestWRankType(const struct ClassData* class) {
    int i;

    int wexp = 0;
    int type = -1;

    for (i = 0; i < 8; i++) {

        if (i == ITYPE_STAFF) {
            continue;
        }

        if (wexp < class->baseRanks[i]) {
            wexp = class->baseRanks[i];
            type = i;
        }
    }

    return type;
}

u8 CONST_DATA gClassList_MeleeArena[] = {
    CLASS_MERCENARY,
    CLASS_HERO,
    CLASS_MYRMIDON,
    CLASS_SWORDMASTER,
    CLASS_FIGHTER,
    CLASS_WARRIOR,
    CLASS_ARMOR_KNIGHT,
    CLASS_GENERAL,
    CLASS_BISHOP,
    CLASS_MAGE,
    CLASS_SAGE,
    CLASS_SHAMAN,
    CLASS_DRUID,
    CLASS_CAVALIER,
    CLASS_PALADIN,
    CLASS_VALKYRIE,
    CLASS_PEGASUS_KNIGHT,
    CLASS_FALCON_KNIGHT,
    CLASS_WYVERN_RIDER,
    CLASS_WYVERN_LORD,
    CLASS_SOLDIER,
    CLASS_BRIGAND,
    CLASS_PIRATE,
    CLASS_BERSERKER,
    CLASS_MERCENARY,
    CLASS_MYRMIDON,
    CLASS_FIGHTER,
    CLASS_ARMOR_KNIGHT,
    CLASS_MAGE,
    CLASS_SHAMAN,
    CLASS_CAVALIER,
    CLASS_PEGASUS_KNIGHT,
    CLASS_WYVERN_RIDER,
    CLASS_BRIGAND,
    CLASS_PIRATE,
    CLASS_SOLDIER,
    CLASS_SOLDIER,

    CLASS_NONE
};

u8 CONST_DATA gClassList_MagicArena[] = {
    CLASS_MERCENARY,
    CLASS_HERO,
    CLASS_MYRMIDON,
    CLASS_SWORDMASTER,
    CLASS_FIGHTER,
    CLASS_WARRIOR,
    CLASS_ARMOR_KNIGHT,
    CLASS_GENERAL,
    CLASS_ARCHER,
    CLASS_SNIPER,
    CLASS_BISHOP,
    CLASS_MAGE,
    CLASS_SAGE,
    CLASS_SHAMAN,
    CLASS_DRUID,
    CLASS_CAVALIER,
    CLASS_PALADIN,
    CLASS_VALKYRIE,
    CLASS_PEGASUS_KNIGHT,
    CLASS_FALCON_KNIGHT,
    CLASS_WYVERN_RIDER,
    CLASS_WYVERN_LORD,
    CLASS_SOLDIER,
    CLASS_BRIGAND,
    CLASS_PIRATE,
    CLASS_BERSERKER,
    CLASS_THIEF,
    CLASS_MERCENARY,
    CLASS_MYRMIDON,
    CLASS_FIGHTER,
    CLASS_ARMOR_KNIGHT,
    CLASS_ARCHER,
    CLASS_MAGE,
    CLASS_SHAMAN,
    CLASS_CAVALIER,
    CLASS_PEGASUS_KNIGHT,
    CLASS_WYVERN_RIDER,
    CLASS_SOLDIER,
    CLASS_SOLDIER,

    CLASS_NONE
};

u8 CONST_DATA gClassList_BowArena[] = {
    CLASS_ARCHER,
    CLASS_SNIPER,
    CLASS_BISHOP,
    CLASS_MAGE,
    CLASS_SAGE,
    CLASS_SHAMAN,
    CLASS_DRUID,
    CLASS_VALKYRIE,

    CLASS_NONE,
};

u8 CONST_DATA gClassList_UnusedArena[] = {
    CLASS_MERCENARY,
    CLASS_MYRMIDON,
    CLASS_SWORDMASTER,
    CLASS_FIGHTER,
    CLASS_WARRIOR,
    CLASS_BISHOP,
    CLASS_MAGE,
    CLASS_SAGE,
    CLASS_SHAMAN,
    CLASS_DRUID,
    CLASS_CAVALIER,
    CLASS_VALKYRIE,
    CLASS_PEGASUS_KNIGHT,
    CLASS_WYVERN_RIDER,
    CLASS_SOLDIER,
    CLASS_BRIGAND,
    CLASS_PIRATE,
    CLASS_BERSERKER,
    CLASS_THIEF,
    CLASS_FIGHTER,
    CLASS_FIGHTER,
    CLASS_THIEF,

    CLASS_NONE,
};

int ArenaGenerateOpposingClassId(int weaponType) {
    int i;
    int promotedFlag;
    int classNum;

    int classCount = 0;
    u8* classList = NULL;

    switch (weaponType) {
        case ITYPE_SWORD:
        case ITYPE_LANCE:
        case ITYPE_AXE:
            classList = gClassList_MeleeArena;
            break;

        case ITYPE_BOW:
            classList = gClassList_BowArena;
            break;

        case ITYPE_ANIMA:
        case ITYPE_LIGHT:
        case ITYPE_DARK:
            classList = gClassList_MagicArena;
            break;
    }

    promotedFlag = UNIT_CATTRIBUTES(gArenaState.playerUnit) & CA_PROMOTED;

    for (i = 0; classList[i] != 0; i++) {

        if ((GetClassData(classList[i])->attributes & CA_PROMOTED) != promotedFlag) {
            continue;
        }

        classCount++;
    }

    classNum = NextRN_N(classCount);

    for (i = 0, classCount = 0; TRUE; i++) {
        if ((GetClassData(classList[i])->attributes & CA_PROMOTED) != promotedFlag) {
            continue;
        }

        if (classCount == classNum) {
            break;
        }

        classCount++;
    }

    return classList[i];
}

s8 IsWeaponMagic(int weaponType) {

    switch (weaponType) {
        case ITYPE_SWORD:
        case ITYPE_LANCE:
        case ITYPE_AXE:
        case ITYPE_BOW:
            return 0;

        case ITYPE_ANIMA:
        case ITYPE_LIGHT:
        case ITYPE_DARK:
            return 1;
    }

}

int ArenaGetOpposingLevel(int level) {
    int result = level + NextRN_N(1 + 2 * 4) - 4;

    if (result < 1) {
        result = 1;
    }

    return result;
}

int ArenaGetPowerRanking(struct Unit* unit, s8 opponentIsMagic) {
    int result = unit->maxHP;

    result += unit->maxHP;
    result += unit->pow * 2;
    result += unit->skl * 2;
    result += unit->spd * 2;
    result += unit->lck;
    result += UNIT_CON_BASE(unit);

    if (opponentIsMagic) {
        result += GetUnitResistance(unit) * 2;
    } else {
        result += GetUnitDefense(unit) * 2;
    }

    if (UNIT_CATTRIBUTES(unit) & CA_CRITBONUS) {
        result += GetUnitPower(unit);
    }

    return result;
}

void ArenaGenerateOpponentUnit(void) {
    int level;
    int i;

    struct UnitDefinition udef;

    struct Unit* unit = &gArenaOpponent;

    udef.charIndex = CHARACTER_ARENA_OPPONENT;
    udef.classIndex = gArenaState.opponentClassId;
    udef.allegiance = 0;
    udef.level = gArenaState.oppenentLevel;
    udef.autolevel = 1;
    udef.items[0] = 0;
    udef.items[1] = 0;
    udef.items[2] = 0;
    udef.items[3] = 0;
    udef.ai[0] = 0;
    udef.ai[0] = 0;
    udef.ai[1] = 0;
    udef.ai[2] = 0;
    udef.ai[3] = 0;

    ClearUnit(&gArenaOpponent);
    unit->index = 0x80;

    UnitInitFromDefinition(unit, &udef);
    UnitLoadStatsFromChracter(unit, unit->pCharacterData);

    level = unit->level;

    unit->level = ((gRAMChapterData.chapterStateBits & CHAPTER_FLAG_DIFFICULT) ? level * 24 : level * 12) / 10;

    UnitAutolevel(unit);

    unit->level = level;

    for (i = 0; i < 8; i++) {
        if (unit->ranks[i] != 0) {
            unit->ranks[i] = -75;
        }
    }

    if (unit->level < 1) {
        unit->level = 1;
    }

    if (unit->level > 20) {
        unit->level = 20;
    }

    UnitCheckStatCaps(unit);
    SetUnitHp(unit, GetUnitMaxHp(unit));

    return;
}

void ArenaGenerateBaseWeapons(void) {
    u8 arenaWeapons[] = {
        [ITYPE_SWORD] = ITEM_SWORD_IRON,
        [ITYPE_LANCE] = ITEM_LANCE_IRON,
        [ITYPE_AXE] = ITEM_AXE_IRON,
        [ITYPE_BOW] = ITEM_BOW_IRON,
        [ITYPE_STAFF] = ITEM_NONE,
        [ITYPE_ANIMA] = ITEM_ANIMA_FIRE,
        [ITYPE_LIGHT] = ITEM_LIGHT_LIGHTNING,
        [ITYPE_DARK] = ITEM_DARK_FLUX
    };

    gArenaState.playerWeapon = MakeNewItem(arenaWeapons[gArenaState.playerWpnType]);

    gArenaState.opponentWeapon = MakeNewItem(arenaWeapons[gArenaState.opponentWpnType]);

    gArenaState.range = 1;

    if (gArenaState.playerWpnType == ITYPE_BOW) {
        gArenaState.range = 2;
    }

    if (gArenaState.opponentWpnType == ITYPE_BOW) {
        gArenaState.range = 2;
    }

    return;
}

u16 ArenaGetUpgradedWeapon(u16 item) {
    u8* iter;

    u8 arenaWeaponUpgrades[] = {
        ITEM_SWORD_IRON, ITEM_SWORD_STEEL, ITEM_SWORD_SILVER, 0,
        ITEM_LANCE_IRON, ITEM_LANCE_STEEL, ITEM_LANCE_SILVER, 0,
        ITEM_AXE_IRON, ITEM_AXE_STEEL, ITEM_AXE_SILVER, 0,
        ITEM_BOW_IRON, ITEM_BOW_STEEL, ITEM_BOW_SILVER, 0,
        ITEM_ANIMA_FIRE, ITEM_ANIMA_ELFIRE, ITEM_ANIMA_FIMBULVETR, 0,
        ITEM_LIGHT_LIGHTNING, ITEM_LIGHT_DIVINE, 0,
        ITEM_DARK_FLUX, 0,

        -1
    };

    for (iter = arenaWeaponUpgrades; *iter != (u8) -1; iter++) {
        if (GetItemIndex(item) != *iter) {
            continue;
        }

        if (*++iter != 0) {
            return MakeNewItem(*iter);
        }

        return item;
    }
}

s8 ArenaAdjustOpponentDamage(void) {
    s8 result = 0;

    gBattleActor.battleAttack = GetUnitPower(gArenaState.playerUnit) + 5;

    if (gArenaState.opponentIsMagic) {
        gBattleActor.battleDefense = GetUnitResistance(gArenaState.playerUnit);
    } else {
        gBattleActor.battleDefense = GetUnitDefense(gArenaState.playerUnit);
    }

    gBattleTarget.battleAttack = GetUnitPower(gArenaState.opponentUnit) + 5;

    if (gArenaState.playerIsMagic) {
        gBattleTarget.battleDefense = GetUnitResistance(gArenaState.opponentUnit);
    } else {
        gBattleTarget.battleDefense = GetUnitDefense(gArenaState.opponentUnit);
    }

    if ((gBattleActor.battleAttack - gBattleTarget.battleDefense) < (GetUnitMaxHp(gArenaState.opponentUnit) / 6)) {
        result = 1;

        if (gArenaState.playerIsMagic) {
            gArenaState.opponentUnit->res -= 4;

            if (gArenaState.opponentUnit->res < 0) {
                gArenaState.opponentUnit->res = 0;
            }
        } else {
            gArenaState.opponentUnit->def -= 4;

            if (gArenaState.opponentUnit->def < 0) {
                gArenaState.opponentUnit->def = 0;
            }
        }

        gArenaState.opponentUnit->spd += 1;
        gArenaState.opponentUnit->skl += 1;
    }

    if (gBattleTarget.battleAttack - gBattleActor.battleDefense < (GetUnitMaxHp(gArenaState.playerUnit) / 6)) {
        result = 1;

        gArenaState.opponentUnit->pow += 3;
        gArenaState.opponentUnit->spd += 2;
        gArenaState.opponentUnit->skl += 2;

        gArenaState.opponentWeapon = ArenaGetUpgradedWeapon(gArenaState.opponentWeapon);
    }

    return result;
}

s8 ArenaAdjustOpponentPowerRanking(void) {
    int max;
    int diff;

    gArenaState.playerPowerWeight = ArenaGetPowerRanking(gArenaState.playerUnit, gArenaState.opponentIsMagic);

    gArenaState.opponentPowerWeight = ArenaGetPowerRanking(gArenaState.opponentUnit, gArenaState.playerIsMagic);

    max = gArenaState.playerPowerWeight > gArenaState.opponentPowerWeight
        ? gArenaState.playerPowerWeight
        : gArenaState.opponentPowerWeight;

    diff = ABS(gArenaState.playerPowerWeight - gArenaState.opponentPowerWeight);

    if (((diff * 100) / max) <= 20) {
        return 0;
    }

    if (gArenaState.playerPowerWeight < gArenaState.opponentPowerWeight) {
        if (gArenaState.opponentUnit->maxHP != 0) {
            gArenaState.opponentUnit->maxHP -= 1;
            gArenaState.opponentUnit->curHP -= 1;
        }

        if (gArenaState.opponentUnit->pow != 0) {
            gArenaState.opponentUnit->pow -= 1;
        }

        if (gArenaState.opponentUnit->skl != 0) {
            gArenaState.opponentUnit->skl -= 1;
        }

        if (gArenaState.opponentUnit->spd != 0) {
            gArenaState.opponentUnit->spd -= 1;
        }

        if (gArenaState.opponentUnit->def != 0) {
            gArenaState.opponentUnit->def -= 1;
        }

        if (gArenaState.opponentUnit->res != 0) {
            gArenaState.opponentUnit->res -= 1;
        }

        if (gArenaState.opponentUnit->lck != 0) {
            gArenaState.opponentUnit->lck -= 1;
        }
    } else {
        if (gArenaState.opponentUnit->maxHP < 80) {
            gArenaState.opponentUnit->maxHP += 2;
            gArenaState.opponentUnit->curHP += 2;
        }

        if (gArenaState.opponentUnit->pow < 30) {
            gArenaState.opponentUnit->pow += 1;
        }

        if (gArenaState.opponentUnit->skl < 30) {
            gArenaState.opponentUnit->skl += 1;
        }

        if (gArenaState.opponentUnit->spd < 30) {
            gArenaState.opponentUnit->spd += 1;
        }

        if (gArenaState.opponentUnit->def < 30) {
            gArenaState.opponentUnit->def += 1;
        }

        if (gArenaState.opponentUnit->res < 30) {
            gArenaState.opponentUnit->res += 1;
        }

        if (gArenaState.opponentUnit->lck < 30) {
            gArenaState.opponentUnit->lck += 1;
        }
    }

    return 1;
}

void ArenaGenerateMatchupGoldValue(void) {
    int value;

    value = gArenaState.opponentPowerWeight - gArenaState.playerPowerWeight;
    value = 800 + 10 * (value / 2);

    if (value < 1) {
        value = 1;
    }

    gArenaState.matchupGoldValue = value;

    return;
}

int ArenaGetMatchupGoldValue(void) {
    return gArenaState.matchupGoldValue;
}

int ArenaGetResult(void) {
    return gArenaState.result;
}

void ArenaSetResult(int result) {
    gArenaState.result = result;
    return;
}

void ArenaContinueBattle(void) {
    int unk = gGameState.unk3C;

    gActionData.trapType = gBattleTarget.unit.curHP;

    gActionData.suspendPointType = SUSPEND_POINT_DURINGARENA;
    SaveSuspendedGame(3);

    BattleUnwind();

    if (gBattleTarget.unit.curHP == 0) {
        BattleApplyExpGains();
    }

    UpdateUnitDuringBattle(gArenaState.playerUnit, &gBattleActor);

    if (!(unk) || (gBattleTarget.unit.curHP == 0)) {
        RecordUnitBattleResult();
    }

    return;
}

s8 ArenaIsUnitAllowed(struct Unit* unit) {
    if (unit->statusIndex == UNIT_STATUS_SILENCED) {
        return 0;
    }

    if (GetUnitBestWRankType(unit) < 0) {
        return 0;
    }

    return 1;
}

void ArenaSetFallbackWeaponForUnit(struct Unit* unit, u16* pItem) {

    int i;

    u8 arenaWeapons[] = {
        [ITYPE_SWORD] = ITEM_SWORD_IRON,
        [ITYPE_LANCE] = ITEM_LANCE_IRON,
        [ITYPE_AXE] = ITEM_AXE_IRON,
        [ITYPE_BOW] = ITEM_BOW_IRON,
        [ITYPE_STAFF] = ITEM_NONE,
        [ITYPE_ANIMA] = ITEM_ANIMA_FIRE,
        [ITYPE_LIGHT] = ITEM_LIGHT_LIGHTNING,
        [ITYPE_DARK] = ITEM_DARK_FLUX
    };

    if (CanUnitUseWeapon(unit, *pItem) != 0) {
        return;
    }

    for (i = 0; i < 8; i++) {

        if (unit->pClassData->baseRanks[i] != 0) {
            *pItem = MakeNewItem(arenaWeapons[i]);
            return;
        }
    }

    return;
}

void ArenaSetFallbackWeaponsMaybe(void) {
    ArenaSetFallbackWeaponForUnit(gArenaState.playerUnit, &gArenaState.playerWeapon);
    ArenaSetFallbackWeaponForUnit(gArenaState.opponentUnit, &gArenaState.opponentWeapon);

    return;
}
