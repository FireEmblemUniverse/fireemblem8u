#include "global.h"

#include "hardware.h"

#include "anime.h"

static int  AnimInterpret(struct Anim* anim);
static void AnimInsert(struct Anim* anim);
static void AnimDisplayPrivate(struct Anim* anim);
static void Anim_8005334(struct Anim* anim, u32 instruction);

#define ANINS_IS_NOT_FORCESPRITE(instruction) ((instruction) & 0x80000000)
#define ANINS_IS_PTRINS(instruction) ((instruction) & 0x40000000)

#define ANINS_FORCESPRITE_GET_ADDRESS(instruction) ((void*) ((instruction) &~ 0xF0000003))
#define ANINS_FORCESPRITE_GET_DELAY(instruction) ((((instruction) >> 26) & 0x1C) + ((instruction) & 3))

#define ANINS_PTRINS_GET_TYPE(instruction) (0x3 & ((instruction) >> 28))
#define ANINS_PTRINS_GET_ADDRESS(instruction) ((void*) ((instruction) &~ 0xF0000000))

#define ANINS_GET_TYPE(instruction) (0x3F & ((instruction) >> 24))

#define ANINS_WAIT_GET_DELAY(instruction) ((instruction) & 0xFFFF)

#define ANINS_MOVE_GET_XOFF(instruction) (((int) ((instruction) << 24)) >> 24)
#define ANINS_MOVE_GET_YOFF(instruction) (((int) ((instruction) << 16)) >> 24)
#define ANINS_MOVE_GET_DELAY(instruction) (((instruction) >> 16) & 0xFF)

#define ANINS_COMMAND_GET_ID(instruction) (0xFF & (instruction))

#define ANINS_FRAME_GET_DELAY(instruction) ((instruction) & 0xFFFF)
#define ANINS_FRAME_GET_UNK(instruction) ((instruction) >> 16) & 0xFF

enum
{
    ANIM_INS_TYPE_STOP    = 0,
    ANIM_INS_TYPE_END     = 1,
    ANIM_INS_TYPE_LOOP    = 2,
    ANIM_INS_TYPE_MOVE    = 3,
    ANIM_INS_TYPE_WAIT    = 4,
    ANIM_INS_TYPE_COMMAND = 5,
    ANIM_INS_TYPE_FRAME   = 6,
};

typedef void (*AnimCallback_t) (struct Anim* anim);

EWRAM_DATA static struct Anim sAnimPool[ANIM_MAX_COUNT] = {};
EWRAM_DATA static struct Anim* sFirstAnim = NULL;

void AnimUpdateAll(void)
{
    struct Anim* anim;
    int boolNeedsSort = FALSE;

    if (!sFirstAnim)
        return;

    for (anim = sFirstAnim;; anim = anim->pNext)
    {
        if (ANIM_IS_DISABLED(anim))
            continue;

        if (!(anim->state & ANIM_BIT_FROZEN))
        {
            if (anim->timer == 0 || --anim->timer == 0)
            {
                do
                {
                    if (AnimInterpret(anim) == TRUE)
                        boolNeedsSort = TRUE;
                }
                while (anim->timer == 0);
            }

            if (ANIM_IS_DISABLED(anim))
                continue;
        }

        if (!(anim->state & ANIM_BIT_HIDDEN))
            AnimDisplayPrivate(anim);

        if (!anim->pNext)
            break;
    }

    if (boolNeedsSort == TRUE)
        AnimSort();
}

void AnimClearAll(void)
{
    struct Anim* it;

    for (it = sAnimPool; it < sAnimPool + ANIM_MAX_COUNT; ++it)
    {
        it->state = 0;
        it->pPrev = NULL;
        it->pNext = NULL;
    }

    sFirstAnim = NULL;
}

struct Anim* AnimCreate_unused(const void* frameData)
{
    struct Anim* anim;

    // Find anim slot for new anim
    for (anim = sAnimPool; (anim < sAnimPool + ANIM_MAX_COUNT) && !ANIM_IS_DISABLED(anim); ++anim) {}

    // return null if no anim slot was found
    if (anim == sAnimPool + ANIM_MAX_COUNT)
        return NULL;

    anim->state = ANIM_BIT_ENABLED;

    anim->pScrCurrent = frameData;
    anim->pScrStart = frameData;

    anim->timer = 0;
    anim->oam2Base = 0;
    anim->drawLayerPriority = 0;
    anim->state2 = 0;
    anim->state3 = 0;
    anim->oamBase = 0;

    anim->commandQueueSize = 0;

    anim->pUnk2C = NULL;
    anim->pSpriteDataPool = NULL;
    anim->pUnk40 = NULL;
    anim->pUnk44 = NULL;

