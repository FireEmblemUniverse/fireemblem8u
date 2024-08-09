#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"

void StartSpellAnimFire(struct Anim * anim)
{
    struct ProcEfx * proc;
    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxFire, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->type = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

void StartSpellAnimElfire(struct Anim * anim)
{
    struct ProcEfx * proc;
    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxFire, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->type = 1;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

struct ProcCmd CONST_DATA ProcScr_efxFire[] = {
    PROC_NAME("efxFire"),
    PROC_REPEAT(Loop6C_efxFire),
    PROC_END,
};

void Loop6C_efxFire(struct ProcEfx * proc)
{
    int r5, r7, r8, r9, time;
    struct Anim *animc = GetAnimAnotherSide(proc->anim);

    if (0 == gEkrDistanceType) {
        r5 = 0x20;
        r7 = 0x34;
        r8 = 0x36;
        r9 = 0x55;
    } else {
        r5 = 0x28;
        r7 = 0x3C;
        r8 = 0x41;
        r9 = 0x60;
    }

    if (++proc->timer == 1) {
        NewEfxFireBG(proc->anim);
        NewEfxFireOBJ(proc->anim);
        PlaySFX(0xF1, 0x100, proc->anim->xPosition, 1);
    }

    time = proc->timer;
    if (time == r5) {
        NewEfxFarAttackWithDistance(proc->anim, -1);
        return;
    }

    if (time == r7) {
        animc->state3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;
        StartBattleAnimHitEffectsDefault(animc, proc->hitted);

        if (proc->hitted != EKR_HITTED)
            return;

        if (proc->type == 0) {
            PlaySFX(0xF7, 0x100, animc->xPosition, 1);
            StartSubSpell_efxFireHITBG(animc);
        } else {
            PlaySFX(0xF8, 0x100, animc->xPosition, 1);
            StartSubSpell_efxElfireBG(animc);
            StartSubSpell_efxElfireBGCOL(animc);
            StartSubSpell_efxElfireOBJ(animc);
        }
        EfxPlayHittedSFX(animc);
        return;
    }

    if (time == r8)
        return;

    if (time == r9) {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }
}

struct ProcCmd CONST_DATA ProcScr_efxFireBG[] = {
    PROC_NAME("efxFireBG"),
    PROC_REPEAT(Loop6C_efxFireBG),
    PROC_END,
};

void NewEfxFireBG(struct Anim * anim)
{
    static const u16 frame_config[] = {
        0x0000, 0x0003, 0x0001, 0x0002, 0x0002, 0x0002, 0x0003, 0x0002,
        0x0004, 0x0002, 0x0005, 0x0002, 0x0006, 0x0002, 0x0007, 0x0002,
        0x0008, 0x0002, 0x0009, 0x0003, 0x000A, 0x0003, 0x000B, 0x0003,
        0xFFFF
    };

    static CONST_DATA u16 * tsal[] = {
        Tsa_085F6250,
        Tsa_085F62F8,
        Tsa_085F63A0,
        Tsa_085F6458,
        Tsa_085F6520,
        Tsa_085F65F0,
        Tsa_085F66F0,
        Tsa_085F67F8,
        Tsa_085F690C,
        Tsa_085F6A44,
        Tsa_085F6B48,
        Tsa_085F6C1C,
    };

    static CONST_DATA u16 * tsar[] = {
        Tsa_085F6CDC,
        Tsa_085F6D84,
        Tsa_085F6E2C,
        Tsa_085F6EE4,
        Tsa_085F6FAC,
        Tsa_085F707C,
        Tsa_085F717C,
        Tsa_085F7284,
        Tsa_085F7398,
        Tsa_085F74D0,
        Tsa_085F75D4,
        Tsa_085F76A8
    };

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxFireBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frame_config;
    proc->tsal = tsal;
    proc->tsar = tsar;

    SpellFx_RegisterBgPal(Pal_FireSpellBg, 0x20);
    SpellFx_RegisterBgGfx(Img_FireSpellBg, 0x2000);
    SpellFx_SetSomeColorEffect();
}

void Loop6C_efxFireBG(struct ProcEfxBG * proc)
{
    int ret;
    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);
    if (ret >= 0) {
        u16 **buf1 = proc->tsal;
        u16 **buf2 = proc->tsar;
        SpellFx_WriteBgMap(proc->anim, buf1[ret], buf2[ret]);
        return;
    }

    if (ret == -1) {
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SetDefaultColorEffects_();
        Proc_Break(proc);
    }
}

struct ProcCmd CONST_DATA ProcScr_efxFireOBJ[] = {
    PROC_NAME("efxFireOBJ"),
    PROC_REPEAT(EfxFireOBJ_Loop),
    PROC_END,
};

void NewEfxFireOBJ(struct Anim * anim)
{
    struct Anim *anim2;
    struct ProcEfxOBJ * proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxFireOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxFireOBJ_R_Front, AnimScr_EfxFireOBJ_L_Front, AnimScr_EfxFireOBJ_R_Back, AnimScr_EfxFireOBJ_L_Back);
    proc->anim2 = anim2;

    if (GetAnimPosition(anim) == EKR_POS_L)
        anim2->xPosition = anim->xPosition - 0x8;
    else
        anim2->xPosition = anim->xPosition + 0x8;
    
    anim2->yPosition = anim->yPosition + 0x8;

    SpellFx_RegisterObjPal(Pal_FireSpellSprites, 0x20);
    SpellFx_RegisterObjGfx(Img_FireSpellSprites, 0x1000);
}

