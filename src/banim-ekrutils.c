#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "bmunit.h"
#include "ekrbattle.h"
#include "efxbattle.h"

extern struct Anim *gAnims[4];

void sub_805515C(void)
{
    return;
}

void SetSomethingSpellFxToTrue(void)
{
    gUnknown_0201772C = true;
}

void SetSomethingSpellFxToFalse(void)
{
    gUnknown_0201772C = false;
}

void ClearBG1Setup(void)
{
    BG_SetPosition(BG_1, 0, 0);
}

void ClearBG1(void)
{
    CpuFastFill16(0, gBG1TilemapBuffer, 0x800);
    BG_EnableSyncByMask(BG1_SYNC_BIT);
}

void sub_80551B0(void)
{
    SetSpecialColorEffectsParameters(1, 0x10, 0x10, 0);
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 1);
    SetWinEnable(1, 0, 0);
    SetWin0Box(0, 0, 0xF0, 0xA0);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 0, 1, 1, 1);

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 0;
    gLCDControlBuffer.bldcnt.target2_bd_on = 1;
}

void SetDefaultColorEffects_(void)
{
    SetDefaultColorEffects();
}

void ThisMakesTheHPInSpellAnimGoAway(struct Anim *anim, int type)
{
    ExecHittedEffectBanim(anim, type, 3, 4);
}

void sub_8055288(struct Anim *anim, int type)
{
    ExecHittedEffectBanim(anim, type, 5, 5);
}

void ExecHittedEffectBanim(struct Anim *anim, int type, int a, int b)
{
    struct Anim *animr7, *animr9, *animr5, *animr8;
    int val1, val2;
    s16 roundt1, roundt2;

    if (GetAISSubjectId(anim) == EKR_POS_L) {
        animr7 = gAnims[2];
        animr9 = gAnims[3];
        animr5 = gAnims[0];
        animr8 = gAnims[1];
    } else {
        animr7 = gAnims[0];
        animr9 = gAnims[1];
        animr5 = gAnims[2];
        animr8 = gAnims[3];
    }

    switch (type) {
    case EKR_HITTED:
        roundt1 = GetAnimRoundType((animr7->nextRoundId - 1) * 2 + GetAISSubjectId(animr7));
        roundt2 = GetAnimRoundType((animr5->nextRoundId - 1) * 2 + GetAISSubjectId(animr5));

        if (roundt1 & ANIM_ROUND_POISON) {
            if (GettUnitEfxDebuff(animr7) == UNIT_STATUS_NONE)
                SetUnitEfxDebuff(animr7, UNIT_STATUS_POISON);
        }

        if (roundt2 & ANIM_ROUND_POISON) {
            if (GettUnitEfxDebuff(animr5) == UNIT_STATUS_NONE)
                SetUnitEfxDebuff(animr5, UNIT_STATUS_POISON);
        }

        if (roundt1 & ANIM_ROUND_DEVIL || roundt2 & ANIM_ROUND_DEVIL) {
            struct Anim *tmp;
            tmp = animr5;
            animr5 = animr7;
            animr7 = tmp;
            animr8 = animr9;
        }

        val1 = gEfxPairHpBufOffset[GetAISSubjectId(animr5)];
        val2 = gEfxPairHpBufOffset[GetAISSubjectId(animr5)];
        val2++;
    
        val1 = GetEfxHp(val1 * 2 + GetAISSubjectId(animr5));
        val2 = GetEfxHp(val2 * 2 + GetAISSubjectId(animr5));

        if (val1 != val2) {
            NewEfxHPBar(animr5);

            if (sub_805A268(animr7) == 1)
                NewEfxHitQuake(animr5, animr7, b);
            else
                NewEfxHitQuake(animr5, animr7, a);
            
            NewEfxFlashHPBar(animr5, 0, 5);
            NewEfxFlashUnit(animr5, 0, 8, 0);
        } else {
            NewEfxNoDmage(animr5, animr8, 0);
        }
        break;

    case EKR_MISS:
        NewEfxAvoid(animr5);
        break;
    }
}

