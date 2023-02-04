#include "global.h"

#include "cp_common.h"

#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmarch.h"
#include "bmitem.h"
#include "bmphase.h"
#include "cp_utility.h"
#include "bmbattle.h"
#include "cp_data.h"

#include "constants/items.h"

struct AiCombatSimulationSt {
    /* 00 */ u8 xMove;
    /* 01 */ u8 yMove;
    /* 02 */ u8 targetId;
    /* 04 */ u16 itemSlot;
    /* 08 */ u32 score;
};

extern const struct AiCombatScoreCoefficients* gUnknown_030017D8;

void sub_803D880(struct Unit*, u16);
s8 sub_803D998(s8 (*isEnemy)(struct Unit* unit), struct AiCombatSimulationSt*);
s8 sub_803DB60(void);
s8 sub_803DCC4(struct AiCombatSimulationSt*);
s8 sub_803DD84(struct AiCombatSimulationSt*, u16);
u32 sub_803DE5C(int, int, struct AiCombatSimulationSt*);
s8 sub_803DEC8(struct AiCombatSimulationSt*);
void sub_803E178(struct AiCombatSimulationSt*);
int sub_803E1EC(int, int, struct Unit*);

//! FE8U = 0x0803D450
s8 sub_803D450(s8 (*isEnemy)(struct Unit* unit)) {
    struct AiCombatSimulationSt tmpResult;
    struct AiCombatSimulationSt finalResult;

    int i;

    finalResult.targetId = 0;
    finalResult.score = 0;

    if (gActiveUnit->state & US_IN_BALLISTA) {
        BmMapFill(gBmMapMovement, -1);
        gBmMapMovement[gActiveUnit->yPos][gActiveUnit->xPos] = 0;

        if (GetRiddenBallistaAt(gActiveUnit->xPos, gActiveUnit->yPos) != 0) {
            goto _0803D628;
        }

        TryRemoveUnitFromBallista(gActiveUnit);
    } else {
        if (UNIT_CATTRIBUTES(gActiveUnit) & CA_STEAL) {

            if (GetUnitItemCount(gActiveUnit) < UNIT_ITEM_COUNT) {
                GenerateUnitMovementMap(gActiveUnit);
                MarkMovementMapEdges();

                if (sub_803DB60() == 1) {
                    return 0;
                }
            }
        }

        if (gAiState.flags & AI_FLAG_1) {
            BmMapFill(gBmMapMovement, -1);
            gBmMapMovement[gActiveUnit->yPos][gActiveUnit->xPos] = 0;
        } else {
            GenerateUnitMovementMap(gActiveUnit);
        }

        if (UnitHasMagicRank(gActiveUnit)) {
            GenerateMagicSealMap(-1);
        }
    }

    SetWorkingBmMap(gBmMapRange);

    for (i = 0; i < UNIT_ITEM_COUNT; i++) {
        u16 item = gActiveUnit->items[i];

        if (item == 0) {
            break;
        }

        if (item == ITEM_NIGHTMARE) {
            continue;
        }

        if (!CanUnitUseWeapon(gActiveUnit, item)) {
            continue;
        }

        tmpResult.itemSlot = i;

        {
            int uid;
            for (uid = 1; uid < 0xC0; uid++) {
                struct Unit* unit = GetUnit(uid);

                if (!UNIT_IS_VALID(unit)) {
                    continue;
                }

                if (unit->state & (US_HIDDEN | US_DEAD | US_RESCUED | US_BIT16)) {
                    continue;
                }

                if (!isEnemy(unit)) {
                    continue;
                }

                if (!AiReachesByBirdsEyeDistance(gActiveUnit, unit, item)) {
                    continue;
                }

                sub_803D880(unit, item);

                tmpResult.targetId = unit->index;

                if (!sub_803DCC4(&tmpResult)) {
                    continue;
                }

                if (tmpResult.score >= finalResult.score) {
                    finalResult = tmpResult;
                    finalResult.itemSlot = i;
                }
            }
        }
    }

_0803D628:
    if (UNIT_CATTRIBUTES(gActiveUnit) & CA_BALLISTAE) {
        if (sub_803D998(isEnemy, &tmpResult) == 1) {
            if (tmpResult.score >= finalResult.score) {
                finalResult = tmpResult;
            }
        }
    }

    if ((finalResult.score != 0) || (finalResult.targetId != 0)) {
        AiSetDecision(finalResult.xMove, finalResult.yMove, 1, finalResult.targetId, finalResult.itemSlot, 0, 0);

        if ((s8)finalResult.itemSlot != -1) {
            TryRemoveUnitFromBallista(gActiveUnit);
        }
    }
}

