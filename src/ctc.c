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
    /* 54 */ const u16* object;
};

static void SpriteRefresher_OnIdle(struct SpriteProc* proc);

u16 CONST_DATA gObject_8x8[] =
{
    1, OAM0_SHAPE_8x8, OAM1_SIZE_8x8, 0,
};

u16 CONST_DATA gObject_16x16[] =
{
    1, OAM0_SHAPE_16x16, OAM1_SIZE_16x16, 0,
};

u16 CONST_DATA gObject_32x32[] =
{
    1, OAM0_SHAPE_32x32, OAM1_SIZE_32x32, 0,
};

u16 CONST_DATA gObject_64x64[] =
{
    1, OAM0_SHAPE_64x64, OAM1_SIZE_64x64, 0,
};

u16 CONST_DATA gObject_8x16[] =
{
    1, OAM0_SHAPE_8x16, OAM1_SIZE_8x16, 0,
};

u16 CONST_DATA gObject_16x32[] =
{
    1, OAM0_SHAPE_16x32, OAM1_SIZE_16x32, 0,
};

u16 CONST_DATA gObject_32x64[] =
{
    1, OAM0_SHAPE_32x64, OAM1_SIZE_32x64, 0,
};

u16 CONST_DATA gObject_16x8[] =
{
    1, OAM0_SHAPE_16x8, OAM1_SIZE_16x8, 0,
};

u16 CONST_DATA gObject_16x8_VFlipped[] =
{
    1, OAM0_SHAPE_16x8, OAM1_SIZE_16x8 + OAM1_VFLIP, 0,
};

u16 CONST_DATA gObject_32x16[] =
{
    1, OAM0_SHAPE_32x16, OAM1_SIZE_32x16, 0,
};

u16 CONST_DATA gObject_64x32[] =
{
    1, OAM0_SHAPE_64x32, OAM1_SIZE_64x32, 0,
};

u16 CONST_DATA gObject_32x8[] =
{
    1, OAM0_SHAPE_32x8, OAM1_SIZE_32x8, 0,
};

u16 CONST_DATA gObject_8x32[] =
{
    1, OAM0_SHAPE_8x32, OAM1_SIZE_8x32, 0,
};

u16 CONST_DATA gObject_32x8_VFlipped[] =
{
    1, OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_VFLIP, 0,
};

u16 CONST_DATA gObject_8x16_HFlipped[] =
{
    1, OAM0_SHAPE_8x16, OAM1_SIZE_8x16 + OAM1_HFLIP, 0,
};

u16 CONST_DATA gObject_8x8_HFlipped[] =
{
    1, OAM0_SHAPE_8x8, OAM1_SIZE_8x8 + OAM1_HFLIP, 0,
};

u16 CONST_DATA gObject_8x8_VFlipped[] =
{
    1, OAM0_SHAPE_8x8, OAM1_SIZE_8x8 + OAM1_VFLIP, 0,
};

u16 CONST_DATA gObject_8x8_HFlipped_VFlipped[] =
{
    1, OAM0_SHAPE_8x8, OAM1_SIZE_8x8 + OAM1_HFLIP + OAM1_VFLIP, 0,
};

u16 CONST_DATA gObject_16x16_VFlipped[] =
{
    1, OAM0_SHAPE_16x16, OAM1_SIZE_16x16 + OAM1_VFLIP, 0,
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
    gUnknown_03003140[id*0x10 + 0x03] = pa;
    gUnknown_03003140[id*0x10 + 0x07] = pb;
    gUnknown_03003140[id*0x10 + 0x0B] = pc;
    gUnknown_03003140[id*0x10 + 0x0F] = pd;
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
