#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

extern struct ProcCmd gUnknown_085D7E20[];

//! FE8U = 0x080674D4
void StartSpellAnimStone(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(gUnknown_085D7E20, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x08067510
void sub_8067510(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else if (proc->timer == duration + 10)
    {
        PlaySFX(0x3b8, 0x100, anim->xPosition, 1);
        sub_80676E4(anim, 200);
    }
    else if (proc->timer == duration + 0x48)
    {
        anim->state3 |= 9;

        if (!proc->hitted)
        {
            PlaySFX(0x3B9, 0x100, anim->xPosition, 1);

            sub_80675D4(anim);

            if (GettUnitEfxDebuff(anim) == UNIT_STATUS_NONE)
            {
                SetUnitEfxDebuff(anim, UNIT_STATUS_PETRIFY);
            }
        }

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);
    }
    else if (proc->timer == duration + 0xec)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd ProcScr_efxStoneBG[];

extern u16 * gUnknown_085D7E50[];
extern u16 * gUnknown_085D7E9C[];

extern u16 gUnknown_086C790C[];

extern u16 gUnknown_080DE974[];

//! FE8U = 0x080675D4
void sub_80675D4(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxStoneBG, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DE974;

    proc->tsal = gUnknown_085D7E9C;
    proc->tsar = gUnknown_085D7E9C;

    proc->img = gUnknown_085D7E50;

    SpellFx_RegisterBgPal(gUnknown_086C790C, 0x20);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            BG_SetPosition(1, 0xe8, 0);
        }
        else
        {
            BG_SetPosition(1, 0x18, 0);
        }
    }

    return;
}

extern u16 gUnknown_086C792C[];
extern u16 gUnknown_086C794C[];

//! FE8U = 0x08067660
void sub_8067660(struct ProcEfxBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;
        u16 ** img = proc->img;

        SpellFx_WriteBgMap(proc->anim, *(tsaL + ret), *(tsaR + ret));
        SpellFx_RegisterBgGfx(*(img + ret), 0x2000);

        if (ret == 0x11)
        {
            SpellFx_RegisterBgPal(gUnknown_086C792C, 0x20);
        }

        if (ret == 0x12)
        {
            SpellFx_RegisterBgPal(gUnknown_086C794C, 0x20);
        }
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

extern struct ProcCmd gUnknown_085D7EE8[];

extern u32 gUnknown_086BDA5C[];
extern u16 gUnknown_086BD76C[];
extern u16 gUnknown_086BD260[];

//! FE8U = 0x080676E4
void sub_80676E4(struct Anim * anim, int terminator)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(gUnknown_085D7EE8, PROC_TREE_3);
    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;
    proc->terminator = terminator;

    scr = gUnknown_086BDA5C;
    frontAnim = EfxCreateFrontAnim(anim, scr, scr, scr, scr);
    proc->anim2 = frontAnim;

    frontAnim->yPosition += 0xc;
    frontAnim->timer = 0;
    frontAnim->drawLayerPriority = 0x14;

    AnimSort();

    SpellFx_RegisterObjPal(gUnknown_086BD76C, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_086BD260, 0x1000);

    return;
}

//! FE8U = 0x08067764
void sub_8067764(struct ProcEfxOBJ * proc)
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
