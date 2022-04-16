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

extern struct ProcCmd CONST_DATA gUnknown_0859BDF0[];

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