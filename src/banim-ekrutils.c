#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "bmunit.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ctc.h"
#include "constants/video-banim.h"

void sub_805515C(void)
{
    return;
}

void SpellFx_Begin(void)
{
    gEfxSpellAnimExists = true;
}

void SpellFx_Finish(void)
{
    gEfxSpellAnimExists = false;
}

void SpellFx_ClearBG1Position(void)
{
    BG_SetPosition(BG_1, 0, 0);
}

void SpellFx_ClearBG1(void)
{
    CpuFastFill16(0, gBG1TilemapBuffer, 0x800);
    BG_EnableSyncByMask(BG1_SYNC_BIT);
}

void SpellFx_SetSomeColorEffect(void)
{
    SetBlendConfig(1, 0x10, 0x10, 0);
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

void StartBattleAnimHitEffectsDefault(struct Anim *anim, int type)
{
    StartBattleAnimHitEffects(anim, type, 3, 4);
}

void sub_8055288(struct Anim *anim, int type)
{
    StartBattleAnimHitEffects(anim, type, 5, 5);
}

void StartBattleAnimHitEffects(struct Anim *anim, int type, int a, int b)
{
    struct Anim *animr7, *animr9, *animr5, *animr8;
    int val1, val2;
    s16 roundt1, roundt2;

    if (GetAnimPosition(anim) == EKR_POS_L) {
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
        roundt1 = GetRoundFlagByAnim(animr7);
        roundt2 = GetRoundFlagByAnim(animr5);

        if (roundt1 & ANIM_ROUND_POISON) {
            if (GetUnitEfxDebuff(animr7) == UNIT_STATUS_NONE)
                SetUnitEfxDebuff(animr7, UNIT_STATUS_POISON);
        }

        if (roundt2 & ANIM_ROUND_POISON) {
            if (GetUnitEfxDebuff(animr5) == UNIT_STATUS_NONE)
                SetUnitEfxDebuff(animr5, UNIT_STATUS_POISON);
        }

        if (roundt1 & ANIM_ROUND_DEVIL || roundt2 & ANIM_ROUND_DEVIL) {
            struct Anim *tmp;
            tmp = animr5;
            animr5 = animr7;
            animr7 = tmp;
            animr8 = animr9;
        }

        val1 = gEfxHpLutOff[GetAnimPosition(animr5)];
        val2 = gEfxHpLutOff[GetAnimPosition(animr5)];
        val2++;
    
        val1 = GetEfxHp(val1 * 2 + GetAnimPosition(animr5));
        val2 = GetEfxHp(val2 * 2 + GetAnimPosition(animr5));

        if (val1 != val2) {
            NewEfxHPBar(animr5);

            if (CheckRoundCrit(animr7) == 1)
                NewEfxHitQuake(animr5, animr7, b);
            else
                NewEfxHitQuake(animr5, animr7, a);
            
            NewEfxFlashHPBar(animr5, 0, 5);
            NewEfxFlashUnit(animr5, 0, 8, 0);
        } else {
            NewEfxNoDamage(animr5, animr8, 0);
        }
        break;

    case EKR_MISS:
        NewEfxAvoid(animr5);
        break;
    }
}

void StartBattleAnimResireHitEffects(struct Anim * anim, int type)
{
    int val1, val2, off;
    struct Anim * animR7, * animR5, * animR8;

    if (GetAnimPosition(anim) == EKR_POS_L) {
        animR7 = gAnims[2];
        animR5 = gAnims[0];
        animR8 = gAnims[1];
    } else {
        animR7 = gAnims[0];
        animR5 = gAnims[2];
        animR8 = gAnims[3];
    }

    val1 = gEfxHpLutOff[GetAnimPosition(animR5)];
    val2 = gEfxHpLutOff[GetAnimPosition(animR5)];
    val2++;

    {
        val1 = GetEfxHp(val1 * 2 + GetAnimPosition(animR5));
        val2 = GetEfxHp(val2 * 2 + GetAnimPosition(animR5));
    }

    switch (type) {
    case EKR_HITTED:
        if (val1 != val2) {
            NewEfxHPBarResire(animR5);

            if (CheckRoundCrit(animR7) == 1)
                NewEfxHitQuake(animR5, animR7, 4);
            else
                NewEfxHitQuake(animR5, animR7, 3);
            
            NewEfxFlashHPBar(animR5, 0, 5);
            NewEfxFlashUnit(animR5, 0, 8, 0);
        } else {
            gUnknown_02017750 = 2;
            NewEfxNoDamage(animR5, animR8, 1);
        }
        break;

    case EKR_MISS:
        NewEfxAvoid(animR5);
        break;
    }
}

void StartBattleAnimStatusChgHitEffects(struct Anim * anim, int type)
{
    struct Anim * anim1;

    if (GetAnimPosition(anim) == EKR_POS_L)
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

struct Anim * EfxCreateFrontAnim(struct Anim * anim, const u32 * scr1, const u32 * scr2, const u32 * scr3, const u32 * scr4)
{
    struct Anim * anim1;

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE) {
        if (GetAnimPosition(anim) == EKR_POS_L) {
            anim1 = AnimCreate(scr1, 0x78);
            anim1->oam2Base = OAM2_PAL(0x2) + OAM2_LAYER(0x2) + OAM2_CHR(VRAMOFF_BANIM_SPELL_OBJ / 0x20);
            anim1->xPosition = anim->xPosition;
            anim1->yPosition = anim->yPosition;
            return anim1;
        }
        else {
            anim1 = AnimCreate(scr2, 0x78);
            anim1->oam2Base = OAM2_PAL(0x2) + OAM2_LAYER(0x2) + OAM2_CHR(VRAMOFF_BANIM_SPELL_OBJ / 0x20);
            anim1->xPosition = anim->xPosition;
            anim1->yPosition = anim->yPosition;
            return anim1;
        }
    } else {
        if (GetAnimPosition(anim) != EKR_POS_L) {
            anim1 = AnimCreate(scr4, 0x78);
            anim1->oam2Base = OAM2_PAL(0x2) + OAM2_LAYER(0x2) + OAM2_CHR(VRAMOFF_BANIM_SPELL_OBJ / 0x20);
            anim1->xPosition = anim->xPosition;
            anim1->yPosition = anim->yPosition;
            return anim1;
        }
        else {
            anim1 = AnimCreate(scr3, 0x78);
            anim1->oam2Base = OAM2_PAL(0x2) + OAM2_LAYER(0x2) + OAM2_CHR(VRAMOFF_BANIM_SPELL_OBJ / 0x20);
            anim1->xPosition = anim->xPosition;
            anim1->yPosition = anim->yPosition;
            return anim1;
        }
    }
}

struct Anim * EfxCreateBackAnim(struct Anim * anim, const u32 * scr1, const u32 *scr2, const u32 * scr3, const u32 * scr4)
{
    struct Anim * anim1;

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE) {
        if (GetAnimPosition(anim) == EKR_POS_L) {
            anim1 = AnimCreate(scr1, 0x14);
            anim1->oam2Base = OAM2_PAL(0x2) + OAM2_LAYER(0x2) + OAM2_CHR(VRAMOFF_BANIM_SPELL_OBJ / 0x20);
            anim1->xPosition = anim->xPosition;
            anim1->yPosition = anim->yPosition;
            return anim1;
        }
        else {
            anim1 = AnimCreate(scr2, 0x14);
            anim1->oam2Base = OAM2_PAL(0x2) + OAM2_LAYER(0x2) + OAM2_CHR(VRAMOFF_BANIM_SPELL_OBJ / 0x20);
            anim1->xPosition = anim->xPosition;
            anim1->yPosition = anim->yPosition;
            return anim1;
        }
    } else {
        if (GetAnimPosition(anim) != EKR_POS_L) {
            anim1 = AnimCreate(scr4, 0x14);
            anim1->oam2Base = OAM2_PAL(0x2) + OAM2_LAYER(0x2) + OAM2_CHR(VRAMOFF_BANIM_SPELL_OBJ / 0x20);
            anim1->xPosition = anim->xPosition;
            anim1->yPosition = anim->yPosition;
            return anim1;
        }
        else {
            anim1 = AnimCreate(scr3, 0x14);
            anim1->oam2Base = OAM2_PAL(0x2) + OAM2_LAYER(0x2) + OAM2_CHR(0x800 / 0x20);
            anim1->xPosition = anim->xPosition;
            anim1->yPosition = anim->yPosition;
            return anim1;
        }
    }
}

