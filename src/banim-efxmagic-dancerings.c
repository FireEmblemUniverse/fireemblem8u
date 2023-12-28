#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off

struct ProcCmd CONST_DATA ProcScr_efxDancepara[] =
{
    PROC_NAME("efxDancepara"),
    PROC_REPEAT(efxDancepara_Loop),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08065634
void StartSpellAnimFillasMight(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxDancepara, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk44 = 1;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x08065670
void StartSpellAnimThorsIre(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxDancepara, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk44 = 2;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x080656AC
void StartSpellAnimNinisGrace(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxDancepara, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk44 = 3;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x080656E8
void StartSpellAnimSetsLitany(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxDancepara, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk44 = 4;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x08065724
void efxDancepara_Loop(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 25)
    {
        StartSubSpell_efxSongBG(anim, proc->unk44);
        StartSubSpell_efxSongOBJ(anim, proc->unk44);

        NewEfxRestWINH_(anim, 130, 1);
        NewEfxTwobaiRST(anim, 100);

        SetBlendAlpha(0, 16);
        NewEfxALPHA(anim, 0, 8, 0, 16, 0);
        NewEfxALPHA(anim, 60, 40, 16, 0, 0);

        PlaySFX(0xef, 0x100, anim->xPosition, 1);
    }
    if (proc->timer == 125)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
    }
    else if (proc->timer == 165)
    {
        anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;

        SpellFx_Finish();
        Proc_Break(proc);
    }

    return;
}
