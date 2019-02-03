#include "global.h"

#include "constants/terrains.h"

#include "hardware.h"
#include "chapterdata.h"

void InitChapterMap(int chapterId);
void sub_80195BC(int chapterId);
void sub_8019624(void);
void sub_8019778(void);
void SetupMapRowPointers(void* buffer, u8*** outHandle, int width, int height);
void ClearMapWith(u8** map, int value);
void sub_8019840(u8** map, u8 value);
void LoadChapterMap(void* into, int chapterId);
void LoadChapterMapGfx(int chapterId);
void sub_8019974(void);
void FlushTilesFromBuffer(void);
void FlushTerrainData(void);
int GetSomeTerrainToChangeAtSomePosition(int x, int y);
void UpdateGameTileGfx(u16* bg, int xOut, int yOut, int xMap, int yMap);
void nullsub_8(void);
void sub_8019B8C(u16* out, int xMap, int yMap, int xOut, int yOut);
void UpdateGameTilesGraphics(void);
void sub_8019CBC(void);
void sub_8019D28(void);
void sub_8019E08(int unk);
void sub_8019ED4(int unk);
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

extern u8* gUnknown_0859A9D0;
extern u16** gUnknown_0859A9D4; // reee y no const

extern u8** gUnknown_03000808;

extern u16 gUnknown_02030B8C[];

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

	// itBuffer = start of tile area (the first height * sizeof(u8*) bytes are reserved for row pointers)
	itBuffer = buffer + height * sizeof(u8*);

	// Setting up the row pointers
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

void sub_8019840(u8** map, u8 value) {
	int ix, iy;

	u8** theMap = map;

	// Set tile values for horizontal edges
	for (iy = 0; iy < gBmMapSize.height; ++iy) {
		theMap[iy][0]                  = value;
		theMap[iy][gBmMapSize.width-1] = value;
	}

	// Set tile values for vertical edges
	for (ix = 0; ix < gBmMapSize.width; ++ix) {
		theMap[0]                  [ix] = value;
		theMap[gBmMapSize.height-1][ix] = value;
	}
}

void LoadChapterMap(void* into, int chapterId) {
	// Decompress map data
	CopyDataWithPossibleUncomp(
		GetChapterMapPointer(chapterId), into);

	// Setting map size
	gBmMapSize.width  = ((u8*)(into))[0];
	gBmMapSize.height = ((u8*)(into))[1];

	// Decompress tileset config
	CopyDataWithPossibleUncomp(
		gChapterDataAssetTable[GetROMChapterStruct(chapterId)->mapTileConfigId], gUnknown_02030B8C);

	// Setting max camera offsets (?) TODO: figure out
	gUnknown_0202BCB0.unk28.x = gBmMapSize.width*16  - 240;
	gUnknown_0202BCB0.unk28.y = gBmMapSize.height*16 - 160;
}

void LoadChapterMapGfx(int chapterId) {
	// Decompress tileset graphics (part 1)
	CopyDataWithPossibleUncomp(
		gChapterDataAssetTable[GetROMChapterStruct(chapterId)->mapObj1Id],
		(void*)(BG_VRAM + 0x20 * 0x400)); // TODO: tile id constant?

	// Decompress tileset graphics (part 2, if it exists)
	if (gChapterDataAssetTable[GetROMChapterStruct(chapterId)->mapObj2Id])
		CopyDataWithPossibleUncomp(
			gChapterDataAssetTable[GetROMChapterStruct(chapterId)->mapObj2Id],
			(void*)(BG_VRAM + 0x20 * 0x600)); // TODO: tile id constant?

	// Apply tileset palette
	CopyToPaletteBuffer(
		gChapterDataAssetTable[GetROMChapterStruct(chapterId)->mapPaletteId],
		0x20 * 6, 0x20 * 10); // TODO: palette id constant?
}

