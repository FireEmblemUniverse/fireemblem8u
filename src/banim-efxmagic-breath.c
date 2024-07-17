#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxFirebreath[] =
{
    PROC_NAME("efxFirebreath"),
    PROC_REPEAT(efxFirebreath_Loop_Main),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805D064
void StartSpellAnimFireBreath(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxFirebreath, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x0805D09C
void efxFirebreath_Loop_Main(struct ProcEfx * proc)
{
    int timer;
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }

    timer = proc->timer;

    if (timer == 1)
    {
        StartSpellThing_MagicQuake(proc->anim, 90, 10);

        StartSubSpell_efxFirebreathOBJ(anim);
        StartSubSpell_efxFirebreathBG(anim);
        StartSubSpell_efxFirebreathBGCOL(anim);

        NewEfxALPHA(anim, 40, 15, 16, 0, 0);

        PlaySFX(0x11D, 0x100, anim->xPosition, 1);
    }
    else if (timer == 15)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (timer == 130)
    {
        SpellFx_Finish();
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxFirebreathOBJ[] =
{
    PROC_NAME("efxFirebreathOBJ"),
    PROC_REPEAT(efxFirebreathOBJ_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805D14C
void StartSubSpell_efxFirebreathOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFirebreathOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 52;

    if (GetAnimPosition(anim) == 0)
    {
        scr = AnimScr_FirebreathOBJ_Left;
    }
    else
    {
        scr = AnimScr_FirebreathOBJ_Right;
    }

    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    if (gEkrDistanceType == 0)
    {
        if (GetAnimPosition(anim) == 0)
        {
            frontAnim->xPosition += 16;
        }
        else
        {
            frontAnim->xPosition -= 16;
        }
    }
    else
    {
        if (GetAnimPosition(anim) == 0)
        {
            frontAnim->xPosition += 72;
        }
        else
        {
            frontAnim->xPosition -= 72;
        }
    }

    SpellFx_RegisterObjPal(Pal_FireBreathSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BreathSprites, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x0805D1FC
void efxFirebreathOBJ_Loop(struct ProcEfxOBJ * proc)
{
    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            proc->anim2->xPosition = proc->anim->xPosition + 72;
        }
        else
        {
            proc->anim2->xPosition = proc->anim->xPosition - 72;
        }
    }

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxFirebreathBG[] =
{
    PROC_NAME("efxFirebreathBG"),
    PROC_REPEAT(efxFirebreathBG_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805D260
void StartSubSpell_efxFirebreathBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;
    u16 * tsa;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFirebreathBG, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 112;

    SpellFx_RegisterBgGfx(Img_FireBreathBg, 32 * 8 * CHR_SIZE);

    tsa = Tsa_FireBreathBg;
    SpellFx_WriteBgMap(proc->anim, tsa, tsa);

    SpellFx_ClearBG1Position();
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x0805D2B4
void efxFirebreathBG_Loop(struct ProcEfxBG * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        SpellFx_ClearBG1();
        SetDefaultColorEffects_();
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxFirebreathBGCOL[] =
{
    PROC_NAME("efxFirebreathBGCOL"),
    PROC_MARK(PROC_MARK_EFX_BGCOL),

    PROC_REPEAT(efxFirebreathBGCOL_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0805D2EC
void StartSubSpell_efxFirebreathBGCOL(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        0, 2,
        1, 2,
        2, 2,
        3, 2,
        4, 2,
        5, 2,
        6, 2,
        7, 2,
        8, 2,
        7, 2,
        6, 2,
        5, 2,
        4, 2,
        3, 2,
        4, 2,
        5, 2,
        6, 2,
        5, 2,
        4, 2,
        3, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        3, 2,
        4, 2,
        5, 2,
        6, 2,
        5, 2,
        6, 2,
        4, 2,
        3, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        2, 2,
        3, 2,
        4, 2,
        5, 2,
        6, 2,
        7, 2,
        8, 2,
        7, 2,
        6, 2,
        5, 2,
        4, 2,
        3, 2,
        2, 2,
        1, 2,
        0, 6,
        -1,
    };
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFirebreathBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->pal = Pal_FireBreathBg;

    return;
}

//! FE8U = 0x0805D328
void efxFirebreathBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        CpuFastSet(proc->pal, gEfxPal, 8);
        EfxPalWhiteInOut(gEfxPal, 0, 1, ret);
        SpellFx_RegisterBgPal(gEfxPal, PLTT_SIZE_4BPP);
    }
    else
    {
        if (ret == -1)
        {
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxIcebreath[] =
{
    PROC_NAME("efxIcebreath"),
    PROC_REPEAT(efxIcebreath_Loop_Main),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805D388
void StartSpellAnimIceBreath(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxIcebreath, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x0805D3C4
void efxIcebreath_Loop_Main(struct ProcEfx * proc)
{
    int timer;
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 1)
    {
        StartSpellThing_MagicQuake(proc->anim, 90, 10);
        StartSubSpell_efxIcebreathOBJ(proc->anim);

        PlaySFX(0x11e, 0x100, anim->xPosition, 1);
    }

    timer = proc->timer;

    if (timer == 4)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (timer == 50)
    {
        return;
    }
    else if (timer == 60)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxIcebreathOBJ[] =
{
    PROC_NAME("efxIcebreathOBJ"),

    PROC_SET_END_CB(efxIcebreathOBJ_OnEnd),
    PROC_SLEEP(52),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0805D444
void StartSubSpell_efxIcebreathOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scrA;
    u32 * scrB;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxIcebreathOBJ, PROC_TREE_3);
    proc->anim = anim;

    scrB = AnimScr_IcebreathOBJ_Right;
    scrA = AnimScr_IcebreathOBJ_Left;
    frontAnim = EfxCreateFrontAnim(anim, scrA, scrB, scrA, scrB);
    proc->anim2 = frontAnim;

    if (GetAnimPosition(anim) == 0)
    {
        frontAnim->xPosition += 32;
    }
    else
    {
        frontAnim->xPosition -= 32;
    }

    SpellFx_RegisterObjPal(Pal_IceBreathSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BreathSprites, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x0805D4B8
void efxIcebreathOBJ_OnEnd(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxDarkbreath[] =
{
    PROC_NAME("efxDarkbreath"),
    PROC_REPEAT(efxDarkbreath_Loop_Main),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805D4D0
void StartSpellAnimDarkBreath(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxDarkbreath, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x0805D508
void efxDarkbreath_Loop_Main(struct ProcEfx * proc)
{
    int timer;
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);

        StartSpellThing_MagicQuake(proc->anim, 90, 10);
        StartSubSpell_efxDarkbreathBG(proc->anim);
        StartSubSpell_efxDarkbreathBGCOL(proc->anim);
        StartSubSpell_efxDarkbreathOBJ(proc->anim);

        PlaySFX(0x11F, 0x100, anim->xPosition, 1);
    }

    timer = proc->timer;

    if (timer == 4)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (timer == 32)
    {
        return;
    }
    else if (timer == 48)
    {
        SpellFx_Finish();
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxDarkbreathBG[] =
{
    PROC_NAME("efxDarkbreathBG"),
    PROC_REPEAT(efxDarkbreathBG_Loop),
    PROC_END,
};

u16 * CONST_DATA TsaArray_DarkBreathBg[] =
{
    Tsa_085E64D8,
    Tsa_085E65C0,
    Tsa_085E667C,
    Tsa_085E6778,
    Tsa_085E6860,
    Tsa_085E6948,
    Tsa_085E6A44,
    Tsa_085E6B70,
    Tsa_085E6CA4,
    Tsa_085E6D68,
    Tsa_085E6E94,
    Tsa_085E6F90,
};

// clang-format on

//! FE8U = 0x0805D59C
void StartSubSpell_efxDarkbreathBG(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        11, 12,
         0,  2,
         1,  2,
         2,  2,
         1,  2,
         3,  2,
         4,  2,
         5,  2,
         6,  2,
        11,  2,
         7,  2,
         8,  2,
        11,  2,
         9,  2,
        10,  2,
         8,  2,
        11, 10,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDarkbreathBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_DarkBreathBg;
    proc->tsar = TsaArray_DarkBreathBg;

    SpellFx_RegisterBgGfx(Img_DarkBreathBg, 32 * 8 * CHR_SIZE);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x0805D5EC
void efxDarkbreathBG_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();
            gEfxBgSemaphore--;
            SetDefaultColorEffects_();
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxDarkbreathBGCOL[] =
{
    PROC_NAME("efxDarkbreathBGCOL"),
    PROC_MARK(PROC_MARK_EFX_BGCOL),

    PROC_REPEAT(efxDarkbreathBGCOL_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0805D644
void StartSubSpell_efxDarkbreathBGCOL(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        -1,
    };
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDarkbreathBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    proc->pal = Pal_BoltingBg;

    return;
}

//! FE8U = 0x0805D680
void efxDarkbreathBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * pal = proc->pal;
        SpellFx_RegisterBgPal(pal + ret * 0x10, PLTT_SIZE_4BPP);
    }
    else
    {
        if (ret == -1)
        {
            SetDefaultColorEffects_();
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxDarkbreathOBJ[] =
{
    PROC_NAME("efxDarkbreathOBJ"),
    PROC_REPEAT(efxDarkbreathOBJ_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805D6CC
void StartSubSpell_efxDarkbreathOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDarkbreathOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 55;

    frontAnim = EfxCreateFrontAnim(anim, AnimScr_DarkBreath_Close, AnimScr_DarkBreath_Close, AnimScr_DarkBreath_Far, AnimScr_DarkBreath_Far);
    proc->anim2 = frontAnim;

    proc->unk32 = 20;
    proc->unk3A = -4;

    if (gEkrDistanceType != 0)
    {
        proc->unk32 = 44;
    }

    if (GetAnimPosition(anim) == 0)
    {
        frontAnim->xPosition += proc->unk32;
        frontAnim->yPosition += proc->unk3A;
    }
    else
    {
        frontAnim->xPosition -= proc->unk32;
        frontAnim->yPosition += proc->unk3A;
    }

    SpellFx_RegisterObjPal(Pal_DarkBreathSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BreathSprites, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x0805D774
void efxDarkbreathOBJ_Loop(struct ProcEfxOBJ * proc)
{
    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            proc->anim2->xPosition = proc->anim->xPosition + proc->unk32;
        }
        else
        {
            proc->anim2->xPosition = proc->anim->xPosition - proc->unk32;
        }
    }

    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}
