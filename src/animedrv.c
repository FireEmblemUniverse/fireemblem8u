#include "global.h"

struct AnimationInterpreter
{
    /* 00 */ u16 state;
    /* 02 */ short xPosition;
    /* 04 */ short yPosition;
    /* 06 */ short delayTimer;
    /* 08 */ u16 oam2base;
    /* 0A */ u16 drawLayerPriority;
    /* 0C */ u16 state2;
    /* 0E */ u16 nextRoundId;
    /* 10 */ u16 state3;
    /* 12 */ u8 currentRoundType;
    /* 13 */ u8 frameIndex;

    /* 14 */ u8 queuedCommandCount;
    /* 15 */ u8 commandQueue[7];

    /* 1C */ u32 oamBase;

    /* 20 */ const u32* pCurrentFrame;
    /* 24 */ const u32* pStartFrame;
    /* 28 */ const void* pUnk28;
    /* 2C */ const void* pUnk2C;
    /* 30 */ const void* pStartObjData; // aka "OAM data"

    /* 34 */ struct AnimationInterpreter* pPrev;
    /* 38 */ struct AnimationInterpreter* pNext;

    /* 3C */ const void* pUnk3C;
    /* 40 */ const void* pUnk40;
    /* 44 */ const void* pUnk44;
};

struct AnimSpriteData
{
    /* 00 */ u32 header;

    union
    {

    struct
    {
        /* 04 */ u16 pa;
        /* 06 */ u16 pb;
        /* 08 */ u16 pc;
        /* 0A */ u16 pd;
    } affine;

    struct
    {
        /* 04 */ u16 oam2;
        /* 06 */ short x;
        /* 08 */ short y;
    } object;

    } as;
};

enum
{
    ANIM_BIT_0 = (1 << 0),
    ANIM_BIT_1 = (1 << 1),
    ANIM_BIT_2 = (1 << 2),
    ANIM_BIT_3 = (1 << 3),
    ANIM_BIT_4 = (1 << 4),
};

enum
{
    ANIM_MAX_COUNT = 50,
};

#define ANIM_IS_DISABLED(ais) ((ais)->state == 0)

void AIS_ExecAll(void);
void ClearAISArray(void);
struct AnimationInterpreter* sub_8004EE8(const void* frameData);
struct AnimationInterpreter* AIS_New(const void* frameData, u16 displayPriority);
void AISArray_Sort(void);
void AIS_Free(struct AnimationInterpreter* anim);
void AIS_Display(struct AnimationInterpreter* anim);
int HandleNextAISFrame(struct AnimationInterpreter* anim);
void LinkAIS(struct AnimationInterpreter* anim);
void _AIS_Display(struct AnimationInterpreter* anim);
void sub_8005334(struct AnimationInterpreter* anim, u32 instruction);

EWRAM_DATA static struct AnimationInterpreter gUnknown_02028F78[ANIM_MAX_COUNT] = {};
EWRAM_DATA static struct AnimationInterpreter* gUnknown_02029D88 = NULL;

void AIS_ExecAll(void)
{
    struct AnimationInterpreter* it;
    int boolNeedsSort = FALSE;

    if (!gUnknown_02029D88)
        return;

    for (it = gUnknown_02029D88;; it = it->pNext)
    {
        if (ANIM_IS_DISABLED(it))
            continue;

        if (!(it->state & ANIM_BIT_3))
        {
            if (it->delayTimer == 0 || --it->delayTimer == 0)
            {
                do
                {
                    if (HandleNextAISFrame(it) == TRUE)
                        boolNeedsSort = TRUE;
                }
                while (it->delayTimer == 0);
            }

            if (ANIM_IS_DISABLED(it))
                continue;
        }

        if (!(it->state & ANIM_BIT_1))
            _AIS_Display(it);

        if (!it->pNext)
            break;
    }

    if (boolNeedsSort == TRUE)
        AISArray_Sort();
}

