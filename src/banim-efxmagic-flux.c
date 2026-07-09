#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"

/**
 * Spell anim effect for Flux.
*/

// clang-format off

struct ProcCmd CONST_DATA gProcScr_efxMistyrain[] =
{
    PROC_NAME("efxMistyrain"),
    PROC_REPEAT(efxMistyRain_Loop_Main),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0805EED8
void StartSpellAnimFlux(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(gProcScr_efxMistyrain, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x0805EF14
void efxMistyRain_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        PlaySFX(0x10a, 0x100, proc->anim->xPosition, 1);
        StartSubSpell_efxMistyrainBG(anim);
    }
    else if (proc->timer == 16)
    {
        StartSubSpell_efxMistyRainOBJ(proc->anim);
    }
    else if (proc->timer == 74)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else
    {
        if (proc->timer == duration + 75)
        {
            proc->unk_64 = StartSubSpell_efxMistyrainOBJ2(anim);
        }
        else if (proc->timer == duration + 94)
        {
            PlaySFX(0x2E1, 0x100, anim->xPosition, 1);
            StartSubSpell_efxMistyrainBG2(proc->anim);
        }
        else if (proc->timer == duration + 114)
        {
            Proc_End(proc->unk_64);
        }
        else if (proc->timer == duration + 131)
        {
            NewEfxFlashBgWhite(proc->anim, 6);
            anim->state3 |= 9;

            StartBattleAnimHitEffectsDefault(anim, proc->hitted);

            if (!proc->hitted)
            {
                EfxPlayHittedSFX(anim);
            }
        }
        else if (proc->timer == duration + 164)
        {
            SpellFx_Finish();
            RegisterEfxSpellCastEnd();
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_efxMistyrainBG[] =
{
    PROC_NAME("efxMistyrainBG"),
    PROC_REPEAT(efxMistyRainBg_Loop),

    PROC_END,
};

u16 * CONST_DATA gEfxmagicFlux_0[] =
{
    Tsa_Flux_ClassReel_0,
    Tsa_Flux_ClassReel_1,
    Tsa_Flux_ClassReel_2,
    Tsa_Flux_ClassReel_3,
    Tsa_Flux_ClassReel_4,
    Tsa_Flux_ClassReel_5,
    Tsa_Flux_ClassReel_6,
    Tsa_Flux_ClassReel_7,
    Tsa_Flux_ClassReel_8,
    Tsa_Flux_ClassReel_9,
    Tsa_Flux_ClassReel_10,
    Tsa_Flux_ClassReel_11,
    Tsa_Flux_ClassReel_12,
    Tsa_Flux_ClassReel_13,
    Tsa_Flux_ClassReel_14,
    Tsa_Flux_ClassReel_15,
    Tsa_Flux_ClassReel_16,
    Tsa_Flux_ClassReel_17,
    Tsa_Flux_ClassReel_18,
    Tsa_Flux_ClassReel_19,
    Tsa_Flux_ClassReel_20,
    Tsa_Flux_ClassReel_21,
    Tsa_Flux_ClassReel_22,
    Tsa_Flux_ClassReel_23,
    Tsa_Flux_ClassReel_24,
    Tsa_Flux_ClassReel_25,
    Tsa_Flux_ClassReel_26,
    Tsa_Flux_ClassReel_27,
    Tsa_Flux_ClassReel_28,
    Tsa_Flux_ClassReel_29,
    Tsa_Flux_ClassReel_30,
    Tsa_Flux_ClassReel_31,
    Tsa_Flux_ClassReel_32,
    Tsa_Flux_ClassReel_33,
    Tsa_Flux_ClassReel_34,
    Tsa_Flux_ClassReel_35,
    Tsa_Flux_ClassReel_36,
    Tsa_Flux_ClassReel_37,
    Tsa_Flux_ClassReel_38,
    Tsa_Flux_ClassReel_39,
    Tsa_Flux_ClassReel_40,
};

u16 * CONST_DATA gEfxmagicFlux_1[] =
{
    Img_Banim_6,
    Img_Banim_6,
    Img_Banim_6,
    Img_Flux_ClassReel_0,
    Img_Flux_ClassReel_0,
    Img_Flux_ClassReel_0,
    Img_Flux_ClassReel_1,
    Img_Flux_ClassReel_1,
    Img_Flux_ClassReel_1,
    Img_Flux_ClassReel_1,
    Img_Flux_ClassReel_1,
    Img_Flux_ClassReel_1,
    Img_Flux_ClassReel_2,
    Img_Flux_ClassReel_2,
    Img_Flux_ClassReel_2,
    Img_Flux_ClassReel_2,
    Img_Flux_ClassReel_2,
    Img_Flux_ClassReel_2,
    Img_Flux_ClassReel_3,
    Img_Flux_ClassReel_3,
    Img_Flux_ClassReel_3,
    Img_Flux_ClassReel_3,
    Img_Flux_ClassReel_4,
    Img_Flux_ClassReel_4,
    Img_Flux_ClassReel_4,
    Img_Flux_ClassReel_4,
    Img_Flux_ClassReel_4,
    Img_Flux_ClassReel_4,
    Img_Flux_ClassReel_4,
    Img_Flux_ClassReel_1,
    Img_Flux_ClassReel_1,
    Img_Flux_ClassReel_1,
    Img_Flux_ClassReel_1,
    Img_Flux_ClassReel_1,
    Img_Flux_ClassReel_1,
    Img_Flux_ClassReel_0,
    Img_Flux_ClassReel_0,
    Img_Flux_ClassReel_0,
    Img_Banim_6,
    Img_Banim_6,
    Img_Banim_6,
};

// clang-format on

//! FE8U = 0x0805F004
void StartSubSpell_efxMistyrainBG(struct Anim * anim)
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
        -1,
    };
    // clang-format on

    struct LCDControlBuffer * lcd;
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gProcScr_efxMistyrainBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;
    proc->tsar = proc->tsal = gEfxmagicFlux_0;
    proc->img = gEfxmagicFlux_1;
    SpellFx_RegisterBgPal(Pal_Banim_1, 0x20);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            BG_SetPosition(1, 232, 0);
        }
        else
        {
            BG_SetPosition(1, 24, 0);
        }
    }