//! FE8U = 0x0803D6B8
s8 sub_803D6B8(s8 (*isEnemy)(struct Unit* unit)) {
    struct AiCombatSimulationSt tmpResult;
    struct AiCombatSimulationSt finalResult;

    int i;

    finalResult.targetId = 0;
    finalResult.score = 0;

    if (gActiveUnit->state & US_IN_BALLISTA) {
        BmMapFill(gBmMapMovement, -1);
        gBmMapMovement[gActiveUnit->yPos][gActiveUnit->xPos] = 0;

        if (GetRiddenBallistaAt(gActiveUnit->xPos, gActiveUnit->yPos) != 0) {
            goto _0803D7EA;
        }

        TryRemoveUnitFromBallista(gActiveUnit);
    }

    SetWorkingBmMap(gBmMapRange);

    for (i = 0; i < UNIT_ITEM_COUNT; i++) {
        u16 item = gActiveUnit->items[i];

        if (item == 0) {
            break;
        }

        if (item == ITEM_NIGHTMARE) {
            continue;
        }

        if (!CanUnitUseWeapon(gActiveUnit, item)) {
            continue;
        }

        tmpResult.itemSlot = i;

        {
            int uid;
            for (uid = 1; uid < 0xC0; uid++) {
                struct Unit* unit = GetUnit(uid);

                if (!UNIT_IS_VALID(unit)) {
                    continue;
                }

                if (unit->state & (US_HIDDEN | US_DEAD | US_RESCUED | US_BIT16)) {
                    continue;
                }

                if (!isEnemy(unit)) {
                    continue;
                }

                if (!AiReachesByBirdsEyeDistance(gActiveUnit, unit, item)) {
                    continue;
                }

                sub_803D880(unit, item);

                tmpResult.targetId = unit->index;

                if (!sub_803DCC4(&tmpResult)) {
                    continue;
                }

                if (tmpResult.score >= finalResult.score) {
                    finalResult = tmpResult;
                    finalResult.itemSlot = i;
                }
            }
        }
    }

_0803D7EA:
    if (UNIT_CATTRIBUTES(gActiveUnit) & CA_BALLISTAE) {
        if (sub_803D998(isEnemy, &tmpResult) == 1) {
            if (tmpResult.score >= finalResult.score) {
                finalResult = tmpResult;
            }
        }
    }

    if ((finalResult.score != 0) || (finalResult.targetId != 0)) {
        AiSetDecision(finalResult.xMove, finalResult.yMove, 1, finalResult.targetId, finalResult.itemSlot, 0, 0);

        if ((s8)finalResult.itemSlot != -1) {
            TryRemoveUnitFromBallista(gActiveUnit);
        }
    }
}

//! FE8U = 0x0803D880
void sub_803D880(struct Unit* unit, u16 item) {
    BmMapFill(gBmMapRange, 0);
    MapAddInBoundedRange(unit->xPos, unit->yPos, GetItemMinRange(item), GetItemMaxRange(item));

    return;
}

//! FE8U = 0x0803D8D4
void sub_803D8D4(struct Unit* unit, u16 move, u16 item) {
    int ix;
    int iy;

    SetWorkingMoveCosts(GetUnitMovementCost(unit));

    SetWorkingBmMap(gBmMapMovement);
    GenerateMovementMap(unit->xPos, unit->yPos, move, unit->index);

    BmMapFill(gBmMapRange, 0);

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) {
                continue;
            }

            MapAddInBoundedRange(ix, iy, GetItemMinRange(item), GetItemMaxRange(item));
        }
    }

    return;
}

extern u8 gUnknown_080D867C[];

