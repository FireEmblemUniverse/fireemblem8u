#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "ctc.h"
#include "ekrdragon.h"
#include "banim_data.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "constants/classes.h"

extern struct Anim *gAnims[4];

void sub_80598CC(struct Anim *anim)
{
    u32 inst;

    if (CheckRound1(anim->currentRoundType) == false)
        return;

    if (anim->pScrCurrent == BanimScr_085B9D5C)
        return;

    while (1) {
        inst = ANINS_GET_TYPE(*anim->pScrCurrent);

        if (inst == 0) {
            anim->pScrCurrent -= 3;
            break;
        }

        if (inst == 5) {
            anim->pScrCurrent -= 3;
            break;
        }

        if (inst == 6)
            anim->pScrCurrent += 3;
    }

}

void NewEkrChienCHR(struct Anim *anim)
{
    struct ProcEkrChienCHR *proc;
    proc = Proc_Start(gProc_ekrChienCHR, PROC_TREE_3);
    proc->anim = anim;
}

void EkrChienCHRMain(struct ProcEkrChienCHR *proc)
{
    RegisterAISSheetGraphics(proc->anim);
    Proc_Break(proc);
}

void RegisterAISSheetGraphics(struct Anim *anim)
{
    void *mmap;
    mmap = (void *)0x06010000 + (anim->oam2Base & 0x3FF) * 0x20;
    LZ77UnCompWram(anim->pImgSheet, anim->pUnk2C);
    RegisterDataMove(anim->pUnk2C, mmap, 0x2000);
}

void sub_8059970(u32 *buf, int pos)
{
    u32 i;

    if (gUnknown_0203E1DC[pos] == 0)
        return;

    for (i = 0; i < 8; i++)
        buf[i] = buf[i + 0x20];
}

int GetBanimPalette(int banim_id, enum ekr_battle_unit_position pos)
{
    u32 jid;
    struct BattleUnit *bu;

    if (EKR_POS_L == pos)
        bu = gpEkrBattleUnitLeft;
    else
        bu = gpEkrBattleUnitRight;

    jid = bu->unit.pClassData->number;
    switch (jid) {
    case CLASS_ARCHER:
        return 0x25;
    
    case CLASS_ARCHER_F:
        return 0x27;
    
    case CLASS_SNIPER:
        return 0x29;
    
    case CLASS_SNIPER_F:
        return 0x2B;
    
    default:
        return banim_id;
    }
}

