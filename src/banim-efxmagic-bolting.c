#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off

struct ProcCmd CONST_DATA gProcScr_efxThunderstorm[] =
{
    PROC_NAME("efxThunderstorm"),
    PROC_REPEAT(efxThunderstorm_Loop_Main),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805E754
void StartSpellAnimBolting(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(gProcScr_efxThunderstorm, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x0805E790
void efxThunderstorm_Loop_Main(struct ProcEfx * proc)
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
        StartSubSpell_efxThunderstormBG(anim);
        StartSubSpell_efxThunderstormCOLOR(anim);
    }

    if (proc->timer == duration + 89)
    {
        StartSubSpell_efxThunderstormDARK(anim, 2, 3);
    }

    if (proc->timer == duration + 94)
    {
        StartSubSpell_efxThunderstormOBJ(anim);
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

struct ProcCmd CONST_DATA gProcScr_efxThunderstormBG[] =
{
    PROC_NAME("efxThunderstormBG"),
    PROC_REPEAT(efxThunderstormBG_Loop),
    PROC_END,
};

u16 * CONST_DATA ImgArray_BoltingBg[] =
{
    Img_BoltingBg_A,
    Img_BoltingBg_A,
    Img_BoltingBg_A,
    Img_BoltingBg_A,
    Img_BoltingBg_B,
    Img_BoltingBg_B,
    Img_BoltingBg_B,
    Img_BoltingBg_B,
    Img_BoltingBg_B,
    Img_BoltingBg_B,
    Img_BoltingBg_C,
};

u16 * CONST_DATA TsaArray_BoltingBg[] =
{
    Tsa_BoltingBg_A,
    Tsa_BoltingBg_B,
    Tsa_BoltingBg_C,
    Tsa_BoltingBg_D,
    Tsa_BoltingBg_E,
    Tsa_BoltingBg_F,
    Tsa_BoltingBg_G,
    Tsa_BoltingBg_H,
    Tsa_BoltingBg_I,
    Tsa_BoltingBg_J,
    Tsa_BoltingBg_K,
};

// clang-format on

//! FE8U = 0x0805E850
void StartSubSpell_efxThunderstormBG(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
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

    proc = Proc_Start(gProcScr_efxThunderstormBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;
    proc->tsal = TsaArray_BoltingBg;
    proc->tsar = TsaArray_BoltingBg;
    proc->img = ImgArray_BoltingBg;

    SpellFx_RegisterBgPal(Pal_BoltingBg, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x0805E8A4
void efxThunderstormBG_Loop(struct ProcEfxBG * proc)
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
            gEfxBgSemaphore--;
            Proc_End(proc);
        }
    }
    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_efxThunderstormOBJ[] =
{
    PROC_NAME("efxThunderstormOBJ"),

    PROC_REPEAT(efxThunderstormOBJ_Loop),
    PROC_SLEEP(100),

    PROC_REPEAT(efxThunderstormOBJ_End),

    PROC_END,
};

// clang-format on


//! FE8U = 0x0805E900
void StartSubSpell_efxThunderstormOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gProcScr_efxThunderstormOBJ, PROC_TREE_3);
    proc->anim = anim;

    return;
}

//! FE8U = 0x0805E924
void efxThunderstormOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->anim2 = EfxCreateFrontAnim(proc->anim, gUnknown_0860A5D4, gUnknown_0860A5D4, gUnknown_0860A5D4, gUnknown_0860A5D4);

    SpellFx_RegisterObjPal(Pal_BoltingSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BoltingSprites, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0805E968
void efxThunderstormOBJ_End(struct ProcEfxOBJ * proc)
{
    AnimDelete(proc->anim2);

    gEfxBgSemaphore--;
    Proc_Break(proc);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_efxThunderstormCOLOR[] =
{
    PROC_NAME("efxThunderstormCOLOR"),
    PROC_SLEEP(94),

    PROC_REPEAT(efxThunderstormColor_Loop_A),
    PROC_SLEEP(3),

    PROC_REPEAT(efxThunderstormColor_Loop_B),
    PROC_SLEEP(20),

    PROC_REPEAT(efxThunderstormColor_Loop_C),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0805E98C
void StartSubSpell_efxThunderstormCOLOR(struct Anim * anim)
{
    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gProcScr_efxThunderstormCOLOR, PROC_TREE_3);
    proc->anim = anim;

    return;
}

//! FE8U = 0x0805E9B0
void efxThunderstormColor_Loop_A(struct ProcEfxBGCOL * proc)
{
    PlaySFX(0x11a, 0x100, proc->anim->xPosition, 1);

    NewEfxFlashBgWhite(proc->anim, 38);

    proc->timer = 0;
    proc->timer2 = 5;

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0805E9E4
void efxThunderstormColor_Loop_B(struct ProcEfxBGCOL * proc)
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
void efxThunderstormColor_Loop_C(struct ProcEfxBGCOL * proc)
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

struct ProcCmd CONST_DATA gProcScr_efxThunderstormDARK[] =
{
    PROC_NAME("efxThunderstormDARK"),

    PROC_REPEAT(efxThunderstormDark_Loop_A),
    PROC_REPEAT(efxThunderstormDark_Loop_B),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0805EAAC
void StartSubSpell_efxThunderstormDARK(struct Anim * anim, int timer, int terminator)
{
    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    CpuFastCopy(gPaletteBuffer, gEfxPal, PLTT_SIZE);

    proc = Proc_Start(gProcScr_efxThunderstormDARK, 0);
    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = timer;
    proc->terminator = terminator;

    return;
}

//! FE8U = 0x0805EAF0
void efxThunderstormDark_Loop_A(struct ProcEfxBGCOL * proc)
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
void efxThunderstormDark_Loop_B(struct ProcEfxBGCOL * proc)
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
