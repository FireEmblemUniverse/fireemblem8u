#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

extern struct ProcCmd ProcScr_efxIvaldi[];

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

extern struct ProcCmd gUnknown_085D76A0[];

extern u16 * gUnknown_085D76B8[];

extern u16 gUnknown_086937C0[];
extern u16 gUnknown_086945C4[];

extern u16 gUnknown_080DE4E6[];

//! FE8U = 0x080659AC
void StartSpellBG_IvaldiBG1(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D76A0, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DE4E6;

    proc->tsal = gUnknown_085D76B8;
    proc->tsar = gUnknown_085D76B8;

    SpellFx_RegisterBgGfx(gUnknown_086937C0, 0x2000);
    SpellFx_RegisterBgPal(gUnknown_086945C4, 0x20);

    BG_SetPosition(1, 0, 0);
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

extern struct ProcCmd gUnknown_085D76E8[];

extern u16 * gUnknown_085D7700[];

extern u16 gUnknown_08695B10[];
extern u16 gUnknown_08696840[];

extern u16 gUnknown_080DE526[];

//! FE8U = 0x08065A80
void StartSpellBG_IvaldiBG2(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D76E8, PROC_TREE_3);

    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DE526;

    proc->tsal = gUnknown_085D7700;
    proc->tsar = gUnknown_085D7700;

    SpellFx_RegisterBgGfx(gUnknown_08695B10, 0x2000);
    SpellFx_RegisterBgPal(gUnknown_08696840, 0x20);

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

extern struct ProcCmd ProcScr_efxDanceparaBG3[];

extern u16 * gUnknown_085D772C[];
extern u16 * gUnknown_085D7758[];
extern u16 * gUnknown_085D7784[];

extern u16 gUnknown_080DE552[];

//! FE8U = 0x08065B54
void StartSpellBG_IvaldiBG3(struct Anim * anim)
{
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

        SpellFx_RegisterBgGfx(*(img + ret), 0x2000);
        SpellFx_RegisterBgPal(*(pal + ret), 0x20);
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

extern struct ProcCmd ProcScr_efxDanceparaBG4[];

extern u16 * gUnknown_085D77C8[];

extern u16 gUnknown_086A06A8[];
extern u16 gUnknown_086A1CE0[];

extern u16 gUnknown_080DE58E[];

//! FE8U = 0x08065C38
void StartSpellBG_IvaldiBG4(struct Anim * anim)
{
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

    SpellFx_RegisterBgGfx(gUnknown_086A06A8, 0x2000);
    SpellFx_RegisterBgPal(gUnknown_086A1CE0, 0x20);

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
            EfxTmCpyBgHFlip(buf, gBG1TilemapBuffer, 0x1e, 0x20, 1, 0x100);
        }
        else
        {
            EfxTmCpyBG(buf, gBG1TilemapBuffer, 0x1e, 0x20, 1, 0x100);
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

extern u16 gUnknown_086926E0[];
extern u16 gUnknown_08692B10[];

//! FE8U = 0x08065D84
void PrepareSomeIvaldiParticleGraphics(void)
{
    SpellFx_RegisterObjPal(gUnknown_08692B10, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_086926E0, 0x1000);
    return;
}

extern struct ProcCmd ProcScr_efxDanceparaOBJFall[];

//! FE8U = 0x08065DA4
void StartSpellOBJ_IvaldiFall(struct Anim * anim, int terminator)
{
    struct ProcEfxOBJ * proc;

    GetAnimPosition(anim);

    SpellFx_RegisterObjPal(gUnknown_08692B10, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_086926E0, 0x1000);

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDanceparaOBJFall, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    return;
}

void sub_8066258(struct Anim * anim, int param_2, s16 param_3, s16 param_4, u8 param_5);

//! FE8U = 0x08065DF8
void sub_8065DF8(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == 7)
    {
        sub_8066258(proc->anim, 0x40, 0x98, 0x54, 3);
    }
    else if (proc->timer == 0xd)
    {
        sub_8066258(proc->anim, 0x40, 0x30, 0x54, 3);
    }
    else if (proc->timer == 0x13)
    {
        sub_8066258(proc->anim, 0x40, 0xbc, 0x6a, 3);
    }
    else if (proc->timer == 0x19)
    {
        sub_8066258(proc->anim, 0x40, 0x68, 0x67, 2);
    }
    else if (proc->timer == 0x1f)
    {
        sub_8066258(proc->anim, 0x40, 0x24, 0x66, 2);
    }
    else if (proc->timer == 0x25)
    {
        sub_8066258(proc->anim, 0x40, 0xb0, 0x61, 3);
    }
    else if (proc->timer == 0x2b)
    {
        sub_8066258(proc->anim, 0x40, 0x38, 100, 3);
    }
    else if (proc->timer == 0x31)
    {
        sub_8066258(proc->anim, 0x40, 0x9e, 0x67, 2);
    }
    else if (proc->timer == 0x37)
    {
        sub_8066258(proc->anim, 0x40, 0x42, 0x5c, 3);
    }
    else if (proc->timer == 0x3d)
    {
        sub_8066258(proc->anim, 0x40, 0xe6, 0x5c, 3);
    }
    else if (proc->timer == 0x43)
    {
        sub_8066258(proc->anim, 0x40, 0x68, 0x6c, 3);
    }

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd efxIvaldiOBJSideWash[];

//! FE8U = 0x08065F10
void StartSpellOBJ_IvaldiSideWash(struct Anim * anim, int terminator)
{
    struct ProcEfxOBJ * proc;

    GetAnimPosition(anim);

    SpellFx_RegisterObjPal(gUnknown_08692B10, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_086926E0, 0x1000);

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
        sub_8066258(proc->anim, 0x1a, 0x68, 0xc, 0);
    }
    else if (proc->timer == 3)
    {
        sub_8066258(proc->anim, 0x1a, 0x68, 0x5f, 1);
    }
    else if (proc->timer == 6)
    {
        sub_8066258(proc->anim, 0x1a, 0x78, 0x24, 1);
    }
    else if (proc->timer == 9)
    {
        sub_8066258(proc->anim, 0x1a, 100, 10, 1);
    }
    else if (proc->timer == 0xc)
    {
        sub_8066258(proc->anim, 0x1a, 0x5e, 0x36, 0);
    }
    else if (proc->timer == 0xf)
    {
        sub_8066258(proc->anim, 0x1a, 100, 0x30, 1);
    }
    else if (proc->timer == 0x12)
    {
        sub_8066258(proc->anim, 0x1a, 0x68, 0x66, 0);
    }
    else if (proc->timer == 0x15)
    {
        sub_8066258(proc->anim, 0x1a, 0x60, 0x10, 1);
    }
    else if (proc->timer == 0x18)
    {
        sub_8066258(proc->anim, 0x1a, 0x80, 0x50, 1);
    }
    else if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd ProcScr_efxDanceparaOBJUprise[];

//! FE8U = 0x08066060
void sub_8066060(struct Anim * anim, int terminator)
{
    struct ProcEfxOBJ * proc;

    GetAnimPosition(anim);

    SpellFx_RegisterObjPal(gUnknown_08692B10, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_086926E0, 0x1000);

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDanceparaOBJUprise, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    return;
}

void sub_8066390(struct Anim * anim, int param_2, s16 param_3, s16 param_4, u8 param_5);

//! FE8U = 0x080660B4
void sub_80660B4(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == 5)
    {
        sub_8066390(proc->anim, 0x40, 200, 0x70, 1);
    }
    else if (proc->timer == 10)
    {
        sub_8066390(proc->anim, 0x40, 0x43, 0x5b, 1);
    }
    else if (proc->timer == 0xf)
    {
        sub_8066390(proc->anim, 0x40, 0xd, 0x59, 1);
    }
    else if (proc->timer == 0x14)
    {
        sub_8066390(proc->anim, 0x40, 0xcb, 0x4c, 1);
    }
    else if (proc->timer == 0x19)
    {
        sub_8066390(proc->anim, 0x40, 0xdf, 2, 1);
    }
    else if (proc->timer == 0x1e)
    {
        sub_8066390(proc->anim, 0x40, 0xe, 0x6f, 1);
    }
    else if (proc->timer == 0x23)
    {
        sub_8066390(proc->anim, 0x40, 0xe0, 0x6c, 1);
    }
    else if (proc->timer == 0x28)
    {
        sub_8066390(proc->anim, 0x40, 0xb8 << 1, 0x70, 1);
    }
    else if (proc->timer == 0x2d)
    {
        sub_8066390(proc->anim, 0x40, 0x3a, 0x2d, 0);
    }
    else if (proc->timer == 0x32)
    {
        sub_8066390(proc->anim, 0x40, 0x7f, 0x42, 0);
    }
    else if (proc->timer == 0x37)
    {
        sub_8066390(proc->anim, 0x40, 0xa3, 0x14, 0);
    }
    else if (proc->timer == 0x3c)
    {
        sub_8066390(proc->anim, 0x40, 0xa7, 0x3e, 0);
    }
    else if (proc->timer == 0x41)
    {
        sub_8066390(proc->anim, 0x40, 0x38, 0x60, 0);
    }
    else if (proc->timer == 0x46)
    {
        sub_8066390(proc->anim, 0x40, 0x80, 0x42, 0);
    }
    else if (proc->timer == 0x4b)
    {
        sub_8066390(proc->anim, 0x40, 0x38, 0x70, 0);
    }
    else if (proc->timer == 0x50)
    {
        sub_8066390(proc->anim, 0x40, 0xa8, 0x70, 0);
    }
    else if (proc->timer == 0x55)
    {
        sub_8066390(proc->anim, 0x40, 0xa4, 0x70, 0);
    }
    else if (proc->timer == 0x5a)
    {
        sub_8066390(proc->anim, 0x40, 0x41, 0x78, 0);
    }
    else if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

#if NONMATCHING

extern struct ProcCmd ProcScr_efxDanceparaOBJ1[];

extern u32 * gUnknown_080DE5E4[6][2];

//! FE8U = 0x08066258
void sub_8066258(struct Anim * anim, int terminator, s16 x, s16 y, u8 kind)
{
    struct ProcEfxOBJ * proc;
    u32 * scr;
    struct Anim * frontAnim;

    // clang-format off
    u32 * local_50[6][2] = {
        {
            (u32 *)0x086936C4,
            (u32 *)0x0869307C,
        },
        {
            (u32 *)0x086936F0,
            (u32 *)0x086930A8,
        },
        {
            (u32 *)0x0869371C,
            (u32 *)0x086930D4,
        },
        {
            (u32 *)0x08693760,
            (u32 *)0x08693118,
        },
        {
            (u32 *)0x08693760,
            (u32 *)0x08693118,
        },
        {
            (u32 *)0x08693760,
            (u32 *)0x08693118,
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
        case 0:
            scr = local_50[1][pos];
            break;

        case 2:
            scr = local_50[2][pos];
            break;

        case 3:
            scr = local_50[3][pos];
            break;

        case 4:
            scr = local_50[4][pos];
            break;

        case 5:
            scr = local_50[5][pos];
            break;

        default:
            scr = local_50[0][pos];
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
void sub_8066258(struct Anim * anim, int terminator, s16 x, s16 y, u8 kind)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, r7, lr}\n\
        mov r7, sl\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6, r7}\n\
        sub sp, #0x34\n\
        adds r4, r0, #0\n\
        mov r8, r1\n\
        ldr r0, [sp, #0x54]\n\
        lsls r2, r2, #0x10\n\
        lsrs r2, r2, #0x10\n\
        mov sl, r2\n\
        lsls r3, r3, #0x10\n\
        lsrs r3, r3, #0x10\n\
        mov r9, r3\n\
        lsls r0, r0, #0x18\n\
        lsrs r5, r0, #0x18\n\
        add r1, sp, #4\n\
        ldr r0, _080662C8  @ gUnknown_080DE5E4\n\
        ldm r0!, {r2, r3, r6}\n\
        stm r1!, {r2, r3, r6}\n\
        ldm r0!, {r2, r3, r6}\n\
        stm r1!, {r2, r3, r6}\n\
        ldm r0!, {r2, r3, r6}\n\
        stm r1!, {r2, r3, r6}\n\
        ldm r0!, {r2, r3, r6}\n\
        stm r1!, {r2, r3, r6}\n\
        adds r0, r4, #0\n\
        bl GetAnimPosition\n\
        lsls r0, r0, #0x18\n\
        lsrs r6, r0, #0x18\n\
        ldr r1, _080662CC  @ gEfxBgSemaphore\n\
        ldr r0, [r1]\n\
        adds r0, #1\n\
        str r0, [r1]\n\
        ldr r0, _080662D0  @ ProcScr_efxDanceparaOBJ1\n\
        movs r1, #3\n\
        bl Proc_Start\n\
        adds r7, r0, #0\n\
        adds r0, r4, #0\n\
        bl GetAnimAnotherSide\n\
        str r0, [r7, #0x5c]\n\
        movs r0, #0\n\
        strh r0, [r7, #0x2c]\n\
        mov r0, r8\n\
        strh r0, [r7, #0x2e]\n\
        cmp r5, #5\n\
        bhi _08066318\n\
        lsls r0, r5, #2\n\
        ldr r1, _080662D4  @ _080662D8\n\
        adds r0, r0, r1\n\
        ldr r0, [r0]\n\
        mov pc, r0\n\
        .align 2, 0\n\
    _080662C8: .4byte gUnknown_080DE5E4\n\
    _080662CC: .4byte gEfxBgSemaphore\n\
    _080662D0: .4byte ProcScr_efxDanceparaOBJ1\n\
    _080662D4: .4byte _080662D8\n\
    _080662D8: @ jump table\n\
        .4byte _08066318 @ case 0\n\
        .4byte _080662F0 @ case 1\n\
        .4byte _080662F8 @ case 2\n\
        .4byte _08066300 @ case 3\n\
        .4byte _08066308 @ case 4\n\
        .4byte _08066310 @ case 5\n\
    _080662F0:\n\
        lsls r1, r6, #2\n\
        add r0, sp, #0xc\n\
        adds r0, r0, r1\n\
        b _0806631E\n\
    _080662F8:\n\
        lsls r1, r6, #2\n\
        add r0, sp, #0x14\n\
        adds r0, r0, r1\n\
        b _0806631E\n\
    _08066300:\n\
        lsls r1, r6, #2\n\
        add r0, sp, #0x1c\n\
        adds r0, r0, r1\n\
        b _0806631E\n\
    _08066308:\n\
        lsls r1, r6, #2\n\
        add r0, sp, #0x24\n\
        adds r0, r0, r1\n\
        b _0806631E\n\
    _08066310:\n\
        lsls r1, r6, #2\n\
        add r0, sp, #0x2c\n\
        adds r0, r0, r1\n\
        b _0806631E\n\
    _08066318:\n\
        lsls r0, r6, #2\n\
        add r0, sp\n\
        adds r0, #4\n\
    _0806631E:\n\
        ldr r3, [r0]\n\
        ldr r0, [r7, #0x5c]\n\
        str r3, [sp]\n\
        adds r1, r3, #0\n\
        adds r2, r3, #0\n\
        bl EfxCreateFrontAnim\n\
        str r0, [r7, #0x60]\n\
        mov r1, sl\n\
        strh r1, [r0, #2]\n\
        mov r2, r9\n\
        strh r2, [r0, #4]\n\
        ldrh r2, [r0, #8]\n\
        ldr r1, _08066358  @ 0x0000F3FF\n\
        ands r1, r2\n\
        movs r3, #0x80\n\
        lsls r3, r3, #3\n\
        adds r2, r3, #0\n\
        orrs r1, r2\n\
        strh r1, [r0, #8]\n\
        add sp, #0x34\n\
        pop {r3, r4, r5}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        mov sl, r5\n\
        pop {r4, r5, r6, r7}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _08066358: .4byte 0x0000F3FF\n\
        .syntax divided\n\
    ");
}

#endif

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

extern struct ProcCmd ProcScr_efxDanceparaOBJ2[];

extern u32 * gUnknown_080DE624[2];

#if NONMATCHING

//! FE8U = 0x08066390
void sub_8066390(struct Anim * anim, int terminator, s16 x, s16 y, u8 kind)
{
    u32 * a = gUnknown_080DE624[0];
    u32 * b = gUnknown_080DE624[1];

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

    frontAnim->oam2Base &= 0x0000F3FF;
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

extern struct ProcCmd ProcScr_efxDanceparaWOUT[];

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
    int val = Interpolate(INTERPOLATE_LINEAR, 0, 0x10, proc->timer, proc->terminator);

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
