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

struct ProcCmd CONST_DATA gUnknown_085D6B20[] =
{
    PROC_NAME("efxSilence"),
    PROC_REPEAT(sub_806241C),
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

    proc = Proc_Start(gUnknown_085D6B20, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x0806241C
void sub_806241C(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        sub_8062608(proc->anim);
        PlaySFX(0xfa, 0x100, proc->anim->xPosition, 1);
    }

    if (proc->timer == 41)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else if (proc->timer == duration + 68)
    {
        sub_8062524(proc->anim);
        PlaySFX(0xfb, 0x100, anim->xPosition, 1);
        NewEfxALPHA(proc->anim, 66, 20, 16, 0, 0);
    }
    else if (proc->timer == duration + 134)
    {
        PlaySFX(0xfc, 0x100, anim->xPosition, 1);
        StopBGM1();

        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        sub_8055518(anim, proc->hitted);
        NewEfxFlashBgWhite(proc->anim, 10);

        if (!proc->hitted && (GettUnitEfxDebuff(anim) == 0))
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

struct ProcCmd CONST_DATA gUnknown_085D6B38[] =
{
    PROC_NAME("efxSilenceBG"),
    PROC_REPEAT(sub_80625B0),
    PROC_END,
};

u16 * CONST_DATA gUnknown_085D6B50[] =
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
void sub_8062524(struct Anim * anim)
{
    // clang-format off
    static const u16 gUnknown_080DDCE6[] =
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

    proc = Proc_Start(gUnknown_085D6B38, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DDCE6;

    proc->tsal = gUnknown_085D6B50;
    proc->tsar = gUnknown_085D6B50;

    SpellFx_RegisterBgPal(gUnknown_08680DC0, PLTT_SIZE_4BPP);
    SpellFx_RegisterBgGfx(gUnknown_0867EEB4, 32 * 8 * CHR_SIZE);

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
void sub_80625B0(struct ProcEfxBG * proc)
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

struct ProcCmd CONST_DATA gUnknown_085D6B98[] =
{
    PROC_NAME("efxSilenceOBJ"),
    PROC_SET_END_CB(sub_8062660),
    PROC_SLEEP(40),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08062608
void sub_8062608(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D6B98, PROC_TREE_3);
    proc->anim = anim;

    proc->anim2 = EfxCreateFrontAnim(anim, gUnknown_08680FFC, gUnknown_08680FFC, gUnknown_08680FFC, gUnknown_08680FFC);

    SpellFx_RegisterObjPal(gUnknown_08680DC0, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(gUnknown_086808A0, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x08062660
void sub_8062660(struct ProcEfxOBJ * proc)
{
    AnimDelete(proc->anim2);
    gEfxBgSemaphore--;
    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D6BB8[] =
{
    PROC_NAME("efxSleep"),
    PROC_REPEAT(sub_80626B4),
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

    proc = Proc_Start(gUnknown_085D6BB8, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x080626B4
void sub_80626B4(struct ProcEfx * proc)
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
        sub_80628F0(anim);
        sub_8062944(anim);

        sub_80627B4(proc->anim);

        NewEfxALPHA(anim, 0, 20, 0, 16, 0);
        NewEfxALPHA(anim, 230, 20, 16, 0, 0);
    }
    else if (proc->timer == duration + 330)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        sub_8055518(anim, proc->hitted);

        if (!proc->hitted && GettUnitEfxDebuff(anim) == 0)
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

struct ProcCmd CONST_DATA gUnknown_085D6BD0[] =
{
    PROC_NAME("efxSleepBG"),
    PROC_REPEAT(sub_8062840),
    PROC_END,
};

u16 * CONST_DATA gUnknown_085D6BE8[] =
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
void sub_80627B4(struct Anim * anim)
{
    // clang-format off
    static const u16 gUnknown_080DDD58[] =
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

    proc = Proc_Start(gUnknown_085D6BD0, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DDD58;

    proc->tsal = gUnknown_085D6BE8;
    proc->tsar = gUnknown_085D6BE8;

    SpellFx_RegisterBgPal(gUnknown_086861A4, PLTT_SIZE_4BPP);
    SpellFx_RegisterBgGfx(gUnknown_086852D8, 32 * 8 * CHR_SIZE);

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
void sub_8062840(struct ProcEfxBG * proc)
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

struct ProcCmd CONST_DATA gUnknown_085D6C28[] =
{
    PROC_NAME("efxSleepOBJ"),
    PROC_SET_END_CB(sub_8062934),
    PROC_SLEEP(80),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08062898
void sub_8062898(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D6C28, PROC_TREE_3);
    proc->anim = anim;

    proc->anim2 = EfxCreateFrontAnim(anim, gUnknown_0868C2E8, gUnknown_0868C2E8, gUnknown_0868C2E8, gUnknown_0868C2E8);

    SpellFx_RegisterObjPal(gUnknown_0868716C, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(gUnknown_08686F84, 32 * 2 * CHR_SIZE);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxSleepOBJ2[] =
{
    PROC_NAME("efxSleepOBJ2"),
    PROC_SET_END_CB(sub_8062934),
    PROC_SLEEP(200),
    PROC_END,
};

// clang-format on

//! FE8U = 0x080628F0
void sub_80628F0(struct Anim * anim)
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
void sub_8062934(void)
{
    gEfxBgSemaphore--;
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxSleepSE[] =
{
    PROC_NAME("efxSleepSE"),

    PROC_SET_END_CB(sub_8062988),
    PROC_SLEEP(1),

    PROC_CALL(sub_8062968),
    PROC_SLEEP(54),

    PROC_CALL(sub_8062968),
    PROC_SLEEP(65),

    PROC_CALL(sub_8062968),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08062944
void sub_8062944(struct Anim * anim)
{
    struct ProcEfx * proc;
    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSleepSE, PROC_TREE_3);
    proc->anim = anim;

    return;
}

//! FE8U = 0x08062968
void sub_8062968(struct ProcEfx * proc)
{
    PlaySFX(0x11c, 0x100, proc->anim->xPosition, 1);
    return;
}

//! FE8U = 0x08062988
void sub_8062988(void)
{
    gEfxBgSemaphore--;
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxHammarne[] =
{
    PROC_NAME("efxHammarne"),
    PROC_REPEAT(sub_80629D4),
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
void sub_80629D4(struct ProcEfx * proc)
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
        sub_8062AF4(anim);

        NewEfxALPHA(anim, 40, 30, 16, 8, 0);
        NewEfxALPHA(anim, 71, 30, 8, 16, 0);
        NewEfxALPHA(anim, 102, 30, 16, 8, 0);
        NewEfxALPHA(anim, 133, 30, 8, 16, 0);
        NewEfxALPHA(anim, 164, 60, 16, 0, 0);

        PlaySFX(0x103, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 80)
    {
        sub_8062BAC(anim);
    }
    else if (proc->timer == duration + 164)
    {
        NewEfxFlashUnit(anim, 1, 5, 0);
    }
    else if (proc->timer == duration + 200)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
        sub_8055518(anim, proc->hitted);
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
    PROC_REPEAT(sub_8062B48),
    PROC_END,
};

u16 * CONST_DATA gUnknown_085D6CE0[] =
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

u16 * CONST_DATA gUnknown_085D6D14[] =
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
void sub_8062AF4(struct Anim * anim)
{
    // clang-format off
    static const u16 gUnknown_080DDE9E[] =
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
    proc->frame_config = gUnknown_080DDE9E;

    proc->tsal = gUnknown_085D6CE0;
    proc->tsar = gUnknown_085D6CE0;

    proc->img = gUnknown_085D6D14;

    SpellFx_RegisterBgPal(gUnknown_086810B8, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08062B48
void sub_8062B48(struct ProcEfxBG * proc)
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
    PROC_SET_END_CB(sub_8062C04),
    PROC_SLEEP(80),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08062BAC
void sub_8062BAC(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxHammarneOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->anim2 = EfxCreateFrontAnim(anim, gUnknown_08684908, gUnknown_08684908, gUnknown_08684908, gUnknown_08684908);

    SpellFx_RegisterObjPal(gUnknown_0868718C, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(gUnknown_08686F84, 32 * 2 * CHR_SIZE);

    return;
}

//! FE8U = 0x08062C04
void sub_8062C04(void)
{
    gEfxBgSemaphore--;
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxBerserk[] =
{
    PROC_NAME("efxBerserk"),
    PROC_REPEAT(sub_8062C50),
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
void sub_8062C50(struct ProcEfx * proc)
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
        sub_8062F4C(anim);
        sub_8062D30(anim, 74);
        sub_8062EAC(anim, 74);

        NewefxRestRST(anim, 74, 10, 0x100, 1);
        NewEfxRestWINH_(anim, 74, 0);

        PlaySFX(0xf9, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 74)
    {
        NewEfxFlashBgWhite(anim, 5);
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        sub_8055518(anim, proc->hitted);

        if (!proc->hitted && (GettUnitEfxDebuff(anim) == 0))
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
    PROC_REPEAT(sub_8062E44),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08062D30
void sub_8062D30(struct Anim * anim, int terminator)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxBerserkBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    SpellFx_RegisterBgPal(gUnknown_0868C338, PLTT_SIZE_4BPP);
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
void sub_8062E44(struct ProcEfxBG * proc)
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
    PROC_SET_END_CB(sub_8062F3C),
    PROC_REPEAT(sub_8062ED8),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08062EAC
void sub_8062EAC(struct Anim * anim, int terminator)
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
void sub_8062ED8(struct ProcEfxBG * proc)
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
void sub_8062F3C(void)
{
    gEfxBgSemaphore--;
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxBerserkOBJ[] =
{
    PROC_NAME("efxBerserkOBJ"),

    PROC_SET_END_CB(sub_8062FA4),

    PROC_REPEAT(sub_8062FBC),
    PROC_SLEEP(7),

    PROC_REPEAT(sub_80630E8),
    PROC_SLEEP(3),

    PROC_REPEAT(sub_8062FF8),
    PROC_SLEEP(7),

    PROC_REPEAT(sub_8063124),
    PROC_SLEEP(3),

    PROC_REPEAT(sub_8063034),
    PROC_SLEEP(7),

    PROC_REPEAT(sub_8063160),
    PROC_SLEEP(3),

    PROC_REPEAT(sub_8063070),
    PROC_SLEEP(7),

    PROC_REPEAT(sub_806319C),
    PROC_SLEEP(3),

    PROC_REPEAT(sub_80630AC),
    PROC_SLEEP(7),

    PROC_REPEAT(sub_80631D8),
    PROC_SLEEP(17),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08062F4C
void sub_8062F4C(struct Anim * anim)
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
void sub_8062FA4(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
    return;
}

//! FE8U = 0x08062FBC
void sub_8062FBC(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = gUnknown_0868D2B4;
    anim->pScrCurrent = gUnknown_0868D2B4;
    anim->timer = 0;

    SpellFx_RegisterObjPal(gUnknown_0868CC10, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(gUnknown_0868C358, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x08062FF8
void sub_8062FF8(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = gUnknown_0868D2C8;
    anim->pScrCurrent = gUnknown_0868D2C8;
    anim->timer = 0;

    SpellFx_RegisterObjPal(gUnknown_0868CC10, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(gUnknown_0868C358, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x08063034
void sub_8063034(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = gUnknown_0868D2DC;
    anim->pScrCurrent = gUnknown_0868D2DC;
    anim->timer = 0;

    SpellFx_RegisterObjPal(gUnknown_0868CC10, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(gUnknown_0868C358, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x08063070
void sub_8063070(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = gUnknown_0868D2F0;
    anim->pScrCurrent = gUnknown_0868D2F0;
    anim->timer = 0;

    SpellFx_RegisterObjPal(gUnknown_0868CC10, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(gUnknown_0868C358, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x080630AC
void sub_80630AC(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = gUnknown_0868D304;
    anim->pScrCurrent = gUnknown_0868D304;
    anim->timer = 0;

    SpellFx_RegisterObjPal(gUnknown_0868CC10, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(gUnknown_0868C358, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x080630E8
void sub_80630E8(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = gUnknown_0868D678;
    anim->pScrCurrent = gUnknown_0868D678;
    anim->timer = 0;

    SpellFx_RegisterObjPal(gUnknown_0868CC10, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(gUnknown_0868C7F0, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x08063124
void sub_8063124(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = gUnknown_0868D684;
    anim->pScrCurrent = gUnknown_0868D684;
    anim->timer = 0;

    SpellFx_RegisterObjPal(gUnknown_0868CC10, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(gUnknown_0868C7F0, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x08063160
void sub_8063160(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = gUnknown_0868D690;
    anim->pScrCurrent = gUnknown_0868D690;
    anim->timer = 0;

    SpellFx_RegisterObjPal(gUnknown_0868CC10, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(gUnknown_0868C7F0, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0806319C
void sub_806319C(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = gUnknown_0868D69C;
    anim->pScrCurrent = gUnknown_0868D69C;
    anim->timer = 0;

    SpellFx_RegisterObjPal(gUnknown_0868CC10, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(gUnknown_0868C7F0, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

//! FE8U = 0x080631D8
void sub_80631D8(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = gUnknown_0868D6A8;
    anim->pScrCurrent = gUnknown_0868D6A8;
    anim->timer = 0;

    SpellFx_RegisterObjPal(gUnknown_0868CC10, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(gUnknown_0868C7F0, 32 * 4 * CHR_SIZE);

    Proc_Break(proc);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxMshield[] =
{
    PROC_NAME("efxMshield"),
    PROC_REPEAT(sub_8063250),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08063214
void sub_8063214(struct Anim * anim)
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
void sub_8063250(struct ProcEfx * proc)
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
        sub_806331C(proc->anim);
        sub_80633D0(anim);
        sub_8063428(anim);
        PlaySFX(0x102, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 40)
    {
        sub_8063428(anim);
    }
    else if (proc->timer == duration + 80)
    {
        sub_8063428(anim);
    }
    else if (proc->timer == duration + 176)
    {
        NewEfxFlashUnit(anim, 1, 5, 0);
    }
    else if (proc->timer == duration + 225)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
        sub_8055518(anim, proc->hitted);
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
    PROC_REPEAT(sub_8063378),
    PROC_END,
};

u16 * CONST_DATA gUnknown_085D6EA0[] =
{
    Tsa_0868DF9C,
    Tsa_0868E054,
    Tsa_0868E118,
    Tsa_0868E208,
    Tsa_0868E338,
};

// clang-format on

//! FE8U = 0x0806331C
void sub_806331C(struct Anim * anim)
{
    // clang-format off
    static const u16 gUnknown_080DDF3A[] =
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
    proc->frame_config = gUnknown_080DDF3A;

    proc->tsal = gUnknown_085D6EA0;
    proc->tsar = gUnknown_085D6EA0;

    SpellFx_RegisterBgPal(gUnknown_0868DF5C, PLTT_SIZE_4BPP);
    SpellFx_RegisterBgGfx(gUnknown_0868D6D0, 32 * 8 * CHR_SIZE);

    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08063378
void sub_8063378(struct ProcEfxBG * proc)
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
    PROC_SET_END_CB(sub_8063468),
    PROC_SLEEP(220),
    PROC_END,
};

// clang-format on

//! FE8U = 0x080633D0
void sub_80633D0(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMshieldBGOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->anim2 = EfxCreateFrontAnim(anim, gUnknown_08692524, gUnknown_08692524, gUnknown_08692524, gUnknown_08692524);

    SpellFx_RegisterObjPal(gUnknown_0868E46C, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(gUnknown_08686F84, 32 * 2 * CHR_SIZE);

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxMshieldBGOBJ2[] =
{
    PROC_NAME("efxMshieldOBJ2"),
    PROC_SET_END_CB(sub_8063468),
    PROC_SLEEP(110),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08063428
void sub_8063428(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMshieldBGOBJ2, PROC_TREE_3);
    proc->anim = anim;
    proc->anim2 = EfxCreateFrontAnim(anim, gUnknown_08692674, gUnknown_08692674, gUnknown_08692674, gUnknown_08692674);

    return;
}

//! FE8U = 0x08063468
void sub_8063468(struct ProcEfxOBJ * proc)
{
    AnimDelete(proc->anim2);
    gEfxBgSemaphore--;
    return;
}
