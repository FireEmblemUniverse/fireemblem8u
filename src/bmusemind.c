#include "global.h"

#include "constants/items.h"

#include "bmunit.h"
#include "bmbattle.h"
#include "bmitem.h"
#include "proc.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "mu.h"
#include "rng.h"
#include "uiselecttarget.h"
#include "sallycursor.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmtrick.h"

extern struct UnitDefinition gUnknown_03001788;

extern s8 CONST_DATA gUnknown_080D7C44[];
extern struct ProcCmd CONST_DATA gUnknown_0859BDF0[];

// notifybox.s
void sub_801F9FC(ProcPtr, int, char*);
void sub_801FA8C(ProcPtr, int, s8, int, char*);

// lightrunefx.s
void sub_8021684(ProcPtr, int, int);
void sub_8021818(ProcPtr, int, int);

// minefx.s
void sub_8022300(ProcPtr, int, int);

// bmtrap.s
s8 sub_80377CC(void);

// ev_triggercheck.s
void sub_80831C8(s8, s8);
void sub_808320C(s8, s8);

void ExecStandardHeal(ProcPtr proc) {
    int amount;

    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    BattleInitItemEffectTarget(GetUnit(gActionData.targetIndex));

    amount = GetUnitItemHealAmount(
        GetUnit(gActionData.subjectIndex),
        GetUnit(gActionData.subjectIndex)->items[gActionData.itemSlotIndex]
    );

    AddUnitHp(GetUnit(gActionData.targetIndex), amount);

    gBattleHitIterator->hpChange = gBattleTarget.unit.curHP - GetUnitCurrentHp(GetUnit(gActionData.targetIndex));

    gBattleTarget.unit.curHP = GetUnitCurrentHp(GetUnit(gActionData.targetIndex));

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}

void ExecRestore(ProcPtr proc) {
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    BattleInitItemEffectTarget(GetUnit(gActionData.targetIndex));

    if (GetUnit(gActionData.targetIndex)->statusIndex == UNIT_STATUS_PETRIFY) {
        SetUnitStatus(GetUnit(gActionData.targetIndex), UNIT_STATUS_NONE);
        GetUnit(gActionData.targetIndex)->state &= ~(US_UNSELECTABLE | US_HAS_MOVED | US_HAS_MOVED_AI);
    }

    SetUnitStatus(GetUnit(gActionData.targetIndex), UNIT_STATUS_NONE);

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}

void sub_802EC8C(ProcPtr proc) {
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    BattleInitItemEffectTarget(GetUnit(gActionData.targetIndex));

    GetUnit(gActionData.targetIndex)->barrierDuration = 7;

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}

void GetRescueStaffeePosition(struct Unit* unit, struct Unit* target, int* xOut, int* yOut) {
    int foundDist, dist;
    int ix, iy;

    *xOut = -1;
    *yOut = -1;

    foundDist = 9999;

    GenerateUnitExtendedMovementMap(unit);

    gBmMapUnit[unit->yPos][unit->xPos] = 0xFF;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

            if (gBmMapMovement[iy][ix] > 0x78) {
                continue;
            }

            if (gBmMapUnit[iy][ix] != 0) {
                continue;
            }

            if ((gBmMapHidden[iy][ix] & HIDDEN_BIT_UNIT) != 0) {
                continue;
            }

            if (!CanUnitCrossTerrain(target, gBmMapTerrain[iy][ix])) {
                continue;
            }

            dist = RECT_DISTANCE(ix, iy, unit->xPos, unit->yPos);

            if (foundDist >= dist) {
                foundDist = dist;
                *xOut = ix;
                *yOut = iy;
            }
        }
    }

    if (*xOut >= 0 && *yOut >= 0) {
        return;
    }

    foundDist = 9999;

    GenerateExtendedMovementMap(unit->xPos, unit->yPos, gUnknown_0880BB96);

    gBmMapUnit[unit->yPos][unit->xPos] = 0xFF;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

            if (gBmMapMovement[iy][ix] > 0x78) {
                continue;
            }

            if (gBmMapUnit[iy][ix] != 0) {
                continue;
            }

            if ((gBmMapHidden[iy][ix] & HIDDEN_BIT_UNIT) != 0) {
                continue;
            }

            if (!CanUnitCrossTerrain(target, gBmMapTerrain[iy][ix])) {
                continue;
            }

            dist = RECT_DISTANCE(ix, iy, unit->xPos, unit->yPos);

            if (foundDist >= dist) {
                foundDist = dist;
                *xOut = ix;
                *yOut = iy;
            }
        }
    }

    if (*xOut >= 0 && *yOut >= 0) {
        return;
    }

    *xOut = target->xPos;
    *yOut = target->yPos;

    return;
}

