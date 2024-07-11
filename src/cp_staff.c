#include "global.h"

#include "cp_common.h"

#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmbattle.h"
#include "bmphase.h"
#include "cp_utility.h"

#include "constants/items.h"

struct AiStaffLutEntry {
    u16 itemId;
    void(*func)(int itemIdx, s8 (*isEnemy)(struct Unit* unit));
};

void AiStaffHealMendRecover(int itemIdx, s8 (*isEnemy)(struct Unit* unit));
void AiStaffPhysicRescue(int itemIdx, s8 (*isEnemy)(struct Unit* unit));
void AiStaffFortify(int itemIdx, s8 (*isEnemy)(struct Unit* unit));
void AiStaffWarp(int itemIdx, s8 (*isEnemy)(struct Unit* unit));
void AiStaffRestore(int itemIdx, s8 (*isEnemy)(struct Unit* unit));
void AiStaffSilence(int itemIdx, s8 (*isEnemy)(struct Unit* unit));
void AiStaffSleepBerserk(int itemIdx, s8 (*isEnemy)(struct Unit* unit));
void AiStaffBarrier(int itemIdx, s8 (*isEnemy)(struct Unit* unit));

const struct AiStaffLutEntry sAiStaffFuncLut[] = {
    { ITEM_STAFF_HEAL,    AiStaffHealMendRecover },
    { ITEM_STAFF_MEND,    AiStaffHealMendRecover },
    { ITEM_STAFF_RECOVER, AiStaffHealMendRecover },
    { ITEM_STAFF_PHYSIC,  AiStaffPhysicRescue },
    { ITEM_STAFF_FORTIFY, AiStaffFortify },
    { ITEM_STAFF_WARP,    AiStaffWarp },
    { ITEM_STAFF_RESCUE,  AiStaffPhysicRescue },
    { ITEM_STAFF_RESTORE, AiStaffRestore },
    { ITEM_STAFF_SILENCE, AiStaffSilence },
    { ITEM_STAFF_SLEEP,   AiStaffSleepBerserk },
    { ITEM_STAFF_BERSERK, AiStaffSleepBerserk },
    { ITEM_STAFF_BARRIER, AiStaffBarrier },
    { 0x0, 0x0 },
};

//! FE8U = 0x0803F9D8
int GetAiStaffFuncIndex(u16 item) {
    u16 itemId;

    int i = 0;

    if (!CanUnitUseStaff(gActiveUnit, item)) {
        return -1;
    }

    itemId = GetItemIndex(item);

    for (; sAiStaffFuncLut[i].itemId != 0; i++) {
        if (itemId != sAiStaffFuncLut[i].itemId) {
            continue;
        }

        if (sAiStaffFuncLut[i].func != 0) {
            return i;
        }
    }

    return -1;
}

//! FE8U = 0x0803FA40
s8 AiTryDoStaff(s8 (*isEnemy)(struct Unit* unit)) {
    int i;

    u8 exp = 0;

    if (gActiveUnit->statusIndex == UNIT_STATUS_SILENCED) {
        return gAiDecision.actionPerformed;
    }

    for (i = 0; i < UNIT_ITEM_COUNT; i++) {
        int funcIndex;
        u16 item = gActiveUnit->items[i];

        if (item == 0) {
            break;
        }

        if (!(GetItemAttributes(item) & IA_STAFF)) {
            continue;
        }

        if (GetItemRequiredExp(item) < exp) {
            continue;
        }

        funcIndex = GetAiStaffFuncIndex(item);

        if (funcIndex == -1) {
            continue;
        }

        sAiStaffFuncLut[funcIndex].func(i, isEnemy);

        if (gAiDecision.actionPerformed != 0) {
            exp = GetItemRequiredExp(item);
        }
    }

    return gAiDecision.actionPerformed;
}

struct AdjPosLutEnt {
    int x;
    int y;
};

struct AdjPosLutEnt CONST_DATA sAiAdjacentPositionLut[] = {
    { +1, +0 },
    { -1, +0 },
    { +0, +1 },
    { +0, -1 },
};

