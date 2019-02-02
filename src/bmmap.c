#include "global.h"

void InitChapterMap(int chapterId);
// ??? sub_80195BC(???);
void sub_8019624(void);
// ??? sub_8019778(???);
void SetupMapRowPointers(void* buffer, u8*** outHandle, int width, int height);
void ClearMapWith(u8** map, int value);
// ??? sub_8019840(???);
void LoadChapterMap(void* into, int chapterId);
void LoadChapterMapGfx(int chapterId);
void sub_8019974(void); // bmmap?
void FlushTilesFromBuffer(void);
void FlushTerrainData(void);
// ??? GetSomeTerrainToChangeAtSomePosition(???);
// ??? UpdateGameTileGfx(???);
// ??? nullsub_8(???);
// ??? sub_8019B8C(???);
void UpdateGameTilesGraphics(void);
void sub_8019CBC(void);
void sub_8019D28(void);
// ??? sub_8019E08(???);
// ??? sub_8019ED4(???);
// ??? UpdateUnitMapAndVision(???);
// ??? UpdateTrapFogVision(???);
// ??? UpdateTrapHiddenStates(???);
void RefreshFogAndUnitMaps(void);
// ??? GetTerrainNameString(???);
// ??? GetTerrainHealAmount(???);
// ??? GetTerrainSomething(???);
// ??? sub_801A278(???);
// ??? RevertMapChangesById(???);
// ??? FillMovementMapForUnit(???);
// ??? FillMovementMapForUnitAndMovement(???);
// ??? FillMovementMapForUnitPosition(???);
// ??? FillMovementRangeMapSomehow(???);
void FillMovementMapSomehow(int x, int y, const s8* movCostLookup);
// ??? FillMovementMapForUnitAt(???);
// ??? StoreMovCostTable(???);
// ??? FillMovementMap(???);
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

extern u8 gUnknown_02001000[];

extern u8 gBmMapUnitPool[];
extern u8 gBmMapTerrainPool[];
extern u8 gBmMapMovementPool[];
extern u8 gBmMapRangePool[];
extern u8 gBmMapFogPool[];
extern u8 gBmMapHiddenPool[];
extern u8 gBmMapUnkPool[];

void InitChapterMap(int chapterId) {
	LoadChapterMap(gUnknown_02001000, chapterId);
	LoadChapterMapGfx(chapterId);

	SetupMapRowPointers(gBmMapUnitPool,     &gBmMapUnit,     gBmMapSize.width, gBmMapSize.height);
	SetupMapRowPointers(gBmMapTerrainPool,  &gBmMapTerrain,  gBmMapSize.width, gBmMapSize.height);
	SetupMapRowPointers(gBmMapMovementPool, &gBmMapMovement, gBmMapSize.width, gBmMapSize.height);
	SetupMapRowPointers(gBmMapRangePool,    &gBmMapRange,    gBmMapSize.width, gBmMapSize.height);
	SetupMapRowPointers(gBmMapFogPool,      &gBmMapFog,      gBmMapSize.width, gBmMapSize.height);
	SetupMapRowPointers(gBmMapHiddenPool,   &gBmMapHidden,   gBmMapSize.width, gBmMapSize.height);
	SetupMapRowPointers(gBmMapUnkPool, &gBmMapUnk, gBmMapSize.width, gBmMapSize.height);

	ClearMapWith(gBmMapUnit, 0);
	ClearMapWith(gBmMapTerrain, 0);

	FlushTilesFromBuffer();
	ApplyTrapMapChanges();
	FlushTerrainData();

	// TODO: chapter id definitions
	if (gUnknown_0202BCF0.chapterIndex == 0x75)
		sub_8019624();
}

void sub_80195BC(int chapterId) {
	LoadChapterMap(gUnknown_02001000, chapterId);

	SetupMapRowPointers(gBmMapUnitPool, &gBmMapUnit, gBmMapSize.width, gBmMapSize.height);
	SetupMapRowPointers(gBmMapTerrainPool, &gBmMapTerrain, gBmMapSize.width, gBmMapSize.height);

	ClearMapWith(gBmMapUnit, 0);
	ClearMapWith(gBmMapTerrain, 0);

	FlushTilesFromBuffer();
	FlushTerrainData();
}