void sub_805560C(struct Anim * anim, const u16 * src1, const u16 * src2)
{
    const u16 * buf;

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        buf = src1;
    else
        buf = src2;

    if (GetAnimPosition(anim) == EKR_POS_L)
        EfxTmCpyBgHFlip(buf, gBG1TilemapBuffer, 30, 20, OBJPAL_BANIM_SPELL_BG, 0x100);
    else
        EfxTmCpyBG(buf, gBG1TilemapBuffer, 30, 20, OBJPAL_BANIM_SPELL_BG, 0x100);

    BG_EnableSyncByMask(BG1_SYNC_BIT);
}

void SpellFx_WriteBgMap(struct Anim * anim, const u16 * src1, const u16 * src2)
{
    u16 * buf;

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        LZ77UnCompWram(src1, gEkrTsaBuffer);
    else
        LZ77UnCompWram(src2, gEkrTsaBuffer);

    buf = gEkrTsaBuffer;
    if (GetAnimPosition(anim) == EKR_POS_L)
        EfxTmCpyBgHFlip(buf, gBG1TilemapBuffer, 30, 20, OBJPAL_BANIM_SPELL_BG, 0x100);
    else
        EfxTmCpyBG(buf, gBG1TilemapBuffer, 30, 20, OBJPAL_BANIM_SPELL_BG, 0x100);

    BG_EnableSyncByMask(BG1_SYNC_BIT);
}

