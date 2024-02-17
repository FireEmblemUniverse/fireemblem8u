#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"

void StartSpellAnimFire(struct Anim *anim)
{
    struct ProcEfx *proc;
    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxFire, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->type = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

void StartSpellAnimElfire(struct Anim *anim)
{
    struct ProcEfx *proc;
    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxFire, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->type = 1;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

void Loop6C_efxFire(struct ProcEfx *proc)
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

void NewEfxFireBG(struct Anim *anim)
{
    struct ProcEfxBG *proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxFireBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DCD26;
    proc->tsal = gUnknown_085D54D0;
    proc->tsar = gUnknown_085D5500;

    SpellFx_RegisterBgPal(Pal_FireSpellBg, 0x20);
    SpellFx_RegisterBgGfx(Img_FireSpellBg, 0x2000);
    SpellFx_SetSomeColorEffect();
}

void Loop6C_efxFireBG(struct ProcEfxBG *proc)
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

void NewEfxFireOBJ(struct Anim *anim)
{
    struct Anim *anim2;
    struct ProcEfxOBJ *proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxFireOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    anim2 = EfxCreateFrontAnim(anim, gUnknown_085F843C, gUnknown_085F80B4, gUnknown_085F8468, gUnknown_085F80E0);
    proc->anim2 = anim2;

    if (GetAnimPosition(anim) == EKR_POS_L)
        anim2->xPosition = anim->xPosition - 0x8;
    else
        anim2->xPosition = anim->xPosition + 0x8;
    
    anim2->yPosition = anim->yPosition + 0x8;

    SpellFx_RegisterObjPal(Pal_FireSpellSprites, 0x20);
    SpellFx_RegisterObjGfx(Img_FireSpellSprites, 0x1000);
}

void sub_805DDA8(struct ProcEfxOBJ *proc)
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

void StartSubSpell_efxFireHITBG(struct Anim *anim)
{
    struct ProcEfxBG *proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxFireHITBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DCD72;
    proc->tsal = gUnknown_085D55B4;
    proc->tsar = gUnknown_085D55B4;
    proc->img = gUnknown_085D5560;

    SpellFx_RegisterBgPal(gUnknown_0860108C, 0x20);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        return;
    
    if (GetAnimPosition(proc->anim) == EKR_POS_L)
        BG_SetPosition(BG_1, 0x18, 0x0);
    else
        BG_SetPosition(BG_1, 0xE8, 0x0);
}

void sub_805DE74(struct ProcEfxBG *proc)
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

void StartSubSpell_efxElfireBG(struct Anim *anim)
{
    struct ProcEfxBG *proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxElfireBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    SpellFx_RegisterBgGfx(gUnknown_08602B94, 0x2000);
    SpellFx_WriteBgMap(proc->anim, gUnknown_08603D50, gUnknown_08603D50);
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

void sub_805DF70(struct ProcEfxBG *proc)
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
    proc->pal = gUnknown_08603B50;
    SpellFx_RegisterBgPal(gUnknown_08603B50, 0x20);
}

void sub_805DFE8(struct ProcEfxBGCOL * proc)
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

void StartSubSpell_efxElfireOBJ(struct Anim *anim)
{
    struct Anim *anim2;
    struct ProcEfxOBJ *proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxElfireOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    anim2 = EfxCreateFrontAnim(anim, gUnknown_08605DF4, gUnknown_08604FD4, gUnknown_08605DF4, gUnknown_08604FD4);
    proc->anim2 = anim2;

    if (GetAnimPosition(anim) == EKR_POS_L)
        anim2->xPosition = anim2->xPosition - 0x8;
    else
        anim2->xPosition = anim2->xPosition + 0x8;
    
    anim2->oamBase = anim2->oamBase | 0x400;

    SpellFx_RegisterObjPal(gUnknown_08604210, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_08603F98, 0x800);
}

void sub_805E0B4(struct ProcEfxOBJ *proc)
{
    if (++proc->timer > 0x28) {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}
