#include "global.h"

#include "bmmap.h"
#include "bmunit.h"
#include "uiselecttarget.h"
#include "bmidoten.h"
#include "bmtrick.h"
#include "bmphase.h"
#include "bmitem.h"
#include "bmreliance.h"
#include "bmarch.h"
#include "rng.h"

#include "constants/classes.h"
#include "constants/terrains.h"

struct Unit* EWRAM_DATA gSubjectUnit = NULL;

// ev_triggercheck.s
s8 sub_8083F68(u8, u8);
s8 IsThereClosedDoorAt(s8, s8);

// code.s
void BWL_AddWinOrLossIdk(u8, u8, int);
void sub_80A4594(u8);

void ForEachUnitInMovement(void(*func)(struct Unit* unit)) {
    int ix;
    int iy;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

            if (((s8**)gBmMapMovement)[iy][ix] == 0) {
                continue;
            }

            if (gBmMapUnit[iy][ix] == 0) {
                continue;
            }

            func(GetUnit(gBmMapUnit[iy][ix]));
        }
    }

    return;
}

void ForEachUnitInRange(void(*func)(struct Unit* unit)) {
    int ix;
    int iy;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

            if (((s8**)gBmMapRange)[iy][ix] == 0) {
                continue;
            }

            if (gBmMapUnit[iy][ix] == 0) {
                continue;
            }

            func(GetUnit(gBmMapUnit[iy][ix]));
        }
    }

    return;
}

void ForEachPosInRange(void(*func)(int x, int y)) {
    int ix;
    int iy;

    for (iy = gBmMapSize.y - 1; iy >= 0; iy--) {
        for (ix = gBmMapSize.x - 1; ix >= 0; ix--) {

            if (((s8**)gBmMapRange)[iy][ix] == 0) {
                continue;
            }

            func(ix, iy);
        }
    }

    return;
}

void ForEachAdjacentUnit(int x, int y, void(*func)(struct Unit* unit)) {
    InitTargets(x, y);

    MapAddInRange(x, y, 1, 1);
    MapAddInRange(x, y, 0, -1);

    ForEachUnitInRange(func);

    return;
}

void ForEachAdjacentPosition(int x, int y, void(*func)(int x, int y)) {
    InitTargets(x, y);

    MapAddInRange(x, y, 1, 1);
    MapAddInRange(x, y, 0, -1);

    ForEachPosInRange(func);

    return;
}

void sub_8024FD8(int x, int y, void(*func)(int x, int y)) {
    s8 ix;
    s8 iy;

    InitTargets(x, y);

    for (iy = -1; iy < 2; iy++) {
        for (ix = -1; ix < 2; ix++) {
            if ((x >= 0) && (y >= 0)) {
                gWorkingBmMap[y][x]++;
            }
        }
    }

    ForEachPosInRange(func);

    return;
}

void ForEachPosIn12Range(int x, int y, void(*func)(int x, int y)) {
    InitTargets(x, y);

    MapAddInRange(x, y, 2, 1);
    MapAddInRange(x, y, 0, -1);

    ForEachPosInRange(func);

    return;
}

void ForEachUnitInMagBy2Range(void(*func)(struct Unit* unit)) {
    int x = gSubjectUnit->xPos;
    int y = gSubjectUnit->yPos;

    InitTargets(x, y);

    MapAddInRange(x, y, GetUnitMagBy2Range(gSubjectUnit), 1);
    MapAddInRange(x, y, 0, -1);

    ForEachUnitInRange(func);

    return;
}