//! FE8U = 0x0803FAE8
s8 GetAiSafestAccessibleAdjacentPosition(int x, int y, struct Vec2* out) {
    int score;
    int ix;
    int iy;
    int i;

    u32 bestScore = 0;

    for (i = 0; i < 4; i++) {
        ix = x + sAiAdjacentPositionLut[i].x;
        iy = y + sAiAdjacentPositionLut[i].y;

        if (gBmMapMovement[iy][ix] >= MAP_MOVEMENT_MAX) {
            continue;
        }

        if (gBmMapUnit[iy][ix] != 0 && gBmMapUnit[iy][ix] != gActiveUnitId) {
            continue;
        }

        score = AiGetTerrainCombatPositionScoreComponent(ix, iy);
        score += AiGetFriendZoneCombatPositionScoreComponent(ix, iy);
        score -= gBmMapOther[iy][ix] / 8;
        score += 0x7FFFFFFF;

        if (bestScore < score) {
            out->x = ix;
            out->y = iy;
            bestScore = score;
        }
    }

    if (bestScore != 0) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x0803FBB8
void AiStaffHealMendRecover(int itemIdx, s8 (*isEnemy)(struct Unit* unit)) {
    int ix;
    int iy;
    struct Vec2 pos;

    u8 lowestHpPerc = 100;

    int xDecision = -1;
    int yDecision = -1;
    int targetId = 0;

    sub_803C490(gActiveUnit);

    GenerateMagicSealMap(-1);

    MarkMovementMapEdges();

    if (gAiState.unk7C != 0) {
        lowestHpPerc = gAiState.unk7C;
    }

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {
            u8 tmpHpPerc;
            struct Unit* unit;

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) {
                continue;
            }

            if (gBmMapUnit[iy][ix] == 0 || gBmMapUnit[iy][ix] == gActiveUnitId) {
                continue;
            }

            unit = GetUnit(gBmMapUnit[iy][ix]);

            if ((gAiState.flags & AI_FLAG_BERSERKED) || (isEnemy == 0) || (isEnemy(unit) != 1)) {

                if ((gAiState.unk7C != 0) || (unit->aiFlags & AI_UNIT_FLAG_0)) {

                    tmpHpPerc = Div(GetUnitCurrentHp(unit) * 100, GetUnitMaxHp(unit));

                    if (tmpHpPerc <= lowestHpPerc && GetAiSafestAccessibleAdjacentPosition(ix, iy, &pos) != 0) {
                        lowestHpPerc = tmpHpPerc;
                        xDecision = pos.x;
                        yDecision = pos.y;
                        targetId = gBmMapUnit[iy][ix];
                    }
                }
            }
        }
    }

    if (xDecision != -1) {
        AiSetDecision(xDecision, yDecision, AI_ACTION_STAFF, targetId, itemIdx, 0, 0);
    }

    return;
}

//! FE8U = 0x0803FD30
void AiStaffPhysicRescue(int itemIdx, s8 (*isEnemy)(struct Unit* unit)) {
    int i;
    struct Vec2 pos;

    u8 lowestHpPerc = 100;
    int xDecision = -1;
    int yDecision = -1;
    int targetId = 0;

    if (gAiState.flags & AI_FLAG_BERSERKED) {
        return;
    }

    sub_803C490(gActiveUnit);

    GenerateMagicSealMap(-1);

    if (gAiState.unk7C != 0) {
        lowestHpPerc = gAiState.unk7C;
    }

    for (i = 1; i < 0xC0; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (gBmMapUnit[unit->yPos][unit->xPos] == gActiveUnitId) {
            continue;
        }

        if (unit->state & (US_HIDDEN | US_DEAD | US_BIT16)) {
            continue;
        }

        if ((gAiState.flags & AI_FLAG_BERSERKED) || (isEnemy == 0) || (isEnemy(unit) != 1)) {
            if ((gAiState.unk7C != 0) || (unit->aiFlags & AI_UNIT_FLAG_0)) {
                u8 tmpHpPerc;

                if (AiIsWithinRectDistance(gActiveUnit->xPos, gActiveUnit->yPos, unit->xPos, unit->yPos, GetUnitMagBy2Range(gActiveUnit) + UNIT_MOV(gActiveUnit)) == 0) {
                    continue;
                }

                BmMapFill(gBmMapRange, 0);

                MapAddInRange(unit->xPos, unit->yPos, GetUnitMagBy2Range(gActiveUnit), 1);

                if (sub_803C284(&pos) == 0) {
                    continue;
                }

                tmpHpPerc = Div(GetUnitCurrentHp(unit) * 100, GetUnitMaxHp(unit));

                if (tmpHpPerc <= lowestHpPerc) {
                    lowestHpPerc = tmpHpPerc;
                    xDecision = pos.x;
                    yDecision = pos.y;
                    targetId = gBmMapUnit[unit->yPos][unit->xPos];
                }
            }
        }
    }

    if (xDecision != -1) {
        AiSetDecision(xDecision, yDecision, AI_ACTION_STAFF, targetId, itemIdx, 0, 0);
    }

    return;
}

