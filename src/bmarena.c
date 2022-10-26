#include "global.h"

#include "bmunit.h"
#include "rng.h"
#include "bmitem.h"
#include "bmbattle.h"

int GetUnitBestWRankType(struct Unit*);
int GetClassBestWRankType(const struct ClassData*);
int sub_803190C(int);
s8 IsWeaponMagic(int);
int GetNearLevel(int);
int GetUnitArenaWeight(struct Unit*, s8);
void LoadArenaOpponentStruct(void);
void LoadArenaWeapons(void);
s8 PrepareBalancedArenaFight(void);
s8 AdjustArenaOpponentPower(void);
void sub_8031EA0(void);
void sub_8031EE4(int);
void sub_8031FC8(void);

void PrepareArenaStruct(struct Unit* unit) {
    int i;

    gUnknown_0203A8F0.playerUnit = unit;
    gUnknown_0203A8F0.opponentUnit = &gUnknown_0203A910;

    gUnknown_03003060 = UNIT_ARENA_LEVEL(unit);

    gUnknown_0203A8F0.playerClassId = unit->pClassData->number;
    gUnknown_0203A8F0.playerWpnType = GetUnitBestWRankType(unit);

    gUnknown_0203A8F0.opponentClassId = sub_803190C(gUnknown_0203A8F0.playerWpnType);
    gUnknown_0203A8F0.opponentWpnType = GetClassBestWRankType(GetClassData(gUnknown_0203A8F0.opponentClassId));

    gUnknown_0203A8F0.playerIsMagic = IsWeaponMagic(gUnknown_0203A8F0.playerWpnType);
    gUnknown_0203A8F0.opponentIsMagic = IsWeaponMagic(gUnknown_0203A8F0.opponentWpnType);

    gUnknown_0203A8F0.playerLevel = unit->level;

    if (UNIT_ARENA_LEVEL(unit) < 5) {
        gUnknown_0203A8F0.oppenentLevel = GetNearLevel(gUnknown_0203A8F0.playerLevel);
    } else {
        gUnknown_0203A8F0.oppenentLevel = GetNearLevel(gUnknown_0203A8F0.playerLevel) + 7;
    }

    LoadArenaOpponentStruct();
    LoadArenaWeapons();

    for (i = 0; i < 10; i++) {
        if (!AdjustArenaOpponentPower()) {
            break;
        }
    }

    for (i = 0; i < 5; i++) {
        if (!PrepareBalancedArenaFight()) {
            break;
        }
    }

    gUnknown_0203A8F0.playerPowerWeight = GetUnitArenaWeight(gUnknown_0203A8F0.playerUnit, gUnknown_0203A8F0.opponentIsMagic);

    gUnknown_0203A8F0.opponentPowerWeight = GetUnitArenaWeight(gUnknown_0203A8F0.opponentUnit, gUnknown_0203A8F0.playerIsMagic);

    sub_8031EA0();

    gUnknown_0203A8F0.unk0B = 1;

    sub_8031EE4(0);

    sub_8031FC8();

    return;
}

void PrepareArena(struct Unit* unit) {
    StoreRNState(&gActionData.item);
    PrepareArenaStruct(unit);

    return;
}