void TryAddTrapsToTargetList() {
    struct Trap* trap;

    for (trap = GetTrap(0); trap->type != TRAP_NONE; ++trap) {
        if (trap->type != TRAP_OBSTACLE) {
            continue;
        }

        if ((gBmMapTerrain[trap->yPos][trap->xPos] == TERRAIN_WALL_1B) && (((s8**)gBmMapRange)[trap->yPos][trap->xPos] != 0)) {
            AddTarget(trap->xPos, trap->yPos, 0, trap->extra);
        }

        if ((gBmMapTerrain[trap->yPos + 1][trap->xPos] == TERRAIN_WALL_1B) && (((s8**)gBmMapRange)[trap->yPos + 1][trap->xPos] != 0)) {
            AddTarget(trap->xPos, trap->yPos + 1, 0, trap->extra);
        }

        if ((gBmMapTerrain[trap->yPos][trap->xPos] == TERRAIN_SNAG) && (((s8**)gBmMapRange)[trap->yPos][trap->xPos] != 0)) {
            AddTarget(trap->xPos, trap->yPos, 0, trap->extra);
        }
    }

    return;
}

void AddUnitToTargetListIfNotAllied(struct Unit* unit) {

    if (!AreUnitsAllied(gSubjectUnit->index, unit->index)) {
        AddTarget(unit->xPos, unit->yPos, unit->index, 0);
    }

    return;
}

void MakeTargetListForWeapon(struct Unit* unit, int item) {

    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    InitTargets(x, y);

    BmMapFill(gBmMapRange, 0);

    MapAddInBoundedRange(x, y, GetItemMinRange(item), GetItemMaxRange(item));

    ForEachUnitInRange(AddUnitToTargetListIfNotAllied);

    TryAddTrapsToTargetList();

    return;
}

void TryAddUnitToTradeTargetList(struct Unit* unit) {

    if (!IsSameAllegiance(gSubjectUnit->index, unit->index)) {
        return;
    }

    if (gSubjectUnit->pClassData->number == CLASS_PHANTOM || unit->pClassData->number == CLASS_PHANTOM) {
        return;
    }

    if (unit->statusIndex != UNIT_STATUS_BERSERK) {

        if (gSubjectUnit->items[0] != 0 || unit->items[0] != 0) {

            if (!(UNIT_CATTRIBUTES(unit) & CA_SUPPLY)) {
                AddTarget(unit->xPos, unit->yPos, unit->index, 0);
            }
        }
    }

    if (unit->state & US_RESCUING) {
        struct Unit* rescue = GetUnit(unit->rescueOtherUnit);

        if (UNIT_FACTION(rescue) != FACTION_BLUE) {
            return;
        }

        if (gSubjectUnit->items[0] == 0 && rescue->items[0] == 0 ) {
            return;
        }

        AddTarget(unit->xPos, unit->yPos, rescue->index, 0);
    }

    return;
}

void MakeTradeTargetList(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);
    ForEachAdjacentUnit(x, y, TryAddUnitToTradeTargetList);

    if (gSubjectUnit->state & US_RESCUING) {
        int count = GetSelectTargetCount();
        TryAddUnitToTradeTargetList(GetUnit(gSubjectUnit->rescueOtherUnit));

        if (count != GetSelectTargetCount()) {
            GetTarget(count)->x = gSubjectUnit->xPos;
            GetTarget(count)->y = gSubjectUnit->yPos;
        }
    }

    return;
}

void TryAddUnitToRescueTargetList(struct Unit* unit) {

    if (!AreUnitsAllied(gSubjectUnit->index, unit->index)) {
        return;
    }

    if (gSubjectUnit->pClassData->number == CLASS_PHANTOM || unit->pClassData->number == CLASS_PHANTOM) {
        return;
    }

    if (unit->statusIndex == UNIT_STATUS_BERSERK) {
        return;
    }

    if (unit->state & (US_RESCUING | US_RESCUED)) {
        return;
    }

    if (!CanUnitRescue(gSubjectUnit, unit)) {
        return;
    }

    AddTarget(unit->xPos, unit->yPos, unit->index, 0);

    return;
}

void MakeRescueTargetList(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, TryAddUnitToRescueTargetList);

    return;
}

void TryAddToDropTargetList(int x, int y) {

    if (gBmMapUnit[y][x] != 0) {
        return;
    }

    if (!CanUnitCrossTerrain(GetUnit(gSubjectUnit->rescueOtherUnit), gBmMapTerrain[y][x])) {
        return;
    }

    AddTarget(x, y, 0, 0);

    return;
}

