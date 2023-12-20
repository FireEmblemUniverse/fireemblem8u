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
    PROC_REPEAT(sub_8065724),
    PROC_END,
};

// clang-format on

//! FE8U = 0x08065634
void sub_8065634(struct Anim * anim)
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
void sub_8065670(struct Anim * anim)
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
void sub_80656AC(struct Anim * anim)
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
void sub_80656E8(struct Anim * anim)
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
void sub_8065724(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 25)
    {
        sub_805CA64(anim, proc->unk44);
        sub_805CB40(anim, proc->unk44);

        NewEfxRestWINH_(anim, 130, 1);
        NewEfxTwobaiRST(anim, 100);

        SetBlendAlpha(0, 16);
        NewEfxALPHA(anim, 0, 8, 0, 16, 0);
        NewEfxALPHA(anim, 60, 40, 16, 0, 0);

        PlaySFX(0xef, 0x100, anim->xPosition, 1);
    }
    if (proc->timer == 125)
    {
        anim->state3 |= 9;
    }
    else if (proc->timer == 165)
    {
        anim->state3 |= 2;

        SpellFx_Finish();
        Proc_Break(proc);
    }

    return;
}
