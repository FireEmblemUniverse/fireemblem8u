#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxNaglfar[] =
{
    PROC_NAME("efxNaglfar"),
    PROC_REPEAT(efxNaglfar_Loop_Main),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08067B7C
void StartSpellAnimNaglfar(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxNaglfar, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x08067BB8
void efxNaglfar_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else if (proc->timer == duration + 26)
    {
        NewEfxRestWINH_(anim, 62, 1);
        NewEfxTwobaiRST(anim, 62);

        StartSubSpell_efxNaglfarBG(anim);
        NewEfxALPHA(anim, 0, 30, 0, 16, 0);

        StartSubSpell_efxNaglfarOBJ2(anim, 5, 0);
        PlaySFX(0x3AF, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 50)
    {
        NewEfxFlashBgWhite(anim, 2);
    }
    else if (proc->timer == duration + 55)
    {
        StartSubSpell_efxNaglfarOBJ2(anim, 4, 1);
    }
    else if (proc->timer == duration + 56)
    {
        NewEfxALPHA(anim, 0, 30, 16, 0, 0);
    }
    else if (proc->timer == duration + 66)
    {
        NewEfxFlashBgWhite(anim, 2);
    }
    else if (proc->timer == duration + 70)
    {
        StartSubSpell_efxNaglfarBlack(anim, 0, 30);
        StartSubSpell_efxNaglfarOBJ2(anim, 4, 1);
    }
    else if (proc->timer == duration + 110)
    {
        NewEfxRestWINH_(anim, 104, 1);
        NewEfxTwobaiRST(anim, 104);
        StartSubSpell_efxNaglfarBG2(anim);
    }
    else if (proc->timer == duration + 166)
    {
        NewEfxWhiteOUT(anim, 0, 30);
    }
    else if (proc->timer == duration + 196)
    {
        SetDispEnable(1, 1, 1, 1, 1);
        NewEfxWhiteIN(anim, 30, 0);
    }
    else if (proc->timer == duration + 226)
    {
        StartSpellThing_MagicQuake(anim, 76, 10);
        StartSubSpell_efxNaglfarBG3(anim);
        NewEfxWhiteIN(anim, 0, 20);
        StartSubSpell_efxNaglfarOBJRockGyre(anim, 76);
    }
    else if (proc->timer == duration + 302)
    {
        anim->state3 |= 9;
        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            NewEfxRestWINH_(anim, 66, 1);
            NewEfxTwobaiRST(anim, 66);
            StartSubSpell_efxNaglfarBG4(anim);
            NewEfxALPHA(anim, 14, 32, 16, 0, 0);
            PlaySFX(0x3b0, 0x100, anim->xPosition, 1);
        }
        else
        {
            proc->timer = duration + 314;
        }
    }
    else if (proc->timer == duration + 314)
    {
        StartSubSpell_efxNaglfarOBJ2(anim, 5, 0);
    }
    else if (proc->timer == duration + 384)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxNaglfarBG[] =
{
    PROC_NAME("efxNaglfarBG"),
    PROC_REPEAT(efxNaglfarBG_Loop),
    PROC_END,
};

u16 * CONST_DATA ImgArray_NaglfarBg1[] =
{
    Img_NaglfarBg1_A,
};

u16 * CONST_DATA TsaArray_NaglfarBg1[] =
{
    Tsa_NaglfarBg1_A,
};

// clang-format on

//! FE8U = 0x08067DC4
void StartSubSpell_efxNaglfarBG(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        0, 60,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxNaglfarBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->unk32 = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_NaglfarBg1;
    proc->tsar = TsaArray_NaglfarBg1;
    proc->img = ImgArray_NaglfarBg1;

    SpellFx_RegisterBgPal(Pal_NaglfarBg1_A, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08067E1C
void efxNaglfarBG_Loop(struct ProcEfxBG * proc)
{
    s16 ret;

    proc->unk32 = (proc->unk32 + 4) % 0xf0;
    BG_SetPosition(BG_1, proc->unk32, 0);

    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** img = proc->img;
        SpellFx_WriteBgMapExt(proc->anim, *(tsaL + ret), 0x20, 20);
        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();
            gEfxBgSemaphore--;
            SetDefaultColorEffects_();
            Proc_End(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxNaglfarBG2[] =
{
    PROC_NAME("efxNaglfarBG2"),
    PROC_REPEAT(efxNaglfarBG2_Loop),
    PROC_END,
};

u16 * CONST_DATA ImgArray_NaglfarBg2[] =
{
    Img_NaglfarBg,
    Img_NaglfarBg2_0,
    Img_NaglfarBg2_1,
    Img_NaglfarBg2_2,
    Img_NaglfarBg2_3,
    Img_NaglfarBg2_4,
    Img_NaglfarBg2_5,
    Img_NaglfarBg2_6,
    Img_NaglfarBg2_7,
    Img_NaglfarBg2_8,
    Img_NaglfarBg2_9,
    Img_NaglfarBg2_10,
    Img_NaglfarBg2_11,
    Img_NaglfarBg2_12,
    Img_NaglfarBg2_13,
    Img_NaglfarBg2_14,
};

u16 * CONST_DATA TsaArray_NaglfarBg2[] =
{
    Tsa_NaglfarBg2_0,
    Tsa_NaglfarBg2_1,
    Tsa_NaglfarBg2_2,
    Tsa_NaglfarBg2_3,
    Tsa_NaglfarBg2_4,
    Tsa_NaglfarBg2_5,
    Tsa_NaglfarBg2_6,
    Tsa_NaglfarBg2_7,
    Tsa_NaglfarBg2_8,
    Tsa_NaglfarBg2_9,
    Tsa_NaglfarBg2_10,
    Tsa_NaglfarBg2_11,
    Tsa_NaglfarBg2_12,
    Tsa_NaglfarBg2_13,
    Tsa_NaglfarBg2_14,
    Tsa_NaglfarBg2_15,
};

u16 * CONST_DATA PalArray_NaglfarBg2[] =
{
    Pal_NaglfarBg2_0,
    Pal_NaglfarBg2_1,
    Pal_NaglfarBg2_2,
    Pal_NaglfarBg2_3,
    Pal_NaglfarBg2_4,
    Pal_NaglfarBg2_5,
    Pal_NaglfarBg2_6,
    Pal_NaglfarBg2_7,
    Pal_NaglfarBg2_8,
    Pal_NaglfarBg2_9,
    Pal_NaglfarBg2_10,
    Pal_NaglfarBg2_11,
    Pal_NaglfarBg2_12,
    Pal_NaglfarBg2_13,
    Pal_NaglfarBg2_14,
    Pal_NaglfarBg2_15,
};

// clang-format on

//! FE8U = 0x08067E98
void StartSubSpell_efxNaglfarBG2(struct Anim * anim)
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
        15, 26,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxNaglfarBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_NaglfarBg2;
    proc->tsar = TsaArray_NaglfarBg2;
    proc->img = ImgArray_NaglfarBg2;
    proc->pal = PalArray_NaglfarBg2;

    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08067EE8
void efxNaglfarBG2_Loop(struct ProcEfxBG * proc)
{
    s16 ret;

    BG_SetPosition(BG_1, 0, 0);

    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;
        u16 ** pal = proc->pal;

        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
        SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
        SpellFx_RegisterBgPal(*(pal + ret), PLTT_SIZE_4BPP);
    }
    else
    {
        if (ret == -1)
        {
            SpellFx_ClearBG1();
            gEfxBgSemaphore--;
            SetDefaultColorEffects_();
            Proc_End(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxNaglfarBG3[] =
{
    PROC_NAME("efxNaglfarBG3"),
    PROC_REPEAT(efxNaglfarBG3_Loop),
    PROC_END,
};

u16 * CONST_DATA ImgArray_NaglfarBg3[] =
{
    Img_NaglfarBg3_0,
    Img_NaglfarBg3_1,
    Img_NaglfarBg3_2,
    Img_NaglfarBg3_3,
};

u16 * CONST_DATA TsaArray_NaglfarBg3[] =
{
    Tsa_NaglfarBg3_0,
    Tsa_NaglfarBg3_1,
    Tsa_NaglfarBg3_2,
    Tsa_NaglfarBg3_3,
};

// clang-format on

//! FE8U = 0x08067F64
void StartSubSpell_efxNaglfarBG3(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        0, 3,
        1, 3,
        2, 3,
        3, 3,
        0, 3,
        1, 3,
        2, 3,
        3, 3,
        0, 3,
        1, 3,
        2, 3,
        3, 3,
        0, 3,
        1, 3,
        2, 3,
        3, 3,
        0, 3,
        1, 3,
        2, 3,
        3, 3,
        0, 3,
        1, 3,
        2, 3,
        3, 3,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxNaglfarBG3, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_NaglfarBg3;
    proc->tsar = TsaArray_NaglfarBg3;
    proc->img = ImgArray_NaglfarBg3;

    SpellFx_RegisterBgPal(Pal_NaglfarBg3, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08067FB8
void efxNaglfarBG3_Loop(struct ProcEfxBG * proc)
{
    s16 ret;

    BG_SetPosition(BG_1, 0, 0);

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
            Proc_End(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxNaglfarBG4[] =
{
    PROC_NAME("efxNaglfarBG4"),
    PROC_REPEAT(efxNaglfarBG4_Loop),
    PROC_END,
};

u16 * CONST_DATA ImgArray_NaglfarBg4[] =
{
    Img_NaglfarBg4_0,
    Img_NaglfarBg4_1,
    Img_NaglfarBg4_2,
    Img_NaglfarBg4_3,
    Img_NaglfarBg4_4,
};

u16 * CONST_DATA TsaArray_NaglfarBg4[] =
{
    Tsa_NaglfarBg4_0,
    Tsa_NaglfarBg4_1,
    Tsa_NaglfarBg4_2,
    Tsa_NaglfarBg4_3,
    Tsa_NaglfarBg4_4,
};

// clang-format on

//! FE8U = 0x08068028
void StartSubSpell_efxNaglfarBG4(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        0, 2,
        1, 2,
        2, 2,
        3, 2,
        4, 2,
        3, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        3, 2,
        4, 2,
        3, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxNaglfarBG4, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_NaglfarBg4;
    proc->tsar = TsaArray_NaglfarBg4;
    proc->img = ImgArray_NaglfarBg4;

    SpellFx_RegisterBgPal(Pal_NaglfarBg4, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x0806807C
void efxNaglfarBG4_Loop(struct ProcEfxBG * proc)
{
    s16 ret;

    BG_SetPosition(BG_1, 0, 0);

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
            Proc_End(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxNaglfarOBJ[] =
{
    PROC_NAME("efxNaglfarOBJ"),
    PROC_REPEAT(efxNaglfarOBJ_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x080680EC
void StartSubSpell_efxNaglfarOBJ(struct Anim * anim, int terminator, s16 x, s16 y, u8 pos, u8 index)
{
    struct ProcEfxOBJ * proc;
    u32 * scr;
    struct Anim * frontAnim;

    // clang-format off
    u32 * scrs[] =
    {
        AnimScr_efxNaglfarOBJ_0, AnimScr_efxNaglfarOBJ_6,
        AnimScr_efxNaglfarOBJ_1, AnimScr_efxNaglfarOBJ_7,
        AnimScr_efxNaglfarOBJ_2, AnimScr_efxNaglfarOBJ_8,
        AnimScr_efxNaglfarOBJ_3, AnimScr_efxNaglfarOBJ_9,
        AnimScr_efxNaglfarOBJ_4, AnimScr_efxNaglfarOBJ_10,
        AnimScr_efxNaglfarOBJ_5, AnimScr_efxNaglfarOBJ_11,
    };

    s16 sNaglfarObjSide0PositionOffsets[] =
    {
        64, 128,
        32, 72,
        72, 24,
        112, 16,
        144, 32,
    };

    s16 sNaglfarObjSide1PositionOffsets[] =
    {
        176, 16,
        216, 64,
        208, 104,
        136, 120,
        96, 112,
    };
    // clang-format on

    GetAnimPosition(anim);

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxNaglfarOBJ, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    scr = scrs[index * 2];

    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    switch (pos)
    {
        case 0:
            frontAnim->xPosition = x + sNaglfarObjSide0PositionOffsets[index * 2];
            frontAnim->yPosition = y + (sNaglfarObjSide0PositionOffsets + 1)[index * 2];
            break;

        case 1:
            frontAnim->xPosition = x + sNaglfarObjSide1PositionOffsets[index * 2];
            frontAnim->yPosition = y + (sNaglfarObjSide1PositionOffsets + 1)[index * 2];
            break;
    }

    SpellFx_RegisterObjPal(Pal_NaglfarSprites_A, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_NaglfarSprites_A, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x08068208
void efxNaglfarOBJ_Loop(struct ProcEfxOBJ * proc)
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

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxNaglfarOBJ2[] =
{
    PROC_NAME("efxNaglfarOBJ2"),
    PROC_REPEAT(efxNaglfarOBJ2_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0806823C
void StartSubSpell_efxNaglfarOBJ2(struct Anim * anim, int terminator, u8 c)
{
    u8 pos;
    struct ProcEfxOBJ * proc;
    u32 * scr;
    struct Anim * frontAnim;

    // clang-format off
    u32 * sNaglfarObj2AnimScrLut[4] =
    {
        AnimScr_efxNaglfarOBJ2_0, AnimScr_efxNaglfarOBJ2_2,
        AnimScr_efxNaglfarOBJ2_1, AnimScr_efxNaglfarOBJ2_3,
    };
    // clang-format on

    pos = GetAnimPosition(anim);
    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxNaglfarOBJ2, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    scr = sNaglfarObj2AnimScrLut[((pos * 4) + (c * 8)) >> 2];
    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;
    frontAnim->yPosition += 24;

    SpellFx_RegisterObjPal(Pal_NaglfarSprites_B, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_NaglfarSprites_B, 32 * 4 * CHR_SIZE);

    return;
}

//! FE8U = 0x080682E0
void efxNaglfarOBJ2_Loop(struct ProcEfxOBJ * proc)
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

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxNaglfarOBJRockGyre[] =
{
    PROC_NAME("efxNaglfarOBJRockGyre"),
    PROC_REPEAT(efxNaglfarOBJRockGyre_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08068314
void StartSubSpell_efxNaglfarOBJRockGyre(struct Anim * anim, int terminator)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxNaglfarOBJRockGyre, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    return;
}

//! FE8U = 0x08068348
void efxNaglfarOBJRockGyre_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == 2)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 0, 0, 0, 0);
    }
    else if (proc->timer == 5)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 0, 0, 0, 1);
    }
    else if (proc->timer == 7)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 0, 0, 0, 2);
    }
    else if (proc->timer == 9)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 0, 0, 0, 3);
    }
    else if (proc->timer == 11)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 0, 0, 0, 4);
    }
    else if (proc->timer == 13)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 0, 0, 1, 0);
    }
    else if (proc->timer == 15)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 0, 0, 1, 1);
    }
    else if (proc->timer == 17)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 0, 0, 1, 2);
    }
    else if (proc->timer == 19)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 0, 0, 1, 3);
    }
    else if (proc->timer == 21)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 0, 0, 1, 4);
    }
    else if (proc->timer == 23)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 8, 8, 0, 0);
    }
    else if (proc->timer == 25)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 8, 8, 0, 1);
    }
    else if (proc->timer == 27)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 8, 8, 0, 2);
    }
    else if (proc->timer == 29)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 8, 8, 0, 3);
    }
    else if (proc->timer == 31)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 8, 8, 0, 4);
    }
    else if (proc->timer == 33)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, -16, -8, 1, 0);
    }
    else if (proc->timer == 35)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, -16, -8, 1, 1);
    }
    else if (proc->timer == 37)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, -16, -8, 1, 2);
    }
    else if (proc->timer == 39)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, -16, -8, 1, 3);
    }
    else if (proc->timer == 41)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, -16, -8, 1, 4);
    }
    else if (proc->timer == 43)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 18, 18, 0, 0);
    }
    else if (proc->timer == 45)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 18, 18, 0, 1);
    }
    else if (proc->timer == 47)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 18, 18, 0, 2);
    }
    else if (proc->timer == 49)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 18, 18, 0, 3);
    }
    else if (proc->timer == 51)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 18, 18, 0, 4);
    }
    else if (proc->timer == 53)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, -24, 0, 1, 0);
    }
    else if (proc->timer == 55)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, -24, 0, 1, 1);
    }
    else if (proc->timer == 57)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, -24, 0, 1, 2);
    }
    else if (proc->timer == 59)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, -24, 0, 1, 3);
    }
    else if (proc->timer == 61)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, -24, 0, 1, 4);
    }
    else if (proc->timer == 63)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 12, 12, 0, 0);
    }
    else if (proc->timer == 65)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 12, 12, 0, 1);
    }
    else if (proc->timer == 67)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 12, 12, 0, 2);
    }
    else if (proc->timer == 69)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 12, 12, 0, 3);
    }
    else if (proc->timer == 71)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 12, 12, 0, 4);
    }
    else if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
        return;
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxNaglfarBlack[] =
{
    PROC_NAME("efxNaglfarBlack"),

    PROC_REPEAT(efxNaglfarBlack_Loop_A),
    PROC_REPEAT(efxNaglfarBlack_Loop_B),
    PROC_REPEAT(efxNaglfarBlack_Loop_C),
    PROC_REPEAT(efxNaglfarBlack_Loop_D),

    PROC_END,
};