void ExecRescueStaff(ProcPtr proc) {
    int x, y;

    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    BattleInitItemEffectTarget(GetUnit(gActionData.targetIndex));

    GetRescueStaffeePosition(
        GetUnit(gActionData.subjectIndex),
        GetUnit(gActionData.targetIndex),
        &x,
        &y
    );

    GetUnit(gActionData.targetIndex)->xPos = x;
    GetUnit(gActionData.targetIndex)->yPos = y;

    gBattleTarget.changeHP = x;
    gBattleTarget.changePow = y;

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}

int sub_802EF70() {
    return sub_80377CC();
}

int sub_802EF80() {
    MU_End(MU_GetByUnit(GetUnit(gActionData.targetIndex)));

    RefreshEntityBmMaps();
    RenderBmMap();
    SMS_UpdateFromGameData();
    SMS_FlushIndirect();

    // return; // BUG?
}

void ExecWarpStaff(ProcPtr proc) {
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    BattleInitItemEffectTarget(GetUnit(gActionData.targetIndex));

    GetUnit(gActionData.targetIndex)->xPos = gActionData.xOther;
    GetUnit(gActionData.targetIndex)->yPos = gActionData.yOther;

    gBattleTarget.changeHP = gActionData.xOther;
    gBattleTarget.changePow = gActionData.yOther;

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    Proc_StartBlocking(gUnknown_0859BDF0, proc);

    return;
}

void ExecStatusStaff(ProcPtr proc) {
    int accuracy;

    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    BattleInitItemEffectTarget(GetUnit(gActionData.targetIndex));

    accuracy = GetOffensiveStaffAccuracy(
        GetUnit(gActionData.subjectIndex),
        GetUnit(gActionData.targetIndex)
    );

    gBattleActor.battleEffectiveHitRate = accuracy;

    if (!Roll1RN(accuracy)) {
        gBattleHitIterator->attributes |= BATTLE_HIT_ATTR_MISS;
    } else {
        switch (GetItemIndex(gBattleActor.weaponBefore)) {
            case ITEM_STAFF_BERSERK:
                gBattleTarget.statusOut = UNIT_STATUS_BERSERK;
                break;
            case ITEM_STAFF_SILENCE:
                gBattleTarget.statusOut = UNIT_STATUS_SILENCED;
                break;
            case ITEM_STAFF_SLEEP:
                gBattleTarget.statusOut = UNIT_STATUS_SLEEP;
                break;
            case ITEM_MONSTER_STONE:
                switch (gRAMChapterData.chapterPhaseIndex) {
                    case FACTION_BLUE:
                        if (UNIT_FACTION(&gBattleTarget.unit) == FACTION_BLUE) {
                            gBattleTarget.statusOut = UNIT_STATUS_13;
                        } else {
                            gBattleTarget.statusOut = UNIT_STATUS_PETRIFY;
                        }
                        break;
                    case FACTION_RED:
                        if (UNIT_FACTION(&gBattleTarget.unit) == FACTION_RED) {
                            gBattleTarget.statusOut = UNIT_STATUS_13;
                        } else {
                            gBattleTarget.statusOut = UNIT_STATUS_PETRIFY;
                        }
                        break;
                    case FACTION_GREEN:
                        if (UNIT_FACTION(&gBattleTarget.unit) == FACTION_GREEN) {
                            gBattleTarget.statusOut = UNIT_STATUS_13;
                        } else {
                            gBattleTarget.statusOut = UNIT_STATUS_PETRIFY;
                        }
                        break;
                }
                break;
        }
    }

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}

