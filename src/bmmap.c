#include "global.h"

#include "constants/terrains.h"

#include "hardware.h"
#include "chapterdata.h"
#include "proc.h"
#include "event.h"
#include "bmunit.h"
#include "bmmap.h"

enum { MAP_POOL_SIZE = 0x7B8 };

// TODO: figure out what's up with this
extern u16 gUnknown_02001000[];

EWRAM_DATA struct Vec2 gBmMapSize = {};

EWRAM_DATA u8** gBmMapUnit     = NULL;
EWRAM_DATA u8** gBmMapTerrain  = NULL;
EWRAM_DATA u8** gBmMapMovement = NULL;
EWRAM_DATA u8** gBmMapRange    = NULL;
EWRAM_DATA u8** gBmMapFog      = NULL;
EWRAM_DATA u8** gBmMapHidden   = NULL;
EWRAM_DATA u8** gBmMapUnk      = NULL;

EWRAM_DATA static u8 gBmMapUnitPool[MAP_POOL_SIZE] = {};
EWRAM_DATA static u8 gBmMapTerrainPool[MAP_POOL_SIZE] = {};
EWRAM_DATA static u8 gBmMapFogPool[MAP_POOL_SIZE] = {};
EWRAM_DATA static u8 gBmMapHiddenPool[MAP_POOL_SIZE] = {};
EWRAM_DATA static u8 gBmMapUnkPool[MAP_POOL_SIZE] = {};
EWRAM_DATA static u16 gUnknown_02030B8C[0x1200] = {};
EWRAM_DATA static u16 sRawTilePool[MAP_POOL_SIZE] = {};

static u8** gUnknown_03000808;

static u8 gBmMapMovementPool[MAP_POOL_SIZE];
static u8 gBmMapRangePool[MAP_POOL_SIZE];

u8*   gUnknown_0859A9D0 = (u8*)(gUnknown_02030B8C + 0x1000);
u16** gUnknown_0859A9D4 = (u16**)(sRawTilePool);

void InitChapterMap(int chapterId) {
	LoadChapterMap(gUnknown_02001000, chapterId);
	LoadChapterMapGfx(chapterId);

	SetupMapRowPointers(gBmMapUnitPool,     &gBmMapUnit,     gBmMapSize.x, gBmMapSize.y);
	SetupMapRowPointers(gBmMapTerrainPool,  &gBmMapTerrain,  gBmMapSize.x, gBmMapSize.y);
	SetupMapRowPointers(gBmMapMovementPool, &gBmMapMovement, gBmMapSize.x, gBmMapSize.y);
	SetupMapRowPointers(gBmMapRangePool,    &gBmMapRange,    gBmMapSize.x, gBmMapSize.y);
	SetupMapRowPointers(gBmMapFogPool,      &gBmMapFog,      gBmMapSize.x, gBmMapSize.y);
	SetupMapRowPointers(gBmMapHiddenPool,   &gBmMapHidden,   gBmMapSize.x, gBmMapSize.y);
	SetupMapRowPointers(gBmMapUnkPool, &gBmMapUnk, gBmMapSize.x, gBmMapSize.y);

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

	SetupMapRowPointers(gBmMapUnitPool,    &gBmMapUnit,    gBmMapSize.x, gBmMapSize.y);
	SetupMapRowPointers(gBmMapTerrainPool, &gBmMapTerrain, gBmMapSize.x, gBmMapSize.y);

	ClearMapWith(gBmMapUnit, 0);
	ClearMapWith(gBmMapTerrain, 0);

	FlushTilesFromBuffer();
	FlushTerrainData();
}

