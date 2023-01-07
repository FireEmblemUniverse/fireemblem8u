#include "global.h"
#include "types.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "variables.h"
#include "chapterdata.h"
#include "hardware.h"
#include "bmudisp.h"

s8 CanUnitCrossTerrain(struct Unit* unit, int terrain);

void UpdateMapViewWithFog(int vision_range)
{
    if (vision_range < 0)
        vision_range = GetROMChapterStruct(gRAMChapterData.chapterIndex)->initialFogLevel;

    RenderBmMapOnBg2();
    gRAMChapterData.chapterVisionRange = vision_range;
    RefreshEntityBmMaps();
    RefreshUnitSprites();
    RenderBmMap();
    NewBMXFADE(1);
}

void FastUpdateMapViewWithFog(int vision_range)
{
    if (vision_range < 0)
        vision_range = GetROMChapterStruct(gRAMChapterData.chapterIndex)->initialFogLevel;

    gRAMChapterData.chapterVisionRange = vision_range;
    RefreshEntityBmMaps();
    RefreshUnitSprites();
    RenderBmMap();
}

void FillWarpRangeMap(struct Unit *unit_act, struct Unit *unit_tar) {
    int x, y;

    BmMapFill(gBmMapMovement, -1);
    BmMapFill(gBmMapRange, 0);
    SetWorkingBmMap(gBmMapMovement);

    x = unit_tar->xPos;
    y = unit_tar->yPos;
    MapAddInBoundedRange(x, y, 1, GetUnitMagBy2Range(unit_act));

    if (0 == gRAMChapterData.chapterVisionRange) {
        for (y = gBmMapSize.y - 1; y >= 0; y--) {
            for (x = gBmMapSize.x - 1; x >= 0; x--) {
                if (gBmMapMovement[y][x] > 0x78)
                    continue;
                
                if (CanUnitCrossTerrain(unit_tar, gBmMapTerrain[y][x]) &&
                    0 == gBmMapUnit[y][x])
                    continue;
                    
                ((s8**)gBmMapMovement)[y][x] = -1;
            }
        }
    } else {
        for (y = gBmMapSize.y - 1; y >= 0; y--) {
            for (x = gBmMapSize.x - 1; x >= 0; x--) {
                if (gBmMapMovement[y][x] > 0x78)
                    continue;
                
                if (CanUnitCrossTerrain(unit_tar, gBmMapTerrain[y][x]) &&
                    0 == gBmMapUnit[y][x] &&
                    0 != gBmMapFog[y][x])
                    continue;

                ((s8**)gBmMapMovement)[y][x] = -1;
            }
        }
    }
    ((s8**)gBmMapMovement)[unit_act->yPos][unit_act->xPos] = -1;
}