void sub_8055424(struct Anim *anim, int type)
{
    int val1, val2, off;
    struct Anim *animR7, *animR5, *animR8;

    if (GetAISSubjectId(anim) == EKR_POS_L) {
        animR7 = gAnims[2];
        animR5 = gAnims[0];
        animR8 = gAnims[1];
    } else {
        animR7 = gAnims[0];
        animR5 = gAnims[2];
        animR8 = gAnims[3];
    }

    val1 = gEfxPairHpBufOffset[GetAISSubjectId(animR5)];
    val2 = gEfxPairHpBufOffset[GetAISSubjectId(animR5)];
    val2++;

    {
        val1 = GetEfxHp(val1 * 2 + GetAISSubjectId(animR5));
        val2 = GetEfxHp(val2 * 2 + GetAISSubjectId(animR5));
    }

    switch (type) {
    case EKR_HITTED:
        if (val1 != val2) {
            NewEfxHPBarResire(animR5);

            if (sub_805A268(animR7) == 1)
                NewEfxHitQuake(animR5, animR7, 4);
            else
                NewEfxHitQuake(animR5, animR7, 3);
            
            NewEfxFlashHPBar(animR5, 0, 5);
            NewEfxFlashUnit(animR5, 0, 8, 0);
        } else {
            gUnknown_02017750 = 2;
            NewEfxNoDmage(animR5, animR8, 1);
        }
        break;

    case EKR_MISS:
        NewEfxAvoid(animR5);
        break;
    }
}

void sub_8055518(struct Anim *anim, int type)
{
    struct Anim *anim1;

    if (GetAISSubjectId(anim) == EKR_POS_L)
        anim1 = gAnims[0];
    else
        anim1 = gAnims[2];

    switch (type) {
    case EKR_HITTED:
        NewEfxStatusCHG(anim1);
        break;
    
    case EKR_MISS:
        NewEfxAvoid(anim1);
        break;
    }
}

struct Anim *EfxAnimCreate(struct Anim *anim, const u32 *scr1, const u32 *scr2, const u32 *scr3, const u32 *scr4)
{
    struct Anim *anim1;

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE) {
        if (GetAISSubjectId(anim) == EKR_POS_L) {
            anim1 = AnimCreate(scr1, 0x78);
            anim1->oam2Base = 0x2840;
            anim1->xPosition = anim->xPosition;
            anim1->yPosition = anim->yPosition;
            return anim1;
        }
        else {
            anim1 = AnimCreate(scr2, 0x78);
            anim1->oam2Base = 0x2840;
            anim1->xPosition = anim->xPosition;
            anim1->yPosition = anim->yPosition;
            return anim1;
        }
    } else {
        if (GetAISSubjectId(anim) != EKR_POS_L) {
            anim1 = AnimCreate(scr4, 0x78);
            anim1->oam2Base = 0x2840;
            anim1->xPosition = anim->xPosition;
            anim1->yPosition = anim->yPosition;
            return anim1;
        }
        else {
            anim1 = AnimCreate(scr3, 0x78);
            anim1->oam2Base = 0x2840;
            anim1->xPosition = anim->xPosition;
            anim1->yPosition = anim->yPosition;
            return anim1;
        }
    }
}

struct Anim *sub_80555B0(struct Anim *anim, const u32 *scr1, const u32 *scr2, const u32 *scr3, const u32 *scr4)
{
    struct Anim *anim1;

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE) {
        if (GetAISSubjectId(anim) == EKR_POS_L) {
            anim1 = AnimCreate(scr1, 0x14);
            anim1->oam2Base = 0x2840;
            anim1->xPosition = anim->xPosition;
            anim1->yPosition = anim->yPosition;
            return anim1;
        }
        else {
            anim1 = AnimCreate(scr2, 0x14);
            anim1->oam2Base = 0x2840;
            anim1->xPosition = anim->xPosition;
            anim1->yPosition = anim->yPosition;
            return anim1;
        }
    } else {
        if (GetAISSubjectId(anim) != EKR_POS_L) {
            anim1 = AnimCreate(scr4, 0x14);
            anim1->oam2Base = 0x2840;
            anim1->xPosition = anim->xPosition;
            anim1->yPosition = anim->yPosition;
            return anim1;
        }
        else {
            anim1 = AnimCreate(scr3, 0x14);
            anim1->oam2Base = 0x2840;
            anim1->xPosition = anim->xPosition;
            anim1->yPosition = anim->yPosition;
            return anim1;
        }
    }
}

