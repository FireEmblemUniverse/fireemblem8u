#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "proc.h"

/**
 * Hit effect for normal atk, pierce and ctr atk
 */

CONST_DATA struct ProcCmd ProcScr_efxDamageMojiEffect[] = {
    PROC_NAME("efxDamageMojiEffect"),
    PROC_REPEAT(efxDamageMojiEffectMain),
    PROC_END
};

void NewEfxDamageMojiEffect(struct Anim * anim, int hitted)
{
    struct ProcEfx * proc;
    proc = Proc_Start(ProcScr_efxDamageMojiEffect, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = hitted;
    LZ77UnCompVram(Img_NODAMGEMIS, OBJ_VRAM0 + 0x2000);
}

void efxDamageMojiEffectMain(struct ProcEfx * proc)
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

CONST_DATA struct ProcCmd ProcScr_efxDamageMojiEffectOBJ[] = {
    PROC_NAME("efxDamageMojiEffectOBJ"),
    PROC_REPEAT(efxDamageMojiEffectOBJMain),
    PROC_END
};

void NewEfxDamageMojiEffectOBJ(struct Anim * anim, int hitted)
{
    u16 val1;
    u32 * anim_scr;
    struct ProcEfxDamageMojiEffectOBJ * proc;
    proc = Proc_Start(ProcScr_efxDamageMojiEffectOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    if (hitted == 0) {
        proc->terminator = 0x32;
        anim_scr = AnimScr_NoDamage;
    } else {
        proc->terminator = 0x32;
        anim_scr = AnimScr_Miss;
    }

    val1 = GetAnimPosition(anim) == EKR_POS_L ? 0x6100 : 0x5100;
    proc->sub_proc = NewEkrsubAnimeEmulator(
        anim->xPosition,
        anim->yPosition - 0x28,
        anim_scr,
        2, val1, 0, PROC_TREE_3
    );
}

void efxDamageMojiEffectOBJMain(struct ProcEfxDamageMojiEffectOBJ * proc)
{
    proc->sub_proc->x1 = proc->anim->xPosition;

    if (++proc->timer > proc->terminator) {
        Proc_End(proc->sub_proc);
        Proc_Break(proc);
    }
}

CONST_DATA struct ProcCmd ProcScr_efxCriricalEffect[] = {
    PROC_NAME("efxCriticalEffect"),
    PROC_REPEAT(efxCriricalEffectMain),
    PROC_END
};

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

void efxCriricalEffectMain(struct ProcEfx * proc)
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

CONST_DATA struct ProcCmd ProcScr_efxCriricalEffectBG[] = {
    PROC_NAME("efxCriticalEffectBG"),
    PROC_REPEAT(efxCriricalEffectBGMain),
    PROC_END
};

void NewEfxCriricalEffectBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;
    proc = Proc_Start(ProcScr_efxCriricalEffectBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    SpellFx_RegisterBgGfx(gUnknown_085E7028, 0x2000);
    SpellFx_RegisterBgPal(Pal_085E8108, 0x20);
    SpellFx_WriteBgMap(proc->anim, gUnknown_085E8308, gUnknown_085E87A8);
    SpellFx_SetSomeColorEffect();
}

void efxCriricalEffectBGMain(struct ProcEfxBG * proc)
{
    if (++proc->timer == 0x11) {
        SpellFx_ClearBG1();
        SetDefaultColorEffects_();
        Proc_Break(proc);
    }
}

CONST_DATA struct ProcCmd ProcScr_efxCriricalEffectBGCOL[] = {
    PROC_NAME("efxCriticalEffectBGCOL"),
    PROC_MARK(PROC_MARK_EFX_BGCOL),
    PROC_REPEAT(efxCriricalEffectBGCOLMain),
    PROC_END
};

void NewEfxCriricalEffectBGCOL(struct Anim * anim)
{
    static const u16 frams[] = {
        0x0, 1,
        0x1, 1,
        0x2, 1,
        0x3, 1,
        0x4, 1,
        0x5, 1,
        0x6, 1,
        0x7, 1,
        0x8, 1,
        0x9, 1,
        0xA, 1,
        0xB, 1,
        0xC, 1,
        0xD, 1,
        0xE, 1,
        0xF, 1,
        -1
    };

    struct ProcEfxBGCOL * proc;
    proc = Proc_Start(ProcScr_efxCriricalEffectBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frams;
    proc->pal = Pal_085E8108;
}

void efxCriricalEffectBGCOLMain(struct ProcEfxBGCOL * proc)
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

CONST_DATA struct ProcCmd ProcScr_efxNormalEffect[] = {
    PROC_NAME("efxNormalEffect"),
    PROC_REPEAT(efxNormalEffectMain),
    PROC_END
};

void NewEfxNormalEffect(struct Anim * anim)
{
    struct ProcEfx * proc;
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

void efxNormalEffectMain(struct ProcEfx * proc)
{
    int time;
    struct Anim * anim1 = GetAnimAnotherSide(proc->anim);

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

CONST_DATA struct ProcCmd ProcScr_efxNormalEffectBG[] = {
    PROC_NAME("efxNormalEffectBG"),
    PROC_REPEAT(efxNormalEffectBGMain),
    PROC_END
};

CONST_DATA u16 * TSAs_EfxNormalEffectBG[] = {
    Tsa1_EfxNormalEffectBG,
    Tsa2_EfxNormalEffectBG,
    Tsa3_EfxNormalEffectBG,
    Tsa4_EfxNormalEffectBG,
    Tsa5_EfxNormalEffectBG,
    Tsa6_EfxNormalEffectBG,
    Tsa7_EfxNormalEffectBG,
    Tsa8_EfxNormalEffectBG,
    Tsa9_EfxNormalEffectBG,
    TsaA_EfxNormalEffectBG,
};

void NewEfxNormalEffectBG(struct Anim * anim)
{
    static const u16 frames[] = {
        0, 2,
        1, 2,
        2, 2,
        3, 2,
        4, 2,
        5, 2,
        6, 1,
        7, 1,
        8, 1,
        9, 1,
        -1
    };

    struct ProcEfxBG * proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxNormalEffectBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;
    proc->tsal = TSAs_EfxNormalEffectBG;
    proc->tsar = TSAs_EfxNormalEffectBG;

    SpellFx_RegisterBgPal(Pal_EfxNormalEffectBG, 0x20);
    SpellFx_RegisterBgGfx(Img_EfxNormalEffectBG, 0x2000);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
            BG_SetPosition(BG_1, 0x18, 0);
        else
            BG_SetPosition(BG_1, 0xE8, 0);
    }
}

void efxNormalEffectBGMain(struct ProcEfxBG * proc)
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

CONST_DATA struct ProcCmd ProcScr_efxPierceCriticalEffect[] = {
    PROC_NAME("efxPierceCriticalEffect"),
    PROC_REPEAT(efxPierceCriticalEffectMain),
    PROC_END
};

void NewEfxPierceCriticalEffect(struct Anim * anim)
{
    struct ProcEfx * proc;
    SpellFx_ClearBG1Position();
    proc = Proc_Start(ProcScr_efxPierceCriticalEffect, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

void efxPierceCriticalEffectMain(struct ProcEfxBG * proc)
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

CONST_DATA struct ProcCmd ProcScr_efxPierceCriticalEffectBG[] = {
    PROC_NAME("efxPierceCriticalEffectBG"),
    PROC_REPEAT(efxPierceCriticalEffectBGMain),
    PROC_END
};

void NewEfxPierceCriticalEffectBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;
    proc = Proc_Start(ProcScr_efxPierceCriticalEffectBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    SpellFx_RegisterBgGfx(Img_EfxPierceCriticalEffectBG, 0x2000);
    SpellFx_RegisterBgPal(Pal_EfxPierceCriticalEffectBG, 0x20);
    SpellFx_WriteBgMap(proc->anim, TsaL_EfxPierceCriticalEffectBG, TsaR_EfxPierceCriticalEffectBG);
    SpellFx_SetSomeColorEffect();
}

void efxPierceCriticalEffectBGMain(struct ProcEfxBG * proc)
{
    if (++proc->timer == 0x11) {
        SpellFx_ClearBG1();
        SetDefaultColorEffects_();
        Proc_Break(proc);
    }
}

CONST_DATA struct ProcCmd ProcScr_efxPierceCriticalEffectBGCOL[] = {
    PROC_NAME("efxPierceCriticalEffectBGCOL"),
    PROC_MARK(PROC_MARK_EFX_BGCOL),
    PROC_REPEAT(efxPierceCriticalEffectBGCOLMain),
    PROC_END
};

void NewEfxPierceCriticalEffectBGCOL(struct Anim * anim)
{
    static const u16 frams[] = {
        0x0, 2,
        0x1, 1,
        0x2, 1,
        0x3, 1,
        0x4, 1,
        0x5, 1,
        0x6, 1,
        0x7, 1,
        0x8, 2,
        0x9, 2,
        0xA, 2,
        0xB, 2,
        0xC, 3,
        0xD, 3,
        0xE, 4,
        0xF, 4,
        -1
    };

    struct ProcEfxBGCOL * proc;
    proc = Proc_Start(ProcScr_efxPierceCriticalEffectBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frams;
    proc->pal = Pal_EfxPierceCriticalEffectBG;
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

CONST_DATA struct ProcCmd ProcScr_efxPierceNormalEffect[] = {
    PROC_NAME("efxPierceNormalEffect"),
    PROC_REPEAT(efxPierceNormalEffectMain),
    PROC_END
};

void NewEfxPierceNormalEffect(struct Anim * anim)
{
    struct ProcEfx * proc;
    SpellFx_ClearBG1Position();
    proc = Proc_Start(ProcScr_efxPierceNormalEffect, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

void efxPierceNormalEffectMain(struct ProcEfx * proc)
{
    int time;
    struct Anim * anim1 = GetAnimAnotherSide(proc->anim);

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

CONST_DATA struct ProcCmd ProcScr_efxPierceNormalEffectBG[] = {
    PROC_NAME("efxPierceNormalEffectBG"),
    PROC_REPEAT(efxPierceNormalEffectBGMain),
    PROC_END
};

CONST_DATA u16 * TSAs_EfxPierceNormalEffectBG[] = {
    Tsa1_EfxPierceNormalEffectBG,
    Tsa2_EfxPierceNormalEffectBG,
    Tsa3_EfxPierceNormalEffectBG,
    Tsa4_EfxPierceNormalEffectBG,
    Tsa5_EfxPierceNormalEffectBG,
    Tsa6_EfxPierceNormalEffectBG,
    Tsa7_EfxPierceNormalEffectBG,
    Tsa8_EfxPierceNormalEffectBG,
    Tsa9_EfxPierceNormalEffectBG,
    TsaA_EfxPierceNormalEffectBG,
};

void NewEfxPierceNormalEffectBG(struct Anim * anim)
{
    static const u16 frames[] = {
        0, 2,
        1, 2,
        2, 2,
        3, 2,
        4, 2,
        5, 2,
        6, 1,
        7, 1,
        8, 1,
        9, 1,
        -1
    };

    struct ProcEfxBG * proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxPierceNormalEffectBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;
    proc->tsal = TSAs_EfxPierceNormalEffectBG;
    proc->tsar = TSAs_EfxPierceNormalEffectBG;
    
    SpellFx_RegisterBgPal(Pal_EfxPierceNormalEffectBG, 0x20);
    SpellFx_RegisterBgGfx(Img_EfxPierceNormalEffectBG, 0x2000);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
            BG_SetPosition(BG_1, 0x18, 0);
        else
            BG_SetPosition(BG_1, 0xE8, 0);
    }
}

void efxPierceNormalEffectBGMain(struct ProcEfxBG * proc)
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