void SpellFx_WriteBgMapUnused(u8 pos, const u16 * src1, const u16 * src2)
{
    const u16 * buf;

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        LZ77UnCompWram(src1, gEkrTsaBuffer);
    else
        LZ77UnCompWram(src2, gEkrTsaBuffer);

    buf = gEkrTsaBuffer;
    if (pos == EKR_POS_L)
        EfxTmCpyBgHFlip(buf, gBG1TilemapBuffer, 30, 20, OBJPAL_BANIM_SPELL_BG, 0x100);
    else
        EfxTmCpyBG(buf, gBG1TilemapBuffer, 30, 20, OBJPAL_BANIM_SPELL_BG, 0x100);

    BG_EnableSyncByMask(BG1_SYNC_BIT);
}

void SpellFx_WriteBgMapExt(struct Anim * anim, const u16 * src, int width, int height)
{
    LZ77UnCompWram(src, gEkrTsaBuffer);

    if (GetAnimPosition(anim) == EKR_POS_L)
        EfxTmCpyBgHFlip(gEkrTsaBuffer, gBG1TilemapBuffer, width, height, OBJPAL_BANIM_SPELL_BG, 0x100);
    else
        EfxTmCpyBG(gEkrTsaBuffer, gBG1TilemapBuffer, width, height, OBJPAL_BANIM_SPELL_BG, 0x100);

    BG_EnableSyncByMask(BG1_SYNC_BIT);
}

void SpellFx_RegisterObjGfx(const u16 * img, u32 size)
{
    u16 * dst = OBJ_VRAM0 + VRAMOFF_BANIM_SPELL_OBJ;
    LZ77UnCompWram(img, gBuf_Banim);
    RegisterDataMove(gBuf_Banim, dst, size);
}

void SpellFx_RegisterObjPal(const u16 * pal, u32 size)
{
    CpuFastCopy(pal, PAL_OBJ(OBJPAL_BANIM_SPELL_OBJ), size);
    EnablePaletteSync();
}

void SpellFx_RegisterBgGfx(const u16 * img, u32 size)
{
    u16 *dst = (void *)BG_VRAM + VRAMOFF_BANIM_SPELL_BG;
    LZ77UnCompWram(img, gSpellAnimBgfx);
    RegisterDataMove(gSpellAnimBgfx, dst, size);
}

