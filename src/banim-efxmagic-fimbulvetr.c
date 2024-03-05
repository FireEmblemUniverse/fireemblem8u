#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "ctc.h"

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxFimbulvetr[] =
{
    PROC_NAME("efxFimbulvetr"),
    PROC_REPEAT(efxFimbulvetr_Loop_Main),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0805E0E4
void StartSpellAnimFimbulvetr(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();

    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxFimbulvetr, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x0805E120
void efxFimbulvetr_Loop_Main(struct ProcEfx * proc)
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
        StartSubSpell_efxFimbulvetrBGTR(anim);
        StartSubSpell_efxFimbulvetrOBJ2(anim);
        SetBlendAlpha(0, 16);
        NewEfxALPHA(anim, 0, 16, 0, 16, 0);
        PlaySFX(0x122, 0x100, anim->xPosition, 1);
    }

    if (proc->timer == duration + 82)
    {
        NewEfxFlashBgWhite(proc->anim, 4);
    }
    else if (proc->timer == duration + 85)
    {
        StartSubSpell_efxFimbulvetrBG(anim);
        StartSubSpell_efxFimbulvetrOBJ(anim);
        NewEfxALPHA(anim, 24, 16, 16, 0, 0);
        PlaySFX(0x123, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 88)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if ((proc->timer != duration + 136) && (proc->timer == duration + 161))
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxFimbulvetrBGTR[] =
{
    PROC_NAME("efxFimbulvetrBGTR"),
    PROC_REPEAT(efxFimbulvetrBGTR_Loop),

    PROC_END,
};

u16 * CONST_DATA TsaArray_FimbulvetrBg_Tornado[] =
{
    Tsa_FimbulvetrBg_Tornado_A,
    Tsa_FimbulvetrBg_Tornado_B,
    Tsa_FimbulvetrBg_Tornado_C,
    Tsa_FimbulvetrBg_Tornado_D,
    Tsa_FimbulvetrBg_Tornado_E,
    Tsa_FimbulvetrBg_Tornado_F,
};

u16 * CONST_DATA ImgArray_FimbulvetrBg_Tornado[] =
{
    Img_FimbulvetrBg_Tornado_A,
    Img_FimbulvetrBg_Tornado_B,
    Img_FimbulvetrBg_Tornado_C,
    Img_FimbulvetrBg_Tornado_D,
    Img_FimbulvetrBg_Tornado_E,
    Img_FimbulvetrBg_Tornado_F,
};

// clang-format on

//! FE8U = 0x0805E230
void StartSubSpell_efxFimbulvetrBGTR(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    // clang-format off
    static const u16 frames[] =
    {
         0, 3,
         1, 3,
         2, 3,
         0, 3,
         1, 3,
         2, 3,
         0, 3,
         1, 3,
         2, 3,
         0, 3,
         1, 3,
         2, 3,
         0, 3,
         1, 3,
         2, 3,
         0, 3,
         1, 3,
         2, 3,
         0, 3,
         1, 3,
         2, 3,
         0, 3,
         1, 3,
         2, 3,
         3, 3,
         4, 3,
         5, 3,
        -1,
    };
    // clang-format on

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFimbulvetrBGTR, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;
    proc->tsal = TsaArray_FimbulvetrBg_Tornado;
    proc->tsar = TsaArray_FimbulvetrBg_Tornado;
    proc->img = ImgArray_FimbulvetrBg_Tornado;

    SpellFx_RegisterBgPal(Pal_FimbulvetrBg_Tornado, PLTT_SIZE_4BPP);

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
    {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
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

//! FE8U = 0x0805E2B4
void efxFimbulvetrBGTR_Loop(struct ProcEfxBG * proc)
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

struct ProcCmd CONST_DATA ProcScr_efxFimbulvetrBG[] =
{
    PROC_NAME("efxFimbulvetrBG"),
    PROC_REPEAT(efxFimbulvetrBG_Loop),

    PROC_END,
};

u16 * CONST_DATA TsaArray_FimbulvetrBg[] =
{
    Tsa_FimbulvetrBg_A,
    Tsa_FimbulvetrBg_B,
    Tsa_FimbulvetrBg_C,
    Tsa_FimbulvetrBg_D,
    Tsa_FimbulvetrBg_E,
    Tsa_FimbulvetrBg_F,
    Tsa_FimbulvetrBg_G,
    Tsa_FimbulvetrBg_H,
    Tsa_FimbulvetrBg_I,
    Tsa_FimbulvetrBg_J,
    Tsa_FimbulvetrBg_K,
};

u16 * CONST_DATA ImgArray_FimbulvetrBg[] =
{
    Img_FimbulvetrBg_A,
    Img_FimbulvetrBg_A,
    Img_FimbulvetrBg_A,
    Img_FimbulvetrBg_A,
    Img_FimbulvetrBg_A,
    Img_FimbulvetrBg_A,
    Img_FimbulvetrBg_B,
    Img_FimbulvetrBg_B,
    Img_FimbulvetrBg_C,
    Img_FimbulvetrBg_D,
    Img_FimbulvetrBg_D,
};

// clang-format on

//! FE8U = 0x0805E318
void StartSubSpell_efxFimbulvetrBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    // clang-format off
    static const u16 frames[] =
    {
         0,  1,
         1,  1,
         2,  1,
         3,  1,
         4,  1,
         5,  1,
         6,  1,
         7,  1,
         8,  1,
         9,  1,
        10, 30,
        -1,
    };
    // clang-format on

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFimbulvetrBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;
    proc->tsal = TsaArray_FimbulvetrBg;
    proc->tsar = TsaArray_FimbulvetrBg;
    proc->img = ImgArray_FimbulvetrBg;

    SpellFx_RegisterBgPal(Pal_FimbulvetrBg, PLTT_SIZE_4BPP);

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
    {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
        {
            BG_SetPosition(BG_1, 232, 0);
        }
        else
        {
            BG_SetPosition(BG_1, 24, 0);
        }
    }

    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x0805E39C
void efxFimbulvetrBG_Loop(struct ProcEfxBG * proc)
{
    int ret;

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
    {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
        {
            BG_SetPosition(BG_1, 24, 0);
        }
        else
        {
            BG_SetPosition(BG_1, 232, 0);
        }
    }

    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

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

struct ProcCmd CONST_DATA ProcScr_efxFimbulvetrOBJ[] =
{
    PROC_NAME("efxFimbulvetrOBJ"),
    PROC_REPEAT(efxFimbulvetrOBJ_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0805E430
void StartSubSpell_efxFimbulvetrOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFimbulvetrOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_FimbulvetrOBJ1, AnimScr_FimbulvetrOBJ1, AnimScr_FimbulvetrOBJ1, AnimScr_FimbulvetrOBJ1);
    proc->anim2->xPosition += 24;

    SpellFx_RegisterObjPal(Pal_HealSprites_Sparkles, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_FimbulvetrSprites_Snow, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x0805E494
void efxFimbulvetrOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer > 51)
    {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxFimbulvetrOBJ2[] =
{
    PROC_NAME("efxFimbulvetrOBJ2"),
    PROC_REPEAT(efxFimbulvetrOBJ2_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0805E4C4
void StartSubSpell_efxFimbulvetrOBJ2(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFimbulvetrOBJ2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;
    proc->unk44 = 1;
    proc->unk48 = 0;

    SpellFx_RegisterObjPal(Pal_HealSprites_Sparkles, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_FimbulvetrSprites_Snow, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x0805E510
void efxFimbulvetrOBJ2_Loop(struct ProcEfxOBJ * proc)
{
    int i;

    for (i = 0; i < 32; i++)
    {
        StartSubSpell_efxFimbulvetrOBJ2Fall(proc->anim, i);
    }

    gEfxBgSemaphore--;

    Proc_Break(proc);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxFimbulvetrOBJ2Fall[] =
{
    PROC_NAME("efxFimbulvetrOBJ2Fall"),
    PROC_REPEAT(efxFimbulvetrOBJ2Fall_Loop),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0805E53C
void StartSubSpell_efxFimbulvetrOBJ2Fall(struct Anim * anim, int unk)
{
    struct ProcEfxOBJ * proc;
    struct Anim * anim2;

    u8 array[8] = { 0, 0, 0, 0, 0, 0, 1, 1 };

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFimbulvetrOBJ2Fall, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 100;
    proc->unk29 = array[unk & 7];

    anim2 = AnimCreate(AnimScr_FimbulvetrOBJ2, 120);
    proc->anim2 = anim2;
    anim2->oam2Base = OAM2_CHR(0x40) + OAM2_LAYER(2) + OAM2_PAL(2);
    anim2->xPosition = 256;
    anim2->yPosition = 256;

    proc->unk32 = sub_80716B0(UINT16_MAX);
    proc->unk3A = sub_80716B0(UINT16_MAX);

    if (array[unk & 7] == 0)
    {
        proc->unk34 = (sub_80716B0(UINT16_MAX) & 0x1FF) + 0x700;
    }
    else
    {
        proc->unk34 = (sub_80716B0(UINT16_MAX) & 0x1FF) + 0xa00;
    }

    proc->unk3C = (sub_80716B0(UINT16_MAX - 240) & 0x3FF) - 0x100;
    proc->unk36 = sub_80716B0(UINT16_MAX - 240);
    proc->unk3E = sub_80716B0(UINT16_MAX - 240);

    if (array[unk & 7] == 0)
    {
        proc->unk38 = (sub_80716B0(UINT16_MAX - 240) & 0x1FF) + 0x700;
    }
    else
    {
        proc->unk38 = (sub_80716B0(UINT16_MAX - 240) & 0x1FF) + 0xa00;
    }

    proc->unk40 = (sub_80716B0(UINT16_MAX - 240) & 0x3FF) - 0x100;

    return;
}

//! FE8U = 0x0805E694
void efxFimbulvetrOBJ2Fall_Loop(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(anim);
        Proc_Break(proc);
    }
    else
    {
        if (!(proc->timer & 1))
        {
            if (proc->unk29 == 0)
            {
                anim->pScrStart = AnimScr_FimbulvetrOBJ2Fall_TypeA;
                anim->pScrCurrent = AnimScr_FimbulvetrOBJ2Fall_TypeA;
            }
            else
            {
                anim->pScrStart = AnimScr_FimbulvetrOBJ2Fall_TypeB;
                anim->pScrCurrent = AnimScr_FimbulvetrOBJ2Fall_TypeB;
            }

            anim->timer = 0;

            proc->unk32 += proc->unk34;
            proc->unk3A += proc->unk3C;
            anim->xPosition = proc->unk32 >> 8;
            anim->yPosition = proc->unk3A >> 8;
        }
        else
        {
            if (proc->unk29 == 0)
            {
                anim->pScrStart = AnimScr_FimbulvetrOBJ2Fall_TypeA;
                anim->pScrCurrent = AnimScr_FimbulvetrOBJ2Fall_TypeA;
            }
            else
            {
                anim->pScrStart = AnimScr_FimbulvetrOBJ2Fall_TypeB;
                anim->pScrCurrent = AnimScr_FimbulvetrOBJ2Fall_TypeB;
            }

            anim->timer = 0;

            proc->unk3E += proc->unk38;
            proc->unk3E += proc->unk40;
            anim->xPosition = proc->unk36 >> 8;
            anim->yPosition = proc->unk3E >> 8;
        }
    }

    return;
}
