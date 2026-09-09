#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxLightning[] =
{
    PROC_NAME("efxLightning"),
    PROC_REPEAT(efxLightning_Loop_Main),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805F8B4
void StartSpellAnimLightning(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxLightning, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x0805F8F0
void efxLightning_Loop_Main(struct ProcEfx * proc)
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
        PlaySFX(0x120, 0x100, anim->xPosition, 1);
        StartSubSpell_efxLightningBG(anim);
    }
    else if (proc->timer == duration + 26)
    {
        PlaySFX(0x00000121, 0x100, anim->xPosition, 1);
        NewEfxFlashBgWhite(proc->anim, 4);

        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if ((proc->timer != duration + 47) && (proc->timer == duration + 48))
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxLightningBG[] =
{
    PROC_NAME("efxLightningBG"),
    PROC_REPEAT(efxLightningBG_Loop),
    PROC_END,
};

u16 * CONST_DATA ImgArray_LightningBg[] =
{
    Img_Banim_1,
    Img_Banim_1,
    Img_Banim_1,
    Img_Banim_2,
    Img_Banim_2,
    Img_Banim_2,
    Img_Banim_3,
    Img_Banim_3,
    Img_Banim_3,
    Img_Banim_3,
    Img_Banim_4,
    Img_Banim_4,
    Img_Banim_4,
    Img_Banim_5,
    Img_Banim_5,
    Img_Banim_5,
    Img_Light_0,
    Img_Light_0,
    Img_Light_0,
    Img_Light_0,
    Img_Light_0,
    Img_Light_0,
    Img_Light_0,
    Img_Light_0,
    Img_Light_0,
    Img_Light_1,
    Img_Light_1,
    Img_Light_1,
    Img_Light_2,
    Img_Light_2,
    Img_Light_2,
    Img_Light_2,
    Img_Light_2,
};

u16 * CONST_DATA PalArray_LightningBg[] =
{
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Light,
    Pal_Light,
    Pal_Light,
    Pal_Light,
    Pal_Light,
    Pal_Light,
    Pal_Light,
    Pal_Light,
};

u16 * CONST_DATA TsaArray_LightningBg[] =
{
    Tsa_Light_0,
    Tsa_Light_1,
    Tsa_Light_2,
    Tsa_Light_3,
    Tsa_Light_4,
    Tsa_Light_5,
    Tsa_Light_6,
    Tsa_Light_7,
    Tsa_Light_8,
    Tsa_Light_9,
    Tsa_Light_10,
    Tsa_Light_11,
    Tsa_Light_12,
    Tsa_Light_13,
    Tsa_Light_14,
    Tsa_Light_15,
    Tsa_Light_16,
    Tsa_Light_17,
    Tsa_Light_18,
    Tsa_Light_19,
    Tsa_Light_20,
    Tsa_Light_21,
    Tsa_Light_22,
    Tsa_Light_23,
    Tsa_Light_24,
    Tsa_Light_25,
    Tsa_Light_26,
    Tsa_Light_27,
    Tsa_Light_28,
    Tsa_Light_29,
    Tsa_Light_30,
    Tsa_Light_31,
    Tsa_Light_32,
};

// clang-format on

//! FE8U = 0x0805F9A8
void StartSubSpell_efxLightningBG(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        25, 2,
        26, 2,
        27, 2,
        28, 2,
        29, 2,
        30, 2,
        31, 2,
        32, 2,
        16, 1,
        17, 1,
        18, 1,
        19, 1,
        20, 1,
        21, 1,
        22, 1,
        23, 1,
        24, 1,
         0, 7,
         1, 1,
         2, 1,
         3, 1,
         4, 1,
         5, 1,
         6, 1,
         7, 1,
         8, 1,
         9, 1,
        10, 1,
        11, 1,
        12, 1,
        13, 1,
        14, 1,
        15, 1,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLightningBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;
    proc->tsal = TsaArray_LightningBg;
    proc->tsar = TsaArray_LightningBg;
    proc->img = ImgArray_LightningBg;
    proc->pal = PalArray_LightningBg;

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

//! FE8U = 0x0805FA28
void efxLightningBG_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;
        u16 ** pal = proc->pal;

        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        SpellFx_RegisterBgPal(*(pal + ret), PLTT_SIZE_4BPP);
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));

        if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
        {
            if (GetAnimPosition(proc->anim) == EKR_POS_L)
            {
                FillBGRect(gBG1TilemapBuffer, 3, 20, 0, 0);
            }
            else
            {
                FillBGRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 29, 0), 3, 20, 0, 0);
            }
        }
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