    AnimInsert(anim);

    return anim;
}

struct Anim* AnimCreate(const void* frameData, u16 displayPriority)
{
    struct Anim* anim;

    // Find anim slot for new anim
    for (anim = sAnimPool; (anim < sAnimPool + ANIM_MAX_COUNT) && !ANIM_IS_DISABLED(anim); ++anim) {}

    // return null if no anim slot was found
    if (anim == sAnimPool + ANIM_MAX_COUNT)
        return NULL;

    anim->state = ANIM_BIT_ENABLED;

    anim->pScrCurrent = frameData;
    anim->pScrStart = frameData;

    anim->timer = 0;
    anim->oam2Base = 0;
    anim->drawLayerPriority = displayPriority;
    anim->state2 = 0;
    anim->state3 = 0;
    anim->oamBase = 0;

    anim->commandQueueSize = 0;

    anim->pUnk2C = NULL;
    anim->pSpriteDataPool = NULL;
    anim->pUnk40 = NULL;
    anim->pUnk44 = NULL;

    AnimInsert(anim);

    return anim;
}

void AnimSort(void)
{
    struct Anim* anim;

    for (anim = sAnimPool; anim < sAnimPool + ANIM_MAX_COUNT; ++anim)
    {
        if (ANIM_IS_DISABLED(anim))
            continue;

        anim->pPrev = NULL;
        anim->pNext = NULL;
    }

    sFirstAnim = NULL;

    for (anim = sAnimPool; anim < sAnimPool + ANIM_MAX_COUNT; ++anim)
    {
        if (ANIM_IS_DISABLED(anim))
            continue;

        AnimInsert(anim);
    }
}

void AnimDelete(struct Anim* anim)
{
    if (anim->pPrev == NULL)
    {
        sFirstAnim = anim->pNext;
        anim->pNext->pPrev = NULL;
    }
    else
    {
        anim->pPrev->pNext = anim->pNext;
        anim->pNext->pPrev = anim->pPrev;
    }

    anim->state = 0;
    anim->pPrev = NULL;
    anim->pNext = NULL;
}

void AnimDisplay(struct Anim* anim)
{
    AnimDisplayPrivate(anim);
}

int AnimInterpret(struct Anim* anim)
{
    int boolNeedsResort = FALSE;

    u32 instruction = *anim->pScrCurrent++;

    if (ANINS_IS_NOT_FORCESPRITE(instruction))
    {
        if (ANINS_IS_PTRINS(instruction))
        {
            switch (ANINS_PTRINS_GET_TYPE(instruction))
            {

            case 0: // function call
                ((AnimCallback_t) (ANINS_PTRINS_GET_ADDRESS(instruction)))(anim);
                break;

            case 1: // set new frame data
                anim->pScrStart   = ANINS_PTRINS_GET_ADDRESS(instruction);
                anim->pScrCurrent = ANINS_PTRINS_GET_ADDRESS(instruction);

                anim->timer = 1;

                break;

            } // switch (ANINS_PTRINS_GET_TYPE(instruction))
        }
        else
        {
            switch (ANINS_GET_TYPE(instruction))
            {

            case ANIM_INS_TYPE_STOP:
                anim->pScrCurrent--;
                anim->timer = 1;

                anim->state2 = (anim->state2 & 0xFFF) | 0x4000;

                break;

            case ANIM_INS_TYPE_END:
                anim->state = 0;
                anim->timer = 1;

                boolNeedsResort = TRUE;

                break;

            case ANIM_INS_TYPE_LOOP:
                anim->pScrCurrent = anim->pScrStart;
                anim->timer = 1;

                break;

            case ANIM_INS_TYPE_WAIT:
                anim->timer = ANINS_WAIT_GET_DELAY(instruction);
                break;

            case ANIM_INS_TYPE_MOVE:
                anim->xPosition += ANINS_MOVE_GET_XOFF(instruction);
                anim->yPosition += ANINS_MOVE_GET_YOFF(instruction);

                anim->timer = ANINS_MOVE_GET_DELAY(instruction);

                break;

            case ANIM_INS_TYPE_COMMAND:
                anim->state2 = (anim->state2 & 0xFFF) | 0x1000;

                anim->commandQueue[anim->commandQueueSize] = ANINS_COMMAND_GET_ID(instruction);
                anim->commandQueueSize++;

                anim->timer = 1;

                switch (ANINS_COMMAND_GET_ID(instruction))
                {

                case ANIM_CMD_WAIT_01:
                case ANIM_CMD_WAIT_02:
                case ANIM_CMD_WAIT_03:
                case ANIM_CMD_WAIT_04:
                case ANIM_CMD_WAIT_05:
                case ANIM_CMD_WAIT_13:
                case ANIM_CMD_WAIT_18:
                case ANIM_CMD_WAIT_2D:
                case ANIM_CMD_WAIT_39:
                case ANIM_CMD_WAIT_52:
                    anim->pScrCurrent--;
                    break;

                } // switch (ANINS_COMMAND_GET_ID(instruction))

                break;

            case ANIM_INS_TYPE_FRAME:
                anim->timer = ANINS_FRAME_GET_DELAY(instruction);
                anim->unk13 = ANINS_FRAME_GET_UNK(instruction);

                anim->pImgSheet = (const void*) (*anim->pScrCurrent++);

                // ???????
                anim->pSpriteData = (const void*) (*anim->pScrCurrent++);
                anim->pSpriteData += (unsigned) anim->pSpriteDataPool;

                anim->state2 = (anim->state2 & 0xFFF) | 0x2000;

                break;

            } // switch (0x3F & (instruction >> 24))
        }
    }
    else
    {
        anim->pSpriteData = ANINS_FORCESPRITE_GET_ADDRESS(instruction);
        anim->timer       = ANINS_FORCESPRITE_GET_DELAY(instruction);
    }

    return boolNeedsResort;
}