void ExecFortify(ProcPtr proc) {
    int i;
    int amount;
    int targetCount;

    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    BattleInitItemEffectTarget(
        GetUnitFromCharId(GetPlayerLeaderUnitId())
    );

    MakeTargetListForRangedHeal(GetUnit(gActionData.subjectIndex));

    amount = GetUnitItemHealAmount(
        GetUnit(gActionData.subjectIndex),
        GetUnit(gActionData.subjectIndex)->items[gActionData.itemSlotIndex]
    );

    targetCount = GetSelectTargetCount();

    for (i = 0; i < targetCount; i++) {
        AddUnitHp(GetUnit(GetTarget(i)->uid), amount);
    }

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}

// ExecDance?
void sub_802F1D8(ProcPtr proc) {
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    BattleInitItemEffectTarget(GetUnit(gActionData.targetIndex));

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}

// ExecNightmare
void sub_802F208() {
    int i;
    int accuracy;
    int targetCount;

    MakeTargetListForFuckingNightmare(GetUnit(gActionData.subjectIndex));

    targetCount = GetSelectTargetCount();

    for (i = 0; i < targetCount; i++) {
        struct Unit* target = GetUnit(GetTarget(i)->uid);

        accuracy = GetOffensiveStaffAccuracy(
            GetUnit(gActionData.subjectIndex),
            target
        );

        if (Roll1RN(accuracy) == 1) {
            if (target->statusIndex == UNIT_STATUS_NONE) {
                SetUnitStatus(target, UNIT_STATUS_SLEEP);
            }
        }
    }

    return;
}

// ExecUnlock
void sub_802F274(ProcPtr proc) {
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    gBattleTarget.unit.xPos = gActionData.xOther;
    gBattleTarget.unit.yPos = gActionData.yOther;

    gBattleTarget.changeHP = gActionData.xOther;
    gBattleTarget.changePow = gActionData.yOther;

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}

void ExecHammerne(ProcPtr proc) {
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    BattleInitItemEffectTarget(GetUnit(gActionData.targetIndex));

    GetUnit(gActionData.targetIndex)->items[gActionData.trapType] 
        =  MakeNewItem(
            GetUnit(gActionData.targetIndex)->items[gActionData.trapType]
        );

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}

// ExecLatona
void sub_802F30C(ProcPtr proc) {
    int i;
    int targetCount;

    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    BattleInitItemEffectTarget(
        GetUnitFromCharId(GetPlayerLeaderUnitId())
    );

    MakeTargetListForLatona(GetUnit(gActionData.subjectIndex));

    targetCount = GetSelectTargetCount();

    for (i = 0; i < targetCount; i++) {
        struct Unit* target = GetUnit(GetTarget(i)->uid);

        SetUnitHp(target, GetUnitMaxHp(target));
        SetUnitStatus(target, UNIT_STATUS_NONE);
    }

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}

// ExecVulnerary
void ExecSomeSelfHeal(ProcPtr proc, int amount) {
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    AddUnitHp(GetUnit(gActionData.subjectIndex), amount);

    gBattleHitIterator->hpChange = gBattleActor.unit.curHP - GetUnitCurrentHp(GetUnit(gActionData.subjectIndex));

    gBattleActor.unit.curHP = GetUnitCurrentHp(GetUnit(gActionData.subjectIndex));

    gBattleActor.weaponBefore = ITEM_VULNERARY;

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}

// ExecElixir
void sub_802F3E4(ProcPtr proc) {
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    SetUnitHp(
        GetUnit(gActionData.subjectIndex),
        GetUnitMaxHp(GetUnit(gActionData.subjectIndex))
    );

    gBattleHitIterator->hpChange = gBattleActor.unit.curHP - GetUnitCurrentHp(GetUnit(gActionData.subjectIndex));

    gBattleActor.unit.curHP = GetUnitCurrentHp(GetUnit(gActionData.subjectIndex));

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}

// ExecPureWater
void sub_802F450(ProcPtr proc) {
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    GetUnit(gActionData.subjectIndex)->barrierDuration = 7;

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}

// ExecTorchItem
void sub_802F48C(ProcPtr proc) {
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    GetUnit(gActionData.subjectIndex)->torchDuration = 4;

    gActionData.xOther = gActionData.xMove;
    gActionData.yOther = gActionData.yMove;

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}

// ExecAntitoxin
void sub_802F4D0(ProcPtr proc) {
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    SetUnitStatus(GetUnit(gActionData.subjectIndex), UNIT_STATUS_NONE);SetUnitStatus(&gBattleActor.unit, UNIT_STATUS_NONE);

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}