void ClearAISArray(void)
{
    struct AnimationInterpreter* it;

    for (it = gUnknown_02028F78; it < gUnknown_02028F78 + ANIM_MAX_COUNT; ++it)
    {
        it->state = 0;
        it->pPrev = NULL;
        it->pNext = NULL;
    }

    gUnknown_02029D88 = NULL;
}

struct AnimationInterpreter* sub_8004EE8(const void* frameData)
{
    struct AnimationInterpreter* anim;

    // Find anim slot for new anim
    for (anim = gUnknown_02028F78; (anim < gUnknown_02028F78 + ANIM_MAX_COUNT) && !ANIM_IS_DISABLED(anim); ++anim) {}

    // return null if no anim slot was found
    if (anim == gUnknown_02028F78 + ANIM_MAX_COUNT)
        return NULL;

    anim->state = ANIM_BIT_0;

    anim->pCurrentFrame = frameData;
    anim->pStartFrame = frameData;

    anim->delayTimer = 0;
    anim->oam2base = 0;
    anim->drawLayerPriority = 0;
    anim->state2 = 0;
    anim->state3 = 0;
    anim->oamBase = 0;

    anim->queuedCommandCount = 0;

    anim->pUnk2C = NULL;
    anim->pStartObjData = NULL;
    anim->pUnk40 = NULL;
    anim->pUnk44 = NULL;

    LinkAIS(anim);

    return anim;
}

struct AnimationInterpreter* AIS_New(const void* frameData, u16 displayPriority)
{
    struct AnimationInterpreter* anim;

    // Find anim slot for new anim
    for (anim = gUnknown_02028F78; (anim < gUnknown_02028F78 + ANIM_MAX_COUNT) && !ANIM_IS_DISABLED(anim); ++anim) {}

    // return null if no anim slot was found
    if (anim == gUnknown_02028F78 + ANIM_MAX_COUNT)
        return NULL;

    anim->state = ANIM_BIT_0;

    anim->pCurrentFrame = frameData;
    anim->pStartFrame = frameData;

    anim->delayTimer = 0;
    anim->oam2base = 0;
    anim->drawLayerPriority = displayPriority;
    anim->state2 = 0;
    anim->state3 = 0;
    anim->oamBase = 0;

    anim->queuedCommandCount = 0;

    anim->pUnk2C = NULL;
    anim->pStartObjData = NULL;
    anim->pUnk40 = NULL;
    anim->pUnk44 = NULL;

    LinkAIS(anim);

    return anim;
}

void AISArray_Sort(void)
{
    struct AnimationInterpreter* anim;

    for (anim = gUnknown_02028F78; anim < gUnknown_02028F78 + ANIM_MAX_COUNT; ++anim)
    {
        if (ANIM_IS_DISABLED(anim))
            continue;

        anim->pPrev = NULL;
        anim->pNext = NULL;
    }

    gUnknown_02029D88 = NULL;

    for (anim = gUnknown_02028F78; anim < gUnknown_02028F78 + ANIM_MAX_COUNT; ++anim)
    {
        if (ANIM_IS_DISABLED(anim))
            continue;

        LinkAIS(anim);
    }
}

