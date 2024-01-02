#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

extern struct ProcCmd gUnknown_085D7F00[];

//! FE8U = 0x08067798
void StartSpellAnimEvilEye(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(gUnknown_085D7F00, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x080677D4
void sub_80677D4(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else if (proc->timer == duration + 2)
    {
        PlaySFX(0x000003C6, 0x100, anim->xPosition, 1);
        sub_8067AA0(anim, 0x3c);
    }
    else if (proc->timer == duration + 0x1a)
    {
        sub_806788C(anim);
    }
    else if (proc->timer == duration + 0x58)
    {
        sub_8067984(anim);
    }
    else if (proc->timer == duration + 0x5a)
    {
        anim->state3 |= 9;

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 0x74)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd gUnknown_085D7F18[];

extern u16 * gUnknown_085D7F30[];
extern u16 * gUnknown_085D7F80[];
extern u16 * gUnknown_085D7FD0[];

extern u16 gUnknown_080DE9EA[];

//! FE8U = 0x0806788C
void sub_806788C(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D7F18, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DE9EA;

    proc->tsal = gUnknown_085D7F80;
    proc->tsar = gUnknown_085D7F80;
    proc->img = gUnknown_085D7F30;
    proc->pal = gUnknown_085D7FD0;

    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            BG_SetPosition(BG_1, 0xe8, 0);
        }
        else
        {
            BG_SetPosition(BG_1, 0x18, 0);
        }
    }

    return;
}

//! FE8U = 0x08067914
void sub_8067914(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

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
            Proc_End(proc);
        }
    }

    return;
}

extern struct ProcCmd ProcScr_efxEvilEyeBG2[];

extern u16 * gUnknown_085D8038[];
extern u16 * gUnknown_085D8050[];
extern u16 * gUnknown_085D8068[];
extern u16 * gUnknown_085D8080[];

extern u16 gUnknown_086D8A94[];

extern u16 gUnknown_080DEA4A[];

//! FE8U = 0x08067984
void sub_8067984(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxEvilEyeBG2, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DEA4A;

    if (gEkrDistanceType != 0)
    {
        proc->tsal = gUnknown_085D8068;
        proc->tsar = gUnknown_085D8068;
    }
    else
    {
        proc->tsal = gUnknown_085D8050;
        proc->tsar = gUnknown_085D8050;
    }

    proc->img = gUnknown_085D8038;
    proc->pal = gUnknown_085D8080;

    SpellFx_RegisterBgPal(gUnknown_086D8A94, 0x20);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            BG_SetPosition(BG_1, 0xe8, 0);
        }
        else
        {
            BG_SetPosition(BG_1, 0x18, 0);
        }
    }

    return;
}

//! FE8U = 0x08067A30
void sub_8067A30(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

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
            Proc_End(proc);
        }
    }

    return;
}

extern struct ProcCmd gUnknown_085D8098[];

extern u32 * gUnknown_080DEA74[];

extern u16 gUnknown_086C93FC[];
extern u16 gUnknown_086C90A4[];

#if NONMATCHING

//! FE8U = 0x08067AA0
void sub_8067AA0(struct Anim * anim, int terminator)
{
    u8 pos;
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    u32 * gUnknown_080DEA74[2] =
    {
        (u32 *)0x086C95C0,
        (u32 *)0x086C978C,
    };

    pos = GetAnimPosition(anim);

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D8098, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    scr = gUnknown_080DEA74[pos];

    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;
    frontAnim->yPosition += 0x18;
    frontAnim->timer = 0;
    frontAnim->drawLayerPriority = 0x14;

    AnimSort();

    SpellFx_RegisterObjPal(gUnknown_086C93FC, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_086C90A4, 0x1000);

    return;
}

#else

NAKEDFUNC
void sub_8067AA0(struct Anim * anim, int terminator)
{
    asm("\n\
        .syntax unified\n\
        push {r4, r5, r6, lr}\n\
        mov r6, r9\n\
        mov r5, r8\n\
        push {r5, r6}\n\
        sub sp, #0xc\n\
        adds r6, r0, #0\n\
        mov r9, r1\n\
        ldr r0, _08067B34  @ gUnknown_080DEA74\n\
        ldr r1, [r0, #4]\n\
        ldr r0, [r0]\n\
        str r0, [sp, #4]\n\
        str r1, [sp, #8]\n\
        adds r0, r6, #0\n\
        bl GetAnimPosition\n\
        adds r4, r0, #0\n\
        lsls r4, r4, #0x18\n\
        lsrs r4, r4, #0x18\n\
        ldr r1, _08067B38  @ gEfxBgSemaphore\n\
        ldr r0, [r1]\n\
        adds r0, #1\n\
        str r0, [r1]\n\
        ldr r0, _08067B3C  @ gUnknown_085D8098\n\
        movs r1, #3\n\
        bl Proc_Start\n\
        adds r5, r0, #0\n\
        adds r0, r6, #0\n\
        bl GetAnimAnotherSide\n\
        str r0, [r5, #0x5c]\n\
        movs r0, #0\n\
        mov r8, r0\n\
        mov r1, r8\n\
        strh r1, [r5, #0x2c]\n\
        mov r0, r9\n\
        strh r0, [r5, #0x2e]\n\
        lsls r4, r4, #2\n\
        add r4, sp\n\
        adds r4, #4\n\
        ldr r3, [r4]\n\
        str r3, [sp]\n\
        adds r0, r6, #0\n\
        adds r1, r3, #0\n\
        adds r2, r3, #0\n\
        bl EfxCreateFrontAnim\n\
        str r0, [r5, #0x60]\n\
        ldrh r1, [r0, #4]\n\
        adds r1, #0x18\n\
        strh r1, [r0, #4]\n\
        mov r1, r8\n\
        strh r1, [r0, #6]\n\
        movs r1, #0x14\n\
        strh r1, [r0, #0xa]\n\
        bl AnimSort\n\
        ldr r0, _08067B40  @ gUnknown_086C93FC\n\
        movs r1, #0x20\n\
        bl SpellFx_RegisterObjPal\n\
        ldr r0, _08067B44  @ gUnknown_086C90A4\n\
        movs r1, #0x80\n\
        lsls r1, r1, #5\n\
        bl SpellFx_RegisterObjGfx\n\
        add sp, #0xc\n\
        pop {r3, r4}\n\
        mov r8, r3\n\
        mov r9, r4\n\
        pop {r4, r5, r6}\n\
        pop {r0}\n\
        bx r0\n\
        .align 2, 0\n\
    _08067B34: .4byte gUnknown_080DEA74\n\
    _08067B38: .4byte gEfxBgSemaphore\n\
    _08067B3C: .4byte gUnknown_085D8098\n\
    _08067B40: .4byte gUnknown_086C93FC\n\
    _08067B44: .4byte gUnknown_086C90A4\n\
        .syntax divided\n\
    ");
}

#endif

//! FE8U = 0x08067B48
void sub_8067B48(struct ProcEfxOBJ * proc)
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