//! FE8U = 0x0803FF00
void AiStaffFortify(int itemIdx,  s8 (*isEnemy)(struct Unit* unit)) {
    int ix;
    int iy;
    int tempUnk;

    int bestUnk = 0;
    int xDecision = 0;
    int yDecision = 0;

    if (gAiState.flags & AI_FLAG_BERSERKED) {
        return;
    }

    if (sub_803C364() <= 2) {
        return;
    }

    sub_803C490(gActiveUnit);

    GenerateMagicSealMap(-1);

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) {
                continue;
            }

            if (gBmMapUnit[iy][ix] == 0 || gBmMapUnit[iy][ix] == gActiveUnitId) {
                BmMapFill(gBmMapRange, 0);

                MapAddInRange(ix, iy, GetUnitMagBy2Range(gActiveUnit), 1);

                tempUnk = sub_803C3B0();

                if (tempUnk > bestUnk) {
                    bestUnk = tempUnk;
                    xDecision = ix;
                    yDecision = iy;
                }
            }
        }
    }

    if (bestUnk > 1) {
        AiSetDecision(xDecision, yDecision, AI_ACTION_STAFF, 0, itemIdx, 0, 0);
    }

    return;
}

//! FE8U = 0x0804000C
void AiStaffWarp(int itemIdx,  s8 (*isEnemy)(struct Unit* unit)) {
    int ix;
    int iy;
    struct Vec2 out;

    u8 level = 0;
    int xDecision = 0;
    int yDecision = 0;
    int targetId = 0;

    if (gAiState.flags & AI_FLAG_BERSERKED) {
        return;
    }

    sub_803C490(gActiveUnit);

    GenerateMagicSealMap(-1);
    MarkMovementMapEdges();

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {
            struct Unit* unit;

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) {
                continue;
            }

            if (gBmMapUnit[iy][ix] == 0) {
                continue;
            }

            unit = GetUnit(gBmMapUnit[iy][ix]);

            if ((gAiState.flags & AI_FLAG_BERSERKED) || (isEnemy == 0) || (isEnemy(unit) != 1)) {
                if (unit->aiFlags & (AI_UNIT_FLAG_0 | AI_UNIT_FLAG_3)) {
                    continue;
                }

                if (unit->level < level) {
                    continue;
                }

                if (GetAiSafestAccessibleAdjacentPosition(ix, iy, &out) != 0) {
                    level = unit->level;
                    xDecision = out.x;
                    yDecision = out.y;
                    targetId = gBmMapUnit[iy][ix];
                }
            }
        }
    }

    if ((level != 0) && (sub_8040668(&out) != 0)) {
        AiSetDecision(xDecision, yDecision, AI_ACTION_STAFF, targetId, itemIdx, out.x, out.y);
    }

    return;
}

