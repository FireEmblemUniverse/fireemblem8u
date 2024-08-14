#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxIvaldi[] =
{
    PROC_NAME("efxIvaldi"),
    PROC_REPEAT(efxIvaldi_Loop_Main),
    PROC_END,
};

// clang-format on

//! FE8U = 0x080657D4
void StartSpellAnimIvaldi(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxIvaldi, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

/* https://decomp.me/scratch/4bKK3 */
//! FE8U = 0x08065810
void efxIvaldi_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    int duration = EfxGetCamMovDuration();
    int r7 = 0x3e;
    int chaos = 0xc4;

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }

    if (proc->timer == duration + 1)
    {
        PrepareSomeIvaldiParticleGraphics();
    }
    else if (proc->timer == duration + 0xb)
    {
        StartSpellOBJ_IvaldiSideWash(anim, 0x1a);
    }
    else if (proc->timer == duration + 0x14)
    {
        PlaySFX(0x000003D3, 0x100, proc->anim->xPosition, 1);
        StartSpellBG_IvaldiBG1(anim);
    }
    else if (proc->timer == duration + 0x49)
    {
        PlaySFX(0x3d4, 0x100, proc->anim->xPosition, 1);
        StartSpellBG_IvaldiBG2(anim);
    }
    else if (proc->timer == duration + 0x76)
    {
        StartSpellBG_IvaldiBG3(anim);
    }
    else if (proc->timer == duration + 0x7c)
    {
        StartSpellOBJ_IvaldiFall(anim, 0x46);
    }
    else if (proc->timer == duration + 0xc6)
    {
        SetBlendTargetA(1, 1, 0, 0, 0);
        SetBlendTargetB(0, 0, 1, 1, 1);
        StartSubSpell_efxIvaldiWOUT(anim, 0x3c, 0x1e);
    }
    else if (proc->timer == r7 + chaos + duration)
    {
        StartSpellThing_MagicQuake(anim, 0x78, 10);
        SetBlendConfig(1, 0, 0x10, 0);
        StartSpellBG_IvaldiBG4(anim);
    }
    else if (proc->timer == duration + 0x107)
    {
        StartSubSpell_efxIvaldiOBJUprise(anim, 0x5c);
        anim->state3 |= 9;

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else
    {
#ifdef NONMATCHING
        int r2 = r7 + chaos;
#else
        register int r0 asm("r0") = chaos, r2;
        asm(""::"r"(r0));
        r2 = r7 + r0;
#endif
        if (proc->timer == r2 + ({ duration + 0x14; }))
        {
            NewEfxFlashBgWhite(anim, 2);
        }
        else if (proc->timer == r2 + ({ duration + 0x52; }))
        {
            NewEfxFlashBgWhite(anim, 2);
        }
        else if (proc->timer == r2 + ({ duration + 0x5e; }))
        {
            NewEfxFlashBgWhite(anim, 2);
        }
        else if (proc->timer == r2 + ({ duration + 0x64; }))
        {
            SpellFx_Finish();
            RegisterEfxSpellCastEnd();
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxIvaldiBG1[] =
{
    PROC_NAME("efxIvaldiBG1"),
    PROC_REPEAT(efxIvaldiBG1_Loop),
    PROC_END,
};

u16 * CONST_DATA TsaArray_IvaldiBg1[] =
{
    Tsa_086945E4,
    Tsa_086946A0,
    Tsa_086947C4,
    Tsa_0869495C,
    Tsa_08694B58,
    Tsa_08694DD0,
    Tsa_08695048,
    Tsa_086952C0,
    Tsa_08695530,
    Tsa_08695744,
    Tsa_086958F0,
    Tsa_08695A34,
};

// clang-format on

//! FE8U = 0x080659AC
void StartSpellBG_IvaldiBG1(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        11, 2,
        10, 2,
         9, 2,
         8, 2,
         7, 2,
         6, 2,
         5, 2,
         4, 2,
         3, 2,
         2, 2,
         1, 2,
         0, 2,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxIvaldiBG1, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_IvaldiBg1;
    proc->tsar = TsaArray_IvaldiBg1;

    SpellFx_RegisterBgGfx(Img_IvaldiBg1, 32 * 8 * CHR_SIZE);
    SpellFx_RegisterBgPal(Pal_IvaldiBg1, PLTT_SIZE_4BPP);

    BG_SetPosition(BG_1, 0, 0);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08065A10
void efxIvaldiBG1_Loop(struct ProcEfxBG * proc)
{
    s16 ret;

    GetAnimAnotherSide(proc->anim);

    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    BG_SetPosition(1, 0, 0);

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

struct ProcCmd CONST_DATA ProcScr_efxIvaldiBG2[] =
{
    PROC_NAME("efxIvaldiBG2"),
    PROC_REPEAT(efxIvaldiBG2_Loop),
    PROC_END,
};

u16 * CONST_DATA TsaArray_IvaldiBg2[] =
{
    Tsa_08696860,
    Tsa_086968F8,
    Tsa_08696A8C,
    Tsa_08696C28,
    Tsa_08696DC4,
};

// clang-format on

//! FE8U = 0x08065A80
void StartSpellBG_IvaldiBG2(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        1,  2,
        0, 20,
        2,  2,
        0, 10,
        3,  2,
        0,  5,
        4,  2,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxIvaldiBG2, PROC_TREE_3);

    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_IvaldiBg2;
    proc->tsar = TsaArray_IvaldiBg2;

    SpellFx_RegisterBgGfx(Img_IvaldiBg2, 32 * 8 * CHR_SIZE);
    SpellFx_RegisterBgPal(Pal_IvaldiBg2, PLTT_SIZE_4BPP);

    BG_SetPosition(BG_1, 0, 0);

    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08065AEC
void efxIvaldiBG2_Loop(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    BG_SetPosition(BG_1, 0, 0);

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

struct ProcCmd CONST_DATA ProcScr_efxIvaldiBG3[] =
{
    PROC_NAME("efxIvaldiBG3"),
    PROC_REPEAT(efxIvaldiBG3_Loop),
    PROC_END,
};

u16 * CONST_DATA TsaArray_IvaldiBg3[] =
{
    Tsa_0869E970,
    Tsa_0869EBB4,
    Tsa_0869EE2C,
    Tsa_0869F090,
    Tsa_0869F304,
    Tsa_0869F5C0,
    Tsa_0869F888,
    Tsa_0869FB4C,
    Tsa_0869FDFC,
    Tsa_086A00B0,
    Tsa_086A0388,
};

u16 * CONST_DATA ImgArray_IvaldiBg3[] =
{
    Img_08696F64,
    Img_08697610,
    Img_08697D18,
    Img_08698584,
    Img_08698F78,
    Img_08699AEC,
    Img_0869A70C,
    Img_0869B470,
    Img_0869C130,
    Img_0869CE1C,
    Img_0869DB90,
};

u16 * CONST_DATA PalArray_IvaldiBg3[] =
{
    Pal_0869E810,
    Pal_0869E830,
    Pal_0869E850,
    Pal_0869E870,
    Pal_0869E890,
    Pal_0869E8B0,
    Pal_0869E8D0,
    Pal_0869E8F0,
    Pal_0869E910,
    Pal_0869E930,
    Pal_0869E950,
};

// clang-format on

//! FE8U = 0x08065B54
void StartSpellBG_IvaldiBG3(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
         0,  5,
         1,  5,
         2,  5,
         3,  5,
         4,  5,
         5,  5,
         6, 55,
         7,  4,
         8,  2,
         9,  2,
        10,  2,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    SpellFx_ClearBG1();
    SetDefaultColorEffects_();

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxIvaldiBG3, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_IvaldiBg3;
    proc->tsar = TsaArray_IvaldiBg3;
    proc->img = ImgArray_IvaldiBg3;

    proc->pal = PalArray_IvaldiBg3;

    BG_SetPosition(BG_1, 0, 0);

    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08065BB8
void efxIvaldiBG3_Loop(struct ProcEfxBG * proc)
{
    s16 ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    BG_SetPosition(BG_1, 0, 0);

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
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxIvaldiBG4[] =
{
    PROC_NAME("efxIvaldiBG4"),
    PROC_REPEAT(efxIvaldiBG4_Loop),
    PROC_END,
};

u16 * CONST_DATA TsaArray_IvaldiBg4[] =
{
    Tsa_086A1D00,
};

// clang-format on

//! FE8U = 0x08065C38
void StartSpellBG_IvaldiBG4(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        0, 120,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxIvaldiBG4, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->unk34 = 0;
    proc->unk3C = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_IvaldiBg4;
    proc->tsar = TsaArray_IvaldiBg4;

    SpellFx_RegisterBgGfx(Img_IvaldiBg4, 32 * 8 * CHR_SIZE);
    SpellFx_RegisterBgPal(Pal_IvaldiBg4, PLTT_SIZE_4BPP);

    BG_SetPosition(BG_1, 0, 0);

    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08065CA0
void efxIvaldiBG4_Loop(struct ProcEfxBG * proc)
{
    s16 ret;

    proc->unk3C = (proc->unk3C + 24) & 0xff;

    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    BG_SetPosition(BG_1, proc->unk34, proc->unk3C);
    BG_EnableSyncByMask(BG1_SYNC_BIT);

    if (ret >= 0)
    {
        u16 * buf;
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;

        if (gEkrDistanceType == 0)
        {
            LZ77UnCompWram(*(tsaL + ret), gEkrTsaBuffer);
        }
        else
        {
            LZ77UnCompWram(*(tsaR + ret), gEkrTsaBuffer);
        }

        buf = gEkrTsaBuffer;

        if (GetAnimPosition(proc->anim) == 0)
        {
            EfxTmCpyBgHFlip(buf, gBG1TilemapBuffer, 30, 32, 1, 0x100);
        }
        else
        {
            EfxTmCpyBG(buf, gBG1TilemapBuffer, 30, 32, 1, 0x100);
        }

        BG_EnableSyncByMask(BG1_SYNC_BIT);
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

//! FE8U = 0x08065D84
void PrepareSomeIvaldiParticleGraphics(void)
{
    SpellFx_RegisterObjPal(Img_IvaldiSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Pal_IvaldiSprites, 32 * 4 * CHR_SIZE);
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxIvaldiOBJFall[] =
{
    PROC_NAME("efxIvaldiOBJFall"),
    PROC_REPEAT(efxIvaldiOBJFall_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08065DA4
void StartSpellOBJ_IvaldiFall(struct Anim * anim, int terminator)
{
    struct ProcEfxOBJ * proc;

    GetAnimPosition(anim);

    SpellFx_RegisterObjPal(Img_IvaldiSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Pal_IvaldiSprites, 32 * 4 * CHR_SIZE);

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxIvaldiOBJFall, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    return;
}

//! FE8U = 0x08065DF8
void efxIvaldiOBJFall_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == 7)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 64, 152, 84, 3);
    }
    else if (proc->timer == 13)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 64, 48, 84, 3);
    }
    else if (proc->timer == 19)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 64, 188, 106, 3);
    }
    else if (proc->timer == 25)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 64, 104, 103, 2);
    }
    else if (proc->timer == 31)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 64, 36, 102, 2);
    }
    else if (proc->timer == 37)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 64, 176, 97, 3);
    }
    else if (proc->timer == 43)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 64, 56, 100, 3);
    }
    else if (proc->timer == 49)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 64, 158, 103, 2);
    }
    else if (proc->timer == 55)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 64, 66, 92, 3);
    }
    else if (proc->timer == 61)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 64, 230, 92, 3);
    }
    else if (proc->timer == 67)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 64, 104, 108, 3);
    }

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxIvaldiOBJSideWash[] =
{
    PROC_NAME("efxIvaldiOBJSideWash"),
    PROC_REPEAT(efxIvaldiOBJSideWash_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08065F10
void StartSpellOBJ_IvaldiSideWash(struct Anim * anim, int terminator)
{
    struct ProcEfxOBJ * proc;

    GetAnimPosition(anim);

    SpellFx_RegisterObjPal(Img_IvaldiSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Pal_IvaldiSprites, 32 * 4 * CHR_SIZE);

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxIvaldiOBJSideWash, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    return;
}

//! FE8U = 0x08065F64
void efxIvaldiOBJSideWash_Loop(struct ProcEfxOBJ * proc)
{
    GetAnimPosition(proc->anim);

    proc->timer++;

    if (proc->timer == 0)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 26, 104, 12, 0);
    }
    else if (proc->timer == 3)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 26, 104, 95, 1);
    }
    else if (proc->timer == 6)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 26, 120, 36, 1);
    }
    else if (proc->timer == 9)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 26, 100, 10, 1);
    }
    else if (proc->timer == 12)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 26, 94, 54, 0);
    }
    else if (proc->timer == 15)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 26, 100, 48, 1);
    }
    else if (proc->timer == 18)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 26, 104, 102, 0);
    }
    else if (proc->timer == 21)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 26, 96, 16, 1);
    }
    else if (proc->timer == 24)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 26, 128, 80, 1);
    }
    else if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxIvaldiOBJUprise[] =
{
    PROC_NAME("efxIvaldiOBJUprise"),
    PROC_REPEAT(efxIvaldiOBJUprise_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08066060
void StartSubSpell_efxIvaldiOBJUprise(struct Anim * anim, int terminator)
{
    struct ProcEfxOBJ * proc;

    GetAnimPosition(anim);

    SpellFx_RegisterObjPal(Img_IvaldiSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Pal_IvaldiSprites, 32 * 4 * CHR_SIZE);

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxIvaldiOBJUprise, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    return;
}

//! FE8U = 0x080660B4
void efxIvaldiOBJUprise_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == 5)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 200, 112, 1);
    }
    else if (proc->timer == 10)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 67, 91, 1);
    }
    else if (proc->timer == 15)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 13, 89, 1);
    }
    else if (proc->timer == 20)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 203, 76, 1);
    }
    else if (proc->timer == 25)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 223, 2, 1);
    }
    else if (proc->timer == 30)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 14, 111, 1);
    }
    else if (proc->timer == 35)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 224, 108, 1);
    }
    else if (proc->timer == 40)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 368, 112, 1);
    }
    else if (proc->timer == 45)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 58, 45, 0);
    }
    else if (proc->timer == 50)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 127, 66, 0);
    }
    else if (proc->timer == 55)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 163, 20, 0);
    }
    else if (proc->timer == 60)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 167, 62, 0);
    }
    else if (proc->timer == 65)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 56, 96, 0);
    }
    else if (proc->timer == 70)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 128, 66, 0);
    }
    else if (proc->timer == 75)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 56, 112, 0);
    }
    else if (proc->timer == 80)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 168, 112, 0);
    }
    else if (proc->timer == 85)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 164, 112, 0);
    }
    else if (proc->timer == 90)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 65, 120, 0);
    }
    else if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxIvaldiOBJ1[] =
{
    PROC_NAME("efxIvaldiOBJ1"),
    PROC_REPEAT(efxIvaldiOBJ1_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08066258
void StartSubSpell_efxIvaldiOBJ1(struct Anim * anim, int terminator, s16 x, s16 y, u8 kind)
{
    struct ProcEfxOBJ * proc;
    u32 * scr;
    struct Anim * frontAnim;

    // clang-format off
    u32 * gUnknown_080DE5E4[6][2] =
    {
        {
            AnimScr_EfxIvald_L1,
            AnimScr_EfxIvald_R1,
        },
        {
            AnimScr_EfxIvald_L2,
            AnimScr_EfxIvald_R2,
        },
        {
            AnimScr_EfxIvald_L3,
            AnimScr_EfxIvald_R3,
        },
        {
            AnimScr_EfxIvald_L4,
            AnimScr_EfxIvald_R4,
        },
        {
            AnimScr_EfxIvald_L4,
            AnimScr_EfxIvald_R4,
        },
        {
            AnimScr_EfxIvald_L4,
            AnimScr_EfxIvald_R4,
        }
    };
    // clang-format on

    u8 pos = GetAnimPosition(anim);

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxIvaldiOBJ1, PROC_TREE_3);

    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    switch (kind)
    {
        case 1:
            scr = gUnknown_080DE5E4[1][pos];
            break;

        case 2:
            scr = gUnknown_080DE5E4[2][pos];
            break;

        case 3:
            scr = gUnknown_080DE5E4[3][pos];
            break;

        case 4:
            scr = gUnknown_080DE5E4[4][pos];
            break;

        case 5:
            scr = gUnknown_080DE5E4[5][pos];
            break;

        case 0:
        default:
            scr = gUnknown_080DE5E4[0][pos];
            break;
    }

    frontAnim = EfxCreateFrontAnim(proc->anim, scr, scr, scr, scr);

    proc->anim2 = frontAnim;

    frontAnim->xPosition = x;
    frontAnim->yPosition = y;

    frontAnim->oam2Base &= ~0xC00;
    frontAnim->oam2Base |= 0x400;

    return;
}

//! FE8U = 0x0806635C
void efxIvaldiOBJ1_Loop(struct ProcEfxOBJ * proc)
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

struct ProcCmd CONST_DATA ProcScr_efxIvaldiOBJ2[] =
{
    PROC_NAME("efxIvaldiOBJ2"),
    PROC_REPEAT(efxIvaldiOBJ2_Loop),
    PROC_END,
};

// clang-format on

u32 * const gUnknown_080DE624[2] = {
    AnimScr_EfxIvald2_L,
    AnimScr_EfxIvald2_R,
};

//! FE8U = 0x08066390
void StartSubSpell_efxIvaldiOBJ2(struct Anim * anim, int terminator, s16 x, s16 y, u8 kind)
{
    const u32 * a[2], * scr;
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    void * labels[2];

    labels[0] = &&label;
    a[0] = gUnknown_080DE624[0];
    a[1] = gUnknown_080DE624[1];

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxIvaldiOBJ2, PROC_TREE_3);

    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

label:
    switch (kind)
    {
        case 0:
        default:
            scr = a[0];
            break;

        case 1:
            scr = a[1];
            break;
    }

    frontAnim = EfxCreateFrontAnim(proc->anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    frontAnim->xPosition = x;
    frontAnim->yPosition = y;

    frontAnim->oam2Base &= ~0xC00;
    frontAnim->oam2Base |= 0x400;

    return;
}

//! FE8U = 0x08066434
void efxIvaldiOBJ2_Loop(struct ProcEfxOBJ * proc)
{
    proc->anim2->yPosition -= 16;

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

struct ProcCmd CONST_DATA ProcScr_efxIvaldiWOUT[] =
{
    PROC_NAME("efxIvaldiWOUT"),
    PROC_REPEAT(efxIvaldiWOUT_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08066470
void StartSubSpell_efxIvaldiWOUT(struct Anim * anim, int duration, int terminator)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxIvaldiWOUT, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    NewEfxFlashBgWhite(anim, duration);

    return;
}

//! FE8U = 0x080664A8
void efxIvaldiWOUT_Loop(struct ProcEfxOBJ * proc)
{
    int val = Interpolate(INTERPOLATE_LINEAR, 0, 16, proc->timer, proc->terminator);

    CpuFastCopy(gPaletteBuffer, gEfxPal, 0x400);
    EfxPalWhiteInOut(gEfxPal, 0, 0x20, val);

    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}