struct ProcCmd CONST_DATA ProcScr_efxPurge[] =
{
    PROC_NAME("efxPurge"),
    PROC_REPEAT(efxPurge_Loop_Main),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805FAE0
void StartSpellAnimPurge(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxPurge, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    gEfxlvup_0 = 0;

    return;
}

//! FE8U = 0x0805FB24
void efxPurge_PlayAlternatingSFX(int location, int type)
{
    if (gEfxlvup_0 & 1)
    {
        PlaySFX(0xfe, 0x100, location, type);
    }
    else
    {
        PlaySFX(0xff, 0x100, location, type);
    }

    gEfxlvup_0++;

    return;
}

//! FE8U = 0x0805FB60
void efxPurge_Loop_Main(struct ProcEfx * proc)
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
        NewEfxFlashBgWhite(anim, 4);
        StartSubSpell_efxPurgeBG(anim);
        StartSubSpell_efxPurgeOBJRND(anim);
        efxPurge_PlayAlternatingSFX(0x30, 0);
        return;
    }
    else if (proc->timer == duration + 21)
    {
        NewEfxFlashBgWhite(anim, 4);
        efxPurge_PlayAlternatingSFX(0xa0, 0);
        return;
    }
    else if (proc->timer == duration + 41)
    {
        NewEfxFlashBgWhite(anim, 4);
        efxPurge_PlayAlternatingSFX(0x70, 0);
        return;
    }

    if (proc->timer == duration + 61)
    {
        NewEfxFlashBgWhite(anim, 4);
        NewEfxALPHA(anim, 3, 10, 0, 16, 0);
        PlaySFX(0x100, 0x100, anim->xPosition, 1);
        return;
    }

    if (proc->timer == duration + 94)
    {
        NewEfxFlashBgWhite(anim, 4);
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        PlaySFX(0x101, 0x100, anim->xPosition, 1);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }

        return;
    }

    if (proc->timer == duration + 105)
    {
        NewEfxALPHA(anim, 0, 20, 8, 0, 0);
        return;
    }

    if (proc->timer != duration + 113)
    {
        return;
    }

    SpellFx_Finish();
    RegisterEfxSpellCastEnd();
    Proc_Break(proc);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxPurgeBG[] =
{
    PROC_NAME("efxPurgeBG"),
    PROC_REPEAT(efxPurgeBG_Loop),
    PROC_END,
};

u16 * CONST_DATA ImgArray_PurgeBg[] =
{
    Img_Banim_1,
    Img_Banim_1,
    Img_Banim_1,
    Img_Banim_2,
    Img_Banim_2,
    Img_Banim_2,
    Img_Banim_3,
    Img_Banim_3,
    Img_Banim_3,
    Img_Banim_3,
    Img_Banim_4,
    Img_Banim_4,
    Img_Banim_4,
    Img_Banim_5,
    Img_Banim_5,
    Img_Banim_5,
    Img_Banim_1,
    Img_Banim_1,
    Img_Banim_1,
    Img_Banim_2,
    Img_Banim_2,
    Img_Banim_2,
    Img_Banim_3,
    Img_Banim_3,
    Img_Banim_3,
    Img_Banim_3,
    Img_Banim_4,
    Img_Banim_4,
    Img_Banim_4,
    Img_Banim_5,
    Img_Banim_5,
    Img_Banim_5,
    Img_Banim_1,
    Img_Banim_1,
    Img_Banim_1,
    Img_Banim_2,
    Img_Banim_2,
    Img_Banim_2,
    Img_Banim_3,
    Img_Banim_3,
    Img_Banim_3,
    Img_Banim_3,
    Img_Banim_4,
    Img_Banim_4,
    Img_Banim_4,
    Img_Banim_5,
    Img_Banim_5,
    Img_Banim_5,
    Img_Banim_7,
    Img_Banim_7,
    Img_PurgeBg_0,
    Img_PurgeBg_0,
    Img_PurgeBg_1,
    Img_PurgeBg_1,
    Img_PurgeBg_2,
    Img_PurgeBg_2,
    Img_PurgeBg_3,
    Img_PurgeBg_3,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    Img_PurgeBg_4,
    Img_PurgeBg_5,
    Img_PurgeBg_6,
    Img_PurgeBg_7,
    Img_PurgeBg_8,
    Img_PurgeBg_9,
    Img_PurgeBg_9,
    Img_PurgeBg_10,
    Img_PurgeBg_10,
    Img_PurgeBg_11,
    Img_PurgeBg_12,
    Img_PurgeBg_13,
    Img_PurgeBg_14,
    Img_PurgeBg_15,
    Img_PurgeBg_16,
};