//! FE8U = 0x08040164
void AiStaffRestore(int itemIdx, s8 (*isEnemy)(struct Unit* unit)) {
    int ix;
    int iy;
    struct Vec2 pos;

    u8 bestLevel = 0;
    int xDecision = 0;
    int yDecision = 0;
    int targetId = 0;

    if (gAiState.flags & AI_FLAG_BERSERKED) {
        return;
    }

    sub_803C490(gActiveUnit);

    GenerateMagicSealMap(-1);
    MarkMovementMapEdges();

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {
            struct Unit* unit;

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) {
                continue;
            }

            if (gBmMapUnit[iy][ix] == 0) {
                continue;
            }

            unit = GetUnit(gBmMapUnit[iy][ix]);

            if ((gAiState.flags & AI_FLAG_BERSERKED) || (isEnemy == 0) || (isEnemy(unit) != 1)) {
                if (unit->statusIndex == UNIT_STATUS_NONE) {
                    continue;
                }

                if (unit->level < bestLevel) {
                    continue;
                }

                if (GetAiSafestAccessibleAdjacentPosition(ix, iy, &pos) != 0) {
                    bestLevel = unit->level;
                    xDecision = pos.x;
                    yDecision = pos.y;
                    targetId = gBmMapUnit[iy][ix];
                }
            }
        }
    }

    if (bestLevel != 0) {
        AiSetDecision(xDecision, yDecision, AI_ACTION_STAFF, targetId, itemIdx, 0, 0);
    }

    return;
}

//! FE8U = 0x080402A8
s8 sub_80402A8(struct Unit* unit) {
    int i;

    for (i = 0; i < UNIT_ITEM_COUNT; i++) {
        u16 item = unit->items[i];

        if (item == 0) {
            return 0;
        }

        if (!(GetItemAttributes(item) & (IA_WEAPON | IA_STAFF | IA_LOCK_3))) {
            continue;
        }

        if (CanUnitUseWeapon(unit, item) || CanUnitUseStaff(unit, item)) {
            return 1;
        }

    }

    return 0;
}

//! FE8U = 0x08040300
u8 GetAiSilenceEffectivenessScore(struct Unit* unit) {
    u16 item;

    u8 score = GetOffensiveStaffAccuracy(gActiveUnit, unit);

    if (score < 5) {
        return 0;
    }

    score += GetUnitPower(unit);

    item = GetUnitEquippedWeapon(unit);
    if ((item != 0) && (GetItemAttributes(item) & IA_MAGIC)) {
        score *= 2;
    }

    return score;
}

//! FE8U = 0x08040354
void AiStaffSilence(int itemIdx, s8 (*isEnemy)(struct Unit* unit)) {
    u8 tmp;
    int i;
    struct Vec2 pos;

    u8 bestUnk = 0;
    int xDecision = 0;
    int yDecision = 0;
    int targetId = 0;

    if (gAiState.flags & AI_FLAG_BERSERKED) {
        return;
    }

    sub_803C490(gActiveUnit);
    GenerateMagicSealMap(-1);

    for (i = 1; i < 0xC0; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (unit->state & (US_HIDDEN | US_DEAD | US_BIT16)) {
            continue;
        }

        if ((gAiState.flags & AI_FLAG_BERSERKED) || (isEnemy == 0) || (isEnemy(unit) != 0)) {

            if (unit->statusIndex == UNIT_STATUS_SILENCED) {
                continue;
            }

            if (!sub_803C44C(unit)) {
                continue;
            }

            if (AiIsWithinRectDistance(gActiveUnit->xPos, gActiveUnit->yPos, unit->xPos, unit->yPos, GetUnitMagBy2Range(gActiveUnit) + UNIT_MOV(gActiveUnit)) == 0) {
                continue;
            }

            if (sub_80402A8(unit) == 0) {
                continue;
            }

            tmp = GetAiSilenceEffectivenessScore(unit);

            if (tmp == 0) {
                continue;
            }

            if (tmp >= bestUnk) {
                BmMapFill(gBmMapRange, 0);

                MapAddInRange(unit->xPos, unit->yPos, GetUnitMagBy2Range(gActiveUnit), 1);

                if (sub_803C284(&pos) != 0) {
                    bestUnk = tmp;
                    xDecision = pos.x;
                    yDecision = pos.y;
                    targetId = unit->index;
                }
            }
        }
    }

    if (bestUnk != 0) {
        AiSetDecision(xDecision, yDecision, AI_ACTION_STAFF, targetId, itemIdx, 0, 0);
    }

    return;
}