void sub_805560C(struct Anim *anim, const u16 *src1, const u16 *src2)
{
    const u16 *buf;

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        buf = src1;
    else
        buf = src2;

    if (GetAISSubjectId(anim) == EKR_POS_L)
        sub_8070EC4(buf, gBG1TilemapBuffer, 0x1E, 0x14, 1, 0x100);
    else
        sub_8070E94(buf, gBG1TilemapBuffer, 0x1E, 0x14, 1, 0x100);
    
    BG_EnableSyncByMask(BG1_SYNC_BIT);
}

void sub_8055670(struct Anim *anim, const u16 *src1, const u16 *src2)
{
    u16 *buf;

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        LZ77UnCompWram(src1, gEkrTsaBuffer);
    else
        LZ77UnCompWram(src2, gEkrTsaBuffer);
    
    buf = gEkrTsaBuffer;
    if (GetAISSubjectId(anim) == EKR_POS_L)
        sub_8070EC4(buf, gBG1TilemapBuffer, 0x1E, 0x14, 1, 0x100);
    else
        sub_8070E94(buf, gBG1TilemapBuffer, 0x1E, 0x14, 1, 0x100);
    
    BG_EnableSyncByMask(BG1_SYNC_BIT);
}

void sub_80556F0(u8 pos, const u16 *src1, const u16 *src2)
{
    const u16 *buf;

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        LZ77UnCompWram(src1, gEkrTsaBuffer);
    else
        LZ77UnCompWram(src2, gEkrTsaBuffer);
    
    buf = gEkrTsaBuffer;
    if (pos == EKR_POS_L)
        sub_8070EC4(buf, gBG1TilemapBuffer, 0x1E, 0x14, 1, 0x100);
    else
        sub_8070E94(buf, gBG1TilemapBuffer, 0x1E, 0x14, 1, 0x100);
    
    BG_EnableSyncByMask(BG1_SYNC_BIT);
}

void sub_805576C(struct Anim *anim, const u16 *src, int a, int b)
{
    LZ77UnCompWram(src, gEkrTsaBuffer);

    if (GetAISSubjectId(anim) == EKR_POS_L)
        sub_8070EC4(gEkrTsaBuffer, gBG1TilemapBuffer, a, b, 1, 0x100);
    else
        sub_8070E94(gEkrTsaBuffer, gBG1TilemapBuffer, a, b, 1, 0x100);

    BG_EnableSyncByMask(BG1_SYNC_BIT);
}

void SomeImageStoringRoutine_SpellAnim(const u16 *img, u32 size)
{
    u16 *dst = OBJ_VRAM0 + 0x0800;
    LZ77UnCompWram(img, gUnknown_0201A790);
    RegisterDataMove(gUnknown_0201A790, dst, size);
}

void SomePaletteStoringRoutine_SpellAnim(const u16 *pal, u32 size)
{
    CpuFastCopy(pal, PAL_OBJ(2), size);
    EnablePaletteSync();
}

void SomeImageStoringRoutine_SpellAnim2(const u16 *img, u32 size)
{
    u16 *dst = (void *)BG_VRAM + 0x2000;
    LZ77UnCompWram(img, gEkrImgBuffer);
    RegisterDataMove(gEkrImgBuffer, dst, size);
}

void SomePaletteStoringRoutine_SpellAnim2(const u16 *pal, u32 size)
{
    CpuFastCopy(pal, PAL_BG(1), size);
    EnablePaletteSync();
}