//! FE8U = 0x0803D998
s8 sub_803D998(s8 (*isEnemy)(struct Unit* unit), struct AiCombatSimulationSt* st) {
    struct AiCombatSimulationSt tmpResult;

    int iy;
    int ix;
    int i;

    u16 item;

    int ballistaCount = 0;

    u8 hack[4];
    memcpy(hack, gUnknown_080D867C, 3);

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) {
                continue;
            }

            item = GetBallistaItemAt(ix, iy);

            if (item != 0) {
                ballistaCount++;
                ((s8**)(gBmMapMovement))[iy][ix] = item;
            } else {
                ((s8**)(gBmMapMovement))[iy][ix] = -1;
            }
        }
    }

    if (ballistaCount == 0) {
        return 0;
    }

    st->targetId = 0;
    st->score = 0;

    for (i = 0; i < 3; i++) {
        item = hack[i];
        st->itemSlot = -1;

        {
            int uid;
            for (uid = 1; uid < 0xC0; uid++) {
                struct Unit* unit = GetUnit(uid);

                if (!UNIT_IS_VALID(unit)) {
                    continue;
                }

                if (unit->state & (US_HIDDEN | US_DEAD | US_RESCUED | US_BIT16)) {
                    continue;
                }

                if (!isEnemy(unit)) {
                    continue;
                }

                if (!AiReachesByBirdsEyeDistance(gActiveUnit, unit, item)) {
                    continue;
                }

                sub_803D880(unit, item);

                tmpResult.targetId = unit->index;

                if (!sub_803DD84(&tmpResult, item)) {
                    continue;
                }

                if (tmpResult.score >= st->score) {
                    st->xMove = tmpResult.xMove;
                    st->yMove = tmpResult.yMove;
                    st->targetId = tmpResult.targetId;
                    st->score = tmpResult.score;
                }
            }
        }
    }

    if ((st->score != 0) || (st->targetId != 0)) {
        return 1;
    }

    return 0;
}

//! FE8U = 0x0803DB08
u8 sub_803DB08(int x, int y) {

    if (((s8**)(gBmMapMovement))[y][x] >= MAP_MOVEMENT_MAX) {
        return -1;
    }

    if ((gBmMapUnit[y][x] != 0) && (gBmMapUnit[y][x] != gActiveUnitId)) {
        return -1;

    }

    return gBmMapMovement[y][x];
}

//! FE8U = 0x0803DB60
s8 sub_803DB60(void) {
    int ix;
    int iy;

    struct Vec2 pos;

    u8 itemSlot = 0;
    u8 rank = 0xff;
    u8 target = 0;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {
            struct Vec2 posTmp;
            struct Unit* unit;
            s8 slotTmp;
            u8 rankTmp;

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) {
                continue;
            }

            if (gBmMapUnit[iy][ix] == 0) {
                continue;
            }

            if (AreUnitsAllied(gActiveUnitId, gBmMapUnit[iy][ix]) == 1) {
                continue;
            }

            if (!AiFindBestAdjacentPositionByFunc(ix, iy, sub_803DB08, &posTmp)) {
                continue;
            }

            unit = GetUnit(gBmMapUnit[iy][ix]);

            if (gActiveUnit->spd < unit->spd) {
                continue;
            }

            slotTmp = AiGetUnitStealItemSlot(unit);

            if (slotTmp < 0) {
                continue;
            }

            rankTmp = AiGetItemStealRank(ITEM_INDEX(unit->items[slotTmp]));

            if (rank < rankTmp) {
                continue;
            }

            rank = rankTmp;
            pos.x = posTmp.x;
            pos.y = posTmp.y;
            target = gBmMapUnit[iy][ix];
            itemSlot = slotTmp;
        }
    }

    if (rank != 0xFF) {
        gActiveUnit->_u46++;
        AiSetDecision(pos.x, pos.y, 3, target, itemSlot, 0, 0);

        return 1;
    }

    return 0;
}

