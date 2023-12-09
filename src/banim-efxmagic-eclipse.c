#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D64A4[] =
{
    PROC_NAME("efxHazymoon"),
    PROC_REPEAT(sub_80602C8),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0806028C
void sub_806028C(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(gUnknown_085D64A4, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x080602C8
void sub_80602C8(struct ProcEfx * proc)
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
        sub_8060440(proc->anim);
        sub_8060790(proc->anim);
        PlaySFX(0x138, 0x100, 0x78, 0);
    }
    else if (proc->timer == duration + 70)
    {
        StartSubSpell_efxResireRST(anim, NewefxRestRST(anim, 42, 15, 0, 2), 30);
        NewEfxRestWINH_(anim, 43, 0);
    }
    else if (proc->timer == duration + 120)
    {
        sub_80604B0(anim);
    }
    else if (proc->timer == duration + 125)
    {
        PlaySFX(0x139, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 151)
    {
        sub_80605E8(proc->anim);
    }
    else if (proc->timer == duration + 226)
    {
        PlaySFX(0x2E2, 0x100, anim->xPosition, 1);
        NewEfxFlashBgWhite(anim, 10);
        anim->state3 |= 9;
        StartBattleAnimHitEffectsDefault(anim, proc->hitted);
        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 236)
    {
        sub_8060514(anim);
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

struct ProcCmd CONST_DATA gUnknown_085D64BC[] =
{
    PROC_NAME("efxHazymoonBG"),
    PROC_REPEAT(sub_806056C),
    PROC_END,
};

u16 * CONST_DATA gUnknown_085D64D4[] =
{
    Tsa_0864E7D0,
    Tsa_0864E974,
    Tsa_0864EA14,
    Tsa_0864EAB4,
    Tsa_0864EB68,
    Tsa_0864EC1C,
    Tsa_0864ECD0,
    Tsa_0864EDAC,
    Tsa_0864EE88,
    Tsa_0864EF9C,
    Tsa_0864F0B0,
    Tsa_0864F1C4,
    Tsa_0864F2D8,
    Tsa_0864F3EC,
    Tsa_0864F4F8,
    Tsa_0864F5D0,
    Tsa_0864F6E0,
    Tsa_0864F848,
    Tsa_0864FA0C,
    Tsa_0864FBD0,
    Tsa_0864FD8C,
    Tsa_0864FF3C,
    Tsa_086500EC,
    Tsa_0865029C,
    Tsa_08650440,
    Tsa_086505D8,
    Tsa_08650768,
};

u16 * CONST_DATA gUnknown_085D6540[] =
{
    Img_08646550,
    Img_08646898,
    Img_08646898,
    Img_08646898,
    Img_08646898,
    Img_08646898,
    Img_08646898,
    Img_08646898,
    Img_08646898,
    Img_08646898,
    Img_08646898,
    Img_08646898,
    Img_08646898,
    Img_08646898,
    Img_0864716C,
    Img_0864716C,
    Img_0864716C,
    Img_086481A8,
    Img_08648E14,
    Img_08649A30,
    Img_0864A588,
    Img_0864B0DC,
    Img_0864BB8C,
    Img_0864C5B4,
    Img_0864CEB0,
    Img_0864D77C,
    Img_0864DFFC,
};

// clang-format on

//! FE8U = 0x08060440
void sub_8060440(struct Anim * anim)
{
    // clang-format off
    static const u16 gUnknown_080DD5D2[] =
    {
         0, 100,
        -1,
    };
    // clang-format on

    struct ProcEfxEclipseBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D64BC, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DD5D2;

    proc->tsal = gUnknown_085D64D4;
    proc->tsar = gUnknown_085D64D4;

    proc->img = gUnknown_085D6540;
    proc->pal = NULL;

    SpellFx_RegisterBgPal(Pal_NosferatuBg, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    SetWinEnable(0, 0, 0);

    return;
}

//! FE8U = 0x080604B0
void sub_80604B0(struct Anim * anim)
{
    // clang-format off
    static const u16 gUnknown_080DD5D8[] =
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

    proc = Proc_Start(gUnknown_085D64BC, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DD5D8;

    proc->tsal = gUnknown_085D64D4;
    proc->tsar = gUnknown_085D64D4;

    proc->img = gUnknown_085D6540;
    proc->pal = NULL;

    SpellFx_RegisterBgPal(gUnknown_0864E790, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    SetBlendAlpha(12, 6);

    return;
}

//! FE8U = 0x08060514
void sub_8060514(struct Anim * anim)
{
    // clang-format off
    static const u16 gUnknown_080DD67A[] =
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

    proc = Proc_Start(gUnknown_085D64BC, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DD67A;

    proc->tsal = gUnknown_085D64D4;
    proc->tsar = gUnknown_085D64D4;

    proc->img = gUnknown_085D6540;
    proc->pal = NULL;

    SpellFx_RegisterBgPal(gUnknown_0864E7B0, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x0806056C
void sub_806056C(struct ProcEfxEclipseBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;

        u16 ** img = proc->img;

        if (proc->pal != *(img + ret))
        {
            SpellFx_RegisterBgGfx(*(img + ret), 0x2000);
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

    PROC_SET_END_CB(sub_8060664),

    PROC_REPEAT(sub_806067C),
    PROC_REPEAT(sub_80606D8),
    PROC_REPEAT(sub_8060734),
    PROC_REPEAT(sub_806067C),
    PROC_REPEAT(sub_80606D8),
    PROC_REPEAT(sub_8060734),

    PROC_END,
};

// clang-format on

//! FE8U = 0x080605E8
void sub_80605E8(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * otherAnim;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxHazymoonOBJ2, PROC_TREE_3);
    proc->anim = anim;
    otherAnim = GetAnimAnotherSide(anim);
    proc->timer = 0;

    frontAnim =
        EfxCreateFrontAnim(otherAnim, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90);
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
void sub_8060664(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
    return;
}

//! FE8U = 0x0806067C
void sub_806067C(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    proc->timer++;

    if (proc->timer == 1)
    {
        anim->pScrStart = gUnknown_086517DC;
        anim->pScrCurrent = gUnknown_086517DC;
        anim->timer = 0;

        proc->terminator = 10;

        SpellFx_RegisterObjPal(gUnknown_0865163C, PLTT_SIZE_4BPP);
        SpellFx_RegisterObjGfx(gUnknown_086508DC, 32 * 4 * CHR_SIZE);
    }
    else if (proc->timer == proc->terminator)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080606D8
void sub_80606D8(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    proc->timer++;

    if (proc->timer == 1)
    {
        anim->pScrStart = gUnknown_08651AE4;
        anim->pScrCurrent = gUnknown_08651AE4;
        anim->timer = 0;

        proc->terminator = 10;

        SpellFx_RegisterObjPal(gUnknown_0865163C, PLTT_SIZE_4BPP);
        SpellFx_RegisterObjGfx(gUnknown_08650DA8, 32 * 4 * CHR_SIZE);
    }
    else if (proc->timer == proc->terminator)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08060734
void sub_8060734(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    proc->timer++;

    if (proc->timer == 1)
    {
        anim->pScrStart = gUnknown_08651DE0;
        anim->pScrCurrent = gUnknown_08651DE0;
        anim->timer = 0;

        proc->terminator = 10;

        SpellFx_RegisterObjPal(gUnknown_0865163C, PLTT_SIZE_4BPP);
        SpellFx_RegisterObjGfx(gUnknown_08651240, 32 * 4 * CHR_SIZE);
    }
    else if (proc->timer == proc->terminator)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D65F4[] =
{
    PROC_NAME("efxHazymoonOBJ3"),
    PROC_REPEAT(sub_80607D8),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08060790
void sub_8060790(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D65F4, PROC_TREE_3);
    proc->anim = anim;

    proc->timer = 0;
    proc->terminator = 0;

    proc->unk30 = 0x2c;

    SpellFx_RegisterObjPal(Pal_FluxAnimSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_FluxAnimSprites_Orb, 32 * 4 * CHR_SIZE);

    return;
}

// clang-format off

s16 CONST_DATA gUnknown_085D660C[] =
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
void sub_80607D8(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == 8)
    {
        s16 x;
        s16 y;

        proc->timer = 0;

        x = gUnknown_085D660C[proc->terminator * 2];
        y = gUnknown_085D660C[proc->terminator * 2 + 1];

        sub_8060838(proc->anim, x, y);

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

struct ProcCmd CONST_DATA gUnknown_085D6624[] =
{
    PROC_NAME("efxHazymoonOBJ3RND"),
    PROC_SET_END_CB(sub_806088C),

    PROC_SLEEP(44),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08060838
void sub_8060838(struct Anim * anim, int x, int y)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D6624, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    frontAnim = EfxCreateFrontAnim(anim, gUnknown_0862D6E0, gUnknown_0862D6E0, gUnknown_0862D6E0, gUnknown_0862D6E0);
    proc->anim2 = frontAnim;

    frontAnim->xPosition = x;
    frontAnim->yPosition = y;

    return;
}

//! FE8U = 0x0806088C
void sub_806088C(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
    return;
}
