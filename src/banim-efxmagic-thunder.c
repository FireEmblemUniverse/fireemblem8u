#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"

struct ProcCmd CONST_DATA ProcScr_efxThunder[] = {
    PROC_NAME("efxThunder"),
    PROC_REPEAT(Loop6C_efxThunder),
    PROC_END,
};

void StartSpellAnimThunder(struct Anim *anim)
{
    struct ProcEfx *proc;
    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxThunder, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
}

void Loop6C_efxThunder(struct ProcEfx * proc)
{
    struct Anim *animc = GetAnimAnotherSide(proc->anim);
    int cur, frame = EfxGetCamMovDuration();

    if (++proc->timer == 1)
        NewEfxFarAttackWithDistance(proc->anim, -1);
    
    cur = proc->timer;
    if (cur == (frame + 1)) {
        NewEfxThunderBG(animc);
        NewEfxThunderBGCOL(animc);
        NewEfxThunderOBJ(animc);
        return;
    }

    if (cur == (frame + 4)) {
        animc->state3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;
        StartBattleAnimHitEffectsDefault(animc, proc->hitted);
        PlaySFX(0xF5, 0x100, animc->xPosition, 1);

        if (proc->hitted == EKR_HITTED)
            EfxPlayHittedSFX(animc);
        
        return;
    }

    if (cur == (frame + 0x50))
        return;
    
    if (cur == (frame + 0x60)) {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }
}

struct ProcCmd CONST_DATA ProcScr_efxThunderBG[] = {
    PROC_NAME("efxThunderBG"),
    PROC_REPEAT(EfxThunderBGMain),
    PROC_END,
};

void NewEfxThunderBG(struct Anim *anim)
{
    static const u16 frame_config[] = {
        0, 4, 1, 40, -1
    };

    static CONST_DATA u16 * tsa_l[] = {
        Tsa_EfxThuderBg1,
        Tsa_EfxThuderBg2
    };

    static CONST_DATA u16 * tsa_r[] = {
        Tsa_EfxThuderBg1,
        Tsa_EfxThuderBg2
    };

    struct ProcEfxBG *proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxThunderBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frame_config;
    proc->tsal = tsa_l;
    proc->tsar = tsa_r;

    SpellFx_RegisterBgGfx(Img_ThunderSpellBg, 0x10C0);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
            BG_SetPosition(BG_1, 0x18, 0x0);
        else
            BG_SetPosition(BG_1, 0xE8, 0x0);
    }
}

void EfxThunderBGMain(struct ProcEfxBG * proc)
{
    int val, ret;

    val = 0;
    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);
    if (ret >= 0) {
        u16 **buf1 = proc->tsal;
        u16 **buf2 = proc->tsar;
        SpellFx_WriteBgMap(proc->anim, buf1[ret], buf2[ret]);

        if (ret == 0)
            val = 0x11F;
        
        if (ret == 1)
            val = 0x150;
        
        FillBGRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 0x1E, 0x0), 0x2, 0x14, 0x1, val);
        return;
    }

    if (ret == -1) {
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SetDefaultColorEffects_();
        Proc_Break(proc);
    }
}

struct ProcCmd CONST_DATA ProcScr_efxThunderBGCOL[] = {
    PROC_NAME("efxThunderBGCOL"),
    PROC_MARK(10),
    PROC_REPEAT(EfxThunderBGCOL_Loop),
    PROC_END,
};

void NewEfxThunderBGCOL(struct Anim * anim)
{
    static const u16 frame_config[] = {
        0x0000, 0x0004, 0x0001, 0x0004, 0x0002, 0x0002, 0x0003, 0x0002,
        0x0004, 0x0014, 0x0005, 0x0002, 0x0006, 0x0001, 0x0007, 0x0001,
        0x0008, 0x0001, 0x0009, 0x0001, 0x000A, 0x0001, 0x000B, 0x0001,
        0x000C, 0x0001, 0x000D, 0x0001, 0x000E, 0x0001, 0x000F, 0x0001,
        -1
    };

    struct ProcEfxBGCOL *proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxThunderBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frame_config;
    proc->pal = Pal_ThunderSpellBg;
}

void EfxThunderBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    int ret;
    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);
    if (ret >= 0) {
        u16 * pal = proc->pal;
        SpellFx_RegisterBgPal(&PAL_BUF_COLOR(pal, ret, 0), 0x20);
        return;
    }

    if (ret == -1) {
        SetDefaultColorEffects_();
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

void NewEfxThunderOBJ(struct Anim *anim)
{
    struct ProcEfxOBJ *proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxThunderOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->anim2 = EfxCreateFrontAnim(anim, gUnknown_085F5550, gUnknown_085F4A24, gUnknown_085F5550, gUnknown_085F4A24);

    SpellFx_RegisterObjPal(Pal_BoltingSprites, 0x20);
    SpellFx_RegisterObjGfx(Img_BoltingSprites, 0x1000);
}

void EfxThunderOBJMain(struct ProcEfxOBJ * proc)
{
    if (++proc->timer > 0x32) {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}
