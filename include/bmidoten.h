#ifndef GUARD_BMIDOTEN_H
#define GUARD_BMIDOTEN_H

struct UnkMovMapFill
{
    /* 00 */ s8 xPos;
    /* 01 */ s8 yPos;
    /* 02 */ u8 connexion;
    /* 03 */ u8 leastMoveCost;
};

struct Unk03004E60
{
    /* 00 */ struct UnkMovMapFill* pUnk00;
    /* 04 */ struct UnkMovMapFill* pUnk04;
    /* 08 */ s8 hasUnit;
    /* 09 */ u8 movement;
    /* 0A */ u8 unitId;
    /* 0B */ u8 maxMovementValue;
};

void FillMovementMapForUnit(struct Unit* unit);
void FillMovementMapForUnitAndMovement(struct Unit* unit, s8 movement);
void FillMovementMapForUnitPosition(struct Unit* unit);
void FillMovementRangeMapSomehow(int x, int y, const s8 mct[]);
void FillMovementMapSomehow(int x, int y, const s8 mct[]);
void FillMovementMapForUnitAt(struct Unit* unit, int x, int y, int movement);
void StoreMovCostTable(const s8 mct[]);
void FillMovementMap(int x, int y, int movement, int unitId);
void sub_801A570(int connexion, int x, int y);
void sub_801A640(int x, int y, u8 output[]);
void sub_801A7F4(u8* begin, u8* end);
void sub_801A82C(struct Unit* unit, int x, int y);
void sub_801A8E4(void);
void sub_801A9D0(void);
void MapAddInRange(int x, int y, int range, int value);
void StoreR3ToMapSomething(int x, int y, int range, int value);
void FillMapAttackRangeForUnit(struct Unit* unit);
void FillRangeByRangeMask(struct Unit* unit, int reach);
void FillMapStaffRangeForUnit(struct Unit* unit);
void ApplyStuffToRangeMaps(s8 boolDisplayStaffRange);
void sub_801B950(int value);
void SetSubjectMap(u8** map);
void FillRangeMap(short x, short y, short minRange, short maxRange);
u8* GetCurrentMovCostTable(void);

// gSubjectMap (?)
extern u8** gUnknown_030049A0;

// working Terrain-to-MoveCost table
extern u8 gUnknown_03004BB0[];

extern struct UnkMovMapFill gUnknown_030049B0[];
extern struct UnkMovMapFill gUnknown_03004C50[];

extern struct Unk03004E60 gUnknown_03004E60;

#endif // GUARD_BMIDOTEN_H