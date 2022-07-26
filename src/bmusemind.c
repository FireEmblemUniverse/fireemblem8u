#include "global.h"

#include "constants/classes.h"
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
#include "bmtrap.h"
#include "bmtarget.h"

#include "bmusemind.h"

extern struct UnitDefinition gUnknown_03001788;

extern s8 CONST_DATA gUnknown_080D7C44[];

static int sub_802EF70(ProcPtr);
static int sub_802EF80(void);

static struct ProcCmd CONST_DATA sProcScr_ExecWarpStaff[] = {
    PROC_SLEEP(0),
    PROC_CALL_2(sub_802EF70),
    PROC_CALL(sub_802EF80),

    PROC_END,
};

static void AfterItemUse_SetTargetStatus(void);

static struct ProcCmd CONST_DATA sProcScr_SetTargetStatus[] = {
    PROC_SLEEP(1),
    PROC_CALL(AfterItemUse_SetTargetStatus),

    PROC_END,
};

static void sub_8030050(void);

static struct ProcCmd CONST_DATA sProcScr_ExecNightmareStaff[] = {
    PROC_SLEEP(1),
    PROC_CALL(sub_8030050),

    PROC_END,
};

// notifybox.s
void sub_801F9FC(ProcPtr, int, char*);
void sub_801FA8C(ProcPtr, int, s8, int, char*);

// lightrunefx.s
void sub_8021684(ProcPtr, int, int);
void sub_8021818(ProcPtr, int, int);

// minefx.s
void sub_8022300(ProcPtr, int, int);

// ev_triggercheck.s
void sub_80831C8(s8, s8);
void sub_808320C(s8, s8);

// code.s
void sub_80CCA14(ProcPtr);

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

