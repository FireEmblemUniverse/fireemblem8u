#include "global.h"

#include "cp_common.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmphase.h"
#include "bmbattle.h"

#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/items.h"
#include "constants/terrains.h"



// code_cpextra.s
s8 sub_803AD38(const u8*, int, struct Vec2*);
s8 sub_803AE94(const u8*, int, struct Vec2*);
s8 sub_803AFDC(u32, struct Vec2*, struct Vec2*);
s8 sub_803B808(struct Unit*, struct Vec2*);
s8 sub_803BFD0(s16, s16, u16, u16, int);
void sub_803C490(struct Unit*);


s8 sub_8040B38(struct Unit*, struct Vec2*);
s8 sub_8040BB4(struct Unit*, u32, struct Vec2*, struct Vec2*);
s8 sub_8040C5C(void);
void InitAiMoveMapForUnit(struct Unit*);
void sub_8040E98(struct Unit*);
void sub_8040F88(struct Unit*);
void sub_8040FBC(struct Unit*);


struct AiSpecialItemLutEntry {
    u16 itemId;
    void(*func)(int itemIdx);
};

void AiSpecialItemDoorKey(int item);
void AiSpecialItemLockpick(int item);
void AiSpecialItemAntitoxin(int item);

const struct AiSpecialItemLutEntry sAiSpecialItemFuncLut[] = {
    { ITEM_DOORKEY,   AiSpecialItemDoorKey },
    { ITEM_LOCKPICK,  AiSpecialItemLockpick },
    { ITEM_ANTITOXIN, AiSpecialItemAntitoxin },
    { },
};


int GetSpecialItemFuncIndex(u16 item) {
    int index = 0;
    u16 itemId = GetItemIndex(item);

    for (; sAiSpecialItemFuncLut[index].itemId != 0; index++) {
        if (itemId != sAiSpecialItemFuncLut[index].itemId) {
            continue;
        }

        if (sAiSpecialItemFuncLut[index].func != 0) {
            return index;
        }
    }

    return -1;
}

s8 AiTryDoSpecialItems() {
    int i;

    if (gAiState.flags & AI_FLAG_1) {
        return 0;
    }

    if (sub_8040C5C() != 0) {
        return 1;
    }

    for (i = 0; i < UNIT_ITEM_COUNT; i++) {
        int funcIndex;
        u16 item = gActiveUnit->items[i];

        if (item == 0) {
            break;
        }

        if (GetItemType(item) == 0) {
            continue;
        }

        funcIndex = GetSpecialItemFuncIndex(item);

        if (funcIndex == -1) {
            continue;
        }

        sAiSpecialItemFuncLut[funcIndex].func(i);
    }

    if (gAiState.decideState == 0) {
        return 1;
    }

    return gAiDecision.actionPerformed;
}

void AiSpecialItemDoorKey(int item) {
    struct Vec2 pos;

    if (!(gAiState.specialItemFlags & 0x80000001)) {
        return;
    }
    
    if (sub_8040B38(gActiveUnit, &pos) == 0) {
        return;
    }

    AiTryMoveTowards(pos.x, pos.y, 0, gAiState.unk7E, 1);

    if (gAiDecision.actionPerformed != 1) {
        return;
    }

    if (sub_803BFD0(pos.x, pos.y, gAiDecision.xMove, gAiDecision.yMove, 0) == 1) {
        AiSetDecision(gAiDecision.xMove, gAiDecision.yMove, 6, 0, item, 0, 0);
    }

    return;
}

void AiSpecialItemLockpick(int item) {

    struct Vec2 pos;
    u32 flags = 0;

    if (!(gAiState.specialItemFlags & 2)) {
        return;
    }

    if (GetUnitItemCount(gActiveUnit) >= UNIT_ITEM_COUNT) {
        if (!(gActiveUnit->aiFlags & 8)) {
            gActiveUnit->aiFlags |= 8;
            gAiState.decideState = 0;

            return;
        }
    }

    if (!(UNIT_CATTRIBUTES(gActiveUnit) & CA_STEAL)) {
        return;
    }

    if (GetUnitItemCount(gActiveUnit) >= UNIT_ITEM_COUNT) {
        flags |= 4;
    }

    if ((gActiveUnit->pCharacterData->number == CHARACTER_RENNAC) && (gActiveUnit->aiFlags & 8)) {
        flags |= 8;
    }

    if (sub_8040BB4(gActiveUnit, flags, &pos, 0) == 1) {

        AiTryMoveTowards(pos.x, pos.y, 0, gAiState.unk7E, 0);

        if ((gAiDecision.actionPerformed != 1)) {
            return;
        }

        if ((sub_803BFD0(pos.x, pos.y, gAiDecision.xMove, gAiDecision.yMove, 0) == 1)) {
            AiSetDecision(gAiDecision.xMove, gAiDecision.yMove, 6, 0, item, 0, 0);
        }
    }

    return;
}