void sub_8055860(const u16 *src, u16 *dst, u32 a, u32 b, u32 c)
{
    u32 i;
    for (i = 0; i < c; i++, a++) {
        if (a >= b)
            a = 0;

        dst[i] = src[a];
    }
}
void sub_805588C(const u16 *src, u16 *dst, u32 a, u32 b, u32 c)
{
    u32 i;
    for (i = 0; i < c; i++, a++) {
        if (a >= b)
            a = 0;

        dst[i + 0x10] = src[a];
    }

    EnablePaletteSync();
}
void sub_80558BC(const u16 *src, u16 *dst, u32 a, u32 b, u32 c)
{
    u32 i;
    for (i = 0; i < c; i++, a++) {
        
        if (a >= b)
            a = 0;

        dst[i + 0x120] = src[a];
    }

    EnablePaletteSync();
}

/* https://decomp.me/scratch/HkBeB */
#if NONMATCHING

s16 sub_80558F4(s16 *ptime, s16 *pcount, const s16 lut[])
{
    u16 uframe, count, time;
    int iframe, ret;

    time = *ptime;
    if (time == 0) {
        count = *pcount;
        uframe = lut[count * 2];
        iframe = lut[count * 2];
    
        if (-1 == iframe)
            return -1;
        
        if (-6 == iframe)
            return -6;
    
        if (-5 == iframe)
            return -5;
        
        if (-4 == iframe)
            return -4;
        
        if (-2 == iframe) {
            *pcount = time;
            uframe = lut[0];
        } else if (-3 == iframe) {
            *pcount = count - 1;
            count = *pcount;
            uframe = lut[count * 2];
        }
    
        count = *pcount;
        time = lut[count * 2 + 1];
        count = *pcount + 1;
        *pcount = count;
        *ptime = time - 1;
        return uframe;
    }

    *ptime = time - 1;
    return -7;
}

#else
__attribute__((naked))
s16 sub_80558F4(s16 *ptime, s16 *pcount, const s16 lut[])
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        adds r5, r0, #0\n\
        adds r3, r1, #0\n\
        ldrh r0, [r5]\n\
        adds r6, r0, #0\n\
        cmp r6, #0\n\
        bne _08055970\n\
        ldrh r0, [r3]\n\
        mov ip, r0\n\
        lsls r0, r0, #2\n\
        adds r0, r0, r2\n\
        ldrh r4, [r0]\n\
        movs r7, #0\n\
        ldrsh r1, [r0, r7]\n\
        movs r0, #1\n\
        negs r0, r0\n\
        cmp r1, r0\n\
        beq _08055930\n\
        movs r0, #6\n\
        negs r0, r0\n\
        cmp r1, r0\n\
        beq _08055930\n\
        movs r0, #5\n\
        negs r0, r0\n\
        cmp r1, r0\n\
        beq _08055930\n\
        movs r0, #4\n\
        negs r0, r0\n\
        cmp r1, r0\n\
        bne _08055934\n\
    _08055930:\n\
        adds r0, r1, #0\n\
        b _08055978\n\
    _08055934:\n\
        movs r0, #2\n\
        negs r0, r0\n\
        cmp r1, r0\n\
        bne _08055942\n\
        strh r6, [r3]\n\
        ldrh r4, [r2]\n\
        b _08055958\n\
    _08055942:\n\
        movs r0, #3\n\
        negs r0, r0\n\
        cmp r1, r0\n\
        bne _08055958\n\
        mov r0, ip\n\
        subs r0, #1\n\
        strh r0, [r3]\n\
        ldrh r0, [r3]\n\
        lsls r0, r0, #2\n\
        adds r0, r0, r2\n\
        ldrh r4, [r0]\n\
    _08055958:\n\
        ldrh r0, [r3]\n\
        lsls r0, r0, #2\n\
        adds r0, r0, r2\n\
        ldrh r1, [r0, #2]\n\
        ldrh r0, [r3]\n\
        adds r0, #1\n\
        strh r0, [r3]\n\
        subs r1, #1\n\
        strh r1, [r5]\n\
        lsls r0, r4, #0x10\n\
        asrs r0, r0, #0x10\n\
        b _08055978\n\
    _08055970:\n\
        subs r0, #1\n\
        strh r0, [r5]\n\
        movs r0, #7\n\
        negs r0, r0\n\
    _08055978:\n\
        pop {r4, r5, r6, r7}\n\
        pop {r1}\n\
        bx r1\n\
        .syntax divided\n\
    ");
}
#endif