void AnimInsert(struct Anim* anim)
{
    struct Anim* it = sFirstAnim;

    if (!sFirstAnim)
    {
        sFirstAnim = anim;
        return;
    }

    for (;;)
    {
        if (anim->drawLayerPriority > it->drawLayerPriority)
        {
            struct Anim* prev = it->pPrev;

            anim->pPrev = it->pPrev;
            anim->pNext = it;
            it->pPrev = anim;

            if (!anim->pPrev)
                sFirstAnim = anim;
            else
                prev->pNext = anim;

            break;
        }

        if (!it->pNext)
        {
            anim->pNext = it->pNext;
            anim->pPrev = it;
            it->pNext = anim;

            return;
        }

        it = it->pNext;
    }
}

void AnimDisplayPrivate(struct Anim* anim)
{
    unsigned baseAffineId = gUnknown_0300312C;

    const struct AnimSpriteData* oamData = anim->pSpriteData;
    const struct AnimSpriteData* it;

    int i;
    int x, y;

    if (!oamData)
        return;

    if ((oamData->header &~ 0xFFFF) == 0xFFFF0000)
    {
        for (i = oamData->header & 0xFFFF; i != 0; gUnknown_0300312C++, --i, oamData++)
        {
            gUnknown_03004158[3] = oamData->as.affine.pa;
            gUnknown_03004158 += 4;

            gUnknown_03004158[3] = oamData->as.affine.pb;
            gUnknown_03004158 += 4;

            gUnknown_03004158[3] = oamData->as.affine.pc;
            gUnknown_03004158 += 4;

            gUnknown_03004158[3] = oamData->as.affine.pd;
            gUnknown_03004158 += 4;
        }
    }

    for (it = oamData; it->header != 1 && gUnknown_03003744 < (u32*) (gUnknown_03003140) + 0x100; ++it)
    {
        x = it->as.object.x + anim->xPosition;
        y = it->as.object.y + anim->yPosition;

        if (x > 0x100)
            x = 0x180;
        else if (x < -0x40)
            x = 0x180;

        if (y > 0x0A0)
            x = 0x180;
        else if (y < -0x40)
            x = 0x180;

        x = x & 0x1FF;
        y = y & 0x0FF;

        i = 0;

        if (it->header & 0x100)
            i = (baseAffineId << 25);

        i = i + anim->oamBase;

        // ugh
        *gUnknown_03003744++ = (it->header + i) | (x << 16) | (y);
        *(u16*)(gUnknown_03003744++) = (it->as.object.oam2 & 0xF3FF) + anim->oam2Base;
    }
}

void Anim_8005334(struct Anim* anim, u32 instruction)
{
    switch (ANINS_COMMAND_GET_ID(instruction))
    {

    case ANIM_CMD_WAIT_01:
    case ANIM_CMD_WAIT_02:
    case ANIM_CMD_WAIT_03:
    case ANIM_CMD_WAIT_04:
    case ANIM_CMD_WAIT_05:
    case ANIM_CMD_WAIT_13:
    case ANIM_CMD_WAIT_18:
    case ANIM_CMD_WAIT_2D:
    case ANIM_CMD_WAIT_39:
    case ANIM_CMD_WAIT_52:
        anim->pScrCurrent--;
        break;

    } // switch (ANINS_COMMAND_GET_ID(instruction))
}
