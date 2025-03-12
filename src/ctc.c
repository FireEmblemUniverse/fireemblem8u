#include "global.h"
#include "proc.h"
#include "ctc.h"

struct SpriteEntry
{
    /* 00 */ struct SpriteEntry* next;
    /* 04 */ s16 oam1;
    /* 06 */ s16 oam0;
    /* 08 */ u16 oam2;
    /* 0A */ // pad
    /* 0C */ const u16* object;
};

struct SpriteProc
{
    PROC_HEADER;

    /* 2C */ u32 x;
    /* 30 */ u32 y;
    /* 34 */ u8 pad34[0x50 - 0x34];
    /* 50 */ s16 layer;
    /* 52 */ u16 tileref;
    /* 54 */ const u16 * object;
};

static void SpriteRefresher_OnIdle(struct SpriteProc* proc);

struct SpriteCfg CONST_DATA gObject_8x8 = {
  .count = 1,
  {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = 0,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_SQUARE,
    .x = 0,
    .matrixNum = 0,
    .size = ST_OAM_SQ_8x8,
    .tileNum = 0x0,
    .priority = 0,
    .paletteNum = 0,
  },
};

struct SpriteCfg CONST_DATA gObject_16x16 = {
  .count = 1,
  {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = 0,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_SQUARE,
    .x = 0,
    .matrixNum = 0,
    .size = ST_OAM_SQ_16x16,
    .tileNum = 0x0,
    .priority = 0,
    .paletteNum = 0,
  },
};

struct SpriteCfg CONST_DATA gObject_32x32 = {
  .count = 1,
  {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = 0,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_SQUARE,
    .x = 0,
    .matrixNum = 0,
    .size = ST_OAM_SQ_32x32,
    .tileNum = 0x0,
    .priority = 0,
    .paletteNum = 0,
  },
};

struct SpriteCfg CONST_DATA gObject_64x64 = {
  .count = 1,
  {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = 0,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_SQUARE,
    .x = 0,
    .matrixNum = 0,
    .size = ST_OAM_SQ_64x64,
    .tileNum = 0x0,
    .priority = 0,
    .paletteNum = 0,
  },
};

struct SpriteCfg CONST_DATA gObject_8x16 = {
  .count = 1,
  {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = 0,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_V_RECTANGLE,
    .x = 0,
    .matrixNum = 0,
    .size = ST_OAM_V_8x16,
    .tileNum = 0x0,
    .priority = 0,
    .paletteNum = 0,
  },
};

struct SpriteCfg CONST_DATA gObject_16x32 = {
  .count = 1,
  {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = 0,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_V_RECTANGLE,
    .x = 0,
    .matrixNum = 0,
    .size = ST_OAM_V_16x32,
    .tileNum = 0x0,
    .priority = 0,
    .paletteNum = 0,
  },
};

struct SpriteCfg CONST_DATA gObject_32x64 = {
  .count = 1,
  {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = 0,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_V_RECTANGLE,
    .x = 0,
    .matrixNum = 0,
    .size = ST_OAM_V_32x64,
    .tileNum = 0x0,
    .priority = 0,
    .paletteNum = 0,
  },
};

struct SpriteCfg CONST_DATA gObject_16x8 = {
  .count = 1,
  {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = 0,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_H_RECTANGLE,
    .x = 0,
    .matrixNum = 0,
    .size = ST_OAM_H_16x8,
    .tileNum = 0x0,
    .priority = 0,
    .paletteNum = 0,
  },
};

struct SpriteCfg CONST_DATA gObject_16x8_VFlipped = {
  .count = 1,
  {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = 0,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_H_RECTANGLE,
    .x = 0,
    .matrixNum = 16,
    .size = ST_OAM_H_16x8,
    .tileNum = 0x0,
    .priority = 0,
    .paletteNum = 0,
  },
};

struct SpriteCfg CONST_DATA gObject_32x16 = {
  .count = 1,
  {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = 0,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_H_RECTANGLE,
    .x = 0,
    .matrixNum = 0,
    .size = ST_OAM_H_32x16,
    .tileNum = 0x0,
    .priority = 0,
    .paletteNum = 0,
  },
};

struct SpriteCfg CONST_DATA gObject_64x32 = {
  .count = 1,
  {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = 0,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_H_RECTANGLE,
    .x = 0,
    .matrixNum = 0,
    .size = ST_OAM_H_64x32,
    .tileNum = 0x0,
    .priority = 0,
    .paletteNum = 0,
  },
};

struct SpriteCfg CONST_DATA gObject_32x8 = {
  .count = 1,
  {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = 0,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_H_RECTANGLE,
    .x = 0,
    .matrixNum = 0,
    .size = ST_OAM_H_32x8,
    .tileNum = 0x0,
    .priority = 0,
    .paletteNum = 0,
  },
};

struct SpriteCfg CONST_DATA gObject_8x32 = {
  .count = 1,
  {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = 0,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_V_RECTANGLE,
    .x = 0,
    .matrixNum = 0,
    .size = ST_OAM_V_8x32,
    .tileNum = 0x0,
    .priority = 0,
    .paletteNum = 0,
  },
};