//! FE8U = 0x0803DCC4
s8 sub_803DCC4(struct AiCombatSimulationSt* st) {
    int ix;
    int iy;

    u32 score = 0;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {
            u32 scoreTmp;

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) {
                continue;
            }

            if (((s8**)(gBmMapRange))[iy][ix] == 0) {
                continue;
            }

            if (gBmMapUnit[iy][ix] != 0 && gBmMapUnit[iy][ix] != gActiveUnitId) {
                continue;
            }

            scoreTmp = sub_803DE5C(ix, iy, st);

            if (scoreTmp <= score) {
                continue;
            }

            st->xMove = ix;
            st->yMove = iy;
            score = scoreTmp;
        }
    }

    if (score == 0) {
        return 0;
    }

    return sub_803DEC8(st);
}

//! FE8U = 0x0803DD84
s8 sub_803DD84(struct AiCombatSimulationSt* st, u16 item) {
    int ix;
    int iy;

    u32 score = 0;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {
            u32 scoreTmp;

            if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) {
                continue;
            }

            if (((s8**)(gBmMapMovement))[iy][ix] != (u8)item) {
                continue;
            }

            if (((s8**)(gBmMapRange))[iy][ix] == 0) {
                continue;
            }

            if (gBmMapUnit[iy][ix] != 0 && gBmMapUnit[iy][ix] != gActiveUnitId) {
                continue;
            }

            scoreTmp = sub_803DE5C(ix, iy, st);

            if (scoreTmp <= score) {
                continue;
            }

            st->xMove = ix;
            st->yMove = iy;
            score = scoreTmp;
        }
    }

    if (score == 0) {
        return 0;
    }

    return sub_803DEC8(st);
}

//! FE8U = 0x0803DE5C
u32 sub_803DE5C(int x, int y, struct AiCombatSimulationSt* st) {
    int score;

    score = sub_803E1EC(x, y, GetUnit(st->targetId));
    score += sub_803E23C(x, y);
    score += sub_803E27C(x, y);
    score -= ((s8**)(gBmMapMovement))[y][x];
    score -= gBmMapOther[y][x] / 8;

    score += 0x7FFFFFFF;

    return score;
}

//! FE8U = 0x0803DEC4
s8 sub_803DEC4(struct AiCombatSimulationSt* st) {
    return 0;
}

//! FE8U = 0x0803DEC8
s8 sub_803DEC8(struct AiCombatSimulationSt* st) {
    if (st->itemSlot != 0xFFFF) {
        BattleGenerateSimulation(gActiveUnit, GetUnit(st->targetId), st->xMove, st->yMove, st->itemSlot);
    } else {
        BattleGenerateBallistaSimulation(gActiveUnit, GetUnit(st->targetId), st->xMove, st->yMove);
    }

    if (!sub_803DEC4(st)) {
        sub_803E178(st);
        return 1;
    }

    return 0;
}

//! FE8U = 0x0803DF34
int sub_803DF34(void) {
    int score;

    if (gBattleTarget.unit.curHP == 0) {
        return 50;
    }

    score = (gBattleActor.battleAttack - gBattleTarget.battleDefense) * gBattleActor.battleEffectiveHitRate;

    if (score < 0) {
        score = 0;
    }

    score = Div(score, 100);
    score = gUnknown_030017D8->coeffDamageDealt * score;

    if (score > 40) {
        score = 40;
    }

    return score;
}

//! FE8U = 0x0803DF94
int sub_803DF94(void) {
    int score;

    score = 20 - gBattleTarget.unit.curHP;
    score = gUnknown_030017D8->coeffLowHpOpponent * score;

    if (score < 0) {
        score = 0;
    }

    return score;
}

struct RangeScore {
    /* 00 */ s8 x;
    /* 01 */ s8 y;
    /* 02 */ s8 score;
};

extern struct RangeScore gUnknown_085A91F0[];

//! FE8U = 0x0803DFBC
int sub_803DFBC(void) {
    struct RangeScore* it;
    int score = 0;

    for (it = gUnknown_085A91F0; it->x != 0x7f; it++) {
        u8 uVar6 = gBattleActor.unit.xPos + it->x;
        u8 uVar7 = gBattleActor.unit.yPos + it->y;

        u8 uid = gBmMapUnit[uVar7][uVar6];

        if (uVar6 >= gBmMapSize.x) {
            continue;
        }

        if (uVar7 >= gBmMapSize.y) {
            continue;
        }

        if (uid == 0) {
            continue;
        }

        if (AreUnitsAllied(gBattleActor.unit.index, uid) == 1) {
            score += it->score;
        }
    }

    score = gUnknown_030017D8->coeffFriendZone * score;

    if (score > 10) {
        score = 10;
    }

    return score;
}