void EfxFireOBJ_Loop(struct ProcEfxOBJ * proc)
{
    int time = ++proc->timer;
    if (time == 0x25) {
        PlaySFX(0xF2, 0x100, proc->anim->xPosition, 0x1);
        return;
    }

    if (time > 0x32) {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

struct ProcCmd CONST_DATA ProcScr_efxFireHITBG[] = {
    PROC_NAME("efxFireHITBG"),
    PROC_REPEAT(sub_805DE74),
    PROC_END,
};

const u16 FrameConfig_AnimaHitBG[] = {
    0x0000, 0x0001, 0x0001, 0x0001, 0x0002, 0x0001, 0x0003, 0x0001,
    0x0004, 0x0001, 0x0005, 0x0001, 0x0006, 0x0001, 0x0007, 0x0001,
    0x0008, 0x0001, 0x0009, 0x0001, 0x000A, 0x0001, 0x000B, 0x0001,
    0x000C, 0x0001, 0x000D, 0x0001, 0x000E, 0x0001, 0x000F, 0x0001,
    0x0010, 0x0001, 0x0011, 0x0001, 0x0012, 0x0002, 0x0013, 0x0002,
    0x0014, 0x0004, 0xFFFF
};

CONST_DATA u16 * ImgLut_AnimaHitBG[] = {
    Img_085F8494,
    Img_085F8494,
    Img_085F8494,
    Img_085F8494,
    Img_085F8494,
    Img_085F8494,
    Img_085F91D0,
    Img_085F91D0,
    Img_085F91D0,
    Img_085F9EAC,
    Img_085F9EAC,
    Img_085FACD4,
    Img_085FACD4,
    Img_085FBCC8,
    Img_085FBCC8,
    Img_085FCF64,
    Img_085FDB30,
    Img_085FE728,
    Img_085FF280,
    Img_085FFD7C,
    Img_08600784
};

CONST_DATA u16 * TsaLut_AnimaHitBG[] = {
    Tsa_086010AC,
    Tsa_08601158,
    Tsa_08601210,
    Tsa_086012DC,
    Tsa_086013BC,
    Tsa_086014B0,
    Tsa_086015C8,
    Tsa_086016F4,
    Tsa_0860182C,
    Tsa_08601970,
    Tsa_08601AC4,
    Tsa_08601C1C,
    Tsa_08601D84,
    Tsa_08601EF0,
    Tsa_0860206C,
    Tsa_08602200,
    Tsa_086023A0,
    Tsa_08602540,
    Tsa_086026E0,
    Tsa_08602880,
    Tsa_08602A10
};

void StartSubSpell_efxFireHITBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxFireHITBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = FrameConfig_AnimaHitBG;
    proc->tsal = TsaLut_AnimaHitBG;
    proc->tsar = TsaLut_AnimaHitBG;
    proc->img = ImgLut_AnimaHitBG;

    SpellFx_RegisterBgPal(Pal_EfxFireHitBG, 0x20);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        return;
    
    if (GetAnimPosition(proc->anim) == EKR_POS_L)
        BG_SetPosition(BG_1, 0x18, 0x0);
    else
        BG_SetPosition(BG_1, 0xE8, 0x0);
}

void sub_805DE74(struct ProcEfxBG * proc)
{
    int ret;
    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);
    if (ret >= 0) {
        u16 **buf1 = proc->tsal;
        u16 **buf2 = proc->tsar;
        SpellFx_RegisterBgGfx(proc->img[ret], 0x2000);
        SpellFx_WriteBgMap(proc->anim, buf1[ret], buf2[ret]);
        return;
    }

    if (ret == -1) {
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SetDefaultColorEffects_();
        Proc_End(proc);
    }
}