void sub_8055980(void)
{
    gUnknown_0201775C = true;
}

int GetAnimationStartFrameMaybe(void)
{
    if (gEkrDistanceType == EKR_DISTANCE_FARFAR)
        return 0x18;
    else if (gEkrDistanceType == EKR_DISTANCE_FAR)
        return 0x10;
    else
        return 0x0;
}

void sub_80559B0(u32 val)
{
    u16 *dst = gUnknown_0201C8D0;
    CpuFill32(val, dst, 0xB58);
}

void sub_80559D0(u32 val)
{
    u16 *dst = gUnknown_0201D428;
    CpuFill32(val, dst, 0x2520);
}

void SetEkrFrontAnimPostion(int pos, s16 x, s16 y)
{
    struct Anim *anim;
    u16 ux = x;
    u16 uy = y;

    if (EKR_POS_L == pos) {
        anim = gAnims[0];
        anim->xPosition = ux;
        anim->yPosition = uy;

        anim = gAnims[1];
        anim->xPosition = ux;
        anim->yPosition = uy;
    } else {
        anim = gAnims[2];
        anim->xPosition = ux;
        anim->yPosition = uy;

        anim = gAnims[3];
        anim->xPosition = ux;
        anim->yPosition = uy;
    }
}

int Get0201FAC8(void)
{
    return gUnknown_0201FAC8;
}

void Set0201FAC8(int a)
{
    gUnknown_0201FAC8 = a;
}

CONST_DATA struct ProcCmd ProcScr_efxSPDQuake[] = {
    PROC_NAME("efxSPDQuake"),
    PROC_REPEAT(sub_8055A64),
    PROC_REPEAT(sub_8055B38),
    PROC_END
};

void NewEfxspdquake(struct Anim *anim)
{
    struct ProcEfxSpdQuake *proc;
    proc = Proc_Start(ProcScr_efxSPDQuake, PROC_TREE_1);
    proc->anim = anim;
    proc->unk2C = 0;
    proc->unk44 = gUnknown_080DA4DC;
}

/* https://decomp.me/scratch/7vZUC */
#if NONMATCHING

void sub_8055A64(struct ProcEfxSpdQuake *proc)
{
    int dx = proc->unk44[proc->unk2C].x;
    int dy = proc->unk44[proc->unk2C].y;

    gAnims[0]->xPosition += dx;
    gAnims[0]->yPosition += dy;
    gAnims[1]->xPosition += dx;
    gAnims[1]->yPosition += dy;
    gAnims[2]->xPosition += dx;
    gAnims[2]->yPosition += dy;
    gAnims[3]->xPosition += dx;
    gAnims[3]->yPosition += dy;

    gLCDControlBuffer.bgoffset[2].y -= dx;
    gLCDControlBuffer.bgoffset[2].x -= dy;

    if (Get0201FAC8() == 0) {
        Proc_Break(proc);
        return;
    }

    if (Get0201FAC8() == 2) {
        proc->unk44 = gUnknown_080DA570;
        proc->unk2C = 0;
        Set0201FAC8(3);
        return;
    }

    if (proc->unk44[++proc->unk2C].x == 0x7FFF)
        proc->unk2C = 0;
}

