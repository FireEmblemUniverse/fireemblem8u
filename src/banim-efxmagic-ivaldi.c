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
    PROC_REPEAT(Loop6C_efxIvaldi),
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

#if NONMATCHING

/* https://decomp.me/scratch/TDcB4 */

//! FE8U = 0x08065810
void Loop6C_efxIvaldi(struct ProcEfx * proc)
{
    int r0;
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    int duration = EfxGetCamMovDuration();
    int r7 = 0x3e;

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
        sub_8066470(anim, 0x3c, 0x1e);
    }
    else if (proc->timer == duration + (r0 = r7 + 0xC4))
    {
        StartSpellThing_MagicQuake(anim, 0x78, 10);
        SetSpecialColorEffectsParameters(1, 0, 0x10, 0);
        StartSpellBG_IvaldiBG4(anim);
    }
    else if (proc->timer == duration + 0x107)
    {
        sub_8066060(anim, 0x5c);
        anim->state3 |= 9;

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            sub_8072450(anim);
        }
    }
    else
    {
        if (proc->timer == duration + (r0 = r7))
        {
            NewEfxFlashBgWhite(anim, 2);
        }
        else if (proc->timer == duration + 0x52 + r0)
        {
            NewEfxFlashBgWhite(anim, 2);
        }
        else if (proc->timer == duration + 0x5e + r0)
        {
            NewEfxFlashBgWhite(anim, 2);
        }
        else if (proc->timer == duration + 0x64 + r0)
        {
            SpellFx_Finish();
            RegisterEfxSpellCastEnd();
            Proc_Break(proc);
        }
    }

    return;
}

#else