void ExecBarrierStaff(ProcPtr proc) {
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

    gBmMapUnit[unit->yPos][unit->xPos] = -1;

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

    gBmMapUnit[unit->yPos][unit->xPos] = -1;

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

int sub_802EF70(ProcPtr proc) {
    return sub_80377CC(proc);
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

    Proc_StartBlocking(sProcScr_ExecWarpStaff, proc);

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

void ExecNightmare(ProcPtr proc) {
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    BattleInitItemEffectTarget(GetUnit(gActionData.targetIndex));

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}

void ApplyNightmareEffect() {
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

void ExecUnlockStaff(ProcPtr proc) {
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

void ExecLatona(ProcPtr proc) {
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

void ExecVulneraryItem(ProcPtr proc, int amount) {
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

void ExecElixirItem(ProcPtr proc) {
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

void ExecPureWaterItem(ProcPtr proc) {
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    GetUnit(gActionData.subjectIndex)->barrierDuration = 7;

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}

void ExecTorchItem(ProcPtr proc) {
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    GetUnit(gActionData.subjectIndex)->torchDuration = 4;

    gActionData.xOther = gActionData.xMove;
    gActionData.yOther = gActionData.yMove;

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}

void ExecAntitoxinItem(ProcPtr proc) {
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

    gBattleTarget.statusOut = -1;

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

int ApplyStatBoostItem(struct Unit* unit, int itemIdx) {
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

void ExecStatBoostItem(ProcPtr proc) {
    int item;
    int messageId;
    struct Unit* unit = GetUnit(gActionData.subjectIndex);

    item = unit->items[gActionData.itemSlotIndex];

    gBattleTarget.statusOut = -1;

    messageId = ApplyStatBoostItem(unit, gActionData.itemSlotIndex);

    PlaySoundEffect(0x5A);

    sub_801F9FC(proc, GetItemIconId(item), GetStringFromIndex(messageId));

    return;
}

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
    if (unk_r1 <= unk_r2) {
		while (++levelCount < 5) {
			unk_r1 += gUnknown_080D7C44[levelCount];
			if (unk_r1 > unk_r2)
				break;
		}
    }

    levelCount++;
    unit->level -= levelCount;
    unit->exp = 0;

    UnitUpdateUsedItem(unit, itemIdx);

    return levelCount;
}

void ExecJunaFruitItem(ProcPtr proc) {
    int levelCount;
    struct Unit* unit = GetUnit(gActionData.subjectIndex);
    int itemId = unit->items[gActionData.itemSlotIndex];

    gBattleTarget.statusOut = -1;

    levelCount = sub_802F978(unit, gActionData.itemSlotIndex);

    PlaySoundEffect(0x5A);

    sub_801FA8C(proc, GetItemIconId(itemId), 0, levelCount, GetStringFromIndex(0x1E));

    return;
}

void ExecMine(ProcPtr proc) {
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    AddTrap(gActionData.xOther, gActionData.yOther, TRAP_MINE, 0);

    BattleApplyItemEffect(proc);

    gBattleTarget.statusOut = -1;

    sub_8022300(proc, gActionData.xOther, gActionData.yOther);

    return;
}

void ExecLightRune(ProcPtr proc) {
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    AddLightRune(gActionData.xOther, gActionData.yOther);

    BattleApplyItemEffect(proc);

    sub_8021684(proc, gActionData.xOther, gActionData.yOther);

    gBattleTarget.statusOut = -1;

    return;
}

void sub_802FAD0(ProcPtr proc) {
    int xPos, yPos;
    struct Unit* unit;
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    BattleApplyItemEffect(proc);

    xPos = gActionData.xOther;
    yPos = gActionData.yOther;

    sub_8021818(proc, xPos, yPos);

    // Seems to be required
    unit = 0;

    gUnknown_03001788.charIndex = 0x80;
    gUnknown_03001788.classIndex = CLASS_BERSERKER;
    gUnknown_03001788.leaderCharIndex = 1;

    gUnknown_03001788.autolevel = 0;
    gUnknown_03001788.allegiance = 0;
    gUnknown_03001788.level = 1;

    gUnknown_03001788.xPosition = xPos;
    gUnknown_03001788.yPosition = yPos;

    gUnknown_03001788.redaCount = 0;
    gUnknown_03001788.redas = NULL;

    gUnknown_03001788.genMonster = 0;
    gUnknown_03001788.itemDrop = 0;

    gUnknown_03001788.items[0] = ITEM_AXE_STEEL;
    gUnknown_03001788.items[1] = ITEM_AXE_SILVER;
    gUnknown_03001788.items[2] = ITEM_AXE_DEVIL;
    gUnknown_03001788.items[3] = ITEM_AXE_TOMAHAWK;

    gUnknown_03001788.ai[0] = 0;
    gUnknown_03001788.ai[1] = 0;
    gUnknown_03001788.ai[2] = 0;
    gUnknown_03001788.ai[3] = 0;

    // TODO: Can't seem to force the extra register allocation for the return, which is required for match
    unit = GetUnitFromCharId(1); // CHARACTER_EIRIKA
    if (!unit) {
        LoadUnits(&gUnknown_03001788);
    }

    gBattleTarget.statusOut = -1;

    return;
}

void ExecTorchStaff(ProcPtr proc) {
    BattleInitItemEffect(GetUnit(gActionData.subjectIndex),
        gActionData.itemSlotIndex);

    AddTrap(gActionData.xOther, gActionData.yOther, TRAP_TORCHLIGHT, 8);

    BattleApplyItemEffect(proc);
    BeginBattleAnimations();

    return;
}

void ExecDanceRing(ProcPtr proc) {
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

void ActionStaffDoorChestUseItem(ProcPtr proc) {
    int itemId = GetItemIndex(GetUnit(gActionData.subjectIndex)->items[gActionData.itemSlotIndex]);

    gBattleActor.hasItemEffectTarget = 0;

    switch (itemId) {
        case ITEM_STAFF_HEAL:
        case ITEM_STAFF_MEND:
        case ITEM_STAFF_RECOVER:
        case ITEM_STAFF_PHYSIC:
            ExecStandardHeal(proc);
            break;
        case ITEM_STAFF_SILENCE:
        case ITEM_STAFF_SLEEP:
        case ITEM_STAFF_BERSERK:
            ExecStatusStaff(proc);
            break;
        case ITEM_NIGHTMARE:
            ExecNightmare(proc);
            break;
        case ITEM_STAFF_FORTIFY:
            ExecFortify(proc);
            break;
        case ITEM_STAFF_RESTORE:
            ExecRestore(proc);
            break;
        case ITEM_STAFF_RESCUE:
            ExecRescueStaff(proc);
            break;
        case ITEM_STAFF_BARRIER:
            ExecBarrierStaff(proc);
            break;
        case ITEM_STAFF_WARP:
            ExecWarpStaff(proc);
            break;
        case ITEM_STAFF_UNLOCK:
            ExecUnlockStaff(proc);
            break;
        case ITEM_STAFF_REPAIR:
            ExecHammerne(proc);
            break;
        case ITEM_TORCH:
            ExecTorchItem(proc);
            break;
        case ITEM_VULNERARY:
        case ITEM_VULNERARY_2:
            ExecVulneraryItem(proc, 10);
            break;
        case ITEM_ELIXIR:
            ExecElixirItem(proc);
            break;
        case ITEM_PUREWATER:
            ExecPureWaterItem(proc);
            break;
        case ITEM_ANTITOXIN:
            ExecAntitoxinItem(proc);
            break;
        case ITEM_CHESTKEY:
        case ITEM_DOORKEY:
        case ITEM_LOCKPICK:
        case ITEM_CHESTKEY_BUNDLE:
            sub_802F510();
            break;
        case ITEM_HEROCREST:
        case ITEM_KNIGHTCREST:
        case ITEM_ORIONSBOLT:
        case ITEM_ELYSIANWHIP:
        case ITEM_GUIDINGRING:
        case ITEM_MASTERSEAL:
        case ITEM_HEAVENSEAL:
        case ITEM_OCEANSEAL:
        case ITEM_LUNARBRACE:
        case ITEM_SOLARBRACE:
        case ITEM_UNK_C1:
            gBattleActor.weaponBefore = gBattleTarget.weaponBefore = GetUnit(gActionData.subjectIndex)->items[gActionData.itemSlotIndex];

            gBattleActor.weapon = gBattleTarget.weapon = GetUnitEquippedWeapon(GetUnit(gActionData.subjectIndex));

            gBattleTarget.statusOut = -1;

            sub_80CCA14(proc);
            break;
        case ITEM_BOOSTER_HP:
        case ITEM_BOOSTER_POW:
        case ITEM_BOOSTER_SKL:
        case ITEM_BOOSTER_SPD:
        case ITEM_BOOSTER_LCK:
        case ITEM_BOOSTER_DEF:
        case ITEM_BOOSTER_RES:
        case ITEM_BOOSTER_MOV:
        case ITEM_BOOSTER_CON:
        case ITEM_METISSTOME:
            ExecStatBoostItem(proc);
            break;
        case ITEM_STAFF_LATONA:
            ExecLatona(proc);
            break;
        case ITEM_MINE:
            ExecMine(proc);
            break;
        case ITEM_LIGHTRUNE:
            ExecLightRune(proc);
            break;
        case ITEM_STAFF_TORCH:
            ExecTorchStaff(proc);
            break;
        case ITEM_FILLAS_MIGHT:
        case ITEM_NINISS_GRACE:
        case ITEM_THORS_IRE:
        case ITEM_SETS_LITANY:
            ExecDanceRing(proc);
            break;
        case ITEM_JUNAFRUIT:
            ExecJunaFruitItem(proc);
    }

    if (itemId == ITEM_NIGHTMARE) {
        Proc_StartBlocking(sProcScr_ExecNightmareStaff, proc);
        return;
    }

    if (gBattleTarget.statusOut >= 0) {
        Proc_StartBlocking(sProcScr_SetTargetStatus, proc);
    }

    return;
}

void ActionPick(ProcPtr proc) {
    int xPos, yPos;
    gBattleActor.hasItemEffectTarget = 0;

    xPos = gActionData.xOther;
    yPos = gActionData.yOther;

    sub_808320C(xPos, yPos);

    sub_80831C8(xPos, yPos);

    PlaySoundEffect(0xB1);

    gBattleTarget.statusOut = -1;

    if (gBattleTarget.statusOut >= 0) {
        Proc_StartBlocking(sProcScr_SetTargetStatus, proc);
    }

    return;
}

void AfterItemUse_SetTargetStatus() {
    if (gBattleTarget.statusOut < 0) {
        return;
    }

    SetUnitStatus(GetUnit(gActionData.targetIndex), gBattleTarget.statusOut);
    gBattleTarget.statusOut = -1;

    return;
}

void sub_8030050() {
    ApplyNightmareEffect();
    return;
}