//! FE8U = 0x080404E0
void AiStaffSleepBerserk(int itemIdx, s8 (*isEnemy)(struct Unit* unit)) {
    u8 accuracy;
    int i;
    struct Vec2 pos;

    u8 best = 0;
    int xDecision = 0;
    int yDecision = 0;
    int targetId = 0;

    if (gAiState.flags & AI_FLAG_BERSERKED) {
        return;
    }

    sub_803C490(gActiveUnit);
    GenerateMagicSealMap(-1);

    for (i = 1; i < 0xC0; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (unit->state & (US_HIDDEN | US_DEAD | US_BIT16)) {
            continue;
        }

        if ((gAiState.flags & AI_FLAG_BERSERKED) || (isEnemy == 0) || (isEnemy(unit) != 0)) {
            if (unit->statusIndex != UNIT_STATUS_NONE) {
                continue;
            }

            if (AiIsWithinRectDistance(gActiveUnit->xPos, gActiveUnit->yPos, unit->xPos, unit->yPos, GetUnitMagBy2Range(gActiveUnit) + UNIT_MOV(gActiveUnit)) == 0) {
                continue;
            }

            if (!sub_80402A8(unit)) {
                continue;
            }

            accuracy = GetOffensiveStaffAccuracy(gActiveUnit, unit);

            if (accuracy < 5) {
                continue;
            }

            if (accuracy + unit->level < best)  {
                continue;
            }

            BmMapFill(gBmMapRange, 0);

            MapAddInRange(unit->xPos, unit->yPos, GetUnitMagBy2Range(gActiveUnit), 1);

            if (sub_803C284(&pos) != 0) {
                best = unit->level;
                xDecision = pos.x;
                yDecision = pos.y;
                targetId = unit->index;
            }
        }
    }

    if (best != 0) {
        AiSetDecision(xDecision, yDecision, AI_ACTION_STAFF, targetId, itemIdx, 0, 0);
    }

    return;
}

//! FE8U = 0x08040664
void AiStaffBarrier(int itemIdx, s8 (*isEnemy)(struct Unit* unit)) {
    return;
}

//! FE8U = 0x08040668
s8 sub_8040668(struct Vec2* out) {
    int ix;
    int iy;

    u8 best = 0xff;
    u8 tmpRangeA = 0xff;
    u8 tmpRangeB = 0xff;

    int xDecision = 0;
    int yDecision = 0;

    const s8* cost = GetUnitMovementCost(gActiveUnit);

    int faction = GetCurrentPhase();
    int i;

    for (i = faction + 1; i < faction + 0x80; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (unit->state & (US_HIDDEN | US_DEAD | US_RESCUED | US_BIT16)) {
            continue;
        }

        sub_8041054(unit);

        for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
            for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {
                if (gBmMapRange[iy][ix] > MAP_MOVEMENT_MAX) {
                    continue;
                }

                if (gBmMapUnit[iy][ix] != 0) {
                    if (AreUnitsAllied(unit->index, gBmMapUnit[iy][ix]) != 0) {
                        continue;
                    }

                    if (tmpRangeA > gMapRangeSigned[iy][ix]) {
                        tmpRangeA = gBmMapRange[iy][ix];
                    }
                } else {
                    if (cost[gBmMapTerrain[iy][ix]] <= 0) {
                        continue;
                    }

                    if (gMapMovementSigned[iy][ix] <= MAP_MOVEMENT_MAX) {
                        continue;
                    }

                    if (tmpRangeB > gMapRangeSigned[iy][ix]) {
                        xDecision = ix;
                        yDecision = iy;
                        tmpRangeB = gBmMapRange[iy][ix];
                    }
                }
            }
        }

        if (tmpRangeA == 0xff) {
            continue;
        }

        if (best < tmpRangeA) {
            continue;
        }

        if (tmpRangeB == 0xff) {
            continue;
        }

        out->x = xDecision;
        out->y = yDecision;
        best = tmpRangeA;

    }

    if (best != 0xff) {
        return 1;
    }

    return 0;
}
