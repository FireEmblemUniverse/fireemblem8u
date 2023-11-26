#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D5770[] =
{
    PROC_NAME("efxThunderstorm"),
    PROC_REPEAT(sub_805E790),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805E754
void sub_805E754(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(gUnknown_085D5770, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x0805E790
void sub_805E790(struct ProcEfx * proc)
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
        PlaySFX(0x119, 0x100, anim->xPosition, 1);
        sub_805E850(anim);
        sub_805E98C(anim);
    }

    if (proc->timer == duration + 89)
    {
        sub_805EAAC(anim, 2, 3);
    }

    if (proc->timer == duration + 94)
    {
        sub_805E900(anim);
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
        StartBattleAnimHitEffectsDefault(anim, proc->hitted);
        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if ((proc->timer != duration + 195) && (proc->timer == duration + 200))
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D5788[] =
{
    PROC_NAME("efxThunderstormBG"),
    PROC_REPEAT(sub_805E8A4),
    PROC_END,
};

u16 * CONST_DATA gUnknown_085D57A0[] =
{
    Img_08605E70,
    Img_08605E70,
    Img_08605E70,
    Img_08605E70,
    Img_08606A40,
    Img_08606A40,
    Img_08606A40,
    Img_08606A40,
    Img_08606A40,
    Img_08606A40,
    Img_08607AAC,
};

u16 * CONST_DATA gUnknown_085D57CC[] =
{
    Tsa_08608898,
    Tsa_08608A2C,
    Tsa_08608C34,
    Tsa_08608D98,
    Tsa_08608E78,
    Tsa_08608F90,
    Tsa_0860913C,
    Tsa_0860925C,
    Tsa_08609348,
    Tsa_08609430,
    Tsa_086094C8,
};

// clang-format on

//! FE8U = 0x0805E850
void sub_805E850(struct Anim * anim)
{
    // clang-format off
    static const u16 gUnknown_080DCF7E[] =
    {
         0,  2,
         1,  2,
         2,  2,
         3,  2,
         7,  8,
         4,  3,
         9,  8,
         7,  1,
         9,  8,
         5,  2,
         9,  8,
         8,  1,
         9,  8,
         6,  2,
         9,  6,
         9, 38,
        10, 38,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D5788, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DCF7E;
    proc->tsal = gUnknown_085D57CC;
    proc->tsar = gUnknown_085D57CC;
    proc->img = gUnknown_085D57A0;

    SpellFx_RegisterBgPal(gUnknown_08608838, 0x20);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x0805E8A4
void sub_805E8A4(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;
        SpellFx_RegisterBgGfx(*(img + ret), 0x2000);
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
    }
    else
    {
        if (ret == -1)
        {
            gEfxBgSemaphore--;
            Proc_End(proc);
        }
    }
    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D57F8[] =
{
    PROC_NAME("efxThunderstormOBJ"),

    PROC_REPEAT(sub_805E924),
    PROC_SLEEP(100),

    PROC_REPEAT(sub_805E968),

    PROC_END,
};

// clang-format on


//! FE8U = 0x0805E900
void sub_805E900(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D57F8, PROC_TREE_3);
    proc->anim = anim;

    return;
}

//! FE8U = 0x0805E924
void sub_805E924(struct ProcEfxOBJ * proc)
{
    proc->anim2 = EfxCreateFrontAnim(proc->anim, gUnknown_0860A5D4, gUnknown_0860A5D4, gUnknown_0860A5D4, gUnknown_0860A5D4);

    SpellFx_RegisterObjPal(gUnknown_085F3F40, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_085F3AA8, 0x1000);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0805E968
void sub_805E968(struct ProcEfxOBJ * proc)
{
    AnimDelete(proc->anim2);

    gEfxBgSemaphore--;
    Proc_Break(proc);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D5820[] =
{
    PROC_NAME("efxThunderstormCOLOR"),
    PROC_SLEEP(94),

    PROC_REPEAT(sub_805E9B0),
    PROC_SLEEP(3),

    PROC_REPEAT(sub_805E9E4),
    PROC_SLEEP(20),

    PROC_REPEAT(sub_805EA4C),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0805E98C
void sub_805E98C(struct Anim * anim)
{
    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D5820, PROC_TREE_3);
    proc->anim = anim;

    return;
}

//! FE8U = 0x0805E9B0
void sub_805E9B0(struct ProcEfxBGCOL * proc)
{
    PlaySFX(0x11a, 0x100, proc->anim->xPosition, 1);

    NewEfxFlashBgWhite(proc->anim, 38);

    proc->timer = 0;
    proc->timer2 = 5;

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0805E9E4
void sub_805E9E4(struct ProcEfxBGCOL * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 16, 0, proc->timer, proc->timer2);

    CpuFastCopy(gPaletteBuffer, gEfxPal, PLTT_SIZE);

    EfxPalWhiteInOut(gEfxPal, 0, 32, ret);

    proc->timer++;

    if (proc->timer > proc->timer2)
    {
        proc->timer = 0;
        proc->timer2 = 10;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0805EA4C
void sub_805EA4C(struct ProcEfxBGCOL * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 16, 0, proc->timer, proc->timer2);
    SetBlendAlpha(ret, 16);

    proc->timer++;

    if (proc->timer > proc->timer2)
    {
        SpellFx_ClearBG1();
        SetDefaultColorEffects_();

        gEfxBgSemaphore--;

        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D5860[] =
{
    PROC_NAME("efxThunderstormDARK"),

    PROC_REPEAT(sub_805EAF0),
    PROC_REPEAT(sub_805EB54),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0805EAAC
void sub_805EAAC(struct Anim * anim, int timer, int terminator)
{
    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    CpuFastCopy(gPaletteBuffer, gEfxPal, PLTT_SIZE);

    proc = Proc_Start(gUnknown_085D5860, 0);
    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = timer;
    proc->terminator = terminator;

    return;
}

//! FE8U = 0x0805EAF0
void sub_805EAF0(struct ProcEfxBGCOL * proc)
{
    int ret = Interpolate(INTERPOLATE_LINEAR, 0, 16, proc->timer, proc->timer2);
    EfxPalBlackInOut(gEfxPal, 0, 32, ret);

    CpuFastCopy(gEfxPal, (u16 *)PLTT, PLTT_SIZE);
    DisablePaletteSync();

    proc->timer++;

    if (proc->timer > proc->timer2)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0805EB54
void sub_805EB54(struct ProcEfxBGCOL * proc)
{
    CpuFastCopy(gEfxPal, (u16 *)PLTT, PLTT_SIZE);
    DisablePaletteSync();

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}
