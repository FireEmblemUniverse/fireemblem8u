#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxShooter[] =
{
    PROC_NAME("efxShooter"),
    PROC_REPEAT(sub_805CD5C),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805CD0C
void sub_805CD0C(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxShooter, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    PlaySFX(0x136, 0x100, proc->anim->xPosition, 1);

    return;
}

//! FE8U = 0x0805CD5C
void sub_805CD5C(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 2)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
        return;
    }
    else
    {
        int timer = proc->timer;

        if (timer == 34)
        {
            PlaySFX(0x137, 0x100, proc->anim->xPosition, 1);
        }
        else if (timer == 42)
        {
            sub_805CE1C(anim);
        }
        else if (timer == 45)
        {
            anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

            StartBattleAnimHitEffectsDefault(anim, proc->hitted);

            if (GetEfxHpChangeType(anim) != 2)
            {
                if (CheckRoundCrit(proc->anim) == 1)
                {
                    NewEfxPierceCritical(anim);
                }
                else
                {
                    if (proc->hitted)
                    {
                        return;
                    }

                    NewEfxNormalEffect(proc->anim);
                }
            }

            if (!proc->hitted)
            {
                EfxPlayHittedSFX(anim);
            }
        }
        else if (timer == 62)
        {
            return;
        }
        else if (timer == 64)
        {
            SpellFx_Finish();
            Proc_Break(proc);
        }
    }

    return;
}

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxShooterOBJ[] =
{
    PROC_NAME("efxShooterOBJ"),
    PROC_REPEAT(sub_805CE94),
    PROC_END,
};

// clang-format on

//! FE8U = 0x0805CE1C
void sub_805CE1C(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    struct Anim * frontAnim;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxShooterOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    frontAnim = EfxCreateFrontAnim(anim, gUnknown_085DCA5C, gUnknown_085DCAF8, gUnknown_085DCA5C, gUnknown_085DCAF8);
    proc->anim2 = frontAnim;

    frontAnim->yPosition += 16;

    frontAnim->oam2Base &= OAM2_LAYER(3);

    if (GetAnimPosition(anim) == 1)
    {
        frontAnim->oam2Base |= OAM2_CHR(0x200) + OAM2_PAL(7);
    }
    else
    {
        frontAnim->oam2Base |= OAM2_CHR(0x300) + OAM2_PAL(9);
    }

    return;
}

//! FE8U = 0x0805CE94
void sub_805CE94(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer > 10)
    {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}
