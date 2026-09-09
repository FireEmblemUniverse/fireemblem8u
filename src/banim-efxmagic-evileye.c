#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxEvilEye[] =
{
    PROC_NAME("efxEvilEye"),
    PROC_REPEAT(efxEvilEye_Loop_Main),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08067798
void StartSpellAnimEvilEye(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxEvilEye, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x080677D4
void efxEvilEye_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else if (proc->timer == duration + 2)
    {
        PlaySFX(0x3C6, 0x100, anim->xPosition, 1);
        StartSubSpell_efxEvilEyeOBJ(anim, 60);
    }
    else if (proc->timer == duration + 26)
    {
        StartSubSpell_efxEvilEyeBG(anim);
    }
    else if (proc->timer == duration + 88)
    {
        StartSubSpell_efxEvilEyeBG2(anim);
    }
    else if (proc->timer == duration + 90)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 116)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxEvilEyeBG[] =
{
    PROC_NAME("efxEvilEyeBG"),
    PROC_REPEAT(efxEvilEyeBG_Loop),
    PROC_END,
};

u16 * CONST_DATA ImgArray_EvilEyeBg1[] =
{
    Img_EvilEye_0,
    Img_EvilEye_1,
    Img_EvilEye_2,
    Img_EvilEye_3,
    Img_EvilEye_4,
    Img_EvilEye_5,
    Img_EvilEye_6,
    Img_EvilEye_7,
    Img_EvilEye_8,
    Img_EvilEye_9,
    Img_EvilEye_10,
    Img_EvilEye_11,
    Img_EvilEye_12,
    Img_EvilEye_13,
    Img_EvilEye_14,
    Img_EvilEye_15,
    Img_EvilEye_16,
    Img_EvilEye_17,
    Img_EvilEye_18,
    Img_EvilEye_19,
};

u16 * CONST_DATA TsaArray_EvilEyeBg1[] =
{
    Tsa_EvilEye_0,
    Tsa_EvilEye_1,
    Tsa_EvilEye_2,
    Tsa_EvilEye_3,
    Tsa_EvilEye_4,
    Tsa_EvilEye_5,
    Tsa_EvilEye_6,
    Tsa_EvilEye_7,
    Tsa_EvilEye_8,
    Tsa_EvilEye_9,
    Tsa_EvilEye_10,
    Tsa_EvilEye_11,
    Tsa_EvilEye_12,
    Tsa_EvilEye_13,
    Tsa_EvilEye_14,
    Tsa_EvilEye_15,
    Tsa_EvilEye_16,
    Tsa_EvilEye_17,
    Tsa_EvilEye_18,
    Tsa_EvilEye_19,
};

u16 * CONST_DATA PalArray_EvilEyeBg1[] =
{
    Pal_EvilEye_0,
    Pal_EvilEye_1,
    Pal_EvilEye_2,
    Pal_EvilEye_3,
    Pal_EvilEye_4,
    Pal_EvilEye_5,
    Pal_EvilEye_6,
    Pal_EvilEye_7,
    Pal_EvilEye_8,
    Pal_EvilEye_9,
    Pal_EvilEye_10,
    Pal_EvilEye_11,
    Pal_EvilEye_12,
    Pal_EvilEye_13,
    Pal_EvilEye_14,
    Pal_EvilEye_15,
    Pal_EvilEye_16,
    Pal_EvilEye_17,
    Pal_EvilEye_18,
    Pal_EvilEye_19,
};

// clang-format on

//! FE8U = 0x0806788C
void StartSubSpell_efxEvilEyeBG(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        0, 3,
        1, 3,
        2, 3,
        3, 3,
        4, 3,
        5, 3,
        6, 3,
        7, 3,
        8, 3,
        9, 3,
        10, 3,
        11, 3,
        12, 3,
        13, 3,
        14, 3,
        15, 3,
        16, 3,
        17, 3,
        18, 3,
        19, 3,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxEvilEyeBG, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_EvilEyeBg1;
    proc->tsar = TsaArray_EvilEyeBg1;
    proc->img = ImgArray_EvilEyeBg1;
    proc->pal = PalArray_EvilEyeBg1;

    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            BG_SetPosition(BG_1, 232, 0);
        }
        else
        {
            BG_SetPosition(BG_1, 24, 0);
        }
    }

    return;
}