void sub_8019974(void) {
	CopyToPaletteBuffer(
		gChapterDataAssetTable[GetROMChapterStruct(gUnknown_0202BCF0.chapterIndex)->mapPaletteId],
		0x20 * 6, 0x20 * 10); // TODO: palette id constant?
}

void FlushTilesFromBuffer(void) {
	int ix, iy;

	u16** rows;
	u16*  tiles;
	u16*  itBuffer;

	rows  = gUnknown_0859A9D4;
	tiles = (u16*)(gUnknown_02001000);

	gBmMapSize.height++; // ?

	// Ignore first short (width, height byte pair)
	tiles++;

	// Tile buffer starts after the rows
	itBuffer = (u16*)(gUnknown_0859A9D4 + gBmMapSize.height);

	for (iy = 0; iy < gBmMapSize.height; ++iy) {
		// Set row buffer
		rows[iy] = itBuffer;
		itBuffer += gBmMapSize.width;

		// Set tiles
		for (ix = 0; ix < gBmMapSize.width; ++ix)
			gUnknown_0859A9D4[iy][ix] = *tiles++;
	}

	// Fill "bottom" row with empty tiles?
	// "bottom" as the height had been increased too this is just weird

	tiles = gUnknown_0859A9D4[iy - 1];

	for (ix = 0; ix < gBmMapSize.width; ++ix)
		*tiles++ = 0;

	gBmMapSize.height--; // ?
}

void FlushTerrainData(void) {
	int ix, iy;

	for (iy = 0; iy < gBmMapSize.height; ++iy)
		for (ix = 0; ix < gBmMapSize.width; ++ix)
			gBmMapTerrain[iy][ix] = gUnknown_0859A9D0[gUnknown_0859A9D4[iy][ix] >> 2];

	UpdateAllLightRunes();
}

int GetSomeTerrainToChangeAtSomePosition(int x, int y) {
	return gUnknown_0859A9D0[gUnknown_0859A9D4[y][x] >> 2];
}

void UpdateGameTileGfx(u16* bg, int xOut, int yOut, int xMap, int yMap) {
	u16* out = bg + yOut * 0x40 + xOut * 2; // TODO: BG_LOCATED_TILE?
	u16* tile = gUnknown_02030B8C + gUnknown_0859A9D4[yMap][xMap];

	// TODO: palette id constants
	u16 base = gBmMapFog[yMap][xMap] ? (6 << 12) : (11 << 12);

	out[0x00 + 0] = base + *tile++;
	out[0x00 + 1] = base + *tile++;
	out[0x20 + 0] = base + *tile++;
	out[0x20 + 1] = base + *tile++;
}

void nullsub_8(void) {}

void sub_8019B8C(u16* out, int xMap, int yMap, int xOut, int yOut) {
	out = out + 2*(yOut * 0x20 + xOut);

	if (!out)
		nullsub_8();

	// TODO: tile macros?

	if (((s8**)(gBmMapMovement))[yMap][xMap] >= 0) {
		out[0x00 + 0] = 0x4280;
		out[0x00 + 1] = 0x4281;
		out[0x20 + 0] = 0x4282;
		out[0x20 + 1] = 0x4283;

		return;
	}

	if (((s8**)(gBmMapRange))[yMap][xMap]) {
		if (out[0]) {
			out[0x00 + 0] = 0x5284;
			out[0x00 + 1] = 0x5285;
			out[0x20 + 0] = 0x5286;
			out[0x20 + 1] = 0x5287;

			return;
		} else {
			out[0x00 + 0] = 0x5280;
			out[0x00 + 1] = 0x5281;
			out[0x20 + 0] = 0x5282;
			out[0x20 + 1] = 0x5283;

			return;
		}
	}

	out[0x00 + 0] = 0;
	out[0x00 + 1] = 0;
	out[0x20 + 0] = 0;
	out[0x20 + 1] = 0;
}

