#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

extern struct ProcCmd gUnknown_085D64A4[];

//! FE8U = 0x0806028C
void sub_806028C(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(gUnknown_085D64A4, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x080602C8
void sub_80602C8(struct ProcEfx * proc)
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
        SetBlendAlpha(0, 16);
        NewEfxALPHA(anim, 0, 15, 0, 16, 0);
        NewEfxALPHA(anim, 80, 15, 16, 0, 0);
        sub_8060440(proc->anim);
        sub_8060790(proc->anim);
        PlaySFX(0x138, 0x100, 0x78, 0);
    }
    else if (proc->timer == duration + 70)
    {
        StartSubSpell_efxResireRST(anim, NewefxRestRST(anim, 42, 15, 0, 2), 30);
        NewEfxRestWINH_(anim, 43, 0);
    }
    else if (proc->timer == duration + 120)
    {
        sub_80604B0(anim);
    }
    else if (proc->timer == duration + 125)
    {
        PlaySFX(0x139, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 151)
    {
        sub_80605E8(proc->anim);
    }
    else if (proc->timer == duration + 226)
    {
        PlaySFX(0x2E2, 0x100, anim->xPosition, 1);
        NewEfxFlashBgWhite(anim, 10);
        anim->state3 |= 9;
        StartBattleAnimHitEffectsDefault(anim, proc->hitted);
        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 236)
    {
        sub_8060514(anim);
        NewEfxALPHA(anim, 16, 10, 16, 0, 0);
    }
    else if (proc->timer == duration + 270)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd gUnknown_085D64BC[];

extern u16 gUnknown_080DD5D2[];
extern u16 * gUnknown_085D64D4[];
extern u16 * gUnknown_085D6540[];

//! FE8U = 0x08060440
void sub_8060440(struct Anim * anim)
{
    struct ProcEfxEclipseBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D64BC, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DD5D2;

    proc->tsal = gUnknown_085D64D4;
    proc->tsar = gUnknown_085D64D4;

    proc->img = gUnknown_085D6540;
    proc->pal = NULL;

    SpellFx_RegisterBgPal(Pal_NosferatuBg, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    SetWinEnable(0, 0, 0);

    return;
}

extern u16 gUnknown_080DD5D8[];

extern u16 gUnknown_0864E790[];

//! FE8U = 0x080604B0
void sub_80604B0(struct Anim * anim)
{
    struct ProcEfxEclipseBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D64BC, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DD5D8;

    proc->tsal = gUnknown_085D64D4;
    proc->tsar = gUnknown_085D64D4;

    proc->img = gUnknown_085D6540;
    proc->pal = NULL;

    SpellFx_RegisterBgPal(gUnknown_0864E790, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    SetBlendAlpha(12, 6);

    return;
}

extern u16 gUnknown_080DD67A[];
extern u16 gUnknown_0864E7B0[];

//! FE8U = 0x08060514
void sub_8060514(struct Anim * anim)
{
    struct ProcEfxEclipseBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D64BC, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gUnknown_080DD67A;

    proc->tsal = gUnknown_085D64D4;
    proc->tsar = gUnknown_085D64D4;

    proc->img = gUnknown_085D6540;
    proc->pal = NULL;

    SpellFx_RegisterBgPal(gUnknown_0864E7B0, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x0806056C
void sub_806056C(struct ProcEfxEclipseBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;

        u16 ** img = proc->img;

        if (proc->pal != *(img + ret))
        {
            SpellFx_RegisterBgGfx(*(img + ret), 0x2000);
        }

        proc->pal = *(img + ret);

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

extern struct ProcCmd ProcScr_efxHazymoonOBJ2[];

//! FE8U = 0x080605E8
void sub_80605E8(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * otherAnim;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxHazymoonOBJ2, PROC_TREE_3);
    proc->anim = anim;
    otherAnim = GetAnimAnotherSide(anim);
    proc->timer = 0;

    frontAnim =
        EfxCreateFrontAnim(otherAnim, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90);
    proc->anim2 = frontAnim;
    frontAnim->oam2Base &= ~(0xc00);
    frontAnim->oam2Base |= 0x400;

    if (GetAnimPosition(otherAnim) == 0)
    {
        frontAnim->xPosition -= 8;
        frontAnim->yPosition -= 16;
    }
    else
    {
        frontAnim->xPosition += 8;
        frontAnim->yPosition -= 16;
    }

    return;
}

//! FE8U = 0x08060664
void sub_8060664(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
    return;
}

extern u32 gUnknown_086517DC[];

extern u16 gUnknown_0865163C[];
extern u16 gUnknown_086508DC[];

//! FE8U = 0x0806067C
void sub_806067C(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    proc->timer++;

    if (proc->timer == 1)
    {
        anim->pScrStart = gUnknown_086517DC;
        anim->pScrCurrent = gUnknown_086517DC;
        anim->timer = 0;

        proc->terminator = 10;

        SpellFx_RegisterObjPal(gUnknown_0865163C, PLTT_SIZE_4BPP);
        SpellFx_RegisterObjGfx(gUnknown_086508DC, 32 * 4 * CHR_SIZE);
    }
    else if (proc->timer == proc->terminator)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}

extern u32 gUnknown_08651AE4[];
extern u16 gUnknown_08650DA8[];

//! FE8U = 0x080606D8
void sub_80606D8(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    proc->timer++;

    if (proc->timer == 1)
    {
        anim->pScrStart = gUnknown_08651AE4;
        anim->pScrCurrent = gUnknown_08651AE4;
        anim->timer = 0;

        proc->terminator = 10;

        SpellFx_RegisterObjPal(gUnknown_0865163C, PLTT_SIZE_4BPP);
        SpellFx_RegisterObjGfx(gUnknown_08650DA8, 32 * 4 * CHR_SIZE);
    }
    else if (proc->timer == proc->terminator)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}

extern u32 gUnknown_08651DE0[];
extern u16 gUnknown_08651240[];

//! FE8U = 0x08060734
void sub_8060734(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    proc->timer++;

    if (proc->timer == 1)
    {
        anim->pScrStart = gUnknown_08651DE0;
        anim->pScrCurrent = gUnknown_08651DE0;
        anim->timer = 0;

        proc->terminator = 10;

        SpellFx_RegisterObjPal(gUnknown_0865163C, PLTT_SIZE_4BPP);
        SpellFx_RegisterObjGfx(gUnknown_08651240, 32 * 4 * CHR_SIZE);
    }
    else if (proc->timer == proc->terminator)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd gUnknown_085D65F4[];

//! FE8U = 0x08060790
void sub_8060790(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D65F4, PROC_TREE_3);
    proc->anim = anim;

    proc->timer = 0;
    proc->terminator = 0;

    proc->unk30 = 0x2c;

    SpellFx_RegisterObjPal(Pal_FluxAnimSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_FluxAnimSprites_Orb, 32 * 4 * CHR_SIZE);

    return;
}

extern s16 gUnknown_085D660C[];

//! FE8U = 0x080607D8
void sub_80607D8(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == 8)
    {
        s16 x;
        s16 y;

        proc->timer = 0;

        x = gUnknown_085D660C[proc->terminator * 2];
        y = gUnknown_085D660C[proc->terminator * 2 + 1];

        sub_8060838(proc->anim, x, y);

        proc->terminator++;

        if (proc->terminator == 6)
        {
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}

extern struct ProcCmd gUnknown_085D6624[];

extern u32 gUnknown_0862D6E0[];

//! FE8U = 0x08060838
void sub_8060838(struct Anim * anim, int x, int y)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D6624, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    frontAnim = EfxCreateFrontAnim(anim, gUnknown_0862D6E0, gUnknown_0862D6E0, gUnknown_0862D6E0, gUnknown_0862D6E0);
    proc->anim2 = frontAnim;

    frontAnim->xPosition = x;
    frontAnim->yPosition = y;

    return;
}

//! FE8U = 0x0806088C
void sub_806088C(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
    return;
}