#else
__attribute__((naked))
void sub_8055A64(struct ProcEfxSpdQuake *proc)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, r9\n\
        mov r6, r8\n\
        push {r6, r7}\n\
        adds r7, r0, #0\n\
        ldr r0, [r7, #0x44]\n\
        mov r8, r0\n\
        movs r1, #0x2c\n\
        ldrsh r0, [r7, r1]\n\
        lsls r0, r0, #2\n\
        add r0, r8\n\
        ldrh r4, [r0, #2]\n\
        ldr r3, _08055AE8  @ gAnims\n\
        ldr r6, [r3]\n\
        ldrh r1, [r6, #2]\n\
        ldrh r2, [r0]\n\
        mov ip, r2\n\
        movs r5, #0\n\
        ldrsh r2, [r0, r5]\n\
        adds r1, r2, r1\n\
        movs r0, #0\n\
        mov r9, r0\n\
        strh r1, [r6, #2]\n\
        ldrh r0, [r6, #4]\n\
        lsls r1, r4, #0x10\n\
        asrs r1, r1, #0x10\n\
        adds r0, r1, r0\n\
        strh r0, [r6, #4]\n\
        ldr r6, [r3, #4]\n\
        ldrh r0, [r6, #2]\n\
        adds r0, r2, r0\n\
        strh r0, [r6, #2]\n\
        ldrh r0, [r6, #4]\n\
        adds r0, r1, r0\n\
        strh r0, [r6, #4]\n\
        ldr r6, [r3, #8]\n\
        ldrh r0, [r6, #2]\n\
        adds r0, r2, r0\n\
        strh r0, [r6, #2]\n\
        ldrh r0, [r6, #4]\n\
        adds r0, r1, r0\n\
        strh r0, [r6, #4]\n\
        ldr r6, [r3, #0xc]\n\
        ldrh r0, [r6, #2]\n\
        adds r2, r2, r0\n\
        strh r2, [r6, #2]\n\
        ldrh r0, [r6, #4]\n\
        adds r1, r1, r0\n\
        strh r1, [r6, #4]\n\
        ldr r1, _08055AEC  @ gLCDControlBuffer\n\
        ldrh r0, [r1, #0x26]\n\
        mov r2, ip\n\
        subs r0, r0, r2\n\
        strh r0, [r1, #0x26]\n\
        ldrh r0, [r1, #0x24]\n\
        subs r0, r0, r4\n\
        strh r0, [r1, #0x24]\n\
        bl Get0201FAC8\n\
        cmp r0, #0\n\
        bne _08055AF0\n\
        adds r0, r7, #0\n\
        bl Proc_Break\n\
        b _08055B28\n\
        .align 2, 0\n\
    _08055AE8: .4byte gAnims\n\
    _08055AEC: .4byte gLCDControlBuffer\n\
    _08055AF0:\n\
        bl Get0201FAC8\n\
        cmp r0, #2\n\
        bne _08055B0C\n\
        ldr r0, _08055B08  @ gUnknown_080DA570\n\
        str r0, [r7, #0x44]\n\
        mov r5, r9\n\
        strh r5, [r7, #0x2c]\n\
        movs r0, #3\n\
        bl Set0201FAC8\n\
        b _08055B28\n\
        .align 2, 0\n\
    _08055B08: .4byte gUnknown_080DA570\n\
    _08055B0C:\n\
        ldrh r0, [r7, #0x2c]\n\
        adds r0, #1\n\
        strh r0, [r7, #0x2c]\n\
        movs r1, #0x2c\n\
        ldrsh r0, [r7, r1]\n\
        lsls r0, r0, #2\n\
        add r0, r8\n\
        movs r2, #0\n\
        ldrsh r1, [r0, r2]\n\
        ldr r0, _08055B34  @ 0x00007FFF\n\
        cmp r1, r0\n\
        bne _08055B28\n\
        mov r5, r9\n\
        strh r5, [r7, #0x2c]\n\
    _08055B28:\n\
        pop {r3, r4}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _08055B34: .4byte 0x00007FFF\n\
        .syntax divided\n\
    ");
}
#endif

void sub_8055B38(struct ProcEfxSpdQuake *proc)
{
    int x1 = gEkrXPosBase[0] - gEkrBgXOffset;
    int x2 = gEkrYPosBase[0];
    int y1 = gEkrXPosBase[1] - gEkrBgXOffset;
    int y2 = gEkrYPosBase[1];

    SetEkrFrontAnimPostion(EKR_POS_L, x1, x2);
    SetEkrFrontAnimPostion(EKR_POS_R, y1, y2);

    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
        BG_SetPosition(BG_2, 0, 0);
        break;
    
    case EKR_DISTANCE_FAR:
    case EKR_DISTANCE_FARFAR:
        sub_8053618(gEkrBgXOffset);
        break;
    }

    Proc_Break(proc);
}
