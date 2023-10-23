#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "proc.h"

/**
 * Hit effect for normal atk, pierce and ctr atk
 */

void NewEfxDamageMojiEffect(struct Anim *anim, int hitted)
{
    struct ProcEfx *proc;
    proc = Proc_Start(ProcScr_efxDamageMojiEffect, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = hitted;
    LZ77UnCompVram(gUnknown_085BA0B8, OBJ_VRAM0 + 0x2000);
}

void efxDamageMojiEffectMain(struct ProcEfx *proc)
{
    int time = ++proc->timer;
    if (time == 1) {
        NewEfxDamageMojiEffectOBJ(proc->anim, proc->hitted);
        return;
    }

    if (time == 0xA) {
        Proc_Break(proc);
        return;
    }
}

void NewEfxDamageMojiEffectOBJ(struct Anim *anim, int hitted)
{
    u16 val1;
    u32 * anim_scr;
    struct ProcEfxDamageMojiEffectOBJ *proc;
    proc = Proc_Start(ProcScr_efxDamageMojiEffectOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    if (hitted == 0) {
        proc->terminator = 0x32;
        anim_scr = AnimScr_085C81A4;
    } else {
        proc->terminator = 0x32;
        anim_scr = AnimScr_085C8218;
    }

    val1 = GetAnimPosition(anim) == EKR_POS_L ? 0x6100 : 0x5100;
    proc->sub_proc = NewEkrsubAnimeEmulator(
        anim->xPosition,
        anim->yPosition - 0x28,
        anim_scr,
        2, val1, 0, PROC_TREE_3
    );
}

void efxDamageMojiEffectOBJMain(struct ProcEfxDamageMojiEffectOBJ *proc)
{
    proc->sub_proc->x1 = proc->anim->xPosition;

    if (++proc->timer > proc->terminator) {
        Proc_End(proc->sub_proc);
        Proc_Break(proc);
    }
}

void NewEfxPierceCritical(struct Anim * anim)
{
    struct ProcEfx * proc;
    struct Anim * anim1 = GetAnimAnotherSide(anim);
    int is_pierce;

    is_pierce = GetRoundFlagByAnim(anim1) & ANIM_ROUND_PIERCE;
    if (is_pierce != 0) {
        NewEfxPierceCriticalEffect(anim);
    } else {
        SpellFx_ClearBG1Position();
        proc = Proc_Start(ProcScr_efxCriricalEffect, PROC_TREE_3);
        proc->anim = anim;
        proc->timer = 0;
    }
}

void efxCriricalEffectMain(struct ProcEfx *proc)
{
    int time = ++proc->timer;
    if (time == 1) {
        NewEfxCriricalEffectBG(proc->anim);
        NewEfxCriricalEffectBGCOL(proc->anim);
        return;
    }

    if (time == 0x11)
        Proc_Break(proc);
}

void NewEfxCriricalEffectBG(struct Anim *anim)
{
    struct ProcEfxBG *proc;
    proc = Proc_Start(ProcScr_efxCriricalEffectBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    SpellFx_RegisterBgGfx(gUnknown_085E7028, 0x2000);
    SpellFx_RegisterBgPal(gUnknown_085E8108, 0x20);
    SpellFx_WriteBgMap(proc->anim, gUnknown_085E8308, gUnknown_085E87A8);
    SpellFx_SetSomeColorEffect();
}

void efxCriricalEffectBGMain(struct ProcEfxBG *proc)
{
    if (++proc->timer == 0x11) {
        SpellFx_ClearBG1();
        SetDefaultColorEffects_();
        Proc_Break(proc);
    }
}

void NewEfxCriricalEffectBGCOL(struct Anim *anim)
{
    struct ProcEfxBGCOL *proc;
    proc = Proc_Start(ProcScr_efxCriricalEffectBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DF188;
    proc->pal = gUnknown_085E8108;
}

void efxCriricalEffectBGCOLMain(struct ProcEfxBGCOL *proc)
{
    int ret;
    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);
    if (ret >= 0) {
        u16 *pal = proc->pal;
        SpellFx_RegisterBgPal(&PAL_BUF_COLOR(pal, ret, 0), 0x20);
        return;
    }

    if (ret == -1) {
        Proc_Break(proc);
        return;
    }
}

void NewEfxNormalEffect(struct Anim *anim)
{
    struct ProcEfx *proc;
    int is_pierce;

    SpellFx_ClearBG1Position();
    is_pierce = GetRoundFlagByAnim(anim) & ANIM_ROUND_PIERCE;
    if (is_pierce != 0) {
        NewEfxPierceNormalEffect(anim);
    } else {
        proc = Proc_Start(ProcScr_efxNormalEffect, PROC_TREE_3);
        proc->anim = anim;
        proc->timer = 0;
    }
}

void efxNormalEffectMain(struct ProcEfx *proc)
{
    int time;
    struct Anim *anim1 = GetAnimAnotherSide(proc->anim);

    time = ++proc->timer;

    if (time == 1) {
        NewEfxFlashBgWhite(proc->anim, 0x4);
        return;
    }

    if (time == 0x4) {
        NewEfxNormalEffectBG(anim1);
        return;
    }

    if (time == 0x18) {
        Proc_Break(proc);
        return;
    }
}

void NewEfxNormalEffectBG(struct Anim *anim)
{
    struct ProcEfxBG *proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxNormalEffectBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DF1EE;
    proc->tsal = gUnknown_085D8DF4;
    proc->tsar = gUnknown_085D8DF4;
    
    SpellFx_RegisterBgPal(gUnknown_085E9150, 0x20);
    SpellFx_RegisterBgGfx(gUnknown_085E8D88, 0x2000);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
            BG_SetPosition(BG_1, 0x18, 0);
        else
            BG_SetPosition(BG_1, 0xE8, 0);
    }
}

void efxNormalEffectBGMain(struct ProcEfxBG *proc)
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

void NewEfxPierceCriticalEffect(struct Anim *anim)
{
    struct ProcEfx *proc;
    SpellFx_ClearBG1Position();
    proc = Proc_Start(ProcScr_efxPierceCriticalEffect, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

void efxPierceCriticalEffectMain(struct ProcEfxBG *proc)
{
    int time = ++proc->timer;
    if (time == 1) {
        NewEfxPierceCriticalEffectBG(proc->anim);
        NewEfxPierceCriticalEffectBGCOL(proc->anim);
        return;
    }

    if (time == 0x11)
        Proc_Break(proc);
}

void NewEfxPierceCriticalEffectBG(struct Anim *anim)
{
    struct ProcEfxBG *proc;
    proc = Proc_Start(ProcScr_efxPierceCriticalEffectBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    SpellFx_RegisterBgGfx(gUnknown_085CFB70, 0x2000);
    SpellFx_RegisterBgPal(gUnknown_085D0820, 0x20);
    SpellFx_WriteBgMap(proc->anim, gUnknown_085D0A20, gUnknown_085D0CE0);
    SpellFx_SetSomeColorEffect();
}

void efxPierceCriticalEffectBGMain(struct ProcEfxBG *proc)
{
    if (++proc->timer == 0x11) {
        SpellFx_ClearBG1();
        SetDefaultColorEffects_();
        Proc_Break(proc);
    }
}

void NewEfxPierceCriticalEffectBGCOL(struct Anim * anim)
{
    struct ProcEfxBGCOL *proc;
    proc = Proc_Start(ProcScr_efxPierceCriticalEffectBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DF26A;
    proc->pal = gUnknown_085D0820;
}

void efxPierceCriticalEffectBGCOLMain(struct ProcEfxBGCOL * proc)
{
    int ret;
    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);
    if (ret >= 0) {
        u16 * pal = proc->pal;
        SpellFx_RegisterBgPal(&PAL_BUF_COLOR(pal, ret, 0), 0x20);
        return;
    }

    if (ret == -1) {
        Proc_Break(proc);
        return;
    }
}

void NewEfxPierceNormalEffect(struct Anim *anim)
{
    struct ProcEfx *proc;
    SpellFx_ClearBG1Position();
    proc = Proc_Start(ProcScr_efxPierceNormalEffect, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

void efxPierceNormalEffectMain(struct ProcEfx *proc)
{
    int time;
    struct Anim *anim1 = GetAnimAnotherSide(proc->anim);

    time = ++proc->timer;

    if (time == 0x1) {
        NewEfxFlashBgWhite(proc->anim, 0x4);
        return;
    }

    if (time == 0x4) {
        NewEfxPierceNormalEffectBG(anim1);
        return;
    }

    if (time == 0x18) {
        Proc_Break(proc);
        return;
    }
}

void NewEfxPierceNormalEffectBG(struct Anim *anim)
{
    struct ProcEfxBG *proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxPierceNormalEffectBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DF2DC;
    proc->tsal = gUnknown_085D8E9C;
    proc->tsar = gUnknown_085D8E9C;
    
    SpellFx_RegisterBgPal(gUnknown_085D1470, 0x20);
    SpellFx_RegisterBgGfx(gUnknown_085D0FD0, 0x2000);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
            BG_SetPosition(BG_1, 0x18, 0);
        else
            BG_SetPosition(BG_1, 0xE8, 0);
    }
}

void efxPierceNormalEffectBGMain(struct ProcEfxBG *proc)
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