void UpdateBanimFrame(void)
{
    int val1;
    int bid, bid_pal, bside;
    BattleAnimCharaPal *cbapt = character_battle_animation_palette_table;
    BattleAnim *banim = banim_data;

    ++banim; --banim;
    gpImgSheet[1] = NULL;
    gpImgSheet[0] = NULL;

    if (gEkrPairSideVaild[EKR_POS_L] == true) {
        bid = gEkrPairBanimID2[EKR_POS_L];
        bid_pal = gBanimSomeObjPalIndex[EKR_POS_L];
        bside = gBattleInitSide[EKR_POS_L];

        LZ77UnCompWram(banim[bid].script, gBanimScrLeft);
        gpBanimModesLeft = banim[bid].modes;
        LZ77UnCompWram(banim[GetBanimPalette(bid, 0)].pal, gBanimPal1);

        if (bside != -1) {
            LZ77UnCompWram(cbapt[bside].pal, gBanimPal1);
            sub_8059970((u32 *)gBanimPal1, 0);
        }

        gpEfxUnitPaletteBackup[0] = &PAL_BUF_COLOR(gBanimPal1, bid_pal, 0);
        CpuFastCopy(&PAL_BUF_COLOR(gBanimPal1, bid_pal, 0), PAL_OBJ(0x7), 0x20);
        CpuFastCopy(gBanimCharacterTSAs[0], PAL_OBJ(0x8), 0x20);

        if (gBattleActor.unit.statusIndex == 0xB || gBattleActor.unit.statusIndex == 0xD)
            sub_8071468(gPaletteBuffer, PAL_OBJ(0x7), 0x1);

        if (gBattleTarget.unit.statusIndex == 0xB || gBattleTarget.unit.statusIndex == 0xD)
            sub_8071468(gPaletteBuffer, PAL_OBJ(0x8), 0x1);

        EnablePaletteSync();
        LZ77UnCompWram(banim[bid].oam_l, gBanimOaml);
        gBanimOaml[0x57F0 / 4] = 1;
    }

    if (gEkrPairSideVaild[EKR_POS_R] == true) {
        bid = gEkrPairBanimID2[EKR_POS_R];
        bid_pal = gBanimSomeObjPalIndex[EKR_POS_R];
        bside = gBattleInitSide[EKR_POS_R];

        LZ77UnCompWram(banim[bid].script, gBanimScrRight);
        gpBanimModesRight = banim[bid].modes;
        LZ77UnCompWram(banim[GetBanimPalette(bid, 1)].pal, gBanimPal2);

        if (bside != -1) {
            LZ77UnCompWram(cbapt[bside].pal, gBanimPal2);
            sub_8059970((u32 *)gBanimPal2, 1);
        }

        gpEfxUnitPaletteBackup[1] = &PAL_BUF_COLOR(gBanimPal2, bid_pal, 0);
        CpuFastCopy(&PAL_BUF_COLOR(gBanimPal2, bid_pal, 0), PAL_OBJ(0x9), 0x20);
        CpuFastCopy(gBanimCharacterTSAs[1], PAL_OBJ(0xA), 0x20);

        EnablePaletteSync();
        LZ77UnCompWram(banim[bid].oam_r, gBanimOamr2);
        gBanimOamr2[0x57F0 / 4] = 1;
    }

    if (gpEkrTriangleUnits[0] != NULL) {
        {
            u16 pid, jid;
            u16 i;
            u16 idx = sub_8057CAC(gpEkrTriangleUnits[0], gpEkrTriangleUnits[0]->pClassData->pBattleAnimDef, 0, &val1);
            gBanimCharacterTSAs[0] = banim[idx].pal;

            pid = gpEkrTriangleUnits[0]->pCharacterData->number - 1;
            jid = gpEkrTriangleUnits[0]->pClassData->number;

            for (i = 0; i < 7; i++) {
                if (gUnknown_0895E0A4[i + pid * 7] == jid) {
                    gBanimCharacterTSAs[0] = cbapt[gUnknown_0895EEA4[i + pid * 7] - 1].pal;
                    break;
                }
            }
        }
        {
            u16 pid, jid;
            u16 i;
            u16 idx = sub_8057CAC(gpEkrTriangleUnits[1], gpEkrTriangleUnits[1]->pClassData->pBattleAnimDef, 0, &val1);
            gBanimCharacterTSAs[1] = banim[idx].pal;

            pid = gpEkrTriangleUnits[1]->pCharacterData->number - 1;
            jid = gpEkrTriangleUnits[1]->pClassData->number;

            for (i = 0; i < 7; i++) {
                if (gUnknown_0895E0A4[i + pid * 7] == jid) {
                    gBanimCharacterTSAs[1] = cbapt[gUnknown_0895EEA4[i + pid * 7] - 1].pal;
                    break;
                }
            }
        }
    }
}

void InitBothAIS(void)
{
    struct Anim *anim1, *anim2;

    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
    case EKR_DISTANCE_3:
    case EKR_DISTANCE_PROMOTION:
        BattleAnimationAISInit(6, 6);
        break;

    case EKR_DISTANCE_FAR:
        BattleAnimationAISInit(8, 8);
        break;

    case EKR_DISTANCE_FARFAR:
        BattleAnimationAISInit(8, 8);

        if (GetEkrSomePosMaybe() == EKR_POS_L) {
            anim1 = gAnims[2];
            anim1->xPosition = 0x180;

            anim2 = gAnims[3];
            anim2->xPosition = 0x180;
        } else {
            anim1 = gAnims[0];
            anim1->xPosition = 0x180;

            anim2 = gAnims[1];
            anim2->xPosition = 0x180;
        }
        break;

    default:
        break;
    }

    gEfxPairHpBufOffset[0] = 0;
    gEfxPairHpBufOffset[1] = 0;
}

