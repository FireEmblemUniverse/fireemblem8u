#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "mu.h"
#include "bmudisp.h"
#include "bmmap.h"
#include "ctc.h"

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxLive[] =
{
    PROC_NAME("efxLive"),
    PROC_REPEAT(efxLive_Loop_Main),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08061024
void StartSpellAnimHeal(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxLive, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    return;
}

//! FE8U = 0x0806104C
void efxLive_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 1)
    {
        StartSubSpell_efxLiveOBJ(proc->anim);
        PlaySFX(0x2cc, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 52)
    {
        StartSubSpell_efxLiveBG_A(proc->anim, 0);
        StartSubSpell_efxLiveBGCOL_A(proc->anim, 0);

        SetBlendAlpha(0, 16);

        StartSubSpell_efxLiveALPHA(proc->anim, 1, 12, 0);
        StartSubSpell_efxLiveALPHA(proc->anim, 35, 25, 1);

        PlaySFX(0x10e, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 55)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
    }
    else if (proc->timer == 113)
    {
        StartSubSpell_efxLiveBG_B(proc->anim, 0);
        StartSubSpell_efxLiveBGCOL_B(proc->anim, 0);

        StartSubSpell_efxLiveALPHA(proc->anim, 1, 12, 0);
        StartSubSpell_efxLiveALPHA(proc->anim, 29, 25, 1);

        PlaySFX(0x10F, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == 166)
    {
        NewEfxHpBarLive(anim);
    }
    else if (proc->timer == 181)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        if (GetAnimNextRoundType(anim) != -1)
        {
            anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;
        }

        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxRelive[] =
{
    PROC_NAME("efxRelive"),
    PROC_REPEAT(efxRelive_Loop_Main),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08061158
void StartSpellAnimMend(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxRelive, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    return;
}

//! FE8U = 0x08061180
void efxRelive_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        StartSubSpell_efxLiveOBJ(proc->anim);
        PlaySFX(0x2cc, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 52)
    {
        StartSubSpell_efxLiveBG_A(proc->anim, 1);
        StartSubSpell_efxLiveBGCOL_A(proc->anim, 1);

        SetBlendAlpha(0, 16);

        StartSubSpell_efxLiveALPHA(proc->anim, 1, 12, 0);
        StartSubSpell_efxLiveALPHA(proc->anim, 35, 25, 1);

        PlaySFX(0x110, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 55)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
    }
    else if (proc->timer == 113)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else if (proc->timer == duration + 114)
    {
        StartSubSpell_efxLiveBG_B(proc->anim, 1);
        StartSubSpell_efxLiveBGCOL_B(proc->anim, 1);

        SetBlendAlpha(0, 16);

        StartSubSpell_efxLiveALPHA(proc->anim, 1, 12, 0);
        StartSubSpell_efxLiveALPHA(proc->anim, 29, 25, 1);

        PlaySFX(0x111, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 166)
    {
        NewEfxHpBarLive(anim);
    }
    else if (proc->timer == duration + 181)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        if (GetAnimNextRoundType(anim) != -1)
        {
            anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;
        }

        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxRecover[] =
{
    PROC_NAME("efxRecover"),
    PROC_REPEAT(efxRecover_Loop_Main),
    PROC_END,
};

// clang-format on

//! FE8U = 0x080612BC
void StartSpellAnimRecover(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxRecover, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    return;
}

//! FE8U = 0x080612E4
void efxRecover_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        StartSubSpell_efxLiveOBJ(proc->anim);
        PlaySFX(0x2cc, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 52)
    {
        StartSubSpell_efxLiveBG_A(proc->anim, 2);
        StartSubSpell_efxLiveBGCOL_A(proc->anim, 2);

        SetBlendAlpha(0, 16);

        StartSubSpell_efxLiveALPHA(proc->anim, 1, 12, 0);
        StartSubSpell_efxLiveALPHA(proc->anim, 35, 25, 1);

        PlaySFX(0x112, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 55)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
    }
    else if (proc->timer == 113)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else if (proc->timer == duration + 114)
    {
        StartSubSpell_efxLiveBG_B(proc->anim, 2);
        StartSubSpell_efxLiveBGCOL_B(proc->anim, 2);

        SetBlendAlpha(0, 16);

        StartSubSpell_efxLiveALPHA(proc->anim, 1, 12, 0);
        StartSubSpell_efxLiveALPHA(proc->anim, 29, 25, 1);

        PlaySFX(0x113, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 166)
    {
        NewEfxHpBarLive(anim);
    }
    else if (proc->timer == duration + 181)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        if (GetAnimNextRoundType(anim) != -1)
        {
            anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;
        }

        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxReblow[] =
{
    PROC_NAME("efxReblow"),
    PROC_REPEAT(efxReblow_Loop_Main),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08061420
void StartSpellAnimPhysic(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxReblow, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    return;
}

//! FE8U = 0x08061448
void efxReblow_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        StartSubSpell_efxLiveOBJ(proc->anim);
        StartSubSpell_efxReblowOBJ(proc->anim, 0);
        PlaySFX(0x2cc, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 52)
    {
        StartSubSpell_efxLiveBG_A(proc->anim, 0);
        StartSubSpell_efxLiveBGCOL_A(proc->anim, 0);

        SetBlendAlpha(0, 16);

        StartSubSpell_efxLiveALPHA(proc->anim, 1, 12, 0);
        StartSubSpell_efxLiveALPHA(proc->anim, 35, 25, 1);

        PlaySFX(0x10e, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 55)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
    }
    else if (proc->timer == 151)
    {
        StartSubSpell_efxReblowOBJ(proc->anim, 1);
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else if (proc->timer == duration + 161)
    {
        StartSubSpell_efxLiveBG_B(proc->anim, 0);
        StartSubSpell_efxLiveBGCOL_B(proc->anim, 0);

        SetBlendAlpha(0, 16);

        StartSubSpell_efxLiveALPHA(proc->anim, 1, 12, 0);
        StartSubSpell_efxLiveALPHA(proc->anim, 29, 25, 1);

        PlaySFX(0x10F, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 211)
    {
        NewEfxHpBarLive(anim);
        return;
    }
    else if (proc->timer == duration + 221)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        if (GetAnimNextRoundType(anim) != -1)
        {
            anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;
        }

        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxLiveBG[] =
{
    PROC_NAME("efxLiveBG"),
    PROC_REPEAT(efxLiveBG_Loop),
    PROC_END,
};

const u16 gUnknown_080DD8C6[] =
{
     0, 62,
    -1,
};

const u16 gUnknown_080DD8CC[] =
{
     1, 62,
    -1,
};

const u16 gUnknown_080DD8D2[] =
{
     0, 62,
    -1,
};

const u16 gUnknown_080DD8D8[] =
{
     1, 62,
    -1,
};

// clang-format on

//! FE8U = 0x08061594
void StartSubSpell_efxLiveBG_A(struct Anim * anim, u32 kind)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLiveBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;

    switch (kind)
    {
        case 0:
            proc->unk29 = 1;
            proc->frame_config = gUnknown_080DD8C6;
            proc->tsal = gUnknown_0866F774;
            proc->tsar = gUnknown_0866F774;

            SpellFx_RegisterBgGfx(Img_HealSpellBg, 32 * 1 * CHR_SIZE);

            if (gEkrDistanceType != 0)
            {
                if (GetAnimPosition(proc->anim) == 0)
                {
                    BG_SetPosition(BG_1, 24, 0);
                }
                else
                {
                    BG_SetPosition(BG_1, 232, 0);
                }
            }

            break;

        case 1:
        case 2:
            proc->unk29 = 1;
            proc->frame_config = gUnknown_080DD8D2;

            proc->tsal = gUnknown_08670D40;
            proc->tsar = gUnknown_086716A0;

            SpellFx_RegisterBgGfx(gUnknown_08670548, 28 * 6 * CHR_SIZE);

            break;
    }

    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08061650
void StartSubSpell_efxLiveBG_B(struct Anim * anim, u32 kind)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLiveBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;

    proc->unk29 = 0;

    switch (kind)
    {
        case 0:
            proc->frame_config = gUnknown_080DD8CC;
            proc->tsal = gUnknown_0866F774;
            proc->tsar = gUnknown_0866F774;

            SpellFx_RegisterBgGfx(Img_HealSpellBg, 32 * 1 * CHR_SIZE);

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

            break;

        case 1:
        case 2:
            proc->frame_config = gUnknown_080DD8D8;

            proc->tsal = gUnknown_08670D40;
            proc->tsar = gUnknown_086716A0;

            SpellFx_RegisterBgGfx(gUnknown_08670548, 28 * 6 * CHR_SIZE);

            break;
    }

    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08061704
void efxLiveBG_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;

        // TODO: Is this the correct data type?
        sub_805560C(proc->anim, (u16 *)(tsaL + ret * 0x12c), (u16 *)(tsaR + ret * 0x12c));
    }
    else
    {
        if (ret == -1)
        {
            if (proc->unk29 == 0)
            {
                SpellFx_ClearBG1();
                SetDefaultColorEffects_();
            }

            BG_SetPosition(BG_1, 0, 0);
            gEfxBgSemaphore--;

            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxLiveBGCOL[] =
{
    PROC_NAME("efxLiveBGCOL"),
    PROC_MARK(PROC_MARK_A),
    PROC_REPEAT(efxLiveBGCOL_Loop),
    PROC_END,
};

const u16 gUnknown_080DD8EE[] =
{
     0, 3,
     1, 3,
     2, 3,
     3, 4,
     4, 4,
     5, 4,
     6, 4,
     7, 4,
     8, 4,
     9, 4,
    10, 4,
    11, 4,
    12, 4,
    13, 4,
    14, 4,
    15, 5,
    -1,
};

const u16 gUnknown_080DD930[] =
{
    15, 5,
    14, 4,
    13, 4,
    12, 4,
    11, 4,
    10, 4,
     9, 4,
     8, 4,
     7, 4,
     6, 4,
     5, 4,
     4, 4,
     3, 4,
     2, 3,
     1, 3,
     0, 3,
    -1,
};

const u16 gUnknown_080DD972[] =
{
     0, 3,
     1, 3,
     2, 3,
     3, 4,
     4, 4,
     5, 4,
     6, 4,
     7, 4,
     8, 4,
     9, 4,
    10, 4,
    11, 4,
    -1,
};

const u16 gUnknown_080DD9A4[] =
{
     0, 3,
     1, 3,
     2, 3,
     3, 4,
     4, 4,
     5, 4,
     6, 4,
     7, 4,
     8, 4,
     9, 4,
    10, 4,
    11, 4,
    12, 4,
    13, 4,
    14, 4,
    15, 5,
    -1,
};

// clang-format on

//! FE8U = 0x08061774
void StartSubSpell_efxLiveBGCOL_A(struct Anim * anim, u32 kind)
{
    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLiveBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;

    if (kind == 0)
    {
        proc->frame_config = gUnknown_080DD8EE;
    }
    else if (kind == 1)
    {
        proc->frame_config = gUnknown_080DD972;
    }
    else
    {
        proc->frame_config = gUnknown_080DD9A4;
    }

    if (kind == 0)
    {
        proc->pal = Pal_HealSpellBg;
    }
    else if (kind == 1)
    {
        proc->pal = gUnknown_08672220;
    }
    else
    {
        proc->pal = gUnknown_08672000;
    }

    return;
}

//! FE8U = 0x080617E4
void StartSubSpell_efxLiveBGCOL_B(struct Anim * anim, u32 kind)
{
    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLiveBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;

    if (kind == 0)
    {
        proc->frame_config = gUnknown_080DD930;
    }
    else if (kind == 1)
    {
        proc->frame_config = gUnknown_080DD972;
    }
    else
    {
        proc->frame_config = gUnknown_080DD9A4;
    }

    if (kind == 0)
    {
        proc->pal = Pal_HealSpellBg;
    }
    else if (kind == 1)
    {
        proc->pal = gUnknown_08672220;
    }
    else
    {
        proc->pal = gUnknown_08672000;
    }

    return;
}

//! FE8U = 0x08061854
void efxLiveBGCOL_Loop(struct ProcEfxBGCOL * proc)
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
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxLiveALPHA[] =
{
    PROC_NAME("efxLiveALPHA"),
    PROC_REPEAT(efxLiveALPHA_Loop_A),
    PROC_REPEAT(efxLiveALPHA_Loop_B),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0806189C
void StartSubSpell_efxLiveALPHA(struct Anim * anim, int timer, int c, int d)
{
    struct ProcEfxALPHA * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLiveALPHA, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = timer;
    proc->unk2E = c;
    proc->unk29 = d;

    return;
}

//! FE8U = 0x080618D8
void efxLiveALPHA_Loop_A(struct ProcEfxALPHA * proc)
{
    proc->timer--;

    if (proc->timer == 0)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080618F4
void efxLiveALPHA_Loop_B(struct ProcEfxALPHA * proc)
{
    int coeffA;

    if (proc->timer > proc->unk2E)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
    else
    {
        if (proc->unk29 == 0)
        {
            coeffA = Interpolate(INTERPOLATE_LINEAR, 0, 16, proc->timer, proc->unk2E);
        }
        else
        {
            coeffA = Interpolate(INTERPOLATE_LINEAR, 16, 0, proc->timer, proc->unk2E);
        }

        SetBlendAlpha(coeffA, 16);

        proc->timer++;
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxLiveOBJ[] =
{
    PROC_NAME("efxLiveOBJ"),
    PROC_REPEAT(efxLiveOBJ_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0806196C
void StartSubSpell_efxLiveOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLiveOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 51;

    proc->anim2 = EfxCreateFrontAnim(anim, gUnknown_08675114, gUnknown_08675114, gUnknown_08675114, gUnknown_08675114);

    SpellFx_RegisterObjPal(Pal_HealSprites_Sparkles, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_HealSprites_Sparkles, 32 * 4 * CHR_SIZE);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxReserveOBJ[] =
{
    PROC_NAME("efxReserveOBJ"),
    PROC_REPEAT(efxReserveOBJ_Loop_A),
    PROC_REPEAT(efxReserveOBJ_Loop_B),
    PROC_END,
};

// clang-format on

//! FE8U = 0x080619CC
void StartSubSpell_efxReserveOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxReserveOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 51;
    proc->unk30 = 52;

    proc->anim2 = EfxCreateFrontAnim(anim, gUnknown_08675114, gUnknown_08675114, gUnknown_08675114, gUnknown_08675114);

    SpellFx_RegisterObjPal(Pal_HealSprites_Sparkles, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_HealSprites_Sparkles, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x08061A30
void efxLiveOBJ_Loop(struct ProcEfxOBJ * proc)
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

//! FE8U = 0x08061A64
void efxReserveOBJ_Loop_A(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        anim->pScrStart = gUnknown_086751A4;
        anim->pScrCurrent = gUnknown_086751A4;

        anim->timer = 0;
        proc->timer = 0;

        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08061A98
void efxReserveOBJ_Loop_B(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == (s16)proc->unk30)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxReblowOBJ[] =
{
    PROC_NAME("efxReblowOBJ"),
    PROC_REPEAT(efxReblowOBJ_Loop_A),
    PROC_REPEAT(efxReblowOBJ_Loop_B),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08061ACC
void StartSubSpell_efxReblowOBJ(struct Anim * anim, u32 kind)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxReblowOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk29 = kind;

    if (kind == 0)
    {
        proc->terminator = 43;
        proc->unk30 = 68;
    }
    else
    {
        proc->terminator = 31;
        proc->unk30 = 61;
    }

    return;
}

//! FE8U = 0x08061B14
void efxReblowOBJ_Loop_A(struct ProcEfxOBJ * proc)
{
    struct Anim * anim;
    int x;
    int y;
    u32 * scrA;
    u32 * scrB;

    proc->timer++;

    if (proc->timer != proc->terminator)
    {
        return;
    }

    proc->timer = 0;

    if (proc->unk29 == 0)
    {
        scrA = gUnknown_086766C0;
        scrB = gUnknown_08677CC0;

        if (gEkrDistanceType != 0)
        {
            x = (GetAnimPosition(proc->anim) == 0) ? 104 : 136;
        }
        else
        {
            x = (GetAnimPosition(proc->anim) == 0) ? 128 : 112;
        }

        y = 78;
    }
    else
    {
        scrA = gUnknown_08676734;
        scrB = gUnknown_08677D34;

        if (gEkrDistanceType != 0)
        {
            x = (GetAnimPosition(proc->anim) == 0) ? 164 : 76;
        }
        else
        {
            x = (GetAnimPosition(proc->anim) == 0) ? 140 : 100;
        }

        y = 64;
    }

    anim = EfxCreateFrontAnim(proc->anim, scrB, scrA, scrB, scrA);
    proc->anim2 = anim;
    anim->xPosition = x;
    anim->yPosition = y;

    Proc_Break(proc);

    return;
}

//! FE8U = 0x08061BE4
void efxReblowOBJ_Loop_B(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == (s16)proc->unk30)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxReserve[] =
{
    PROC_NAME("efxReserve"),
    PROC_REPEAT(efxReserve_Loop_Main),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08061C18
void StartSpellAnimFortify(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxReserve, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = 0;

    return;
}

//! FE8U = 0x08061C48
void StartSpellAnimLatona(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxReserve, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = 1;

    return;
}

//! FE8U = 0x08061C78
void efxReserve_Loop_Main(struct ProcEfx * proc)
{
    proc->timer++;

    if (proc->timer == 1)
    {
        StartSubSpell_efxReserveOBJ(proc->anim);
        PlaySFX(0x2cc, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 52)
    {
        StartSubSpell_efxReserveBG(proc->anim);
        StartSubSpell_efxReserveBGCOL(proc->anim, proc->hitted);
    }
    else if (proc->timer == 183)
    {
        PlaySFX(0x114, 0x100, 120, 0);

        StartSubSpell_efxReserveBG2(proc->anim);
        StartSubSpell_efxReserveBGCOL2(proc->anim, proc->hitted);

        SetBlendAlpha(0, 16);

        StartSubSpell_efxLiveALPHA(proc->anim, 1, 20, 0);
        StartSubSpell_efxLiveALPHA(proc->anim, 180, 40, 1);
    }
    else if (proc->timer == 453)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxReserveBG[] =
{
    PROC_NAME("efxReserveBG"),
    PROC_REPEAT(efxReserveBG_Loop),
    PROC_END,
};

u16 * CONST_DATA TsaArray_Fortify[] =
{
    Tsa_08677E80,
    Tsa_08677F8C,
    Tsa_0867808C,
    Tsa_08678198,
};

// clang-format on

//! FE8U = 0x08061D28
void StartSubSpell_efxReserveBG(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
         0, 32,
         1, 32,
         2, 32,
         3, 32,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxReserveBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_Fortify;
    proc->tsar = TsaArray_Fortify;

    SpellFx_RegisterBgGfx(Img_HealSpellBg, 32 * 1 * CHR_SIZE);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08061D78
void efxReserveBG_Loop(struct ProcEfxBG * proc)
{
    static const u16 songIds[] = {
        0x010E,
        0x010F,
        0x010E,
        0x010F,
    };

    static const u16 positions[] = {
        160,
        56,
        128,
        40,
    };

    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        int songId;
        int location;

        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;

        SpellFx_WriteBgMap(anim, *(tsaL + ret), *(tsaR + ret));

        songId = songIds[ret];
        location = positions[ret];
        PlaySFX(songId, 0x100, location, 0);
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

struct ProcCmd CONST_DATA ProcScr_efxReserveBGCOL[] =
{
    PROC_NAME("efxReserveBGCOL"),
    PROC_MARK(PROC_MARK_A),
    PROC_REPEAT(efxReserveBGCOL_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08061DF8
void StartSubSpell_efxReserveBGCOL(struct Anim * anim, u32 kind)
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
        -1
    };
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxReserveBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    if (kind == 0)
    {
        proc->pal = gUnknown_08678720;
    }
    else
    {
        proc->pal = gUnknown_08678920;
    }

    return;
}

//! FE8U = 0x08061E44
void efxReserveBGCOL_Loop(struct ProcEfxBGCOL * proc)
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
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxReserveBG2[] =
{
    PROC_NAME("efxReserveBG2"),
    PROC_REPEAT(efxReserveBG2_Loop),
    PROC_END,
};

u16 * CONST_DATA TsaArray_FortifyBg2[] =
{
    Tsa_086782A4,
};

// clang-format on

//! FE8U = 0x08061E8C
void StartSubSpell_efxReserveBG2(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
         0, 220,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;
    struct Anim * otherAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxReserveBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_FortifyBg2;
    proc->tsar = TsaArray_FortifyBg2;

    SpellFx_RegisterBgGfx(gUnknown_08670548, 28 * 6 * CHR_SIZE);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg1cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    sub_8055980();

    anim->oam2Base &= ~OAM2_LAYER(3);
    anim->oam2Base |= OAM2_LAYER(1);

    otherAnim = gUnknown_02000010[GetAnimPosition(anim)];
    if (otherAnim != NULL)
    {
        otherAnim->oam2Base &= ~OAM2_LAYER(3);
        otherAnim->oam2Base |= OAM2_LAYER(1);
    }

    SpellFx_SetSomeColorEffect();
    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);

    return;
}

//! FE8U = 0x08061F78
void efxReserveBG2_Loop(struct ProcEfxBG * proc)
{
    int ret;

    struct Anim * procAnim = proc->anim;
    struct Anim * otherAnim = GetAnimAnotherSide(procAnim);

    struct Anim * anim3 = gUnknown_02000010[GetAnimPosition(procAnim)];

    if (anim3 != NULL)
    {
        anim3->oam2Base &= ~OAM2_LAYER(3);
        anim3->oam2Base |= OAM2_LAYER(1);
    }

    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        SpellFx_WriteBgMap(otherAnim, *(tsaL + ret), *(tsaR + ret));
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();

            gEfxBgSemaphore--;

            gLCDControlBuffer.bg0cnt.priority = 0;
            gLCDControlBuffer.bg1cnt.priority = 1;
            gLCDControlBuffer.bg2cnt.priority = 2;
            gLCDControlBuffer.bg3cnt.priority = 3;

            procAnim->oam2Base &= ~OAM2_LAYER(3);
            procAnim->oam2Base |= OAM2_LAYER(2);

            if (anim3 != NULL)
            {
                anim3->oam2Base &= ~OAM2_LAYER(3);
                anim3->oam2Base |= OAM2_LAYER(2);
            }

            SetDefaultColorEffects_();
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxReserveBGCOL2[] =
{
    PROC_NAME("efxReserveBGCOL2"),
    PROC_MARK(PROC_MARK_A),
    PROC_REPEAT(efxReserveBGCOL2_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08062058
void StartSubSpell_efxReserveBGCOL2(struct Anim * anim, u32 kind)
{
    // clang-format off
    static const u16 frames[] =
    {
         0, 4,
         1, 4,
         2, 4,
         3, 4,
         4, 4,
         5, 4,
         6, 4,
         7, 4,
         8, 4,
         9, 4,
        10, 4,
        11, 4,
        12, 4,
        13, 4,
        14, 4,
         0, 4,
         1, 4,
         2, 4,
         3, 4,
         4, 4,
         5, 4,
         6, 4,
         7, 4,
         8, 4,
         9, 4,
        10, 4,
        11, 4,
        12, 4,
        13, 4,
        14, 4,
         0, 4,
         1, 4,
         2, 4,
         3, 4,
         4, 4,
         5, 4,
         6, 4,
         7, 4,
         8, 4,
         9, 4,
        10, 4,
        11, 4,
        12, 4,
        13, 4,
        14, 4,
         0, 4,
         1, 4,
         2, 4,
         3, 4,
         4, 4,
         5, 4,
         6, 4,
         7, 4,
         8, 4,
         9, 4,
        -1,
    };
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxReserveBGCOL2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    if (kind == 0)
    {
        proc->pal = Pal_HealSpellBg;
    }
    else
    {
        proc->pal = gUnknown_08678B20;
    }

    return;
}

//! FE8U = 0x080620A4
void efxReserveBGCOL2_Loop(struct ProcEfxBGCOL * proc)
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
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxRest[] =
{
    PROC_NAME("efxRest"),
    PROC_REPEAT(efxRest_Loop_Main),
    PROC_END,
};

// clang-format on

//! FE8U = 0x080620EC
void StartSpellAnimRestore(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxRest, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x08062128
void efxRest_Loop_Main(struct ProcEfx * proc)
{
    struct Unit * unit;

    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }

    if (proc->timer == duration + 1)
    {
        StartSubSpell_efxRestBG(anim);
        NewEfxALPHA(anim, 40, 30, 16, 8, 0);
        NewEfxALPHA(anim, 71, 30, 8, 16, 0);
        NewEfxALPHA(anim, 102, 30, 16, 8, 0);
        NewEfxALPHA(anim, 133, 30, 8, 16, 0);
        NewEfxALPHA(anim, 164, 60, 16, 0, 0);
        PlaySFX(0xfd, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 80)
    {
        StartSubSpell_efxRestOBJ(anim);
    }
    else if (proc->timer == duration + 164)
    {
        NewEfxFlashUnit(anim, 1, 5, 0);
    }
    else if (proc->timer == duration + 200)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimStatusChgHitEffects(anim, proc->hitted);

        if (GetAnimPosition(anim) == 0)
        {
            unit = &gpEkrBattleUnitLeft->unit;
        }
        else
        {
            unit = &gpEkrBattleUnitRight->unit;
        }

        if (unit->statusIndex == UNIT_STATUS_PETRIFY)
        {
            SetUnitEfxDebuff(anim, 0);

            unit = GetUnit(unit->index);
            unit->state &= ~(US_UNSELECTABLE | US_HAS_MOVED | US_HAS_MOVED_AI);

            RefreshEntityBmMaps();
            RefreshUnitSprites();
            MU_EndAll();
        }

        SetUnitEfxDebuff(anim, 0);
    }
    else if (proc->timer == duration + 300)
    {
        anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;

        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxRestBG[] =
{
    PROC_NAME("efxRestBG"),
    PROC_REPEAT(efxRestBG_Loop),
    PROC_END,
};

u16 * CONST_DATA TsaArray_RestoreBg[] =
{
    Tsa_0867B5C4,
    Tsa_0867B670,
    Tsa_0867B724,
    Tsa_0867B7E4,
    Tsa_0867B8AC,
    Tsa_0867B988,
    Tsa_0867BA68,
    Tsa_0867BB50,
    Tsa_0867BC40,
    Tsa_0867BD40,
    Tsa_0867BE4C,
    Tsa_0867BF6C,
    Tsa_0867C09C,
};

u16 * CONST_DATA ImgArray_RestoreBg[] =
{
    Img_08679B04,
    Img_08679B04,
    Img_08679B04,
    Img_08679B04,
    Img_08679B04,
    Img_08679B04,
    Img_0867A130,
    Img_0867A130,
    Img_0867A130,
    Img_0867A828,
    Img_0867A828,
    Img_0867AE48,
    Img_0867AE48,
};

// clang-format on

//! FE8U = 0x080622A0
void StartSubSpell_efxRestBG(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
         0,   4,
         1,   4,
         2,   4,
         3,   4,
         4,   3,
         5,   3,
         6,   3,
         7,   3,
         8,   3,
         9,   2,
        10,   2,
        11,   2,
        12, 250,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxRestBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_RestoreBg;
    proc->tsar = TsaArray_RestoreBg;

    proc->img = ImgArray_RestoreBg;

    SpellFx_RegisterBgPal(Pal_MapAnimRestore, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x080622F4
void efxRestBG_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;

        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
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

struct ProcCmd CONST_DATA ProcScr_efxRestOBJ[] =
{
    PROC_NAME("efxRestOBJ"),
    PROC_SET_END_CB(efxRestOBJ_Loop),
    PROC_SLEEP(80),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08062358
void StartSubSpell_efxRestOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxRestOBJ, PROC_TREE_3);
    proc->anim = anim;
    frontAnim = EfxCreateFrontAnim(anim, gUnknown_0867EE04, gUnknown_0867EE04, gUnknown_0867EE04, gUnknown_0867EE04);
    proc->anim2 = frontAnim;

    if (GetAnimPosition(anim) == 0)
    {
        frontAnim->xPosition -= 8;
        frontAnim->yPosition -= 8;
    }
    else
    {
        frontAnim->xPosition += 8;
        frontAnim->yPosition -= 8;
    }

    SpellFx_RegisterObjPal(Pal_SleepSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_SleepSprites, 32 * 2 * CHR_SIZE);

    return;
}

//! FE8U = 0x080623D0
void efxRestOBJ_Loop(void)
{
    gEfxBgSemaphore--;
    return;
}