void AiSpecialItemAntitoxin(int item) {

    struct Vec2 pos;

    if (!(gAiState.specialItemFlags & 4)) {
        return;
    }
    
    if (gActiveUnit->statusIndex != UNIT_STATUS_POISON) {
        return;
    }

    if (sub_803B808(gActiveUnit, &pos) == 1) {
        AiSetDecision(pos.x, pos.y, 6, 0, item, 0, 0);
    }

    return;
}

u8 sub_8040AE0(int x, int y) {

    if ((s8)gBmMapRange[y][x] >= MAP_MOVEMENT_MAX) {
        return -1;
    }

    if ((gBmMapUnit[y][x] != 0) && (gBmMapUnit[y][x] != gActiveUnitId)) {
        return -1;
    }

    return gBmMapRange[y][x];
}

const u8 CONST_DATA gUnknown_085A92DC[] = {
    TERRAIN_DOOR, TERRAIN_TILE_00,
};

s8 sub_8040B38(struct Unit* unit, struct Vec2* pos) {

    sub_8040FBC(unit);

    if (!sub_803AE94(gUnknown_085A92DC, 0, pos)) {
        return 0;
    }

    sub_8040E98(unit);

    if ((s8)gBmMapRange[pos->y][pos->x] >= MAP_MOVEMENT_MAX) {
        return 0;
    }
    
    return 1;
}

const u8 CONST_DATA gUnknown_085A92DE[] = {
    TERRAIN_CHEST_21, TERRAIN_TILE_00,
};

s8 sub_8040B8C(struct Unit* unit, struct Vec2* pos) {
    sub_8040E98(unit);

    if (sub_803AD38(gUnknown_085A92DE, 0, pos) == 0) {
        return 0;
    }

    return 1;
}

s8 sub_8040BB4(struct Unit* unit, u32 flags, struct Vec2* posA, struct Vec2* posB) {

    InitAiMoveMapForUnit(unit);
    sub_8040F88(unit);

    if ((sub_803AFDC(flags | 1, posA, posB) == 1) && ((s8)gBmMapMovement[posA->y][posA->x] < MAP_MOVEMENT_MAX)) {
        return 1;
    } else {

        sub_8040FBC(unit);

        if (sub_803AFDC(flags, posA, posB) == 1) {

            if (((s8)gBmMapMovement[posA->y][posA->x] < MAP_MOVEMENT_MAX) && (gBmMapUnit[posA->y][posA->x] == 0)) {
                return 0;
            }

            return 1;
        }
    }

    return 0;
}

s8 sub_8040C5C() {
    int flags;
    struct Vec2 posA;
    struct Vec2 posB;

    flags = 0;

    if (gActiveUnit->pClassData->number != CLASS_ROGUE) {
        return 0;
    } else {
        if ((GetUnitItemCount(gActiveUnit) >= UNIT_ITEM_COUNT) && !(gActiveUnit->aiFlags & 8)) {
            gActiveUnit->aiFlags |= 8;
            gAiState.decideState = 0;
            // BUG? No explicit return statement
        } else {

            if (gRAMChapterData.chapterIndex == 0xE) {

                if (GetUnitItemCount(gActiveUnit) >= UNIT_ITEM_COUNT) {
                    flags |= 0xC;
                }

                if (sub_8040BB4(gActiveUnit, flags, &posA, &posB) == 1) {
                    AiTryMoveTowards(posA.x, posA.y, 0, gAiState.unk7E, 0);

                    if (gAiDecision.actionPerformed == 1) {
                        if (sub_803BFD0(posA.x, posA.y, gAiDecision.xMove, gAiDecision.yMove, 0) == 1) {
                            AiSetDecision(gAiDecision.xMove, gAiDecision.yMove, 0xD, 0, 0, posB.x, posB.y);
                            return 1;
                        }
                    }
                }
            } else {
                if ((GetUnitItemCount(gActiveUnit) < UNIT_ITEM_COUNT) && (sub_8040B8C(gActiveUnit, &posA) == 1)) {
                    AiTryMoveTowards(posA.x, posA.y, 0, gAiState.unk7E, 0);

                    if (gAiDecision.actionPerformed == 1) {
                        if (sub_803BFD0(posA.x, posA.y, gAiDecision.xMove, gAiDecision.yMove, 0) == 1) {
                            AiSetDecision(gAiDecision.xMove, gAiDecision.yMove, 0xD, 0, 0, gAiDecision.xMove, gAiDecision.yMove);
                            return 1;
                        }
                    }
                }
            }
            return 0;
        }
    }
}