// clang-format on

//! FE8U = 0x08068614
void StartSubSpell_efxNaglfarBlack(struct Anim * anim, int b, int c)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxNaglfarBlack, PROC_TREE_VSYNC);

    proc->anim = anim;
    proc->timer = 0;
    proc->step = b;
    proc->unk30 = c;

    return;
}

//! FE8U = 0x08068638
void efxNaglfarBlack_Loop_A(struct ProcEfx * proc)
{
    CpuFastCopy(gPaletteBuffer, gEfxPal, 0x400);

    EfxPalBlackInOut(gEfxPal, 0, 0x20, 0);

    CpuFastCopy(gEfxPal, (void *)PLTT, 0x400);

    DisablePaletteSync();

    proc->timer = 0;

    Proc_Break(proc);

    return;
}

//! FE8U = 0x08068680
void efxNaglfarBlack_Loop_B(struct ProcEfx * proc)
{
    int ret = Interpolate(0, 0, 16, proc->timer, proc->unk30);

    CpuFastCopy(gPaletteBuffer, gEfxPal, 0x400);

    EfxPalBlackInOut(gEfxPal, 4, 2, ret);
    EfxPalBlackInOut(gEfxPal, 6, 10, ret);
    EfxPalBlackInOut(gEfxPal, 23, 1, ret);
    EfxPalBlackInOut(gEfxPal, 25, 1, ret);

    CpuFastCopy(gEfxPal, (void *)PLTT, 0x400);

    DisablePaletteSync();

    proc->timer++;

    if (proc->timer > proc->unk30)
    {
        proc->timer = 0;
        SetDispEnable(1, 1, 0, 0, 1);
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08068738
void efxNaglfarBlack_Loop_C(struct ProcEfx * proc)
{
    int ret = Interpolate(0, 16, 0, proc->timer, proc->unk30);

    CpuFastCopy(gPaletteBuffer, gEfxPal, 0x400);

    EfxPalBlackInOut(gEfxPal, 4, 2, 0x10);
    EfxPalBlackInOut(gEfxPal, 6, 10, 0x10);
    EfxPalBlackInOut(gEfxPal, 23, 1, ret);
    EfxPalBlackInOut(gEfxPal, 25, 1, ret);

    CpuFastCopy(gEfxPal, (void *)PLTT, 0x400);

    DisablePaletteSync();

    proc->timer++;

    if (proc->timer > proc->unk30)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x080687D0
void efxNaglfarBlack_Loop_D(struct ProcEfx * proc)
{
    EnablePaletteSync();
    Proc_Break(proc);
    return;
}