void MakeDropTargetList(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachAdjacentPosition(x, y, TryAddToDropTargetList);
    return;
}

void TryAddRescuedUnitToTakeTargetList(struct Unit* unit) {

    if (!IsSameAllegiance(gSubjectUnit->index, unit->index)) {
        return;
    }

    if (!(unit->state & US_RESCUING)) {
        return;
    }

    if (UNIT_CATTRIBUTES(unit) & CA_SUPPLY) {
        return;
    }

    if (!CanUnitRescue(gSubjectUnit, GetUnit(unit->rescueOtherUnit))) {
        return;
    }

    AddTarget(unit->xPos, unit->yPos, unit->index, 0);

    return;
}

void MakeTakeTargetList(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, TryAddRescuedUnitToTakeTargetList);

    return;
}

void TryAddUnitToGiveTargetList(struct Unit* unit) {

    if (!IsSameAllegiance(gSubjectUnit->index, unit->index)) {
        return;
    }

    if (unit->state & US_RESCUING) {
        return;
    }

    if (unit->statusIndex == UNIT_STATUS_BERSERK || unit->statusIndex == UNIT_STATUS_SLEEP) {
        return;
    }

    if (UNIT_CATTRIBUTES(unit) & CA_SUPPLY) {
        return;
    }

    if (!CanUnitRescue(unit, GetUnit(gSubjectUnit->rescueOtherUnit))) {
        return;
    }

    AddTarget(unit->xPos, unit->yPos, unit->index, 0);

    return;
}

void MakeGiveTargetList(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, TryAddUnitToGiveTargetList);

    return;
}

void TryAddUnitToTalkTargetList(struct Unit* unit) {
    if (unit->statusIndex == UNIT_STATUS_BERSERK || unit->statusIndex == UNIT_STATUS_SLEEP) {
        return;
    }

    if (!sub_8083F68(gSubjectUnit->pCharacterData->number, unit->pCharacterData->number)) {
        return;
    }

    AddTarget(unit->xPos, unit->yPos, unit->index, unit->pCharacterData->number);

    return;
}

void MakeTalkTargetList(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, TryAddUnitToTalkTargetList);

    return;
}

void MakeTargetListForSupport(struct Unit* unit) {
    int i;
    int count;

    gSubjectUnit = unit;

    InitTargets(unit->xPos, unit->yPos);

    count = GetUnitSupporterCount(gSubjectUnit);

    for (i = 0; i < count; i++) {

        struct Unit* other = GetUnitSupporterUnit(gSubjectUnit, i);

        if (other == 0) {
            continue;
        }

        if (RECT_DISTANCE(gSubjectUnit->xPos, gSubjectUnit->yPos, other->xPos, other->yPos) != 1) {
            continue;
        }

        if (!CanUnitSupportNow(gSubjectUnit, i)) {
            continue;
        }

        if (other->state & (US_DEAD | US_NOT_DEPLOYED | US_RESCUED | US_BIT16)) {
            continue;
        }

        if (other->statusIndex == UNIT_STATUS_BERSERK || other->statusIndex == UNIT_STATUS_SLEEP) {
            continue;
        }

        AddTarget(other->xPos, other->yPos, other->index, i);
    }

    return;
}

void AddUnitToTargetListIfAllied(struct Unit* unit) {
    if (AreUnitsAllied(gSubjectUnit->index, unit->index)) {
        return;
    }

    AddTarget(unit->xPos, unit->yPos, unit->index, 1);

    return;
}

void FillBallistaRangeMaybe(struct Unit* unit) {

    int unk;

    int x = unit->xPos;
    int y = unit->yPos;
    gSubjectUnit = unit;

    InitTargets(x, y);

    unk = GetSomeBallistaItemAt(x, y);
    if (unk != 0) {
        BmMapFill(gBmMapRange, 0);

        MapAddInBoundedRange(x, y, GetItemMinRange(unk), GetItemMaxRange(unk));

        ForEachUnitInRange(AddUnitToTargetListIfAllied);

        TryAddTrapsToTargetList();
    }

    return;
}

