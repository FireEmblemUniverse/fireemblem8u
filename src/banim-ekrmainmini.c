#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "banim_data.h"
#include "ctc.h"

struct BanimUnkStructCommPriv
{
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x32);

    /* 32 */ s16 unk32;

    /* 34 */ STRUCT_PAD(0x34, 0x3A);

    /* 3A */ s16 unk3A;

    /* 3C */ STRUCT_PAD(0x3C, 0x4C);

    /* 4C */ int unk4C;
};

struct ProcEkrUnitMainMini
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x5C);
    /* 5C */ void * unk_5C;
};

extern ProcPtr gpProcEfxAnimeDrv;

void ExecEfxop(struct Anim *);
void sub_805AE58(void *);

//! FE8U = 0x0805A3DC
void sub_805A3DC(struct AnimBuffer * pAnimBuf, struct Anim * anim)
{
    int _tmp;
    int r0;
#if NONMATCHING
    register int animState2 asm("r5");
#else
    int animState2;
#endif

    if (anim == NULL)
    {
        return;
    }

    _tmp = anim->state2;
    animState2 = _tmp & 0xf000;
    animState2 &= anim->state2;

    if (animState2 == 0)
    {
        return;
    }

    if (animState2 & 0x1000)
    {
    _loop:
    {
        if (anim->commandQueueSize == 0)
        {
            goto _exit;
        }

        // FIXME: I really have no idea what is going on here...
        r0 = ((struct Anim *)((anim->commandQueueSize + (u8 *)(anim))))->commandQueueSize;

        switch (r0)
        {
            case 1:
            case 2:
                // _0805A4F0
                sub_805A580(anim);
                break;

            case 5:
                // _0805A4F8
                if (GetAISLayerId(anim) == 0)
                {
                    ExecEfxop(anim);
                }

                // fallthrough

            case 3:
            case 4:
                anim->pScrCurrent++;

                break;

            case 13:
                // _0805A510
                sub_805A5A8(anim);
                break;

            case 14:
                // _0805A518
                ExecEfxop(anim);
                break;

            case 24:
                // _0805A520
                sub_805A580(anim);
                break;

            case 0:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
            case 15:
            case 16:
            case 17:
            case 18:
            case 19:
            case 20:
            case 21:
            case 22:
            case 23:
            case 25:
            case 26:
            case 27:
            case 28:
            case 29:
            case 30:
            case 31:
            case 32:
            case 33:
            case 34:
            case 35:
            case 36:
            case 37:
            case 38:
            case 39:
            case 40:
            case 41:
            case 42:
            case 43:
            case 44:
            case 45:
            case 46:
            case 47:
            case 48:
            case 49:
            case 50:
            default:
                // _0805A526
                break;
        }

        anim->commandQueueSize--;
        goto _loop;
    }

    _exit:
        anim->state2 &= 0xe700;
    }

    if (animState2 & 0x2000)
    {
        if ((GetAISLayerId(anim) == 0) && (pAnimBuf->unk_2C != anim->pImgSheet))
        {
            RegisterAISSheetGraphics(anim);
            pAnimBuf->unk_2C = anim->pImgSheet;
        }

        anim->state2 &= 0xd700;
    }

    animState2 &= 0x4000;

    if (animState2 != 0)
    {
        anim->nextRoundId = -1;
    }

    return;
}

//! FE8U = 0x0805A580
void sub_805A580(struct Anim * anim)
{
    anim->nextRoundId = -2;

    if (anim->state3 & ANIM_BIT3_HIT_EFFECT_APPLIED)
    {
        anim->state3 &= ANIM_BIT3_HIT_EFFECT_APPLIED;
        anim->nextRoundId = 0;
        anim->pScrCurrent++;
    }

    return;
}

#if NONMATCHING

/* https://decomp.me/scratch/eKPDm */