void AiSetMovCostTableWithPassableWalls(const s8* cost) {
    u16 i;

    for (i = 1; i < TERRAIN_COUNT; i++) {
        if (cost[i] >= 1) {
            gWorkingTerrainMoveCosts[i] = cost[i];
        } else {
            gWorkingTerrainMoveCosts[i] = 1;
        }
    }
    
    return;
}

void sub_8040E04(const s8* cost, int terrainId) {
    u16 i;

    for (i = 1; i < TERRAIN_COUNT; i++) {
        gWorkingTerrainMoveCosts[i] = cost[i];
    }

    gWorkingTerrainMoveCosts[terrainId] = 1;

    return;
}

void sub_8040E34(const s8* cost, int terrainIdA, int terraidIdB) {
    u16 i;

    for (i = 1; i < TERRAIN_COUNT; i++) {
        gWorkingTerrainMoveCosts[i] = cost[i];
    }

    gWorkingTerrainMoveCosts[terrainIdA] = 1;
    gWorkingTerrainMoveCosts[terraidIdB] = 1;

    return;
}

void InitAiMoveMapForUnit(struct Unit* unit) {
    SetWorkingMoveCosts(GetUnitMovementCost(unit));

    SetWorkingBmMap(gBmMapMovement);
    GenerateMovementMap(unit->xPos, unit->yPos, MAP_MOVEMENT_EXTENDED, unit->index);

    return;
}

void sub_8040E98(struct Unit* unit) {
    SetWorkingMoveCosts(GetUnitMovementCost(unit));

    SetWorkingBmMap(gBmMapRange);
    GenerateMovementMap(unit->xPos, unit->yPos, MAP_MOVEMENT_EXTENDED, unit->index);

    return;
}

void sub_8040EC8(struct Unit* unit) {
    AiSetMovCostTableWithPassableWalls(GetUnitMovementCost(unit));

    SetWorkingBmMap(gBmMapMovement);
    GenerateMovementMap(unit->xPos, unit->yPos, MAP_MOVEMENT_EXTENDED, unit->index);

    return;
}

void sub_8040EF8(struct Unit* unit) {
    AiSetMovCostTableWithPassableWalls(GetUnitMovementCost(unit));

    SetWorkingBmMap(gBmMapMovement);
    GenerateMovementMap(unit->xPos, unit->yPos, MAP_MOVEMENT_EXTENDED, 0);

    return;
}

void sub_8040F28(int x, int y, const s8* cost) {
    AiSetMovCostTableWithPassableWalls(cost);

    SetWorkingBmMap(gBmMapRange);
    GenerateMovementMap(x, y, MAP_MOVEMENT_EXTENDED, 0);

    return;
}

void sub_8040F54(int x, int y, struct Unit* unit) {
    AiSetMovCostTableWithPassableWalls(GetUnitMovementCost(unit));

    SetWorkingBmMap(gBmMapRange);
    GenerateMovementMap(x, y, MAP_MOVEMENT_EXTENDED, unit->index);

    return;
}

void sub_8040F88(struct Unit* unit) {
    sub_8040E04(GetUnitMovementCost(unit), TERRAIN_DOOR);

    SetWorkingBmMap(gBmMapRange);
    GenerateMovementMap(unit->xPos, unit->yPos, MAP_MOVEMENT_EXTENDED, unit->index);

    return;
}

