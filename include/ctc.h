#ifndef GUARD_CTC_H
#define GUARD_CTC_H

#include "global.h"

#define OAM0_Y(ay)         ((ay) & 0x00FF)
#define OAM0_AFFINE_ENABLE 0x0100
#define OAM0_DOUBLESIZE    0x0200
#define OAM0_DISABLE       0x0200
#define OAM0_BLEND         0x0400
#define OAM0_WINDOW        0x0800
#define OAM0_MOSAIC        0x1000
#define OAM0_256COLORS     0x2000
#define OAM0_SHAPE_8x8     0x0000
#define OAM0_SHAPE_16x16   0x0000
#define OAM0_SHAPE_32x32   0x0000
#define OAM0_SHAPE_64x64   0x0000
#define OAM0_SHAPE_16x8    0x4000
#define OAM0_SHAPE_32x8    0x4000
#define OAM0_SHAPE_32x16   0x4000
#define OAM0_SHAPE_64x32   0x4000
#define OAM0_SHAPE_8x16    0x8000
#define OAM0_SHAPE_8x32    0x8000
#define OAM0_SHAPE_16x32   0x8000
#define OAM0_SHAPE_32x64   0x8000

#define OAM1_X(ax)         ((ax) & 0x01FF)
#define OAM1_AFFINE_ID(ai) (((ai) << 9) & 0x3E00)
#define OAM1_HFLIP         0x1000
#define OAM1_VFLIP         0x2000
#define OAM1_SIZE_8x8      0x0000
#define OAM1_SIZE_16x8     0x0000
#define OAM1_SIZE_8x16     0x0000
#define OAM1_SIZE_16x16    0x4000
#define OAM1_SIZE_32x8     0x4000
#define OAM1_SIZE_8x32     0x4000
#define OAM1_SIZE_32x32    0x8000
#define OAM1_SIZE_32x16    0x8000
#define OAM1_SIZE_16x32    0x8000
#define OAM1_SIZE_64x64    0xC000
#define OAM1_SIZE_64x32    0xC000
#define OAM1_SIZE_32x64    0xC000

#define OAM2_CHR(ac)       ((ac) & 0x3FF)
#define OAM2_LAYER(al)     (((al) & 0x3) << 10) // #define OAM2_LAYER(al) (((al) << 10) & 0x0C00)
#define OAM2_PAL(ap)       (((ap) & 0xF) << 12) // #define OAM2_PAL(ap)   (((ap) << 12) & 0xF000)

struct oam2_data {
    u16 chr : 0xA;
    u16 layer : 0x2;
    u16 pal : 0x4;
};

extern u16 CONST_DATA gObject_8x8[];
extern u16 CONST_DATA gObject_16x16[];
extern u16 CONST_DATA gObject_32x32[];
extern u16 CONST_DATA gObject_64x64[]; // Unused
extern u16 CONST_DATA gObject_8x16[];
extern u16 CONST_DATA gObject_16x32[];
extern u16 CONST_DATA gObject_32x64[]; // Unused
extern u16 CONST_DATA gObject_16x8[];
extern u16 CONST_DATA gObject_16x8_VFlipped[]; // Unused
extern u16 CONST_DATA gObject_32x16[];
extern u16 CONST_DATA gObject_64x32[];
extern u16 CONST_DATA gObject_32x8[];
extern u16 CONST_DATA gObject_8x32[];
extern u16 CONST_DATA gObject_32x8_VFlipped[]; // Unused
extern u16 CONST_DATA gObject_8x16_HFlipped[];
extern u16 CONST_DATA gObject_8x8_HFlipped[];
extern u16 CONST_DATA gObject_8x8_VFlipped[]; // Unused
extern u16 CONST_DATA gObject_8x8_HFlipped_VFlipped[]; // Unused
extern u16 CONST_DATA gObject_16x16_VFlipped[];

void PutObjectAffine(int id, int pa, int pb, int pc, int pd);
void ClearSprites(void);
void PutSprite(int layer, int x, int y, const u16* object, int oam2);
void PutSpriteExt(int layer, int xOam1, int yOam0, const u16* object, int oam2);
void PushSpriteLayerObjects(int layer);

struct SpriteProc* StartSpriteRefresher(ProcPtr parent, int layer, int x, int y, const u16* object, int tileref);
void MoveSpriteRefresher(struct SpriteProc* proc, int x, int y);

#endif  // GUARD_CTC_H
