#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
#include "ctc.h"

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxSilence[] =
{
    PROC_NAME("efxSilence"),
    PROC_REPEAT(efxSilence_Loop_Main),
    PROC_END,
};

// clang-format on

//! FE8U = 0x080623E0
void StartSpellAnimSilence(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxSilence, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x0806241C
void efxSilence_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        StartSubSpell_efxSilenceOBJ(proc->anim);
        PlaySFX(0xfa, 0x100, proc->anim->xPosition, 1);
    }

    if (proc->timer == 41)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else if (proc->timer == duration + 68)
    {
        StartSubSpell_efxSilenceBG(proc->anim);
        PlaySFX(0xfb, 0x100, anim->xPosition, 1);
        NewEfxALPHA(proc->anim, 66, 20, 16, 0, 0);
    }
    else if (proc->timer == duration + 134)
    {
        PlaySFX(0xfc, 0x100, anim->xPosition, 1);
        StopBGM1();

        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimStatusChgHitEffects(anim, proc->hitted);
        NewEfxFlashBgWhite(proc->anim, 10);

        if (!proc->hitted && (GetUnitEfxDebuff(anim) == 0))
        {
            SetUnitEfxDebuff(anim, 3);
        }
    }
    else if (proc->timer == duration + 158)
    {
        anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;

        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxSilenceBG[] =
{
    PROC_NAME("efxSilenceBG"),
    PROC_REPEAT(efxSilenceBG_Loop),
    PROC_END,
};

u16 * CONST_DATA TsaArray_SilenceBg[] =
{
    Tsa_0867F97C,
    Tsa_0867FA78,
    Tsa_0867FB60,
    Tsa_0867FC48,
    Tsa_0867FD30,
    Tsa_0867FE2C,
    Tsa_0867FF14,
    Tsa_0867FFAC,
    Tsa_08680094,
    Tsa_0868012C,
    Tsa_08680214,
    Tsa_08680310,
    Tsa_086803A8,
    Tsa_08680490,
    Tsa_08680528,
    Tsa_08680624,
    Tsa_086806BC,
    Tsa_086807CC,
};

// clang-format on

//! FE8U = 0x08062524
void StartSubSpell_efxSilenceBG(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
         0,  2,
         1,  1,
         2,  1,
         3,  1,
         4,  1,
         5,  1,
         6,  4,
         7,  1,
         8,  5,
         9,  2,
        10,  2,
        11,  2,
        12,  2,
        13,  2,
        14,  2,
        15,  1,
        16,  5,
        17, 50,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSilenceBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_SilenceBg;
    proc->tsar = TsaArray_SilenceBg;

    SpellFx_RegisterBgPal(Pal_Silence, PLTT_SIZE_4BPP);
    SpellFx_RegisterBgGfx(Img_SilenceBg, 32 * 8 * CHR_SIZE);

    SpellFx_SetSomeColorEffect();

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

    return;
}

//! FE8U = 0x080625B0
void efxSilenceBG_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;

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

struct ProcCmd CONST_DATA ProcScr_efxSilenceOBJ[] =
{
    PROC_NAME("efxSilenceOBJ"),
    PROC_SET_END_CB(efxSilenceOBJ_OnEnd),
    PROC_SLEEP(40),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08062608
void StartSubSpell_efxSilenceOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSilenceOBJ, PROC_TREE_3);
    proc->anim = anim;

    proc->anim2 = EfxCreateFrontAnim(anim, gUnknown_08680FFC, gUnknown_08680FFC, gUnknown_08680FFC, gUnknown_08680FFC);

    SpellFx_RegisterObjPal(Pal_Silence, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_SilenceSprites, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x08062660
void efxSilenceOBJ_OnEnd(struct ProcEfxOBJ * proc)
{
    AnimDelete(proc->anim2);
    gEfxBgSemaphore--;
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxSleep[] =
{
    PROC_NAME("efxSleep"),
    PROC_REPEAT(efxSleep_Loop_Main),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08062678
void StartSpellAnimSleep(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxSleep, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x080626B4
void efxSleep_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        sub_8062898(proc->anim);
        PlaySFX(0x11B, 0x100, proc->anim->xPosition, 1);
    }

    if (proc->timer == 100)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }

    if (proc->timer == duration + 130)
    {
        StartSubSpell_efxSleepOBJ2(anim);
        StartSubSpell_efxSleepSE(anim);

        StartSubSpell_efxSleepBG(proc->anim);

        NewEfxALPHA(anim, 0, 20, 0, 16, 0);
        NewEfxALPHA(anim, 230, 20, 16, 0, 0);
    }
    else if (proc->timer == duration + 330)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimStatusChgHitEffects(anim, proc->hitted);

        if (!proc->hitted && GetUnitEfxDebuff(anim) == 0)
        {
            SetUnitEfxDebuff(anim, 2);
        }
    }
    else if (proc->timer == duration + 370)
    {
        anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;

        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxSleepBG[] =
{
    PROC_NAME("efxSleepBG"),
    PROC_REPEAT(efxSleepBG_Loop),
    PROC_END,
};

u16 * CONST_DATA TsaArray_SleepBg[] =
{
    Tsa_086861C4,
    Tsa_086862A0,
    Tsa_0868637C,
    Tsa_08686458,
    Tsa_08686534,
    Tsa_08686610,
    Tsa_086866EC,
    Tsa_086867C8,
    Tsa_086868A4,
    Tsa_08686980,
    Tsa_08686A5C,
    Tsa_08686B38,
    Tsa_08686C14,
    Tsa_08686CF0,
    Tsa_08686DCC,
    Tsa_08686EA8,
};

// clang-format on

//! FE8U = 0x080627B4
void StartSubSpell_efxSleepBG(struct Anim * anim)
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
        15, 4,
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
        15, 4,
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
        15, 4,
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
        15, 4,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;
    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSleepBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_SleepBg;
    proc->tsar = TsaArray_SleepBg;

    SpellFx_RegisterBgPal(Pal_SleepBg, PLTT_SIZE_4BPP);
    SpellFx_RegisterBgGfx(Img_SleepBg, 32 * 8 * CHR_SIZE);

    SpellFx_SetSomeColorEffect();

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

    return;
}

//! FE8U = 0x08062840
void efxSleepBG_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;

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

struct ProcCmd CONST_DATA ProcScr_efxSleepOBJ[] =
{
    PROC_NAME("efxSleepOBJ"),
    PROC_SET_END_CB(efxSleepOBJ_OnEnd),
    PROC_SLEEP(80),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08062898
void sub_8062898(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSleepOBJ, PROC_TREE_3);
    proc->anim = anim;

    proc->anim2 = EfxCreateFrontAnim(anim, gUnknown_0868C2E8, gUnknown_0868C2E8, gUnknown_0868C2E8, gUnknown_0868C2E8);

    SpellFx_RegisterObjPal(Pal_SleepSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_SleepSprites, 32 * 2 * CHR_SIZE);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxSleepOBJ2[] =
{
    PROC_NAME("efxSleepOBJ2"),
    PROC_SET_END_CB(efxSleepOBJ_OnEnd),
    PROC_SLEEP(200),
    PROC_END,
};

// clang-format on

//! FE8U = 0x080628F0
void StartSubSpell_efxSleepOBJ2(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSleepOBJ2, PROC_TREE_3);
    proc->anim = anim;

    frontAnim = EfxCreateFrontAnim(anim, gUnknown_0868C168, gUnknown_0868C168, gUnknown_0868C168, gUnknown_0868C168);
    proc->anim2 = frontAnim;
    frontAnim->yPosition -= 8;

    return;
}

//! FE8U = 0x08062934
void efxSleepOBJ_OnEnd(void)
{
    gEfxBgSemaphore--;
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxSleepSE[] =
{
    PROC_NAME("efxSleepSE"),

    PROC_SET_END_CB(efxSleepSE_OnEnd),
    PROC_SLEEP(1),

    PROC_CALL(efxSleepSE_PlaySE),
    PROC_SLEEP(54),

    PROC_CALL(efxSleepSE_PlaySE),
    PROC_SLEEP(65),

    PROC_CALL(efxSleepSE_PlaySE),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08062944
void StartSubSpell_efxSleepSE(struct Anim * anim)
{
    struct ProcEfx * proc;
    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSleepSE, PROC_TREE_3);
    proc->anim = anim;

    return;
}

//! FE8U = 0x08062968
void efxSleepSE_PlaySE(struct ProcEfx * proc)
{
    PlaySFX(0x11c, 0x100, proc->anim->xPosition, 1);
    return;
}

//! FE8U = 0x08062988
void efxSleepSE_OnEnd(void)
{
    gEfxBgSemaphore--;
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxHammarne[] =
{
    PROC_NAME("efxHammarne"),
    PROC_REPEAT(efxHammarne_Loop_Main),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08062998
void StartSpellAnimHammerne(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxHammarne, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x080629D4
void efxHammarne_Loop_Main(struct ProcEfx * proc)
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
        StartSubSpell_efxHammarneBG(anim);

        NewEfxALPHA(anim, 40, 30, 16, 8, 0);
        NewEfxALPHA(anim, 71, 30, 8, 16, 0);
        NewEfxALPHA(anim, 102, 30, 16, 8, 0);
        NewEfxALPHA(anim, 133, 30, 8, 16, 0);
        NewEfxALPHA(anim, 164, 60, 16, 0, 0);

        PlaySFX(0x103, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 80)
    {
        StartSubSpell_efxHammarneOBJ(anim);
    }
    else if (proc->timer == duration + 164)
    {
        NewEfxFlashUnit(anim, 1, 5, 0);
    }
    else if (proc->timer == duration + 200)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
        StartBattleAnimStatusChgHitEffects(anim, proc->hitted);
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

struct ProcCmd CONST_DATA ProcScr_efxHammarneBG[] =
{
    PROC_NAME("efxHammarneBG"),
    PROC_REPEAT(efxHammarneBG_Loop),
    PROC_END,
};

u16 * CONST_DATA TsaArray_HammerneBg[] =
{
    Tsa_086810D8,
    Tsa_08681184,
    Tsa_08681234,
    Tsa_086812F4,
    Tsa_086813BC,
    Tsa_08681494,
    Tsa_08681570,
    Tsa_08681658,
    Tsa_08681748,
    Tsa_08681848,
    Tsa_08681954,
    Tsa_08681A74,
    Tsa_08681BA4,
};

u16 * CONST_DATA ImgArray_HammerneBg[] =
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

//! FE8U = 0x08062AF4
void StartSubSpell_efxHammarneBG(struct Anim * anim)
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

    proc = Proc_Start(ProcScr_efxHammarneBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_HammerneBg;
    proc->tsar = TsaArray_HammerneBg;

    proc->img = ImgArray_HammerneBg;

    SpellFx_RegisterBgPal(Pal_HammerneBg, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08062B48
void efxHammarneBG_Loop(struct ProcEfxBG * proc)
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

struct ProcCmd CONST_DATA ProcScr_efxHammarneOBJ[] =
{
    PROC_NAME("efxHammarneOBJ"),
    PROC_SET_END_CB(efxHammarneOBJ_OnEnd),
    PROC_SLEEP(80),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08062BAC
void StartSubSpell_efxHammarneOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxHammarneOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->anim2 = EfxCreateFrontAnim(anim, gUnknown_08684908, gUnknown_08684908, gUnknown_08684908, gUnknown_08684908);

    SpellFx_RegisterObjPal(Pal_HammerneSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_SleepSprites, 32 * 2 * CHR_SIZE);

    return;
}

//! FE8U = 0x08062C04
void efxHammarneOBJ_OnEnd(void)
{
    gEfxBgSemaphore--;
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxBerserk[] =
{
    PROC_NAME("efxBerserk"),
    PROC_REPEAT(efxBerserk_Loop_Main),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08062C14
void StartSpellAnimBerserk(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxBerserk, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x08062C50
void efxBerserk_Loop_Main(struct ProcEfx * proc)
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
        StartSubSpell_efxBerserkOBJ(anim);
        StartSubSpell_efxBerserkBG(anim, 74);
        StartSubSpell_efxBerserkCLONE(anim, 74);

        NewefxRestRST(anim, 74, 10, 0x100, 1);
        NewEfxRestWINH_(anim, 74, 0);

        PlaySFX(0xf9, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 74)
    {
        NewEfxFlashBgWhite(anim, 5);
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimStatusChgHitEffects(anim, proc->hitted);

        if (!proc->hitted && (GetUnitEfxDebuff(anim) == 0))
        {
            SetUnitEfxDebuff(anim, 4);
        }
    }
    else if (proc->timer == duration + 90)
    {
        anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;

        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxBerserkBG[] =
{
    PROC_NAME("efxBerserkBG"),
    PROC_REPEAT(efxBerserkBG_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08062D30
void StartSubSpell_efxBerserkBG(struct Anim * anim, int terminator)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxBerserkBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    SpellFx_RegisterBgPal(Pal_BerserkBg, PLTT_SIZE_4BPP);
    SpellFx_RegisterBgGfx(Img_086849B8, 32 * 8 * CHR_SIZE);

    EfxTmCpyBG(gUnknown_08684AB8, gBG1TilemapBuffer, 0x20, 0x20, 1, 0x100);

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    SpellFx_SetSomeColorEffect();
    SetBlendAlpha(14, 8);

    sub_80708A0();

    gLCDControlBuffer.wincnt.wobj_enableBlend = 1;
    SetWinEnable(0, 0, 1);
    SetWObjLayers(0, 1, 1, 1, 1);

    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 1);

    gLCDControlBuffer.bldcnt.target2_bd_on = 1;

    anim->oamBase |= OAM0_WINDOW;

    anim->oam2Base &= ~OAM2_LAYER(3);
    anim->oam2Base |= OAM2_LAYER(1);

    return;
}

//! FE8U = 0x08062E44
void efxBerserkBG_Loop(struct ProcEfxBG * proc)
{
    struct Anim * anim = proc->anim;

    gLCDControlBuffer.bgoffset[BG_1].y--;

    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        SpellFx_ClearBG1();
        SetDefaultColorEffects_();
        sub_8070874();

        anim->oamBase &= ~OAM0_WINDOW;

        anim->oam2Base &= ~OAM2_LAYER(3);
        anim->oam2Base |= OAM2_LAYER(2);

        gEfxBgSemaphore--;

        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxBerserkCLONE[] =
{
    PROC_NAME("efxBerserkCLONE"),
    PROC_SET_END_CB(efxBerserkCLONE_OnEnd),
    PROC_REPEAT(efxBerserkCLONE_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08062EAC
void StartSubSpell_efxBerserkCLONE(struct Anim * anim, int terminator)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxBerserkCLONE, PROC_TREE_4);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    return;
}

//! FE8U = 0x08062ED8
void efxBerserkCLONE_Loop(struct ProcEfxBG * proc)
{
    struct Anim clone;

    struct Anim * anim = proc->anim;

    clone.xPosition = anim->xPosition;
    clone.yPosition = anim->yPosition;

    clone.pSpriteData = anim->pSpriteData;

    clone.oamBase = anim->oamBase & ~(OAM0_WINDOW);

    clone.oam2Base = anim->oam2Base;
    clone.oam2Base &= ~OAM2_LAYER(3);
    clone.oam2Base |= OAM2_LAYER(2);

    AnimDisplay(&clone);

    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08062F3C
void efxBerserkCLONE_OnEnd(void)
{
    gEfxBgSemaphore--;
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxBerserkOBJ[] =
{
    PROC_NAME("efxBerserkOBJ"),

    PROC_SET_END_CB(efxBerserkOBJ_OnEnd),

    PROC_REPEAT(efxBerserkOBJ_Loop_A),
    PROC_SLEEP(7),

    PROC_REPEAT(efxBerserkOBJ_Loop_B),
    PROC_SLEEP(3),

    PROC_REPEAT(efxBerserkOBJ_Loop_C),
    PROC_SLEEP(7),

    PROC_REPEAT(efxBerserkOBJ_Loop_D),
    PROC_SLEEP(3),

    PROC_REPEAT(efxBerserkOBJ_Loop_E),
    PROC_SLEEP(7),

    PROC_REPEAT(efxBerserkOBJ_Loop_F),
    PROC_SLEEP(3),

    PROC_REPEAT(efxBerserkOBJ_Loop_G),
    PROC_SLEEP(7),

    PROC_REPEAT(efxBerserkOBJ_Loop_H),
    PROC_SLEEP(3),

    PROC_REPEAT(efxBerserkOBJ_Loop_I),
    PROC_SLEEP(7),

    PROC_REPEAT(efxBerserkOBJ_Loop_J),
    PROC_SLEEP(17),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08062F4C
void StartSubSpell_efxBerserkOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxBerserkOBJ, PROC_TREE_3);
    proc->anim = anim;

    GetAnimAnotherSide(anim);

    scr = FramScr_Unk5D4F90;
    frontAnim = EfxCreateFrontAnim(proc->anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    frontAnim->oam2Base &= ~OAM2_LAYER(3);
    frontAnim->oam2Base |= OAM2_LAYER(1);

    return;
}

//! FE8U = 0x08062FA4
void efxBerserkOBJ_OnEnd(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
    return;
}

//! FE8U = 0x08062FBC
void efxBerserkOBJ_Loop_A(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = gUnknown_0868D2B4;
    anim->pScrCurrent = gUnknown_0868D2B4;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_A, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x08062FF8
void efxBerserkOBJ_Loop_C(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = gUnknown_0868D2C8;
    anim->pScrCurrent = gUnknown_0868D2C8;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_A, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x08063034
void efxBerserkOBJ_Loop_E(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = gUnknown_0868D2DC;
    anim->pScrCurrent = gUnknown_0868D2DC;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_A, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x08063070
void efxBerserkOBJ_Loop_G(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = gUnknown_0868D2F0;
    anim->pScrCurrent = gUnknown_0868D2F0;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_A, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x080630AC
void efxBerserkOBJ_Loop_I(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = gUnknown_0868D304;
    anim->pScrCurrent = gUnknown_0868D304;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_A, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x080630E8
void efxBerserkOBJ_Loop_B(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = gUnknown_0868D678;
    anim->pScrCurrent = gUnknown_0868D678;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_B, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x08063124
void efxBerserkOBJ_Loop_D(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = gUnknown_0868D684;
    anim->pScrCurrent = gUnknown_0868D684;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_B, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x08063160
void efxBerserkOBJ_Loop_F(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = gUnknown_0868D690;
    anim->pScrCurrent = gUnknown_0868D690;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_B, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0806319C
void efxBerserkOBJ_Loop_H(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = gUnknown_0868D69C;
    anim->pScrCurrent = gUnknown_0868D69C;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_B, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x080631D8
void efxBerserkOBJ_Loop_J(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = gUnknown_0868D6A8;
    anim->pScrCurrent = gUnknown_0868D6A8;
    anim->timer = 0;

    SpellFx_RegisterObjPal(Pal_BerserkSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_BerserkSprites_B, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxMshield[] =
{
    PROC_NAME("efxMshield"),
    PROC_REPEAT(efxMshield_Loop_Main),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08063214
void StartSpellAnimBarrier(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxMshield, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x08063250
void efxMshield_Loop_Main(struct ProcEfx * proc)
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
        StartSubSpell_efxMshieldBG(proc->anim);
        StartSubSpell_efxMshieldBGOBJ(anim);
        StartSubSpell_efxMshieldBGOBJ2(anim);
        PlaySFX(0x102, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 40)
    {
        StartSubSpell_efxMshieldBGOBJ2(anim);
    }
    else if (proc->timer == duration + 80)
    {
        StartSubSpell_efxMshieldBGOBJ2(anim);
    }
    else if (proc->timer == duration + 176)
    {
        NewEfxFlashUnit(anim, 1, 5, 0);
    }
    else if (proc->timer == duration + 225)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
        StartBattleAnimStatusChgHitEffects(anim, proc->hitted);
    }
    else if (proc->timer == duration + 230)
    {
        anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;

        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxMshieldBG[] =
{
    PROC_NAME("efxMshieldBG"),
    PROC_REPEAT(efxMshieldBG_Loop),
    PROC_END,
};

u16 * CONST_DATA TsaArray_BarrierBg[] =
{
    Tsa_0868DF9C,
    Tsa_0868E054,
    Tsa_0868E118,
    Tsa_0868E208,
    Tsa_0868E338,
};

// clang-format on

//! FE8U = 0x0806331C
void StartSubSpell_efxMshieldBG(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
         0, 2,
         1, 2,
         2, 2,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         2, 3,
         1, 2,
         0, 2,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMshieldBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_BarrierBg;
    proc->tsar = TsaArray_BarrierBg;

    SpellFx_RegisterBgPal(Pal_BarrierBg, PLTT_SIZE_4BPP);
    SpellFx_RegisterBgGfx(Img_BarrierBg, 32 * 8 * CHR_SIZE);

    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08063378
void efxMshieldBG_Loop(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;

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

struct ProcCmd CONST_DATA ProcScr_efxMshieldBGOBJ[] =
{
    PROC_NAME("efxMshieldOBJ"),
    PROC_SET_END_CB(efxMshieldBGOBJ_OnEnd),
    PROC_SLEEP(220),
    PROC_END,
};

// clang-format on

//! FE8U = 0x080633D0
void StartSubSpell_efxMshieldBGOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMshieldBGOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->anim2 = EfxCreateFrontAnim(anim, gUnknown_08692524, gUnknown_08692524, gUnknown_08692524, gUnknown_08692524);

    SpellFx_RegisterObjPal(gUnknown_0868E46C, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_SleepSprites, 32 * 2 * CHR_SIZE);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxMshieldBGOBJ2[] =
{
    PROC_NAME("efxMshieldOBJ2"),
    PROC_SET_END_CB(efxMshieldBGOBJ_OnEnd),
    PROC_SLEEP(110),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08063428
void StartSubSpell_efxMshieldBGOBJ2(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMshieldBGOBJ2, PROC_TREE_3);
    proc->anim = anim;
    proc->anim2 = EfxCreateFrontAnim(anim, gUnknown_08692674, gUnknown_08692674, gUnknown_08692674, gUnknown_08692674);

    return;
}

//! FE8U = 0x08063468
void efxMshieldBGOBJ_OnEnd(struct ProcEfxOBJ * proc)
{
    AnimDelete(proc->anim2);
    gEfxBgSemaphore--;
    return;
}
