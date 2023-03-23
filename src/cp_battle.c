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

static const struct AiCombatScoreCoefficients* sCombatScoreCoefficients;

void AiFillReversedAttackRangeMap(struct Unit*, u16);
s8 AiAttemptBallistaCombat(s8 (*isEnemy)(struct Unit* unit), struct AiCombatSimulationSt*);
s8 AiAttemptStealActionWithinMovement(void);
s8 AiSimulateBestBattleAgainstTarget(struct AiCombatSimulationSt*);
s8 AiSimulateBestBallistaBattleAgainstTarget(struct AiCombatSimulationSt*, u16);
u32 AiGetCombatPositionScore(int, int, struct AiCombatSimulationSt*);
s8 AiSimulateBattleAgainstTargetAtPosition(struct AiCombatSimulationSt*);
void AiComputeCombatScore(struct AiCombatSimulationSt*);
int AiGetInRangeCombatPositionScoreComponent(int, int, struct Unit*);

//! FE8U = 0x0803D450
s8 AiAttemptOffensiveAction(s8 (*isEnemy)(struct Unit* unit)) {
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

                if (AiAttemptStealActionWithinMovement() == 1) {
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

                AiFillReversedAttackRangeMap(unit, item);

                tmpResult.targetId = unit->index;

                if (!AiSimulateBestBattleAgainstTarget(&tmpResult)) {
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
        if (AiAttemptBallistaCombat(isEnemy, &tmpResult) == 1) {
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
s8 AiAttemptCombatWithinMovement(s8 (*isEnemy)(struct Unit* unit)) {
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

                AiFillReversedAttackRangeMap(unit, item);

                tmpResult.targetId = unit->index;

                if (!AiSimulateBestBattleAgainstTarget(&tmpResult)) {
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
        if (AiAttemptBallistaCombat(isEnemy, &tmpResult) == 1) {
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
void AiFillReversedAttackRangeMap(struct Unit* unit, u16 item) {
    BmMapFill(gBmMapRange, 0);
    MapAddInBoundedRange(unit->xPos, unit->yPos, GetItemMinRange(item), GetItemMaxRange(item));

    return;
}

//! FE8U = 0x0803D8D4
void AiFloodMovementAndRange(struct Unit* unit, u16 move, u16 item) {
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

//! FE8U = 0x0803D998
s8 AiAttemptBallistaCombat(s8 (*isEnemy)(struct Unit* unit), struct AiCombatSimulationSt* st) {
    struct AiCombatSimulationSt tmpResult;

    int iy;
    int ix;
    int i;

    u16 item;

    int ballistaCount = 0;

    u8 ballistaItemIds[] = {
        ITEM_BALLISTA_REGULAR, ITEM_BALLISTA_LONG, ITEM_BALLISTA_KILLER
    };

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
        item = ballistaItemIds[i];
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

                AiFillReversedAttackRangeMap(unit, item);

                tmpResult.targetId = unit->index;

                if (!AiSimulateBestBallistaBattleAgainstTarget(&tmpResult, item)) {
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
u8 AiAttemptStealAction_GetMovementAt(int x, int y) {

    if (((s8**)(gBmMapMovement))[y][x] >= MAP_MOVEMENT_MAX) {
        return -1;
    }

    if ((gBmMapUnit[y][x] != 0) && (gBmMapUnit[y][x] != gActiveUnitId)) {
        return -1;

    }

    return gBmMapMovement[y][x];
}

//! FE8U = 0x0803DB60
s8 AiAttemptStealActionWithinMovement(void) {
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

            if (!AiFindBestAdjacentPositionByFunc(ix, iy, AiAttemptStealAction_GetMovementAt, &posTmp)) {
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
s8 AiSimulateBestBattleAgainstTarget(struct AiCombatSimulationSt* st) {
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

            scoreTmp = AiGetCombatPositionScore(ix, iy, st);

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

    return AiSimulateBattleAgainstTargetAtPosition(st);
}

//! FE8U = 0x0803DD84
s8 AiSimulateBestBallistaBattleAgainstTarget(struct AiCombatSimulationSt* st, u16 item) {
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

            scoreTmp = AiGetCombatPositionScore(ix, iy, st);

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

    return AiSimulateBattleAgainstTargetAtPosition(st);
}

//! FE8U = 0x0803DE5C
u32 AiGetCombatPositionScore(int x, int y, struct AiCombatSimulationSt* st) {
    int score;

    score = AiGetInRangeCombatPositionScoreComponent(x, y, GetUnit(st->targetId));
    score += AiGetTerrainCombatPositionScoreComponent(x, y);
    score += AiGetFriendZoneCombatPositionScoreComponent(x, y);
    score -= ((s8**)(gBmMapMovement))[y][x];
    score -= gBmMapOther[y][x] / 8;

    score += 0x7FFFFFFF;

    return score;
}

//! FE8U = 0x0803DEC4
s8 AiIsBadFight(struct AiCombatSimulationSt* st) {
    // In FE6, this is used to check if it is worthwhile to use Eclipse
    return 0;
}

//! FE8U = 0x0803DEC8
s8 AiSimulateBattleAgainstTargetAtPosition(struct AiCombatSimulationSt* st) {
    if (st->itemSlot != 0xFFFF) {
        BattleGenerateSimulation(gActiveUnit, GetUnit(st->targetId), st->xMove, st->yMove, st->itemSlot);
    } else {
        BattleGenerateBallistaSimulation(gActiveUnit, GetUnit(st->targetId), st->xMove, st->yMove);
    }

    if (!AiIsBadFight(st)) {
        AiComputeCombatScore(st);
        return 1;
    }

    return 0;
}

//! FE8U = 0x0803DF34
int AiGetDamageDealtCombatScoreComponent(void) {
    int score;

    if (gBattleTarget.unit.curHP == 0) {
        return 50;
    }

    score = (gBattleActor.battleAttack - gBattleTarget.battleDefense) * gBattleActor.battleEffectiveHitRate;

    if (score < 0) {
        score = 0;
    }

    score = Div(score, 100);
    score = sCombatScoreCoefficients->coeffDamageDealt * score;

    if (score > 40) {
        score = 40;
    }

    return score;
}

//! FE8U = 0x0803DF94
int AiGetOpponentLowHpScoreComponent(void) {
    int score;

    score = 20 - gBattleTarget.unit.curHP;
    score = sCombatScoreCoefficients->coeffLowHpOpponent * score;

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

struct RangeScore CONST_DATA sFriendZoneRangeScoreLut[] = {
    // one of these entries is bugged!

    #define ent(x, y) { (x), (y), 4-(((x)>0?(x):-(x)) + ((y)>0?(y):-(y))) }

                                           ent( 0, -3),
    ent(-3, +1), /* BUG! */                ent( 0, -2), ent(+1, -2),
                 ent(-2, -1), ent(-1, -1), ent( 0, -1), ent(+1, -1), ent(+2, -1),
    ent(-3,  0), ent(-2,  0), ent(-1,  0),              ent(+1,  0), ent(+2,  0), ent(+3,  0),
                 ent(-2, +1), ent(-1, +1), ent( 0, +1), ent(+1, +1), ent(+2, +1),
                              ent(-1, +2), ent( 0, +2), ent(+1, +2),
                                           ent( 0, +3),

    #undef ent

    { 0x7F },
};

//! FE8U = 0x0803DFBC
int AiGetFriendZoneCombatScoreComponent(void) {
    struct RangeScore* it;
    int score = 0;

    for (it = sFriendZoneRangeScoreLut; it->x != 0x7f; it++) {
        u8 x = gBattleActor.unit.xPos + it->x;
        u8 y = gBattleActor.unit.yPos + it->y;

        u8 uid = gBmMapUnit[y][x];

        if (x >= gBmMapSize.x) {
            continue;
        }

        if (y >= gBmMapSize.y) {
            continue;
        }

        if (uid == 0) {
            continue;
        }

        if (AreUnitsAllied(gBattleActor.unit.index, uid) == 1) {
            score += it->score;
        }
    }

    score = sCombatScoreCoefficients->coeffFriendZone * score;

    if (score > 10) {
        score = 10;
    }

    return score;
}

//! FE8U = 0x0803E068
int AiGetTargetClassCombatScoreComponent(void) {
    u8 rank = AiGetClassRank(gBattleTarget.unit.pClassData->number);

    int score;

    score = sCombatScoreCoefficients->classRankBonuses[rank];
    score = sCombatScoreCoefficients->coeffClassRankBonus * score;

    if (score > 20) {
        score = 20;
    }

    return score;
}

//! FE8U = 0x0803E09C
int AiGetTurnCombatScoreComponent(void) {
    #if NONMATCHING

    int turn = gPlaySt.chapterTurnNumber;

    #else // if !NONMATCHING

    register int turn asm("r0") = gPlaySt.chapterTurnNumber;

    #endif // NONMATCHING

    return turn * sCombatScoreCoefficients->coeffTurnNumber;
}

//! FE8U = 0x0803E0B4
int AiGetDamageTakenScoreComponent(void) {
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
    score = sCombatScoreCoefficients->coeffDamageTaken * score;

    if (score > 40) {
        score = 40;
    }

    return score;
}

//! FE8U = 0x0803E114
int AiGetDangerScoreComponent(void) {
    int score;

    score = gBmMapOther[gBattleActor.unit.yPos][gBattleActor.unit.xPos] / 8;
    score = sCombatScoreCoefficients->coeffDanger * score;

    if (score > 20) {
        score = 20;
    }

    return score;
}

//! FE8U = 0x0803E150
int AiGetLowHpScoreComponent(void) {
    int score;

    score = 20 - gBattleActor.unit.curHP;
    score = sCombatScoreCoefficients->coeffLowHpSelf * score;

    if (score < 0) {
        score = 0;
    }

    return score;
}

//! FE8U = 0x0803E178
void AiComputeCombatScore(struct AiCombatSimulationSt* st) {
    int score;
    int backup;

    sCombatScoreCoefficients = gAiCombatScoreCoefficientTable + gAiState.combatWeightTableId;

    score = AiGetDamageDealtCombatScoreComponent();
    backup = score;

    score += AiGetOpponentLowHpScoreComponent();
    score += AiGetFriendZoneCombatScoreComponent();
    score += AiGetTargetClassCombatScoreComponent();
    score += AiGetTurnCombatScoreComponent();
    score -= AiGetDamageTakenScoreComponent();
    score -= AiGetDangerScoreComponent();
    score -= AiGetLowHpScoreComponent();

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
int AiGetInRangeCombatPositionScoreComponent(int x, int y, struct Unit* unit) {
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
int AiGetTerrainCombatPositionScoreComponent(int x, int y) {
    int terrainId = gBmMapTerrain[y][x];

    return gActiveUnit->pClassData->pTerrainAvoidLookup[terrainId]
         + gActiveUnit->pClassData->pTerrainDefenseLookup[terrainId]
         + gActiveUnit->pClassData->pTerrainResistanceLookup[terrainId];
}

struct Vec2 CONST_DATA sRange3OffsetLut_[] = {
                                        {  0, -3 },
                            { -1, -2 }, {  0, -2 }, { +1, -2 },
                { -2, -1 }, { -1, -1 }, {  0, -1 }, { +1, -1 }, { +2, -1 },
    { -3,  0 }, { -2,  0 }, { -1,  0 },             { +1,  0 }, { +2,  0 }, { +3,  0 },
                { -2, +1 }, { -1, +1 }, {  0, +1 }, { +1, +1 }, { +2, +1 },
                            { -1, +2 }, {  0, +2 }, { +1, +2 },
                                        {  0, +3 },

    { 9999, 9999 },
};

//! FE8U = 0x0803E27C
int AiGetFriendZoneCombatPositionScoreComponent(int x, int y) {
    struct Vec2* it;

    int score = 0;

    for (it = sRange3OffsetLut_; it->x != 9999; it++) {
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