    if (GetAnimPosition(proc->anim) == 0)
    {
        lcd = &gLCDControlBuffer;
        lcd->bgoffset[1].x += 4;
        lcd->bgoffset[1].y += 8;
    }
    else
    {
        lcd = &gLCDControlBuffer;
        lcd->bgoffset[1].x -= 4;
        lcd->bgoffset[1].y += 8;
    }

    return;
}

//! FE8U = 0x0805F0B0
void StartSubSpell_efxMistyrainBG2(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        12, 6,
        13, 2,
        14, 2,
        15, 2,
        16, 2,
        17, 2,
        18, 2,
        19, 2,
        20, 2,
        21, 2,
        22, 2,
        23, 2,
        24, 2,
        25, 2,
        26, 2,
        27, 2,
        28, 2,
        29, 2,
        30, 2,
        31, 2,
        32, 2,
        33, 2,
        34, 2,
        35, 2,
        36, 2,
        37, 2,
        38, 2,
        39, 2,
        40, 2,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gProcScr_efxMistyrainBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;
    proc->tsar = proc->tsal = gEfxmagicFlux_0;
    proc->img = gEfxmagicFlux_1;

    SpellFx_RegisterBgPal(Pal_Banim_2, 0x20);
    SpellFx_SetSomeColorEffect();

    SetBlendAlpha(10, 7);

    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            BG_SetPosition(1, 232, 0);
        }
        else
        {
            BG_SetPosition(1, 24, 0);
        }
    }

    return;
}