void AIS_Free(struct AnimationInterpreter* anim)
{
    if (anim->pPrev == NULL)
    {
        gUnknown_02029D88 = anim->pNext;
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

void AIS_Display(struct AnimationInterpreter* anim)
{
    _AIS_Display(anim);
}

int HandleNextAISFrame(struct AnimationInterpreter* anim)
{
    // TODO: clean anim mess up

    int boolNeedsResort = FALSE;

    u32 instruction = *anim->pCurrentFrame++;

    if (instruction & 0x80000000)
    {
        if (instruction & 0x40000000)
        {
            switch (0x3 & (instruction >> 28))
            {

            case 0: // function call
            {
                void(*func)(struct AnimationInterpreter* anim) =
                    (void(*)(struct AnimationInterpreter* anim)) (instruction &~ 0xF0000000);

                func(anim);
                break;
            }

            case 1: // set new frame data
            {
                const void* frame =
                    (const void*) (instruction &~ 0xF0000000);

                anim->pStartFrame = frame;
                anim->pCurrentFrame = frame;
                anim->delayTimer = 1;

                break;
            }

            } // switch (0x3 & (instruction >> 28))
        }
        else
        {
            switch (0x3F & (instruction >> 24))
            {

            case 0:
                anim->pCurrentFrame--;
                anim->delayTimer = 1;

                anim->state2 = (anim->state2 & 0xFFF) | 0x4000;

                break;

            case 1:
                anim->state = 0;
                anim->delayTimer = 1;

                boolNeedsResort = TRUE;

                break;

            case 2:
                anim->pCurrentFrame = anim->pStartFrame;
                anim->delayTimer = 1;

                break;

            case 4:
                anim->delayTimer = instruction;
                break;

            case 3:
                anim->xPosition += ((int) (instruction << 24)) >> 24;
                anim->yPosition += ((int) (instruction << 16)) >> 24;
                anim->delayTimer = (instruction >> 16) & 0xFF;

                break;

            case 5:
                anim->state2 = (anim->state2 & 0xFFF) | 0x1000;

                anim->commandQueue[anim->queuedCommandCount] = instruction;
                anim->queuedCommandCount++;

                anim->delayTimer = 1;

                switch (instruction & 0xFF)
                {

                    // TODO: BATTLE ANIMATION COMMAND DEFINITIONS

                case 1:
                case 2:
                case 3:
                case 4:
                case 5:
                case 0x13:
                case 0x18:
                case 0x2D:
                case 0x39:
                case 0x52:
                    anim->pCurrentFrame--;
                    break;

                } // switch (instruction & 0xFF)

                break;

            case 6:
                anim->delayTimer = instruction;
                anim->frameIndex = instruction >> 16;

                anim->pUnk28 = (const void*) (*anim->pCurrentFrame++);

                // ???????
                anim->pUnk3C = (const void*) (*anim->pCurrentFrame++);
                anim->pUnk3C += (unsigned) anim->pStartObjData;

                anim->state2 = (anim->state2 & 0xFFF) | 0x2000;

                break;

            } // switch (0x3F & (instruction >> 24))
        }
    }
    else
    {
        anim->pUnk3C     = (const void*) (instruction &~ 0xF0000003);
        anim->delayTimer = ((instruction >> 26) & 0x1C) + (instruction & 3);
    }

    return boolNeedsResort;
}

void LinkAIS(struct AnimationInterpreter* anim)
{
    struct AnimationInterpreter* it = gUnknown_02029D88;

    if (!gUnknown_02029D88)
    {
        gUnknown_02029D88 = anim;
        return;
    }

    for (;;)
    {
        if (anim->drawLayerPriority > it->drawLayerPriority)
        {
            struct AnimationInterpreter* prev = it->pPrev;

            anim->pPrev = it->pPrev;
            anim->pNext = it;
            it->pPrev = anim;

            if (!anim->pPrev)
                gUnknown_02029D88 = anim;
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

void _AIS_Display(struct AnimationInterpreter* anim)
{
    unsigned baseAffineId = gUnknown_0300312C;

    const struct AnimSpriteData* oamData = anim->pUnk3C;
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
        *(u16*)(gUnknown_03003744++) = (it->as.object.oam2 & 0xF3FF) + anim->oam2base;
    }
}

void sub_8005334(struct AnimationInterpreter* anim, u32 instruction)
{
    switch (instruction & 0xFF)
    {

        // TODO: BATTLE ANIMATION COMMAND DEFINITIONS

    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 0x13:
    case 0x18:
    case 0x2D:
    case 0x39:
    case 0x52:
        anim->pCurrentFrame--;
        break;

    } // switch (instruction & 0xFF)
}