void sub_8019624(void) {
	int ix, iy;

	// Automatic water shadows?

	for (iy = 0; iy < gBmMapSize.y; ++iy) {
		for (ix = 0; ix < gBmMapSize.x; ++ix) {
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

void SetupMapRowPointers(void* buffer, u8*** outHandle, int x, int y) {
	int i;
	u8* itBuffer;

	gUnknown_03000808 = buffer;

	x  += 2; // two tiles on each edge (shared)
	y += 4; // two tiles on each edge

	// itBuffer = start of tile area (the first y * sizeof(u8*) bytes are reserved for row pointers)
	itBuffer = buffer + y * sizeof(u8*);

	// Setting up the row pointers
	for (i = 0; i < y; ++i) {
		gUnknown_03000808[i] = itBuffer;
		itBuffer += x;
	}

	// first row is actually the third, ensuring the top two map rows as safety
	*outHandle = gUnknown_03000808 + 2;
}

void ClearMapWith(u8** map, int value) {
	int size = (gBmMapSize.y + 4) * (gBmMapSize.x + 2);

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
	for (iy = 0; iy < gBmMapSize.y; ++iy) {
		theMap[iy][0]                  = value;
		theMap[iy][gBmMapSize.x-1] = value;
	}

	// Set tile values for vertical edges
	for (ix = 0; ix < gBmMapSize.x; ++ix) {
		theMap[0]                  [ix] = value;
		theMap[gBmMapSize.y-1][ix] = value;
	}
}

void LoadChapterMap(void* into, int chapterId) {
	// Decompress map data
	CopyDataWithPossibleUncomp(
		GetChapterMapPointer(chapterId), into);

	// Setting map size
	gBmMapSize.x  = ((u8*)(into))[0];
	gBmMapSize.y = ((u8*)(into))[1];

	// Decompress tileset config
	CopyDataWithPossibleUncomp(
		gChapterDataAssetTable[GetROMChapterStruct(chapterId)->mapTileConfigId], gUnknown_02030B8C);

	// Setting max camera offsets (?) TODO: figure out
	gUnknown_0202BCB0.unk28.x = gBmMapSize.x*16  - 240;
	gUnknown_0202BCB0.unk28.y = gBmMapSize.y*16 - 160;
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

	gBmMapSize.y++; // ?

	// Ignore first short (x, y byte pair)
	tiles++;

	// Tile buffer starts after the rows
	itBuffer = (u16*)(gUnknown_0859A9D4 + gBmMapSize.y);

	for (iy = 0; iy < gBmMapSize.y; ++iy) {
		// Set row buffer
		rows[iy] = itBuffer;
		itBuffer += gBmMapSize.x;

		// Set tiles
		for (ix = 0; ix < gBmMapSize.x; ++ix)
			gUnknown_0859A9D4[iy][ix] = *tiles++;
	}

	// Fill "bottom" row with empty tiles?
	// "bottom" as the y had been increased too this is just weird

	tiles = gUnknown_0859A9D4[iy - 1];

	for (ix = 0; ix < gBmMapSize.x; ++ix)
		*tiles++ = 0;

	gBmMapSize.y--; // ?
}

void FlushTerrainData(void) {
	int ix, iy;

	for (iy = 0; iy < gBmMapSize.y; ++iy)
		for (ix = 0; ix < gBmMapSize.x; ++ix)
			gBmMapTerrain[iy][ix] = gUnknown_0859A9D0[gUnknown_0859A9D4[iy][ix] >> 2];

	UpdateAllLightRunes();
}

int GetSomeTerrainToChangeAtSomePosition(int x, int y) {
	return gUnknown_0859A9D0[gUnknown_0859A9D4[y][x] >> 2];
}

void UpdateGameTileGfx(u16* bg, int xTileMap, int yTileMap, int xBmMap, int yBmMap) {
	u16* out = bg + yTileMap * 0x40 + xTileMap * 2; // TODO: BG_LOCATED_TILE?
	u16* tile = gUnknown_02030B8C + gUnknown_0859A9D4[yBmMap][xBmMap];

	// TODO: palette id constants
	u16 base = gBmMapFog[yBmMap][xBmMap] ? (6 << 12) : (11 << 12);

	out[0x00 + 0] = base + *tile++;
	out[0x00 + 1] = base + *tile++;
	out[0x20 + 0] = base + *tile++;
	out[0x20 + 1] = base + *tile++;
}

void nullsub_8(void) {}

void sub_8019B8C(u16* bg, int xBmMap, int yBmMap, int xTileMap, int yTileMap) {
	bg = bg + 2*(yTileMap * 0x20 + xTileMap);

	if (!bg)
		nullsub_8();

	// TODO: tile macros?
	// TODO: are the movement and range maps s8[][]?

	if (((s8**)(gBmMapMovement))[yBmMap][xBmMap] >= 0) {
		bg[0x00 + 0] = 0x4280;
		bg[0x00 + 1] = 0x4281;
		bg[0x20 + 0] = 0x4282;
		bg[0x20 + 1] = 0x4283;

		return;
	}

	if (((s8**)(gBmMapRange))[yBmMap][xBmMap]) {
		if (bg[0]) {
			bg[0x00 + 0] = 0x5284;
			bg[0x00 + 1] = 0x5285;
			bg[0x20 + 0] = 0x5286;
			bg[0x20 + 1] = 0x5287;

			return;
		} else {
			bg[0x00 + 0] = 0x5280;
			bg[0x00 + 1] = 0x5281;
			bg[0x20 + 0] = 0x5282;
			bg[0x20 + 1] = 0x5283;

			return;
		}
	}

	bg[0x00 + 0] = 0;
	bg[0x00 + 1] = 0;
	bg[0x20 + 0] = 0;
	bg[0x20 + 1] = 0;
}

void UpdateGameTilesGraphics(void) {
	int ix, iy;

	gUnknown_0202BCB0.unk24.x = gUnknown_0202BCB0.camera.x >> 4;
	gUnknown_0202BCB0.unk24.y = gUnknown_0202BCB0.camera.y >> 4;

	for (iy = (10 - 1); iy >= 0; --iy)
		for (ix = (15 - 1); ix >= 0; --ix)
			UpdateGameTileGfx(gBG3TilemapBuffer, ix, iy,
				(short) gUnknown_0202BCB0.unk24.x + ix, (short) gUnknown_0202BCB0.unk24.y + iy);

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
				(short) gUnknown_0202BCB0.unk24.x + ix, (short) gUnknown_0202BCB0.unk24.y + iy);

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
		gUnknown_0202BCB0.camera.x - gUnknown_0202BCB0.unk24.x * 16,
		gUnknown_0202BCB0.camera.y - gUnknown_0202BCB0.unk24.y * 16
	);

	// TODO: GAME STATE BITS CONSTANTS
	if (gUnknown_0202BCB0.gameStateBits & 1) {
		BG_SetPosition(2,
			gUnknown_0202BCB0.camera.x - gUnknown_0202BCB0.unk24.x * 16,
			gUnknown_0202BCB0.camera.y - gUnknown_0202BCB0.unk24.y * 16
		);
	}
}

void sub_8019E08(u16 unk) {
	u16 xBmMap = (gUnknown_0202BCB0.camera.x >> 4) + unk;
	u16 yBmMap = (gUnknown_0202BCB0.camera.y >> 4);

	u16 xTileMap = ((gUnknown_0202BCB0.camera.x >> 4) - gUnknown_0202BCB0.unk24.x + unk) & 0xF;
	u16 yTileMap = ((gUnknown_0202BCB0.camera.y >> 4) - gUnknown_0202BCB0.unk24.y);

	int iy;

	if (!(gUnknown_0202BCB0.gameStateBits & 1)) {
		for (iy = 10; iy >= 0; --iy) {
			UpdateGameTileGfx(gBG3TilemapBuffer,
				xTileMap, (yTileMap + iy) & 0xF,
				xBmMap, (yBmMap + iy));
		}

		BG_EnableSyncByMask(1 << 3);
	} else {
		for (iy = 10; iy >= 0; --iy) {
			UpdateGameTileGfx(gBG3TilemapBuffer,
				xTileMap, (yTileMap + iy) & 0xF,
				xBmMap, (yBmMap + iy));

			sub_8019B8C(gBG2TilemapBuffer,
				xBmMap, (yBmMap + iy),
				xTileMap, (yTileMap + iy) & 0xF);
		}

		BG_EnableSyncByMask((1 << 3) | (1 << 2));
	}
}

void sub_8019ED4(u16 unk) {
	u16 xBmMap = (gUnknown_0202BCB0.camera.x >> 4);
	u16 yBmMap = (gUnknown_0202BCB0.camera.y >> 4) + unk;

	u16 xTileMap = ((gUnknown_0202BCB0.camera.x >> 4) - gUnknown_0202BCB0.unk24.x);
	u16 yTileMap = ((gUnknown_0202BCB0.camera.y >> 4) - gUnknown_0202BCB0.unk24.y + unk) & 0xF;

	int ix;

	if (!(gUnknown_0202BCB0.gameStateBits & 1)) {
		for (ix = 15; ix >= 0; --ix) {
			UpdateGameTileGfx(gBG3TilemapBuffer,
				(xTileMap + ix) & 0xF, yTileMap,
				(xBmMap + ix), yBmMap);
		}

		BG_EnableSyncByMask(1 << 3);
	} else {
		for (ix = 15; ix >= 0; --ix) {
			UpdateGameTileGfx(gBG3TilemapBuffer,
				(xTileMap + ix) & 0xF, yTileMap,
				(xBmMap + ix), yBmMap);

			sub_8019B8C(gBG2TilemapBuffer,
				(xBmMap + ix), yBmMap,
				(xTileMap + ix) & 0xF, yTileMap);
		}

		BG_EnableSyncByMask((1 << 3) | (1 << 2));
	}
}

void UpdateUnitMapAndVision(void) {
	struct Unit* unit;
	int i;

	// 1. Blue & Green units

	for (i = 1; i < FACTION_RED; ++i) {
		unit = GetUnit(i);

		if (!UNIT_IS_VALID(unit))
			continue;

		if (unit->state & US_HIDDEN)
			continue;

		// Put unit on unit map
		gBmMapUnit[unit->yPos][unit->xPos] = i;

		// If fog is enabled, apply unit vision to fog map
		if (gUnknown_0202BCF0.chapterVisionRange)
			MapAddInRange(unit->xPos, unit->yPos, GetUnitFogViewRange(unit), 1);
	}

	// 2. Red (& Purple) units

	if (gUnknown_0202BCF0.chapterPhaseIndex != FACTION_RED) {
		// 2.1. No red phase

		for (i = FACTION_RED + 1; i < FACTION_PURPLE + 6; ++i) {
			unit = GetUnit(i);

			if (!UNIT_IS_VALID(unit))
				continue;

			if (unit->state & US_HIDDEN)
				continue;

			// If unit is magic seal, set fog in range 0-10.
			// Magic seal set the fog map probably solely for the alternate map palette.
			if (UNIT_CATTRIBUTES(unit) & CA_MAGICSEAL)
				MapAddInRange(unit->xPos, unit->yPos, 10, -1);

			if (gUnknown_0202BCF0.chapterVisionRange && !gBmMapFog[unit->yPos][unit->xPos]) {
				// If in fog, set unit bit on the hidden map, and set the "hidden in fog" state

				gBmMapHidden[unit->yPos][unit->xPos] |= HIDDEN_BIT_UNIT;
				unit->state = unit->state | US_BIT9;
			} else {
				// If not in fog, put unit on the map, and update state accordingly

				gBmMapUnit[unit->yPos][unit->xPos] = i;

				if (unit->state & US_BIT9)
					unit->state = (unit->state &~ US_BIT9) | US_BIT8;
			}
		}
	} else {
		// 2.2. Yes red phase

		// This does mostly the same as the "No red phase" loop, except:
		// - It always puts the units on the unit map
		// - It never sets the "spotted" unit state bit (even if unit is seen)

		for (i = FACTION_RED + 1; i < FACTION_PURPLE + 6; ++i) {
			unit = GetUnit(i);

			if (!UNIT_IS_VALID(unit))
				continue;

			if (unit->state & US_HIDDEN)
				continue;

			// See above
			if (UNIT_CATTRIBUTES(unit) & CA_MAGICSEAL)
				MapAddInRange(unit->xPos, unit->yPos, 10, -1);

			if (gUnknown_0202BCF0.chapterVisionRange) {
				// Update unit state according to fog level

				if (!gBmMapFog[unit->yPos][unit->xPos])
					unit->state = unit->state | US_BIT9;
				else
					unit->state = unit->state &~ US_BIT9;
			}

			// Put on unit map
			gBmMapUnit[unit->yPos][unit->xPos] = i;
		}
	}
}

void UpdateTrapFogVision(void) {
	struct Trap* trap;
	
	for (trap = GetTrap(0); trap->type != TRAP_NONE; ++trap) {
		switch (trap->type) {

		case TRAP_TORCHLIGHT:
			MapAddInRange(trap->xPos, trap->yPos, trap->data[TRAP_EXTDATA_LIGHT_TURNSLEFT], 1);
			break;

		} // switch (trap->type)
	}
}

void UpdateTrapHiddenStates(void) {
	struct Trap* trap;
	
	for (trap = GetTrap(0); trap->type != TRAP_NONE; ++trap) {
		switch (trap->type) {

		case TRAP_MINE:
			if (!gBmMapUnit[trap->yPos][trap->xPos])
				gBmMapHidden[trap->yPos][trap->xPos] |= HIDDEN_BIT_TRAP;

			break;

		} // switch (trap->type)
	}
}

void RefreshFogAndUnitMaps(void) {
	// 1. Clear unit & hidden maps

	ClearMapWith(gBmMapUnit, 0);
	ClearMapWith(gBmMapHidden, 0);

	// 2. Clear fog map, with 1 (visible) if no fog, with 0 (hidden) if yes fog

	ClearMapWith(gBmMapFog, !gUnknown_0202BCF0.chapterVisionRange ? 1 : 0);

	// 3. Populate unit, fog & hidden maps

	UpdateTrapFogVision();
	UpdateUnitMapAndVision();
	UpdateTrapHiddenStates();
}

char* GetTerrainNameString(int terrainId) {
	return GetStringFromIndex(gUnknown_0880D374[terrainId]);
}

int GetTerrainHealAmount(int terrainId) {
	return gUnknown_0880C744[terrainId];
}

int GetTerrainSomething(int terrainId) {
	return gUnknown_0880C785[terrainId];
}

void sub_801A278(void) {
	const u16* tile = gUnknown_02030B8C;

	// TODO: game state bits constants
	if (!sub_800D208() || (gUnknown_0202BCB0.gameStateBits & 0x10)) {
		// TODO: macros?
		RegisterBlankTile(0x400 + (*tile++ & 0x3FF));
		RegisterBlankTile(0x400 + (*tile++ & 0x3FF));
		RegisterBlankTile(0x400 + (*tile++ & 0x3FF));
		RegisterBlankTile(0x400 + (*tile++ & 0x3FF));
	}

	// TODO: macro?
	gPaletteBuffer[0] = 0;
	EnablePaletteSync();
}

void RevertMapChangesById(int id) {
	struct MapChange* mapChange;
	u8 ix, iy;

	CopyDataWithPossibleUncomp(GetChapterMapPointer(gUnknown_0202BCF0.chapterIndex), gUnknown_02001000);

	mapChange = GetMapChangesPointerById(id);

	for (iy = mapChange->yOrigin; iy < (mapChange->yOrigin + mapChange->ySize); ++iy) {
		u16* itSource = (iy * gBmMapSize.x) + mapChange->xOrigin + (gUnknown_02001000 + 1);
		u16* itDest   = gUnknown_0859A9D4[iy] + mapChange->xOrigin;

		for (ix = mapChange->xOrigin; ix < (mapChange->xOrigin + mapChange->xSize); ++ix)
			*itDest++ = *itSource++;
	}
}
