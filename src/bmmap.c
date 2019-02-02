#include "global.h"

#include "constants/terrains.h"

void InitChapterMap(int chapterId);
void sub_80195BC(int chapterId);
void sub_8019624(void);
void sub_8019778(void);
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

extern u16** const gUnknown_0859A9D4;
extern u8** gUnknown_03000808;

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

void sub_8019624(void) {
	int ix, iy;

	// Automatic water shadows?

	for (iy = 0; iy < gBmMapSize.height; ++iy) {
		for (ix = 0; ix < gBmMapSize.width; ++ix) {
			int connexion;

			if (gBmMapTerrain[iy][ix] != TERRAIN_WATER)
				continue;

			connexion = 0;

			if (ix > 0) {
				if (gBmMapTerrain[iy][ix - 1] == TERRAIN_FLOOR_17)
					connexion = 1;

				if (gBmMapTerrain[iy][ix - 1] == TERRAIN_STAIRS)
					connexion = 1;

				if (gBmMapTerrain[iy][ix - 1] == TERRAIN_CHEST_20)
					connexion = 1;

				if (gBmMapTerrain[iy][ix - 1] == TERRAIN_CHEST_21)
					connexion = 1;
			}

			if (iy > 0) {
				if (gBmMapTerrain[iy - 1][ix] == TERRAIN_FLOOR_17)
					connexion += 2;

				if (gBmMapTerrain[iy - 1][ix] == TERRAIN_STAIRS)
					connexion += 2;

				if (gBmMapTerrain[iy - 1][ix] == TERRAIN_CHEST_20)
					connexion += 2;

				if (gBmMapTerrain[iy - 1][ix] == TERRAIN_CHEST_21)
					connexion += 2;
			}

			if (ix > 0 && iy > 0)
				if ((gBmMapTerrain[iy]    [ix - 1] == TERRAIN_FLOOR_17) &&
					(gBmMapTerrain[iy + 1][ix - 1] == TERRAIN_WATER) &&
					(gBmMapTerrain[iy - 1][ix]     != TERRAIN_FLOOR_17))
					connexion = 4;

			switch (connexion) {

			case 1: // straight shadow on the left
				gUnknown_0859A9D4[iy][ix] = 0x2DC;
				break;

			case 2: // straight shadow on the top
				gUnknown_0859A9D4[iy][ix] = 0x2D8;
				break;

			case 3: // shadow on both the left and the top
				gUnknown_0859A9D4[iy][ix] = 0x358;
				break;

			case 4: // shadow on the left, but stronger at the top-left than bottom-left
				gUnknown_0859A9D4[iy][ix] = 0x35C;
				break;

			} // switch (connexion)
		}
	}
}

void sub_8019778(void) {
	LoadChapterMap(gUnknown_02001000, gUnknown_0202BCF0.chapterIndex);

	FlushTilesFromBuffer();
	ApplyTrapMapChanges();
	FlushTerrainData();
	sub_8019624();
}

void SetupMapRowPointers(void* buffer, u8*** outHandle, int width, int height) {
	int i;
	u8* itBuffer;

	gUnknown_03000808 = buffer;

	width  += 2; // two tiles on each edge (shared)
	height += 4; // two tiles on each edge

	itBuffer = buffer + height * sizeof(u8*);

	for (i = 0; i < height; ++i) {
		gUnknown_03000808[i] = itBuffer;
		itBuffer += width;
	}

	// first row is actually the third, ensuring the top two map rows as safety
	*outHandle = gUnknown_03000808 + 2;
}

void ClearMapWith(u8** map, int value) {
	int size = (gBmMapSize.height + 4) * (gBmMapSize.width + 2);

	if (size % 2)
		size = size - 1;

	value = (0xFF & value);
	value += value << 8;

	CpuFill16(value, map[-2], size);

	SetSubjectMap(map);
}
