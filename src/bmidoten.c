#include "global.h"

#include "bmunit.h"
#include "bmmap.h"

// This is wip and was claimed by Stan
// It is in this branch because of it being split from the now-decompiled bmmap

void FillMovementMapForUnit(struct Unit* unit);
// ??? FillMovementMapForUnitAndMovement(???);
// ??? FillMovementMapForUnitPosition(???);
// ??? FillMovementRangeMapSomehow(???);
void FillMovementMapSomehow(int x, int y, const s8* movCostLookup);
// ??? FillMovementMapForUnitAt(???);
void StoreMovCostTable(const s8 mct[0x40]); // TODO: terrain count constant?
void FillMovementMap(int x, int y, int movement, int id);
// ??? sub_801A570(???);
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

// inlined SetSubjectMap
static inline void SetMap(u8** map) {
    gUnknown_030049A0 = map;
}

void FillMovementMapForUnit(struct Unit* unit) {
    StoreMovCostTable(GetUnitMovementCost(unit));

    SetMap(gBmMapMovement);
    FillMovementMap(unit->xPos, unit->yPos, UNIT_MOV(unit), unit->index);
}