void UpdateGameTilesGraphics(void) {
	int ix, iy;

	gUnknown_0202BCB0.unk24.x = gUnknown_0202BCB0.camera.x >> 4;
	gUnknown_0202BCB0.unk24.y = gUnknown_0202BCB0.camera.y >> 4;

	for (iy = (10 - 1); iy >= 0; --iy)
		for (ix = (15 - 1); ix >= 0; --ix)
			UpdateGameTileGfx(gBG3TilemapBuffer, ix, iy,
				gUnknown_0202BCB0.unk24.x + ix, gUnknown_0202BCB0.unk24.y + iy);

	BG_EnableSyncByMask(1 << 3);
	BG_SetPosition(3, 0, 0);

	gLCDControlBuffer.dispcnt.bg0_on = TRUE;
	gLCDControlBuffer.dispcnt.bg1_on = TRUE;
	gLCDControlBuffer.dispcnt.bg2_on = TRUE;
	gLCDControlBuffer.dispcnt.bg3_on = TRUE;
	gLCDControlBuffer.dispcnt.obj_on = TRUE;
}

void sub_8019CBC(void) {
	int ix, iy;

	SetBackgroundTileDataOffset(2, 0x8000);

	gUnknown_0202BCB0.unk24.x = gUnknown_0202BCB0.camera.x >> 4;
	gUnknown_0202BCB0.unk24.y = gUnknown_0202BCB0.camera.y >> 4;

	for (iy = (10 - 1); iy >= 0; --iy)
			for (ix = (15 - 1); ix >= 0; --ix)
			UpdateGameTileGfx(gBG2TilemapBuffer, ix, iy,
				gUnknown_0202BCB0.unk24.x + ix, gUnknown_0202BCB0.unk24.y + iy);

	BG_EnableSyncByMask(1 << 2);
	BG_SetPosition(2, 0, 0);
}

void sub_8019D28(void) {
	// TODO: figure out

	if (gUnknown_0202BCB0.camera.x != gUnknown_0202BCB0.unk10.x) {
		if (gUnknown_0202BCB0.camera.x > gUnknown_0202BCB0.unk10.x) {
			if (((gUnknown_0202BCB0.camera.x - 1) ^ (gUnknown_0202BCB0.unk10.x - 1)) & 0x10)
				sub_8019E08(15);
		} else {
			if ((gUnknown_0202BCB0.camera.x ^ gUnknown_0202BCB0.unk10.x) & 0x10)
				sub_8019E08(0);
		}
	}

	if (gUnknown_0202BCB0.camera.y != gUnknown_0202BCB0.unk10.y) {
		if (gUnknown_0202BCB0.camera.y > gUnknown_0202BCB0.unk10.y) {
			if (((gUnknown_0202BCB0.camera.y - 1) ^ (gUnknown_0202BCB0.unk10.y - 1)) & 0x10)
				sub_8019ED4(10);
		} else {
			if ((gUnknown_0202BCB0.camera.y ^ gUnknown_0202BCB0.unk10.y) & 0x10)
				sub_8019ED4(0);
		}
	}

	gUnknown_0202BCB0.unk10 = gUnknown_0202BCB0.camera;

	BG_SetPosition(3,
		-((u16)(gUnknown_0202BCB0.unk24.x)) * 16 + gUnknown_0202BCB0.camera.x,
		-((u16)(gUnknown_0202BCB0.unk24.y)) * 16 + gUnknown_0202BCB0.camera.y
	);

	// TODO: GAME STATE BITS CONSTANTS
	if (gUnknown_0202BCB0.gameStateBits & 1) {
		BG_SetPosition(2,
			-((u16)(gUnknown_0202BCB0.unk24.x)) * 16 + gUnknown_0202BCB0.camera.x,
			-((u16)(gUnknown_0202BCB0.unk24.y)) * 16 + gUnknown_0202BCB0.camera.y
		);
	}
}
