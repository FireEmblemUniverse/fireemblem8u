#ifndef GUARD_BMMAP_H
#define GUARD_BMMAP_H

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
void sub_8019E08(u16 unk);
void sub_8019ED4(u16 unk);
void UpdateUnitMapAndVision(void);
void UpdateTrapFogVision(void);
void UpdateTrapHiddenStates(void);
void RefreshFogAndUnitMaps(void);
char* GetTerrainNameString(int terrainId);
int GetTerrainHealAmount(int terrainId);
int GetTerrainSomething(int terrainId);
void sub_801A278(void);
void RevertMapChangesById(int id);

extern struct Vec2 gBmMapSize;
extern u8** gBmMapUnit;
extern u8** gBmMapTerrain;
extern u8** gBmMapMovement;
extern u8** gBmMapRange;
extern u8** gBmMapFog;
extern u8** gBmMapHidden;
extern u8** gBmMapUnk;

#endif // GUARD_BMMAP_H