struct SpriteCfg CONST_DATA gObject_32x8_VFlipped = {
  .count = 1,
  {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = 0,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_H_RECTANGLE,
    .x = 0,
    .matrixNum = 16,
    .size = ST_OAM_H_32x8,
    .tileNum = 0x0,
    .priority = 0,
    .paletteNum = 0,
  },
};

struct SpriteCfg CONST_DATA gObject_8x16_HFlipped = {
  .count = 1,
  {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = 0,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_V_RECTANGLE,
    .x = 0,
    .matrixNum = 8,
    .size = ST_OAM_V_8x16,
    .tileNum = 0x0,
    .priority = 0,
    .paletteNum = 0,
  },
};

struct SpriteCfg CONST_DATA gObject_8x8_HFlipped = {
  .count = 1,
  {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = 0,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_SQUARE,
    .x = 0,
    .matrixNum = 8,
    .size = ST_OAM_SQ_8x8,
    .tileNum = 0x0,
    .priority = 0,
    .paletteNum = 0,
  },
};

struct SpriteCfg CONST_DATA gObject_8x8_VFlipped = {
  .count = 1,
  {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = 0,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_SQUARE,
    .x = 0,
    .matrixNum = 16,
    .size = ST_OAM_SQ_8x8,
    .tileNum = 0x0,
    .priority = 0,
    .paletteNum = 0,
  },
};

struct SpriteCfg CONST_DATA gObject_8x8_HFlipped_VFlipped = {
  .count = 1,
  {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = 0,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_SQUARE,
    .x = 0,
    .matrixNum = 24,
    .size = ST_OAM_SQ_8x8,
    .tileNum = 0x0,
    .priority = 0,
    .paletteNum = 0,
  },
};

struct SpriteCfg CONST_DATA gObject_16x16_VFlipped = {
  .count = 1,
  {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = 0,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_SQUARE,
    .x = 0,
    .matrixNum = 16,
    .size = ST_OAM_SQ_16x16,
    .tileNum = 0x0,
    .priority = 0,
    .paletteNum = 0,
  },
};


static struct ProcCmd CONST_DATA sProcSrc_SpriteRefresher[] =
{
    PROC_REPEAT(SpriteRefresher_OnIdle),
    PROC_END,
};

extern struct SpriteEntry* gSpriteAllocIt;

static struct SpriteEntry EWRAM_DATA sSpritePool[0x80] = {};
static struct SpriteEntry EWRAM_DATA sSpriteLayers[0x10] = {};

void PutObjectAffine(int id, int pa, int pb, int pc, int pd)
{
    gOam[id*0x10 + 0x03] = pa;
    gOam[id*0x10 + 0x07] = pb;
    gOam[id*0x10 + 0x0B] = pc;
    gOam[id*0x10 + 0x0F] = pd;
}

void ClearSprites(void)
{
    int i;

    for (i = 15; i >= 0; i--)
    {
        sSpriteLayers[i].next = &sSpriteLayers[i + 1];
        sSpriteLayers[i].object = NULL;
    }

    sSpriteLayers[15].next = NULL;
    sSpriteLayers[12].next = NULL;

    gSpriteAllocIt = sSpritePool;
}

void PutSprite(int layer, int x, int y, const u16* object, int oam2)
{
    gSpriteAllocIt->next = sSpriteLayers[layer].next;
    gSpriteAllocIt->oam1 = x & 0x1FF;
    gSpriteAllocIt->oam0 = y & 0xFF;
    gSpriteAllocIt->oam2 = oam2;
    gSpriteAllocIt->object = object;

    sSpriteLayers[layer].next = gSpriteAllocIt++;
}

void PutSpriteExt(int layer, int xOam1, int yOam0, const u16* object, int oam2)
{
    gSpriteAllocIt->next = sSpriteLayers[layer].next;
    gSpriteAllocIt->oam1 = xOam1;
    gSpriteAllocIt->oam0 = yOam0;
    gSpriteAllocIt->oam2 = oam2;
    gSpriteAllocIt->object = object;

    sSpriteLayers[layer].next = gSpriteAllocIt++;
}

void PushSpriteLayerObjects(int layer)
{
    struct SpriteEntry* it = sSpriteLayers + layer;

    while (it)
    {
        if (it->object)
            CallARM_PushToSecondaryOAM(it->oam1, it->oam0, it->object, it->oam2);

        it = it->next;
    }
}

void SpriteRefresher_OnIdle(struct SpriteProc* proc)
{
    PutSprite(proc->layer, proc->x, proc->y, proc->object, proc->tileref);
}

struct SpriteProc* StartSpriteRefresher(ProcPtr parent, int layer, int x, int y, const u16* object, int tileref)
{
    struct SpriteProc* proc;

    if (parent)
        proc = Proc_Start(sProcSrc_SpriteRefresher, parent);
    else
        proc = Proc_Start(sProcSrc_SpriteRefresher, PROC_TREE_3);

    proc->x = x;
    proc->y = y;
    proc->layer = layer;
    proc->object = object;
    proc->tileref = tileref;

    return proc;
}

void MoveSpriteRefresher(struct SpriteProc* proc, int x, int y)
{
    if (proc == NULL)
        proc = Proc_Find(sProcSrc_SpriteRefresher);

    proc->x = x;
    proc->y = y;
}