//! FE8U = 0x0805F140
void efxMistyRainBg_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut(&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaLeft = proc->tsal;
        u16 ** tsaRight = proc->tsar;
        SpellFx_RegisterBgGfx(proc->img[ret], 0x2000);
        SpellFx_WriteBgMap(proc->anim, tsaLeft[ret], tsaRight[ret]);
        return;
    }

    if (ret == -1)
    {
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SetDefaultColorEffects_();
        Proc_End(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxMistyrainOBJ[] =
{
    PROC_NAME("efxMistyrainOBJ"),

    PROC_SET_END_CB(efxMistyRainObj_OnEnd),

    PROC_REPEAT(efxMistyRainObj_0),
    PROC_SLEEP(32),

    PROC_REPEAT(efxMistyRainObj_1),
    PROC_SLEEP(11),

    PROC_REPEAT(efxMistyRainObj_2),
    PROC_SLEEP(22),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0805F1A4
void StartSubSpell_efxMistyRainOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    u32 * script;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMistyrainOBJ, PROC_TREE_3);
    proc->anim = anim;

    GetAnimAnotherSide(anim);
    script = FramScr_Unk5D4F90;
    proc->anim2 = EfxCreateFrontAnim(proc->anim, script, script, script, script);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gProcScr_efxMistyrainOBJ2[] =
{
    PROC_NAME("efxMistyrainOBJ2"),

    PROC_SET_END_CB(efxMistyRainObj_OnEnd),

    PROC_REPEAT(efxMistyRainObj2_0),
    PROC_SLEEP(14),

    PROC_REPEAT(efxMistyRainObj2_1),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0805F1E8
struct ProcEfxOBJ * StartSubSpell_efxMistyrainOBJ2(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    u32 * script;

    gEfxBgSemaphore++;

    proc = Proc_Start(gProcScr_efxMistyrainOBJ2, PROC_TREE_3);
    proc->anim = anim;
    GetAnimAnotherSide(anim);

    script = FramScr_Unk5D4F90;
    proc->anim2 = EfxCreateFrontAnim(proc->anim, script, script, script, script);
    proc->anim2->yPosition -= 4;

    return proc;
}

//! FE8U = 0x0805F234
void efxMistyRainObj_OnEnd(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
    return;
}

//! FE8U = 0x0805F24C
void efxMistyRainObj_0(struct ProcEfxOBJ * proc)
{
    proc->anim2->pScrStart = AnimScr_EfxMistyRainObj1;
    proc->anim2->pScrCurrent = AnimScr_EfxMistyRainObj1;

    proc->anim2->timer = 0;

    SpellFx_RegisterObjPal(Pal_FluxAnimSprites, 0x20);
    SpellFx_RegisterObjGfx(Img_FluxAnimSprites_Orb, 0x1000);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0805F288
void efxMistyRainObj_1(struct ProcEfxOBJ * proc)
{
    proc->anim2->pScrStart = AnimScr_EfxMistyRainObj2;
    proc->anim2->pScrCurrent = AnimScr_EfxMistyRainObj2;

    proc->anim2->timer = 0;

    SpellFx_RegisterObjPal(Pal_FluxAnimSprites, 0x20);
    SpellFx_RegisterObjGfx(Img_FluxAnimSprites_Tendrils, 0x1000);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0805F2C4
void efxMistyRainObj_2(struct ProcEfxOBJ * proc)
{
    proc->anim2->pScrStart = AnimScr_EfxMistyRainObj3;
    proc->anim2->pScrCurrent = AnimScr_EfxMistyRainObj3;

    proc->anim2->timer = 0;

    SpellFx_RegisterObjPal(Pal_FluxAnimSprites, 0x20);
    SpellFx_RegisterObjGfx(Img_FluxAnimSprites_SigilVoid, 0x1000);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0805F300
void efxMistyRainObj2_0(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;
    anim->pScrStart = AnimScr_EfxMistyRainObj4;
    anim->pScrCurrent = AnimScr_EfxMistyRainObj4;

    anim->timer = 0;

    anim->drawLayerPriority = 20;

    AnimSort();

    proc->timer = 39;

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0805F32C
void efxMistyRainObj2_1(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    proc->timer++;

    if (proc->timer == 40)
    {
        anim->pScrStart = AnimScr_EfxMistyRainObj5;
        anim->pScrCurrent = AnimScr_EfxMistyRainObj5;
        anim->timer = 0;

        proc->timer = 0;
    }

    return;
}