//! FE8U = 0x0803E068
int sub_803E068(void) {
    u8 rank = AiGetClassRank(gBattleTarget.unit.pClassData->number);

    int score;

    score = gUnknown_030017D8->classRankBonuses[rank];
    score = gUnknown_030017D8->coeffClassRankBonus * score;

    if (score > 20) {
        score = 20;
    }

    return score;
}

//! FE8U = 0x0803E09C
int sub_803E09C(void) {
    #if NONMATCHING

    int turn = gRAMChapterData.chapterTurnNumber;

    #else // if !NONMATCHING

    register int turn asm("r0") = gRAMChapterData.chapterTurnNumber;

    #endif // NONMATCHING

    return turn * gUnknown_030017D8->coeffTurnNumber;
}

//! FE8U = 0x0803E0B4
int sub_803E0B4(void) {
    int score;

    if (gBattleTarget.weapon == 0) {
        return -10;
    }

    score = (gBattleTarget.battleAttack - gBattleActor.battleDefense);
    score = gBattleTarget.battleEffectiveHitRate * score;

    if (score < 0) {
        score = 0;
    }

    score = Div(score, 100);
    score = gUnknown_030017D8->coeffDamageTaken * score;

    if (score > 40) {
        score = 40;
    }

    return score;
}

//! FE8U = 0x0803E114
int sub_803E114(void) {
    int score;

    score = gBmMapOther[gBattleActor.unit.yPos][gBattleActor.unit.xPos] / 8;
    score = gUnknown_030017D8->coeffDanger * score;

    if (score > 20) {
        score = 20;
    }

    return score;
}

//! FE8U = 0x0803E150
int sub_803E150(void) {
    int score;

    score = 20 - gBattleActor.unit.curHP;
    score = gUnknown_030017D8->coeffLowHpSelf * score;

    if (score < 0) {
        score = 0;
    }

    return score;
}

//! FE8U = 0x0803E178
void sub_803E178(struct AiCombatSimulationSt* st) {
    int score;
    int backup;

    gUnknown_030017D8 = gAiCombatScoreCoefficientTable + gAiState.combatWeightTableId;

    score = sub_803DF34();
    backup = score;

    score += sub_803DF94();
    score += sub_803DFBC();
    score += sub_803E068();
    score += sub_803E09C();
    score -= sub_803E0B4();
    score -= sub_803E114();
    score -= sub_803E150();

    if (score < 0) {
        score = 0;
    }

    if (score != 0) {
        score = score * 40;
    } else {
        score = backup;
    }

    st->score = score;

    return;
}

//! FE8U = 0x0803E1EC
int sub_803E1EC(int x, int y, struct Unit* unit) {
    int dist = RECT_DISTANCE(unit->xPos, unit->yPos, x, y);
    int item = (u16)GetUnitEquippedWeapon(unit);

    if (item == 0) {
        return 0;
    }

    if ((dist > GetItemMaxRange(item)) || (dist < GetItemMinRange(item))) {
        return 50;
    }

    return 0;
}

//! FE8U = 0x0803E23C
int sub_803E23C(int x, int y) {
    int terrainId = gBmMapTerrain[y][x];

    return gActiveUnit->pClassData->pTerrainAvoidLookup[terrainId]
         + gActiveUnit->pClassData->pTerrainDefenseLookup[terrainId]
         + gActiveUnit->pClassData->pTerrainResistanceLookup[terrainId];
}

extern struct Vec2 gUnknown_085A9254[];

//! FE8U = 0x0803E27C
int sub_803E27C(int x, int y) {
    struct Vec2* it;

    int score = 0;

    for (it = gUnknown_085A9254; it->x != 9999; it++) {
        if (gBmMapUnit[y + it->y][x + it->x] == 0) {
            continue;
        }

        if (AreUnitsAllied(gActiveUnitId, gBmMapUnit[y + it->y][x + it->x]) == 1) {
            score += 5;
        } else {
            score -= 5;
        }
    }

    return score;
}