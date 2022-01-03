#ifndef GUARD_BMIDOTEN_H
#define GUARD_BMIDOTEN_H

struct UnkMovMapFill
{
    /* 00 */ s8 xPos;
    /* 01 */ s8 yPos;
    /* 02 */ u8 connexion;
    /* 03 */ u8 leastMoveCost;
};

struct MovMapFillState
{
    /* 00 */ struct UnkMovMapFill* pUnk00;
    /* 04 */ struct UnkMovMapFill* pUnk04;
    /* 08 */ s8 hasUnit;
    /* 09 */ u8 movement;
    /* 0A */ u8 unitId;
    /* 0B */ u8 maxMovementValue;
};

void GenerateUnitMovementMap(struct Unit* unit);
void GenerateUnitMovementMapExt(struct Unit* unit, s8 movement);
void GenerateUnitExtendedMovementMap(struct Unit* unit);
void GenerateExtendedMovementMapOnRange(int x, int y, const s8 mct[]);
void GenerateExtendedMovementMap(int x, int y, const s8 mct[]);
void GenerateMovementMapOnWorkingMap(struct Unit* unit, int x, int y, int movement);
void SetWorkingMoveCosts(const s8 mct[]);
void GenerateMovementMap(int x, int y, int movement, int unitId);
void sub_801A570(int connexion, int x, int y);
void GenerateBestMovementScript(int x, int y, u8 output[]);
void UnitApplyWorkingMovementScript(struct Unit* unit, int x, int y);
void MarkMovementMapEdges(void);
void MarkWorkingMapEdges(void);
void MapAddInRange(int x, int y, int range, int value);
void MapSetInRange(int x, int y, int range, int value);
void GenerateUnitCompleteAttackRange(struct Unit* unit);
void GenerateUnitStandingReachRange(struct Unit* unit, int reach);
void GenerateUnitCompleteStaffRange(struct Unit* unit);
void GenerateDangerZoneRange(s8 boolDisplayStaffRange);
void GenerateMagicSealMap(int value);
void SetWorkingBmMap(u8** map);
void MapAddInBoundedRange(short x, short y, short minRange, short maxRange);
s8* GetWorkingMoveCosts(void);

extern u8** gWorkingBmMap;
extern u8 gWorkingTerrainMoveCosts[];

extern struct UnkMovMapFill gUnknown_030049B0[];
extern struct UnkMovMapFill gUnknown_03004C50[];

extern struct MovMapFillState gMovMapFillState;

#endif // GUARD_BMIDOTEN_H