// ExecKeyItem
void sub_802F510() {
    int x, y;

    UnitUpdateUsedItem(
        GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex
    );

    x = GetUnit(gActionData.subjectIndex)->xPos;
    y = GetUnit(gActionData.subjectIndex)->yPos;

    sub_808320C(x - 1, y);
    sub_808320C(x + 1, y);
    sub_808320C(x, y - 1);
    sub_808320C(x, y + 1);

    sub_80831C8(x, y);

    PlaySoundEffect(0xB1);

    gBattleTarget.statusOut = 0xFF;

    return;
}

void sub_802F598(struct Unit* unit, int itemIdx, s8 unk) {

    if (itemIdx != -1) {
        gBattleActor.weaponBefore = gBattleTarget.weaponBefore = unit->items[itemIdx];
    }

    gBattleActor.weapon = gBattleTarget.weapon = GetUnitEquippedWeapon(unit);

    InitBattleUnitWithoutBonuses(&gBattleTarget, unit);

    ApplyUnitDefaultPromotion(unit);

    InitBattleUnitWithoutBonuses(&gBattleActor, unit);

    GenerateBattleUnitStatGainsComparatively(&gBattleActor, &gBattleTarget.unit);

    SetBattleUnitTerrainBonusesAuto(&gBattleActor);
    SetBattleUnitTerrainBonusesAuto(&gBattleTarget);

    if (unk) {
        unit->state |= US_HAS_MOVED;
    }

    if (itemIdx != -1) {
        UnitUpdateUsedItem(unit, itemIdx);
    }

    gBattleHitArray[0].attributes = 0;
    gBattleHitArray[0].info = BATTLE_HIT_INFO_END;
    gBattleHitArray[0].hpChange = 0;

    gBattleStats.config = BATTLE_CONFIG_BIT4;

    return;
}

void sub_802F664(struct Unit* unit, u8 classId, int itemIdx, s8 unk) {

    if (itemIdx != -1) {
        gBattleActor.weaponBefore = gBattleTarget.weaponBefore = unit->items[itemIdx];
    }

    gBattleActor.weapon = gBattleTarget.weapon = GetUnitEquippedWeapon(unit);

    InitBattleUnitWithoutBonuses(&gBattleTarget, unit);

    ApplyUnitPromotion(unit, classId);

    InitBattleUnitWithoutBonuses(&gBattleActor, unit);

    GenerateBattleUnitStatGainsComparatively(&gBattleActor, &gBattleTarget.unit);

    SetBattleUnitTerrainBonusesAuto(&gBattleActor);
    SetBattleUnitTerrainBonusesAuto(&gBattleTarget);

    if (unk) {
        unit->state |= US_HAS_MOVED;
    }

    if (itemIdx != -1) {
        UnitUpdateUsedItem(unit, itemIdx);
    }

    gBattleHitArray[0].attributes = 0;
    gBattleHitArray[0].info = BATTLE_HIT_INFO_END;
    gBattleHitArray[0].hpChange = 0;

    gBattleStats.config = BATTLE_CONFIG_BIT4;

    return;
}

void sub_802F73C() {
    sub_802F664(GetUnit(gActionData.subjectIndex), 1, gActionData.itemSlotIndex, 1);
    BeginBattleAnimations();

    return;
}

void sub_802F760(struct Unit* unit, int item) {
    gBattleActor.weaponBefore = gBattleTarget.weaponBefore = item;
    gBattleActor.weapon = gBattleTarget.weapon = item;

    InitBattleUnit(&gBattleTarget, unit);

    ApplyUnitDefaultPromotion(unit);

    InitBattleUnit(&gBattleActor, unit);

    GenerateBattleUnitStatGainsComparatively(&gBattleActor, &gBattleTarget.unit);

    SetBattleUnitTerrainBonusesAuto(&gBattleActor);
    SetBattleUnitTerrainBonusesAuto(&gBattleTarget);

    gBattleHitArray[0].attributes = 0;
    gBattleHitArray[0].info = BATTLE_HIT_INFO_END;
    gBattleHitArray[0].hpChange = 0;

    gBattleStats.config = BATTLE_CONFIG_BIT4;

    BeginBattleAnimations();

    unit->state |= US_HIDDEN;

    return;
}

