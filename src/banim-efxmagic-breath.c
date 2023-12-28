#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

extern struct ProcCmd ProcScr_efxFirebreath[];

//! FE8U = 0x0805D064
void StartSpellAnimFireBreath(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxFirebreath, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x0805D09C
void sub_805D09C(struct ProcEfx * proc)
{
    int timer;
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }

    timer = proc->timer;

    if (timer == 1)
    {
        StartSpellThing_MagicQuake(proc->anim, 0x5a, 10);

        sub_805D14C(anim);
        sub_805D260(anim);
        sub_805D2EC(anim);

        NewEfxALPHA(anim, 0x28, 0xf, 0x10, 0, 0);

        PlaySFX(0x0000011D, 0x100, anim->xPosition, 1);
    }
    else if (timer == 0xf)
    {
        anim->state3 |= 9;

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (timer == 0x82)
    {
        SpellFx_Finish();
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd ProcScr_efxFirebreathOBJ[];

extern u32 gUnknown_085E2A24[];
extern u32 gUnknown_085E35DC[];

extern u16 gUnknown_085DE964[];
extern u16 gUnknown_085DDC64[];

//! FE8U = 0x0805D14C
void sub_805D14C(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFirebreathOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0x34;

    if (GetAnimPosition(anim) == 0)
    {
        scr = gUnknown_085E2A24;
    }
    else
    {
        scr = gUnknown_085E35DC;
    }

    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    if (gEkrDistanceType == 0)
    {
        if (GetAnimPosition(anim) == 0)
        {
            frontAnim->xPosition += 0x10;
        }
        else
        {
            frontAnim->xPosition -= 0x10;
        }
    }
    else
    {
        if (GetAnimPosition(anim) == 0)
        {
            frontAnim->xPosition += 0x48;
        }
        else
        {
            frontAnim->xPosition -= 0x48;
        }
    }

    SpellFx_RegisterObjPal(gUnknown_085DE964, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_085DDC64, 0x1000);

    return;
}

//! FE8U = 0x0805D1FC
void sub_805D1FC(struct ProcEfxOBJ * proc)
{
    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            proc->anim2->xPosition = proc->anim->xPosition + 0x48;
        }
        else
        {
            proc->anim2->xPosition = proc->anim->xPosition - 0x48;
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

extern struct ProcCmd ProcScr_efxFirebreathBG[];

extern u16 gUnknown_087246D8[];
extern u16 gUnknown_08725AF0[];

//! FE8U = 0x0805D260
void sub_805D260(struct Anim * anim)
{
    struct ProcEfxBG * proc;
    u16 * tsa;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFirebreathBG, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0x70;

    SpellFx_RegisterBgGfx(gUnknown_087246D8, 0x2000);

    tsa = gUnknown_08725AF0;
    SpellFx_WriteBgMap(proc->anim, tsa, tsa);

    SpellFx_ClearBG1Position();
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x0805D2B4
void sub_805D2B4(struct ProcEfxBG * proc)
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

extern struct ProcCmd ProcScr_efxFirebreathBGCOL[];

extern u16 gUnknown_08725AD0[];

extern u16 gUnknown_080DCA5C[];

//! FE8U = 0x0805D2EC
void sub_805D2EC(struct Anim * anim)
{
    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFirebreathBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DCA5C;
    proc->pal = gUnknown_08725AD0;

    return;
}

//! FE8U = 0x0805D328
void sub_805D328(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        CpuFastSet(proc->pal, gEfxPal, 8);
        EfxPalWhiteInOut(gEfxPal, 0, 1, ret);
        SpellFx_RegisterBgPal(gEfxPal, 0x20);
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

extern struct ProcCmd gUnknown_085D5358[];

//! FE8U = 0x0805D388
void StartSpellAnimIceBreath(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(gUnknown_085D5358, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));
    return;
}

//! FE8U = 0x0805D3C4
void sub_805D3C4(struct ProcEfx * proc)
{
    int timer;
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 1)
    {
        StartSpellThing_MagicQuake(proc->anim, 0x5a, 10);
        sub_805D444(proc->anim);

        PlaySFX(0x11e, 0x100, anim->xPosition, 1);
    }

    timer = proc->timer;

    if (timer == 4)
    {
        anim->state3 |= 9;

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (timer == 0x32)
    {
        return;
    }
    else if (timer == 0x3c)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd gUnknown_085D5370[];

extern u32 gUnknown_085E4E3C[];
extern u32 gUnknown_085E420C[];

extern u16 gUnknown_085DFA28[];

//! FE8U = 0x0805D444
void sub_805D444(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scrA;
    u32 * scrB;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D5370, PROC_TREE_3);
    proc->anim = anim;

    scrB = gUnknown_085E420C;
    scrA = gUnknown_085E4E3C;
    frontAnim = EfxCreateFrontAnim(anim, scrA, scrB, scrA, scrB);
    proc->anim2 = frontAnim;

    if (GetAnimPosition(anim) == 0)
    {
        frontAnim->xPosition += 0x20;
    }
    else
    {
        frontAnim->xPosition -= 0x20;
    }

    SpellFx_RegisterObjPal(gUnknown_085DFA28, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_085DDC64, 0x1000);

    return;
}

//! FE8U = 0x0805D4B8
void sub_805D4B8(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
    return;
}

extern struct ProcCmd gUnknown_085D5390[];

//! FE8U = 0x0805D4D0
void StartSpellAnimDarkBreath(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(gUnknown_085D5390, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x0805D508
void Loop6C_efxDarkbreath(struct ProcEfx * proc)
{
    int timer;
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);

        StartSpellThing_MagicQuake(proc->anim, 0x5a, 10);
        sub_805D59C(proc->anim);
        sub_805D644(proc->anim);
        sub_805D6CC(proc->anim);

        PlaySFX(0x11F, 0x100, anim->xPosition, 1);
    }

    timer = proc->timer;

    if (timer == 4)
    {
        anim->state3 |= 9;

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (timer == 0x20)
    {
        return;
    }
    else if (timer == 0x30)
    {
        SpellFx_Finish();
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd gUnknown_085D53A8[];

extern u16 * gUnknown_085D53C0[];

extern u16 gUnknown_085E5AE4[];

extern u16 gUnknown_080DCB78[];

//! FE8U = 0x0805D59C
void sub_805D59C(struct Anim * anim)
{

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D53A8, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DCB78;

    proc->tsal = gUnknown_085D53C0;
    proc->tsar = gUnknown_085D53C0;

    SpellFx_RegisterBgGfx(gUnknown_085E5AE4, 0x2000);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x0805D5EC
void sub_805D5EC(struct ProcEfxBG * proc)
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

extern struct ProcCmd gUnknown_085D53F0[];

extern u16 gUnknown_080DCBD4[];

//! FE8U = 0x0805D644
void sub_805D644(struct Anim * anim)
{
    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D53F0, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DCBD4;

    proc->pal = Pal_BoltingBg;

    return;
}

//! FE8U = 0x0805D680
void sub_805D680(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * pal = proc->pal;
        SpellFx_RegisterBgPal(pal + ret * 0x10, 0x20);
    }
    else
    {
        if (ret == -1)
        {
            SetDefaultColorEffects_();
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}

extern struct ProcCmd ProcScr_efxDarkbreathOBJ[];

extern u32 gUnknown_085E5A78[];
extern u32 gUnknown_08723208[];

extern u16 gUnknown_085DFA48[];

//! FE8U = 0x0805D6CC
void sub_805D6CC(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDarkbreathOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0x37;

    frontAnim = EfxCreateFrontAnim(anim, gUnknown_085E5A78, gUnknown_085E5A78, gUnknown_08723208, gUnknown_08723208);
    proc->anim2 = frontAnim;

    proc->unk32 = 20;
    proc->unk3A = -4;

    if (gEkrDistanceType != 0)
    {
        proc->unk32 = 0x2c;
    }

    if (GetAnimPosition(anim) == 0)
    {
        frontAnim->xPosition += proc->unk32;
        frontAnim->yPosition += proc->unk3A;
    }
    else
    {
        frontAnim->xPosition -= proc->unk32;
        frontAnim->yPosition += proc->unk3A;
    }

    SpellFx_RegisterObjPal(gUnknown_085DFA48, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_085DDC64, 0x1000);

    return;
}

//! FE8U = 0x0805D774
void sub_805D774(struct ProcEfxOBJ * proc)
{
    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            proc->anim2->xPosition = proc->anim->xPosition + proc->unk32;
        }
        else
        {
            proc->anim2->xPosition = proc->anim->xPosition - proc->unk32;
        }
    }

    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}
