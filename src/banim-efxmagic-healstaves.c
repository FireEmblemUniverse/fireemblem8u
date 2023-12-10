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
    PROC_REPEAT(EfxLiveMain),
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
void EfxLiveMain(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxLiveOBJ(proc->anim);
        PlaySFX(0x2cc, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 52)
    {
        sub_8061594(proc->anim, 0);
        sub_8061774(proc->anim, 0);

        SetBlendAlpha(0, 16);

        sub_806189C(proc->anim, 1, 12, 0);
        sub_806189C(proc->anim, 35, 25, 1);

        PlaySFX(0x10e, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 55)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
    }
    else if (proc->timer == 113)
    {
        sub_8061650(proc->anim, 0);
        sub_80617E4(proc->anim, 0);
        sub_806189C(proc->anim, 1, 12, 0);
        sub_806189C(proc->anim, 29, 25, 1);
        PlaySFX(0x0000010F, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == 166)
    {
        NewEfxHPBarLive(anim);
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
    PROC_REPEAT(EfxReliveMain),
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
void EfxReliveMain(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxLiveOBJ(proc->anim);
        PlaySFX(0x2cc, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 52)
    {
        sub_8061594(proc->anim, 1);
        sub_8061774(proc->anim, 1);

        SetBlendAlpha(0, 16);

        sub_806189C(proc->anim, 1, 12, 0);
        sub_806189C(proc->anim, 35, 25, 1);

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
        sub_8061650(proc->anim, 1);
        sub_80617E4(proc->anim, 1);

        SetBlendAlpha(0, 16);

        sub_806189C(proc->anim, 1, 12, 0);
        sub_806189C(proc->anim, 29, 25, 1);

        PlaySFX(0x111, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 166)
    {
        NewEfxHPBarLive(anim);
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
    PROC_REPEAT(EfxRecoverMain),
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
void EfxRecoverMain(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxLiveOBJ(proc->anim);
        PlaySFX(0x2cc, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 52)
    {
        sub_8061594(proc->anim, 2);
        sub_8061774(proc->anim, 2);

        SetBlendAlpha(0, 16);

        sub_806189C(proc->anim, 1, 12, 0);
        sub_806189C(proc->anim, 35, 25, 1);

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
        sub_8061650(proc->anim, 2);
        sub_80617E4(proc->anim, 2);

        SetBlendAlpha(0, 16);

        sub_806189C(proc->anim, 1, 12, 0);
        sub_806189C(proc->anim, 29, 25, 1);

        PlaySFX(0x113, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 166)
    {
        NewEfxHPBarLive(anim);
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
    PROC_REPEAT(EfxReblowMain),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08061420
void sub_8061420(struct Anim * anim)
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
void EfxReblowMain(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxLiveOBJ(proc->anim);
        sub_8061ACC(proc->anim, 0);
        PlaySFX(0x2cc, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 52)
    {
        sub_8061594(proc->anim, 0);
        sub_8061774(proc->anim, 0);

        SetBlendAlpha(0, 16);

        sub_806189C(proc->anim, 1, 12, 0);
        sub_806189C(proc->anim, 35, 25, 1);

        PlaySFX(0x10e, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 55)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
    }
    else if (proc->timer == 151)
    {
        sub_8061ACC(proc->anim, 1);
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else if (proc->timer == duration + 161)
    {
        sub_8061650(proc->anim, 0);
        sub_80617E4(proc->anim, 0);

        SetBlendAlpha(0, 16);

        sub_806189C(proc->anim, 1, 12, 0);
        sub_806189C(proc->anim, 29, 25, 1);

        PlaySFX(0x10F, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 211)
    {
        NewEfxHPBarLive(anim);
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
    PROC_REPEAT(EfxLivebgMain),
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
void sub_8061594(struct Anim * anim, u32 kind)
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

            SpellFx_RegisterBgGfx(gUnknown_0866F5E4, 0x400);

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

            SpellFx_RegisterBgGfx(gUnknown_08670548, 0x1500);

            break;
    }

    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08061650
void sub_8061650(struct Anim * anim, u32 kind)
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

            SpellFx_RegisterBgGfx(gUnknown_0866F5E4, 0x400);

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

            SpellFx_RegisterBgGfx(gUnknown_08670548, 0x1500);

            break;
    }

    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08061704
void EfxLivebgMain(struct ProcEfxBG * proc)
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

struct ProcCmd CONST_DATA gUnknown_085D6934[] =
{
    PROC_NAME("efxLiveBGCOL"),
    PROC_MARK(PROC_MARK_A),
    PROC_REPEAT(sub_8061854),
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
void sub_8061774(struct Anim * anim, u32 kind)
{
    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D6934, PROC_TREE_3);
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
        proc->pal = gUnknown_086700D4;
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

void sub_80617E4(struct Anim * anim, u32 kind)
{
    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D6934, PROC_TREE_3);
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
        proc->pal = gUnknown_086700D4;
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
void sub_8061854(struct ProcEfxBGCOL * proc)
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

struct ProcCmd CONST_DATA gUnknown_085D6954[] =
{
    PROC_NAME("efxLiveALPHA"),
    PROC_REPEAT(sub_80618D8),
    PROC_REPEAT(sub_80618F4),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0806189C
void sub_806189C(struct Anim * anim, int timer, int c, int d)
{
    struct ProcEfxALPHA * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D6954, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = timer;
    proc->unk2E = c;
    proc->unk29 = d;

    return;
}

//! FE8U = 0x080618D8
void sub_80618D8(struct ProcEfxALPHA * proc)
{
    proc->timer--;

    if (proc->timer == 0)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080618F4
void sub_80618F4(struct ProcEfxALPHA * proc)
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
    PROC_REPEAT(EfxLiveobjMain),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0806196C
void NewEfxLiveOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLiveOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 51;

    proc->anim2 = EfxCreateFrontAnim(anim, gUnknown_08675114, gUnknown_08675114, gUnknown_08675114, gUnknown_08675114);

    SpellFx_RegisterObjPal(Pal_FimbulvetrSprites_Snow, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(gUnknown_086702D4, 32 * 4 * CHR_SIZE);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxReserveOBJ[] =
{
    PROC_NAME("efxReserveOBJ"),
    PROC_REPEAT(sub_8061A64),
    PROC_REPEAT(sub_8061A98),
    PROC_END,
};

// clang-format on

//! FE8U = 0x080619CC
void sub_80619CC(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxReserveOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 51;
    proc->unk30 = 52;

    proc->anim2 = EfxCreateFrontAnim(anim, gUnknown_08675114, gUnknown_08675114, gUnknown_08675114, gUnknown_08675114);

    SpellFx_RegisterObjPal(Pal_FimbulvetrSprites_Snow, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(gUnknown_086702D4, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x08061A30
void EfxLiveobjMain(struct ProcEfxOBJ * proc)
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
void sub_8061A64(struct ProcEfxOBJ * proc)
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
void sub_8061A98(struct ProcEfxOBJ * proc)
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
    PROC_REPEAT(sub_8061B14),
    PROC_REPEAT(sub_8061BE4),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08061ACC
void sub_8061ACC(struct Anim * anim, u32 kind)
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
void sub_8061B14(struct ProcEfxOBJ * proc)
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
void sub_8061BE4(struct ProcEfxOBJ * proc)
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
    PROC_REPEAT(EfxReserveMain),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08061C18
void sub_8061C18(struct Anim * anim)
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
void sub_8061C48(struct Anim * anim)
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
void EfxReserveMain(struct ProcEfx * proc)
{
    proc->timer++;

    if (proc->timer == 1)
    {
        sub_80619CC(proc->anim);
        PlaySFX(0x2cc, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 52)
    {
        sub_8061D28(proc->anim);
        sub_8061DF8(proc->anim, proc->hitted);
    }
    else if (proc->timer == 183)
    {
        PlaySFX(0x114, 0x100, 120, 0);

        sub_8061E8C(proc->anim);
        sub_8062058(proc->anim, proc->hitted);

        SetBlendAlpha(0, 16);

        sub_806189C(proc->anim, 1, 20, 0);
        sub_806189C(proc->anim, 180, 40, 1);
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
    PROC_REPEAT(EfxReservebgMain),
    PROC_END,
};

u16 * CONST_DATA gUnknown_085D69FC[] =
{
    Tsa_08677E80,
    Tsa_08677F8C,
    Tsa_0867808C,
    Tsa_08678198,
};

// clang-format on

//! FE8U = 0x08061D28
void sub_8061D28(struct Anim * anim)
{
    // clang-format off
    static const u16 gUnknown_080DDA3E[] =
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
    proc->frame_config = gUnknown_080DDA3E;

    proc->tsal = gUnknown_085D69FC;
    proc->tsar = gUnknown_085D69FC;

    SpellFx_RegisterBgGfx(gUnknown_0866F5E4, 0x400);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08061D78
void EfxReservebgMain(struct ProcEfxBG * proc)
{
    static const u16 gUnknown_080DDA50[] = {
        0x010E,
        0x010F,
        0x010E,
        0x010F,
    };

    static const u16 gUnknown_080DDA58[] = {
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

        songId = gUnknown_080DDA50[ret];
        location = gUnknown_080DDA58[ret];
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

struct ProcCmd CONST_DATA gUnknown_085D6A0C[] =
{
    PROC_NAME("efxReserveBGCOL"),
    PROC_MARK(PROC_MARK_A),
    PROC_REPEAT(sub_8061E44),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08061DF8
void sub_8061DF8(struct Anim * anim, u32 kind)
{
    // clang-format off
    static const u16 gUnknown_080DDA70[] =
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

    proc = Proc_Start(gUnknown_085D6A0C, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DDA70;

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
void sub_8061E44(struct ProcEfxBGCOL * proc)
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

struct ProcCmd CONST_DATA gUnknown_085D6A2C[] =
{
    PROC_NAME("efxReserveBG2"),
    PROC_REPEAT(sub_8061F78),
    PROC_END,
};

u16 * CONST_DATA gUnknown_085D6A44[] =
{
    Tsa_086782A4,
};


// clang-format on

//! FE8U = 0x08061E8C
void sub_8061E8C(struct Anim * anim)
{
    // clang-format off
    static const u16 gUnknown_080DDB82[] =
    {
         0, 220,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;
    struct Anim * otherAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D6A2C, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DDB82;

    proc->tsal = gUnknown_085D6A44;
    proc->tsar = gUnknown_085D6A44;
    SpellFx_RegisterBgGfx(gUnknown_08670548, 0x1500);

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
void sub_8061F78(struct ProcEfxBG * proc)
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

struct ProcCmd CONST_DATA gUnknown_085D6A48[] =
{
    PROC_NAME("efxReserveBGCOL2"),
    PROC_MARK(PROC_MARK_A),
    PROC_REPEAT(sub_80620A4),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08062058
void sub_8062058(struct Anim * anim, u32 kind)
{
    // clang-format off
    static const u16 gUnknown_080DDB9A[] =
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

    proc = Proc_Start(gUnknown_085D6A48, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DDB9A;

    if (kind == 0)
    {
        proc->pal = gUnknown_086700D4;
    }
    else
    {
        proc->pal = gUnknown_08678B20;
    }

    return;
}

//! FE8U = 0x080620A4
void sub_80620A4(struct ProcEfxBGCOL * proc)
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
    PROC_REPEAT(EfxRestMain),
    PROC_END,
};

// clang-format on

//! FE8U = 0x080620EC
void sub_80620EC(struct Anim * anim)
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
void EfxRestMain(struct ProcEfx * proc)
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
        sub_80622A0(anim);
        NewEfxALPHA(anim, 40, 30, 16, 8, 0);
        NewEfxALPHA(anim, 71, 30, 8, 16, 0);
        NewEfxALPHA(anim, 102, 30, 16, 8, 0);
        NewEfxALPHA(anim, 133, 30, 8, 16, 0);
        NewEfxALPHA(anim, 164, 60, 16, 0, 0);
        PlaySFX(0xfd, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 80)
    {
        sub_8062358(anim);
    }
    else if (proc->timer == duration + 164)
    {
        NewEfxFlashUnit(anim, 1, 5, 0);
    }
    else if (proc->timer == duration + 200)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        sub_8055518(anim, proc->hitted);

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

struct ProcCmd CONST_DATA gUnknown_085D6A80[] =
{
    PROC_NAME("efxRestBG"),
    PROC_REPEAT(sub_80622F4),
    PROC_END,
};

u16 * CONST_DATA gUnknown_085D6A98[] =
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

u16 * CONST_DATA gUnknown_085D6ACC[] =
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
void sub_80622A0(struct Anim * anim)
{
    // clang-format off
    static const u16 gUnknown_080DDC8A[] =
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

    proc = Proc_Start(gUnknown_085D6A80, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DDC8A;

    proc->tsal = gUnknown_085D6A98;
    proc->tsar = gUnknown_085D6A98;

    proc->img = gUnknown_085D6ACC;

    SpellFx_RegisterBgPal(gUnknown_0867B5A4, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x080622F4
void sub_80622F4(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;

        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
        SpellFx_RegisterBgGfx(*(img + ret), 0x2000);
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
    PROC_SET_END_CB(sub_80623D0),
    PROC_SLEEP(80),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08062358
void sub_8062358(struct Anim * anim)
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

    SpellFx_RegisterObjPal(gUnknown_0868716C, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(gUnknown_08686F84, 0x800);

    return;
}

//! FE8U = 0x080623D0
void sub_80623D0(void)
{
    gEfxBgSemaphore--;
    return;
}