//! FE8U = 0x0805A5A8
void sub_805A5A8(struct Anim * anim)
{
    struct AnimBuffer * pAnimBuffer = anim->pUnk44;
    struct BattleAnim * banim = banim_data;
    void * pool;

    if (GetAISLayerId(anim) == 0)
    {
        int mode = BanimDefaultModeConfig[0x18];
        int * whoKnows = banim[pAnimBuffer->animId].modes;

        struct Anim * anim1 = pAnimBuffer->anim1;
        struct Anim * anim2 = pAnimBuffer->anim2;

        const void * unk28 = pAnimBuffer->unk_28;
        struct BanimModeData * frameData = (void *)unk28 + whoKnows[mode];

        anim1->pImgSheet = frameData->img;
        anim1->pSpriteData = anim1->pSpriteDataPool + frameData->unk2;

        anim2->pSpriteData = anim2->pSpriteDataPool + 0x000057F0;

        if (pAnimBuffer->unk_2C != anim->pImgSheet)
        {
            NewEkrChienCHR(anim);
            pAnimBuffer->unk_2C = anim->pImgSheet;
        }
    }

    return;
}

#else

NAKEDFUNC
void sub_805A5A8(struct Anim * anim)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, lr}\n\
        adds r6, r0, #0\n\
        ldr r5, [r6, #0x44]\n\
        ldr r4, _0805A600  @ banim_data\n\
        bl GetAISLayerId\n\
        cmp r0, #0\n\
        bne _0805A5FA\n\
        ldr r0, _0805A604  @ BanimDefaultModeConfig\n\
        ldrb r1, [r0, #0x18]\n\
        movs r2, #6\n\
        ldrsh r0, [r5, r2]\n\
        lsls r0, r0, #5\n\
        adds r0, r0, r4\n\
        ldr r0, [r0, #0xc]\n\
        ldr r2, [r5, #0x14]\n\
        ldr r3, [r5, #0x18]\n\
        ldr r4, [r5, #0x28]\n\
        lsls r1, r1, #2\n\
        adds r1, r1, r0\n\
        ldr r1, [r1]\n\
        adds r1, r4, r1\n\
        ldr r0, [r1, #4]\n\
        str r0, [r2, #0x28]\n\
        ldr r4, [r2, #0x30]\n\
        ldr r1, [r1, #8]\n\
        adds r4, r4, r1\n\
        str r4, [r2, #0x3c]\n\
        ldr r4, [r3, #0x30]\n\
        ldr r0, _0805A608  @ 0x000057F0\n\
        adds r4, r4, r0\n\
        str r4, [r3, #0x3c]\n\
        ldr r1, [r5, #0x2c]\n\
        ldr r0, [r6, #0x28]\n\
        cmp r1, r0\n\
        beq _0805A5FA\n\
        adds r0, r6, #0\n\
        bl NewEkrChienCHR\n\
        ldr r0, [r6, #0x28]\n\
        str r0, [r5, #0x2c]\n\
    _0805A5FA:\n\
        pop {r4, r5, r6}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _0805A600: .4byte banim_data\n\
    _0805A604: .4byte BanimDefaultModeConfig\n\
    _0805A608: .4byte 0x000057F0\n\
        .syntax divided\n\
    ");
}

#endif

//! FE8U = 0x0805A60C
void sub_805A60C(struct AnimBuffer * pAnimBuf)
{
    u32 modeA;
    u32 configA;
    u32 modeB;
    u32 configB;

    struct Anim * anim;
    u32 * puVar8;
    u32 * scrA;
    u32 * scrB;
    struct BattleAnim * ba;
    struct BattleAnim * ba2;
    u32 * scr;
    int * modes;
    int mode;

    ba = banim_data;

    modeA = BanimDefaultModeConfig[pAnimBuf->roundType * 4];
    configA = BanimDefaultModeConfig[pAnimBuf->roundType * 4 + 1];
    modeB = BanimDefaultModeConfig[pAnimBuf->roundType * 4 + 2];
    configB = BanimDefaultModeConfig[pAnimBuf->roundType * 4 + 3];

    LZ77UnCompWram(ba[pAnimBuf->animId].script, (void *)pAnimBuf->unk_28);

    ba2 = ba + pAnimBuf->animId;
    modes = ba2->modes;
    scr = (u32 *)pAnimBuf->unk_28;

    scrA = BanimScr_DefaultAnim;
    if (modeA != 0xff)
    {
        scrA = (void *)scr + modes[modeA];
    }

    scrB = BanimScr_DefaultAnim;
    if (modeB != 0xff)
    {
        scrB = (void *)scr + modes[modeB];
    }

    if (pAnimBuf->state2 == 0)
    {
        int * p;
        puVar8 = pAnimBuf->unk_24;
        LZ77UnCompWram(ba2->oam_l, puVar8);
        p = (puVar8 + 0x15FC);
        *p = 1;
    }
    else
    {
        int * p;
        puVar8 = pAnimBuf->unk_24;
        LZ77UnCompWram(ba2->oam_r, puVar8);
        p = (puVar8 + 0x15FC);
        *p = 1;
    }

    anim = AnimCreate(scrA, configA);

    anim->pSpriteDataPool = pAnimBuf->unk_24;

    anim->xPosition = pAnimBuf->xPos;
    anim->yPosition = pAnimBuf->yPos;

    anim->oam2Base = (pAnimBuf->oam2Pal << 0xc) | 0x800 | pAnimBuf->oam2Tile;
    anim->state2 = (pAnimBuf->state2 << 9) | 0x400 | anim->state2;
    anim->nextRoundId = 0;
    anim->currentRoundType = pAnimBuf->roundType;
    anim->pImgSheetBuf = pAnimBuf->pImgSheetBuf;

    pAnimBuf->anim1 = anim;
    anim->pUnk44 = pAnimBuf;

    if (pAnimBuf->animId == 0xc4)
    {
        pAnimBuf->anim2 = 0;
    }
    else
    {
        anim = AnimCreate(scrB, configB);

        anim->pSpriteDataPool = pAnimBuf->unk_24;

        anim->xPosition = pAnimBuf->xPos;
        anim->yPosition = pAnimBuf->yPos;

        anim->oam2Base = (pAnimBuf->oam2Pal << 0xc) | 0x800 | pAnimBuf->oam2Tile;
        anim->state2 = (pAnimBuf->state2 << 9) | 0x500 | anim->state2;

        anim->nextRoundId = 0;
        anim->currentRoundType = pAnimBuf->roundType;
        anim->pImgSheetBuf = pAnimBuf->pImgSheetBuf;

        pAnimBuf->anim2 = anim;
        anim->pUnk44 = pAnimBuf;
    }

    LZ77UnCompWram(ba[pAnimBuf->animId].pal, pAnimBuf->unk_20);

    if (pAnimBuf->charPalId != -1)
    {
        struct BattleAnimCharaPal * cbap = &character_battle_animation_palette_table[pAnimBuf->charPalId];
        LZ77UnCompWram(cbap->pal, pAnimBuf->unk_20);
    }

    CpuFastSet(pAnimBuf->unk_20 + pAnimBuf->genericPalId * 0x20, pAnimBuf->oam2Pal * 0x10 + gPaletteBuffer + 0x100, 8);

    EnablePaletteSync();

    pAnimBuf->unk_2C = 0;

    return;
}

#if NONMATCHING

/* https://decomp.me/scratch/go7Jx */

//! FE8U = 0x0805A7B4
void sub_805A7B4(struct AnimBuffer * pAnimBuf)
{
    u32 modeA;
    u32 configA;
    u32 modeB;
    u32 configB;

    struct Anim * anim;
    u32 * puVar8;
    u32 * scrA;
    u32 * scrB;
    struct BattleAnim * ba;
    struct BattleAnim * ba2;
    u32 * scr;
    int * modes;
    int mode;

    ba = banim_data;

    modeA = BanimDefaultModeConfig[pAnimBuf->roundType * 4];
    modeB = BanimDefaultModeConfig[pAnimBuf->roundType * 4 + 2];

    LZ77UnCompWram(ba[pAnimBuf->animId].script, (void *)pAnimBuf->unk_28);

    ba2 = ba + pAnimBuf->animId;
    modes = ba2->modes;
    scr = (u32 *)pAnimBuf->unk_28;

    scrA = BanimScr_DefaultAnim;
    if (modeA != 0xff)
    {
        scrA = (void *)scr + modes[modeA];
    }

    scrB = BanimScr_DefaultAnim;
    if (modeB != 0xff)
    {
        scrB = (void *)scr + modes[modeB];
    }

    if (pAnimBuf->state2 == 0)
    {
        int * p;
        puVar8 = pAnimBuf->unk_24;
        LZ77UnCompWram(ba2->oam_l, puVar8);
        p = (puVar8 + 0x15FC);
        *p = 1;
    }
    else
    {
        int * p;
        puVar8 = pAnimBuf->unk_24;
        LZ77UnCompWram(ba2->oam_r, puVar8);
        p = (puVar8 + 0x15FC);
        *p = 1;
    }

    anim = pAnimBuf->anim1;

    anim->pScrStart = scrA;
    anim->pScrCurrent = scrA;

    anim->pSpriteDataPool = pAnimBuf->unk_24;

    anim->xPosition = pAnimBuf->xPos;
    anim->yPosition = pAnimBuf->yPos;

    anim->oam2Base = (pAnimBuf->oam2Pal << 0xc) | 0x800 | pAnimBuf->oam2Tile;
    anim->state2 = (anim->state2 & 0x700);

    anim->state3 = 0;
    anim->timer = 0;
    anim->nextRoundId = 0;
    anim->currentRoundType = pAnimBuf->roundType;
    anim->pImgSheetBuf = pAnimBuf->pImgSheetBuf;

    anim->commandQueueSize = 0;
    pAnimBuf->anim1 = anim;

    anim = pAnimBuf->anim2;

    anim->pScrStart = scrB;
    anim->pScrCurrent = scrB;

    anim->pSpriteDataPool = pAnimBuf->unk_24;

    anim->xPosition = pAnimBuf->xPos;
    anim->yPosition = pAnimBuf->yPos;

    anim->oam2Base = (pAnimBuf->oam2Pal << 0xc) | 0x800 | pAnimBuf->oam2Tile;
    anim->state2 = (anim->state2 & 0x700);

    anim->state3 = 0;
    anim->timer = 0;
    anim->nextRoundId = 0;
    anim->currentRoundType = pAnimBuf->roundType;
    anim->pImgSheetBuf = pAnimBuf->pImgSheetBuf;

    anim->commandQueueSize = 0;
    pAnimBuf->anim2 = anim;

    LZ77UnCompWram(ba[pAnimBuf->animId].pal, pAnimBuf->unk_20);

    if (pAnimBuf->charPalId != -1)
    {
        struct BattleAnimCharaPal * cbap = &character_battle_animation_palette_table[pAnimBuf->charPalId];
        LZ77UnCompWram(cbap->pal, pAnimBuf->unk_20);
    }

    CpuFastCopy(pAnimBuf->unk_20 + pAnimBuf->genericPalId * 0x20, pAnimBuf->oam2Pal * 0x10 + gPaletteBuffer + 0x100, 0x20);

    EnablePaletteSync();

    return;
}

#else

NAKEDFUNC
void sub_805A7B4(struct AnimBuffer * pAnimBuf)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        adds r7, r0, #0\n\
        ldr r0, _0805A82C  @ banim_data\n\
        mov sl, r0\n\
        ldr r2, _0805A830  @ BanimDefaultModeConfig\n\
        ldrh r0, [r7, #0xa]\n\
        lsls r0, r0, #2\n\
        adds r1, r0, r2\n\
        ldrb r4, [r1]\n\
        adds r0, #2\n\
        adds r0, r0, r2\n\
        ldrb r5, [r0]\n\
        movs r1, #6\n\
        ldrsh r0, [r7, r1]\n\
        lsls r0, r0, #5\n\
        add r0, sl\n\
        ldr r0, [r0, #0x10]\n\
        ldr r1, [r7, #0x28]\n\
        bl LZ77UnCompWram\n\
        movs r2, #6\n\
        ldrsh r0, [r7, r2]\n\
        lsls r0, r0, #5\n\
        mov r2, sl\n\
        adds r1, r0, r2\n\
        ldr r2, [r1, #0xc]\n\
        ldr r3, [r7, #0x28]\n\
        ldr r0, _0805A834  @ BanimScr_DefaultAnim\n\
        mov r8, r0\n\
        cmp r4, #0xff\n\
        beq _0805A804\n\
        lsls r0, r4, #2\n\
        adds r0, r0, r2\n\
        ldr r0, [r0]\n\
        adds r0, r0, r3\n\
        mov r8, r0\n\
    _0805A804:\n\
        ldr r0, _0805A834  @ BanimScr_DefaultAnim\n\
        mov r9, r0\n\
        cmp r5, #0xff\n\
        beq _0805A816\n\
        lsls r0, r5, #2\n\
        adds r0, r0, r2\n\
        ldr r0, [r0]\n\
        adds r3, r3, r0\n\
        mov r9, r3\n\
    _0805A816:\n\
        ldrh r0, [r7, #0xc]\n\
        cmp r0, #0\n\
        bne _0805A83C\n\
        ldr r4, [r7, #0x24]\n\
        ldr r0, [r1, #0x18]\n\
        adds r1, r4, #0\n\
        bl LZ77UnCompWram\n\
        ldr r2, _0805A838  @ 0x000057F0\n\
        adds r1, r4, r2\n\
        b _0805A84A\n\
        .align 2, 0\n\
    _0805A82C: .4byte banim_data\n\
    _0805A830: .4byte BanimDefaultModeConfig\n\
    _0805A834: .4byte BanimScr_DefaultAnim\n\
    _0805A838: .4byte 0x000057F0\n\
    _0805A83C:\n\
        ldr r4, [r7, #0x24]\n\
        ldr r0, [r1, #0x14]\n\
        adds r1, r4, #0\n\
        bl LZ77UnCompWram\n\
        ldr r0, _0805A924  @ 0x000057F0\n\
        adds r1, r4, r0\n\
    _0805A84A:\n\
        movs r0, #1\n\
        str r0, [r1]\n\
        ldr r6, [r7, #0x14]\n\
        mov r1, r8\n\
        str r1, [r6, #0x24]\n\
        str r1, [r6, #0x20]\n\
        ldr r0, [r7, #0x24]\n\
        str r0, [r6, #0x30]\n\
        ldrh r0, [r7, #2]\n\
        movs r5, #0\n\
        movs r3, #0\n\
        strh r0, [r6, #2]\n\
        ldrh r0, [r7, #4]\n\
        strh r0, [r6, #4]\n\
        ldrh r0, [r7, #0x10]\n\
        lsls r0, r0, #0xc\n\
        movs r2, #0x80\n\
        lsls r2, r2, #4\n\
        adds r4, r2, #0\n\
        orrs r0, r4\n\
        ldrh r1, [r7, #0xe]\n\
        orrs r0, r1\n\
        strh r0, [r6, #8]\n\
        ldrh r1, [r6, #0xc]\n\
        movs r2, #0xe0\n\
        lsls r2, r2, #3\n\
        adds r0, r2, #0\n\
        ands r0, r1\n\
        strh r0, [r6, #0xc]\n\
        strh r3, [r6, #0x10]\n\
        strh r3, [r6, #6]\n\
        strh r3, [r6, #0xe]\n\
        ldrh r0, [r7, #0xa]\n\
        strb r0, [r6, #0x12]\n\
        ldr r0, [r7, #0x1c]\n\
        str r0, [r6, #0x2c]\n\
        strb r5, [r6, #0x14]\n\
        str r6, [r7, #0x14]\n\
        ldr r6, [r7, #0x18]\n\
        mov r0, r9\n\
        str r0, [r6, #0x24]\n\
        str r0, [r6, #0x20]\n\
        ldr r0, [r7, #0x24]\n\
        str r0, [r6, #0x30]\n\
        ldrh r0, [r7, #2]\n\
        strh r0, [r6, #2]\n\
        ldrh r0, [r7, #4]\n\
        strh r0, [r6, #4]\n\
        ldrh r0, [r7, #0x10]\n\
        lsls r0, r0, #0xc\n\
        orrs r0, r4\n\
        ldrh r1, [r7, #0xe]\n\
        orrs r0, r1\n\
        strh r0, [r6, #8]\n\
        ldrh r0, [r6, #0xc]\n\
        ands r2, r0\n\
        strh r2, [r6, #0xc]\n\
        strh r3, [r6, #0x10]\n\
        strh r3, [r6, #6]\n\
        strh r3, [r6, #0xe]\n\
        ldrh r0, [r7, #0xa]\n\
        strb r0, [r6, #0x12]\n\
        ldr r0, [r7, #0x1c]\n\
        str r0, [r6, #0x2c]\n\
        strb r5, [r6, #0x14]\n\
        str r6, [r7, #0x18]\n\
        movs r1, #6\n\
        ldrsh r0, [r7, r1]\n\
        lsls r0, r0, #5\n\
        add r0, sl\n\
        ldr r0, [r0, #0x1c]\n\
        ldr r1, [r7, #0x20]\n\
        bl LZ77UnCompWram\n\
        movs r2, #8\n\
        ldrsh r1, [r7, r2]\n\
        movs r0, #1\n\
        negs r0, r0\n\
        cmp r1, r0\n\
        beq _0805A8FA\n\
        adds r0, r1, #0\n\
        lsls r0, r0, #4\n\
        ldr r2, _0805A928  @ character_battle_animation_palette_table\n\
        adds r0, r0, r2\n\
        ldr r0, [r0, #0xc]\n\
        ldr r1, [r7, #0x20]\n\
        bl LZ77UnCompWram\n\
    _0805A8FA:\n\
        ldrb r1, [r7, #1]\n\
        lsls r1, r1, #5\n\
        ldr r0, [r7, #0x20]\n\
        adds r0, r0, r1\n\
        ldrh r1, [r7, #0x10]\n\
        lsls r1, r1, #5\n\
        ldr r2, _0805A92C  @ gPaletteBuffer+0x200\n\
        adds r1, r1, r2\n\
        movs r2, #8\n\
        bl CpuFastSet\n\
        bl EnablePaletteSync\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _0805A924: .4byte 0x000057F0\n\
    _0805A928: .4byte character_battle_animation_palette_table\n\
    _0805A92C: .4byte gPaletteBuffer+0x200\n\
        .syntax divided\n\
    ");
}

#endif

//! FE8U = 0x0805A930
void sub_805A930(struct AnimBuffer * pAnimBuf, int animId, int charPalId)
{
    pAnimBuf->animId = animId;
    pAnimBuf->charPalId = charPalId;

    sub_805A7B4(pAnimBuf);

    return;
}

//! FE8U = 0x0805A940
void sub_805A940(struct AnimBuffer * pAnimBuf, u16 x, u16 y)
{
    struct Anim * anim;

    pAnimBuf->xPos = x;
    pAnimBuf->yPos = y;

    anim = pAnimBuf->anim1;
    anim->xPosition = pAnimBuf->xPos;
    anim->yPosition = pAnimBuf->yPos;

    anim = pAnimBuf->anim2;
    anim->xPosition = pAnimBuf->xPos;
    anim->yPosition = pAnimBuf->yPos;

    return;
}

//! FE8U = 0x0805A95C
void sub_805A95C(struct AnimBuffer * pAnimBuf, u16 layer)
{
    struct Anim * anim;

    anim = pAnimBuf->anim1;
    anim->oam2Base = layer << 10;

    anim = pAnimBuf->anim2;
    anim->oam2Base = layer << 10;

    return;
}

//! FE8U = 0x0805A96C
bool sub_805A96C(struct AnimBuffer * pAnimBuf)
{
    struct Anim * anim1 = pAnimBuf->anim1;
    struct Anim * anim2 = pAnimBuf->anim2;

    if (anim1->nextRoundId == (u16)-2)
    {
        return true;
    }

    if (anim2->nextRoundId == (u16)-2)
    {
        return true;
    }

    return false;
}

//! FE8U = 0x0805A990
void sub_805A990(struct AnimBuffer * pAnimBuf)
{
    struct Anim * anim;

    anim = pAnimBuf->anim1;
    anim->state3 |= ANIM_BIT3_HIT_EFFECT_APPLIED;

    anim = pAnimBuf->anim2;
    anim->state3 |= ANIM_BIT3_HIT_EFFECT_APPLIED;

    return;
}

//! FE8U = 0x0805A9A4
bool sub_805A9A4(struct AnimBuffer * pAnimBuf)
{
    struct Anim * anim = pAnimBuf->anim1;

    if (anim->nextRoundId != (u16)-1)
    {
        return false;
    }

    return true;
}

// clang-format off

struct ProcCmd CONST_DATA gProc_efxAnimeDrvProc[] =
{
    PROC_NAME("ekrAnimeDrvProc"),
    PROC_REPEAT(ExecAllAIS),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805A9C0
void NewEfxAnimeDrvProc(void)
{
    void ** ptr = &gpProcEfxAnimeDrv;
    *ptr = Proc_Start(gProc_efxAnimeDrvProc, PROC_TREE_4);

    AnimClearAll();

    return;
}

//! FE8U = 0x0805A9E0
void EndEfxAnimeDrvProc(void)
{
    Proc_End(gpProcEfxAnimeDrv);
    return;
}

//! FE8U = 0x0805A9F4
void ExecAllAIS(void)
{
    AnimUpdateAll();
    return;
}

void EkrUnitMainMiniMain(struct ProcEkrUnitMainMini * proc);

// clang-format off

struct ProcCmd CONST_DATA ProcScr_ekrUnitMainMini[] =
{
    PROC_NAME("ekrUnitMainMini"),
    PROC_REPEAT(EkrUnitMainMiniMain),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805AA00
void NewEkrUnitMainMini(struct AnimBuffer * pAnimBuf)
{
    struct ProcEkrUnitMainMini * proc = Proc_Start(ProcScr_ekrUnitMainMini, PROC_TREE_4);
    sub_805A60C(pAnimBuf);

    proc->unk_5C = pAnimBuf;

    pAnimBuf->unk_34 = proc;
    pAnimBuf->unk_00 = 1;

    return;
}

//! FE8U = 0x0805AA28
void sub_805AA28(struct AnimBuffer * pAnimBuf)
{
    AnimDelete(pAnimBuf->anim1);
    AnimDelete(pAnimBuf->anim2);

    pAnimBuf->anim1 = 0;
    pAnimBuf->anim2 = 0;

    Proc_End(pAnimBuf->unk_34);

    return;
}

//! FE8U = 0x0805AA4C
void EkrUnitMainMiniMain(struct ProcEkrUnitMainMini * proc)
{
    struct AnimBuffer * pAnimBuf = proc->unk_5C;

    sub_805A3DC(pAnimBuf, pAnimBuf->anim1);
    sub_805A3DC(pAnimBuf, pAnimBuf->anim2);

    return;
}

//! FE8U = 0x0805AA68
void sub_805AA68(struct BanimUnkStructComm * buf)
{
    struct BattleAnimTerrain * a;
    struct BattleAnimTerrain * b;
    void * vramA;
    void * vramB;
    void * palA;
    void * palB;
    s16 oam2Pal;
    u16 oam2;

    a = &battle_terrain_table[buf->unk00];
    b = &battle_terrain_table[buf->unk06];

    if (buf->unk00 != -1)
    {
        LZ77UnCompWram(a->tileset, buf->unk20);
    }

    if (buf->unk06 != -1)
    {
        LZ77UnCompWram(b->tileset, buf->unk20 + 0x1000);
    }

    switch (buf->unk0C)
    {
        case 0:
        case 4:
            vramA = buf->unk20;
            vramB = buf->unk20 + 0x1000;
            break;

        case 1:
        case 2:
        case 3:
        default:
            vramA = buf->unk20 + 0x800;
            vramB = buf->unk20 + 0x1800;
            break;
    }

    palA = a->palette;
    palB = b->palette;

    if (buf->unk0E != -1)
    {
        if (buf->unk0E >= -1)
        {
            if (buf->unk0E < 4)
            {
                int vram = ((buf->unk04 + 0x40) * 0x20 + 0x6000000);
                RegisterDataMove(vramA, (void *)(buf->unk1C + vram), 0x800);
                vram = (buf->unk0A * 0x20 + 0x6000000);
                RegisterDataMove(vramB, (void *)(buf->unk1C + vram), 0x800);

                CpuFastCopy(palA, gPaletteBuffer + buf->unk02 * 0x10, 0x20);
                CpuFastCopy(palB, gPaletteBuffer + buf->unk08 * 0x10, 0x20);

                EnablePaletteSync();
                sub_805AE58(buf);
            }
        }
    }
    else
    {
        if (buf->unk00 != -1)
        {
            RegisterDataMove(vramA, (void *)(buf->unk1C + buf->unk04 * 0x20), 0x800);
            CpuFastCopy(palA, buf->unk02 * 0x10 + gPaletteBuffer + 0x100, 0x20);
        }

        if (buf->unk06 != -1)
        {
            RegisterDataMove(vramB, (void *)(buf->unk1C + buf->unk0A * 0x20), 0x800);
            CpuFastCopy(palB, buf->unk08 * 0x10 + gPaletteBuffer + 0x100, 0x20);
        }

        EnablePaletteSync();
    }

    switch (buf->unk0E)
    {
        case 0:
            BG_EnableSyncByMask(BG0_SYNC_BIT);
            return;

        case 1:
            BG_EnableSyncByMask(BG1_SYNC_BIT);
            return;

        case 2:
            BG_EnableSyncByMask(BG2_SYNC_BIT);
            return;

        case 3:
            BG_EnableSyncByMask(BG3_SYNC_BIT);
            return;

        case -1:
            buf->proc14 = NULL;
            buf->proc18 = NULL;

            if (buf->unk06 != -1)
            {
                switch (buf->unk0C)
                {
                    case 0:
                    case 4:
                    {
                        oam2Pal = buf->unk08;
                        oam2 = (oam2Pal << 0xc) | buf->unk0A | OAM2_LAYER(3);
                        buf->proc18 = NewEkrsubAnimeEmulator(0xa8, 0x68, gUnknown_085C73B8, 2, oam2, 0, PROC_TREE_4);
                        break;
                    }

                    case 1:
                    {
                        oam2Pal = buf->unk08;
                        oam2 = (oam2Pal << 0xc) | buf->unk0A | OAM2_LAYER(3);
                        buf->proc18 = NewEkrsubAnimeEmulator(0xb0, 0x68, gUnknown_085C72AC, 2, oam2, 0, PROC_TREE_4);
                        break;
                    }

                    case 2:
                    {
                        oam2Pal = buf->unk08;
                        oam2 = (oam2Pal << 0xc) | buf->unk0A | OAM2_LAYER(3);
                        buf->proc18 = NewEkrsubAnimeEmulator(0xb0, 0x68, gUnknown_085C72AC, 2, oam2, 0, PROC_TREE_4);
                        break;
                    }

                    case 3:
                    {
                        oam2Pal = buf->unk08;
                        oam2 = (oam2Pal << 0xc) | buf->unk0A | OAM2_LAYER(3);
                        buf->proc18 = NewEkrsubAnimeEmulator(0x80, 0x68, gUnknown_085C72AC, 2, oam2, 0, PROC_TREE_4);
                        break;
                    }
                }
            }

            if ((buf->unk00 != -1))
            {
                switch (buf->unk0C)
                {
                    case 0:
                    case 4:
                    {
                        oam2Pal = buf->unk02;
                        oam2 = (oam2Pal << 0xc) | buf->unk04 | OAM2_LAYER(3);
                        buf->proc14 = NewEkrsubAnimeEmulator(0x48, 0x68, gUnknown_085C7438, 2, oam2, 0, PROC_TREE_4);
                        break;
                    }

                    case 1:
                    {
                        oam2Pal = buf->unk02;
                        oam2 = (oam2Pal << 0xc) | buf->unk04 | OAM2_LAYER(3);
                        buf->proc14 = NewEkrsubAnimeEmulator(0x20, 0x68, gUnknown_085C7338, 2, oam2, 0, PROC_TREE_4);
                        break;
                    }

                    case 2:
                    {
                        oam2Pal = buf->unk02;
                        oam2 = (oam2Pal << 0xc) | buf->unk04 | OAM2_LAYER(3);
                        buf->proc14 = NewEkrsubAnimeEmulator(0x40, 0x68, gUnknown_085C7338, 2, oam2, 0, PROC_TREE_4);
                        break;
                    }

                    case 3:
                    {
                        oam2Pal = buf->unk02;
                        oam2 = (oam2Pal << 0xc) | buf->unk04 | OAM2_LAYER(3);
                        buf->proc14 = NewEkrsubAnimeEmulator(0x78, 0x68, gUnknown_085C7438, 2, oam2, 0, PROC_TREE_4);
                        break;
                    }
                }
            }

            break;
    }

    return;
}

//! FE8U = 0x0805AE14
void sub_805AE14(struct BanimUnkStructComm * buf)
{
    if (buf->unk0E == -1)
    {
        if (buf->proc14)
            Proc_End(buf->proc14);

        if (buf->proc18)
            Proc_End(buf->proc18);
    }
}

//! FE8U = 0x0805AE40
void sub_805AE40(struct BanimUnkStructComm * buf, s16 a, s16 b, s16 c, s16 d)
{
    struct BanimUnkStructCommPriv * priv;

    priv = buf->proc14;
    priv->unk32 = a;
    priv->unk3A = b;

    priv = buf->proc18;
    priv->unk32 = c;
    priv->unk3A = d;
}