NAKEDFUNC
void Loop6C_efxIvaldi(struct ProcEfx * proc)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        sub sp, #4\n\
        adds r6, r0, #0\n\
        ldr r0, [r6, #0x5c]\n\
        bl GetAnimAnotherSide\n\
        adds r5, r0, #0\n\
        bl EfxGetCamMovDuration\n\
        adds r4, r0, #0\n\
        movs r7, #0x3e\n\
        ldrh r0, [r6, #0x2c]\n\
        adds r0, #1\n\
        strh r0, [r6, #0x2c]\n\
        lsls r0, r0, #0x10\n\
        asrs r0, r0, #0x10\n\
        cmp r0, #1\n\
        bne _0806583E\n\
        ldr r0, [r6, #0x5c]\n\
        movs r1, #1\n\
        negs r1, r1\n\
        bl NewEfxFarAttackWithDistance\n\
    _0806583E:\n\
        movs r0, #0x2c\n\
        ldrsh r1, [r6, r0]\n\
        adds r0, r4, #1\n\
        cmp r1, r0\n\
        bne _0806584E\n\
        bl PrepareSomeIvaldiParticleGraphics\n\
        b _080659A4\n\
    _0806584E:\n\
        adds r0, r4, #0\n\
        adds r0, #0xb\n\
        cmp r1, r0\n\
        bne _08065860\n\
        adds r0, r5, #0\n\
        movs r1, #0x1a\n\
        bl StartSpellOBJ_IvaldiSideWash\n\
        b _080659A4\n\
    _08065860:\n\
        adds r3, r4, #0\n\
        adds r3, #0x14\n\
        cmp r1, r3\n\
        bne _08065888\n\
        ldr r0, _08065884  @ 0x000003D3\n\
        movs r1, #0x80\n\
        lsls r1, r1, #1\n\
        ldr r2, [r6, #0x5c]\n\
        movs r3, #2\n\
        ldrsh r2, [r2, r3]\n\
        movs r3, #1\n\
        bl PlaySFX\n\
        adds r0, r5, #0\n\
        bl StartSpellBG_IvaldiBG1\n\
        b _080659A4\n\
        .align 2, 0\n\
    _08065884: .4byte 0x000003D3\n\
    _08065888:\n\
        adds r0, r4, #0\n\
        adds r0, #0x49\n\
        cmp r1, r0\n\
        bne _080658AC\n\
        movs r0, #0xf5\n\
        lsls r0, r0, #2\n\
        movs r1, #0x80\n\
        lsls r1, r1, #1\n\
        ldr r2, [r6, #0x5c]\n\
        movs r3, #2\n\
        ldrsh r2, [r2, r3]\n\
        movs r3, #1\n\
        bl PlaySFX\n\
        adds r0, r5, #0\n\
        bl StartSpellBG_IvaldiBG2\n\
        b _080659A4\n\
    _080658AC:\n\
        adds r0, r4, #0\n\
        adds r0, #0x76\n\
        cmp r1, r0\n\
        bne _080658BC\n\
        adds r0, r5, #0\n\
        bl StartSpellBG_IvaldiBG3\n\
        b _080659A4\n\
    _080658BC:\n\
        adds r0, r4, #0\n\
        adds r0, #0x7c\n\
        cmp r1, r0\n\
        bne _080658CE\n\
        adds r0, r5, #0\n\
        movs r1, #0x46\n\
        bl StartSpellOBJ_IvaldiFall\n\
        b _080659A4\n\
    _080658CE:\n\
        adds r0, r4, #0\n\
        adds r0, #0xc6\n\
        cmp r1, r0\n\
        bne _08065902\n\
        movs r0, #0\n\
        str r0, [sp]\n\
        movs r0, #1\n\
        movs r1, #1\n\
        movs r2, #0\n\
        movs r3, #0\n\
        bl SetBlendTargetA\n\
        movs r0, #1\n\
        str r0, [sp]\n\
        movs r0, #0\n\
        movs r1, #0\n\
        movs r2, #1\n\
        movs r3, #1\n\
        bl SetBlendTargetB\n\
        adds r0, r5, #0\n\
        movs r1, #0x3c\n\
        movs r2, #0x1e\n\
        bl sub_8066470\n\
        b _080659A4\n\
    _08065902:\n\
        adds r0, r7, #0\n\
        adds r0, #0xc4\n\
        adds r0, r4, r0\n\
        cmp r1, r0\n\
        bne _0806592A\n\
        adds r0, r5, #0\n\
        movs r1, #0x78\n\
        movs r2, #0xa\n\
        bl StartSpellThing_MagicQuake\n\
        movs r0, #1\n\
        movs r1, #0\n\
        movs r2, #0x10\n\
        movs r3, #0\n\
        bl SetSpecialColorEffectsParameters\n\
        adds r0, r5, #0\n\
        bl StartSpellBG_IvaldiBG4\n\
        b _080659A4\n\
    _0806592A:\n\
        ldr r2, _0806595C  @ 0x00000107\n\
        adds r0, r4, r2\n\
        cmp r1, r0\n\
        bne _08065960\n\
        adds r0, r5, #0\n\
        movs r1, #0x5c\n\
        bl sub_8066060\n\
        ldrh r0, [r5, #0x10]\n\
        movs r1, #9\n\
        orrs r0, r1\n\
        strh r0, [r5, #0x10]\n\
        adds r4, r6, #0\n\
        adds r4, #0x29\n\
        ldrb r1, [r4]\n\
        adds r0, r5, #0\n\
        bl StartBattleAnimHitEffectsDefault\n\
        ldrb r0, [r4]\n\
        cmp r0, #0\n\
        bne _080659A4\n\
        adds r0, r5, #0\n\
        bl EfxPlayHittedSFX\n\
        b _080659A4\n\
        .align 2, 0\n\
    _0806595C: .4byte 0x00000107\n\
    _08065960:\n\
        movs r0, #0xc4\n\
        adds r2, r7, r0\n\
        adds r0, r2, r3\n\
        cmp r1, r0\n\
        beq _08065982\n\
        movs r3, #0x2c\n\
        ldrsh r1, [r6, r3]\n\
        adds r0, r4, #0\n\
        adds r0, #0x52\n\
        adds r0, r2, r0\n\
        cmp r1, r0\n\
        beq _08065982\n\
        adds r0, r4, #0\n\
        adds r0, #0x5e\n\
        adds r0, r2, r0\n\
        cmp r1, r0\n\
        bne _0806598C\n\
    _08065982:\n\
        adds r0, r5, #0\n\
        movs r1, #2\n\
        bl NewEfxFlashBgWhite\n\
        b _080659A4\n\
    _0806598C:\n\
        adds r0, r4, #0\n\
        adds r0, #0x64\n\
        adds r0, r2, r0\n\
        cmp r1, r0\n\
        bne _080659A4\n\
        bl SpellFx_Finish\n\
        bl RegisterEfxSpellCastEnd\n\
        adds r0, r6, #0\n\
        bl Proc_Break\n\
    _080659A4:\n\
        add sp, #4\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .syntax divided\n\
    ");
}

#endif

// clang-format off

struct ProcCmd CONST_DATA gUnknown_085D76A0[] =
{
    PROC_NAME("efxIvaldiBG1"),
    PROC_REPEAT(Loop6C_efxIvaldiBG1),
    PROC_END,
};

u16 * CONST_DATA gUnknown_085D76B8[] =
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
    static const u16 gUnknown_080DE4E6[] =
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

    proc = Proc_Start(gUnknown_085D76A0, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DE4E6;

    proc->tsal = gUnknown_085D76B8;
    proc->tsar = gUnknown_085D76B8;

    SpellFx_RegisterBgGfx(gUnknown_086937C0, 32 * 8 * CHR_SIZE);
    SpellFx_RegisterBgPal(gUnknown_086945C4, PLTT_SIZE_4BPP);

    BG_SetPosition(BG_1, 0, 0);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08065A10
void Loop6C_efxIvaldiBG1(struct ProcEfxBG * proc)
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

struct ProcCmd CONST_DATA gUnknown_085D76E8[] =
{
    PROC_NAME("efxIvaldiBG2"),
    PROC_REPEAT(Loop6C_efxIvaldiBG2),
    PROC_END,
};

u16 * CONST_DATA gUnknown_085D7700[] =
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
    static const u16 gUnknown_080DE526[] =
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

    proc = Proc_Start(gUnknown_085D76E8, PROC_TREE_3);

    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DE526;

    proc->tsal = gUnknown_085D7700;
    proc->tsar = gUnknown_085D7700;

    SpellFx_RegisterBgGfx(gUnknown_08695B10, 32 * 8 * CHR_SIZE);
    SpellFx_RegisterBgPal(gUnknown_08696840, PLTT_SIZE_4BPP);

    BG_SetPosition(BG_1, 0, 0);

    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08065AEC
void Loop6C_efxIvaldiBG2(struct ProcEfxBG * proc)
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

struct ProcCmd CONST_DATA ProcScr_efxDanceparaBG3[] =
{
    PROC_NAME("efxIvaldiBG3"),
    PROC_REPEAT(Loop6C_efxIvaldiBG3),
    PROC_END,
};

u16 * CONST_DATA gUnknown_085D772C[] =
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

u16 * CONST_DATA gUnknown_085D7758[] =
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

u16 * CONST_DATA gUnknown_085D7784[] =
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
    static const u16 gUnknown_080DE552[] =
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

    proc = Proc_Start(ProcScr_efxDanceparaBG3, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DE552;

    proc->tsal = gUnknown_085D772C;
    proc->tsar = gUnknown_085D772C;
    proc->img = gUnknown_085D7758;

    proc->pal = gUnknown_085D7784;

    BG_SetPosition(BG_1, 0, 0);

    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08065BB8
void Loop6C_efxIvaldiBG3(struct ProcEfxBG * proc)
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

struct ProcCmd CONST_DATA ProcScr_efxDanceparaBG4[] =
{
    PROC_NAME("efxIvaldiBG4"),
    PROC_REPEAT(sub_8065CA0),
    PROC_END,
};

u16 * CONST_DATA gUnknown_085D77C8[] =
{
    Tsa_086A1D00,
};

// clang-format on

//! FE8U = 0x08065C38
void StartSpellBG_IvaldiBG4(struct Anim * anim)
{
    // clang-format off
    static const u16 gUnknown_080DE58E[] =
    {
        0, 120,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDanceparaBG4, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->unk34 = 0;
    proc->unk3C = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DE58E;

    proc->tsal = gUnknown_085D77C8;
    proc->tsar = gUnknown_085D77C8;

    SpellFx_RegisterBgGfx(gUnknown_086A06A8, 32 * 8 * CHR_SIZE);
    SpellFx_RegisterBgPal(gUnknown_086A1CE0, PLTT_SIZE_4BPP);

    BG_SetPosition(BG_1, 0, 0);

    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x08065CA0
void sub_8065CA0(struct ProcEfxBG * proc)
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
    SpellFx_RegisterObjPal(gUnknown_08692B10, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(gUnknown_086926E0, 32 * 4 * CHR_SIZE);
    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxDanceparaOBJFall[] =
{
    PROC_NAME("efxIvaldiOBJFall"),
    PROC_REPEAT(sub_8065DF8),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08065DA4
void StartSpellOBJ_IvaldiFall(struct Anim * anim, int terminator)
{
    struct ProcEfxOBJ * proc;

    GetAnimPosition(anim);

    SpellFx_RegisterObjPal(gUnknown_08692B10, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(gUnknown_086926E0, 32 * 4 * CHR_SIZE);

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDanceparaOBJFall, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    return;
}

//! FE8U = 0x08065DF8
void sub_8065DF8(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == 7)
    {
        sub_8066258(proc->anim, 64, 152, 84, 3);
    }
    else if (proc->timer == 13)
    {
        sub_8066258(proc->anim, 64, 48, 84, 3);
    }
    else if (proc->timer == 19)
    {
        sub_8066258(proc->anim, 64, 188, 106, 3);
    }
    else if (proc->timer == 25)
    {
        sub_8066258(proc->anim, 64, 104, 103, 2);
    }
    else if (proc->timer == 31)
    {
        sub_8066258(proc->anim, 64, 36, 102, 2);
    }
    else if (proc->timer == 37)
    {
        sub_8066258(proc->anim, 64, 176, 97, 3);
    }
    else if (proc->timer == 43)
    {
        sub_8066258(proc->anim, 64, 56, 100, 3);
    }
    else if (proc->timer == 49)
    {
        sub_8066258(proc->anim, 64, 158, 103, 2);
    }
    else if (proc->timer == 55)
    {
        sub_8066258(proc->anim, 64, 66, 92, 3);
    }
    else if (proc->timer == 61)
    {
        sub_8066258(proc->anim, 64, 230, 92, 3);
    }
    else if (proc->timer == 67)
    {
        sub_8066258(proc->anim, 64, 104, 108, 3);
    }

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA efxIvaldiOBJSideWash[] =
{
    PROC_NAME("efxIvaldiOBJSideWash"),
    PROC_REPEAT(Loop6C_efxIvaldiOBJSideWash),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08065F10
void StartSpellOBJ_IvaldiSideWash(struct Anim * anim, int terminator)
{
    struct ProcEfxOBJ * proc;

    GetAnimPosition(anim);

    SpellFx_RegisterObjPal(gUnknown_08692B10, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(gUnknown_086926E0, 32 * 4 * CHR_SIZE);

    gEfxBgSemaphore++;

    proc = Proc_Start(efxIvaldiOBJSideWash, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    return;
}

//! FE8U = 0x08065F64
void Loop6C_efxIvaldiOBJSideWash(struct ProcEfxOBJ * proc)
{
    GetAnimPosition(proc->anim);

    proc->timer++;

    if (proc->timer == 0)
    {
        sub_8066258(proc->anim, 26, 104, 12, 0);
    }
    else if (proc->timer == 3)
    {
        sub_8066258(proc->anim, 26, 104, 95, 1);
    }
    else if (proc->timer == 6)
    {
        sub_8066258(proc->anim, 26, 120, 36, 1);
    }
    else if (proc->timer == 9)
    {
        sub_8066258(proc->anim, 26, 100, 10, 1);
    }
    else if (proc->timer == 12)
    {
        sub_8066258(proc->anim, 26, 94, 54, 0);
    }
    else if (proc->timer == 15)
    {
        sub_8066258(proc->anim, 26, 100, 48, 1);
    }
    else if (proc->timer == 18)
    {
        sub_8066258(proc->anim, 26, 104, 102, 0);
    }
    else if (proc->timer == 21)
    {
        sub_8066258(proc->anim, 26, 96, 16, 1);
    }
    else if (proc->timer == 24)
    {
        sub_8066258(proc->anim, 26, 128, 80, 1);
    }
    else if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxDanceparaOBJUprise[] =
{
    PROC_NAME("efxIvaldiOBJUprise"),
    PROC_REPEAT(sub_80660B4),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08066060
void sub_8066060(struct Anim * anim, int terminator)
{
    struct ProcEfxOBJ * proc;

    GetAnimPosition(anim);

    SpellFx_RegisterObjPal(gUnknown_08692B10, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(gUnknown_086926E0, 32 * 4 * CHR_SIZE);

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDanceparaOBJUprise, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    return;
}

//! FE8U = 0x080660B4
void sub_80660B4(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == 5)
    {
        sub_8066390(proc->anim, 64, 200, 112, 1);
    }
    else if (proc->timer == 10)
    {
        sub_8066390(proc->anim, 64, 67, 91, 1);
    }
    else if (proc->timer == 15)
    {
        sub_8066390(proc->anim, 64, 13, 89, 1);
    }
    else if (proc->timer == 20)
    {
        sub_8066390(proc->anim, 64, 203, 76, 1);
    }
    else if (proc->timer == 25)
    {
        sub_8066390(proc->anim, 64, 223, 2, 1);
    }
    else if (proc->timer == 30)
    {
        sub_8066390(proc->anim, 64, 14, 111, 1);
    }
    else if (proc->timer == 35)
    {
        sub_8066390(proc->anim, 64, 224, 108, 1);
    }
    else if (proc->timer == 40)
    {
        sub_8066390(proc->anim, 64, 368, 112, 1);
    }
    else if (proc->timer == 45)
    {
        sub_8066390(proc->anim, 64, 58, 45, 0);
    }
    else if (proc->timer == 50)
    {
        sub_8066390(proc->anim, 64, 127, 66, 0);
    }
    else if (proc->timer == 55)
    {
        sub_8066390(proc->anim, 64, 163, 20, 0);
    }
    else if (proc->timer == 60)
    {
        sub_8066390(proc->anim, 64, 167, 62, 0);
    }
    else if (proc->timer == 65)
    {
        sub_8066390(proc->anim, 64, 56, 96, 0);
    }
    else if (proc->timer == 70)
    {
        sub_8066390(proc->anim, 64, 128, 66, 0);
    }
    else if (proc->timer == 75)
    {
        sub_8066390(proc->anim, 64, 56, 112, 0);
    }
    else if (proc->timer == 80)
    {
        sub_8066390(proc->anim, 64, 168, 112, 0);
    }
    else if (proc->timer == 85)
    {
        sub_8066390(proc->anim, 64, 164, 112, 0);
    }
    else if (proc->timer == 90)
    {
        sub_8066390(proc->anim, 64, 65, 120, 0);
    }
    else if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxDanceparaOBJ1[] =
{
    PROC_NAME("efxIvaldiOBJ1"),
    PROC_REPEAT(sub_806635C),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08066258
void sub_8066258(struct Anim * anim, int terminator, s16 x, s16 y, u8 kind)
{
    struct ProcEfxOBJ * proc;
    u32 * scr;
    struct Anim * frontAnim;

    // clang-format off
    u32 * gUnknown_080DE5E4[6][2] =
    {
        {
            gUnknown_086936C4,
            gUnknown_0869307C,
        },
        {
            gUnknown_086936F0,
            gUnknown_086930A8,
        },
        {
            gUnknown_0869371C,
            gUnknown_086930D4,
        },
        {
            gUnknown_08693760,
            gUnknown_08693118,
        },
        {
            gUnknown_08693760,
            gUnknown_08693118,
        },
        {
            gUnknown_08693760,
            gUnknown_08693118,
        }
    };
    // clang-format on

    u8 pos = GetAnimPosition(anim);

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDanceparaOBJ1, PROC_TREE_3);

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
void sub_806635C(struct ProcEfxOBJ * proc)
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

struct ProcCmd CONST_DATA ProcScr_efxDanceparaOBJ2[] =
{
    PROC_NAME("efxIvaldiOBJ2"),
    PROC_REPEAT(sub_8066434),
    PROC_END,
};

// clang-format on

u32 * const gUnknown_080DE624[2] =
{
    gUnknown_08693160,
    gUnknown_0869316C,
};

#if NONMATCHING

/* https://decomp.me/scratch/ln9S6 */

//! FE8U = 0x08066390
void sub_8066390(struct Anim * anim, int terminator, s16 x, s16 y, u8 kind)
{
    const u32 * a = gUnknown_080DE624[0];
    const u32 * b = gUnknown_080DE624[1];

    u32 * scr;
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDanceparaOBJ2, PROC_TREE_3);

    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    switch (kind)
    {
        case 0:
        default:
            scr = a;
            break;

        case 1:
            scr = b;
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

#else

NAKEDFUNC
void sub_8066390(struct Anim * anim, int terminator, s16 x, s16 y, u8 kind)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #8\n\
        mov r8, r0\n\
        mov r9, r1\n\
        ldr r0, [sp, #0x28]\n\
        lsls r2, r2, #0x10\n\
        lsrs r2, r2, #0x10\n\
        str r2, [sp, #4]\n\
        lsls r3, r3, #0x10\n\
        lsrs r3, r3, #0x10\n\
        mov sl, r3\n\
        lsls r0, r0, #0x18\n\
        lsrs r4, r0, #0x18\n\
        ldr r0, _080663E8  @ gUnknown_080DE624\n\
        ldr r6, [r0]\n\
        ldr r7, [r0, #4]\n\
        ldr r1, _080663EC  @ gEfxBgSemaphore\n\
        ldr r0, [r1]\n\
        adds r0, #1\n\
        str r0, [r1]\n\
        ldr r0, _080663F0  @ ProcScr_efxDanceparaOBJ2\n\
        movs r1, #3\n\
        bl Proc_Start\n\
        adds r5, r0, #0\n\
        mov r0, r8\n\
        bl GetAnimAnotherSide\n\
        str r0, [r5, #0x5c]\n\
        movs r0, #0\n\
        strh r0, [r5, #0x2c]\n\
        mov r0, r9\n\
        strh r0, [r5, #0x2e]\n\
        cmp r4, #0\n\
        beq _080663E2\n\
        cmp r4, #1\n\
        beq _080663F4\n\
    _080663E2:\n\
        adds r3, r6, #0\n\
        b _080663F6\n\
        .align 2, 0\n\
    _080663E8: .4byte gUnknown_080DE624\n\
    _080663EC: .4byte gEfxBgSemaphore\n\
    _080663F0: .4byte ProcScr_efxDanceparaOBJ2\n\
    _080663F4:\n\
        adds r3, r7, #0\n\
    _080663F6:\n\
        ldr r0, [r5, #0x5c]\n\
        str r3, [sp]\n\
        adds r1, r3, #0\n\
        adds r2, r3, #0\n\
        bl EfxCreateFrontAnim\n\
        str r0, [r5, #0x60]\n\
        mov r1, sp\n\
        ldrh r1, [r1, #4]\n\
        strh r1, [r0, #2]\n\
        mov r2, sl\n\
        strh r2, [r0, #4]\n\
        ldrh r2, [r0, #8]\n\
        ldr r1, _08066430  @ 0x0000F3FF\n\
        ands r1, r2\n\
        movs r3, #0x80\n\
        lsls r3, r3, #3\n\
        adds r2, r3, #0\n\
        orrs r1, r2\n\
        strh r1, [r0, #8]\n\
        add sp, #8\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _08066430: .4byte 0x0000F3FF\n\
        .syntax divided\n\
    ");
}

#endif

//! FE8U = 0x08066434
void sub_8066434(struct ProcEfxOBJ * proc)
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

struct ProcCmd CONST_DATA ProcScr_efxDanceparaWOUT[] =
{
    PROC_NAME("efxIvaldiWOUT"),
    PROC_REPEAT(sub_80664A8),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08066470
void sub_8066470(struct Anim * anim, int duration, int terminator)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDanceparaWOUT, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;

    NewEfxFlashBgWhite(anim, duration);

    return;
}

//! FE8U = 0x080664A8
void sub_80664A8(struct ProcEfxOBJ * proc)
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
