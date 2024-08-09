#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxHazymoon[] =
{
    PROC_NAME("efxHazymoon"),
    PROC_REPEAT(efxHazymoon_Loop_Main),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0806028C
void StartSpellAnimEclipse(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxHazymoon, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x080602C8
void efxHazymoon_Loop_Main(struct ProcEfx * proc)
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
        NewEfxALPHA(anim, 0, 15, 0, 16, 0);
        NewEfxALPHA(anim, 80, 15, 16, 0, 0);
        StartSubSpell_efxHazymoonBG_A(proc->anim);
        StartSubSpell_efxHazymoonOBJ3(proc->anim);
        PlaySFX(0x138, 0x100, 0x78, 0);
    }
    else if (proc->timer == duration + 70)
    {
        StartSubSpell_efxResireRST(anim, NewefxRestRST(anim, 42, 15, 0, 2), 30);
        NewEfxRestWINH_(anim, 43, 0);
    }
    else if (proc->timer == duration + 120)
    {
        StartSubSpell_efxHazymoonBG_B(anim);
    }
    else if (proc->timer == duration + 125)
    {
        PlaySFX(0x139, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 151)
    {
        StartSubSpell_efxHazymoonOBJ2(proc->anim);
    }
    else if (proc->timer == duration + 226)
    {
        PlaySFX(0x2E2, 0x100, anim->xPosition, 1);
        NewEfxFlashBgWhite(anim, 10);
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
        StartBattleAnimHitEffectsDefault(anim, proc->hitted);
        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 236)
    {
        StartSubSpell_efxHazymoonBG_C(anim);
        NewEfxALPHA(anim, 16, 10, 16, 0, 0);
    }
    else if (proc->timer == duration + 270)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxHazymoonBG[] =
{
    PROC_NAME("efxHazymoonBG"),
    PROC_REPEAT(efxHazymoonBG_Loop),
    PROC_END,
};

u16 * CONST_DATA TsaArray_EclipseBg[] =
{
    Tsa_EclipseBg_A,
    Tsa_EclipseBg_B,
    Tsa_EclipseBg_C,
    Tsa_EclipseBg_D,
    Tsa_EclipseBg_E,
    Tsa_EclipseBg_F,
    Tsa_EclipseBg_G,
    Tsa_EclipseBg_H,
    Tsa_EclipseBg_I,
    Tsa_EclipseBg_J,
    Tsa_EclipseBg_K,
    Tsa_EclipseBg_L,
    Tsa_EclipseBg_M,
    Tsa_EclipseBg_N,
    Tsa_EclipseBg_O,
    Tsa_EclipseBg_P,
    Tsa_EclipseBg_Q,
    Tsa_EclipseBg_R,
    Tsa_EclipseBg_S,
    Tsa_EclipseBg_T,
    Tsa_EclipseBg_U,
    Tsa_EclipseBg_V,
    Tsa_EclipseBg_W,
    Tsa_EclipseBg_X,
    Tsa_EclipseBg_Y,
    Tsa_EclipseBg_Z,
    Tsa_EclipseBg_AA,
};

u16 * CONST_DATA ImgArray_EclipseBg[] =
{
    Img_EclipseBg_A,
    Img_EclipseBg_B,
    Img_EclipseBg_B,
    Img_EclipseBg_B,
    Img_EclipseBg_B,
    Img_EclipseBg_B,
    Img_EclipseBg_B,
    Img_EclipseBg_B,
    Img_EclipseBg_B,
    Img_EclipseBg_B,
    Img_EclipseBg_B,
    Img_EclipseBg_B,
    Img_EclipseBg_B,
    Img_EclipseBg_B,
    Img_EclipseBg_C,
    Img_EclipseBg_C,
    Img_EclipseBg_C,
    Img_EclipseBg_D,
    Img_EclipseBg_E,
    Img_EclipseBg_F,
    Img_EclipseBg_G,
    Img_EclipseBg_H,
    Img_EclipseBg_I,
    Img_EclipseBg_J,
    Img_EclipseBg_K,
    Img_EclipseBg_L,
    Img_EclipseBg_M,
};

// clang-format on

//! FE8U = 0x08060440
void StartSubSpell_efxHazymoonBG_A(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
         0, 100,
        -1,
    };
    // clang-format on

    struct ProcEfxEclipseBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxHazymoonBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_EclipseBg;
    proc->tsar = TsaArray_EclipseBg;

    proc->img = ImgArray_EclipseBg;
    proc->pal = NULL;

    SpellFx_RegisterBgPal(Pal_NosferatuBg, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    SetWinEnable(0, 0, 0);

    return;
}

//! FE8U = 0x080604B0
void StartSubSpell_efxHazymoonBG_B(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
         1, 1,
         2, 1,
         3, 1,
         4, 1,
         5, 2,
         6, 2,
         7, 2,
         8, 3,
         9, 3,
        10, 3,
        11, 3,
        12, 4,
        13, 5,
        12, 4,
        11, 3,
        10, 3,
        11, 3,
        12, 4,
        13, 5,
        12, 4,
        11, 3,
        10, 3,
        11, 3,
        12, 4,
        13, 5,
        12, 4,
        11, 3,
        10, 3,
        11, 3,
        12, 4,
        13, 5,
         9, 1,
         8, 1,
         7, 1,
         6, 1,
         5, 1,
         4, 1,
         3, 1,
         2, 1,
         1, 1,
        -1,
    };
    // clang-format on

    struct ProcEfxEclipseBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxHazymoonBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_EclipseBg;
    proc->tsar = TsaArray_EclipseBg;

    proc->img = ImgArray_EclipseBg;
    proc->pal = NULL;

    SpellFx_RegisterBgPal(Pal_EclipseBg_B, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    SetBlendAlpha(12, 6);

    return;
}

//! FE8U = 0x08060514
void StartSubSpell_efxHazymoonBG_C(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        14, 3,
        15, 3,
        16, 3,
        17, 3,
        18, 3,
        19, 2,
        20, 2,
        21, 2,
        22, 2,
        23, 2,
        24, 2,
        25, 2,
        26, 2,
        -1
    };
    // clang-format on

    struct ProcEfxEclipseBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxHazymoonBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_EclipseBg;
    proc->tsar = TsaArray_EclipseBg;

    proc->img = ImgArray_EclipseBg;
    proc->pal = NULL;

    SpellFx_RegisterBgPal(Pal_EclipseBg_C, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x0806056C
void efxHazymoonBG_Loop(struct ProcEfxEclipseBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;

        u16 ** img = proc->img;

        if (proc->pal != *(img + ret))
        {
            SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        }

        proc->pal = *(img + ret);

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

struct ProcCmd CONST_DATA ProcScr_efxHazymoonOBJ2[] =
{
    PROC_NAME("efxHazymoonOBJ2"),

    PROC_SET_END_CB(efxHazymoonOBJ2_OnEnd),

    PROC_REPEAT(efxHazymoonOBJ2_Loop_A),
    PROC_REPEAT(efxHazymoonOBJ2_Loop_B),
    PROC_REPEAT(efxHazymoonOBJ2_Loop_C),

    PROC_REPEAT(efxHazymoonOBJ2_Loop_A),
    PROC_REPEAT(efxHazymoonOBJ2_Loop_B),
    PROC_REPEAT(efxHazymoonOBJ2_Loop_C),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080605E8
void StartSubSpell_efxHazymoonOBJ2(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * otherAnim;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxHazymoonOBJ2, PROC_TREE_3);
    proc->anim = anim;
    otherAnim = GetAnimAnotherSide(anim);
    proc->timer = 0;

    frontAnim = EfxCreateFrontAnim(otherAnim, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90);
    proc->anim2 = frontAnim;
    frontAnim->oam2Base &= ~(0xc00);
    frontAnim->oam2Base |= 0x400;

    if (GetAnimPosition(otherAnim) == 0)
    {
        frontAnim->xPosition -= 8;
        frontAnim->yPosition -= 16;
    }
    else
    {
        frontAnim->xPosition += 8;
        frontAnim->yPosition -= 16;
    }

    return;
}

//! FE8U = 0x08060664
void efxHazymoonOBJ2_OnEnd(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
    return;
}

//! FE8U = 0x0806067C
void efxHazymoonOBJ2_Loop_A(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    proc->timer++;

    if (proc->timer == 1)
    {
        anim->pScrStart = AnimScr_EfxHazymoonOBJ2_1;
        anim->pScrCurrent = AnimScr_EfxHazymoonOBJ2_1;
        anim->timer = 0;

        proc->terminator = 10;

        SpellFx_RegisterObjPal(Pal_EclipseSprites, PLTT_SIZE_4BPP);
        SpellFx_RegisterObjGfx(Img_EclipseSprites_Swirl, 32 * 4 * CHR_SIZE);
    }
    else if (proc->timer == proc->terminator)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080606D8
void efxHazymoonOBJ2_Loop_B(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    proc->timer++;

    if (proc->timer == 1)
    {
        anim->pScrStart = AnimScr_EfxHazymoonOBJ2_2;
        anim->pScrCurrent = AnimScr_EfxHazymoonOBJ2_2;
        anim->timer = 0;

        proc->terminator = 10;

        SpellFx_RegisterObjPal(Pal_EclipseSprites, PLTT_SIZE_4BPP);
        SpellFx_RegisterObjGfx(Img_EclipseSprites_08650DA8, 32 * 4 * CHR_SIZE);
    }
    else if (proc->timer == proc->terminator)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08060734
void efxHazymoonOBJ2_Loop_C(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    proc->timer++;

    if (proc->timer == 1)
    {
        anim->pScrStart = AnimScr_EfxHazymoonOBJ2_3;
        anim->pScrCurrent = AnimScr_EfxHazymoonOBJ2_3;
        anim->timer = 0;

        proc->terminator = 10;

        SpellFx_RegisterObjPal(Pal_EclipseSprites, PLTT_SIZE_4BPP);
        SpellFx_RegisterObjGfx(Img_EclipseSprites_08651240, 32 * 4 * CHR_SIZE);
    }
    else if (proc->timer == proc->terminator)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxHazymoonOBJ3[] =
{
    PROC_NAME("efxHazymoonOBJ3"),
    PROC_REPEAT(efxHazymoonOBJ3_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08060790
void StartSubSpell_efxHazymoonOBJ3(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxHazymoonOBJ3, PROC_TREE_3);
    proc->anim = anim;

    proc->timer = 0;
    proc->terminator = 0;

    proc->unk30 = 44;

    SpellFx_RegisterObjPal(Pal_FluxAnimSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_FluxAnimSprites_Orb, 32 * 4 * CHR_SIZE);

    return;
}

// clang-format off

s16 CONST_DATA gEclipseAnimSpriteCoordinates[] =
{
    96, 56,
    48, 104,
    160, 64,
    88, 136,
    160, 136,
    192, 96,
};

// clang-format on

//! FE8U = 0x080607D8
void efxHazymoonOBJ3_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == 8)
    {
        s16 x;
        s16 y;

        proc->timer = 0;

        x = gEclipseAnimSpriteCoordinates[proc->terminator * 2];
        y = gEclipseAnimSpriteCoordinates[proc->terminator * 2 + 1];

        StartSubSpell_efxHazymoonOBJ3RND(proc->anim, x, y);

        proc->terminator++;

        if (proc->terminator == 6)
        {
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxHazymoonOBJ3RND[] =
{
    PROC_NAME("efxHazymoonOBJ3RND"),
    PROC_SET_END_CB(efxHazymoonOBJ3RND_OnEnd),

    PROC_SLEEP(44),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08060838
void StartSubSpell_efxHazymoonOBJ3RND(struct Anim * anim, int x, int y)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxHazymoonOBJ3RND, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    frontAnim = EfxCreateFrontAnim(anim, AnimScr_EfxHazymoonOBJ3RND, AnimScr_EfxHazymoonOBJ3RND, AnimScr_EfxHazymoonOBJ3RND, AnimScr_EfxHazymoonOBJ3RND);
    proc->anim2 = frontAnim;

    frontAnim->xPosition = x;
    frontAnim->yPosition = y;

    return;
}

//! FE8U = 0x0806088C
void efxHazymoonOBJ3RND_OnEnd(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
    return;
}