void BattleAnimationAISInit(int a, int b)
{
    gAnims[0] = NULL;
    gAnims[1] = NULL;
    gAnims[2] = NULL;
    gAnims[3] = NULL;

    if (gEkrPairSideVaild[EKR_POS_L] == true)
        InitLeftAnim(a);

    if (gEkrPairSideVaild[EKR_POS_R] == true)
        InitRightAnim(b);
    
    if (gEkrDistanceType == 4) {
        gAnims[0]->state |= 0x2;
        gAnims[1]->state |= 0x2;
    }
}

void InitLeftAnim(int arg)
{
    struct Anim *anim;
    u32 frame_front = gBanimRoundScripts[arg * 4 + 0];
    u32 priority_front = gBanimRoundScripts[arg * 4 + 1];
    u32 frame_back = gBanimRoundScripts[arg * 4 + 2];
    u32 priority_back = gBanimRoundScripts[arg * 4 + 3];
    u32 r4 = gUnknown_080DAF1D[gEkrDistanceType];

    void *array[2];
    array[0] = &&label1;
    array[1] = &&label2;

    gUnknown_02000030[0] = -gUnknown_080DAF28[gEkrDistanceType];
    gUnknown_02000034[0] = 0;
    gEkrXPosBase[0] = gUnknown_02000030[0] + r4;
    gEkrYPosBase[0] = 0x58;

label1:
    {
        u32 idx = gpBanimModesLeft[frame_front];
        void *scr = gBanimScrLeft + idx;
        if (frame_front == 0xFF)
            scr = BanimScr_085B9D5C;
        do anim = AnimCreate(scr, priority_front); while (0);
        anim->xPosition = gEkrXPosBase[0] - gEkrBgXOffset;
        anim->yPosition = gEkrYPosBase[0];
        anim->oam2Base = 0x7A00;
        anim->state2 |= 0x400;
        anim->nextRoundId = 0x0;
        anim->currentRoundType = arg;
        anim->pUnk2C = gUnknown_02000088;
        anim->pSpriteDataPool = gBanimOaml;
        gAnims[0] = anim;
    }

label2:
    {
        u32 idx = gpBanimModesLeft[frame_back];
        void *scr = gBanimScrLeft + idx;
        if (frame_back == 0xFF)
            scr = BanimScr_085B9D5C;
        anim = AnimCreate(scr, priority_back);
        anim->xPosition = gEkrXPosBase[0] - gEkrBgXOffset;
        anim->yPosition = gEkrYPosBase[0];
        anim->oam2Base = 0x7A00;
        anim->state2 |= 0x500;
        anim->nextRoundId = 0x0;
        anim->currentRoundType = arg;
        anim->pUnk2C = gUnknown_02000088;
        anim->pSpriteDataPool = gBanimOaml;
        gAnims[1] = anim;
    }
}

void InitRightAnim(int arg)
{
    struct Anim *anim;
    u32 frame_front = gBanimRoundScripts[arg * 4 + 0];
    u32 priority_front = gBanimRoundScripts[arg * 4 + 1];
    u32 frame_back = gBanimRoundScripts[arg * 4 + 2];
    u32 priority_back = gBanimRoundScripts[arg * 4 + 3];
    u32 r2 = gUnknown_080DAF22[gEkrDistanceType];

    void *array[2];
    array[0] = &&label1;
    array[1] = &&label2;
    
    gUnknown_02000030[1] = 0;
    gUnknown_02000034[1] = 0;
    gEkrXPosBase[1] = r2;
    gEkrYPosBase[1] = 0x58;

label1:
    {
        u32 idx = gpBanimModesRight[frame_front];
        void *scr = gBanimScrRight + idx;
        if (frame_front == 0xFF)
            scr = BanimScr_085B9D5C;
        do anim = AnimCreate(scr, priority_front); while (0);
        anim->xPosition = gEkrXPosBase[1] - gEkrBgXOffset;
        anim->yPosition = gEkrYPosBase[1];
        anim->oam2Base = 0x9B00;
        anim->state2 |= 0x600;
        anim->nextRoundId = 0x0;
        anim->currentRoundType = arg;
        anim->pUnk2C = gUnknown_02002088;
        anim->pSpriteDataPool = gBanimOamr2;
        gAnims[2] = anim;
    }

label2:
    {
        u32 idx = gpBanimModesRight[frame_back];
        void *scr = gBanimScrRight + idx;
        if (frame_back == 0xFF)
            scr = BanimScr_085B9D5C;
        anim = AnimCreate(scr, priority_back);
        anim->xPosition = gEkrXPosBase[1] - gEkrBgXOffset;
        anim->yPosition = gEkrYPosBase[1];
        anim->oam2Base = 0x9B00;
        anim->state2 |= 0x700;
        anim->nextRoundId = 0x0;
        anim->currentRoundType = arg;
        anim->pUnk2C = gUnknown_02002088;
        anim->pSpriteDataPool = gBanimOamr2;
        gAnims[3] = anim;
    }
}

