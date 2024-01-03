#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D7F00[] =
{
    PROC_NAME("efxEvilEye"),
    PROC_REPEAT(sub_80677D4),
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

    proc = Proc_Start(gUnknown_085D7F00, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x080677D4
void sub_80677D4(struct ProcEfx * proc)
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
        sub_8067AA0(anim, 60);
    }
    else if (proc->timer == duration + 26)
    {
        sub_806788C(anim);
    }
    else if (proc->timer == duration + 88)
    {
        sub_8067984(anim);
    }
    else if (proc->timer == duration + 90)
    {
        anim->state3 |= 9;

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

struct ProcCmd CONST_DATA gUnknown_085D7F18[] =
{
    PROC_NAME("efxEvilEyeBG"),
    PROC_REPEAT(sub_8067914),
    PROC_END,
};

u16 * CONST_DATA gUnknown_085D7F30[] =
{
    Img_086C97B4,
    Img_086C9DAC,
    Img_086CA3C4,
    Img_086CAA94,
    Img_086CB1C4,
    Img_086CB8F0,
    Img_086CC0E4,
    Img_086CC8A0,
    Img_086CD098,
    Img_086CD988,
    Img_086CE15C,
    Img_086CE9FC,
    Img_086CF244,
    Img_086CF9D8,
    Img_086D0268,
    Img_086D0B24,
    Img_086D134C,
    Img_086D1B6C,
    Img_086D2400,
    Img_086D2BE4,
};

u16 * CONST_DATA gUnknown_085D7F80[] =
{
    Tsa_086D36D4,
    Tsa_086D37B4,
    Tsa_086D3890,
    Tsa_086D3978,
    Tsa_086D3A7C,
    Tsa_086D3B78,
    Tsa_086D3C84,
    Tsa_086D3D8C,
    Tsa_086D3E94,
    Tsa_086D3FBC,
    Tsa_086D40CC,
    Tsa_086D41F4,
    Tsa_086D4318,
    Tsa_086D4428,
    Tsa_086D454C,
    Tsa_086D466C,
    Tsa_086D4788,
    Tsa_086D489C,
    Tsa_086D49D0,
    Tsa_086D4ADC,
};

u16 * CONST_DATA gUnknown_085D7FD0[] =
{
    Pal_086D3454,
    Pal_086D3474,
    Pal_086D3494,
    Pal_086D34B4,
    Pal_086D34D4,
    Pal_086D34F4,
    Pal_086D3514,
    Pal_086D3534,
    Pal_086D3554,
    Pal_086D3574,
    Pal_086D3594,
    Pal_086D35B4,
    Pal_086D35D4,
    Pal_086D35F4,
    Pal_086D3614,
    Pal_086D3634,
    Pal_086D3654,
    Pal_086D3674,
    Pal_086D3694,
    Pal_086D36B4,
};

// clang-format on

//! FE8U = 0x0806788C
void sub_806788C(struct Anim * anim)
{
    // clang-format off
    static const u16 gUnknown_080DE9EA[] =
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

    proc = Proc_Start(gUnknown_085D7F18, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DE9EA;

    proc->tsal = gUnknown_085D7F80;
    proc->tsar = gUnknown_085D7F80;
    proc->img = gUnknown_085D7F30;
    proc->pal = gUnknown_085D7FD0;

    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            BG_SetPosition(BG_1, 0xe8, 0);
        }
        else
        {
            BG_SetPosition(BG_1, 0x18, 0);
        }
    }

    return;
}

//! FE8U = 0x08067914
void sub_8067914(struct ProcEfxBG * proc)
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
    PROC_REPEAT(sub_8067A30),
    PROC_END,
};

u16 * CONST_DATA gUnknown_085D8038[] =
{
    Img_086D4C08,
    Img_086D5418,
    Img_086D5E44,
    Img_086D68AC,
    Img_086D73A4,
    Img_086D7F20,
};

u16 * CONST_DATA gUnknown_085D8050[] =
{
    Tsa_086D8B54,
    Tsa_086D8C64,
    Tsa_086D8DEC,
    Tsa_086D8FA4,
    Tsa_086D9170,
    Tsa_086D9354,
};

u16 * CONST_DATA gUnknown_085D8068[] =
{
    Tsa_086D8B54,
    Tsa_086D8C64,
    Tsa_086D953C,
    Tsa_086D96F0,
    Tsa_086D98A8,
    Tsa_086D9A74,
};

u16 * CONST_DATA gUnknown_085D8080[] =
{
    gUnknown_086D8A94,
    Pal_086D8AB4,
    Pal_086D8AD4,
    Pal_086D8AF4,
    Pal_086D8B14,
    Pal_086D8B34,
};

// clang-format on

//! FE8U = 0x08067984
void sub_8067984(struct Anim * anim)
{
    // clang-format off
    static const u16 gUnknown_080DEA4A[] =
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
    proc->frame_config = gUnknown_080DEA4A;

    if (gEkrDistanceType != 0)
    {
        proc->tsal = gUnknown_085D8068;
        proc->tsar = gUnknown_085D8068;
    }
    else
    {
        proc->tsal = gUnknown_085D8050;
        proc->tsar = gUnknown_085D8050;
    }

    proc->img = gUnknown_085D8038;
    proc->pal = gUnknown_085D8080;

    SpellFx_RegisterBgPal(gUnknown_086D8A94, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != 0)
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
void sub_8067A30(struct ProcEfxBG * proc)
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

struct ProcCmd CONST_DATA gUnknown_085D8098[] =
{
    PROC_NAME("efxEvilEyeOBJ"),
    PROC_REPEAT(sub_8067B48),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08067AA0
void sub_8067AA0(struct Anim * anim, int terminator)
{
    u8 pos;
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    // clang-format off
    u32 * gUnknown_080DEA74[2] =
    {
        gUnknown_086C95C0,
        gUnknown_086C978C,
    };
    // clang-format on

    pos = GetAnimPosition(anim);

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D8098, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    scr = gUnknown_080DEA74[pos];

    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;
    frontAnim->yPosition += 24;
    frontAnim->timer = 0;
    frontAnim->drawLayerPriority = 20;

    AnimSort();

    SpellFx_RegisterObjPal(gUnknown_086C93FC, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(gUnknown_086C90A4, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x08067B48
void sub_8067B48(struct ProcEfxOBJ * proc)
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
