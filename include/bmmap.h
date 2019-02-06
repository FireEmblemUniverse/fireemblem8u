#ifndef GUARD_BMMAP_H
#define GUARD_BMMAP_H

void InitChapterMap(int chapterId);
void InitChapterPreviewMap(int chapterId);
void sub_8019624(void);
void sub_8019778(void);
void BmMapFill(u8** map, int value);
void BmMapFillEdges(u8** map, u8 value);
void UnpackChapterMap(void* into, int chapterId);
void UnpackChapterMapGraphics(int chapterId);
void UnpackChapterMapPalette(void);
void InitBaseTilesBmMap(void);
void RefreshTerrainBmMap(void);
int GetTrueTerrainAt(int x, int y);
void DisplayBmTile(u16* bg, int xOut, int yOut, int xMap, int yMap);
void nullsub_8(void);
void DisplayMovementViewTile(u16* out, int xMap, int yMap, int xOut, int yOut);
void RenderBmMap(void);
void RenderBmMapOnBg2(void);
void UpdateBmMapDisplay(void);
void RefreshEntityBmMaps(void);
char* GetTerrainName(int terrainId);
int GetTerrainHealAmount(int terrainId);
int GetTerrainUnk(int terrainId);
void sub_801A278(void);
void RevertMapChange(int id);

extern struct Vec2 gBmMapSize;
extern u8** gBmMapUnit;
extern u8** gBmMapTerrain;
extern u8** gBmMapMovement;
extern u8** gBmMapRange;
extern u8** gBmMapFog;
extern u8** gBmMapHidden;
extern u8** gBmMapUnk;

extern u8*   gTilesetTerrainLookup;
extern u16** gBmMapBaseTiles;

#endif // GUARD_BMMAP_H