void sub_8040FBC(struct Unit* unit) {
    sub_8040E04(GetUnitMovementCost(unit), TERRAIN_DOOR);

    SetWorkingBmMap(gBmMapRange);
    GenerateMovementMap(unit->xPos, unit->yPos, MAP_MOVEMENT_EXTENDED, 0);

    return;
}

void sub_8040FEC(struct Unit* unit) {
    sub_8040E34(GetUnitMovementCost(unit), TERRAIN_WALL_1B, TERRAIN_SNAG);

    SetWorkingBmMap(gBmMapRange);
    GenerateMovementMap(unit->xPos, unit->yPos, MAP_MOVEMENT_EXTENDED, unit->index);

    return;
}

void sub_8041020(struct Unit* unit) {
    sub_8040E34(GetUnitMovementCost(unit), TERRAIN_WALL_1B, TERRAIN_SNAG);

    SetWorkingBmMap(gBmMapRange);
    GenerateMovementMap(unit->xPos, unit->yPos, MAP_MOVEMENT_EXTENDED, 0);

    return;
}

void sub_8041054(struct Unit* unit) {
    SetWorkingMoveCosts(GetUnitMovementCost(unit));

    SetWorkingBmMap(gBmMapRange);
    GenerateMovementMap(unit->xPos, unit->yPos, UNIT_MOV(unit), unit->index);

    return;
}

void AiUpdateNoMoveFlag(struct Unit* unit) {

    if ((unit->ai3And4 & (1 << 13)) != 0) {
        gAiState.flags |= (1 << 1);
    } else {
        gAiState.flags &= ~(1 << 1);
    }

    return;
}

void sub_80410C4(int x, int y, struct Unit* unit) {
    SetWorkingMoveCosts(GetUnitMovementCost(unit));

    SetWorkingBmMap(gBmMapRange);
    GenerateMovementMap(x, y, MAP_MOVEMENT_EXTENDED, unit->index);

    return;
}

int AiDetermineNightmareEffectiveness(int* numValidTargets, int* numHit, u8 threshold) {
    int iy;
    int ix;
    struct Unit* unit;
    int unitId;

    *numValidTargets = 0;
    *numHit = 0;

    unitId = -1;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {
            if (!(((s8**)(gBmMapRange))[iy][ix])) {
                continue;
            }

            if (gBmMapUnit[iy][ix] == 0) {
                continue;
            }

            if (AreUnitsAllied(gActiveUnitId, gBmMapUnit[iy][ix])) {
                continue;
            }

            unit = GetUnit(gBmMapUnit[iy][ix]);

            if ((unit->statusIndex == UNIT_STATUS_POISON) || (unit->statusIndex == UNIT_STATUS_SLEEP) || (unit->statusIndex == UNIT_STATUS_SILENCED) || (unit->statusIndex == UNIT_STATUS_BERSERK)) {
                continue;
            }

            if ((unit->statusIndex == UNIT_STATUS_PETRIFY) || (unit->statusIndex == UNIT_STATUS_13)) {
                continue;
            }

            (*numValidTargets)++;

            if (GetOffensiveStaffAccuracy(gActiveUnit, unit) < threshold) {
                continue;
            }

            if (unitId < 0) {
                unitId = unit->index;
            }

            (*numHit)++;
        }
    }
    
    return unitId;
}

struct UnknownAiInputA {
    u8 unk_00;
    u8 unk_01;
    u8 unk_02;
};