#if NONMATCHING

void SwitchAISFrameDataFromBARoundType(struct Anim *anim, int type)
{
    u32 frame, priority, oam2;

    if (GetAISLayerId(anim) == 0) {
        frame    = gBanimRoundScripts[4 * type + 0];
        priority = gBanimRoundScripts[4 * type + 1];
    } else {
        frame    = gBanimRoundScripts[4 * type + 2];
        priority = gBanimRoundScripts[4 * type + 3];
    }

    if (frame != 0xFF) {
        if (GetAnimPosition(anim) == EKR_POS_L) {
            u32 idx = gpBanimModesLeft[frame];
            void *scr = gBanimScrLeft + idx;

            anim->pScrStart = scr;
            anim->pScrCurrent = scr;
        } else {
            u32 idx = gpBanimModesRight[frame];
            void *scr = gBanimScrRight + idx;

            anim->pScrStart = scr;
            anim->pScrCurrent = scr;
        }
    } else {
        anim->pScrStart = BanimScr_085B9D5C;
        anim->pScrCurrent = BanimScr_085B9D5C;
        anim->state3 = 0;
    }

    anim->drawLayerPriority = priority;

    oam2 = anim->oam2Base;
    oam2 &= 0xF3FF;
    oam2 |= 0x800;
    anim->oam2Base = oam2;
    anim->timer = 0;
    anim->state2 &= 0x700;
    anim->currentRoundType = type;
    anim->commandQueueSize = 0;
    anim->pSpriteDataPool = gBanimOaml + GetAnimPosition(anim) * 0x5800 / 4;
    AnimSort();
    EkrDragonBodyAnimeSet54(anim);
}

#else

