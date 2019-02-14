#include "global.h"

#include "constants/terrains.h"

#include "bmunit.h"
#include "bmmap.h"

void FillMovementMapForUnit(struct Unit* unit);
void FillMovementMapForUnitAndMovement(struct Unit* unit, s8 movement);
void FillMovementMapForUnitPosition(struct Unit* unit);
void FillMovementRangeMapSomehow(int x, int y, const s8 mct[TERRAIN_COUNT]);
void FillMovementMapSomehow(int x, int y, const s8 mct[TERRAIN_COUNT]);
void FillMovementMapForUnitAt(struct Unit* unit, int x, int y, int movement);
void StoreMovCostTable(const s8 mct[TERRAIN_COUNT]);
void FillMovementMap(int x, int y, int movement, int id);
void sub_801A570(int connexion, int x, int y);
// ??? sub_801A640(???);
// ??? sub_801A7F4(???);
// ??? sub_801A82C(???);
// ??? sub_801A8E4(???);
// ??? sub_801A9D0(???);
// ??? MapAddInRange(???);
// ??? StoreR3ToMapSomething(???);
// ??? FillMapAttackRangeForUnit(???);
// ??? FillRangeByRangeMask(???);
// ??? FillMapStaffRangeForUnit(???);
// ??? ApplyStuffToRangeMaps(???);
// ??? sub_801B950(???);
void SetSubjectMap(u8** map);
// ??? FillRangeMap(???);
// ??? GetCurrentMovCostTable(???);

// gSubjectMap (?)
extern u8** gUnknown_030049A0;

// working Terrain-to-MoveCost table
extern u8 gUnknown_03004BB0[];

struct UnkMovMapFill {
    /* 00 */ s8 xPos;
    /* 01 */ s8 yPos;
    /* 02 */ u8 connexion;
    /* 03 */ u8 leastMoveCost;
};

struct Unk03004E60 {
    /* 00 */ struct UnkMovMapFill* pUnk00;
    /* 04 */ struct UnkMovMapFill* pUnk04;
    /* 08 */ s8 hasUnit;
    /* 09 */ u8 movement;
    /* 0A */ u8 unitId;
    /* 0B */ s8 maxMovementValue;
};

extern struct UnkMovMapFill gUnknown_030049B0[];
extern struct UnkMovMapFill gUnknown_03004C50[];

extern struct Unk03004E60 gUnknown_03004E60;

// inlined SetSubjectMap
static inline void SetMap(u8** map) {
    gUnknown_030049A0 = map;
}

void FillMovementMapForUnit(struct Unit* unit) {
    StoreMovCostTable(GetUnitMovementCost(unit));
    SetMap(gBmMapMovement);

    FillMovementMap(unit->xPos, unit->yPos, UNIT_MOV(unit), unit->index);
}

void FillMovementMapForUnitAndMovement(struct Unit* unit, s8 movement) {
    StoreMovCostTable(GetUnitMovementCost(unit));
    SetMap(gBmMapMovement);

    FillMovementMap(unit->xPos, unit->yPos, movement, unit->index);
}

void FillMovementMapForUnitPosition(struct Unit* unit) {
    StoreMovCostTable(GetUnitMovementCost(unit));
    SetMap(gBmMapMovement);

    FillMovementMap(unit->xPos, unit->yPos, MAP_MOVEMENT_MAX_124, 0);
}

void FillMovementRangeMapSomehow(int x, int y, const s8 mct[TERRAIN_COUNT]) {
    StoreMovCostTable(mct);
    SetMap(gBmMapRange);

    FillMovementMap(x, y, MAP_MOVEMENT_MAX_124, 0);
}

void FillMovementMapSomehow(int x, int y, const s8 mct[TERRAIN_COUNT]) {
    StoreMovCostTable(mct);
    SetMap(gBmMapMovement);

    FillMovementMap(x, y, MAP_MOVEMENT_MAX_124, 0);
}

void FillMovementMapForUnitAt(struct Unit* unit, int x, int y, int movement) {
    StoreMovCostTable(GetUnitMovementCost(unit));

    FillMovementMap(x, y, movement, unit->index);
}

void StoreMovCostTable(const s8 mct[TERRAIN_COUNT]) {
    int i;

    for (i = 0; i < TERRAIN_COUNT; ++i)
        gUnknown_03004BB0[i] = mct[i];
}

void FillMovementMap(int x, int y, int movement, int id) {
    gUnknown_03004E60.pUnk04 = gUnknown_030049B0;
    gUnknown_03004E60.pUnk00 = gUnknown_03004C50;

    gUnknown_03004E60.movement = movement;

    if (id == 0) {
        gUnknown_03004E60.hasUnit = FALSE;
    } else {
        gUnknown_03004E60.hasUnit = TRUE;
        gUnknown_03004E60.unitId = id;
    }

    gUnknown_03004E60.maxMovementValue = MAP_MOVEMENT_MAX;

    BmMapFill(gUnknown_030049A0, -1);

    gUnknown_03004E60.pUnk04->xPos = x;
    gUnknown_03004E60.pUnk04->yPos = y;
    gUnknown_03004E60.pUnk04->connexion = 5;
    gUnknown_03004E60.pUnk04->leastMoveCost = 0;

    gUnknown_030049A0[y][x] = 0;

    gUnknown_03004E60.pUnk04++;
    gUnknown_03004E60.pUnk04->connexion = 4;

    CallARM_FillMovementMap();
}

void sub_801A570(int connexion, int x, int y) {
    // This is a C implementation of the ARM (asm) function IRAMARM_Func5
    // Probably used during testing before switching to the a more "optimal" version.

    short tileMovementCost;

    x += gUnknown_03004E60.pUnk00->xPos;
    y += gUnknown_03004E60.pUnk00->yPos;

    tileMovementCost = gUnknown_03004BB0[gBmMapTerrain[y][x]]
        + (s8) gUnknown_030049A0[(u8) gUnknown_03004E60.pUnk00->yPos][(u8) gUnknown_03004E60.pUnk00->xPos];

    if (tileMovementCost >= gUnknown_030049A0[y][x])
        return;

    if (gUnknown_03004E60.hasUnit && gBmMapUnit[y][x])
        if ((gBmMapUnit[y][x] ^ gUnknown_03004E60.unitId) & 0x80)
            return;

    if (tileMovementCost > gUnknown_03004E60.movement)
        return;

    gUnknown_03004E60.pUnk04->xPos = x;
    gUnknown_03004E60.pUnk04->yPos = y;
    gUnknown_03004E60.pUnk04->connexion = connexion;
    gUnknown_03004E60.pUnk04->leastMoveCost = tileMovementCost;

    gUnknown_03004E60.pUnk04++;

    gUnknown_030049A0[y][x] = tileMovementCost;
}