s8 AiTryUseNightmareStaff(struct UnknownAiInputA* input) {
    int ix;
    int iy;
    int itemIdx;

    u8 targetUnitId;
    int numValidTargets;
    int numHit;

    int countA;
    int bestNumHit;
    int countB;
    int uidBest;
    int xBest;
    int yBest;

    s8 foundItem = 0;

    countA = 0;
    bestNumHit = 0;
    countB = 0;
    xBest = 0;
    yBest = 0;

    if (gRAMChapterData.chapterTurnNumber < 2) {
        gAiState.unk86[0] = 0;
        gAiState.unk86[1] = 0;

        return 0;
    } else {

        for (itemIdx = 0; itemIdx < UNIT_ITEM_COUNT; itemIdx++) {
            u16 item = gActiveUnit->items[itemIdx];

            if (item == 0) {
                break;
            }
            
            if (GetItemIndex(item) == ITEM_NIGHTMARE) {
                foundItem = 1;
                break;
            }
        }

        if (foundItem) {
            sub_803C490(gActiveUnit);
            GenerateMagicSealMap(-1);

            for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
                for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

                    if (gBmMapMovement[iy][ix] > MAP_MOVEMENT_MAX) {
                        continue;
                    }

                    if ((gBmMapUnit[iy][ix] != 0) && (gBmMapUnit[iy][ix] != gActiveUnitId)) {
                        continue;
                    }

                    BmMapFill(gBmMapRange, 0);
                    MapAddInBoundedRange(ix, iy, GetItemMinRange(ITEM_NIGHTMARE), GetItemMaxRange(ITEM_NIGHTMARE));

                    targetUnitId = AiDetermineNightmareEffectiveness(&numValidTargets, &numHit, input->unk_02);

                    if (numValidTargets > countB) {
                        countB = numValidTargets;
                    }

                    if (numValidTargets < input->unk_00) {
                        continue;
                    }

                    if (numHit < input->unk_01) {
                        continue;
                    }

                    if (numHit > bestNumHit) {
                        countA = numValidTargets;
                        bestNumHit = numHit;
                        xBest = ix;
                        yBest = iy;

                        uidBest = targetUnitId;
                    }
                }
            }

            if (countA >= input->unk_01) {
                gAiState.unk86[0] = 1;
                gAiState.unk86[1] = xBest;
                gAiState.unk86[2] = yBest;
                gAiState.unk86[3] = uidBest;
                gAiState.unk86[4] = itemIdx;
                gAiState.unk86[5] = countB;
            } else {
                gAiState.unk86[0] = 0;
                gAiState.unk86[1] = countB;
            }

            return 0;
        }
    }

    // return 0; BUG? No explicit return if foundItem is false
}

s8 AiDecideNightmareStaff() {

    AiSetDecision(gAiState.unk86[1], gAiState.unk86[2], 0xB, gAiState.unk86[3], gAiState.unk86[4], 0, 0);

    return 1;
}

struct UnknownAiInputB {
    u8 unk_00;
    u8 unk_01;
    u8 unk_02;
    
    struct UnitDefinition* unk_04;
};

s8 AiTryDKSummon(struct UnknownAiInputB* input) {
    int ix;
    int iy;

    int numValidTargets;
    int numHit;

    int totalSummonedUnits = 0;

    if (gRAMChapterData.chapterTurnNumber == 1) {
        gAiState.unk86[0] = 1;
        gAiState.unk86[1] = gActiveUnit->xPos;
        gAiState.unk86[2] = gActiveUnit->yPos;
        return 0;
    }

    BmMapFill(gBmMapRange, 0);
    MapAddInBoundedRange(gActiveUnit->xPos, gActiveUnit->yPos, GetItemMinRange(ITEM_NIGHTMARE), GetItemMaxRange(ITEM_NIGHTMARE));

    AiDetermineNightmareEffectiveness(&numValidTargets, &numHit, 0);

    if (numValidTargets >= input->unk_00) {

        for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
            for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {
                struct Unit* unit;
                struct UnitDefinition* iter;

                u8 unitId = gBmMapUnit[iy][ix];
                
                if (unitId == 0) {
                    continue;
                }
                
                if (unitId == gActiveUnitId) {
                    continue;
                }
                
                if (!AreUnitsAllied(gActiveUnitId, unitId)) {
                    continue;
                }

                unit = GetUnit(unitId);

                for (iter = input->unk_04; iter->charIndex != 0; ++iter) {
                    if (unit->pCharacterData->number != iter->charIndex) {
                        continue;
                    } 
                    
                    if (unit->pClassData->number != iter->classIndex) {
                        continue;
                    }

                    totalSummonedUnits++;
                    break;
                }
            }
        }

        if (totalSummonedUnits < input->unk_01) {
            gAiState.unk86[0] = 1;
            gAiState.unk86[1] = gActiveUnit->xPos;
            gAiState.unk86[2] = gActiveUnit->yPos;
            return 0;
        }
    }

    gAiState.unk86[0] = 0;
    return 0;
}

s8 AiDecideDKSummon() {
    AiSetDecision(gAiState.unk86[1], gAiState.unk86[2], 0xC, 0, 0, 0, 0);

    return 1;
}
