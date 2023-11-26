#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"

// clang-format off

struct ProcCmd CONST_DATA gProcScr_efxAlacalibur[] =
{
    PROC_NAME("efxAlacalibur"),
    PROC_REPEAT(efxAlacalibur_Loop_Main),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0805EB98
void StartSpellAnimAircalibur(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(gProcScr_efxAlacalibur, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x0805EBD4
void efxAlacalibur_Loop_Main(struct ProcEfx * proc)
{
    int time;

    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    int duration = EfxGetCamMovDuration();

    time = (gEkrDistanceType != 0) ? 50 : 58;

    proc->timer++;

    if (proc->timer == 1)
    {
        sub_805EE24(proc->anim);
        PlaySFX(0x108, 0x100, proc->anim->xPosition, 1);
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else
    {
        if (proc->timer == time + duration)
        {
            NewEfxFlashBgWhite(proc->anim, 6);
        }
        else if (proc->timer == time + 6 + duration)
        {
            sub_805ECD4(anim);
            sub_805ED98(anim);
            NewEfxALPHA(anim, 6, 5, 16, 0, 0);
            PlaySFX(0x109, 0x100, anim->xPosition, 1);
        }
        else if (proc->timer == time + 8 + duration)
        {
            anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
            StartBattleAnimHitEffectsDefault(anim, proc->hitted);

            if (!proc->hitted)
            {
                EfxPlayHittedSFX(anim);
            }
        }
        else if ((proc->timer != time + 12 + duration) && (proc->timer == time + 14 + duration))
        {
            SpellFx_Finish();
            RegisterEfxSpellCastEnd();
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_efxAlacaliburBG[] =
{
    PROC_NAME("efxAlacaliburBG"),
    PROC_REPEAT(efxAlacaliburBG_Loop),

    PROC_END,
};

// clang-format on

u16 * CONST_DATA TsaArray_AircaliburBg[] =
{
    Tsa_AircaliburBg_A,
    Tsa_AircaliburBg_B,
};

void sub_805ECD4(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        0, 2,
        1, 9,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gProcScr_efxAlacaliburBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;
    proc->tsal = TsaArray_AircaliburBg;

    SpellFx_RegisterBgGfx(Img_AircaliburBg, 0x2000);
    SpellFx_SetSomeColorEffect();

    if (GetAnimPosition(proc->anim) == 0)
    {
        BG_SetPosition(BG_1, 24, 0);
    }
    else
    {
        BG_SetPosition(BG_1, 232, 0);
    }

    return;
}

//! FE8U = 0x0805ED44
void efxAlacaliburBG_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsa = proc->tsal;
        SpellFx_WriteBgMapExt(proc->anim, *(tsa + ret), 32, 20);
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

struct ProcCmd CONST_DATA gProcScr_efxAlacaliburBGCOL[] =
{
    PROC_NAME("efxAlacaliburBGCOL"),
    PROC_MARK(PROC_MARK_A),

    PROC_REPEAT(efxAlacaliburBGCOL_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0805ED98
void sub_805ED98(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        2, 1,
        3, 1,
        4, 1,
        5, 1,
        0, 5,
        1, 2,
        -1,
    };
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gProcScr_efxAlacaliburBGCOL, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;
    proc->frame = 0;
    proc->frame_config = frames;
    proc->pal = Pal_AircaliburBg;

    SpellFx_RegisterBgPal(Pal_AircaliburBg, 0x20);

    return;
}

//! FE8U = 0x0805EDDC
void efxAlacaliburBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * pal = proc->pal;
        SpellFx_RegisterBgPal((pal + (ret * 0x10)), 0x20);
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

struct ProcCmd CONST_DATA gProcScr_efxAlacaliburOBJ[] =
{
    PROC_NAME("efxAlacaliburOBJ"),
    PROC_REPEAT(efxAlacaliburOBJ_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805EE24
void sub_805EE24(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(gProcScr_efxAlacaliburOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    frontAnim = EfxCreateFrontAnim(anim, gUnknown_086267D8, gUnknown_08625094, gUnknown_0862688C, gUnknown_08625148);
    proc->anim2 = frontAnim;

    if (GetAnimPosition(anim) == 0)
    {
        frontAnim->xPosition += 72;
    }
    else
    {
        frontAnim->xPosition -= 72;
    }

    proc->terminator = 96;

    SpellFx_RegisterObjPal(Pal_AircaliburSprites, 0x20);
    SpellFx_RegisterObjGfx(Img_AircaliburSprites, 0x1000);

    return;
}

//! FE8U = 0x0805EEAC
void efxAlacaliburOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}
