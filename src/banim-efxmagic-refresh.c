#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

extern struct ProcCmd ProcScr_efxSong[];

//! FE8U = 0x0805C934
void StartSpellAnimSong(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxSong, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x0805C96C
void EfxSongMain(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 39)
    {
        sub_805CA64(anim, 0);
        sub_805CB40(anim, 0);

        NewEfxRestWINH_(anim, 130, 1);
        NewEfxTwobaiRST(anim, 100);

        SetBlendAlpha(0, 16);
        NewEfxALPHA(anim, 0, 8, 0, 16, 0);
        NewEfxALPHA(anim, 60, 40, 16, 0, 0);

        PlaySFX(0xef, 0x100, anim->xPosition, 1);
    }

    if (proc->timer == 139)
    {
        anim->state3 |= 9;

        sub_8055518(anim, proc->hitted);

        if (GetAnimPosition(anim) == 0)
        {
            CpuFastSet(gpEfxUnitPaletteBackup[0], gPaletteBuffer + PAL_OFFSET(0x17), 8);
        }
        else
        {
            CpuFastSet(gpEfxUnitPaletteBackup[1], gPaletteBuffer + PAL_OFFSET(0x19), 8);
        }

        EnableEfxStatusUnits(anim);
    }
    else if (proc->timer == 179)
    {
        anim->state3 |= 2;

        SpellFx_Finish();
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd ProcScr_efxSongBG[];

extern u16 * gUnknown_085D5188[];
extern u16 * gUnknown_085D51F4[];

extern u16 gUnknown_08754870[];

extern u16 gUnknown_080DC956[];

//! FE8U = 0x0805CA64
void sub_805CA64(struct Anim * anim, int kind)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSongBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gUnknown_080DC956;

    proc->tsal = gUnknown_085D5188;
    proc->tsar = gUnknown_085D5188;

    proc->img = gUnknown_085D51F4;
    proc->pal = NULL;

    SpellFx_RegisterBgPal(gUnknown_08754870 + kind * 0x10, 0x20);
    SpellFx_SetSomeColorEffect();

    return;
}

//! FE8U = 0x0805CAC4
void EfxSongBgMain(struct ProcEfxEclipseBG * proc)
{
    int ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);

    if (ret >= 0)
    {
        u16 ** tsaL = proc->tsal;
        u16 ** tsaR = proc->tsar;

        u16 ** img = proc->img;

        if (proc->pal != *(img + ret))
        {
            SpellFx_RegisterBgGfx(*(img + ret), 32 * 8 * CHR_SIZE);
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

extern struct ProcCmd ProcScr_efxSongOBJ[];

extern u16 gUnknown_08755FD4[];

extern u32 gUnknown_08758134[];

//! FE8U = 0x0805CB40
void sub_805CB40(struct Anim * anim, int kind)
{
    struct ProcEfxOBJ * proc;
    u32 * scr;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSongOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 56;
    scr = gUnknown_08758134;
    proc->anim2 = EfxCreateFrontAnim(anim, scr, scr, scr, scr);

    SpellFx_RegisterObjPal(gUnknown_08754870 + kind * 0x10, 0x20);
    SpellFx_RegisterObjGfx(gUnknown_08755FD4, 0x1000);

    return;
}

//! FE8U = 0x0805CBA8
void sub_805CBA8(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer > proc->terminator)
    {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}

extern struct ProcCmd ProcScr_efxDance[];

//! FE8U = 0x0805CBDC
void StartSpellAnimDance(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxDance, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x0805CC14
void sub_805CC14(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 25)
    {
        sub_805CA64(anim, 0);
        sub_805CB40(anim, 0);

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

        sub_8055518(anim, proc->hitted);

        if (GetAnimPosition(anim) == 0)
        {
            CpuFastSet(gpEfxUnitPaletteBackup[0], gPaletteBuffer + PAL_OFFSET(0x17), 8);
        }
        else
        {
            CpuFastSet(gpEfxUnitPaletteBackup[1], gPaletteBuffer + PAL_OFFSET(0x19), 8);
        }

        EnableEfxStatusUnits(anim);
    }
    else if (proc->timer == 165)
    {
        anim->state3 |= 2;
        SpellFx_Finish();
        Proc_Break(proc);
    }

    return;
}
