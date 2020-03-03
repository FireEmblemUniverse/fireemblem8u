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

extern struct SpriteEntry* gSpriteAllocIt;

EWRAM_DATA
static struct SpriteEntry sSpritePool[0x80] = {};

EWRAM_DATA
static struct SpriteEntry sSpriteLayers[0x10] = {};

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

void sub_8005488(struct SpriteProc* proc)
{
    PutSprite(proc->layer, proc->x, proc->y, proc->object, proc->tileref);
}

struct SpriteProc* sub_80054B0(struct Proc* parent, int layer, int x, int y, const u16* object, int tileref)
{
    struct SpriteProc* proc;

    if (parent)
        proc = (struct SpriteProc*) Proc_Create(gUnknown_08590FDC, parent);
    else
        proc = (struct SpriteProc*) Proc_Create(gUnknown_08590FDC, ROOT_PROC_3);

    proc->x = x;
    proc->y = y;
    proc->layer = layer;
    proc->object = object;
    proc->tileref = tileref;

    return proc;
}

void sub_80054F4(struct SpriteProc* proc, int x, int y)
{
    if (proc == NULL)
        proc = (struct SpriteProc*) Proc_Find(gUnknown_08590FDC);

    proc->x = x;
    proc->y = y;
}