void SpellFx_RegisterBgPal(const u16 * pal, u32 size)
{
    CpuFastCopy(pal, PAL_BG(OBJPAL_BANIM_SPELL_BG), size);
    EnablePaletteSync();
}

void sub_8055860(const u16 * src, u16 * dst, u32 cur, u32 len_src, u32 len_dst)
{
    u32 i;
    for (i = 0; i < len_dst; i++, cur++) {
        if (cur >= len_src)
            cur = 0;

        dst[i] = src[cur];
    }
}

void sub_805588C(const u16 * src, u16 * dst, u32 cur, u32 len_src, u32 len_dst)
{
    u32 i;
    for (i = 0; i < len_dst; i++, cur++) {
        if (cur >= len_src)
            cur = 0;

        dst[i + 0x10] = src[cur];
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

s16 EfxAdvanceFrameLut(s16 *ptime, s16 *pcount, const s16 lut[])
{
    u16 uframe;
    u16 count;
    u16 time;
    int iframe;
    u16 tmp, time2, count2;
#ifndef NONMATCHING
    register u32 r6 asm("r6");
#else
    u32 r6;
#endif

    time = *ptime;
    r6 = time;
    if (r6 == 0) {
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
            *pcount = r6;
            uframe = lut[0];
        } else if (-3 == iframe) {
            *pcount = count - 1;
            tmp = *pcount;
            uframe = lut[tmp * 2];
        }
    
        count2 = *pcount;
        time2 = lut[count2 * 2 + 1];
        ++*(vs16 *)pcount;
        *ptime = time2 - 1;
        return uframe;
    } else {
        --*ptime;
        return -7;
    }
}

void sub_8055980(void)
{
    gUnknown_0201775C = true;
}

int EfxGetCamMovDuration(void)
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
    u16 * dst = gTmA_Banim;
    CpuFill32(val, dst, sizeof(gTmA_Banim));
}

void EfxTmFill(u32 val)
{
    u16 * dst = gTmB_Banim;
    CpuFill32(val, dst, sizeof(gTmB_Banim));
}

void SetEkrFrontAnimPostion(int pos, s16 x, s16 y)
{
    struct Anim * anim;
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
    proc->timer = 0;
    proc->vecs = gEfxQuakeVecs;
}

void sub_8055A64(struct ProcEfxSpdQuake *proc)
{
    const s16 * vecs = proc->vecs;
    s16 dx = vecs[proc->timer * 2 + 0];
    s16 dy = vecs[proc->timer * 2 + 1];
    struct Anim *anim;

    anim = gAnims[0];
    anim->xPosition += dx;
    anim->yPosition += dy;
    anim = gAnims[1];
    anim->xPosition += dx;
    anim->yPosition += dy;
    anim = gAnims[2];
    anim->xPosition += dx;
    anim->yPosition += dy;
    anim = gAnims[3];
    anim->xPosition += dx;
    anim->yPosition += dy;

    gLCDControlBuffer.bgoffset[2].y -= dx;
    gLCDControlBuffer.bgoffset[2].x -= dy;

    if (Get0201FAC8() == 0) {
        Proc_Break(proc);
        return;
    }

    if (Get0201FAC8() == 2) {
        proc->vecs = gEfxQuakeVecs2;
        proc->timer = 0;
        Set0201FAC8(3);
        return;
    }

    ++proc->timer;
    if (vecs[proc->timer * 2 + 0] == 0x7FFF)
        proc->timer = 0;
}

void sub_8055B38(struct ProcEfxSpdQuake *proc)
{
    int x1 = gEkrXPosReal[0] - gEkrBgPosition;
    int x2 = gEkrYPosReal[0];
    int y1 = gEkrXPosReal[1] - gEkrBgPosition;
    int y2 = gEkrYPosReal[1];

    SetEkrFrontAnimPostion(EKR_POS_L, x1, x2);
    SetEkrFrontAnimPostion(EKR_POS_R, y1, y2);

    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
        BG_SetPosition(BG_2, 0, 0);
        break;
    
    case EKR_DISTANCE_FAR:
    case EKR_DISTANCE_FARFAR:
        sub_8053618(gEkrBgPosition);
        break;
    }

    Proc_Break(proc);
}
