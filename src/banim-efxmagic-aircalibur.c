#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"

extern struct ProcCmd gUnknown_085D5880[];

//! FE8U = 0x0805EB98
void sub_805EB98(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(gUnknown_085D5880, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x0805EBD4
void sub_805EBD4(struct ProcEfx * proc)
{
    int time;

    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    int duration = EfxGetCamMovDuration();

    time = (gEkrDistanceType != 0) ? 0x32 : 0x3a;

    proc->timer++;

    if (proc->timer == 1)
    {
        sub_805EE24(proc->anim);
        PlaySFX(0x108, 0x100, proc->anim->xPosition, 1);
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else
    {
        if (proc->timer == time + duration)
        {
            NewEfxFlashBgWhite(proc->anim, 6);
        }
        else if (proc->timer == time + 6 + duration)
        {
            sub_805ECD4(anim);
            sub_805ED98(anim);
            NewEfxALPHA(anim, 6, 5, 0x10, 0, 0);
            PlaySFX(0x00000109, 0x100, anim->xPosition, 1);
        }
        else if (proc->timer == time + 8 + duration)
        {
            anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
            StartBattleAnimHitEffectsDefault(anim, proc->hitted);

            if (!proc->hitted)
            {
                EfxPlayHittedSFX(anim);
            }
        }
        else if ((proc->timer != time + 0xc + duration) && (proc->timer == time + 0xe + duration))
        {
            SpellFx_Finish();
            RegisterEfxSpellCastEnd();
            Proc_Break(proc);
        }
    }

    return;
}

extern struct ProcCmd gUnknown_085D5898[];

extern u16 gUnknown_080DD024[];

void sub_805ECD4(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D5898, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DD024;
    proc->tsal = gUnknown_085D58B0;

    SpellFx_RegisterBgGfx(gUnknown_08621960, 0x2000);
    SpellFx_SetSomeColorEffect();

    if (GetAnimPosition(proc->anim) == 0)
    {
        BG_SetPosition(1, 0x18, 0);
    }
    else
    {
        BG_SetPosition(1, 0xe8, 0);
    }

    return;
}

//! FE8U = 0x0805ED44
void sub_805ED44(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsa = proc->tsal;
        SpellFx_WriteBgMapExt(proc->anim, *(tsa + ret), 0x20, 0x14);
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

extern struct ProcCmd gUnknown_085D58B8[];

//! FE8U = 0x0805ED98
void sub_805ED98(struct Anim * anim)
{
    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D58B8, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DD044;
    proc->pal = gUnknown_08622F2C;

    SpellFx_RegisterBgPal(gUnknown_08622F2C, 0x20);

    return;
}

//! FE8U = 0x0805EDDC
void sub_805EDDC(struct ProcEfxBGCOL * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 * pal = proc->pal;
        SpellFx_RegisterBgPal((pal + (ret * 0x10)), 0x20);
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

extern struct ProcCmd gUnknown_085D58D8[];

//! FE8U = 0x0805EE24
void sub_805EE24(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D58D8, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    frontAnim = EfxCreateFrontAnim(anim, gUnknown_086267D8, gUnknown_08625094, gUnknown_0862688C, gUnknown_08625148);
    proc->anim2 = frontAnim;

    if (GetAnimPosition(anim) == 0)
    {
        frontAnim->xPosition += 0x48;
    }
    else
    {
        frontAnim->xPosition -= 0x48;
    }

    proc->terminator = 0x60;

    SpellFx_RegisterObjPal(gUnknown_08623A9C, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_086234D8, 0x1000);

    return;
}

//! FE8U = 0x0805EEAC
void sub_805EEAC(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}