void TryAddClosedDoorToTargetList(int x, int y) {

    if (gBmMapTerrain[y][x] != TERRAIN_DOOR) {
        return;
    }

    if (!IsThereClosedDoorAt(x, y)) {
        return;
    }

    AddTarget(x, y, TERRAIN_DOOR, 0);

    return;
}

void TryAddBridgeToTargetList(int x, int y) {

    if (gBmMapTerrain[y][x] != TERRAIN_BRIDGE_14) {
        return;
    }

    if (!IsThereClosedDoorAt(x, y)) {
        return;
    }

    AddTarget(x, y, TERRAIN_BRIDGE_14, 0);

    return;
}

void MakeTargetListForDoorAndBridges(struct Unit* unit, int terrainId) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    switch (terrainId) {
        case TERRAIN_DOOR:
            ForEachAdjacentPosition(x, y, TryAddClosedDoorToTargetList);
            return;
        case TERRAIN_BRIDGE_14:
            ForEachAdjacentPosition(x, y, TryAddBridgeToTargetList);
            return;
    }

    return;
}

void sub_8025864(int x, int y) {
    switch (gBmMapTerrain[y][x]) {
        case TERRAIN_DOOR:
            AddTarget(x, y, TERRAIN_DOOR, 0);
            return;
        case TERRAIN_BRIDGE_14:
            AddTarget(x, y, TERRAIN_BRIDGE_14, 0);
            return;
    }

    return;
}

void MakeTargetListForPick(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachAdjacentPosition(x, y, sub_8025864);

    if (gBmMapTerrain[unit->yPos][unit->xPos] == TERRAIN_CHEST_21) {
        AddTarget(x, y, TERRAIN_CHEST_21, 0);
    }

    return;
}

void MakeTerrainHealTargetList(int faction) {
    int i;

    InitTargets(0, 0);

    for (i = faction + 1; i < faction + 0x40; i++) {
        struct Unit* unit = GetUnit(i);
        int terrainId;
        int amount;

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (unit->state & (US_DEAD | US_NOT_DEPLOYED | US_RESCUED | US_BIT16)) {
            continue;
        }

        terrainId = gBmMapTerrain[unit->yPos][unit->xPos];

        if (GetTerrainHealAmount(terrainId) != 0 && (GetUnitCurrentHp(unit) != GetUnitMaxHp(unit))) {
            amount = (GetTerrainHealAmount(terrainId) * GetUnitMaxHp(unit)) / 100;
            AddTarget(unit->xPos, unit->yPos, unit->index, amount);
        }

        if (GetTerrainHealsStatus(terrainId) == 0) {
            continue;
        }

        if (unit->statusIndex == UNIT_STATUS_NONE) {
            continue;
        }

        if (unit->statusIndex == UNIT_STATUS_13) {
            unit->statusIndex = UNIT_STATUS_PETRIFY;
        }

        AddTarget(unit->xPos, unit->yPos, unit->index, -1);
    }

    return;
}

void MakePoisonDamageTargetList(int faction) {

    int i;

    InitTargets(0, 0);

    for (i = faction + 1; i < faction + 0x40; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (unit->state & (US_DEAD | US_NOT_DEPLOYED | US_RESCUED | US_BIT16)) {
            continue;
        }

        if (unit->statusIndex != UNIT_STATUS_POISON) {
            continue;
        }

        AddTarget(unit->xPos, unit->yPos, unit->index, NextRN_N(3) + 1);
    }

    return;
}

void MakeGorgonEggHatchTargetList(int faction) {
    int i;
    s8 r8;

    InitTargets(0, 0);

    // Seems to be required to match
    r8 = 5;

    for (i = faction + 1; i < faction + 0x40; i++) {
        struct Unit* unit = GetUnit(i);
        struct Trap* trap;
        int turnsToHatch;
        int state;

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        state = unit->state & (US_DEAD | US_NOT_DEPLOYED | US_RESCUED | US_BIT16);

        if (state) {
            continue;
        }

        if (unit->statusIndex != UNIT_STATUS_RECOVER) {
            continue;
        }

        trap = GetTypedTrapAt(unit->xPos, unit->yPos, 0xC);

        if (trap == 0) {
            continue;
        }

        turnsToHatch = (u8)trap->data[0] - 1;
        if (turnsToHatch > 0) {
            trap->data[0] = turnsToHatch;
            trap->data[2] = trap->data[1];
        } else {
            trap->data[0] = state;

            trap->data[2]++;

            if (trap->data[2] >= trap->data[1]) {
                trap->data[2] = state;
                AddTarget(unit->xPos, unit->yPos, unit->index, r8);
            }
        }
    }

    return;
}

