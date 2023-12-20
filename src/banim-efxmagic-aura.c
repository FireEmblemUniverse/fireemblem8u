#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D7490[] =
{
    PROC_NAME("efxOura"),
    PROC_REPEAT(sub_8064EB0),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08064E74
void StartSpellAnimAura(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(gUnknown_085D7490, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x08064EB0
void sub_8064EB0(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        sub_8065008(anim);
        PlaySFX(0x2C1, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 14)
    {
        sub_806509C(anim);
    }
    else if (proc->timer == 44)
    {
        PlaySFX(0x2C2, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 83)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
        NewEfxFlashBgWhite(anim, 10);
    }
    else if (proc->timer == duration + 93)
    {
        sub_8065130(anim);
    }
    else if (proc->timer == duration + 103)
    {
        PlaySFX(0x2C3, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 125)
    {
        NewEfxALPHA(anim, 0, 10, 16, 0, 0);
    }
    else if (proc->timer == duration + 137)
    {
        sub_806521C(anim);
        sub_806533C(anim);
    }
    else if (proc->timer == duration + 144)
    {
        NewEfxFlashBgWhite(anim, 10);
        anim->state3 |= 9;
        StartBattleAnimHitEffectsDefault(anim, proc->hitted);
        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 154)
    {
        NewEfxRestWINH_(proc->anim, 95, 1);
        NewEfxTwobaiRST(proc->anim, 66);
        sub_80653CC(anim);
        NewEfxALPHA(anim, 44, 12, 16, 0, 0);
    }
    else if (proc->timer == duration + 245)
    {

        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D74A8[] =
{
    PROC_NAME("efxOuraBG"),
    PROC_REPEAT(sub_80651C4),
    PROC_END,
};

u16 * CONST_DATA gUnknown_085D74C0[] =
{
    Tsa_0873315C,
    Tsa_087331FC,
    Tsa_087332A4,
    Tsa_0873334C,
    Tsa_087333F8,
    Tsa_087334B0,
    Tsa_08733568,
    Tsa_08733618,
    Tsa_087336C4,
    Tsa_0873376C,
    Tsa_0873380C,
    Tsa_087338A8,
    Tsa_08733940,
    Tsa_08733A58,
    Tsa_08733B94,
    Tsa_08733CE4,
    Tsa_08733E20,
    Tsa_08733F24,
    Tsa_08733FC8,
    Tsa_08734064,
    Tsa_08734100,
    Tsa_0873419C,
    Tsa_08734238,
    Tsa_087342D4,
    Tsa_08734390,
    Tsa_08734480,
    Tsa_08734584,
    Tsa_08734688,
};

// clang-format on

//! FE8U = 0x08065008
void sub_8065008(struct Anim * anim)
{
    // clang-format off
    static const u16 gUnknown_080DE346[] =
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
         9, 1,
        10, 1,
        -1
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D74A8, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DE346;

    proc->tsal = gUnknown_085D74C0;
    proc->tsar = gUnknown_085D74C0;

    SpellFx_RegisterBgGfx(gUnknown_087327C4, 32 * 8 * CHR_SIZE);
    SpellFx_RegisterBgPal(gUnknown_0873313C, PLTT_SIZE_4BPP);

    BG_SetPosition(BG_1, 0, 0);

    if (gEkrDistanceType == 0)
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

//! FE8U = 0x0806509C
void sub_806509C(struct Anim * anim)
{
    // clang-format off
    static const u16 gUnknown_080DE374[] =
    {
        11, 30,
        12,  3,
        13,  3,
        14,  3,
        15,  3,
        16, 20,
        17,  3,
        18,  1,
        19,  1,
        20,  1,
        21,  1,
        22,  1,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D74A8, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DE374;

    proc->tsal = gUnknown_085D74C0;
    proc->tsar = gUnknown_085D74C0;

    SpellFx_RegisterBgGfx(gUnknown_087327C4, 32 * 8 * CHR_SIZE);
    SpellFx_RegisterBgPal(gUnknown_0873313C, PLTT_SIZE_4BPP);

    BG_SetPosition(BG_1, 0, 0);

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

    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08065130
void sub_8065130(struct Anim * anim)
{
    // clang-format off
    static const u16 gUnknown_080DE3A6[] =
    {
        11, 10,
        23,  3,
        24,  3,
        25,  3,
        26,  3,
        27, 20,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D74A8, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DE3A6;

    proc->tsal = gUnknown_085D74C0;
    proc->tsar = gUnknown_085D74C0;

    SpellFx_RegisterBgGfx(gUnknown_087327C4, 32 * 8 * CHR_SIZE);
    SpellFx_RegisterBgPal(gUnknown_0873313C, PLTT_SIZE_4BPP);

    BG_SetPosition(BG_1, 0, 0);

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

//! FE8U = 0x080651C4
void sub_80651C4(struct ProcEfxBG * proc)
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

struct ProcCmd CONST_DATA gUnknown_085D7530[] =
{
    PROC_NAME("efxOuraBG2"),

    PROC_SET_END_CB(sub_8065300),
    PROC_REPEAT(sub_806531C),

    PROC_END,
};

// clang-format on

//! FE8U = 0x0806521C
void sub_806521C(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D7530, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 5;

    SpellFx_RegisterBgGfx(Img_ShineBg1, 32 * 8 * CHR_SIZE);
    SpellFx_ClearBG1();

    if (gEkrDistanceType == 0)
    {
        LZ77UnCompWram(Tsa_ShineBg1_Left, gEkrTsaBuffer);
    }
    else
    {
        LZ77UnCompWram(Tsa_ShineBg1_Right, gEkrTsaBuffer);
    }

    if (GetAnimPosition(proc->anim) == 0)
    {
        EfxTmCpyBgHFlip(gEkrTsaBuffer, gBG1TilemapBuffer, 30, 20, 1, 0x100);
    }
    else
    {
        EfxTmCpyBG(gEkrTsaBuffer, gBG1TilemapBuffer, 30, 20, 1, 0x100);
    }

    BG_EnableSyncByMask(BG1_SYNC_BIT);
    SpellFx_SetSomeColorEffect();

    BG_SetPosition(BG_1, 0, 0);
    SetWinEnable(0, 0, 0);

    return;
}

//! FE8U = 0x08065300
void sub_8065300(void)
{
    SpellFx_ClearBG1();
    gEfxBgSemaphore--;
    SetDefaultColorEffects_();
    return;
}

//! FE8U = 0x0806531C
void sub_806531C(struct ProcEfxBG * proc)
{
    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D7550[] =
{
    PROC_NAME("efxOuraBGCOL"),
    PROC_MARK(PROC_MARK_A),
    PROC_REPEAT(sub_8065384),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0806533C
void sub_806533C(struct Anim * anim)
{
    // clang-format off
    static const u16 gUnknown_080DE3DA[] =
    {
        3, 2,
        2, 1,
        1, 1,
        0, 1,
        -1,
    };
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D7550, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DE3DA;

    proc->pal = Pal_ShineBg_08726FF4;
    SpellFx_RegisterBgPal(Pal_ShineBg_08726FF4 + 0x30, PLTT_SIZE_4BPP);

    return;
}

//! FE8U = 0x08065384
void sub_8065384(struct ProcEfxBGCOL * proc)
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

struct ProcCmd CONST_DATA gUnknown_085D7570[] =
{
    PROC_NAME("efxOuraBG3"),
    PROC_REPEAT(sub_806542C),
    PROC_END,
};

u16 * CONST_DATA gUnknown_085D7588[] =
{
    Tsa_0874396C,
    Tsa_08743BE4,
    Tsa_08743E5C,
    Tsa_087440D4,
    Tsa_0874434C,
    Tsa_087445BC,
    Tsa_08744818,
    Tsa_08744A90,
    Tsa_08744D08,
    Tsa_08744F80,
    Tsa_087451F8,
    Tsa_08745470,
};

u16 * CONST_DATA gUnknown_085D75B8[] =
{
    Img_0873478C,
    Img_08735BA0,
    Img_087370CC,
    Img_08738648,
    Img_08739BD0,
    Img_0873AFC0,
    Img_0873C2CC,
    Img_0873D640,
    Img_0873EB2C,
    Img_0873FED8,
    Img_08741288,
    Img_087425A4,
};

// clang-format on

//! FE8U = 0x080653CC
void sub_80653CC(struct Anim * anim)
{
    // clang-format off
    static const u16 gUnknown_080DE3F8[] =
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
         8, 2,
         9, 2,
        10, 2,
        11, 2,
         8, 2,
         9, 2,
        10, 2,
        11, 2,
         8, 2,
         9, 2,
        10, 2,
        11, 2,
         8, 2,
         9, 2,
        10, 2,
        11, 2,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D7570, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DE3F8;

    proc->tsal = gUnknown_085D7588;
    proc->tsar = gUnknown_085D7588;
    proc->img = gUnknown_085D75B8;

    SpellFx_RegisterBgPal(gUnknown_0874394C, PLTT_SIZE_4BPP);

    BG_SetPosition(BG_1, 0, 0);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x0806542C
void sub_806542C(struct ProcEfxBG * proc)
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

//! FE8U = 0x08065490
void sub_8065490(struct Anim * anim)
{
    return;
}