u16 * CONST_DATA PalArray_PurgeBg[] =
{
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_0,
    Pal_Banim_3,
    Pal_Banim_3,
    Pal_Banim_3,
    Pal_Banim_3,
    Pal_Banim_3,
    Pal_Banim_3,
    Pal_Banim_3,
    Pal_Banim_3,
    Pal_Banim_3,
    Pal_Banim_3,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    Pal_PurgeBg,
    Pal_PurgeBg,
    Pal_PurgeBg,
    Pal_PurgeBg,
    Pal_PurgeBg,
    Pal_PurgeBg,
    Pal_PurgeBg,
    Pal_PurgeBg,
    Pal_PurgeBg,
    Pal_PurgeBg,
    Pal_PurgeBg,
    Pal_PurgeBg,
    Pal_PurgeBg,
    Pal_PurgeBg,
    Pal_PurgeBg,
};

u16 * CONST_DATA TsaArray_PurgeBg[] =
{
    Tsa_PurgeBg_0,
    Tsa_PurgeBg_1,
    Tsa_PurgeBg_2,
    Tsa_PurgeBg_3,
    Tsa_PurgeBg_4,
    Tsa_PurgeBg_5,
    Tsa_PurgeBg_6,
    Tsa_PurgeBg_7,
    Tsa_PurgeBg_8,
    Tsa_PurgeBg_9,
    Tsa_PurgeBg_10,
    Tsa_PurgeBg_11,
    Tsa_PurgeBg_12,
    Tsa_PurgeBg_13,
    Tsa_PurgeBg_14,
    Tsa_PurgeBg_15,
    Tsa_PurgeBg_16,
    Tsa_PurgeBg_17,
    Tsa_PurgeBg_18,
    Tsa_PurgeBg_19,
    Tsa_PurgeBg_20,
    Tsa_PurgeBg_21,
    Tsa_PurgeBg_22,
    Tsa_PurgeBg_23,
    Tsa_PurgeBg_24,
    Tsa_PurgeBg_25,
    Tsa_PurgeBg_26,
    Tsa_PurgeBg_27,
    Tsa_PurgeBg_28,
    Tsa_PurgeBg_29,
    Tsa_PurgeBg_30,
    Tsa_PurgeBg_31,
    Tsa_PurgeBg_32,
    Tsa_PurgeBg_33,
    Tsa_PurgeBg_34,
    Tsa_PurgeBg_35,
    Tsa_PurgeBg_36,
    Tsa_PurgeBg_37,
    Tsa_PurgeBg_38,
    Tsa_PurgeBg_39,
    Tsa_PurgeBg_40,
    Tsa_PurgeBg_41,
    Tsa_PurgeBg_42,
    Tsa_PurgeBg_43,
    Tsa_PurgeBg_44,
    Tsa_PurgeBg_45,
    Tsa_PurgeBg_46,
    Tsa_PurgeBg_47,
    Tsa_PurgeBg_48,
    Tsa_PurgeBg_49,
    Tsa_PurgeBg_50,
    Tsa_PurgeBg_51,
    Tsa_PurgeBg_52,
    Tsa_PurgeBg_53,
    Tsa_PurgeBg_54,
    Tsa_PurgeBg_55,
    Tsa_PurgeBg_56,
    Tsa_PurgeBg_57,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    Tsa_PurgeBg_58,
    Tsa_PurgeBg_59,
    Tsa_PurgeBg_60,
    Tsa_PurgeBg_61,
    Tsa_PurgeBg_62,
    Tsa_PurgeBg_63,
    Tsa_PurgeBg_64,
    Tsa_PurgeBg_65,
    Tsa_PurgeBg_66,
    Tsa_PurgeBg_67,
    Tsa_PurgeBg_68,
    Tsa_PurgeBg_69,
    Tsa_PurgeBg_70,
    Tsa_PurgeBg_71,
    Tsa_PurgeBg_72,
};