void TryAddUnitToRefreshTargetList(struct Unit* unit) {

    if (!IsSameAllegiance(gSubjectUnit->index, unit->index)) {
        return;
    }

    if (!(unit->state & US_UNSELECTABLE)) {
        return;
    }

    if (unit->statusIndex == UNIT_STATUS_PETRIFY || unit->statusIndex == UNIT_STATUS_13) {
        return;
    }

    AddTarget(unit->xPos, unit->yPos, unit->index, 0);

    return;
}

void MakeTargetListForRefresh(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, TryAddUnitToRefreshTargetList);

    return;
}

void AddAsTarget_IfCanStealFrom(struct Unit* unit) {
    int i;

    if (UNIT_FACTION(unit) != FACTION_RED) {
        return;
    }

    if (gActiveUnit->spd < unit->spd) {
        return;
    }

    for (i = 0; i < UNIT_ITEM_COUNT; i++) {
        u16 item = unit->items[i];

        if (item == 0) {
            return;
        }

        if (!IsItemStealable(item)) {
            continue;
        }

        AddTarget(unit->xPos, unit->yPos, unit->index, 0);
        return;
    }

    return;
}

void MakeTargetListForSteal(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, AddAsTarget_IfCanStealFrom);

    return;
}

void AddAsTarget_IfPositionCleanForSummon(int x, int y) {

    if (gBmMapUnit[y][x] != 0) {
        return;
    }

    if (gRAMChapterData.chapterVisionRange != 0 && gBmMapFog[y][x] == 0) {
        return;
    }

    if (!CanUnitCrossTerrain(gSubjectUnit, gBmMapTerrain[y][x])) {
        return;
    }

    AddTarget(x, y, 0, 0);

    return;
}

void MakeTargetListForSummon(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachAdjacentPosition(x, y, AddAsTarget_IfPositionCleanForSummon);

    return;
}

void sub_8025CD8(int x, int y) {

    if (gBmMapUnit[y][x] != 0) {
        return;
    }

    if (gRAMChapterData.chapterVisionRange != 0 && gBmMapFog[y][x] == 0) {
        return;
    }

    if (!CanUnitCrossTerrain(gSubjectUnit, gBmMapTerrain[y][x])) {
        return;
    }

    AddTarget(x, y, 0, 0);

    return;
}

void sub_8025D48(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    sub_8024FD8(x, y + 4, sub_8025CD8);

    return;
}

void sub_8025D80(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    sub_8024FD8(x - 4, y, sub_8025CD8);

    return;
}

void sub_8025DB8(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    sub_8024FD8(x + 4, y, sub_8025CD8);

    return;
}

void sub_8025DF0(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    sub_8024FD8(x, y - 4, sub_8025CD8);

    return;
}

void TryAddUnitToHealTargetList(struct Unit* unit) {

    if (!AreUnitsAllied(gSubjectUnit->index, unit->index)) {
        return;
    }

    if (unit->state & US_RESCUED) {
        return;
    }

    if (GetUnitCurrentHp(unit) == GetUnitMaxHp(unit)) {
        return;
    }

    AddTarget(unit->xPos, unit->yPos, unit->index, 0);

    return;
}

void MakeTargetListForAdjacentHeal(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, TryAddUnitToHealTargetList);

    return;
}

void MakeTargetListForRangedHeal(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    InitTargets(x, y);

    BmMapFill(gBmMapRange, 0);

    MapAddInRange(x, y, GetUnitMagBy2Range(gSubjectUnit), 1);

    ForEachUnitInRange(TryAddUnitToHealTargetList);

    return;
}

