#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxResire[] =
{
    PROC_NAME("efxResire"),
    PROC_REPEAT(efxResire_Loop_Main),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805F354
void StartSpellAnimNosferatu(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxResire, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x0805F390
void efxResire_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }

    if (proc->timer == duration + 1)
    {
        SetBlendAlpha(0, 16);
        NewEfxALPHA(anim, 0, 10, 0, 16, 0);
        NewEfxALPHA(anim, 35, 20, 16, 0, 0);
        StartSubSpell_efxResireBG2(anim);
        PlaySFX(0x124, 0x100, anim->xPosition, 1);
        return;
    }

    if (proc->timer == duration + 15)
    {
        StartSubSpell_efxResireRST(anim, NewefxRestRST(anim, 42, 15, 0, 2), 30);
        NewEfxRestWINH(anim, 43, gLCDControlBuffer.bgoffset[BG_1].x, 0);
        return;
    }

    if (proc->timer == duration + 60)
    {
        StartSubSpell_efxResireBG(anim, proc->hitted);
        PlaySFX(0x125, 0x100, anim->xPosition, 1);
        return;
    }

    if (proc->timer == duration + 65)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimResireHitEffects(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
            return;
        }
    }
    else if ((proc->timer != duration + 110) && (proc->timer == duration + 130))
    {
        SpellFx_Finish();
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxResireBG[] =
{
    PROC_NAME("efxResireBG"),

    PROC_REPEAT(efxResireBG_Loop_A),
    PROC_REPEAT(efxResireBG_Loop_B),
    PROC_REPEAT(efxResireBG_Loop_C),
    PROC_REPEAT(efxResireBG_Loop_D),

    PROC_END,
};

struct ProcCmd CONST_DATA ProcScr_efxResireBG2[] =
{
    PROC_NAME("efxResireBG2"),
    PROC_REPEAT(efxResireBG2_Loop),
    PROC_END,
};

u16 * CONST_DATA ImgArray_NosferatuBg[] =
{
    Img_NosferatuBg_A,
    Img_NosferatuBg_A,
    Img_NosferatuBg_A,
    Img_NosferatuBg_A,
    Img_NosferatuBg_A,
    Img_NosferatuBg_A,
    Img_NosferatuBg_A,
    Img_NosferatuBg_A,
    Img_NosferatuBg_B,
    Img_NosferatuBg_B,
    Img_NosferatuBg_B,
    Img_NosferatuBg_C,
    Img_NosferatuBg_C,
    Img_NosferatuBg_D,
    Img_NosferatuBg_D,
    Img_NosferatuBg_E,
    Img_NosferatuBg_E,
    Img_NosferatuBg_F,
    Img_NosferatuBg_F,
    Img_NosferatuBg_F,
    Img_NosferatuBg_G,
    Img_NosferatuBg_G,
    Img_NosferatuBg_G,
    Img_NosferatuBg_H,
    Img_NosferatuBg_H,
    Img_NosferatuBg_H,
    Img_NosferatuBg_H,
    Img_NosferatuBg_H,
    Img_NosferatuBg_I,
    Img_NosferatuBg_I,
    Img_NosferatuBg_I,
    Img_NosferatuBg_I,
    Img_NosferatuBg_I,
    Img_NosferatuBg_I,
    Img_NosferatuBg_I,
    Img_NosferatuBg_I,
    Img_NosferatuBg_J,
    Img_NosferatuBg_J,
    Img_NosferatuBg_J,
    Img_NosferatuBg_J,
    Img_NosferatuBg_K,
    Img_NosferatuBg_K,
    Img_NosferatuBg_K,
    Img_NosferatuBg_L,
    Img_NosferatuBg_L,
    Img_NosferatuBg_L,
    Img_NosferatuBg_M,
    Img_NosferatuBg_M,
    Img_NosferatuBg_M,
    Img_NosferatuBg_M,
    Img_NosferatuBg_M,
};

u16 * CONST_DATA TsaArray_NosferatuBg[] =
{
    Tsa_NosferatuBg_0,
    Tsa_NosferatuBg_1,
    Tsa_NosferatuBg_2,
    Tsa_NosferatuBg_3,
    Tsa_NosferatuBg_4,
    Tsa_NosferatuBg_5,
    Tsa_NosferatuBg_6,
    Tsa_NosferatuBg_7,
    Tsa_NosferatuBg_8,
    Tsa_NosferatuBg_9,
    Tsa_NosferatuBg_10,
    Tsa_NosferatuBg_11,
    Tsa_NosferatuBg_12,
    Tsa_NosferatuBg_13,
    Tsa_NosferatuBg_14,
    Tsa_NosferatuBg_15,
    Tsa_NosferatuBg_16,
    Tsa_NosferatuBg_17,
    Tsa_NosferatuBg_18,
    Tsa_NosferatuBg_19,
    Tsa_NosferatuBg_20,
    Tsa_NosferatuBg_21,
    Tsa_NosferatuBg_22,
    Tsa_NosferatuBg_23,
    Tsa_NosferatuBg_24,
    Tsa_NosferatuBg_25,
    Tsa_NosferatuBg_26,
    Tsa_NosferatuBg_27,
    Tsa_NosferatuBg_28,
    Tsa_NosferatuBg_29,
    Tsa_NosferatuBg_30,
    Tsa_NosferatuBg_31,
    Tsa_NosferatuBg_32,
    Tsa_NosferatuBg_33,
    Tsa_NosferatuBg_34,
    Tsa_NosferatuBg_35,
    Tsa_NosferatuBg_36,
    Tsa_NosferatuBg_37,
    Tsa_NosferatuBg_38,
    Tsa_NosferatuBg_39,
    Tsa_NosferatuBg_40,
    Tsa_NosferatuBg_41,
    Tsa_NosferatuBg_42,
    Tsa_NosferatuBg_43,
    Tsa_NosferatuBg_44,
    Tsa_NosferatuBg_45,
    Tsa_NosferatuBg_46,
    Tsa_NosferatuBg_47,
    Tsa_NosferatuBg_48,
    Tsa_NosferatuBg_49,
    Tsa_NosferatuBg_50,
};

// clang-format on

//! FE8U = 0x0805F4B0
void StartSubSpell_efxResireBG(struct Anim * anim, int type)
{
    // clang-format off
    static const u16 frames[] =
    {
         1, 3,
         2, 2,
         3, 2,
         4, 2,
         5, 2,
         6, 2,
         7, 1,
         8, 1,
         9, 1,
        10, 1,
        11, 1,
        12, 1,
        13, 1,
        14, 1,
        15, 1,
        16, 1,
        17, 1,
        18, 1,
        19, 1,
        20, 1,
        21, 1,
        22, 1,
        23, 1,
        24, 1,
        25, 1,
        26, 1,
        27, 1,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxResireBG, PROC_TREE_3);
    proc->anim = anim;
    proc->unk29 = type;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;
    proc->tsal = TsaArray_NosferatuBg;
    proc->tsar = TsaArray_NosferatuBg;
    proc->img = ImgArray_NosferatuBg;

    SpellFx_RegisterBgPal(Pal_NosferatuBg, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
    {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
        {
            BG_SetPosition(BG_1, 24, 0);
        }
        else
        {
            BG_SetPosition(BG_1, 232, 0);
        }
    }

    return;
}

// clang-format off

const u16 gFrameConfig_EfxmagicNosferatu_0[] =
{
    28, 1,
    29, 1,
    30, 1,
    31, 1,
    32, 1,
    33, 1,
    34, 1,
    35, 1,
    36, 1,
    37, 1,
    38, 1,
    39, 1,
    40, 1,
    41, 1,
    42, 1,
    43, 1,
    44, 1,
    45, 1,
    46, 1,
    47, 1,
    48, 1,
    49, 1,
    50, 1,
    -1,
};

// clang-format on

//! FE8U = 0x0805F53C
void StartSubSpell_efxResireBG2(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
         0, 45,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxResireBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;
    proc->tsal = TsaArray_NosferatuBg;
    proc->tsar = TsaArray_NosferatuBg;
    proc->img = ImgArray_NosferatuBg;

    SpellFx_RegisterBgPal(Pal_NosferatuBg, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    SetWinEnable(0, 0, 0);

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
    {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
        {
            BG_SetPosition(BG_1, 24, 0);
        }
        else
        {
            BG_SetPosition(BG_1, 232, 0);
        }
    }

    return;
}

//! FE8U = 0x0805F5DC
void efxResireBG_Loop_A(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;

        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();

            if (proc->unk29 == 1)
            {
                gEfxBgSemaphore--;

                SetDefaultColorEffects_();
                RegisterEfxSpellCastEnd();

                Proc_End(proc);
            }
            else
            {
                proc->timer = 0;
                proc->terminator = 1;
                Proc_Break(proc);
            }
        }
    }

    return;
}

extern u16 * TsaArray_NosferatuBg[];
extern u16 * ImgArray_NosferatuBg[];

//! FE8U = 0x0805F660
void efxResireBG_Loop_B(struct ProcEfxBG * proc)
{
    if (gEfxHpBarResireFlag == 2)
    {
        gEfxBgSemaphore--;

        SetDefaultColorEffects_();
        RegisterEfxSpellCastEnd();

        Proc_End(proc);
    }
    else
    {
        proc->timer++;

        if (proc->timer > proc->terminator)
        {
            proc->timer = proc->terminator;
        }

        if ((proc->timer == proc->terminator) && (gEfxHpBarResireFlag == 1))
        {
            proc->timer = 0;
            proc->terminator = 0;
            proc->frame = 0;
            proc->frame_config = gFrameConfig_EfxmagicNosferatu_0;
            proc->tsal = TsaArray_NosferatuBg;
            proc->tsar = TsaArray_NosferatuBg;
            proc->img = ImgArray_NosferatuBg;

            if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
            {
                proc->terminator = EfxGetCamMovDuration();
                NewEfxFarAttackWithDistance(proc->anim, -1);
            }

            Proc_Break(proc);
        }
    }

    return;
}

//! FE8U = 0x0805F6FC
void efxResireBG_Loop_C(struct ProcEfxBG * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
        {
            if (GetAnimPosition(proc->anim) == EKR_POS_L)
            {
                BG_SetPosition(BG_1, 232, 0);
            }
            else
            {
                BG_SetPosition(BG_1, 24, 0);
            }
        }

        proc->timer = 0;
        PlaySFX(0x126, 0x100, anim->xPosition, 1);

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0805F76C
void efxResireBG_Loop_D(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;

        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();

            gEfxBgSemaphore--;

            SetDefaultColorEffects_();
            RegisterEfxSpellCastEnd();

            Proc_Break(proc);
        }
    }

    return;
}

//! FE8U = 0x0805F7D4
void efxResireBG2_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;

        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
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

struct ProcCmd CONST_DATA ProcScr_efxResireRST[] =
{
    PROC_NAME("efxResireRST"),
    PROC_REPEAT(efxResireRST_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805F838
void StartSubSpell_efxResireRST(struct Anim * anim, ProcPtr efxproc, int c)
{
    struct ProcEfxRST * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxResireRST, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->duration = c;
    proc->efxproc = efxproc;

    return;
}

//! FE8U = 0x0805F868
void efxResireRST_Loop(struct ProcEfxRST * proc)
{
    struct ProcEfx * otherProc = proc->efxproc;

    otherProc->frame = Interpolate(INTERPOLATE_RSQUARE, 0, 128, proc->timer, proc->duration);

    proc->timer++;

    if (proc->timer > proc->duration)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}