__attribute__((naked))
void SwitchAISFrameDataFromBARoundType(struct Anim *anim, int type)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        adds r4, r0, #0\n\
        adds r6, r1, #0\n\
        bl GetAISLayerId\n\
        cmp r0, #0\n\
        bne _0805A09C\n\
        ldr r0, _0805A098  @ gBanimRoundScripts\n\
        lsls r1, r6, #2\n\
        adds r2, r1, r0\n\
        ldrb r5, [r2]\n\
        adds r1, #1\n\
        adds r1, r1, r0\n\
        b _0805A0AA\n\
        .align 2, 0\n\
    _0805A098: .4byte gBanimRoundScripts\n\
    _0805A09C:\n\
        ldr r2, _0805A0C8  @ gBanimRoundScripts\n\
        lsls r1, r6, #2\n\
        adds r0, r1, #2\n\
        adds r0, r0, r2\n\
        ldrb r5, [r0]\n\
        adds r1, #3\n\
        adds r1, r1, r2\n\
    _0805A0AA:\n\
        ldrb r7, [r1]\n\
        cmp r5, #0xff\n\
        beq _0805A0F0\n\
        adds r0, r4, #0\n\
        bl GetAnimPosition\n\
        cmp r0, #0\n\
        bne _0805A0D4\n\
        ldr r0, _0805A0CC  @ gpBanimModesLeft\n\
        ldr r1, [r0]\n\
        lsls r0, r5, #2\n\
        adds r0, r0, r1\n\
        ldr r1, [r0]\n\
        ldr r0, _0805A0D0  @ gBanimScrLeft\n\
        b _0805A0E0\n\
        .align 2, 0\n\
    _0805A0C8: .4byte gBanimRoundScripts\n\
    _0805A0CC: .4byte gpBanimModesLeft\n\
    _0805A0D0: .4byte gBanimScrLeft\n\
    _0805A0D4:\n\
        ldr r0, _0805A0E8  @ gpBanimModesRight\n\
        ldr r1, [r0]\n\
        lsls r0, r5, #2\n\
        adds r0, r0, r1\n\
        ldr r1, [r0]\n\
        ldr r0, _0805A0EC  @ gBanimScrRight\n\
    _0805A0E0:\n\
        adds r1, r1, r0\n\
        str r1, [r4, #0x24]\n\
        str r1, [r4, #0x20]\n\
        b _0805A0FA\n\
        .align 2, 0\n\
    _0805A0E8: .4byte gpBanimModesRight\n\
    _0805A0EC: .4byte gBanimScrRight\n\
    _0805A0F0:\n\
        ldr r0, _0805A148  @ BanimScr_085B9D5C\n\
        str r0, [r4, #0x24]\n\
        str r0, [r4, #0x20]\n\
        movs r0, #0\n\
        strh r0, [r4, #0x10]\n\
    _0805A0FA:\n\
        movs r3, #0\n\
        movs r2, #0\n\
        strh r7, [r4, #0xa]\n\
        ldrh r1, [r4, #8]\n\
        ldr r0, _0805A14C  @ 0x0000F3FF\n\
        ands r0, r1\n\
        movs r5, #0x80\n\
        lsls r5, r5, #4\n\
        adds r1, r5, #0\n\
        orrs r0, r1\n\
        strh r0, [r4, #8]\n\
        strh r2, [r4, #6]\n\
        ldrh r1, [r4, #0xc]\n\
        movs r0, #0xe0\n\
        lsls r0, r0, #3\n\
        ands r0, r1\n\
        strh r0, [r4, #0xc]\n\
        strb r6, [r4, #0x12]\n\
        strb r3, [r4, #0x14]\n\
        adds r0, r4, #0\n\
        bl GetAnimPosition\n\
        lsls r1, r0, #1\n\
        adds r1, r1, r0\n\
        lsls r1, r1, #2\n\
        subs r1, r1, r0\n\
        lsls r1, r1, #0xb\n\
        ldr r0, _0805A150  @ gBanimOaml\n\
        adds r1, r1, r0\n\
        str r1, [r4, #0x30]\n\
        bl AnimSort\n\
        adds r0, r4, #0\n\
        bl EkrDragonBodyAnimeSet54\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _0805A148: .4byte BanimScr_085B9D5C\n\
    _0805A14C: .4byte 0x0000F3FF\n\
    _0805A150: .4byte gBanimOaml\n\
        .syntax divided\n\
    ");
}
#endif

int GetAISLayerId(struct Anim *anim)
{
    if (!(anim->state2 & 0x100))
        return 0;

    return 1;
}

int GetAnimPosition(struct Anim *anim)
{
    if (!(anim->state2 & 0x200))
        return EKR_POS_L;

    return EKR_POS_R;
}

int CheckRoundMiss(s16 type)
{
    switch(type) {
    case ANIM_ROUND_TAKING_MISS_CLOSE:
    case ANIM_ROUND_TAKING_MISS_FAR:
        return true;

    case ANIM_ROUND_HIT_CLOSE:
    case ANIM_ROUND_CRIT_CLOSE:
    case ANIM_ROUND_NONCRIT_FAR:
    case ANIM_ROUND_CRIT_FAR:
    case ANIM_ROUND_TAKING_HIT_CLOSE:
    case ANIM_ROUND_STANDING:
    case ANIM_ROUND_TAKING_HIT_FAR:
    case ANIM_ROUND_MISS_CLOSE:
    default:
        return false;
    }
}

int CheckRound1(s16 type)
{
    switch(type) {
    case ANIM_ROUND_TAKING_HIT_CLOSE:
    case ANIM_ROUND_STANDING:
    case ANIM_ROUND_TAKING_HIT_FAR:
        return true;

    case ANIM_ROUND_HIT_CLOSE:
    case ANIM_ROUND_CRIT_CLOSE:
    case ANIM_ROUND_NONCRIT_FAR:
    case ANIM_ROUND_CRIT_FAR:
    case ANIM_ROUND_TAKING_MISS_CLOSE:
    case ANIM_ROUND_TAKING_MISS_FAR:
    case ANIM_ROUND_MISS_CLOSE:
    default:
        return false;
    }
}

int CheckRound2(s16 type)
{
    switch(type) {
    case ANIM_ROUND_HIT_CLOSE:
    case ANIM_ROUND_CRIT_CLOSE:
    case ANIM_ROUND_NONCRIT_FAR:
    case ANIM_ROUND_CRIT_FAR:
    case ANIM_ROUND_MISS_CLOSE:
        return true;

    case ANIM_ROUND_TAKING_MISS_CLOSE:
    case ANIM_ROUND_TAKING_MISS_FAR:
    case ANIM_ROUND_TAKING_HIT_CLOSE:
    case ANIM_ROUND_STANDING:
    case ANIM_ROUND_TAKING_HIT_FAR:
    default:
        return false;
    }
}

int CheckRoundCrit(struct Anim *anim)
{
    switch(anim->currentRoundType) {
    case ANIM_ROUND_CRIT_CLOSE:
    case ANIM_ROUND_CRIT_FAR:
        return true;

    case ANIM_ROUND_HIT_CLOSE:
    case ANIM_ROUND_NONCRIT_FAR:
    case ANIM_ROUND_TAKING_MISS_CLOSE:
    case ANIM_ROUND_TAKING_MISS_FAR:
    case ANIM_ROUND_TAKING_HIT_CLOSE:
    case ANIM_ROUND_STANDING:
    case ANIM_ROUND_TAKING_HIT_FAR:
    case ANIM_ROUND_MISS_CLOSE:
    default:
        return false;
    }
}

struct Anim *GetAnimAnotherSide(struct Anim *anim)
{
    return gAnims[(1 ^ GetAnimPosition(anim)) * 2];
}

s16 GetAnimRoundType(struct Anim *anim)
{
    return GetBattleAnimRoundType((anim->nextRoundId - 1) * 2 + GetAnimPosition(anim));
}

s16 GetAnimNextRoundType(struct Anim *anim)
{
    return GetBattleAnimRoundType(anim->nextRoundId * 2 + GetAnimPosition(anim));
}

s16 GetAnimRoundTypeAnotherSide(struct Anim *anim)
{
    return GetBattleAnimRoundType((anim->nextRoundId - 1) * 2 + (1 ^ GetAnimPosition(anim)));
}

s16 GetAnimNextRoundTypeAnotherSide(struct Anim *anim)
{
    return GetBattleAnimRoundType(anim->nextRoundId * 2 + (1 ^ GetAnimPosition(anim)));
}

void SetAnimStateHidden(int pos)
{
    if (pos == EKR_POS_L) {
        struct Anim *anim;

        anim = gAnims[0];
        anim->state |= ANIM_BIT_HIDDEN;

        anim = gAnims[1];
        anim->state |= ANIM_BIT_HIDDEN;
        return;
    }

    if (pos == EKR_POS_R) {
        struct Anim *anim;

        anim = gAnims[2];
        anim->state |= ANIM_BIT_HIDDEN;

        anim = gAnims[3];
        anim->state |= ANIM_BIT_HIDDEN;
        return;
    }
}

void SetAnimStateUnHidden(int pos)
{
    if (pos == EKR_POS_L) {
        struct Anim *anim;

        anim = gAnims[0];
        anim->state &= ~ANIM_BIT_HIDDEN;

        anim = gAnims[1];
        anim->state &= ~ANIM_BIT_HIDDEN;
        return;
    }

    if (pos == EKR_POS_R) {
        struct Anim *anim;

        anim = gAnims[2];
        anim->state &= ~ANIM_BIT_HIDDEN;

        anim = gAnims[3];
        anim->state &= ~ANIM_BIT_HIDDEN;
        return;
    }
}
