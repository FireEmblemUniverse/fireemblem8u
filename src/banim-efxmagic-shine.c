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
    PROC_REPEAT(efxShine_Loop_Main),
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
void efxShine_Loop_Main(struct ProcEfx * proc)
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
        StartSubSpell_efxShineBG2(anim);
        PlaySFX(0x2BC, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 23)
    {
        NewEfxFlashBgWhite(anim, 5);
        StartSubSpell_efxShineOBJRND(anim);
    }
    else if (proc->timer == duration + 29)
    {
        StartSubSpell_efxShineBG(anim);
        StartSubSpell_efxShineBGCOL(anim);
    }
    else if (proc->timer == duration + 30)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

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
    PROC_REPEAT(efxShineBG_Loop),
    PROC_END,
};

u16 * CONST_DATA TsaArray_ShineBg_Left[] =
{
    Tsa_ShineBg1_Left,
};

u16 * CONST_DATA TsaArray_ShineBg_Right[] =
{
    Tsa_ShineBg1_Right,
};

u16 * CONST_DATA ImgArray_ShineBg[] =
{
    Img_ShineBg1,
};

// clang-format on

//! FE8U = 0x08063590
void StartSubSpell_efxShineBG(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] = {
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
    proc->frame_config = frames;

    proc->tsal = TsaArray_ShineBg_Left;
    proc->tsar = TsaArray_ShineBg_Right;
    proc->img = ImgArray_ShineBg;

    BG_SetPosition(BG_1, 0, 0);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x080635E8
void efxShineBG_Loop(struct ProcEfxBG * proc)
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
    PROC_REPEAT(efxShineBG2_Loop),
    PROC_END,
};

u16 * CONST_DATA TsaArray_ShineBg2[] =
{
    Tsa_ShineBg2_A,
    Tsa_ShineBg2_B,
    Tsa_ShineBg2_C,
    Tsa_ShineBg2_D,
    Tsa_ShineBg2_E,
    Tsa_ShineBg2_F,
    Tsa_ShineBg2_G,
    Tsa_ShineBg2_H,
    Tsa_ShineBg2_I,
};

// clang-format on

//! FE8U = 0x0806364C
void StartSubSpell_efxShineBG2(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
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
    proc->frame_config = frames;

    proc->tsal = TsaArray_ShineBg2;
    proc->tsar = TsaArray_ShineBg2;

    SpellFx_RegisterBgPal(Pal_ShineBg2, PLTT_SIZE_4BPP);
    SpellFx_RegisterBgGfx(Img_ShineBg2, 32 * 8 * CHR_SIZE);

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
void efxShineBG2_Loop(struct ProcEfxBG * proc)
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
    PROC_REPEAT(efxShineBGCOL_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0806376C
void StartSubSpell_efxShineBGCOL(struct Anim * anim)
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
    proc->frame_config = frames;

    proc->pal = Pal_ShineBg_08726FF4;
    SpellFx_RegisterBgPal(Pal_ShineBg_08726FF4, PLTT_SIZE_4BPP);

    return;
}

//! FE8U = 0x080637B0
void efxShineBGCOL_Loop(struct ProcEfxBGCOL * proc)
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
    PROC_REPEAT(efxShineOBJRND_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x080637F8
void StartSubSpell_efxShineOBJRND(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxShineOBJRND, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 2;
    proc->unk30 = 0;

    SpellFx_RegisterObjPal(Pal_ShineSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_ShineSprites, 32 * 4 * CHR_SIZE);

    return;
}

// clang-format off

s16 CONST_DATA gShineSpriteCoords[] =
{
    - 4, -54,
    -40, -24,
    + 4, + 4,
    +20, -20,
};

// clang-format on

//! FE8U = 0x08063840
void efxShineOBJRND_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        int x;
        int y;
        if (GetAnimPosition(proc->anim) == 0)
        {
            x = proc->anim->xPosition + gShineSpriteCoords[(s16)proc->unk30];
            y = proc->anim->yPosition + gShineSpriteCoords[(s16)proc->unk30 + 1];
            StartSubSpell_efxShineOBJ(proc->anim, x, y);
        }
        else
        {
            x = proc->anim->xPosition - gShineSpriteCoords[(s16)proc->unk30];
            y = proc->anim->yPosition + gShineSpriteCoords[(s16)proc->unk30 + 1];
            StartSubSpell_efxShineOBJ(proc->anim, x, y);
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
    PROC_REPEAT(efxShineOBJ_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x080638F0
void StartSubSpell_efxShineOBJ(struct Anim * anim, int x, int y)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxShineOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 70;

    frontAnim = EfxCreateFrontAnim(anim, gUnknown_08728C04, gUnknown_08728C04, gUnknown_08728C04, gUnknown_08728C04);
    proc->anim2 = frontAnim;
    frontAnim->xPosition = x;
    frontAnim->yPosition = y;

    return;
}

//! FE8U = 0x08063948
void efxShineOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}
