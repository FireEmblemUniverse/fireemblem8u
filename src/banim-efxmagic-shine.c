#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxShine[] =
{
    PROC_NAME("efxShine"),
    PROC_REPEAT(sub_80634BC),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08063480
void StartSpellAnimShine(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxShine, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x080634BC
void sub_80634BC(struct ProcEfx * proc)
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
        NewEfxFlashBgWhite(anim, 10);
    }
    else if (proc->timer == duration + 11)
    {
        sub_806364C(anim);
        PlaySFX(0x2BC, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 23)
    {
        NewEfxFlashBgWhite(anim, 5);
        sub_80637F8(anim);
    }
    else if (proc->timer == duration + 29)
    {
        sub_8063590(anim);
        sub_806376C(anim);
    }
    else if (proc->timer == duration + 30)
    {
        anim->state3 |= 9;

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 35)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxShineBG[] =
{
    PROC_NAME("efxShineBG"),
    PROC_REPEAT(sub_80635E8),
    PROC_END,
};

u16 * CONST_DATA gUnknown_085D6F24[] =
{
    gUnknown_087270B4,
};

u16 * CONST_DATA gUnknown_085D6F28[] =
{
    gUnknown_08727510,
};

u16 * CONST_DATA gUnknown_085D6F2C[] =
{
    gUnknown_08725DCC,
};

// clang-format on

//! FE8U = 0x08063590
void sub_8063590(struct Anim * anim)
{
    // clang-format off
    static const u16 gUnknown_080DE03C[] = {
         0, 12,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxShineBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DE03C;

    proc->tsal = gUnknown_085D6F24;
    proc->tsar = gUnknown_085D6F28;
    proc->img = gUnknown_085D6F2C;

    BG_SetPosition(BG_1, 0, 0);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x080635E8
void sub_80635E8(struct ProcEfxBG * proc)
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

struct ProcCmd CONST_DATA ProcScr_efxShineBG2[] =
{
    PROC_NAME("efxShineBG2"),
    PROC_REPEAT(sub_80636D8),
    PROC_END,
};

u16 * CONST_DATA gUnknown_085D6F48[] =
{
    Tsa_08727C68,
    Tsa_08727D18,
    Tsa_08727E20,
    Tsa_08727F5C,
    Tsa_087280D0,
    Tsa_08728268,
    Tsa_087283DC,
    Tsa_087284E8,
    Tsa_087285BC,
};

// clang-format on

//! FE8U = 0x0806364C
void sub_806364C(struct Anim * anim)
{
    // clang-format off
    static const u16 gUnknown_080DE050[] =
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
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxShineBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DE050;

    proc->tsal = gUnknown_085D6F48;
    proc->tsar = gUnknown_085D6F48;

    SpellFx_RegisterBgPal(gUnknown_08727C48, PLTT_SIZE_4BPP);
    SpellFx_RegisterBgGfx(gUnknown_0872796C, 32 * 8 * CHR_SIZE);

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

    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x080636D8
void sub_80636D8(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;
        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));

        if (gEkrDistanceType != 0)
        {
            if (GetAnimPosition(proc->anim) == 0)
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
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxShineBGCOL[] =
{
    PROC_NAME("efxShineBGCOL"),
    PROC_MARK(PROC_MARK_A),
    PROC_REPEAT(sub_80637B0),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0806376C
void sub_806376C(struct Anim * anim)
{
    // clang-format off
    static const u16 gUnknown_080DE086[] =
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

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxShineBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DE086;

    proc->pal = gUnknown_08726FF4;
    SpellFx_RegisterBgPal(gUnknown_08726FF4, PLTT_SIZE_4BPP);

    return;
}

//! FE8U = 0x080637B0
void sub_80637B0(struct ProcEfxBGCOL * proc)
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

struct ProcCmd CONST_DATA ProcScr_efxShineOBJRND[] =
{
    PROC_NAME("efxShineOBJRND"),
    PROC_REPEAT(sub_8063840),
    PROC_END,
};

// clang-format on

//! FE8U = 0x080637F8
void sub_80637F8(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxShineOBJRND, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 2;
    proc->unk30 = 0;

    SpellFx_RegisterObjPal(gUnknown_08728920, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(gUnknown_0872865C, 32 * 4 * CHR_SIZE);

    return;
}

// clang-format off

s16 CONST_DATA gUnknown_085D6FA4[] =
{
    - 4, -54,
    -40, -24,
    + 4, + 4,
    +20, -20,
};

// clang-format on

//! FE8U = 0x08063840
void sub_8063840(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        int x;
        int y;
        if (GetAnimPosition(proc->anim) == 0)
        {
            x = proc->anim->xPosition + gUnknown_085D6FA4[(s16)proc->unk30];
            y = proc->anim->yPosition + gUnknown_085D6FA4[(s16)proc->unk30 + 1];
            sub_80638F0(proc->anim, x, y);
        }
        else
        {
            x = proc->anim->xPosition - gUnknown_085D6FA4[(s16)proc->unk30];
            y = proc->anim->yPosition + gUnknown_085D6FA4[(s16)proc->unk30 + 1];
            sub_80638F0(proc->anim, x, y);
        }

        proc->timer = 0;

        (s16) proc->unk30 += 2;

        if ((s16)proc->unk30 > 7)
        {
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxShineOBJ[] =
{
    PROC_NAME("efxShineOBJ"),
    PROC_REPEAT(sub_8063948),
    PROC_END,
};

// clang-format on

//! FE8U = 0x080638F0
void sub_80638F0(struct Anim * anim, int x, int y)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxShineOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0x46;

    frontAnim = EfxCreateFrontAnim(anim, gUnknown_08728C04, gUnknown_08728C04, gUnknown_08728C04, gUnknown_08728C04);
    proc->anim2 = frontAnim;
    frontAnim->xPosition = x;
    frontAnim->yPosition = y;

    return;
}

//! FE8U = 0x08063948
void sub_8063948(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}