int sub_802F808(struct Unit* unit, int itemIdx) {
    const struct ItemStatBonuses* statBonuses;
    int messageId = 0;

    int item = unit->items[itemIdx];

    if (GetItemIndex(item) == ITEM_METISSTOME) {
        unit->state |= US_GROWTH_BOOST;
        UnitUpdateUsedItem(unit, itemIdx);
        return 0x1D;
    }

    statBonuses = GetItemStatBonuses(item);

    unit->maxHP += statBonuses->hpBonus;
    unit->curHP += statBonuses->hpBonus;
    unit->pow += statBonuses->powBonus;
    unit->skl += statBonuses->sklBonus;
    unit->spd += statBonuses->spdBonus;
    unit->def += statBonuses->defBonus;
    unit->res += statBonuses->resBonus;
    unit->lck += statBonuses->lckBonus;
    unit->movBonus += statBonuses->movBonus;
    unit->conBonus += statBonuses->conBonus;

    UnitCheckStatCaps(unit);
    UnitUpdateUsedItem(unit, itemIdx);

    switch (GetItemIndex(item)) {
        case ITEM_BOOSTER_SKL:
            messageId = 0x15;
            break;
        case ITEM_BOOSTER_LCK:
            messageId = 0x17;
            break;
        case ITEM_BOOSTER_HP:
            messageId = 0x1C;
            break;
        case ITEM_BOOSTER_DEF:
            messageId = 0x18;
            break;
        case ITEM_BOOSTER_SPD:
            messageId = 0x16;
            break;
        case ITEM_BOOSTER_RES:
            messageId = 0x19;
            break;
        case ITEM_BOOSTER_MOV:
            messageId = 0x1A;
            break;
        case ITEM_BOOSTER_CON:
            messageId = 0x1B;
            break;
        case ITEM_BOOSTER_POW:
            messageId = UnitHasMagicRank(unit) ? 0x14 : 0x13;
            break;
    }

    return messageId;
}

void sub_802F914(ProcPtr proc) {
    int item;
    int messageId;
    struct Unit* unit = GetUnit(gActionData.subjectIndex);

    item = unit->items[gActionData.itemSlotIndex];

    gBattleTarget.statusOut = 0xFF;

    messageId = sub_802F808(unit, gActionData.itemSlotIndex);

    PlaySoundEffect(0x5A);

    sub_801F9FC(proc, GetItemIconId(item), GetStringFromIndex(messageId));

    return;
}

#if NONMATCHING

int sub_802F978(struct Unit* unit, int itemIdx) {
    int unk_r1 = 0;
    int unk_r2;
    u32 levelCount = 0;

    while (levelCount <= 4) {
        unk_r1 += gUnknown_080D7C44[levelCount];
        levelCount++;
    }

    unk_r2 = NextRN_N(unk_r1);

    levelCount = 0;

    unk_r1 = gUnknown_080D7C44[levelCount];
    // TODO: Can't get this loop to match correctly - it seems to check both of these conditions
    while ((unk_r1 <= unk_r2) && (++levelCount < 5)) {
        unk_r1 += gUnknown_080D7C44[levelCount];
    }

    levelCount++;
    unit->level -= levelCount;
    unit->exp = 0;

    UnitUpdateUsedItem(unit, itemIdx);

    return levelCount;
}

#else // if !NONMATCHING