void AddToTargetListIfNotAllied(struct Unit* unit) {

    if (AreUnitsAllied(gSubjectUnit->index, unit->index) == 1) {
        return;
    }

    if (unit->statusIndex != UNIT_STATUS_NONE) {
        return;
    }

    AddTarget(unit->xPos, unit->yPos, unit->index, 0);

    return;
}

void MakeTargetListForFuckingNightmare(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    InitTargets(x, y);

    BmMapFill(gBmMapRange, 0);

    MapAddInRange(x, y, 3, 1);
    MapAddInRange(x, y, 0, -1);

    ForEachUnitInRange(AddToTargetListIfNotAllied);

    return;
}

void TryAddUnitToRestoreTargetList(struct Unit* unit) {

    if (!AreUnitsAllied(gSubjectUnit->index, unit->index)) {
        return;
    }

    if (unit->state & US_RESCUED) {
        return;
    }

    if (unit->statusIndex == UNIT_STATUS_NONE) {
        return;
    }

    AddTarget(unit->xPos, unit->yPos, unit->index, 0);

    return;
}

void MakeTargetListForRestore(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, TryAddUnitToRestoreTargetList);

    return;
}

void TryAddUnitToBarrierTargetList(struct Unit* unit) {

    if (!AreUnitsAllied(gSubjectUnit->index, unit->index)) {
        return;
    }

    if (unit->state & US_RESCUED) {
        return;
    }

    if (unit->barrierDuration >= 7) {
        return;
    }

    AddTarget(unit->xPos, unit->yPos, unit->index, 0);

    return;
}

void MakeTargetListForBarrier(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, TryAddUnitToBarrierTargetList);

    return;
}

void TryAddUnitToRescueStaffTargetList(struct Unit* unit) {

    if (!AreUnitsAllied(gSubjectUnit->index, unit->index)) {
        return;
    }

    AddTarget(unit->xPos, unit->yPos, unit->index, 0);

    return;
}

void MakeTargetListForRescueStaff(struct Unit* unit) {
    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachUnitInMagBy2Range(TryAddUnitToRescueStaffTargetList);

    return;
}

void TryAddUnitToSilenceTargetList(struct Unit* unit) {

    if (AreUnitsAllied(gSubjectUnit->index, unit->index)) {
        return;
    }

    if (unit->statusIndex != UNIT_STATUS_NONE && unit->statusIndex != UNIT_STATUS_SILENCED) {
        return;
    }

    AddTarget(unit->xPos, unit->yPos, unit->index, 0);

    return;
}

void TryAddUnitToSleepTargetList(struct Unit* unit) {

    if (AreUnitsAllied(gSubjectUnit->index, unit->index)) {
        return;
    }

    if (unit->statusIndex != UNIT_STATUS_NONE && unit->statusIndex != UNIT_STATUS_SLEEP) {
        return;
    }

    AddTarget(unit->xPos, unit->yPos, unit->index, 0);

    return;
}

void TryAddUnitToBerserkTargetList(struct Unit* unit) {

    if (AreUnitsAllied(gSubjectUnit->index, unit->index)) {
        return;
    }

    if (unit->statusIndex != UNIT_STATUS_NONE && unit->statusIndex != UNIT_STATUS_BERSERK) {
        return;
    }

    AddTarget(unit->xPos, unit->yPos, unit->index, 0);

    return;
}

void MakeTargetListForSilence(struct Unit* unit) {
    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachUnitInMagBy2Range(TryAddUnitToSilenceTargetList);

    return;
}

void MakeTargetListForSleep(struct Unit* unit) {
    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachUnitInMagBy2Range(TryAddUnitToSleepTargetList);

    return;
}

void MakeTargetListForBerserk(struct Unit* unit) {
    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachUnitInMagBy2Range(TryAddUnitToBerserkTargetList);

    return;
}

void TryAddUnitToWarpTargetList(struct Unit* unit) {
    if (!AreUnitsAllied(gSubjectUnit->index, unit->index)) {
        return;
    }

    AddTarget(unit->xPos, unit->yPos, unit->index, 0);

    return;
}

