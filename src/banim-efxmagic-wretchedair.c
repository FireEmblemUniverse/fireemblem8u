#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxDrzDrakbreath[] =
{
    PROC_NAME("efxDrzDrakbreath"),
    PROC_REPEAT(efxDrzDrakbreath_Loop_Main),
    PROC_END,
};

// clang-format on

//! FE8U = 0x080687E4
void StartSpellAnimWretchedAir(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxDrzDrakbreath, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x0806881C
void efxDrzDrakbreath_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    if (++proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }

    if (proc->timer == 1)
    {
        StartSpellThing_MagicQuake(proc->anim, 90, 10);
        StartSubSpell_efxDrzDrakbreathOBJ(anim);
        NewEfxALPHA(anim, 40, 15, 16, 0, 0);
        PlaySFX(0x11D, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == 15)
    {
        anim->state3 |= 9;

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == 130)
    {
        SpellFx_Finish();
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxDrzDrakbreathOBJ[] =
{
    PROC_NAME("efxDrzDrakbreathOBJ"),
    PROC_REPEAT(efxDrzDrakbreathOBJ_Loop),
    PROC_END,
};

// clang-format on

extern u16 Pal_WretchedAirSprites[];

//! FE8U = 0x080688C0
void StartSubSpell_efxDrzDrakbreathOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDrzDrakbreathOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 52;

    if (GetAnimPosition(anim) == 0)
    {
        scr = AnimScr_FirebreathOBJ_Left;
    }
    else
    {
        scr = AnimScr_FirebreathOBJ_Right;
    }

    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    if (gEkrDistanceType == 0)
    {
        if (GetAnimPosition(anim) == 0)
        {
            frontAnim->xPosition += 16;
        }
        else
        {
            frontAnim->xPosition -= 16;
        }
    }
    else
    {
        if (GetAnimPosition(anim) == 0)
        {
            frontAnim->xPosition += 72;
        }
        else
        {
            frontAnim->xPosition -= 72;
        }
    }

    SpellFx_RegisterObjPal(Pal_WretchedAirSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BreathSprites, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x08068970
void efxDrzDrakbreathOBJ_Loop(struct ProcEfxOBJ * proc)
{
    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            proc->anim2->xPosition = proc->anim->xPosition + 72;
        }
        else
        {
            proc->anim2->xPosition = proc->anim->xPosition - 72;
        }
    }

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxDrzDrakbreathBG[] =
{
    PROC_NAME("efxDrzDrakbreathBG"),
    PROC_REPEAT(efxDrzDrakbreathBG_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x080689D4
void StartSubSpell_efxDrzDrakbreathBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;
    u16 * tsa;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDrzDrakbreathBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 112;

    SpellFx_RegisterBgGfx(Img_FireBreathBg, 32 * 8 * CHR_SIZE);
    tsa = Tsa_FireBreathBg;
    SpellFx_WriteBgMap(proc->anim, tsa, tsa);

    SpellFx_ClearBG1Position();
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08068A28
void efxDrzDrakbreathBG_Loop(struct ProcEfxBG * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        SpellFx_ClearBG1();
        SetDefaultColorEffects_();
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxDrzDrakbreathBGCOL[] =
{
    PROC_NAME("efxDrzDrakbreathBGCOL"),
    PROC_MARK(PROC_MARK_EFX_BGCOL),

    PROC_REPEAT(efxDrzDrakbreathBGCOL_Loop),

    PROC_END,
};

// clang-format on

extern u16 gUnknown_08725DAC[];

//! FE8U = 0x08068A60
void StartSubSpell_efxDrzDrakbreathBGCOL(struct Anim * anim)
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
        7, 2,
        6, 2,
        5, 2,
        4, 2,
        3, 2,
        4, 2,
        5, 2,
        6, 2,
        5, 2,
        4, 2,
        3, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        3, 2,
        4, 2,
        5, 2,
        6, 2,
        5, 2,
        6, 2,
        4, 2,
        3, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        2, 2,
        3, 2,
        4, 2,
        5, 2,
        6, 2,
        7, 2,
        8, 2,
        7, 2,
        6, 2,
        5, 2,
        4, 2,
        3, 2,
        2, 2,
        1, 2,
        0, 6,
        -1,
    };
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDrzDrakbreathBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    proc->pal = gUnknown_08725DAC;

    return;
}

//! FE8U = 0x08068A9C
void efxDrzDrakbreathBGCOL_Loop(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        CpuFastCopy(proc->pal, gEfxPal, PLTT_SIZE_4BPP);
        EfxPalWhiteInOut(gEfxPal, 0, 1, ret);
        SpellFx_RegisterBgPal(gEfxPal, PLTT_SIZE_4BPP);
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

//! FE8U = 0x08068AFC
void sub_8068AFC(struct Anim * anim, u16 * tsaL, u16 * tsaR, u8 unk)
{
    SpellFx_WriteBgMap(anim, tsaL, tsaR);

    if (GetAnimPosition(anim) == 0)
    {
        unk = (unk + 1) & 1;
    }

    if (unk != 0)
    {
        int i;

        for (i = 0; i < 20; i++)
        {
            gBG1TilemapBuffer[TILEMAP_INDEX(29 + 1, i)] = gBG1TilemapBuffer[TILEMAP_INDEX(29 + 0, i)];
            gBG1TilemapBuffer[TILEMAP_INDEX(29 + 2, i)] = gBG1TilemapBuffer[TILEMAP_INDEX(29 + 0, i)];

            if (gEkrDistanceType != 0)
            {
                gBG1TilemapBuffer[TILEMAP_INDEX(0, i)] = gBG1TilemapBuffer[TILEMAP_INDEX(29 + 0, i)];
            }
        }
    }
    else
    {
        int i;

        for (i = 0; i < 20; i++)
        {
            gBG1TilemapBuffer[TILEMAP_INDEX(29 + 1, i)] = gBG1TilemapBuffer[TILEMAP_INDEX(0, i)];
            gBG1TilemapBuffer[TILEMAP_INDEX(29 + 2, i)] = gBG1TilemapBuffer[TILEMAP_INDEX(0, i)];

            if (gEkrDistanceType != 0)
            {
                gBG1TilemapBuffer[TILEMAP_INDEX(29, i)] = gBG1TilemapBuffer[TILEMAP_INDEX(0, i)];
            }
        }
    }

    return;
}