__attribute__((naked))
int sub_802F978(struct Unit* unit, int itemIdx) {
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, lr}\n\
        adds r5, r0, #0\n\
        adds r6, r1, #0\n\
        movs r1, #0\n\
        movs r4, #0\n\
        ldr r2, _0802F9DC  @ gUnknown_080D7C44\n\
    _0802F984:\n\
        adds r0, r4, r2\n\
        ldrb r0, [r0]\n\
        lsls r0, r0, #0x18\n\
        asrs r0, r0, #0x18\n\
        adds r1, r1, r0\n\
        adds r4, #1\n\
        cmp r4, #4\n\
        bls _0802F984\n\
        adds r0, r1, #0\n\
        bl NextRN_N\n\
        adds r2, r0, #0\n\
        movs r4, #0\n\
        ldr r0, _0802F9DC  @ gUnknown_080D7C44\n\
        movs r1, #0\n\
        ldrsb r1, [r0, r1]\n\
        cmp r1, r2\n\
        bgt _0802F9BE\n\
        adds r3, r0, #0\n\
    _0802F9AA:\n\
        adds r4, #1\n\
        cmp r4, #4\n\
        bhi _0802F9BE\n\
        adds r0, r4, r3\n\
        ldrb r0, [r0]\n\
        lsls r0, r0, #0x18\n\
        asrs r0, r0, #0x18\n\
        adds r1, r1, r0\n\
        cmp r1, r2\n\
        ble _0802F9AA\n\
    _0802F9BE:\n\
        adds r4, #1\n\
        ldrb r0, [r5, #8]\n\
        subs r0, r0, r4\n\
        movs r1, #0\n\
        strb r0, [r5, #8]\n\
        strb r1, [r5, #9]\n\
        adds r0, r5, #0\n\
        adds r1, r6, #0\n\
        bl UnitUpdateUsedItem\n\
        adds r0, r4, #0\n\
        pop {r4, r5, r6}\n\
        pop {r1}\n\
        bx r1\n\
        .align 2, 0\n\
    _0802F9DC: .4byte gUnknown_080D7C44\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCHING

void sub_802F9E0(ProcPtr proc) {
    int levelCount;
    struct Unit* unit = GetUnit(gActionData.subjectIndex);
    int itemId = unit->items[gActionData.itemSlotIndex];

    gBattleTarget.statusOut = 0xFF;

    levelCount = sub_802F978(unit, gActionData.itemSlotIndex);

    PlaySoundEffect(0x5A);

    sub_801FA8C(proc, GetItemIconId(itemId), 0, levelCount, GetStringFromIndex(0x1E));

    return;
}

void sub_802FA4C(ProcPtr proc) {
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    AddTrap(gActionData.xOther, gActionData.yOther, TRAP_MINE, 0);

    BattleApplyItemEffect(proc);

    gBattleTarget.statusOut = 0xFF;

    sub_8022300(proc, gActionData.xOther, gActionData.yOther);

    return;
}

void sub_802FA90(ProcPtr proc) {
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    AddLightRune(gActionData.xOther, gActionData.yOther);

    BattleApplyItemEffect(proc);

    sub_8021684(proc, gActionData.xOther, gActionData.yOther);

    gBattleTarget.statusOut = 0xFF;

    return;
}

#if NONMATCHING

void sub_802FAD0(ProcPtr proc) {
    u8 tmp;
    int xPos, yPos;
    struct Unit* unit;
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    BattleApplyItemEffect(proc);

    xPos = gActionData.xOther;
    yPos = gActionData.yOther;

    sub_8021818(proc, xPos, yPos);

    // Seems to be required
    tmp = 0;

    gUnknown_03001788.charIndex = 0x80;
    gUnknown_03001788.classIndex = CLASS_BERSERKER;
    gUnknown_03001788.leaderCharIndex = 1;

    gUnknown_03001788.autolevel = tmp;
    gUnknown_03001788.allegiance = tmp;
    gUnknown_03001788.level = 1;

    gUnknown_03001788.xPosition = xPos;
    gUnknown_03001788.yPosition = yPos;

    gUnknown_03001788.redaCount = tmp;
    gUnknown_03001788.redas = NULL;

    gUnknown_03001788.genMonster = tmp;
    gUnknown_03001788.itemDrop = tmp;

    gUnknown_03001788.items[0] = ITEM_AXE_STEEL;
    gUnknown_03001788.items[1] = ITEM_AXE_SILVER;
    gUnknown_03001788.items[2] = ITEM_AXE_DEVIL;
    gUnknown_03001788.items[3] = ITEM_AXE_TOMAHAWK;

    gUnknown_03001788.ai[0] = tmp;
    gUnknown_03001788.ai[1] = tmp;
    gUnknown_03001788.ai[2] = tmp;
    gUnknown_03001788.ai[3] = tmp;

    // TODO: Can't seem to force the extra register allocation for the return, which is required for match
    unit = GetUnitFromCharId(1); // CHARACTER_EIRIKA
    if (!unit) {
        LoadUnits(&gUnknown_03001788);
    }

    gBattleTarget.statusOut = 0xFF;

    return;
}

#else // if !NONMATCHING

__attribute__((naked))
void sub_802FAD0(ProcPtr proc) {
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, lr}\n\
        adds r6, r0, #0\n\
        ldr r4, _0802FB78  @ gActionData\n\
        ldrb r0, [r4, #0xc]\n\
        bl GetUnit\n\
        ldrb r1, [r4, #0x12]\n\
        bl BattleInitItemEffect\n\
        adds r0, r6, #0\n\
        bl BattleApplyItemEffect\n\
        ldrb r5, [r4, #0x13]\n\
        ldrb r4, [r4, #0x14]\n\
        adds r0, r6, #0\n\
        adds r1, r5, #0\n\
        adds r2, r4, #0\n\
        bl sub_8021818\n\
        movs r2, #0\n\
        ldr r6, _0802FB7C  @ gUnknown_03001788\n\
        movs r0, #0x80\n\
        strb r0, [r6]\n\
        movs r0, #0x43\n\
        strb r0, [r6, #1]\n\
        movs r0, #1\n\
        strb r0, [r6, #2]\n\
        movs r0, #8\n\
        strb r0, [r6, #3]\n\
        movs r0, #0x3f\n\
        ands r5, r0\n\
        ldrb r1, [r6, #4]\n\
        movs r0, #0x40\n\
        negs r0, r0\n\
        ands r0, r1\n\
        orrs r0, r5\n\
        strb r0, [r6, #4]\n\
        movs r0, #0x3f\n\
        ands r4, r0\n\
        lsls r4, r4, #6\n\
        ldrh r1, [r6, #4]\n\
        ldr r0, _0802FB80  @ 0xFFFFF03F\n\
        ands r0, r1\n\
        orrs r0, r4\n\
        strh r0, [r6, #4]\n\
        strb r2, [r6, #7]\n\
        str r2, [r6, #8]\n\
        ldrb r1, [r6, #5]\n\
        movs r0, #0x11\n\
        negs r0, r0\n\
        ands r0, r1\n\
        movs r1, #0x21\n\
        negs r1, r1\n\
        ands r0, r1\n\
        strb r0, [r6, #5]\n\
        movs r0, #0x20\n\
        strb r0, [r6, #0xc]\n\
        movs r0, #0x21\n\
        strb r0, [r6, #0xd]\n\
        movs r0, #0x27\n\
        strb r0, [r6, #0xe]\n\
        movs r0, #0x29\n\
        strb r0, [r6, #0xf]\n\
        strb r2, [r6, #0x10]\n\
        strb r2, [r6, #0x11]\n\
        strb r2, [r6, #0x12]\n\
        strb r2, [r6, #0x13]\n\
        movs r0, #1\n\
        bl GetUnitFromCharId\n\
        adds r2, r0, #0\n\
        cmp r2, #0\n\
        bne _0802FB68\n\
        adds r0, r6, #0\n\
        bl LoadUnits\n\
    _0802FB68:\n\
        ldr r0, _0802FB84  @ gBattleTarget\n\
        adds r0, #0x6f\n\
        movs r1, #0xff\n\
        strb r1, [r0]\n\
        pop {r4, r5, r6}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _0802FB78: .4byte gActionData\n\
    _0802FB7C: .4byte gUnknown_03001788\n\
    _0802FB80: .4byte 0xFFFFF03F\n\
    _0802FB84: .4byte gBattleTarget\n\
        .syntax divided\n\
    ");
}

#endif // NONMATCHING

void ExecTorchStaff(ProcPtr proc) {
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    AddTrap(gActionData.xOther, gActionData.yOther, TRAP_TORCHLIGHT, 8);

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}

void sub_802FBBC(ProcPtr proc) {
    int status = 0;

    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    BattleInitItemEffectTarget(GetUnit(gActionData.targetIndex));

    switch (GetItemIndex(GetUnit(gActionData.subjectIndex)->items[gActionData.itemSlotIndex])) {
        case ITEM_FILLAS_MIGHT:
            status = UNIT_STATUS_ATTACK;
            break;
        case ITEM_NINISS_GRACE:
            status = UNIT_STATUS_DEFENSE;
            break;
        case ITEM_THORS_IRE:
            status = UNIT_STATUS_CRIT;
            break;
        case ITEM_SETS_LITANY:
            status = UNIT_STATUS_AVOID;
            break;
    }

    SetUnitStatusExt(GetUnit(gActionData.targetIndex), status, 1);

    gBattleStats.config = BATTLE_CONFIG_DANCERING;

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}