// clang-format on

//! FE8U = 0x0805FC90
void StartSubSpell_efxPurgeBG(struct Anim * anim)
{
    // clang-format off
    const static u16 frames[] =
    {
         0, 1,
         1, 1,
         2, 1,
         3, 1,
         4, 1,
         5, 1,
         6, 1,
         7, 1,
         8, 1,
         9, 1,
        10, 1,
        11, 1,
        12, 1,
        13, 1,
        14, 1,
        15, 5,
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
        28, 1,
        29, 1,
        30, 1,
        31, 5,
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
        47, 5,
        48, 1,
        49, 1,
        50, 1,
        51, 1,
        52, 1,
        53, 1,
        54, 1,
        55, 1,
        56, 1,
        57, 1,
        48, 1,
        49, 1,
        50, 1,
        51, 1,
        52, 1,
        53, 1,
        54, 1,
        55, 1,
        56, 1,
        57, 1,
        48, 1,
        49, 1,
        50, 1,
        51, 1,
        52, 1,
        53, 1,
        54, 1,
        55, 1,
        56, 1,
        57, 4,
        63, 2,
        64, 2,
        65, 2,
        66, 2,
        67, 2,
        68, 2,
        69, 2,
        70, 2,
        71, 2,
        72, 2,
        73, 2,
        74, 2,
        75, 2,
        76, 2,
        77, 2,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxPurgeBG, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_PurgeBg;
    proc->tsar = TsaArray_PurgeBg;
    proc->img = ImgArray_PurgeBg;
    proc->pal = PalArray_PurgeBg;

    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x0805FCE0
void efxPurgeBG_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;
        u16 ** pal = proc->pal;

        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        SpellFx_RegisterBgPal(*(pal + ret), PLTT_SIZE_4BPP);
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
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

struct ProcCmd CONST_DATA ProcScr_efxPurgeOBJRND[] =
{
    PROC_NAME("efxPurgeOBJRND"),
    PROC_REPEAT(efxPurgeOBJRND_Loop),
    PROC_SLEEP(69),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805FD5C
void StartSubSpell_efxPurgeOBJRND(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxPurgeOBJRND, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->unk44 = 7;
    proc->terminator = 0;
    proc->unk48 = 6;

    return;
}

// clang-format off

int CONST_DATA gPurgeAnimSpriteCoordinates[] =
{
    208,  48,
    160, 144,
     64,  64,
    192,  96,
    128,  48,
     32,  96,
     80, 128,
};

// clang-format on

//! FE8U = 0x0805FD90
void efxPurgeOBJRND_Loop(struct ProcEfxOBJ * proc)
{
    if (++proc->timer > proc->unk44)
    {
        int x;
        int y;

        proc->timer = 0;

        x = gPurgeAnimSpriteCoordinates[proc->terminator * 2];
        y = gPurgeAnimSpriteCoordinates[proc->terminator * 2 + 1];

        StartSubSpell_efxPurgeOBJ(proc->anim2, x, y);
        efxPurge_PlayAlternatingSFX(x, 1);

        if (++proc->terminator > proc->unk48)
        {
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxPurgeOBJ[] =
{
    PROC_NAME("efxPurgeOBJ"),
    PROC_SET_END_CB(efxPurgeOBJ_OnEnd),
    PROC_SLEEP(69),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805FDFC
void StartSubSpell_efxPurgeOBJ(struct Anim * anim, int x, int y)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxPurgeOBJ, PROC_TREE_3);
    proc->anim = anim;

    frontAnim = EfxCreateFrontAnim(anim, AnimScr_EfxPurge, AnimScr_EfxPurge, AnimScr_EfxPurge, AnimScr_EfxPurge);

    proc->anim2 = frontAnim;
    frontAnim->xPosition = x;
    frontAnim->yPosition = y;

    SpellFx_RegisterObjPal(Pal_PurgeSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_PurgeSprites, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x0805FE68
void efxPurgeOBJ_OnEnd(struct ProcEfxOBJ * proc)
{
    AnimDelete(proc->anim2);
    gEfxBgSemaphore--;

    return;
}

//! FE8U = 0x0805FE80
void StartSpellAnim_Null_0(struct Anim * anim)
{
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxDivine[] =
{
    PROC_NAME("efxDevine"),
    PROC_REPEAT(efxDivine_Loop_Main),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805FE84
void StartSpellAnimDivine(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxDivine, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x0805FEC0
void efxDivine_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        PlaySFX(0x127, 0x100, proc->anim->xPosition, 1);
        StartSubSpell_efxDivineBG(anim);
        StartSubSpell_efxDivineOBJ(proc->anim);
        return;
    }

    if (proc->timer == 20)
    {
        PlaySFX(0x128, 0x100, proc->anim->xPosition, 1);
        return;
    }

    if (proc->timer == 50)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
        return;
    }

    if (proc->timer == duration + 70)
    {
        StartSubSpell_efxDivineBG_2(anim);
        PlaySFX(0x129, 0x100, anim->xPosition, 1);
        return;
    }

    if (proc->timer == duration + 73)
    {
        NewEfxFlashBgWhite(proc->anim, 10);
        return;
    }

    if (proc->timer == duration + 75)
    {
        StartSubSpell_efxDivineBG_3(anim);

        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }

        return;
    }

    if ((proc->timer != duration + 90) && (proc->timer == 100))
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxDivineBG[] =
{
    PROC_NAME("efxDevineBG"),
    PROC_REPEAT(efxDivineBG_Loop),
    PROC_END,
};

u16 * CONST_DATA ImgArray_DivineBg[] =
{
    Img_DivineBg,
    Img_DivineBg,
    Img_DivineBg,
    Img_DivineBg,
    Img_DivineBg,
    Img_DivineBg,
    Img_DivineBg,
    Img_DivineBg,
    Img_DivineBg,
    Img_DivineBg,
    Img_DivineBg,
    Img_DivineBg,
    Img_DivineBg,
    Img_DivineBg,
    Img_DivineBg,
    Img_DivineBg,
    Img_DivineBg,
    Img_DivineBg,
    Img_DivineBg,
    Img_DivineBg,
};

u16 * CONST_DATA TsaArray_DivineBg[] =
{
    Tsa_DivineBg_1,
    Tsa_DivineBg_2,
    Tsa_DivineBg_3,
    Tsa_DivineBg_4,
    Tsa_DivineBg_5,
    Tsa_DivineBg_6,
    Tsa_DivineBg_7,
    Tsa_DivineBg_8,
    Tsa_DivineBg_9,
    Tsa_DivineBg_10,
    Tsa_DivineBg_11,
    Tsa_DivineBg_12,
    Tsa_DivineBg_13,
    Tsa_DivineBg_14,
    Tsa_DivineBg_15,
    Tsa_DivineBg_16,
    Tsa_DivineBg_17,
    Tsa_DivineBg_18,
    Tsa_DivineBg_19,
    Tsa_DivineBg_20,
};

// clang-format on

//! FE8U = 0x0805FFB0
void StartSubSpell_efxDivineBG(struct Anim * anim)
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
         7, 1,
         5, 1,
         7, 1,
         5, 1,
         7, 1,
         5, 1,
         7, 1,
         6, 2,
         7, 2,
         8, 2,
         9, 2,
        10, 2,
        11, 2,
        12, 2,
        13, 2,
        14, 2,
        15, 2,
        16, 2,
        17, 2,
        18, 2,
        19, 2,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDivineBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;
    proc->tsal = TsaArray_DivineBg;
    proc->tsar = TsaArray_DivineBg;
    proc->img = ImgArray_DivineBg;

    SpellFx_RegisterBgPal(Pal_DivineBg, PLTT_SIZE_4BPP);

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

    SpellFx_SetSomeColorEffect();

    return;
}

// clang-format off

u16 * CONST_DATA ImgArray_DivineBg2[] =
{
    Img_DivineBg,
    Img_DivineBg,
    Img_DivineBg,
};

u16 * TsaArray_DivineBg2[] =
{
    Tsa_DivineBg2_0,
    Tsa_DivineBg2_1,
    Tsa_DivineBg2_2,
};

// clang-format on

//! FE8U = 0x08060034
void StartSubSpell_efxDivineBG_2(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
         0, 1,
         1, 1,
         2, 1,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDivineBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;
    proc->tsal = TsaArray_DivineBg2;
    proc->tsar = TsaArray_DivineBg2;
    proc->img = ImgArray_DivineBg2;

    SpellFx_RegisterBgPal(Pal_DivineBg, PLTT_SIZE_4BPP);

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

    SpellFx_SetSomeColorEffect();

    return;
}

// clang-format off

u16 * CONST_DATA ImgArray_DivineBg3[] =
{
    Img_DivineBg3_0,
    Img_DivineBg3_0,
    Img_DivineBg3_1,
    Img_DivineBg3_2,
    Img_DivineBg3_3,
    Img_DivineBg3_4,
    Img_DivineBg3_5,
    Img_DivineBg3_6,
    Img_DivineBg3_7,
    Img_DivineBg3_8,
    Img_DivineBg3_9,
    Img_DivineBg3_10,
    Img_DivineBg3_11,
    Img_DivineBg3_12,
    Img_DivineBg3_13,
    Img_DivineBg3_14,
    Img_DivineBg3_15,
    Img_DivineBg3_16,
    Img_DivineBg3_16,
    Img_DivineBg3_17,
    Img_DivineBg3_17,
};

u16 * CONST_DATA TsaArray_DivineBg3[] =
{
    Tsa_DivineBg_0,
    Tsa_DivineBg3_0,
    Tsa_DivineBg3_1,
    Tsa_DivineBg3_2,
    Tsa_DivineBg3_3,
    Tsa_DivineBg3_4,
    Tsa_DivineBg3_5,
    Tsa_DivineBg3_6,
    Tsa_DivineBg3_7,
    Tsa_DivineBg3_8,
    Tsa_DivineBg3_9,
    Tsa_DivineBg3_10,
    Tsa_DivineBg3_11,
    Tsa_DivineBg3_12,
    Tsa_DivineBg3_13,
    Tsa_DivineBg3_14,
    Tsa_DivineBg3_15,
    Tsa_DivineBg3_16,
    Tsa_DivineBg3_17,
    Tsa_DivineBg3_18,
    Tsa_DivineBg3_19,
};

// clang-format on

//! FE8U = 0x080600B8
void StartSubSpell_efxDivineBG_3(struct Anim * anim)
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
         9, 2,
        10, 2,
        11, 2,
        12, 2,
        13, 2,
        14, 2,
        15, 2,
        16, 2,
        17, 2,
        18, 2,
        19, 2,
        20, 2,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDivineBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_DivineBg3;
    proc->tsar = TsaArray_DivineBg3;
    proc->img = ImgArray_DivineBg3;

    SpellFx_RegisterBgPal(Pal_DivineBg3, PLTT_SIZE_4BPP);

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

    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x0806013C
void efxDivineBG_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;

        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));

        if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
        {
            int pos = GetAnimPosition(proc->anim);
            if (pos == 0)
            {
                FillBGRect(gBG1TilemapBuffer, 3, 20, 0, pos);
            }
            else
            {
                FillBGRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 29, 0), 3, 20, 0, 0);
            }
        }
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

struct ProcCmd CONST_DATA ProcScr_efxDivineOBJ[] =
{
    PROC_NAME("efxDevineOBJ"),
    PROC_REPEAT(efxDivineOBJ_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x080601E0
void StartSubSpell_efxDivineOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDivineOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    frontAnim = EfxCreateFrontAnim(anim, AnimScr_EfxDevineOBJ, AnimScr_EfxDevineOBJ, AnimScr_EfxDevineOBJ, AnimScr_EfxDevineOBJ);
    proc->anim2 = frontAnim;

    if (GetAnimPosition(anim) == 0)
    {
        frontAnim->xPosition -= 6;
    }
    else
    {
        frontAnim->xPosition += 6;
    }

    SpellFx_RegisterObjPal(Pal_DivineSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_DivineSprites, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x08060254
void efxDivineOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == 44)
    {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08060284
void StartSpellAnim_Null_1(struct Anim * anim)
{
    return;
}

//! FE8U = 0x08060288
void StartSpellAnim_Null_2(struct Anim * anim)
{
    return;
}