void StartSubSpell_efxElfireBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxElfireBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    SpellFx_RegisterBgGfx(Img_EkrElfireBG, 0x2000);
    SpellFx_WriteBgMap(proc->anim, Tsa_EkrElfireBG, Tsa_EkrElfireBG);
    SpellFx_ClearBG1Position();
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        return;
    
    if (GetAnimPosition(proc->anim) == EKR_POS_L)
        BG_SetPosition(BG_1, 0x18, 0x0);
    else
        BG_SetPosition(BG_1, 0xE8, 0x0);
    
    sub_8070DBC(TILEMAP_LOCATED(gBG1TilemapBuffer, 0x1E, 0x0), 2, 0x14, 0x1, 0x100);
}

void EfxElfireBG_Loop(struct ProcEfxBG * proc)
{
    if (++proc->timer == 0x28) {
        SpellFx_ClearBG1();
        SetDefaultColorEffects_();
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

void StartSubSpell_efxElfireBGCOL(struct Anim * anim)
{
    struct ProcEfxBGCOL * proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxElfireBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DCDE4;
    proc->pal = Pal_EkrElfireBG;
    SpellFx_RegisterBgPal(Pal_EkrElfireBG, 0x20);
}

void EfxElfireBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    int ret;
    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);
    if (ret >= 0) {
        u16 * pal = proc->pal;
        SpellFx_RegisterBgPal(&PAL_BUF_COLOR(pal, ret, 0), 0x20);
        return;
    }

    if (ret == -1) {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

void StartSubSpell_efxElfireOBJ(struct Anim * anim)
{
    struct Anim * anim2;
    struct ProcEfxOBJ * proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxElfireOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxElfireObjLeft, AnimScr_EfxElfireObjRight, AnimScr_EfxElfireObjLeft, AnimScr_EfxElfireObjRight);
    proc->anim2 = anim2;

    if (GetAnimPosition(anim) == EKR_POS_L)
        anim2->xPosition = anim2->xPosition - 0x8;
    else
        anim2->xPosition = anim2->xPosition + 0x8;
    
    anim2->oamBase = anim2->oamBase | 0x400;

    SpellFx_RegisterObjPal(Pal_EfxElfireOBJ, 0x20);
    SpellFx_RegisterObjGfx(Img_EfxElfireOBJ, 0x800);
}

void EfxElfireObj_Loop(struct ProcEfxOBJ * proc)
{
    if (++proc->timer > 0x28) {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}