void MakeTargetListForWarp(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, TryAddUnitToWarpTargetList);

    return;
}

void MakeTargetListForUnlock(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachPosIn12Range(x, y, TryAddClosedDoorToTargetList);

    return;
}

void TryAddUnitToHammerneTargetList(struct Unit* unit) {
    int i;

    if (!IsSameAllegiance(gSubjectUnit->index, unit->index)) {
        return;
    }

    for (i = 0; i < UNIT_ITEM_COUNT; i++) {
        if (IsItemHammernable(unit->items[i])) {
            AddTarget(unit->xPos, unit->yPos, unit->index, 0);
            break;
        }
    }

    return;
}

void MakeTargetListForHammerne(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, TryAddUnitToHammerneTargetList);

    return;
}

void MakeTargetListForLatona(struct Unit* unit) {
    int phase;
    int i;

    InitTargets(unit->xPos, unit->yPos);

    phase = GetCurrentPhase();

    for (i = phase + 1; i < phase + 0x80; i++) {
        struct Unit* other = GetUnit(i);

        if (!UNIT_IS_VALID(other)) {
            continue;
        }

        if (other->state & US_UNAVAILABLE) {
            continue;
        }

        if ((GetUnitCurrentHp(other) == GetUnitMaxHp(other)) && (other->statusIndex == UNIT_STATUS_NONE)) {
            continue;
        }

        if (other == unit) {
            continue;
        }

        AddTarget(other->xPos, other->yPos, other->index, 0);
    }

    return;
}

void sub_8026414(int unk) {
    int i;
    int count = GetSelectTargetCount();

    for (i = 0; i < count; i++) {
        struct SelectTarget* target = GetTarget(i);

        struct Unit* unit = GetUnit(target->uid);

        if (GetUnitCurrentHp(unit) <= target->extra) {
            BWL_AddWinOrLossIdk(unit->pCharacterData->number, 0, unk);
            sub_80A4594(unit->pCharacterData->number);
        }
    }

    return;
}

void TryAddToMineTargetList(int x, int y) {
    struct Trap* trap;

    if (gBmMapUnit[y][x] != 0) {
        return;
    }

    if ((gRAMChapterData.chapterVisionRange != 0) && (gBmMapFog[y][x] == 0)) {
        return;
    }

    if (!CanUnitCrossTerrain(gSubjectUnit, gBmMapTerrain[y][x])) {
        return;
    }

    trap = GetTrapAt(x, y);

    if ((trap != 0) && (trap->type != TRAP_TORCHLIGHT)) {
        return;
    }

    AddTarget(x, y, 0, 0);

    return;
}

void MakeTargetListForMine(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);
    ForEachAdjacentPosition(x, y, TryAddToMineTargetList);

    return;
}

void TryAddToLightRuneTargetList(int x, int y) {
    struct Trap* trap;

    if (gBmMapUnit[y][x] != 0) {
        return;
    }

    trap = GetTrapAt(x, y);

    if (trap != 0) {
        return;
    }

    if (gUnknown_0880BB96[gBmMapTerrain[y][x]] <= 0) {
        return;
    }

    AddTarget(x, y, 0, 0);

    return;
}

void MakeTargetListForLightRune(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachAdjacentPosition(x, y, TryAddToLightRuneTargetList);

    return;
}

void TryAddUnitToDanceRingTargetList(struct Unit* unit) {

    if (UNIT_FACTION(unit) != FACTION_BLUE) {
        return;
    }

    if (unit->statusIndex != UNIT_STATUS_NONE) {
        return;
    }

    AddTarget(unit->xPos, unit->yPos, unit->index, 0);

    return;
}

void MakeTargetListForDanceRing(struct Unit* unit) {
    int x = unit->xPos;
    int y = unit->yPos;

    gSubjectUnit = unit;

    BmMapFill(gBmMapRange, 0);

    ForEachAdjacentUnit(x, y, TryAddUnitToDanceRingTargetList);

    return;
}