void PrepareArena2(struct Unit* unit) {
    LoadRNState(&gActionData.item);
    PrepareArenaStruct(unit);
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

extern u8 gUnknown_0859D9FC[];
extern u8 gUnknown_0859DA4A[];
extern u8 gUnknown_0859DA22[];

int sub_803190C(int weaponType) {
    int i;
    int promotedFlag;
    int classNum;

    int classCount = 0;
    u8* classList = NULL;

    switch (weaponType) {
        case ITYPE_SWORD:
        case ITYPE_LANCE:
        case ITYPE_AXE:
            classList = gUnknown_0859D9FC;
            break;

        case ITYPE_BOW:
            classList = gUnknown_0859DA4A;
            break;

        case ITYPE_ANIMA:
        case ITYPE_LIGHT:
        case ITYPE_DARK:
            classList = gUnknown_0859DA22;
            break;
    }

    promotedFlag = UNIT_CATTRIBUTES(gUnknown_0203A8F0.playerUnit) & CA_PROMOTED;

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

int GetNearLevel(int level) {
    int result = level + NextRN_N(1 + 2 * 4) - 4;

    if (result < 1) {
        result = 1;
    }

    return result;
}

int GetUnitArenaWeight(struct Unit* unit, s8 opponentIsMagic) {
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

void LoadArenaOpponentStruct(void) {
    int level;
    int i;

    struct UnitDefinition udef;

    struct Unit* unit = &gUnknown_0203A910;

    udef.charIndex = 0xfd;
    udef.classIndex = gUnknown_0203A8F0.opponentClassId;
    udef.allegiance = 0;
    udef.level = gUnknown_0203A8F0.oppenentLevel;
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

    ClearUnit(&gUnknown_0203A910);
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

extern u8 gUnknown_080D7F5C[];

void LoadArenaWeapons(void) {
    u8 hack[8];

    memcpy(hack, gUnknown_080D7F5C, 8);

    gUnknown_0203A8F0.playerWeapon = MakeNewItem(hack[gUnknown_0203A8F0.playerWpnType]);

    gUnknown_0203A8F0.opponentWeapon = MakeNewItem(hack[gUnknown_0203A8F0.opponentWpnType]);

    gUnknown_0203A8F0.range = 1;

    if (gUnknown_0203A8F0.playerWpnType == ITYPE_BOW) {
        gUnknown_0203A8F0.range = 2;
    }

    if (gUnknown_0203A8F0.opponentWpnType == ITYPE_BOW) {
        gUnknown_0203A8F0.range = 2;
    }

    return;
}

extern u16 gUnknown_080D7F64[];

u16 GetArenaBetterItem(u16 item) {
    u8* iter;
    u8 hack[28];

    memcpy(hack, gUnknown_080D7F64, 0x1a);

    for (iter = hack; *iter != (u8) -1; iter++) {
        if (GetItemIndex(item) != *iter) {
            continue;
        }

        if (*++iter != 0) {
            return MakeNewItem(*iter);
        }

        return item;
    }
}

s8 PrepareBalancedArenaFight(void) {
    s8 result = 0;

    gBattleActor.battleAttack = GetUnitPower(gUnknown_0203A8F0.playerUnit) + 5;

    if (gUnknown_0203A8F0.opponentIsMagic) {
        gBattleActor.battleDefense = GetUnitResistance(gUnknown_0203A8F0.playerUnit);
    } else {
        gBattleActor.battleDefense = GetUnitDefense(gUnknown_0203A8F0.playerUnit);
    }

    gBattleTarget.battleAttack = GetUnitPower(gUnknown_0203A8F0.opponentUnit) + 5;

    if (gUnknown_0203A8F0.playerIsMagic) {
        gBattleTarget.battleDefense = GetUnitResistance(gUnknown_0203A8F0.opponentUnit);
    } else {
        gBattleTarget.battleDefense = GetUnitDefense(gUnknown_0203A8F0.opponentUnit);
    }

    if ((gBattleActor.battleAttack - gBattleTarget.battleDefense) < (GetUnitMaxHp(gUnknown_0203A8F0.opponentUnit) / 6)) {
        result = 1;

        if (gUnknown_0203A8F0.playerIsMagic) {
            gUnknown_0203A8F0.opponentUnit->res -= 4;

            if (gUnknown_0203A8F0.opponentUnit->res < 0) {
                gUnknown_0203A8F0.opponentUnit->res = 0;
            }
        } else {
            gUnknown_0203A8F0.opponentUnit->def -= 4;

            if (gUnknown_0203A8F0.opponentUnit->def < 0) {
                gUnknown_0203A8F0.opponentUnit->def = 0;
            }
        }

        gUnknown_0203A8F0.opponentUnit->spd += 1;
        gUnknown_0203A8F0.opponentUnit->skl += 1;
    }

    if (gBattleTarget.battleAttack - gBattleActor.battleDefense < (GetUnitMaxHp(gUnknown_0203A8F0.playerUnit) / 6)) {
        result = 1;

        gUnknown_0203A8F0.opponentUnit->pow += 3;
        gUnknown_0203A8F0.opponentUnit->spd += 2;
        gUnknown_0203A8F0.opponentUnit->skl += 2;

        gUnknown_0203A8F0.opponentWeapon = GetArenaBetterItem(gUnknown_0203A8F0.opponentWeapon);
    }

    return result;
}

s8 AdjustArenaOpponentPower(void) {
    int max;
    int diff;

    gUnknown_0203A8F0.playerPowerWeight = GetUnitArenaWeight(gUnknown_0203A8F0.playerUnit, gUnknown_0203A8F0.opponentIsMagic);

    gUnknown_0203A8F0.opponentPowerWeight = GetUnitArenaWeight(gUnknown_0203A8F0.opponentUnit, gUnknown_0203A8F0.playerIsMagic);

    max = gUnknown_0203A8F0.playerPowerWeight > gUnknown_0203A8F0.opponentPowerWeight
        ? gUnknown_0203A8F0.playerPowerWeight
        : gUnknown_0203A8F0.opponentPowerWeight;

    diff = ABS(gUnknown_0203A8F0.playerPowerWeight - gUnknown_0203A8F0.opponentPowerWeight);

    if (((diff * 100) / max) <= 20) {
        return 0;
    }

    if (gUnknown_0203A8F0.playerPowerWeight < gUnknown_0203A8F0.opponentPowerWeight) {
        if (gUnknown_0203A8F0.opponentUnit->maxHP != 0) {
            gUnknown_0203A8F0.opponentUnit->maxHP -= 1;
            gUnknown_0203A8F0.opponentUnit->curHP -= 1;
        }

        if (gUnknown_0203A8F0.opponentUnit->pow != 0) {
            gUnknown_0203A8F0.opponentUnit->pow -= 1;
        }

        if (gUnknown_0203A8F0.opponentUnit->skl != 0) {
            gUnknown_0203A8F0.opponentUnit->skl -= 1;
        }

        if (gUnknown_0203A8F0.opponentUnit->spd != 0) {
            gUnknown_0203A8F0.opponentUnit->spd -= 1;
        }

        if (gUnknown_0203A8F0.opponentUnit->def != 0) {
            gUnknown_0203A8F0.opponentUnit->def -= 1;
        }

        if (gUnknown_0203A8F0.opponentUnit->res != 0) {
            gUnknown_0203A8F0.opponentUnit->res -= 1;
        }

        if (gUnknown_0203A8F0.opponentUnit->lck != 0) {
            gUnknown_0203A8F0.opponentUnit->lck -= 1;
        }
    } else {
        if (gUnknown_0203A8F0.opponentUnit->maxHP < 80) {
            gUnknown_0203A8F0.opponentUnit->maxHP += 2;
            gUnknown_0203A8F0.opponentUnit->curHP += 2;
        }

        if (gUnknown_0203A8F0.opponentUnit->pow < 30) {
            gUnknown_0203A8F0.opponentUnit->pow += 1;
        }

        if (gUnknown_0203A8F0.opponentUnit->skl < 30) {
            gUnknown_0203A8F0.opponentUnit->skl += 1;
        }

        if (gUnknown_0203A8F0.opponentUnit->spd < 30) {
            gUnknown_0203A8F0.opponentUnit->spd += 1;
        }

        if (gUnknown_0203A8F0.opponentUnit->def < 30) {
            gUnknown_0203A8F0.opponentUnit->def += 1;
        }

        if (gUnknown_0203A8F0.opponentUnit->res < 30) {
            gUnknown_0203A8F0.opponentUnit->res += 1;
        }

        if (gUnknown_0203A8F0.opponentUnit->lck < 30) {
            gUnknown_0203A8F0.opponentUnit->lck += 1;
        }
    }

    return 1;
}

void sub_8031EA0(void) {
    int value;

    value = gUnknown_0203A8F0.opponentPowerWeight - gUnknown_0203A8F0.playerPowerWeight;
    value = 800 + 10 * (value / 2);

    if (value < 1) {
        value = 1;
    }

    gUnknown_0203A8F0.unk08 = value;

    return;
}

int sub_8031ECC(void) {
    return gUnknown_0203A8F0.unk08;
}

int sub_8031ED8(void) {
    return gUnknown_0203A8F0.unk0A;
}

void sub_8031EE4(int result) {
    gUnknown_0203A8F0.unk0A = result;
    return;
}

void sub_8031EF0(void) {
    int unk = gGameState.unk3C;

    gActionData.trapType = gBattleTarget.unit.curHP;

    gActionData.suspendPointType = SUSPEND_POINT_DURINGARENA;
    SaveSuspendedGame(3);

    BattleUnwind();

    if (gBattleTarget.unit.curHP == 0) {
        BattleApplyExpGains();
    }

    UpdateUnitDuringBattle(gUnknown_0203A8F0.playerUnit, &gBattleActor);

    if (!(unk) || (gBattleTarget.unit.curHP == 0)) {
        sub_80A4AA4();
    }

    return;
}

s8 sub_8031F50(struct Unit* unit) {
    if (unit->statusIndex == UNIT_STATUS_SILENCED) {
        return 0;
    }

    if (GetUnitBestWRankType(unit) < 0) {
        return 0;
    }

    return 1;
}

extern u8 gUnknown_080D7F5C[];

void sub_8031F74(struct Unit* unit, u16* pItem) {

    int i;
    u8 hack[8];

    memcpy(hack, gUnknown_080D7F5C, 8);

    if (CanUnitUseWeapon(unit, *pItem) != 0) {
        return;
    }

    for (i = 0; i < 8; i++) {

        if (unit->pClassData->baseRanks[i] != 0) {
            *pItem = MakeNewItem(hack[i]);
            return;
        }
    }

    return;
}

void sub_8031FC8(void) {
    sub_8031F74(gUnknown_0203A8F0.playerUnit, &gUnknown_0203A8F0.playerWeapon);
    sub_8031F74(gUnknown_0203A8F0.opponentUnit, &gUnknown_0203A8F0.opponentWeapon);

    return;
}