//! FE8U = 0x08067914
void efxEvilEyeBG_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;
        u16 ** pal = proc->pal;

        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        SpellFx_RegisterBgPal(*(pal + ret), PLTT_SIZE_4BPP);
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();
            gEfxBgSemaphore--;
            SetDefaultColorEffects_();
            Proc_End(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxEvilEyeBG2[] =
{
    PROC_NAME("efxEvilEyeBG2"),
    PROC_REPEAT(efxEvilEyeBG2_Loop),
    PROC_END,
};

u16 * CONST_DATA ImgArray_EvilEyeBg2[] =
{
    Img_EvilEye_20,
    Img_EvilEye_21,
    Img_EvilEye_22,
    Img_EvilEye_23,
    Img_EvilEye_24,
    Img_EvilEye_25,
};

u16 * CONST_DATA TsaArray_EvilEyeBg2_Close[] =
{
    Tsa_EvilEye_20,
    Tsa_EvilEye_21,
    Tsa_EvilEye_22,
    Tsa_EvilEye_23,
    Tsa_EvilEye_24,
    Tsa_EvilEye_25,
};

u16 * CONST_DATA TsaArray_EvilEyeBg2_Far[] =
{
    Tsa_EvilEye_20,
    Tsa_EvilEye_21,
    Tsa_EvilEyeBg2_Far_0,
    Tsa_EvilEyeBg2_Far_1,
    Tsa_EvilEyeBg2_Far_2,
    Tsa_EvilEyeBg2_Far_3,
};

u16 * CONST_DATA PalArray_EvilEyeBg2[] =
{
    Pal_EvilEyeBg2_A,
    Pal_EvilEye_20,
    Pal_EvilEye_21,
    Pal_EvilEye_22,
    Pal_EvilEye_23,
    Pal_EvilEye_24,
};

// clang-format on

//! FE8U = 0x08067984
void StartSubSpell_efxEvilEyeBG2(struct Anim * anim)
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
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxEvilEyeBG2, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
    {
        proc->tsal = TsaArray_EvilEyeBg2_Far;
        proc->tsar = TsaArray_EvilEyeBg2_Far;
    }
    else
    {
        proc->tsal = TsaArray_EvilEyeBg2_Close;
        proc->tsar = TsaArray_EvilEyeBg2_Close;
    }

    proc->img = ImgArray_EvilEyeBg2;
    proc->pal = PalArray_EvilEyeBg2;

    SpellFx_RegisterBgPal(Pal_EvilEyeBg2_A, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            BG_SetPosition(BG_1, 232, 0);
        }
        else
        {
            BG_SetPosition(BG_1, 24, 0);
        }
    }

    return;
}

//! FE8U = 0x08067A30
void efxEvilEyeBG2_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;
        u16 ** pal = proc->pal;

        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        SpellFx_RegisterBgPal(*(pal + ret), PLTT_SIZE_4BPP);
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();
            gEfxBgSemaphore--;
            SetDefaultColorEffects_();
            Proc_End(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxEvilEyeOBJ[] =
{
    PROC_NAME("efxEvilEyeOBJ"),
    PROC_REPEAT(efxEvilEyeOBJ_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08067AA0
void StartSubSpell_efxEvilEyeOBJ(struct Anim * anim, int terminator)
{
    u8 pos;
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    // clang-format off
    u32 * sEvilEyeObjAnimScrLut[2] =
    {
        AnimScr_Banim_0,
        AnimScr_Banim_1,
    };
    // clang-format on

    pos = GetAnimPosition(anim);

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxEvilEyeOBJ, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    scr = sEvilEyeObjAnimScrLut[pos];

    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;
    frontAnim->yPosition += 24;
    frontAnim->timer = 0;
    frontAnim->drawLayerPriority = 20;

    AnimSort();

    SpellFx_RegisterObjPal(Pal_Banim_6, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_Banim_15, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x08067B48
void efxEvilEyeOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}
